SELECT 
    cpu.cpu_id AS cpu_id,
    CONCAT(cpu_brand.name, ' ', cpu.name) AS `CPU Name`,
    cpu.frequency AS `Core Frequency`,
    integrated_gpu.name AS `GPU`,
    cpu.performance_rating AS `Performance Rating`
    
FROM
    cpu
    
LEFT JOIN cpu_brand ON cpu.cpu_brand_id = cpu_brand.cpu_brand_id
LEFT JOIN integrated_gpu ON cpu.igpu_id = integrated_gpu.igpu_id