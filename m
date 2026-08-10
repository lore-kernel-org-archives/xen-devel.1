Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A5AC5AD7B
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 23:05:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387924.1629157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtZ3b-0003Z2-Tv; Mon, 10 Aug 2026 23:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387924.1629157; Mon, 10 Aug 2026 23:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtZ3b-0003Yv-R0; Mon, 10 Aug 2026 23:05:23 +0000
Received: by outflank-mailman (input) for mailman id 1387924;
 Mon, 10 Aug 2026 23:05:22 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wtZ3Z-0003Yp-Tv
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 23:05:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtZ3Y-000xbQ-9i
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 01:05:21 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a7a5904-bab6-0a2a0a5309dd-0a2a45098308-14
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 01:05:19 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a7a592d-be1a-0a2a45090019-94a38ff16058-3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 01:05:18 +0200
Received: from pps.filterd (m0367129.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67AMogSP1811607
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 23:05:17 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11013053.outbound.protection.outlook.com
 [40.93.196.53])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4fymrs1yay-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 23:05:16 +0000 (GMT)
Received: from BY3PR10CA0028.namprd10.prod.outlook.com (2603:10b6:a03:255::33)
 by LV0PR16MB6940.namprd16.prod.outlook.com (2603:10b6:408:346::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 23:05:14 +0000
Received: from SJ1PEPF000026C9.namprd04.prod.outlook.com
 (2603:10b6:a03:255:cafe::34) by BY3PR10CA0028.outlook.office365.com
 (2603:10b6:a03:255::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 23:05:13 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 SJ1PEPF000026C9.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Mon, 10 Aug 2026 23:05:13 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67AMoeMA1320374
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 19:05:13 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4fxkhrj720-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 19:05:13 -0400 (EDT)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id tZ3Owq5eTl3RStZ3PwkwVQ; Mon, 10 Aug 2026 23:05:12 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:Message-ID:MIME-Version:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=ppford; bh=jFi6vT+G3M9XgtperboMkEKVM
	iDctPqboFi4Th2huLY=; b=q/0vVYc1/lUCXIQ6B3VT55FKMnxmRA6/VqdvTCFR3
	XhBfMF1NnIXGGkoMtKq0FmYWa0AQhFoU6A5m15oZznoOxlQxr2xYwA/cyb8xMun4
	0kuoZFNErvWjSOB6SxGsWqtSEZCAFRixwebY58A1dNe8b8m/5FKGtmiqkSPS4X4T
	zFg9Pec5XpHn4F1JQeeYR62HebfKTtMsJwhwCtbHmEN6U/OMKapCjdh0CBAV7wSB
	GWWWY76GtW4jQMQPjzO0OcX9UecC6VGtexDsO+I1FtMjGv/PINzZGn43IV17XYvq
	A7raPYefrXH9vVpMS21Jc5CCEElOdXATapHiWH/E94hvw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CJK4LVYZXNE+jeu8AxTLPM9Eo8FBjGx4fWMU1eHw5lCtNk91o4ITC3KUnblqUKS4YUBlKsb7M10YARtl81K2l/Qejz5bItNc8PdUgjfL6nla/AzRSTNv52cf6SmtPu+HrHQVwxUA02cZeFkbue3AlrCIEFoetZfGaVlg2wS2CQhOpm87B7TnKmTIAYev47E6Lo2I5pvYEf38F5d2iFrJoVk+5DuXdcor8R+ZPaMlI+o8RL3bV5DqCigVLuoYCxqitfnBUXGpe7BtcTsjfRU3kcj48+v1ZPkb5ue90AGktgs/5syhLdqlAP4Txq1n6ag69o/c8xkOErhhZqwzkiVKhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jFi6vT+G3M9XgtperboMkEKVMiDctPqboFi4Th2huLY=;
 b=BkgWCmS5dFtzg/LjBOO2JD1jugSc7hSG6QXRzxtt93ndIT7iPdvPjOEfAoauAbzNv56F+bko2r/zTPgR8ckgPrrVTifvwqjzFEijGr8ICVcz4E/Vug+gTJL6Q4BEjlmU/Zs9soEb9ll0sPuPwXsSCTcikK3/ydAWp+87s4M1f3JBWU/7x1BNb4M3qCEAS9/3Z3Xzxwqom2ZvHI4Cf3mFPndRzzEG08UWDFp1pJczKFSu2GpJeAD6AlyvKUjT6o5VlICbDC/FfPnDkvJ2ToddCjb0tKc6T0wdEcw81URzxTmCgwsowrejaEPU+EiBs5X1x9zweloBnLIUNHJjXaMNcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jFi6vT+G3M9XgtperboMkEKVMiDctPqboFi4Th2huLY=;
 b=lrsHkh3U0YWXqvn4DQ4A+bGMALFlUpq3McldWt6SCiiUsjtOAG3AsPz0UK2NPwqWJoEF2/Xb/h2gatXlIn78bVuGKRCJ4n4HuVOockAw2mzB2I2RVjMIelAHH50/O5S9s/Y7K4wdR55soSc/t63V94xQWb9KdgezkZCxGId7JfM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to; s=ppserprodsaar; bh=jFi6vT+
	G3M9XgtperboMkEKVMiDctPqboFi4Th2huLY=; b=V+VBQ6UIgCo4Uo7dkVS/hTS
	/d88oYYfv8xDkuT6GLYh1m55HjL41ln8MfojgQ4QpQGkUf6G2C2VOvwe9Ds8Xz8/
	Rr8poB9gAL6aYl/k9ezHNYi4l4RnxKScFEpdpvFm2olXLJQhcv5gIwHeFWm/DgNz
	+XSVoG/WRKwas6FcKO+KOGNpbBlEcy5DsDIXugSnajD6G3dfYjnBe+zflc+HmIfc
	Vxi+pRdjOsm9yC+rfOFjN8ofPnQlQTfGvFRS6k/TlGVJe6m5k//2hEG803uLCFQq
	Ah5IEiiMYNeBIODAOllA4hc3fIGkA/MWUCACbVX2aKwKTLF9HGYEBHRpWdqzZcQ=
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=ppfserpocford; bh=jFi6vT+G3M9XgtperboMkEKVMiDctPq
	boFi4Th2huLY=; b=JVzRaU82vKkPHpeV2+yltrENi11ncrXwTdDTALt/fS2cmqx
	S1H2YL9kVHoLNa0HlMkNvPd+v4ssSrNDHe+8L4gYCqZnOJq+LMF8hs4bFNRigMXY
	rPAxhOM82TXl058+pTBqebCl42pqvT9Zbg8MJiTAhreKudF9WmokT1apUvDtXCQb
	vFer2XCCvDfDFAuMsblzlqu7kaRIa9gZn0ZzCeUjLyHm3CUDGlkdy+cM7n8OpsI6
	ol2CL782HJ4qiXR5gNV754rV2i9Szh2fHPazrU9/xlUtm6/RGqbqIELMjXeZjkpb
	fZDiYwbkjgoWltnlkp34fqBY7cIk0QcUMQy/8dQ==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: tZ3Owq5eTl3RStZ3PwkwVQ
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v3] xen/common: add keyhandler to show Xen command line
Date: Mon, 10 Aug 2026 16:04:01 -0700
Message-ID: <20260810230359.671587-3-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100196
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C9:EE_|LV0PR16MB6940:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c6d0764d-b89f-4265-389f-08def733d5e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|13003099007|3023799007|11063799006|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vuitvFHZhYrPGf1+gKNrSbzIShxVgKZna+mzKGQGYIcXHZs7TsB4zx5IxB4MScp8CvZms9AtwyRZZZfYgjBhrbsLZfPJ0DhFkF32nqxduB1spWlSzOo9QqV7x3bZpvNAmxH2s6xNMGJb6lfjHBHMZfYLpxzxCUsZum+3gFwiYHOS+OmVjrZt6jvDg6r15m83L3jCnf6G74llYLVih7JxRjfVY1YY1TNY8o5lYFnUswRchPBzNkTjT3p8WU0CFnGVdMLhPLn4RCD+NBfChasTnkaoNi2AeyMQ2+aPAg+UzdZ9V4c5PzWnGNA7EQaQ5mcTcTLepqYRue3geLZTG9D9eLuvoLua7dvHszsYTdl3wFxxRWzwZ2KcPC2lI7xwIVW/5eau2kpb6SDznVTViYzq2tOzl+8D2UVCuoJ+VcoEJeHX7rJrLl9gJasbsHynrV21sD5IPyivVN0cs6DWFeSDh5V1b0j04L1TGCsit9TxQi1Twv6Rtl3duBKIoE3WHiH0nVNj0dz7dqNGAGgrN1G3o8hvZ7mxG5APgEUMh393zsBs14nvV+Yl4J22Edb9XMzKFKNvlqD2+djNSCa6LyDfSYpTzB82PQRhVImTycMX/kyJdtXMipGVSX3eQ8zpZWW1/Mja4af5w8kNuzfES3D9dWdHa7+DmwqkD83gHx26oKh/B8JZAtnJWkIRl07LnGdEo7yy0TmE2CN7zr1zie/e8g==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(13003099007)(3023799007)(11063799006)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Xh2/dIp+cg1QUh7LAvgK/vF8c0wXH3uVnvhmsv6ZL4mYTU4cAALOefwqtoJT+v5UXGgpQx/3KSX8hp76+8T8oZEfrBcOev6e5XnK/N0BkV9m30HBQ6bBVAyHQIibfZvmRcHf5m1AaCwz1LQS1V8vJqqkauW8meEMG1pAYOEX1E/JdPLOcPf7HzlGnCZ57y12wa9nZONCMQxAm6/9f6ewNm7RPtjqJ/d4eNN3iq5At3NwZiiLeobiipsh8oP9gou8JOLbaD8mXd/786qOzSuhhipwcAzBOnZsggdRaS0/aX0t5k5tqIbGzHNPdGyfaXYyrvrapH+F8+63o1yLN8qX17E6cfnSbgBG9hVNcgVdSbdQf2sGhOff4E0W+alNuLaxA+Ui8ZXj5ofR2oRvjBH73IxXdGbyyhgI5fnj2iW9mBVnCxfDt6d9L7Nsb1ObXYyJ
X-Exchange-RoutingPolicyChecked:
	JMfoK9UkcLjYp2xyCV+YTmMGvu3Up/iWDD+e/3aSnUbsFowLEiZmU6gtemLPVbD1QCE9Z7iHTyl83QZrScprSaatpKkyQnVde3gnT2Bi9oMGytUzGszN14iUnsXxsSrQ7dfOMCaWhlzzJRj5UkSBmtBgTI/+3DJMiyog1qEalbM5/4k6bjmUeWY4d3BavRPL+evw8OAnnhl2hkoaSvfZ80FcGlXZjV8KWEcAeDejsU3VGfUSIeW/2Cxm2Jr2gngTetoF2B6V59eRUSqOdhvDionxtudwWpbh1Lbb7XlQVvFDXYc5epMnZrw02hKFTdT61b7gBNoGaI6GKOikjOdyXA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZUIRppqxaCimA3oxTWYXsXczfbFaMpF4092OkTF6pDdZFVSAAL2ZSYpE3v6k7kdRxT+0bJwzx1rsPPDzPmz7z12ES89qAxelSBojfOXEWCRel54h4cKmCmt3uIWdmBHj6kjue1GEwQIrw0m/cCocItzInE2OsNenq5Vkqe5StjOk7E+6RgbZlcqF6wj4tqhuM0xo+3fK/3SUKmXBb7J6WLSJ+nG287bc4StN4xyiGIRV4qiO9zMY67rYkH9nwFXNSbqbZTLrRaDzh89afnUSFy9vsuAUyW6OMtDvMZIiFWoTI7GzY0jkyfV9KyPywBb9G5/gdURmobjd94BS3cbCsIFMU2Ypt08OZ/M7Yg49P60niqHUJdsuYsJp9zD6H1WVEmTb0A+1OnyLK9zYhK0tiCS8BLdFV7k2Kedvk4pzLbmsk6wsqxUn0iZYNvJR2KWWJCdUvm038DNGXJXsVgIM2lFb9znay+vHEvP564WH/Uc8tm0A5K+VZVIcD6gnYWoiyxbhrzmyiw/ouhq9x83G/w79WTs0i76E+bT5TJpboOx6IvCkpNu+soYfF0BIcZ6KcKcNXc0Z1UjwGit1g2yVGq8BM7/klyhLPKj5+lf8+sqqCH/JSoFFBfHqnL764yFoWOS/RitF7RFQpY/+feR3Nw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 23:05:13.6425
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d0764d-b89f-4265-389f-08def733d5e2
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR16MB6940
X-Authority-Analysis: v=2.4 cv=NtbhtcdJ c=1 sm=1 tr=0 ts=6a7a592c cx=c_pps
 a=5zjvB78PlnLPEzvzEo0MXg==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=X3KReqg2EL6A36SYCKpz:22 a=VwQbUJbxAAAA:8
 a=cbNQJ9GKAAAA:8 a=p0WdMEafAAAA:8 a=IgJ0wlFFhhnA7GDi3u4A:9
 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-ORIG-GUID: cRh6SSY4zNNWz4sP3tox7hMakk_HzU5p
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDE5NiBTYWx0ZWRfX4bkUozXC1RCu
 EqKkQt18PKdj/Iwu1iVuwMcbsrKzGsW802GcxTvM4l8jKz1SNfEvvj9kvWjpv7e948qtjOjphdW
 rRbVvLzsJpNnNSqBFV2scu1w41sR55RdJV7rbN1W6E+bT96VYJ7t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDE5NiBTYWx0ZWRfX3UvjMoyS0g6u
 4Bl82loIoDqYwcGZgih2vFYmEsQ+HAOrUNKk0YCw6llVdsJOG7BsylcV8/6ya3EpewQfenYxY6e
 6seyXINwnmPrg+OvmFLHGBUdELjiKAI6tUYlXOggpw151aIMJtv/5ggnts7uNqrh9SXDBdIrcyA
 EXCzGPvauYa+NgA+8zei8BTQ2UI7n46eDueBSwX67NTIRxyhO8soAzcnhYo31PPKgd9MWaHOoh1
 WeBNJSxeDWBgfCbxbWXgmK7pFD1UFJcKUq/nI1W5d1xHJdlr/24CNcVde+MjNitS15AlxFkmaFd
 OeWqqjShLA9sGWJp12eElmU5Izlyo9YzraIY9E5dYcurcYiIUK9t9CoJvy1HRgyX33Jb+hOcPrh
 nW2vip5oHJjJ1Hl9sdydKvcgYl039bGLAKhVJ5e4iGr9ukRn88tg2PqL2FBYdE0ZjXkxSMUu/LZ
 JyDE2SHxyL8r1fTC0+g==
X-Proofpoint-GUID: cRh6SSY4zNNWz4sP3tox7hMakk_HzU5p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100196
X-purgate-ID: tlsNG-bad1c0/1786403119-BECDF034-E28B115F/0/0
X-purgate-type: clean
X-purgate-size: 1712

From: Denis Mukhin <dmukhin@ford.com> 

Currently there's no way to print Xen command line on the emergency
console for debugging purposes when 'xl' is not unavailable.

Add new keyhander 'X' to do command line printout.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v2:
- account for CONFIG_CMDLINE_OVERRIDE case
- use IS_ENABLED()

v2: https://lore.kernel.org/xen-devel/20260803070047.3097846-3-dmukhin@ford.com/
CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2748655201
---
 xen/common/kernel.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index d1bef9ac2b2b..54a7ee6f68e5 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -5,6 +5,7 @@
  */
 
 #include <xen/init.h>
+#include <xen/keyhandler.h>
 #include <xen/lib.h>
 #include <xen/errno.h>
 #include <xen/param.h>
@@ -505,6 +506,25 @@ static int __init cf_check param_init(void)
 __initcall(param_init);
 #endif
 
+static void cf_check show_hypervisor_info(unsigned char key)
+{
+    printk("'%c' pressed -> showing hypervisor information\n", key);
+
+    if ( IS_ENABLED(CONFIG_CMDLINE_OVERRIDE) )
+        printk("Bootloader command line ignored (CONFIG_CMDLINE_OVERRIDE=y)\n");
+    else
+        printk("Command line: %s\n", saved_cmdline);
+}
+
+static int __init cf_check misc_init(void)
+{
+    register_keyhandler('X', show_hypervisor_info,
+                        "show hypervisor information", 0);
+
+    return 0;
+}
+__initcall(misc_init);
+
 static long xenver_varbuf_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     struct xen_varbuf user_str;
-- 
2.54.0


