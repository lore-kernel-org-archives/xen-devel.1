Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2C6C54F51
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 06:51:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372106.1619550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wobfG-0003rq-6d; Tue, 28 Jul 2026 06:51:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372106.1619550; Tue, 28 Jul 2026 06:51:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wobfG-0003rg-11; Tue, 28 Jul 2026 06:51:46 +0000
Received: by outflank-mailman (input) for mailman id 1372106;
 Tue, 28 Jul 2026 06:51:44 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wobfE-0003nH-AQ
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 06:51:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wobfD-005tq3-N5
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 08:51:43 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a68517b-5cb7-0a2a0a5109dd-0a2a450a8d82-10
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 08:51:43 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a68517e-f2d2-0a2a450a0019-94a38ff12b42-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 08:51:43 +0200
Received: from pps.filterd (m0367128.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66S3ZlNQ390173
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:51:42 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com
 (mail-eastus2azon11011000.outbound.protection.outlook.com [52.101.57.0])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4fpeyfb8mr-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:51:41 +0000 (GMT)
Received: from MW4P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::16)
 by SA1PR16MB4780.namprd16.prod.outlook.com (2603:10b6:806:23c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 06:51:36 +0000
Received: from MWH0EPF000C618B.namprd02.prod.outlook.com
 (2603:10b6:303:115:cafe::19) by MW4P220CA0011.outlook.office365.com
 (2603:10b6:303:115::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.12 via Frontend Transport; Tue,
 28 Jul 2026 06:51:36 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 MWH0EPF000C618B.mail.protection.outlook.com (10.167.249.123) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Tue, 28 Jul 2026 06:51:35 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66S6oC29280076
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 02:51:34 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4fnc6atkht-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 02:51:34 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id obf1wNtvkqFVlobf1wxghJ; Tue, 28 Jul 2026 06:51:33 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=z6x
	z1OGTIsaO9Uk4cXlRWKmNgbnZI7Dx6iS56GDmiv8=; b=DvoQHVlsu87oMz3uO02
	bGJx7GlL8pbAB8AML7gRmTAJA8awcapS5Qwd6HQcMob5ZNUWqGFlC+0R+8NGIQtw
	4ni20NNXhz5k7AxBq4aIlzGB7Dq26LVEFwHNmmPefVME7GWTcSZuJBod+DUiGLqI
	wZTk28lTpofNvDpM/3h/Bw96qKZvZu7ipYxnE1PjoKENb6ggxQz4RUFQ1cMkJ66d
	JDAVZqxL//vEJa669NRYRtT8lDdcKcXVbel7z1ScQIFnRL1r/+VESQQDZmX6FOMx
	X9b9vavGSHgDj4hGIaNKqx7kdLPlFAsuPa7EXWxHLRtDUHqTu3EkviAlhIOkXEDW
	LkA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A9GLmvihldLTqlr+fXX7f7vOc5GsysjniICBDztsRCW0MCTime0i37moHyMosqkBZ4M3LqXaFIwpNerCidYjvH9J/Ir/CnsYJCt97IwMzr8fJhIVIRg1Jy/uTXArrPV89b+d4tRu64VBZczu/Kr55oQeioOdQ+fHoiaKkolzM860DI60kdxt3dVXpTAioa+vZcblpw7SlmCywmeA+cIhURQWsoFO/pdepUwVkxXQZ1/A0OTXVdL4E0PhbyzxZyJgYWIIUjh6muK0qbH9CSVJS1tS6XCs1x6NVsQV+2/na4urDk4wK+D8WWbs2IXkrQXTvExAHZCE1AvOR62jfd8kbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z6xz1OGTIsaO9Uk4cXlRWKmNgbnZI7Dx6iS56GDmiv8=;
 b=yrDCIupC/uxmk9QNB77/Lx8xoRjAUBkU6wLh1Ekf67zXpa6iWnH36Fr6VdcuMCYANZzufvQ8lBgzVeZ1qEhvxUyqeIsA70VNRXVOh8Nse05awMloubmToQB9yAbTdZmFCpG2qDSDR+mT/qWpFLwC63MzHM85ZXBDmLDqXMe4JV1QtId3itcB+B+kPBOwYERoEpqPdjdSIpjFHUssergkKNSqtTLlHgTjsVklxEoRc3vfWilrZhBbdmiDVv5zA8j7bUoDzofPFjOfjYic9bHvGKHGVMDvC5ojAFFkudUeDHftAno6OyZm/q+xFUttmtem59WeDosMK0ekWLjJH6L4Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z6xz1OGTIsaO9Uk4cXlRWKmNgbnZI7Dx6iS56GDmiv8=;
 b=gYC81LdiKj7Wa1zV+rMvqbqRnoUlkgybTZTmgWMHXdKWjp+2zEt21fQ+VOSUK/m7R1Zq8pNhybSWOshTXD/4byqBqM0zkMNfdW1KL08uCsBx4VDx9zqtBEYviLlXo2jZngUjLvtq14XqueX51ltkT4jPbY/Hcf0xCGgRXDoW+yM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	ppserprodsaar; bh=z6xz1OGTIsaO9Uk4cXlRWKmNgbnZI7Dx6iS56GDmiv8=; b=
	ZtMycYViPxMwf2vBPlMkoayisAgoVt6EcAQm+9DwarlNoompPbfKi2MAEwT0VShl
	rDEcNcirmOZ5shUrU5bDclhjvgG7tfW+HwAfn+I73M2IKNfR6rzzeC7yLl5hvwZP
	ZslBxm/QNgQE8ktfxg+H45rhVGrxEPVD9pvj0K3N+hWk6oxZvwXJeZiiejAJeH4k
	SXwnenhosB2k1CH3354ptjCMJMr4hI5NjScG+EkxBVMMtybm5tJVL++LyPWYWxkf
	LuTJRVYWgp2ADkEtV9UiGQzka4I9qi1C+URHy+ue2G58TrEfJQt1/0+vkjc8SXmy
	lWQjGdgrTBpPuS80C4XYig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=z6xz1OG
	TIsaO9Uk4cXlRWKmNgbnZI7Dx6iS56GDmiv8=; b=OPmgbsyVrHnt/gl8P5uaEKE
	naVzd4QtzXdROaVeBIw9k15shT0KkdU0AEibPjaejXSyanUExvqN92beiGdyIsoI
	QNdu9lL+b2fQmo/xTH+VSfwBajBUPde8hqijRFWAoTYmpBzqtBqZkMx8YwEc9Qer
	9FnKQxNaM6cxNndrX/PTJHWG4ixyuJOd7Sx/tTN1Qa4BtdxpD5Tkk/BORIJ5F976
	fh7Ch3mPr4hQGPXIlA1fdyVs3b9FptvO4HEawAe4yEw6EN8Bhw2r48Wdnynnxjyj
	Yr4DNX/TZHlHKzlQum2ueO9HdEVcmI/fh3iV0PB5bkaD264/Y9YQjywIKYfh5OA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: obf1wNtvkqFVlobf1wxghJ
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v8 7/7] xen/console: make console buffer size configurable
Date: Mon, 27 Jul 2026 23:50:49 -0700
Message-ID: <20260728065049.1318143-8-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260728065049.1318143-1-dmukhin@ford.com>
References: <20260728065049.1318143-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280060
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618B:EE_|SA1PR16MB4780:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ab4f3fde-9c79-4cc2-ebd8-08deec74aab5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|10067099003|56012099006|11063799006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	QroDBV09jMKKYyd975hEdp650AHoUhBk8WsHYjdjDmMYv9dFQszJQ5vWhOc3GPLIQVVVk9liLwtIFLk141rFByiE2Oey6Jfad+sjRXjeZRmSCLEMcdB9WIuS/O8fBSOtH/GgPjMe+HobNF4N9OQlEOlD4DSnZk8DV+qycn/eV0agCvN/RSiMal/dBvjrzXv6abkrBhQYCfUN+ldcOsdK1uZz4ZbeU0wGeQH9I4dBHezQm3DiVnrWwyl0WsHacIKI5J+jVbvUdYTSxJpTnBcs1wkxe51M+GRb11nB5uekNim65NkAHT5C572KHA29SxJXeErW9GLdBPltpIyXwPu3B34Iqap8d/Yiqnj5NUTlylu05z3Lcat0w2/w7rmO5y+WARWgzb0CYZui4wELFUjnmCJvnY4HdoV1I9Br70x9W798qEezxe6NijIjiJn0YGKvXY+7/vczAU1R4UzF+uZBvVM0DwQahsDPG51UF3nRokFjAdxCO0S1ZVKqf+3nkV/nFHHfR9LZrpvkgYWiqDKdI6xF+3ShW8QntJ4gfvqCQeeKJNLlK36hjHCPTgBlxTA2aj4MfYlXzj+BxIqStBcvbDlBtLlbAt7hLR9EpJ41lGtJIVpKe/6OGrt3Z59dUMHtOSRy/kmyHbZZQRNMGM/YvXBrAgNM3hCbAdgD5p9JDkn2y0mWzFdnM/LNzafUlIbKpCZwBBQUAs+ENP815SqhCQ==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0886ayF4NDr3Otr9OJiOTjT9nXFpGVE8gF+RR8qO4PqrqjUxL/1UZ4gp32eTjShQowKMUyp0QEKLFKq1h28HRYWrlUQbO/ZxPdbkb2od4/SJorJJuNxkolpGGrwzKfMUCTmAoEMTJRu0TTaBj3dhcTIhRy0EWADeGPXP0yAH/n9yCCRf7u8w/HIVOOmvvuoXE9GtPCGZq6/H85hChpwdrtOEVOoTd/83sXqsicx9eqJTp4yudVDUUFt8I5688SdJl0ZztH4PWF9lFaSZOXGW6rZN47FaruPy2FVlEP00Iy0Qx5Vg8q2OvS6Np8n7Hj6RC8wVCtEvC0B5xDfHkot6dwgpTN7JH1mTycxINcBwuJFvZkzjP4jn8dIfGjnS9lcKXa9ML5Zn3imyNiKwgrS7OsZ/+WqmoqqayCl+sR7dEzGU07YhZf41pYAw5xg9uVuZ
X-Exchange-RoutingPolicyChecked:
	aT3uCuc9rSos+ghA7dCk/ttZi//fGQvQBEKO/kUjI2lPUQ6OHqfbKI6VuO0XMFOf7YOCyU4NgHeeE1wyzgFh7+86wzHkZs5JmO4QZHrCaW3ORBYWoBBMyN5oX3K7dXfkJv3J6dYvpxJYENJKgYGmihRVMakm+37VfEqTQFDLbUMXWxsa2kIPZIFMrp5E+YpeSLH6v1Ay6aMs6kGpjx692gM7tIpVQluFgA/haHBKWWwBXPhkxAyYQr0Z4dTA0SEZle94wtPVhGJLgm00ukVUs6CjgHs8RegCDL5DjJVYdu91s+6XnSRcsg3h9/xLBy11JZHVUcpZ/tT1W5TAidYBGw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pwd3X3Jzbe6rZNkCeVI77OaJJGZs6ECbSayFbJ/Hsk0uO+tOkicMkSgdG/dBHYILR0wFjgz0XaOBEVmx2g/Obq/RvfuU/XE3yOJepJAwZJSy1/QDzKAk9iPjuuqfO2OFGTkyVI2ti3LdJDrUGRt6YDJoYqCJVntO1gmCUODfOKffX1OFEeXYRsaYpo+8exNx491tiTrgHIQsym/VHUC/rnNQrAqA+DlMbCWFqA8d8i4vy0LYk1qqWpuoMi62pXjkQfd2ZL02gPH2CEbtRLAoP5ODWEX81tWsFwGpEAYznemN7STJwclwWxVxHiTspIFHyLtmOsShyi35AI3nh5gkdD9rm6m1YCiU5GPb7jzvtoS1RQvX2j7jAfJRgf2uwVMMsemwPQcpSdk/icbXszXBjSyUGL1GR1ZFmNEdREJQNRpJdzEinOFuZxkOKWGgkWlJIFoC3/q8RR6Bn4KlEdCllRo+XCfVEM7As8Qt/En0q1FymgGFcE9F54BTPQ8klvrKCDu7nj6/S1caZq4UPIh//rM1+UhWVH8IaFDbfzqj5txJBLdU5p42PtYRfJaenQNdpRK9LAOwaHJcqrgsf7pnhN/sMq91MtGn6M1f5c6IY+PpcScNtqE9fROE5zSyDCTfVp24YwguasDVw0oAfMdKOg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 06:51:35.4710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab4f3fde-9c79-4cc2-ebd8-08deec74aab5
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR16MB4780
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2MCBTYWx0ZWRfXyjVxx1fDLe5/
 YGG+Vb80AJCWGY8BCYMflUKyCJrPdSa9lqroNOoCPxQvT0fB2TNsrpTxF6ynkrjZ7pnhUizaIWm
 y1qn5V9Kj6dymCSwEXOGhRt1UWtTcjgtYqkaZRMCWgo2VP+ZFu2s
X-Proofpoint-ORIG-GUID: WMm8tnNNs6d3kX3V7ZaKYIXRNm_wTU-H
X-Authority-Analysis: v=2.4 cv=VeXH+lp9 c=1 sm=1 tr=0 ts=6a68517d cx=c_pps
 a=3ImmgSqUqdqu0AlmHxYeZg==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=WER9OelvoqQQjwJToBYG:22 a=p0WdMEafAAAA:8
 a=cbNQJ9GKAAAA:8 a=h10IGR_9uvuIgT1K_eoA:9 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-GUID: WMm8tnNNs6d3kX3V7ZaKYIXRNm_wTU-H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2MCBTYWx0ZWRfX4mYCB70irZtV
 ntnqoLRcb3XYau+3FNJVDSuP/yHCyejuig3zIU/aPh+FeDSMxwn0AOOn7m34YDg4spWVY1lmkbn
 QGK7zjLeSc40tNtwNzVp4fh3ZuDK1VXdbW8PqaF9KiLKocOhwpNvEtK8iV4+cputu1zikkqOz/z
 E2T8NC95rXlUAN3oA/SToiJxOtA6ED0tHMqIe12FIJtI08f4SOmRrt6ApFHOIfS3bscyq41n+tq
 yoMvniWQTmMrOvii1CRw1KHPGudw+D5KqEsdgQogk4y8lwT62YdeYxrNidjaFlt+SFFwI7qzRgL
 SmFW6hGzu41oRB7/xY9OB8bLA+djGALdxeR6W8TPMnFWAbAty1Kdr1kUJ1U8PLVgXa6e864E5mx
 yo+dJNjDfTStL+IaFGiv7nSVtHphRz9EenkgP4IDBhCFPb0FKuIucYHRQItp+qovDFty/48c/vg
 v8S27VVsl2jKWh1Lc5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280060
X-purgate-ID: tlsNG-4011c0/1785221503-51EC2CFC-CCDDD354/0/0
X-purgate-type: clean
X-purgate-size: 3345

From: Denis Mukhin <dmukhin@ford.com> 

Add new CONRING_SHIFT Kconfig parameter to specify the boot console
buffer size as a power of 2.

The supported range is [14..27] -> [16KiB..128MiB].

Set default to 15 (32 KiB).

Update the documentation for 'conring_size=' command line option.

Resolves: https://gitlab.com/xen-project/xen/-/issues/185
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v7:
- n/a
---
 docs/misc/xen-command-line.pandoc |  8 ++++++--
 xen/drivers/char/Kconfig          | 21 +++++++++++++++++++++
 xen/drivers/char/console.c        |  6 +++---
 3 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 2be8772b329a..448c9bdb8254 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -425,10 +425,14 @@ The following are examples of correct specifications:
 ### conring_size
 > `= <size>`
 
-> Default: `conring_size=16k`
-
 Specify the size of the console ring buffer.
 
+The default console ring buffer size is selected at build-time via
+`CONFIG_CONRING_SHIFT` setting.
+
+The run-time console ring buffer size is the maximum of the build-time value
+and the value specified by the `conring_size=` command-line option.
+
 ### console
 > `= List of [ vga | com1[H,L] | com2[H,L] | pv | dbgp | ehci | xhci | none ]`
 
diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index 8e49a52c735b..a40a9929132b 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -95,6 +95,27 @@ config SERIAL_TX_BUFSIZE
 
 	  Default value is 32768 (32KiB).
 
+config CONRING_SHIFT
+	int "Console ring buffer size (power of 2)"
+	range 14 27
+	default 15
+	help
+	  Select the boot console ring buffer size as a power of 2.
+
+	  The run-time console ring buffer is the maximum of the build-time
+	  value and the value specified by the `conring_size=` command-line
+	  option.
+
+	  If `conring_size=` is not specified on the command line, the run-time
+	  console ring buffer size is the maximum of this value and
+	  `num_present_cpus() << (9 + xenlog_lower_thresh)`.
+
+	    27 => 128 MiB
+	    26 =>  64 MiB
+	    ...
+	    15 =>  32 KiB (default)
+	    14 =>  16 KiB
+
 config XHCI
 	bool "XHCI DbC UART driver"
 	depends on X86
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index a1b8e5f5b507..76367c1dd705 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -340,12 +340,12 @@ static void cf_check do_dec_thresh(unsigned char key, bool unused)
  * ********************************************************
  */
 
-/* conring_size: allows a larger console ring than default (16kB). */
+/* conring_size: override build-time CONFIG_CONRING_SHIFT setting. */
 static unsigned int __initdata opt_conring_size;
 size_param("conring_size", opt_conring_size);
 
-#define _CONRING_SIZE 16384
-#define CONRING_IDX_MASK(i) ((i)&(conring_size-1))
+#define _CONRING_SIZE       (1U << CONFIG_CONRING_SHIFT)
+#define CONRING_IDX_MASK(i) ((i) & (conring_size - 1))
 static char __initdata _conring[_CONRING_SIZE];
 static char *__ro_after_init conring = _conring;
 static unsigned int __ro_after_init conring_size = _CONRING_SIZE;
-- 
2.54.0


