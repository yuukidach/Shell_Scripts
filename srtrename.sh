#! /bin/bash

echo "Before the opration stars, please make sure you have been in the right folder!"
while true; do
    read -p "Do you want to continue? y/n" yn
    case ${yn} in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
#echo "Please input the folder..."
#read my_video_folder
#cd ${my_video_folder}

echo "What is the videos' extension name?"
read video_extension_name

echo "How many episodes does it have?"
read total_video_episode_num

echo "These files were renamed successfully:"
for target_episode in `seq -w 1 ${total_video_episode_num}`            # -w使输出的数字同宽
do
    target_video=(*[^0-9]${target_episode}[^0-9]*${video_extension_name})
    target_video=${target_video%${video_extension_name}}
    for target_srt in `find -regex ".*[^0-9]?${target_episode}[^0-9]?.*srt"`
    do
        echo ${target_srt}
        rename "s/.*[^0-9]?${target_episode}[^0-9]?.*?\./${target_video}/" ${target_srt}
    done
done

