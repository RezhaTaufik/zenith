-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Host: 34.101.57.203
-- Generation Time: Jun 27, 2023 at 10:05 AM
-- Server version: 5.7.40-google-log
-- PHP Version: 7.0.33-0ubuntu0.16.04.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `CSV_DB`
--

-- --------------------------------------------------------

--
-- Table structure for table `detailed_Type`
--

CREATE TABLE `detailed_Type` (
  `Type_ID` varchar(255) NOT NULL,
  `Type_Desc` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `detailed_Type`
--

INSERT INTO `detailed_Type` (`Type_ID`, `Type_Desc`) VALUES
('10', 'Copper AC'),
('11', 'R-22 AC'),
('12', 'R-32 AC'),
('13', 'R-34 AC'),
('14', 'R-38 AC'),
('15', 'R410a AC'),
('16', 'Less Than or Equal to 1 Cubic Ft Oven'),
('17', 'More Than 1 Cubic Ft Oven'),
('18', 'Plastic-Based Oven'),
('19', 'Stainless Steel + Glass + Plastic + Steel'),
('20', 'Glass'),
('21', 'Stainless Steel + Glass'),
('22', 'Stainless Steel'),
('23', 'Metal'),
('24', 'Metal + Glass + Plastic'),
('25', 'Metal + Stainless Steel'),
('26', 'Stainless Steel + Plastics'),
('27', 'Steel'),
('28', 'Glass + Plastic + Metal'),
('29', 'Aluminium'),
('30', 'G9'),
('31', 'E12 (Candelabra)'),
('32', 'E17'),
('33', 'GU10'),
('34', 'GX5.3'),
('35', 'GU5.3'),
('36', 'E26 (Medium)'),
('37', 'GU24'),
('38', 'E26d'),
('39', '13- 20 inch'),
('40', '21-28 inch'),
('41', '31- 39.98 inch'),
('42', '40-49.54 inch'),
('43', '50-59.5 inch'),
('44', '60-69.51 inch'),
('45', '70-78.5 inch'),
('46', '80.49-85.6 inch'),
('6', 'Low Power & Moderate Laptop'),
('7', 'High-End Laptops'),
('8', 'Alloy AC'),
('9', 'Aluminium AC');

-- --------------------------------------------------------

--
-- Table structure for table `Energy`
--

CREATE TABLE `Energy` (
  `Type_ID` varchar(255) NOT NULL,
  `Energy_Consumed` double DEFAULT NULL,
  `Average_EC` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Energy`
--

INSERT INTO `Energy` (`Type_ID`, `Energy_Consumed`, `Average_EC`) VALUES
('1', 8.93, 8.93),
('10', 2.343, 1.77),
('11', 2.23539, 1.77),
('12', 2.56468, 1.77),
('13', 1.43, 1.77),
('14', 0.955, 1.77),
('15', 1.66167, 1.77),
('16', 0.953, 1.03),
('17', 1.06, 1.03),
('18', 0.7, 1.03),
('19', 0.9, 1.03),
('2', 4.94, 4.94),
('20', 0.92, 1.03),
('21', 1, 1.03),
('22', 1.03, 1.03),
('23', 1.05, 1.03),
('24', 1.05, 1.03),
('25', 1.05, 1.03),
('26', 1.05, 1.03),
('27', 1.11, 1.03),
('28', 1.2, 1.03),
('29', 1.33, 1.03),
('3', 1.319, 1.32),
('30', 0.004, 0.01),
('31', 0.004, 0.01),
('32', 0.005, 0.01),
('33', 0.006, 0.01),
('34', 0.006, 0.01),
('35', 0.007, 0.01),
('36', 0.011, 0.01),
('37', 0.012, 0.01),
('38', 0.016, 0.01),
('39', 0.016, 0.06),
('4', 13.926, 13.93),
('40', 0.02, 0.06),
('41', 0.028, 0.06),
('42', 0.047, 0.06),
('43', 0.063, 0.06),
('44', 0.081, 0.06),
('45', 0.104, 0.06),
('46', 0.119, 0.06),
('47', 0.371, 0.37),
('5', 0.989, 0.99),
('6', 10.766, 16.38),
('7', 21.996, 1.77),
('8', 1.117, 1.77),
('9', 1.87, 1.77);

-- --------------------------------------------------------

--
-- Table structure for table `Lumens`
--

CREATE TABLE `Lumens` (
  `Type_ID` varchar(255) NOT NULL,
  `LW` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Lumens`
--

INSERT INTO `Lumens` (`Type_ID`, `LW`) VALUES
('30', 100),
('31', 86),
('32', 81),
('33', 82),
('34', 77),
('35', 76),
('36', 90),
('37', 93),
('38', 105);

-- --------------------------------------------------------

--
-- Table structure for table `Main`
--

CREATE TABLE `Main` (
  `Object_Name` varchar(255) NOT NULL,
  `Representative_Image` varchar(512) DEFAULT NULL,
  `Recommended_ID` varchar(255) DEFAULT NULL,
  `Dampak_Produksi` text,
  `Dampak_Konsumsi` text,
  `Dampak_Disposal` text,
  `avg_Energy` double DEFAULT NULL,
  `short_DP` varchar(255) DEFAULT NULL,
  `short_DK` varchar(255) DEFAULT NULL,
  `short_DD` varchar(255) DEFAULT NULL,
  `lokasi` varchar(255) DEFAULT NULL,
  `Sumber` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Main`
--

INSERT INTO `Main` (`Object_Name`, `Representative_Image`, `Recommended_ID`, `Dampak_Produksi`, `Dampak_Konsumsi`, `Dampak_Disposal`, `avg_Energy`, `short_DP`, `short_DK`, `short_DD`, `lokasi`, `Sumber`) VALUES
('Air Conditioner', 'https://drive.google.com/uc?export=download&id=19Xy8hCTGqUtFwQTMC9KRfBaZ3Ic7aI2u', '14', 'Proses produksi AC melibatkan penggunaan bahan-bahan yang dapat menyebabkan emisi gas rumah kaca selama manufaktur, transportasi, dan pemusnahan. Demikian juga, penggunaan AC yang luas dapat meningkatkan permintaan listrik, yang dalam beberapa kasus bergantung pada sumber energi yang tidak ramah lingkungan.', 'AC membutuhkan daya listrik yang signifikan untuk beroperasi. Produksi dan penggunaan AC secara luas dapat menyebabkan peningkatan konsumsi energi listrik, yang berdampak pada sumber daya energi dan emisi gas rumah kaca.', 'AC mengandung komponen yang berpotensi berbahaya, seperti refrigeran, oli, dan logam berat seperti merkuri. Jika AC dibuang secara tidak tepat, bahan-bahan ini dapat mencemari tanah dan air, merusak ekosistem, serta mengancam kesehatan manusia.', 1.77, 'Produksi mengeluarkan gas rumah kaca', 'Daya yang besar', 'Dapat mencemari tanah dan air', 'Kamar Tidur', 'https://www.kaggle.com/datasets/ecoco2/household-appliances-power-consumption'),
('Hair Dryer', 'https://drive.google.com/uc?export=download&id=1t00jarqhWH3kcB7KagIvDYniAyTmc51P', NULL, 'Hair dryer umumnya menggunakan plastik, logam, dan komponen elektronik lainnya. Proses produksi ini melibatkan penggunaan bahan kimia dan energi yang dapat menyebabkan dampak lingkungan selama produksi dan pemrosesan bahan mentah.', 'Hair dryer menggunakan daya listrik yang cukup besar saat digunakan. Produksi dan penggunaan hair dryer secara luas dapat menyebabkan peningkatan konsumsi energi listrik, yang berdampak pada sumber daya energi dan emisi gas rumah kaca.', ' Hair dryer termasuk dalam kategori limbah elektronik atau e-waste. Jika hair dryer dibuang secara tidak tepat, dapat meningkatkan jumlah limbah elektronik yang sulit diuraikan dan bisa mencemari lingkungan jika tidak dikelola dengan benar.', 0.99, 'Bahan Kimia yang berbahaya untuk lingkungan', 'Daya yang besar', 'Limbah elektronik SULIT untuk diuraikan', 'Kamar Tidur', 'http://motor.ece.iit.edu/eiot/LIFTED/LIFTED_DATA/Individual_Appliance.zip '),
('Iron', 'https://drive.google.com/uc?export=download&id=1rg_KU8GF4zzNiX2wdZ0jpEy9Pk07RwUB', NULL, 'Sektor tekstil adalah salah satu penghasil gas rumah kaca terbesar dan bertanggung jawab atas sekitar 10% emisi global termasuk produksi setrika.', 'Penggunaan setrika yang tidak tepat akan menimbulkan pemakaian energi listrik yang besar hingga berdampak terhadap lingkungan seperti efek gas rumah kaca, menyebabkan emisi CO2 yang cukup besar untuk siklus yang berualang dalam penggunaan setrika. Setiap orang menghasilkan 190 kilogram CO2 setara dalam emisi gas rumah kaca setiap tahunnya saat menyetrika pakaian. Jika tujuh miliar orang berhenti menyetrika pakaian, kita dapat mengurangi emisi CO2 sebesar 13 Juta Ton Metrik setiap tahunnya, yang memberikan kontribusi besar dalam mengurangi efek perubahan iklim.', 'Pencemaran lingkungan akibat pembuangan limbah setrika yang tidak terkelola, penggunaan sumber daya untuk pemrosesan limbah elektronik, dan risiko paparan bahan berbahaya.', 0.37, 'Menyebabkan pelepasan emisi gas rumah kaca.', 'Perubahan iklim akibat pelepasan emisi gas rumah kaca.', 'Pencemaran lingkungan dan risiko paparan zat berbahaya.', 'Kamar Ganti', 'https://berapawatt.com/setrika-berapa-watt/'),
('Lamp', 'https://drive.google.com/uc?export=download&id=1AZDGVenUzMGMcyv7f0c_DssSqholtm6R', '32', '1. Proses pembuatan lampu menggunakan energi listrik yang berkontribusi pada potensi pemanasan global\n\n2. Produksi lampu juga berpotensi adanya toksisitas pada manusia (Human Toxicity Potential) akibat komponen & zat kimia yang ada pada lampu\n\n3. Potensi lain yang dapat disebabkan oleh produksi lampu, antara lain: potensi pengasaman lingkungan, potensi eutrofikasi, penipisan sumber daya abiotik non-terbarukan, dan potensi penciptaan ozon fotokimia di atmosfer', '1. Lampu memerlukan energi listrik yang pada penggunaanya dapat berkontribusi terhadap potensi pemanasan global.\n\n2. Penggunaan lampu yang berlebihan terutama pada malam hari dapat merusak siklus biologis manusia dan hewan, seperti menyebabkan penurunan produksi melatonin yang berimbas pada kurang tidur, kelelahan, sakit kepala, kecemasan, dan masalah kesehatan lainnya.', '1. Limbah lampu merupakan jenis limbah padat yang sulit terurai dan merusak lingkungan\n\n2. Pembuangan limbah lampu seringkali menyebabkan pengasaman dan degradasi tanah\n\n3. Komponen tembaga, besi, nickel, timbal, dan perak yang terdapat pada lampu berkontribusi terhadap potensi bahaya untuk kesehatan manusia dan ekologi\n\n4. Lampu berjenis CFL mengandung merkuri yang mungkin saja dapat ter-rilis dan menyebabkan polusi udara & air', 0.01, 'Zat kimia berpotensi toksik', 'Merusak siklus biologi makhluk hidup', 'Limbah lampu dapat menyebabkan toksisitas', 'Langit Rumah', 'ENERGY STAR Certified Light Bulbs | EPA ENERGY STAR'),
('Laptop', 'https://drive.google.com/uc?export=download&id=1Pygg9Btz-9UoDzYVL_E1onHG3v7hn5EM', '6', 'Proses pengambilan bahan baku laptop di alam, banyak menggunakan air, pasir, dan lumpur. Selain itu, proses produksi dan perakitan laptop, terutama komponen motherboard, disk drive, dan layar mengasilkan pelepasan gas emisi rumah kaca yang cukup besar.', 'Pengoperasian laptop menggunakan energi listrik yang dapat berkontribusi pada pelepasan gas energi rumah kaca.\r\nKomputasi cloud pada laptop juga memerlukan energi yang cukup besar untuk daya dan pendinginnya.', 'Bahan metal seperti merkuri, timbal, kromium yang berakhir di tempat pembuangan dapat mencemari tanah dan air di sekilar tempat pembuangan.\r\n\r\nLaptop juga dilengkapi dengan polivinil klorida pada lapisan kabel dan timbal dalam baterainya. Jika dibakar, bahan-bahan ini dapat mengeluarkan senyawa berbahaya seperti dioksin.', 16.38, 'Penggunaan air dan emisi gas rumah kaca yang besar.', 'Daya yang besar di local dan cloud', 'Dapat Mencemari tanah dan air', 'Ruang Kerja', 'https://www.kaggle.com/datasets/ecoco2/household-appliances-power-consumption'),
('Oven', 'https://drive.google.com/uc?export=download&id=1PhG4UGx_TgsbDckgo4i6VM1I_cu7VRHt', '18', 'Penambangan dan pembuatan material oven yang terdiri dari besi, kuningan, aluminium, tembaga, plastik (ABS, PVC, PP, dan PBT), dan lainnya memerlukan energi listrik dan energi termal yang besar. Energi ini menghasilkan emisi karbon dioksida yang berkontribusi terhadap efek rumah kaca dan perubahan iklim.', 'Oven mengonsumsi daya listrik yang besar dan berdampak pada pelepasan emisi gas rumah kaca.', 'Limbah oven dapat berbahaya untuk lingkungan, dimana material yang digunakan sulit terdekomposisi di dalam tanah, sehingga dapat menyebabkan pencemaran air (sungai & danau), tanah, dan bahkan udara.', 1.03, 'Emisi karbon yang besar.', 'Penggunaan Listrik yang besar.', 'Mencemar air, tanah, dan udara.', 'Dapur', 'Amazon.com : OVEN MICROWAVE'),
('Refrigerator', 'https://drive.google.com/uc?export=download&id=1Wk8zTo0p0w-Vgwst_f5cd0uJii5KAahi', NULL, 'Produksi kulkas (pembuatan & perakitan material) menyumbang 10% dari total emisi gas karbon dioksida global.', 'Kulkas menggunakan cukup banyak energi listrik saat beroperasi secara terus-menerus. Energi listrik ini dihasilkan dari bahan bakar fosil yang dapat melepaskan emisi gas karbon dioksida ke udara dan berkontribusi terhadap penipisan ozon.', 'Kulkas mengandung sekitar 0.05 - 0.25 KG refrigerant yang jika bocor ke lingkungan dapat menyebabkan emisi gas karbon dioksida.\r\n\r\nMinyak yang terkandung di dalam kulkas jika tersebuar ke tempat pembuangan, dapat mencemari air tanah, dapat merusak kulit, mata, dan saluran pernapasan.', 8.93, 'Emisi karbon yang besar', 'Konsumsi Listrik yang besar', 'Limbah dapat mencemar air, tanah, dan merusak organ tubuh', 'Dapur', 'https://zenodo.org/record/5063428'),
('Rice Cooker', 'https://drive.google.com/uc?export=download&id=11vZy4wLolRiiiY0J_hXtW0_SUFpFqZNh', NULL, '1. Produksi Panci Luar Rice-Cooker berkontribusi terhadap meningkatnya tingkat karsinogen, begitu juga dengan produksi kabel listriknya.\r\n\r\n2. Piring panas dari sebuah Rice-Cooker berkontribusi terhadap Mineral, Karsinogen, dan Inorganik Pernafasan.\r\n\r\n3. Listrik yang digunakan dalam pembentukan panci luar, piring panas dan kabel listrik menggunakan bahan bakar fosil yang banyak.', '1. Dampak penggunaan rice cooker terbesar adalah terhadap kesehatan manusia. Ini dikarenakan penggunaan energi listrik yang besar, dan mengingat bahwa listrik yang digunakan saat ini masih sangat bergantung pada energi fosil, maka dampak penggunaannya sangat besar.\r\n\r\n2. Dampak penggunaan listrik oleh rice cooker, jika dipecah, adalah peningkatan inorganik pernapasan, penggunaan bahan bakar fosil, pengaruh terhadap perubahan iklim, dan pengasaman lingkungan.', 'Dampak terbesar dari disposal rice-cooker adalah disebabkan sebagian dari material yang digunakan tidak bisa didaur ulang. Ini menyebabkan rice-cooker memiliki dampak terhadap ekotoksitisitas, atau kemampuan sebuah senyawa untuk membawa dampak bahaya terhadap lingkungan dan makhluk hidup.', 13.93, 'Inorganik pernafasan dan Peningkatan Karsinogen', 'Peningkatan inorganik pernapasan dan pengasaman lingkungan', 'Meningkatnya Ekotoksitisitas', 'Dapur', 'http://motor.ece.iit.edu/eiot/LIFTED/LIFTED_DATA/Individual_Appliance.zip'),
('Television', 'https://drive.google.com/uc?export=download&id=1jGgi2y12cbu5nktX_RqnO8L_5US_0WvW', NULL, 'Degradasi habitat, penggunaan sumber daya alam yang besar, polusi udara dan air, serta emisi gas rumah kaca.', 'Televisi yang tidak efisien energi dapat menghasilkan emisi gas rumah kaca yang lebih tinggi dan meningkatkan konsumsi listrik. ', 'Penumpukan limbah elektronik yang berbahaya dan sulit terurai di tempat pembuangan akhir. Limbah elektronik mengandung bahan kimia beracun seperti merkuri, kadmium, dan timbal yang dapat mencemari tanah dan air.', 0.06, 'Mencemar udara dan Air', 'Konsumsi daya yang tinggi', 'Limbah yang berbahaya dan sulit diurai', 'Ruang Keluarga', 'https://data.world/us-epa-gov/1e6de0aa-3b72-4f06-a87c-a45baa911d1b'),
('Vacuum Cleaner', 'https://drive.google.com/uc?export=download&id=1gStrenGzPr-0X7mmIWgpuiNeKYa_SLKu', NULL, '1. Bahan baku vacuum cleaner, seperti plastik, logam/besi, dan bahan elektronik menggunakan energi dan air dalam proses pengolahannya yang dapat menyebabkan pelepasan emisi gas rumah kaca.\n', '1. Konsumsi energi listrik yang berlebihan dalam menggunakan vacuum cleaner dapat mengakibatkan peningkatan emisi gas rumah kaca yang berpengaruh pada pemanasan global dan perubahan iklim. \n\n2. Pengoperasian vacuum cleaner menghasilkan limbah-limbah yang kebanyakan tidak berbahaya untuk lingkungan, seperti debu atau kotoran yang berasal dari perlengkapan rumah tangga yang dibersihkan', '1. Pemborosan sumber daya langka, seperti petroleum dan tembaga\n\n2. Peningkatan volume limbah elektronik di tempat pembuangan sampah', 1.32, 'Produksi melepaskan gas rumah kaca', 'Daya yang besar', 'Pemborosan Sumber Daya Langka', 'Gudang', 'http://motor.ece.iit.edu/eiot/LIFTED/LIFTED_DATA/Individual_Appliance.zip'),
('Washing Machine', 'https://drive.google.com/uc?export=download&id=1B0SoqFf8fhplP1IMUSuC0MZjKB2id765', NULL, 'Produksi mesin cuci mengonsumsi banyak energi listrik untuk proses injeksi molding pada termoplastik, serta penggunaan material tembaga dan aluminium yang berdampak pada potensi ekotoksikologi terestrial, ekotoksikologi akuatik laut, toksisitas manusia, dan penipisan lapisan ozon.', 'Penggunaan mesin cuci menggunakan energi listrik untuk mengoperasikannya yang menghasilkan pelepasan emisi gas rumah kaca.\r\n\r\nPenggunaan detergen dan air pada saat pencucian juga berdampak pada potensi eutrofikasi dan potensi  toksisitas terestrial.', 'Material dari mesin cuci memerlukan waktu dekomposisi selama ratusan tahun dimana zat-zat kimia yang berbahaya dapat ikut meresap ke dalam tanah', 4.94, 'Material yang digunakan berpotensi mencemar lingkungan.', 'Daya yang besar dan limbah berpotensi toksik', 'Sangat lama teruraikan dan dapat mencemari tanah', 'Ruang Cuci', 'https://zenodo.org/record/5063428');

-- --------------------------------------------------------

--
-- Table structure for table `Source`
--

CREATE TABLE `Source` (
  `Object_Name` varchar(255) NOT NULL,
  `Link` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Source`
--

INSERT INTO `Source` (`Object_Name`, `Link`) VALUES
('Air Conditioner', 'https://www.kaggle.com/datasets/ecoco2/household-appliances-power-consumption\r\n'),
('Hair Dryer', 'http://motor.ece.iit.edu/eiot/LIFTED/LIFTED_DATA/Individual_Appliance.zip'),
('Iron', 'https://4stripes.aero/the-environmental-impact-of-ironing-shirts/'),
('Iron', 'https://www.polti.com/news/the-science-of-effective-ironing'),
('Iron', 'https://berapawatt.com/setrika-berapa-watt/'),
('Iron', 'https://onlinelibrary.wiley.com/doi/abs/10.1111/jiec.12244'),
('Lamp', 'ENERGY STAR Certified Light Bulbs | EPA ENERGY STAR'),
('Lamp', 'https://ewasa.org/what-is-lighting-waste/#:~:text=Sending%20waste%20lighting%20equipment%20to,can%20contaminate%20the%20surrounding%20soil.'),
('Lamp', 'What is the environmental impact of LED lighting? - Lightwave | LED Lighting Specialists (lightwaveuk.com)'),
('Lamp', 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwiK8MH7l8D_AhW-bGwGHSICBs0QFnoECBsQAQ&url=https%3A%2F%2Fjurnal.uisu.ac.id%2Findex.php%2Fsemnastek%2Farticle%2Fdownload%2F3025%2F1979&usg=AOvVaw3fp9qi0eEftdFEpWf0zzkk\r\n'),
('Laptop', 'https://www.kaggle.com/datasets/ecoco2/household-appliances-power-consumption'),
('Laptop', 'https://recykal.com/2022/12/22/how-can-organizations-reduce-their-laptops-carbon-footprint/'),
('Laptop', 'https://circularcomputing.com/news/carbon-footprint-laptop/'),
('Laptop', 'https://changestarted.com/laptops-impact-the-environment-how-to-minimise-them/'),
('Oven', 'Amazon.com : OVEN MICROWAVE'),
('Oven', 'https://www.sustainability-times.com/low-carbon-energy/microwaves-can-harm-the-planet/'),
('Oven', 'https://www.jiffyjunk.com/blog/microwave-disposal-hazardous/'),
('Oven', 'http://www.designlife-cycle.com/microwave-oven'),
('Refrigerator', 'https://zenodo.org/record/5063428'),
('Refrigerator', 'https://www.bbc.com/future/article/20201204-climate-change-how-chemicals-in-your-fridge-warm-the-planet'),
('Refrigerator', 'https://www.webmd.com/balance/how-to-recycle-a-refrigerator'),
('Refrigerator', 'https://www.sehatq.com/artikel/dampak-yang-ditimbulkan-dari-penggunaan-ac-dan-lemari-es'),
('Rice Cooker', 'http://motor.ece.iit.edu/eiot/LIFTED/LIFTED_DATA/Individual_Appliance.zip'),
('Rice Cooker', 'https://asmedigitalcollection.asme.org/IMECE/proceedings-abstract/IMECE2011/54891/859/354267'),
('Television', 'https://onlinelibrary.wiley.com/doi/full/10.1111/j.1530-9290.2011.00352.x'),
('Television', 'https://data.world/us-epa-gov/1e6de0aa-3b72-4f06-a87c-a45baa911d1b'),
('Vacuum Cleaner', 'http://motor.ece.iit.edu/eiot/LIFTED/LIFTED_DATA/Individual_Appliance.zip'),
('Vacuum Cleaner', 'https://www.eceee.org/static/media/uploads/site-2/ecodesign/products/vacuum-cleaners/vacuum-cleaners-ecodesign-study-final-report-eup-lot-17-final-report.pdf'),
('Vacuum Cleaner', 'http://www.aevacuum.com/environmental-impact.htm'),
('Washing Machine', 'https://zenodo.org/record/5063428'),
('Washing Machine', 'https://zimwashingmachines.com/environmental-impact-of-washing-machines-a-guide/'),
('Washing Machine', 'https://link.springer.com/article/10.1007/s11367-015-0993-5');

-- --------------------------------------------------------

--
-- Table structure for table `Type`
--

CREATE TABLE `Type` (
  `Object_Name` varchar(255) NOT NULL,
  `Type_ID` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Type`
--

INSERT INTO `Type` (`Object_Name`, `Type_ID`) VALUES
('Air Conditioner', '10'),
('Air Conditioner', '11'),
('Air Conditioner', '12'),
('Air Conditioner', '13'),
('Air Conditioner', '14'),
('Air Conditioner', '15'),
('Air Conditioner', '8'),
('Air Conditioner', '9'),
('Hair Dryer', '5'),
('Iron', '47'),
('Lamp', '30'),
('Lamp', '31'),
('Lamp', '32'),
('Lamp', '33'),
('Lamp', '34'),
('Lamp', '35'),
('Lamp', '36'),
('Lamp', '37'),
('Lamp', '38'),
('Laptop', '6'),
('Laptop', '7'),
('Oven', '16'),
('Oven', '17'),
('Oven', '18'),
('Oven', '19'),
('Oven', '20'),
('Oven', '21'),
('Oven', '22'),
('Oven', '23'),
('Oven', '24'),
('Oven', '25'),
('Oven', '26'),
('Oven', '27'),
('Oven', '28'),
('Oven', '29'),
('Refrigerator', '1'),
('Rice Cooker', '4'),
('Television', '39'),
('Television', '40'),
('Television', '41'),
('Television', '42'),
('Television', '43'),
('Television', '44'),
('Television', '45'),
('Television', '46'),
('Vacuum Cleaner', '3'),
('Washing Machine', '2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detailed_Type`
--
ALTER TABLE `detailed_Type`
  ADD PRIMARY KEY (`Type_ID`),
  ADD UNIQUE KEY `Type_ID` (`Type_ID`);

--
-- Indexes for table `Energy`
--
ALTER TABLE `Energy`
  ADD PRIMARY KEY (`Type_ID`),
  ADD UNIQUE KEY `Type_ID` (`Type_ID`);

--
-- Indexes for table `Lumens`
--
ALTER TABLE `Lumens`
  ADD PRIMARY KEY (`Type_ID`),
  ADD UNIQUE KEY `Type_ID` (`Type_ID`);

--
-- Indexes for table `Main`
--
ALTER TABLE `Main`
  ADD PRIMARY KEY (`Object_Name`);

--
-- Indexes for table `Source`
--
ALTER TABLE `Source`
  ADD KEY `Object_Name` (`Object_Name`);

--
-- Indexes for table `Type`
--
ALTER TABLE `Type`
  ADD UNIQUE KEY `Type_ID` (`Type_ID`),
  ADD KEY `Object_Name` (`Object_Name`),
  ADD KEY `Type_ID_2` (`Type_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detailed_Type`
--
ALTER TABLE `detailed_Type`
  ADD CONSTRAINT `detailed_Type_ibfk_1` FOREIGN KEY (`Type_ID`) REFERENCES `Type` (`Type_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Energy`
--
ALTER TABLE `Energy`
  ADD CONSTRAINT `Energy_ibfk_1` FOREIGN KEY (`Type_ID`) REFERENCES `Type` (`Type_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Lumens`
--
ALTER TABLE `Lumens`
  ADD CONSTRAINT `Lumens_ibfk_1` FOREIGN KEY (`Type_ID`) REFERENCES `Type` (`Type_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Source`
--
ALTER TABLE `Source`
  ADD CONSTRAINT `Source_ibfk_1` FOREIGN KEY (`Object_Name`) REFERENCES `Main` (`Object_Name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Type`
--
ALTER TABLE `Type`
  ADD CONSTRAINT `Type_ibfk_1` FOREIGN KEY (`Object_Name`) REFERENCES `Main` (`Object_Name`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
