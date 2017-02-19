import Solve_Quadratic

g :: Float
g = 9.8

get_airborn_time ::  Float -> Float -> Float -> Float 
get_airborn_time height v_i angle = solve_quadratic (-0.5*g) v_i_y height
    where
        v_i_y = v_i * sin (deg2rad angle)

get_landing_distance :: Float -> Float -> Float -> Float
get_landing_distance height v_i angle = t * v_x
    where 
        v_x = v_i * cos (deg2rad angle)
        t = get_airborn_time height v_i angle
        
deg2rad :: Float -> Float
deg2rad degree = degree / 180 * pi       
        

test = do
    putStrLn "Projectile Motion"
    putStrLn "Initial height (m):"
    height <- readLn :: IO Float
    putStrLn "Initial velocity (m/s):"
    v_i <- readLn :: IO Float
    putStrLn "Initial projection angle (degree):"
    angle <- readLn :: IO Float
    putStrLn ">> Calculating ..."
    let time = get_airborn_time height v_i angle
    let distance = get_landing_distance height v_i angle
    putStrLn $ "Airborn time: " ++ show time
    putStrLn $ "Landing distance: " ++ show distance

        