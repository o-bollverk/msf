# msf
## Machine Learning project with the purpose of predicting plane types in Microsoft Flight Simulator using web images of planes

Folder info:

all_data_bw - all online connected data from Jetphotos.com, transformed to black and white, organized in folders by plane class

all_data_color - all online connected data from Jetphotos.com , colored, organized in folders by plane class

msf_data - data recorded in Microsoft Flight Simulator, orgnized in folders by plane class

random_selection_augmented - random balanced selection of msf_data and all_data_color in png format, augmented with rembg https://pypi.org/project/rembg/

random_selection_augmented_jpg - same data in jpg format

web_data_links - Google search links for selected plane types. Were not used.




### CNN models were deployed on two type of subsets of the large collected datasets.

1) Balanced data selected from all_data_color and msf_data with the ratio, that 2/3 was from all_data_color, 1/6 from msf_data/image_data_rainy and 1/6 from msf_data/image_data_clear.
In each notebook, a random selection was made of
2) Unbalanced dataset that included all files in image_data_color and msf_data



#### Notebooks that used 2:
resnet34_entire_unbalanced_dataset.ipynb 
nomm_cnn.ipynb 
nomm_cnn_with_augmentation.ipynb (used augmented data)
...

#### Notebooks that used 1:
resnet_and_augmented_unbalanced_dataset.ipynb - resnet18, 34 and 50 were ran on the subset. Also, resnet18 was ran with 5 different types of data augmentation applied equally on all training and test images


tausta_eemaldus_gen.ipynb - for creating a bash script that calls rembg in the correct folders


