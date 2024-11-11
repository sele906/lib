<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdn.babylonjs.com/babylon.js"></script>
    <script src="https://cdn.babylonjs.com/loaders/babylonjs.loaders.min.js"></script>
    <script src="https://cdn.babylonjs.com/physics/babylon.physics.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/cannon-es@0.24.0/build/cannon-es.min.js"></script> <!-- Cannon.js -->
    
    <style>
        body, #renderCanvas { width: 100%; height: 100%; margin: 0; overflow: hidden; }
    </style>
</head>
<body>
    <canvas id="renderCanvas"></canvas>
<script type="text/javascript">
    const canvas = document.getElementById("renderCanvas");
    const engine = new BABYLON.Engine(canvas, true);
    
    let sceneToRender; 

    const createScene = function() {
        const scene = new BABYLON.Scene(engine);
        scene.clearColor = new BABYLON.Color3.Black;

        
        scene.gravity = new BABYLON.Vector3(0, -9.81, 0);
        scene.enablePhysics();
        scene.collisionsEnabled = true; 
        
        
        const alpha = Math.PI / 4;
        const beta = Math.PI / 3;
        const radius = 8;
        const target = new BABYLON.Vector3(0, 0, 0);
        
        const camera = new BABYLON.UniversalCamera("UniversalCamera", new BABYLON.Vector3(5, 8, 10), scene);
        camera.applyGravity = true;
        camera.ellipsoid = new BABYLON.Vector3(1, 4, 1); 
        camera.checkCollisions = true;
        camera.attachControl(canvas, true);
        camera.speed = 0.8;


        camera.keysUp.push(87);
        camera.keysDown.push(83);
        camera.keysRight.push(68);
        camera.keysLeft.push(65);
        
        
        const light = new BABYLON.HemisphericLight("light", new BABYLON.Vector3(1, 1, 0), scene);
        
        
        BABYLON.SceneLoader.ImportMesh("", "/model/", "library.glb", scene, function (meshes) {
            meshes.forEach(function(mesh) {
                mesh.position = new BABYLON.Vector3(0, 0, 0); 
                mesh.checkCollisions = true; 
            });
        });
        
        return scene;
    }
    
    
    sceneToRender = createScene();

    
    engine.runRenderLoop(function () {
        sceneToRender.render();
    });

    
    window.addEventListener("resize", function () {
        engine.resize();
    });
</script>
</body>
</html>
