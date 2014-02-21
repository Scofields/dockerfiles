#!/bin/bash

template=""
repository=""
name_template=""
placeholder_index=0
declare -A placeholders
declare -A values
declare -A values_count

for argument in $*
    do
        case "$argument" in
            --name-template=*|-n=*)
                name_template=`echo $argument | awk -F'=' '{print $2}'`
                echo "using name-template: $name_template"
                ;;
            --template=*|-t=*)
                template=`echo $argument | awk -F'=' '{print $2}'`
                echo "using template: $template"
                ;;
            --repository=*|-r=*)
                repository=`echo $argument | awk -F'=' '{print $2}'`
                echo "for repository: $repository"
                ;;
            *)
                placeholders[$placeholder_index]=`echo $argument | awk -F'=' '{print $1}'`
                possibilities=`echo $argument | awk -F'=' '{print $2}' | awk 'BEGIN{FS=","}{for (i=1; i<=NF; i++) print $i}'`
                values_index=0
                while read possibility
                    do
                        values[$placeholder_index,$values_index]=$possibility
                        values_index=$[values_index+1]
                    done <<< "$possibilities"
                values_count[$placeholder_index]=$values_index
                placeholder_index=$[placeholder_index+1]
                ;;
        esac
    done

declare -A files
files[0]=$name_template

printFiles() {
    for i in "${!files[@]}"
        do
            echo "files $i: ${files[$i]}"
        done
}

for i in "${!placeholders[@]}"
    do
        placeholder=${placeholders[$i]}
        value_count=${values_count[$i]}
        original_files_count=${#files[@]}
        
        for (( f=0 ; f < $original_files_count ; f++ )) {
            
            originalTemplate=${files[$f]}
            
            for (( c=0 ; c < $value_count ; c++ )) {
                value=${values[$i,$c]}
                files[$[c*original_files_count+f]]=`echo $originalTemplate | sed "s/[$]$placeholder/$value/g"`
            }
            
        }
        
    done

for i in "${!files[@]}"
    do
        cp "$template" "$repository/${files[$i]}"
    done
