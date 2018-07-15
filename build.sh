echo "Installing Pangolin dependencies: GLEW, Python 2.7"

sudo apt-get install libglew-dev
sudo apt-get install libpython2.7-dev

echo "Installing Pangolin"

cd Thirdparty
git clone https://github.com/stevenlovegrove/Pangolin.git
cd Pangolin
mkdir build
cd build
cmake .. -DCMAKE_CXX_FLAGS="${CMAKE_CXX_FLAGS} -Wall"
cmake --build .
sudo make install
cd ..
cd ..
cd ..

echo "Configuring and building Thirdparty/DBoW2 ..."

cd Thirdparty/DBoW2
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_WARN_DEPRECATED=False
make -j

cd ../../g2o

echo "Configuring and building Thirdparty/g2o ..."

mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_WARN_DEPRECATED=False
make -j

cd ../../../

echo "Uncompress vocabulary ..."

cd Vocabulary
tar -xf ORBvoc.txt.tar.gz
cd ..

echo "Configuring and building ORB_SLAM2 ..."

mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_WARN_DEPRECATED=False
make -j

#echo "Installing and configuring ROS packages"
#cd ..
#PWD=eval pwd
#echo "export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:$PWD/Examples/ROS" >> ~/.bashrc
#source ~/.bashrc
#eval chmod +x $PWD/build_ros.sh
#source $PWD/build_ros.sh

