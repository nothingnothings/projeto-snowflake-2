SELECT * FROM FOUR_EYES.PUBLIC.PREMADE_4EYES_LITE
WHERE DATE IN ('2024-04-14') LIMIT 1000;

SELECT * FROM FOUR_EYES.PUBLIC.PREMADE_4EYES_LITE
WHERE DATE IN ('2024-04-10') LIMIT 1000;



SELECT FIRST_NAME, LAST_NAME, BUSINESS_EMAIL, PROGRAMMATIC_BUSINESS_EMAILS, PERSONAL_EMAIL, JOB_TITLE, SENIORITY_LEVEL, DEPARTMENT,
 MOBILE_PHONE, DIRECT_NUMBER, LINKEDIN_URL, PERSONAL_ADDRESS, PERSONAL_ADDRESS_2, PERSONAL_CITY, PERSONAL_STATE, PERSONAL_ZIP, 
 PERSONAL_ZIP4, PROFESSIONAL_ADDRESS, PROFESSIONAL_ADDRESS_2, PROFESSIONAL_CITY, PROFESSIONAL_STATE, PROFESSIONAL_ZIP, 
 PROFESSIONAL_ZIP4, COMPANY_NAME, COMPANY_DOMAIN, COMPANY_PHONE, PRIMARY_INDUSTRY, COMPANY_SIC, COMPANY_NAICS, COMPANY_ADDRESS, 
 COMPANY_ADDRESS_2, COMPANY_CITY, COMPANY_STATE, COMPANY_ZIP, COMPANY_ZIP4, COMPANY_LINKEDIN_URL, COMPANY_REVENUE, COMPANY_EMPLOYEE_COUNT, 
 BUSINESS_EMAIL_VALIDATION_STATUS, BUSINESS_EMAIL_LAST_SEEN, COMPANY_LAST_UPDATED, JOB_TITLE_LAST_UPDATED, LAST_UPDATED 
 FROM AUDIENCELAB_INTERNAL_PROD.public.b2b_export_trovo 
 WHERE (COMPANY_SIC LIKE '%7311%') 
 AND (COMPANY_EMPLOYEE_COUNT IN ('1 to 10','11 to 25','26 to 50','51 to 100','101 to 250')) 
 LIMIT 5000 OFFSET 150000;



SELECT any_value(ID) as ID, any_value(UP_ID) as UP_ID, any_value(FIRST_NAME) as FIRST_NAME, any_value(LAST_NAME) as LAST_NAME, 
any_value(PERSONAL_EMAIL) as PERSONAL_EMAIL, any_value(SHA256_PERSONAL_EMAIL) as SHA256_PERSONAL_EMAIL,
 any_value(ADDITIONAL_PERSONAL_EMAILS) as ADDITIONAL_PERSONAL_EMAILS, any_value(ADDRESS_2) as ADDRESS_2, 
 any_value(LATITUDE) as LATITUDE, any_value(LONGITUDE) as LONGITUDE, any_value(MOBILE_PHONE) as MOBILE_PHONE, 
 any_value(PERSONAL_PHONE) as PERSONAL_PHONE, any_value(DPV_CODE) as DPV_CODE, any_value(GENDER) as GENDER, 
 any_value(AGE_RANGE) as AGE_RANGE, any_value(MARRIED) as MARRIED, any_value(CHILDREN) as CHILDREN, 
 any_value(INCOME_RANGE) as INCOME_RANGE, any_value(NET_WORTH) as NET_WORTH, any_value(HOME_OWNER) 
 as HOME_OWNER, any_value(PERSONAL_EMAIL_LAST_SEEN_VALIDATION_STATUS) as PERSONAL_EMAIL_LAST_SEEN_VALIDATION_STATUS, 
 any_value(PERSONAL_EMAIL_LAST_SEEN) as PERSONAL_EMAIL_LAST_SEEN, any_value(CONSUMER_ADDRESS) as CONSUMER_ADDRESS, 
 any_value(ADULTS_F_18_24) as ADULTS_F_18_24, any_value(ADULTS_F_25_34) as ADULTS_F_25_34, 
 any_value(ADULTS_F_35_44) as ADULTS_F_35_44, any_value(ADULTS_F_45_54) as ADULTS_F_45_54, 
 any_value(ADULTS_F_55_64) as ADULTS_F_55_64, any_value(ADULTS_F_65_74) as ADULTS_F_65_74, 
 any_value(ADULTS_F_75PLUS) as ADULTS_F_75PLUS, any_value(ADULTS_M_18_24) as ADULTS_M_18_24,
  any_value(ADULTS_M_25_34) as ADULTS_M_25_34, any_value(ADULTS_M_35_44) as ADULTS_M_35_44,
   any_value(ADULTS_M_45_54) as ADULTS_M_45_54, any_value(ADULTS_M_55_64) as ADULTS_M_55_64, 
   any_value(ADULTS_M_65_74) as ADULTS_M_65_74, any_value(ADULTS_M_75PLUS) as ADULTS_M_75PLUS, 
   any_value(ADULTS_U_18_24) as ADULTS_U_18_24, any_value(ADULTS_U_25_34) as ADULTS_U_25_34, 
   any_value(ADULTS_U_35_44) as ADULTS_U_35_44, any_value(ADULTS_U_45_54) as ADULTS_U_45_54, 
   any_value(ADULTS_U_55_64) as ADULTS_U_55_64, any_value(ADULTS_U_65_74) as ADULTS_U_65_74, any_value(ADULTS_U_75PLUS) as ADULTS_U_75PLUS, 
   any_value(AUTO_BODY_TYPE) as AUTO_BODY_TYPE, any_value(AUTO_DEF_ENGINE_CYLINDERS) as AUTO_DEF_ENGINE_CYLINDERS,
    any_value(AUTO_DEF_TRANS_TYPE) as AUTO_DEF_TRANS_TYPE, any_value(AUTO_FUEL_TYPE) as AUTO_FUEL_TYPE, any_value(AUTO_GVW_RANGE) as AUTO_GVW_RANGE,
     any_value(AUTO_MAKE) as AUTO_MAKE, any_value(AUTO_MFG_CODE) as AUTO_MFG_CODE, any_value(AUTO_MSRP) as AUTO_MSRP, 
     any_value(AUTO_STYLE) as AUTO_STYLE, any_value(AUTO_VEHICLE_TYPE) as AUTO_VEHICLE_TYPE, any_value(AUTO_VIN_) as AUTO_VIN_, 
     any_value(AUTO_YEAR_) as AUTO_YEAR_, any_value(AUTOALARMTYPE) as AUTOALARMTYPE, any_value(AUTOANNUALMILES) as AUTOANNUALMILES,
      any_value(AUTOCOMMUTEDISTANCE) as AUTOCOMMUTEDISTANCE, any_value(AUTOHASABS) as AUTOHASABS, any_value(AUTOHASAIRBAGS) as AUTOHASAIRBAGS, 
      any_value(AUTOINSBODILYINJURYCOVERAGE) as AUTOINSBODILYINJURYCOVERAGE, any_value(AUTOINSCOLLISIONDEDUCTIBLE) as AUTOINSCOLLISIONDEDUCTIBLE, 
      any_value(AUTOINSCOMPREHENSIVEDEDUCTIBLE) as AUTOINSCOMPREHENSIVEDEDUCTIBLE, any_value(AUTOINSCOVERAGETYPE) as AUTOINSCOVERAGETYPE,
       any_value(AUTOINSCOVERAGETYPEREQUESTED) as AUTOINSCOVERAGETYPEREQUESTED, any_value(AUTOINSPROPERTYDAMAGECOVERAGE) as AUTOINSPROPERTYDAMAGECOVERAGE,
        any_value(AUTOMAKE) as AUTOMAKE, any_value(AUTOPRIMARYUSE) as AUTOPRIMARYUSE, any_value(AUTOYEAR) as AUTOYEAR,
         any_value(CC_AMEX_PREM) as CC_AMEX_PREM, any_value(CC_AMEX_REG) as CC_AMEX_REG, any_value(CC_BANK_CD_IN_HH) as CC_BANK_CD_IN_HH, 
         any_value(CC_DISC_PREM) as CC_DISC_PREM, any_value(CC_DISC_REG) as CC_DISC_REG, any_value(CC_GAS_PREM) as CC_GAS_PREM, any_value(CC_GAS_REG) as CC_GAS_REG, any_value(CC_HLDR_BANK) as CC_HLDR_BANK, any_value(CC_HLDR_GAS) as CC_HLDR_GAS, any_value(CC_HLDR_PREM) as CC_HLDR_PREM, any_value(CC_HLDR_TE) as CC_HLDR_TE, any_value(CC_HLDR_UNK) as CC_HLDR_UNK, any_value(CC_HLDR_UPS_DEPT) as CC_HLDR_UPS_DEPT, any_value(CC_MC_PREM) as CC_MC_PREM, any_value(CC_MC_REG) as CC_MC_REG, any_value(CC_NEW_ISSUE) as CC_NEW_ISSUE, any_value(CC_USER) as CC_USER, any_value(CC_VISA_PREM) as CC_VISA_PREM, any_value(CC_VISA_REG) as CC_VISA_REG, any_value(CENSUS_BLOCK_GROUP) as CENSUS_BLOCK_GROUP, any_value(CENSUS_TRACT) as CENSUS_TRACT, any_value(CITY) as CITY, any_value(CREDIT_LINES) as CREDIT_LINES, any_value(CREDIT_RANGE_NEW) as CREDIT_RANGE_NEW, any_value(CREDIT_RATING) as CREDIT_RATING, any_value(DOB_DAY) as DOB_DAY, any_value(DOB_MON) as DOB_MON, any_value(DOB_YR) as DOB_YR, any_value(DOMAIN) as DOMAIN, any_value(DONR_ANIMAL) as DONR_ANIMAL, any_value(DONR_ARTS) as DONR_ARTS, any_value(DONR_CHARITABLE) as DONR_CHARITABLE, any_value(DONR_COMM_CHAR) as DONR_COMM_CHAR, any_value(DONR_ENVIRON) as DONR_ENVIRON, any_value(DONR_HEALTH) as DONR_HEALTH, any_value(DONR_INTL_AID) as DONR_INTL_AID, any_value(DONR_KIDS) as DONR_KIDS, any_value(DONR_MAIL_ORD) as DONR_MAIL_ORD, any_value(DONR_OTH) as DONR_OTH, any_value(DONR_POL) as DONR_POL, any_value(DONR_POL_CONS) as DONR_POL_CONS, any_value(DONR_POL_LIB) as DONR_POL_LIB, any_value(DONR_RELIG) as DONR_RELIG, any_value(DONR_VETS) as DONR_VETS, any_value(DONR_WILDLIFE) as DONR_WILDLIFE, any_value(DRIVERSLICENSEEVERREVOKED) as DRIVERSLICENSEEVERREVOKED, any_value(DRIVERSLICENSESTATE) as DRIVERSLICENSESTATE, any_value(DWELL_TYPE) as DWELL_TYPE, any_value(EDUCATION_LEVEL) as EDUCATION_LEVEL, any_value(ETHNIC_ASSIM) as ETHNIC_ASSIM, any_value(ETHNIC_CONF) as ETHNIC_CONF, any_value(ETHNIC_GRP) as ETHNIC_GRP, any_value(ETHNIC_HISP_CNTRY) as ETHNIC_HISP_CNTRY, any_value(ETHNIC_LANG) as ETHNIC_LANG, any_value(ETHNIC_RELIG) as ETHNIC_RELIG, any_value(EXACT_AGE) as EXACT_AGE, any_value(FIPS_STATE_CODE) as FIPS_STATE_CODE, any_value(GENERATIONS) as GENERATIONS, any_value(GENL_PP_HOME_VALUE) as GENL_PP_HOME_VALUE, any_value(HH_INCOME) as HH_INCOME, any_value(HH_MARITAL_STATUS) as HH_MARITAL_STATUS, any_value(INVEST_ACT) as INVEST_ACT, any_value(INVEST_FOREIGN) as INVEST_FOREIGN, any_value(INVEST_MONEY_SEEKR) as INVEST_MONEY_SEEKR, any_value(INVEST_PERS) as INVEST_PERS, any_value(INVEST_READ_FIN_NEWS) as INVEST_READ_FIN_NEWS, any_value(INVEST_RL_EST) as INVEST_RL_EST, any_value(INVEST_STOCKS) as INVEST_STOCKS, any_value(KIDS_F_0_2) as KIDS_F_0_2, any_value(KIDS_F_11_15) as KIDS_F_11_15, any_value(KIDS_F_16_17) as KIDS_F_16_17, any_value(KIDS_F_3_5) as KIDS_F_3_5, any_value(KIDS_F_6_10) as KIDS_F_6_10, any_value(KIDS_M_0_2) as KIDS_M_0_2, any_value(KIDS_M_11_15) as KIDS_M_11_15, any_value(KIDS_M_16_17) as KIDS_M_16_17, any_value(KIDS_M_3_5) as KIDS_M_3_5, any_value(KIDS_M_6_10) as KIDS_M_6_10, any_value(KIDS_U_0_2) as KIDS_U_0_2, any_value(KIDS_U_11_15) as KIDS_U_11_15, any_value(KIDS_U_16_17) as KIDS_U_16_17, any_value(KIDS_U_3_5) as KIDS_U_3_5, any_value(KIDS_U_6_10) as KIDS_U_6_10, any_value(LENGTH_OF_RESIDENCE) as LENGTH_OF_RESIDENCE, any_value(MAGS) as MAGS, any_value(MOTORCYCLE_DATE) as MOTORCYCLE_DATE, any_value(MOTORCYCLE_MODEL) as MOTORCYCLE_MODEL, any_value(MOTORCYCLE_VIN) as MOTORCYCLE_VIN, any_value(MR_LENDR_CD) as MR_LENDR_CD, any_value(MR_LOAN_TYP) as MR_LOAN_TYP, any_value(MR2_AMT) as MR2_AMT, any_value(MR2_LENDR) as MR2_LENDR, any_value(MR2_LENDR_CD) as MR2_LENDR_CD, any_value(MR2_LOAN_TYP) as MR2_LOAN_TYP, any_value(MR2_RATE_TYP) as MR2_RATE_TYP, any_value(NAME_SUFFIX) as NAME_SUFFIX, any_value(NUM_ADULTS) as NUM_ADULTS, any_value(NUM_KIDS) as NUM_KIDS, any_value(OCC_AFRIC_AMER_PROF) as OCC_AFRIC_AMER_PROF, any_value(OCC_BUSN_OWNR) as OCC_BUSN_OWNR, any_value(OCC_HOME_OFF) as OCC_HOME_OFF, any_value(OCC_SOHO_IND) as OCC_SOHO_IND, any_value(OCC_WORKING_WMN) as OCC_WORKING_WMN, any_value(OPTIN_DATE) as OPTIN_DATE, any_value(P2_AMT) as P2_AMT, any_value(P2_LOAN_TYP) as P2_LOAN_TYP, any_value(P2_RATE_TYP) as P2_RATE_TYP, any_value(PARTY_AFFILIATION) as PARTY_AFFILIATION, any_value(PAYDAY_EMPLOYER_NAME) as PAYDAY_EMPLOYER_NAME, any_value(PAYDAY_EMPLOYMENT_STATUS) as PAYDAY_EMPLOYMENT_STATUS, any_value(PAYDAY_FLAG) as PAYDAY_FLAG, any_value(PAYDAY_LOAN_REQUESTED_AMT) as PAYDAY_LOAN_REQUESTED_AMT, any_value(PAYDAY_MILITARY_FLAG) as PAYDAY_MILITARY_FLAG, any_value(PAYDAY_OCCUPATION) as PAYDAY_OCCUPATION, any_value(PRES_KIDS) as PRES_KIDS, any_value(PROP_AC) as PROP_AC, any_value(PROP_FUEL) as PROP_FUEL, any_value(PROP_POOL) as PROP_POOL, any_value(PROP_SEWER) as PROP_SEWER, any_value(PROP_TYPE) as PROP_TYPE, any_value(PROP_WATER) as PROP_WATER, any_value(SINGLE_PARENT) as SINGLE_PARENT, any_value(SR_ADULT_IN_HH) as SR_ADULT_IN_HH, any_value(STATE) as STATE, any_value(URL) as URL, any_value(VET_IN_HH) as VET_IN_HH, any_value(WALK_SEQUENCE_CODE) as WALK_SEQUENCE_CODE, any_value(YOUNG_ADULT_IN_HH) as YOUNG_ADULT_IN_HH, any_value(ZIP) as ZIP, any_value(ZIP4) as ZIP4, any_value(PERSONAL_PHONE_DNC_FLAG) as PERSONAL_PHONE_DNC_FLAG, any_value(MOBILE_PHONE_DNC_FLAG) as MOBILE_PHONE_DNC_FLAG FROM PUBLIC.CONSUMER_B2C_FULL WHERE ID IN (646450300 , 861216281 , 655036267 , 881328609 , 665036576 , 819838581 , 649435422 , 848383935 , 748447182 , 648319816 , 863091738 , 682709855 , 826573850 , 923576526 , 679855458 , 757811394 , 734620444 , 823924412 , 858133484 , 822971975 , 977328982 , 907308039 , 693436624 , 932243313 , 688305737 , 784861837 , 977000148 , 1109483464 , 1120115698 , 859854556 , 781458772 , 820693747 , 834876417 , 711460767 , 864173717 , 982115131 , 725448126 , 795209506 , 869031951 , 727893321 , 871051177 , 649120289 , 726267100 , 653580064 , 802468817 , 850723047 , 851238233 , 858769558 , 725573453 , 900359602 , 843768973 , 720652996 , 905536788 , 1120896834 , 715008117 , 964395220 , 935142670 , 871907233 , 838019346 , 767590248 , 694777305 , 759144765 , 922253702 , 781705731 , 936704144 , 731178519 , 1104549671 , 675190255 , 781043460 , 968552126 , 867101129 , 654684164 , 721627940 , 666725766 , 886607485 , 756261054 , 876836773 , 955472752 , 720751726 , 746091286 , 663743919 , 829818684 , 905965658 , 650612430 , 692393954 , 784617186 , 971890413 , 836116566 , 827752199 , 828985597 , 802047819 , 918662146 , 728148654 , 915335618 , 709305026 , 781298725 , 868620004 , 800790207 , 823238838 , 757456175 , 813764856 , 969240588 , 831565190 , 971148970 , 827961529 , 641332282 , 654115008 , 978757364 , 977843096 , 647844187 , 787186573 , 696997425 , 744821017 , 651349331 , 1113051431 , 791170045 , 651641488 , 641156963 , 640808118 , 657667020 , 641331407 , 1120906764 , 681591214 , 882786453 , 681591214 , 679729117 , 728270030 , 667831487 , 968605140 , 932450495 , 680052161 , 786097054 , 1110468677 , 900597469 , 660482436 , 1103845242 , 806289069 , 797706303 , 809443026 , 678732168 , 891528581 , 1107717682 , 945574142 , 755502905 , 952350256 , 709305026 , 902597614 , 748161049 , 828452501 , 645308375 , 699105217 , 762379063 , 853062820 , 792291441 , 877584955 , 942543325 , 948540993 , 825183687 , 763386329 , 678463401 , 860519868 , 713053656 , 722579650 , 726591800 , 968068661 , 834392362 , 966704297 , 888755797 , 812453290 , 663465247 , 966704297 , 918434821 , 739251947 , 845669322 , 813409948 , 788914530 , 814110342 , 957722775 , 759203271 , 875991731 , 928216878 , 971109156 , 938552543 , 758968398 , 966604639 , 949635103 , 658713958 , 675934376 , 866340282 , 680283993 , 1110147460 , 845828313 , 1105295882 , 752565110 , 752879527 , 737597732 , 875991731 , 892701912 , 960481442 , 884527066 , 640917310 , 679096878 , 898966603 , 1110778364 , 754693768 , 828731045 , 711487594 , 912818064 , 725783854 , 1104213709 , 648874097 , 774845026 , 935238439 , 969860071 , 767863431 , 643206949 , 892217614 , 914948422 , 1105776347 , 743240301 , 763636455 , 896388334 , 1112602000 , 822558141 , 752394541 , 971508831 , 1111929522 , 727341420 , 981718223 , 779328917 , 808933776 , 938070471 , 673433192 , 880507563 , 666877908 , 835795289 , 685602722 , 679074652 , 822730605 , 701258036 , 968093448 , 759883804 , 663955156 , 682657383 , 1113755793 , 812953651 , 931803392 , 703238045 , 812035861 , 708456087 , 895412757 , 905033990 , 812115275 , 929272529 , 926645513 , 845888286 , 665144931 , 668690720 , 868581657 , 692387494 , 919340969 , 920817367 , 853567768 , 863051801 , 824912004 , 890891240 , 661434274 , 723633929 , 873852250 , 671601787 , 790773677 , 1109748313 , 698661422 , 921787554 , 910101310 , 922643651 , 723633929 , 654299215 , 758850461 , 953454956 , 869493082 , 766831656 , 677106700 , 793412837 , 649773130 , 960867991 , 912379925 , 896388334 , 776645641 , 816694950 , 813770338 , 813331433 , 806288449 , 672181806 , 766424807 , 839796168 , 1107263956 , 923816672 , 702094914 , 853781794 , 791469127 , 654598211 , 881597804 , 701581671 , 858907576 , 782102735 , 718624670 , 666022767 , 973537734 , 860622608 , 949903240 , 639905360 , 764269566 , 692220615 , 949903240 , 693655999 , 1120656868 , 792408456 , 921386241 , 653817632 , 854470441 , 644678462 , 843827095 , 734986325 , 924124124 , 804748106 , 898850716 , 766138449 , 814038035 , 738466814 , 906422881 , 794211688 , 701939932 , 794178681 , 739369103 , 891087957 , 922209229 , 830065768 , 764945409 , 863173199 , 667301794 , 798757972 , 704189506 , 920639428 , 923624405 , 722975839 , 639677630 , 862385417 , 834135223 , 739455769 , 872373120 , 827175363 , 671696993 , 800649677 , 733376708 , 814038035 , 660482436 , 1112828680 , 1112828680 , 763619519 , 913710030 , 692774524 , 853664187 , 662889390 , 689852032 , 784753399 , 971003998 , 713977552 , 921659599 , 804638710 , 666917210 , 850271789 , 663822897 , 830278358 , 740011278 , 907964285 , 728482249 , 865719774 , 773143872 , 931222071 , 876568469 , 810311194 , 894714663 , 839181185 , 905878677 , 796699568 , 655815785 , 762552545 , 958293951 , 908521409 , 875436032 , 935520378 , 806229647 , 798804466 , 794599314 , 915873364 , 804606834 , 674392354 , 862400134 , 972816449 , 728574782 , 886086870 , 670750190 , 900615491 , 975926467 , 1104975333 , 825641930 , 657165060 , 968564247 , 964365239 , 916476326 , 721561707 , 793174229 , 751973727 , 937803916 , 817189581 , 711364876 , 782090105 , 954407095 , 784138137 , 689185027 , 924168489 , 779813009 , 872522238 , 912380711 , 842411488 , 705066941 , 764029315 , 716634840 , 846510856 , 728745560 , 838443368 , 684380686 , 950309046 , 915820151 , 864920847 , 690119740 , 899371431 , 677892051 , 724721199 , 708420294 , 952963287 , 844857939 , 752717120 , 801269114 , 778544606 , 780082320 , 1107396061 , 873577955 , 820461808 , 957374709 , 800933576 , 977634742 , 720646248 , 966913413 , 965531441 , 949903240 , 796592789 , 919242336 , 830413611 , 805638368 , 811655605 , 936569104 , 648782164 , 751895609 , 671037629 , 748141060 , 863832671 , 687094454 , 661364003 , 713846103 , 894536298 , 970591587 , 767346930 , 653388195 , 765958138 , 821059468 , 788224975 , 840176128 , 860924582 , 647386836 , 897909877 , 787129858 , 767347889 , 705705456 , 967406885 , 1115945568 , 695832639 , 730296561 , 1108116999 , 843827095 , 899847872 , 772631292 , 835898413 , 643114169 , 833545464 , 1111251489 , 658700633 , 856551738 , 649290115 , 870179759 , 916574332 , 665800686 , 857234322 , 944960114 , 981875133 , 688052135 , 792524962 , 1120068082 , 763432316 , 940278715 , 859358146 , 926270374 , 727001911 , 806983561 , 743855785 , 745706126 , 733477168 , 727138481 , 825746040 , 782403385 , 789831964 , 927127030 , 821077910 , 694370927 , 882610032 , 688052135 , 756799840 , 850064104 , 739677225 , 1109485037 , 810587430 , 778712246 , 926873646 , 735535173 , 810587430 , 750630463 , 771083198 , 1106683281 , 686782153 , 755585098 , 770397998 , 692701131 , 803512049 , 824092911 , 876678959 , 655685309 , 922828089 , 715714745 , 819250282 , 972178570 , 861655788 , 727617763 , 1105668678 , 875204352 , 827175363 , 642103131 , 958058922 , 780428258 , 685139974 , 957596261 , 981910201 , 659009495 , 732102203 , 912294122 , 645068792 , 663159669 , 857330345 , 916106151 , 880031357 , 1108377841 , 731096564 , 931031424 , 942638217 , 770451410 , 890586462 , 955766426 , 793606910 , 643332684 , 774198881 , 841298766 , 865442667 , 825161069 , 1113668727 , 768526225 , 833844273 , 866183818 , 917745678 , 910836651 , 978852695 , 947514463 , 838044976 , 877092253 , 847108353 , 656458679 , 808620959 , 918618553 , 911255243 , 832481245 , 1106874571 , 930215830 , 800783584 , 732321142 , 865071456 , 708157131 , 811323752 , 979444440 , 914484149 , 708763261 , 902179838 , 713912105 , 723784193 , 935264975 , 977620475 , 821696302 , 834691224 , 945205827 , 926568493 , 683402341 , 719194353 , 685283674 , 833177383 , 906357252 , 873542638 , 691103367 , 716803962 , 690363374 , 979009050 , 790512381 , 663716059 , 864923987 , 876146387 , 844062806 , 931018542 , 886450725 , 970610468 , 784256122 , 708909666 , 1120650964 , 949903240 , 715124060 , 845816843 , 963678400 , 980447807 , 802322560 , 816108507 , 811295033 , 707332905 , 976992096 , 685835724 , 796276295 , 822196532 , 939907934 , 1122237245 , 814152735 , 868485456 , 720259619 , 712269037 , 648897866 , 782398586 , 954067335 , 903214418 , 946901002 , 874200113 , 690363374 , 791293027 , 669422213 , 1110088101 , 675698044 , 1118306174 , 884371201 , 683489480 , 974564216 , 855356569 , 676699873 , 945425253 , 920903877 , 870335930 , 667685961 , 800039421 , 1104753984 , 758694501 , 885323821 , 667886478 , 792510324 , 750323921 , 943717793 , 711605930 , 795378471 , 713391455 , 870349167 , 841298766 , 1106526668 , 743755882 , 913528066 , 766933097 , 785878538 , 887988115 , 682380519 , 713552533 , 729890307 , 641729560 , 1105137644 , 762192844 , 705408850 , 698764635 , 833011591 , 639471368 , 828254513 , 857116298 , 652007780 , 913772095 , 829592424 , 709136722 , 1119361140 , 661685286 , 807818604 , 863467584 , 908078860 , 846740246 , 781704590 , 650789150 , 913297677 , 849126456 , 643036077 , 900049265 , 770510517 , 718622535 , 643990475 , 809598463 , 705806311 , 1112790104 , 825974038 , 648585959 , 958028748 , 725248398 , 957003220 , 651889242 , 739551631 , 976333764 , 856527830 , 816218492 , 835132450 , 884427746 , 668064584 , 748239019 , 902742256 , 670216076 , 771526232 , 1109018234 , 873627352 , 935887980 , 800372520 , 870697994 , 853389220 , 799690526 , 846829198 , 797897874 , 670705962 , 870627645 , 854523363 , 695967091 , 767570890 , 803678910 , 788241307 , 883850088 , 639418065 , 749721159 , 732182372 , 727874929 , 943051823 , 678433600 , 672818767 , 788514015 , 943226300 , 914961759 , 874566890 , 1109125286 , 765774171 , 740335135 , 925572702 , 871896230 , 757024537 , 931052130 , 936358580 , 785239086 , 713418135 , 1109125286 , 1111044217 , 982285667 , 714016807 , 867571059 , 838132722 , 806471134 , 658192115 , 749231390 , 869719717 , 667115818 , 849462351 , 899295866 , 778234211 , 834294746 , 834266818 , 751234941 , 945267149 , 893491656 , 1121145963 , 712136454 , 1112300289 , 1111497175 , 659297634 , 880363764 , 844314561 , 891652591 , 714034174 , 733238875 , 794108846 , 948851840 , 1112585807 , 755306354 , 977796676 , 806880185 , 670606045 , 731178519 , 918675663 , 706623592 , 791897168 , 1103960367 , 673337567 , 1104565590 , 696889181 , 893161936 , 883686369 , 861848727 , 1106533775 , 832020378 , 761894379 , 924283747 , 960065054 , 849133738 , 851011075 , 705721361 , 773793535 , 894149100 , 874086013 , 913789996 , 961476151 , 914536343 , 843827095 , 793603457 , 914536343 , 885742542 , 742702811 , 645488493 , 845259018 , 713200964 , 783418364 , 879890160 , 729178281 , 856838622 , 912751022 , 780563210 , 972290899 , 854171587 , 923795838 , 710104668 , 961171142 , 716007024 , 796435761 , 749793209 , 844871638 , 656684028 , 832842088 , 679763361 , 705525582 , 898607421 , 893591538 , 724860056 , 866243211 , 699559936 , 953784357 , 745481481 , 709423490 , 883675399 , 780428258 , 945406801 , 645079646 , 726531166 , 706623592 , 887371631 , 1104154270 , 872433036 , 689127334 , 806724383 , 1106788808 , 843097016 , 806724383 , 816063029 , 823285462 , 684302591 , 828584855 , 1106525768 , 732102203 , 894933435 , 655150949 , 915711248 , 758261408 , 929031186 , 879389992 , 663077416 , 891066402 , 806724383 , 770926225 , 799243790 , 693233963 , 664718240 , 665441134 , 646168489 , 1105439072 , 881200778 , 696043318 , 904582640 , 755759225 , 689730291 , 895282412 , 804089559 , 641689834 , 708136517 , 737167780 , 667982426 , 669709249 , 860140644 , 746363834 , 841983880 , 873900965 , 1110530398 , 879423047 , 836079808 , 851345471 , 971368557 , 866977248 , 940299352 , 683786266 , 921920531 , 920152062 , 941925243 , 732125043 , 747831976 , 873808715 , 944930427 , 663640656 , 715047299 , 851466227 , 670170603 , 671033793 , 924955065 , 661632015 , 804011423 , 732125043 , 1113578566 , 894454232 , 687133715 , 715370564 , 699864197 , 937931168 , 813864468 , 704111808 , 857234322 , 677439373 , 908834270 , 1109027477 , 946036471 , 851749791 , 874591256 , 817600451 , 918184331 , 895260116 , 814437753 , 707860629 , 762218790 , 694862115 , 695513503 , 772417441 , 835745698 , 816231780 , 792518898 , 784057981 , 648080488 , 728643054 , 748447817 , 700285331 , 779716574 , 675740384) GROUP BY ID;