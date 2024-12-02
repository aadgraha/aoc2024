use std::fs;
use std::io::{self, BufRead};

fn main() -> io::Result<()> {
	let file_path = "input.txt";
	let file = fs::File::open(file_path)?;
    let reader = io::BufReader::new(file);
	let mut total_sum = 0;
	for line in reader.lines() {
        let line = line?;
        let numbers: Vec<i32> = line
            .split_whitespace()
            .filter_map(|s| s.parse::<i32>().ok())
            .collect();
			let sorted_numbers = numbers.clone().sort()
            let difference = (numbers[0] - numbers[1]).abs();
			println!("{}", difference);
			total_sum += difference;
        
    }
	println!("{}", total_sum);

    Ok(())
}