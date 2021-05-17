#!/bin/bash

read -p 'Enter Project Name: ' prjname
#prj_folder=mdp-${prjname,,}-upstream
prj_folder=mdp-${prjname}-upstream
echo "New project name will be ${prj_folder,,}"

read -p "Push to remote [git@github.com:artexmg/${prj_folder}.git] (Y/N)? " git_push
git_push=${git_push,,}

mkdir ../${prj_folder}

cp -r ./. ../${prj_folder}
project_path=../${prj_folder}

prjname=${prjname//\-/_}
prj_upper=${prjname^^}
prj_lower=${prjname,,}

echo "Project Name is mdp-${prj_lower}-upstream"

# # Remove existing git references
rm -rf ${project_path}/.git
rm -f ${project_path}/README.md
mv ${project_path}/readme.template.md ${project_path}/README.md

find ${project_path}/ -name '*template_lower*' | while read FILE ; do
    newfile="$(echo ${FILE} |sed -e  "s/template_lower/${prj_lower}/")" ;
    echo "mv ${FILE} ${newfile}"
    mv "${FILE}" "${newfile}" ;
done

grep -rl prj_name --exclude=update*.sh  ${project_path}/ | xargs sed -i "s/prj_name/${prj_folder}/g"
grep -rl template_lower --exclude=update*.sh  ${project_path}/ | xargs sed -i "s/template_lower/${prj_lower}/g"
grep -rl TEMPLATE-UPPER --exclude=update*.sh  ${project_path}/ | xargs sed -i "s/TEMPLATE-UPPER/${prj_upper}/g"


cd ${project_path}
pwd
rm update-from-template.sh

git init
git add --all
git reset -- update-from-template.sh
git commit -m "Initial Commit"

if [ "$git_push" = "y" ]; then
    git remote add origin git@github.com:artexmg/${prj_folder}.git
    git push -u origin master
    git tag -a 0.0.0 -m "Initial Tag [noci]"
    git push -u origin 0.0.0

    git checkout master
    git checkout -b develop
    git branch -M develop
    git push -u origin develop
else
    echo "Not pushing changes to remote."
fi

