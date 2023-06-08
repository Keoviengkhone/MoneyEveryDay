const filenames = ["test01.jpg","test01_1.png","test01_2.jpg","test02.jpg","test02_backup.jpg","test029_new.png"]

const pictureName = filenames.map((filename) => {
    const path = filename.split(".");
    return path[0]
});

console.log(pictureName)