namespace :populate_data do
  task run: :environment do
    Category.destroy_all
    InspectionItem.destroy_all
    InspectionCheck.destroy_all

    engine_category = Category.create!(name: "Engine")
    ignition_category = Category.create!(name: "Ignition")
    fuel_category = Category.create!(name: "Fuel")
    brakes_category = Category.create!(name: "Brakes")
    chassis_category = Category.create!(name: "Chassis and Body")

    ActiveRecord::Base.transaction do
      # ENGINE ACCESSORY DRIVE BELT
      drive_belt = InspectionItem.create!(name: "Engine accessory drive belt", category: engine_category)
      drive_belt.inspection_checks.create!(
        mileage_in_km: 45_000,
        todo: :inspection,
        notes: "Tension check, *Adjustment, *Replacement",
        interval_style: :recurring,
        condition: :normal,
      )
      drive_belt.inspection_checks.create!(
        mileage_in_km: 90_000,
        todo: :replacement,
        interval_style: :recurring,
        condition: :normal,
      )
      drive_belt.inspection_checks.create!(
        mileage_in_km: 15_000,
        todo: :inspection,
        notes: "Tension check, *Adjustment, *Replacement",
        interval_style: :recurring,
        condition: :severe,
      )
      drive_belt.inspection_checks.create!(
        mileage_in_km: 45_000,
        todo: :replacement,
        interval_style: :recurring,
        condition: :severe,
      )

      # ENGINE VALVE CLEARANCE
      valve_clearance = InspectionItem.create!(name: "Engine valve clearance", category: engine_category)
      valve_clearance.inspection_checks.create!(
        mileage_in_km: 30_000,
        todo: :inspection,
        interval_style: :recurring,
        condition: :normal_and_severe,
      )

      # ENGINE OIL AND OIL FILTER (EVERY 10k KMS)
      engine_oil = InspectionItem.create!(name: "Engine Oil and Oil Filter", category: engine_category)
      engine_oil.inspection_checks.create!(
        mileage_in_km: 1_000,
        todo: :replacement,
        interval_style: :fixed,
        notes: "Break-in period",
        condition: :normal_and_severe,
      )
      engine_oil.inspection_checks.create!(
        mileage_in_km: 10_000,
        todo: :replacement,
        interval_style: :recurring,
        condition: :normal,
      )
      engine_oil.inspection_checks.create!(
        mileage_in_km: 5_000,
        todo: :replacement,
        interval_style: :recurring,
        condition: :severe,
      )

      # ENGINE: RADIATOR FAN
      radiator_fan = InspectionItem.create!(name: "Engine Auxiliary Fan Motor", category: engine_category)
      radiator_fan.inspection_checks.create!(
        mileage_in_km: 30_000,
        todo: :inspection,
        interval_style: :recurring,
        condition: :normal_and_severe,
        notes: "check carbon brush"
      )

      # ENGINE COOLANT: SUPER BLUE
      super_blue_coolant = InspectionItem.create!(name: "Engine Coolant (SUPER BLUE)", category: engine_category)
      super_blue_coolant.inspection_checks.create!(
        mileage_in_km: 150_000,
        todo: :replacement,
        interval_style: :fixed,
        condition: :normal_and_severe,
      )
      super_blue_coolant.inspection_checks.create!(
        mileage_in_km: 75_000,
        todo: :replacement,
        interval_style: :recurring,
        condition: :normal_and_severe,
      )

      # ENGINE COOLANT: STANDARD GREEN
      standard_green_coolant = InspectionItem.create!(name: "Engine Coolant (STANDARD GREEN)", category: engine_category)
      standard_green_coolant.inspection_checks.create!(
        mileage_in_km: 45_000,
        todo: :replacement,
        interval_style: :recurring,
        condition: :normal_and_severe,
      )

      # ENGINE EXHAUST SYSTEM (EXCEPT CATALYST)
      exhaust_system = InspectionItem.create!(name: "Engine Exhaust System (except catalyst)", category: engine_category)
      exhaust_system.inspection_checks.create!(
        mileage_in_km: 30_000,
        todo: :inspection,
        interval_style: :recurring,
        condition: :normal_and_severe,
      )

      # IGNITION SPARK PLUGS
      iridium = InspectionItem.create!(name: "Spark Plugs (if using Iridium)", category: ignition_category)
      iridium.inspection_checks.create!(
        mileage_in_km: 105_000,
        todo: :replacement,
        interval_style: :recurring,
        condition: :normal,
      )
      iridium.inspection_checks.create!(
        mileage_in_km: 30_000,
        todo: :replacement,
        interval_style: :recurring,
        condition: :severe,
      )

      nickel = InspectionItem.create!(name: "Spark Plugs (if using Nickel)", category: ignition_category)
      nickel.inspection_checks.create!(
        mileage_in_km: 45_000,
        todo: :replacement,
        interval_style: :recurring,
        condition: :normal,
      )
      nickel.inspection_checks.create!(
        mileage_in_km: 10_000,
        todo: :replacement,
        interval_style: :recurring,
        condition: :severe,
      )

      # FUEL
      air_cleaner = InspectionItem.create!(name: "Air cleaner filter element", category: fuel_category)
      air_cleaner.inspection_checks.create!(
        mileage_in_km: 15_000,
        todo: :inspection,
        interval_style: :recurring,
        condition: :normal,
      )
      air_cleaner.inspection_checks.create!(
        mileage_in_km: 45_000,
        todo: :replacement,
        interval_style: :recurring,
        condition: :normal,
      )
      air_cleaner.inspection_checks.create!(
        mileage_in_km: 2_500,
        todo: :inspection,
        interval_style: :recurring,
        condition: :severe,
      )
      air_cleaner.inspection_checks.create!(
        mileage_in_km: 30_000,
        todo: :replacement,
        interval_style: :recurring,
        condition: :severe,
      )

      fuel_lines = InspectionItem.create!(name: "Fuel Lines", category: fuel_category)
      fuel_lines.inspection_checks.create!(
        mileage_in_km: 30_000,
        todo: :inspection,
        interval_style: :recurring,
        condition: :normal_and_severe,
      )

      fuel_filter = InspectionItem.create!(name: "Fuel Filter", category: fuel_category)
      fuel_filter.inspection_checks.create!(
        mileage_in_km: 105_000,
        todo: :replacement,
        interval_style: :recurring,
        condition: :normal_and_severe,
      )

      fuel_tank = InspectionItem.create!(name: "Fuel tank", category: fuel_category)
      fuel_tank.inspection_checks.create!(
        mileage_in_km: 45_000,
        todo: :inspection,
        interval_style: :recurring,
        condition: :normal_and_severe,
      )

      pcv_valve = InspectionItem.create!(name: "PCV valve", category: fuel_category)
      pcv_valve.inspection_checks.create!(
        mileage_in_km: 80_000,
        todo: :inspection,
        interval_style: :recurring,
        condition: :normal,
      )

      evaporative = InspectionItem.create!(name: "Fuel evaporative emission control system", category: fuel_category)
      evaporative.inspection_checks.create!(
        mileage_in_km: 90_000,
        todo: :inspection,
        interval_style: :recurring,
        condition: :normal_and_severe,
      )

      brake_discs = InspectionItem.create!(name: "Brake discs and pads (FRONT)", category: brakes_category)
      brake_discs.inspection_checks.create!(
        mileage_in_km: 15_000,
        todo: :inspection,
        interval_style: :recurring,
        condition: :normal_and_severe,
      )

      brake_drums = InspectionItem.create!(name: "Brake drums and shoes (REAR)", category: brakes_category)
      brake_drums.inspection_checks.create!(
        mileage_in_km: 30_000,
        todo: :inspection,
        interval_style: :recurring,
        condition: :normal_and_severe,
      )

      brake_hoses = InspectionItem.create!(name: "Brake hoses and pipes", category: brakes_category)
      brake_hoses.inspection_checks.create!(
        mileage_in_km: 30_000,
        todo: :inspection,
        interval_style: :recurring,
        condition: :normal_and_severe,
      )

      brake_pedal = InspectionItem.create!(name: "Brake pedal", category: brakes_category)
      brake_pedal.inspection_checks.create!(
        mileage_in_km: 15_000,
        todo: :inspection,
        interval_style: :recurring,
        condition: :normal_and_severe,
      )

      brake_fluid = InspectionItem.create!(name: "Brake fluid", category: brakes_category)
      brake_fluid.inspection_checks.create!(
        mileage_in_km: 15_000,
        todo: :inspection,
        interval_style: :recurring,
        notes: "Clutch fluid is supplied from brake fluid reservoir",
        condition: :normal_and_severe,
      )
      brake_fluid.inspection_checks.create!(
        mileage_in_km: 30_000,
        todo: :replacement,
        interval_style: :recurring,
        condition: :normal_and_severe,
      )

      brake_lever = InspectionItem.create!(name: "Brake lever and cable", category: brakes_category)
      brake_lever.inspection_checks.create!(
        mileage_in_km: 15_000,
        todo: :inspection,
        notes: "Adjustment if necessary",
        condition: :normal_and_severe,
      )

      clutch_pedal = InspectionItem.create!(name: "Clutch pedal", category: brakes_category)
      clutch_pedal.inspection_checks.create!(
        mileage_in_km: 15_000,
        todo: :inspection,
        interval_style: :recurring,
        condition: :normal_and_severe,
      )

      clutch_fluid = InspectionItem.create!(name: "Clutch fluid", category: brakes_category)
      clutch_fluid.inspection_checks.create!(
        mileage_in_km: 15_000,
        todo: :inspection,
        interval_style: :recurring,
        notes: "Clutch fluid is supplied from clutch fluid reservoir",
        condition: :normal_and_severe,
      )
      clutch_fluid.inspection_checks.create!(
        mileage_in_km: 30_000,
        todo: :replacement,
        interval_style: :recurring,
        condition: :normal_and_severe,
      )

      tires_and_wheels = InspectionItem.create!(name: "Tires/Wheels", category: chassis_category)
      tires_and_wheels.inspection_checks.create!(
        mileage_in_km: 15_000,
        todo: :inspection,
        interval_style: :recurring,
        condition: :normal_and_severe,
      )

      wheel_bearings = InspectionItem.create!(name: "Wheel bearings", category: chassis_category)
      wheel_bearings.inspection_checks.create!(
        mileage_in_km: 30_000,
        todo: :inspection,
        interval_style: :recurring,
        condition: :normal,
      )
      wheel_bearings.inspection_checks.create!(
        mileage_in_km: 15_000,
        todo: :inspection,
        interval_style: :recurring,
        condition: :severe,
      )

      prop_shafts = InspectionItem.create!(name: "Propeller shafts", category: chassis_category)
      prop_shafts.inspection_checks.create!(
        mileage_in_km: 45_000,
        todo: :inspection,
        interval_style: :recurring,
        condition: :normal,
      )
      prop_shafts.inspection_checks.create!(
        mileage_in_km: 15_000,
        todo: :inspection,
        interval_style: :recurring,
        condition: :severe,
      )

      suspension = InspectionItem.create!(name: "Suspension System", category: chassis_category)
      suspension.inspection_checks.create!(
        mileage_in_km: 30_000,
        todo: :inspection,
        interval_style: :recurring,
        condition: :normal_and_severe,
      )

      steering = InspectionItem.create!(name: "Steering System", category: chassis_category)
      steering.inspection_checks.create!(
        mileage_in_km: 30_000,
        todo: :inspection,
        interval_style: :recurring,
        condition: :normal_and_severe,
      )

      manual_trans_oil_genuine = InspectionItem.create!(name: "Manual transmission oil (GENUINE OIL 75W)", category: chassis_category)
      manual_trans_oil_genuine.inspection_checks.create!(
        mileage_in_km: 30_000,
        todo: :inspection,
        interval_style: :recurring,
        condition: :normal_and_severe,
      )
      manual_trans_oil_genuine.inspection_checks.create!(
        mileage_in_km: 60_000,
        todo: :replacement,
        interval_style: :recurring,
        condition: :severe,
      )

      manual_trans_oil_non_genuine = InspectionItem.create!(name: "Manual transmission oil (GENERIC)", category: chassis_category)
      manual_trans_oil_non_genuine.inspection_checks.create!(
        mileage_in_km: 15_000,
        todo: :inspection,
        interval_style: :fixed,
        condition: :normal,
      )
      manual_trans_oil_non_genuine.inspection_checks.create!(
        mileage_in_km: 45_000,
        todo: :replacement,
        interval_style: :recurring,
        condition: :normal,
      )
      manual_trans_oil_non_genuine.inspection_checks.create!(
        mileage_in_km: 30_000,
        todo: :replacement,
        interval_style: :recurring,
        condition: :severe,
      )

      auto_trans_fluid_level = InspectionItem.create!(name: "Automatic transmission (FLUID LEVEL)", category: chassis_category)
      auto_trans_fluid_level.inspection_checks.create!(
        mileage_in_km: 30_000,
        todo: :inspection,
        interval_style: :recurring,
        condition: :normal_and_severe,
      )

      auto_trans_fluid_change = InspectionItem.create!(name: "Automatic transmission (FLUID CHANGE)", category: chassis_category)
      auto_trans_fluid_change.inspection_checks.create!(
        mileage_in_km: 165_000,
        todo: :replacement,
        interval_style: :recurring,
        condition: :normal,
      )
      auto_trans_fluid_change.inspection_checks.create!(
        mileage_in_km: 30_000,
        todo: :replacement,
        interval_style: :recurring,
        condition: :severe,
      )

      auto_trans_fluid_hose = InspectionItem.create!(name: "Automatic transmission (FLUID HOSE)", category: chassis_category)
      auto_trans_fluid_hose.inspection_checks.create!(
        mileage_in_km: 60_000,
        todo: :inspection,
        interval_style: :recurring,
        condition: :normal_and_severe,
      )

      transfer_oil_genuine = InspectionItem.create!(name: "Transfer Oil (GENUINE OIL 75W)", category: chassis_category)
      transfer_oil_genuine.inspection_checks.create!(
        mileage_in_km: 30_000,
        todo: :inspection,
        interval_style: :recurring,
        condition: :normal_and_severe,
      )
      transfer_oil_genuine.inspection_checks.create!(
        mileage_in_km: 60_000,
        todo: :replacement,
        interval_style: :recurring,
        condition: :severe,
      )

      transfer_oil_non_genuine = InspectionItem.create!(name: "Transfer Oil (GENERIC)", category: chassis_category)
      transfer_oil_non_genuine.inspection_checks.create!(
        mileage_in_km: 15_000,
        todo: :inspection,
        interval_style: :fixed,
        condition: :normal,
      )
      transfer_oil_non_genuine.inspection_checks.create!(
        mileage_in_km: 45_000,
        todo: :replacement,
        interval_style: :recurring,
        condition: :normal,
      )
      transfer_oil_non_genuine.inspection_checks.create!(
        mileage_in_km: 30_000,
        todo: :replacement,
        interval_style: :recurring,
        condition: :severe,
      )

      diff_oil = InspectionItem.create!(name: "Differential oil (FRONT AND REAR)", category: chassis_category)
      diff_oil.inspection_checks.create!(
        mileage_in_km: 15_000,
        todo: :inspection,
        interval_style: :recurring,
        condition: :normal_and_severe,
      )

      latches = InspectionItem.create!(name: "All hatches, hinges, and locks", category: chassis_category)
      latches.inspection_checks.create!(
        mileage_in_km: 30_000,
        todo: :inspection,
        interval_style: :recurring,
        condition: :normal_and_severe,
      )

      aircon_filter = InspectionItem.create!(name: "Air conditioner filter element", category: chassis_category)
      aircon_filter.inspection_checks.create!(
        mileage_in_km: 30_000,
        todo: :inspection,
        interval_style: :recurring,
        condition: :normal,
      )
      aircon_filter.inspection_checks.create!(
        mileage_in_km: 45_000,
        todo: :replacement,
        interval_style: :recurring,
        condition: :normal,
      )
      aircon_filter.inspection_checks.create!(
        mileage_in_km: 15_000,
        todo: :inspection,
        interval_style: :recurring,
        condition: :severe,
      )
    end
  end
end
