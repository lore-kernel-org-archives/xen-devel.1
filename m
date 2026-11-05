Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E97606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=dstgd3V7;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=JXFPvEKc;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=g+YVPgGx;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=qgCDHBae
Received: from list by lists.xenproject.org with outflank-mailman.1473494.1681207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmRM-0002c1-5f; Thu, 05 Nov 2026 01:38:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473494.1681207; Thu, 05 Nov 2026 01:38:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmRM-0002bl-0b; Thu, 05 Nov 2026 01:38:56 +0000
Received: by outflank-mailman (input) for mailman id 1473494;
 Thu, 05 Nov 2026 01:38:54 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmRJ-0002Bx-UD
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:38:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmRJ-00CQpG-31
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:38:53 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebde11-bab6-0a2a0a5309dd-0a2a450a8416-24
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:38:53 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebde2b-f2d2-0a2a450a0019-94a392173334-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:38:52 +0100
Received: from pps.filterd (m0367124.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mW5r1469725
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:38:51 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11010020.outbound.protection.outlook.com [52.101.201.20])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hrdk51295-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:38:50 +0000 (GMT)
Received: from CY8PR19CA0028.namprd19.prod.outlook.com (2603:10b6:930:6::6) by
 CO6PR16MB4020.namprd16.prod.outlook.com (2603:10b6:303:a4::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.10; Thu, 5 Nov 2026 01:38:46 +0000
Received: from PH3PEPF0005961D.namprd05.prod.outlook.com
 (2603:10b6:930:6:cafe::5b) by CY8PR19CA0028.outlook.office365.com
 (2603:10b6:930:6::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:38:46 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 PH3PEPF0005961D.mail.protection.outlook.com (10.167.243.27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:38:46 +0000
Received: from pps.filterd (m0426315.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mP183108414
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:38:45 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4hp33swb48-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:38:45 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id OmR9xukLqz55iOmR9xXN7N; Thu, 05 Nov 2026 01:38:44 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=wPk
	5MiQpW3L4/cUn6ZNGOeDWfT7+2sCu03MdvRd5xzk=; b=dstgd3V7sEztBcDJOxh
	/68m4DNxUNu/jb/zpVa4RKIVEzewdXYLTEgt6ckfyX/i+/hF69Od32V9vkXF9ugb
	WH78sGnIdbQ2sRdLKeG53hQu4hsMjSZiQaOjoPUan0VUCwbc7IR5KYqcVUYtMAM+
	mh46dIKxfCiSV7R4rjGYpDBzDxX3sRs5TcfqlKb869SV12pOP7SEUbQCe1EFEMrk
	XaYRs4sICwYPVo65aGxN9wmdE3qkMN+vjHb+Jk7OakWvKi87DJxRsPM8Eu1INvwO
	6LfgnV1KvbqK9VGTyEIudXVXI8Tgl5e+9vgLEcaAG/IhNfb1FuN1aeOsW6yEbQZc
	9cA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/3XnYa9VLUYeGGwkcOH+SMh22RJRNrM65iZYx2uuJTVCwX+S7+cp+fPy2FF4rLp/IK0n2jvDazGBnWt3J5qfTndxFdFrQYk03Nlf1XEZotXUMYQ4wxB3tyyni+GYd6GHyoI7Qq+hWM1dgkUGrtgELrZk2C3Wq5MFI5SRvbF2TQzivSJyHHidOm/elZytCDKDT9RO5UZM1TGL7QkgIo23oqL3rARTfCx7LK6zItt+GQPv01pmiCeVBBEIryit8TKkLJIZH4DmjjGj1iyIgbOfdLHxFCdX3qIAkdTzAguh8xEQArtrDN6RlgxO23wmxsZSxzgfyrGraYe92IRH46KaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wPk5MiQpW3L4/cUn6ZNGOeDWfT7+2sCu03MdvRd5xzk=;
 b=CeoZErfFdWT9vE39wiFnQ0DIet2uumiotrkG2rf1jAMZJSnOQaDgUqEvLmeDbCB11W5FAsHn/Z/zGn2nJMjK013mtweebeZf/WXuUf5w0oLFlQwB0pkAF1SLXuYyfp4SkT7Vt50gmAMfG+jNMqq5wUQNH4Ac7f0pcAc5L2u6vZTeOZZmbvkO2X0yKBar2BjAMae2sdsZhWBY7gSZv/BjVQAIUcTEQ0cpsdlm+Ion8mdeN0evlKCHjhFFD18gkGovAktxcmulorq4car2pcnu21dtAz6QeV6mRiECZUD7gECKLHGHFiG2KSjVW7+c2FOB0bP3NCdvo/7s/8RwctPZ1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wPk5MiQpW3L4/cUn6ZNGOeDWfT7+2sCu03MdvRd5xzk=;
 b=JXFPvEKc7hiLiiCuHvYLb57Fq+JxHJ0+ahEx1hNbh7sbx1QyIw8dxo12vQbPQ3/quE1nr10SIQDBDKcvGb7vCbSeQoXpoUrcjYUPPrd7fHEyA0Yxgnn5b1bZ8GAjMdTKtlhX7wW4q9ZadwkiLXl0SZ8xOQYn0z+GVtGp3dXjyFU=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 148.163.138.245) smtp.mailfrom=ford.com; dkim=pass (signature was
 verified) header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	ppserprodsaar; bh=wPk5MiQpW3L4/cUn6ZNGOeDWfT7+2sCu03MdvRd5xzk=; b=
	g+YVPgGxl1ziyOcXGucZZbyZVhvSAa0AWGOaayI0ThS5g/9BQw12lDIfZKWKZQpW
	AR6xG0MrPeMZDOGaJjw6EJDtBSj7nWbRT+AJwpBnKZa3ikUkEDosozvBptyvHTX7
	+Jcg1uB4w+kVFgiHBzAdhMXcpEmQBbiwbS2FDokcoXn3dSho0/Iot3q0yNWIZqvI
	XEcQDlddbJG95WCGNM1tLObgs2NoCnDRqPPSquDjbKcrAKmzcJIvOfuMa7dCDsLa
	gwtc3BWQLA2erc7RIhqcO5or1DqTH7dbl8dkGZ4VN8cSZXelV4dvm5aPpz23aTPK
	4hsp5yUWkWEI9dwXnurQhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=wPk5MiQ
	pW3L4/cUn6ZNGOeDWfT7+2sCu03MdvRd5xzk=; b=qgCDHBae+828qas9eqQRh+T
	MrmjaZ+itfkjcebQ1i3HqpTNZvv7LQCqmpEJTUL2jj3Xeuw1usff9AKaD/a/WAhs
	CD16U8WMXdiD5Uutj8cgyyrQaC1aIrMXnk/gkCk6ZsIh3z9drQJYD6j+WvX3bDBR
	kURSFLSsSDTuVN2qMMOMM92NITHSZrn3S/wSp75SNmjMiJXUldyem0qR9mhUfVFf
	FtLJZWFp2UCyVkTnUQYfZCw4bGtnbMCVn7Xa3Re5FAbdnoIdlj1CGuJZ5uvuen47
	is1uLbiN8kULMDVos4ZQoWM2xbyywKnpAshnJBV32UUztqvlEvvcIkckqEWTJuw=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmR9xukLqz55iOmR9xXN7N
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [XTF PATCH v1 08/15] common: add primitives for measurements
Date: Wed,  4 Nov 2026 17:38:10 -0800
Message-ID: <20261105013817.719823-9-dmukhin@ford.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105013817.719823-1-dmukhin@ford.com>
References: <20261105013817.719823-1-dmukhin@ford.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050006
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PEPF0005961D:EE_|CO6PR16MB4020:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1cd60091-5abc-4dd0-2ce8-08df3add8891
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|6133799003|10067099003|22082099003|18002099003|56012099006|11063799006|261022115727099003|261022105027099003|261022075727099003|261102123227099003|261028144727099003|261026140227099003|261021121427099003|261009223027099003|260925022911599003|260925021911599003|260925021311599003;
X-Microsoft-Antispam-Message-Info:
	Armf5Z4UqJ6fy5QB/H/lmln3CDFuvJzlL6UVLFy0kb4ECGQRE8c0DqFvNJYuGJJuXiDrpF8U6T3IWEoUADnwGnLP/h1iFu9nsF7u88t8iBk2kBUbQ9Syo3vzHhDPhgrPTqpIeTLQ68zaR16lQBbqS1SU1CnBIJKJuQwS7dOG85jhRes+S8guy8ha2xVKITlYjcYcGVD5UMt5R+TCJjboAvFDfFvJWeH2zzdqKnkV9kORaF+7uFeoxQ22U8GNyyXtYOIIruJY/7ISCP2oj3A2D0L2ua9bMTbYs2k3s94lbC5xbag+/Fg6Z6nqTymCGNEa+QEG1IWq0pNJJBzhTuC7ko0TtZViCyccCTtzKa9FRowq5Uv8BN8nSW/vAgxLewI7gGkzzEjVOSkRBDcgbeaUV1D4lHV7gWq2XD4HzkacCxnaUAbpsK/l+mpcDFBfzJC9Un+cXMPy6Vz3BckClDEifb0nMuy64rVvcRaD23VdehYitRko0gZ9LeqRq8P+iUpUhpFZOnRchCl3M85j26rknyWeIVdWvdldHKl50M6O6m2ZZxik8tickkt6VEFJxF21spgb32uV/aE1rSFb2GF6VgIT+U95OsU5yDtnJQ057TN8jt2PB2hfHySUKW66MhK0JiDy2Uim1wd8+BGzT5RSExINOY/QDGyTPgOGS26IiNx84FioNVOKyKl91xrsQK+ghjIe1m/OdGS2EW5Qq9XtCA==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(261022115727099003)(261022105027099003)(261022075727099003)(261102123227099003)(261028144727099003)(261026140227099003)(261021121427099003)(261009223027099003)(260925022911599003)(260925021911599003)(260925021311599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BifAZB8Hai80RrDtvWedhzUz1IyYMCN1ZcSppHVXpNm+arGAe++0xIBV6oua88Ie6jqgckNZOC5q4bOz3ky/CObcInYIlt/n0D0btgeBbXm9jsYYy2j8JbGUZdILPN1uzokI+Fx5cCyZ60f1bZI80Uf6OimKSciVwrtX+0ci29B5WYf1PNK5kb71XceJurE2JVOIPusiunjrq+U1lpzBEuoD7cn/9GP7/EskuJbZmtGxQWR5h6Sf/JyFQjEeb0bvsddGmngy3noYUBf4DI4d94glYKxJgc9nJN56BzLQ0W8P/c2S1VNdmDt/F4i4nksbU0UN0cUeQIw0s1pPJn/15vwO3nqnxzPzKZyoVvCDRRE08gA+0U68YoUg9VrWPnKF6twg1S8B3s69pUiqAx3jnviObObFvrlMTX4jyHDnS39H6GsVAAKPvHm85u68U7t2
X-Exchange-RoutingPolicyChecked:
	ZM+a7rNOxoIU3BfCFqHlm9wVAdL/KIcgf3sXJCsXLu1cbuZY43l8uH5ad3I2pDpV+miPl5O708CGEeXqH5rcL8DQsjARwQTfWR/VgWd2EmkRPe1wWifheje7RLOYPri7eBELeECzkcLHBm9qun2tNpZqM52YHFrZzfjSCYtWNblQWCdHQ8xP5zgamLDAga0JUv2dZyx4VDYl2dMmyw09kCB9MBfcSf/j3iaghLR4wMn44pKSMX15exE5YXyI0kCoWlfEIhakXgHgdL/EDfBGqQpDQV5EAGndwflC4r60K3foHSle8IW+39BDFKtV7v5cJ6jZ01n6026cfcKhkuYYnA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TTuZr/uwaR5PxHjE6r+bVRNNOnKWEzMaKMjvNBEjsYlrGGMAiuODNKxKP/kVUoqyD2Se3F9cw9xymuVTF4nhZDutsKyVDYbpqCPNhEWQQ1dSgWy2eUkW+/Rrmkz7xNnmg/wWoY8vwzkfzhArrcyD23ukkR7gvdEN1k+Lvd/nRg1CO2gfzmI/WLtL7VXmioLZXll3AXCG2XwFyD0KcaqADcaf8ichCGjZYzGhzzDCmPj6H4OXuVVkEo3IEiDRlYVJCmn/lt/S9Bx3CjAys+BGr5548AsbcoW7GHnjlQSMbGhdcnp48nbTbbG6vrOVxkXFjZHEgcIwV4+HksrHu/4elRimTitr2hB83Ak123buKGVzyhjdsuXzTu2FPNXEr3Wq3BmstXb6P6a0nRxEAhXLwBVa2h9HDIMpYNHbgdEn70en4V/iKESQdi3gus8X3BRhVY3Fq9NYyXESGkH/4x2vrX8vuoGbm2mkxziuRtu0Pl0CYFvJQPcoslg+fiqVniBAs9rULemKiJqTLwl0OH9pFu2lAZqzx503a47NMI4/8lUJ5KNLr6UvVRUJpLazYPqXZEmnBlvv2rGYokvHA/TOzn9NWCtVPKxRMfJCpWS4lBSYFgOy9heAhbdwN3roSDaOfoGLBwjKSCvor7ccXoXbQg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:38:46.1636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd60091-5abc-4dd0-2ce8-08df3add8891
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH3PEPF0005961D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR16MB4020
X-Proofpoint-GUID: ZuyTCo__SJEOOeifXxqjEyv6IjKimppe
X-Proofpoint-ORIG-GUID: ZuyTCo__SJEOOeifXxqjEyv6IjKimppe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX5YuU3NBxo4Hv
 n3DqGVwnPWkmi+oiUlO4XD0+VxPFLV2dGHxH1tKrryzbxVbRGfkKepUHM3uoayL9oTvt7qJGV+9
 +2wLcstFPkTlhKAmwYZslXBxjLHAYFoaEqLTilSeBEWd9WVIEO/j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX6W1JEStfKAkd
 XlRmYqbEe5Su5dVy8JQqWGJtk9Ple5M46vyg8qwBeEpWrmLH6Dm0CMiJl+b0CQhPpQiDDfQVQhk
 jRiikK58BQPQAzhET+31u8EjkWgGSpdr5cwts0Jlj+0da6K/vul1xThXKEEmi1g6Cs9GTjlJeYx
 S9/wJ3msCoHG5Tt5kjoppRyyAR73ax6B1bb3g0GiqshMkuNIFdEGt1hFP3EjORyos1EdH/He3Pn
 6Z9KcfLh7KrmvmE+BiMAVtpxIvE0j0UstNzUPlULEH8MtTTGZJzgnnp62KqXkxMm0adqjPZPNDR
 xEaRHxeRHi1qi739S+AE5MY6QMuFEjoubvh0lnLDSBBDg56WbKqEjUc7Tt45V4S6JL+xoWSjUQS
 ioR3ao6nx+EuIHPZjG2wZMu5txVLChh8q86QcYCGg+uyCZG9fjnpsIF/5lu45Mb60MDm0lY1AtM
 N2xl9AAhz5lJlpSUKyQ==
X-Authority-Analysis: v=2.4 cv=BOImP1QG c=1 sm=1 tr=0 ts=6aebde2a cx=c_pps
 a=RzNzSA3Xhmsnv5027CV2rw==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=YJXg7OVxOWrJwj3yZo-i:22 a=cbNQJ9GKAAAA:8
 a=MNfMRlR0M0Ee9eYNpn8A:9 a=G69WFyCBNqGPyalROSdv:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050006
X-purgate-ID: tlsNG-4011c0/1793842733-51CC3CFC-7AD9DD13/0/0
X-purgate-type: clean
X-purgate-size: 12645
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Add new module (hvm64 only) to enable measurements aggregation and
printing from the XTF.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 build/files.mk           |   1 +
 common/statistics.c      | 364 +++++++++++++++++++++++++++++++++++++++
 include/xtf/statistics.h |  23 +++
 3 files changed, 388 insertions(+)
 create mode 100644 common/statistics.c
 create mode 100644 include/xtf/statistics.h

diff --git a/build/files.mk b/build/files.mk
index 11624a89a21c..8a7d6f8d588f 100644
--- a/build/files.mk
+++ b/build/files.mk
@@ -55,4 +55,5 @@ $(foreach env,$(32BIT_ENVIRONMENTS),$(eval obj-$(env) += $(obj-32)))
 
 # 64bit specific objects
 obj-64  += $(ROOT)/arch/x86/entry_64.o
+obj-64  += $(ROOT)/common/statistics.o
 $(foreach env,$(64BIT_ENVIRONMENTS),$(eval obj-$(env) += $(obj-64)))
diff --git a/common/statistics.c b/common/statistics.c
new file mode 100644
index 000000000000..00292d97c8cb
--- /dev/null
+++ b/common/statistics.c
@@ -0,0 +1,364 @@
+#include <xtf/lib.h>
+#include <xtf/statistics.h>
+#include <xtf/time.h>
+#include <xtf.h>
+
+#define HIST_WIDTH 50
+
+static const uint64_t bucket_limit[] = {
+    /* 0 .. 10, step 1. */
+    1ull, 2ull, 3ull, 4ull, 5ull,
+    6ull, 7ull, 8ull, 9ull, 10ull,
+
+    /* 10 .. 100, step 10. */
+    20ull, 30ull, 40ull, 50ull, 60ull,
+    70ull, 80ull, 90ull, 100ull,
+
+    /* 100 .. 500, step 10. */
+    110ull, 120ull, 130ull, 140ull, 150ull,
+    160ull, 170ull, 180ull, 190ull, 200ull,
+    210ull, 220ull, 230ull, 240ull, 250ull,
+    260ull, 270ull, 280ull, 290ull, 300ull,
+    310ull, 320ull, 330ull, 340ull, 350ull,
+    360ull, 370ull, 380ull, 390ull, 400ull,
+    410ull, 420ull, 430ull, 440ull, 450ull,
+    460ull, 470ull, 480ull, 490ull, 500ull,
+
+    /* 500 .. 1000, step 50. */
+    550ull, 600ull, 650ull, 700ull, 750ull,
+    800ull, 850ull, 900ull, 950ull, 1000ull,
+
+    /* 1000 .. 5000, step 100. */
+    1100ull, 1200ull, 1300ull, 1400ull, 1500ull,
+    1600ull, 1700ull, 1800ull, 1900ull, 2000ull,
+    2100ull, 2200ull, 2300ull, 2400ull, 2500ull,
+    2600ull, 2700ull, 2800ull, 2900ull, 3000ull,
+    3100ull, 3200ull, 3300ull, 3400ull, 3500ull,
+    3600ull, 3700ull, 3800ull, 3900ull, 4000ull,
+    4100ull, 4200ull, 4300ull, 4400ull, 4500ull,
+    4600ull, 4700ull, 4800ull, 4900ull, 5000ull,
+
+    /* 5000 .. 10000, step 100. */
+    5100ull, 5200ull, 5300ull, 5400ull, 5500ull,
+    5600ull, 5700ull, 5800ull, 5900ull, 6000ull,
+    6100ull, 6200ull, 6300ull, 6400ull, 6500ull,
+    6600ull, 6700ull, 6800ull, 6900ull, 7000ull,
+    7100ull, 7200ull, 7300ull, 7400ull, 7500ull,
+    7600ull, 7700ull, 7800ull, 7900ull, 8000ull,
+    8100ull, 8200ull, 8300ull, 8400ull, 8500ull,
+    8600ull, 8700ull, 8800ull, 8900ull, 9000ull,
+    9100ull, 9200ull, 9300ull, 9400ull, 9500ull,
+    9600ull, 9700ull, 9800ull, 9900ull, 10000ull,
+
+    /* 10000 .. 100000, step 1000. */
+    11000ull, 12000ull, 13000ull, 14000ull, 15000ull,
+    16000ull, 17000ull, 18000ull, 19000ull, 20000ull,
+    21000ull, 22000ull, 23000ull, 24000ull, 25000ull,
+    26000ull, 27000ull, 28000ull, 29000ull, 30000ull,
+    31000ull, 32000ull, 33000ull, 34000ull, 35000ull,
+    36000ull, 37000ull, 38000ull, 39000ull, 40000ull,
+    41000ull, 42000ull, 43000ull, 44000ull, 45000ull,
+    46000ull, 47000ull, 48000ull, 49000ull, 50000ull,
+    51000ull, 52000ull, 53000ull, 54000ull, 55000ull,
+    56000ull, 57000ull, 58000ull, 59000ull, 60000ull,
+    61000ull, 62000ull, 63000ull, 64000ull, 65000ull,
+    66000ull, 67000ull, 68000ull, 69000ull, 70000ull,
+    71000ull, 72000ull, 73000ull, 74000ull, 75000ull,
+    76000ull, 77000ull, 78000ull, 79000ull, 80000ull,
+    81000ull, 82000ull, 83000ull, 84000ull, 85000ull,
+    86000ull, 87000ull, 88000ull, 89000ull, 90000ull,
+    91000ull, 92000ull, 93000ull, 94000ull, 95000ull,
+    96000ull, 97000ull, 98000ull, 99000ull, 100000ull,
+
+    /* 100000 .. 1000000, step 50000. */
+    150000ull, 200000ull, 250000ull, 300000ull, 350000ull,
+    400000ull, 450000ull, 500000ull, 550000ull, 600000ull,
+    650000ull, 700000ull, 750000ull, 800000ull, 850000ull,
+    900000ull, 950000ull, 1000000ull,
+
+    /* Coarse tail buckets. */
+    10000000ull, 100000000ull, 1000000000ull, ~0ull,
+};
+
+_Static_assert(ARRAY_SIZE(bucket_limit) == NR_BUCKETS,
+               "NR_BUCKETS must match bucket_limit[]");
+
+/* First bucket whose upper limit is strictly greater than sample. */
+static unsigned int find_bucket_gt(uint64_t sample)
+{
+    unsigned int lo = 0, hi = NR_BUCKETS - 1;
+
+    while ( lo < hi )
+    {
+        unsigned int mid = lo + (hi - lo) / 2;
+
+        if ( sample < bucket_limit[mid] )
+            hi = mid;
+        else
+            lo = mid + 1;
+    }
+
+    return lo;
+}
+
+void xtf_add_sample(struct statistics *s, uint64_t sample)
+{
+    if ( sample < s->min )
+        s->min = sample;
+
+    if ( sample > s->max )
+        s->max = sample;
+
+    s->sum += sample;
+    s->count++;
+    s->bucket[find_bucket_gt(sample)]++;
+}
+
+/* Nearest-rank percentile, expressed as a rational number. */
+static unsigned int get_bucket_by_quantile(const struct statistics *s,
+                                           unsigned int numerator,
+                                           unsigned int denominator)
+{
+    uint64_t target, seen = 0;
+    unsigned int i;
+
+    if ( !s->count )
+        return 0;
+
+    target = (s->count / denominator) * numerator;
+    target += ((s->count % denominator) * numerator + denominator - 1) /
+              denominator;
+
+    for ( i = 0; i < NR_BUCKETS; ++i )
+    {
+        seen += s->bucket[i];
+
+        if ( seen >= target )
+            return i;
+    }
+
+    return NR_BUCKETS - 1;
+}
+
+static uint64_t get_bucket_value(unsigned int bucket)
+{
+    /* Last bucket is open-ended; report its lower bound. */
+    if ( bucket >= NR_BUCKETS - 1 )
+        bucket = NR_BUCKETS - 2;
+
+    return bucket_limit[bucket];
+}
+
+/*
+ * Choose units by magnitude while preserving nanosecond precision:
+ *   < 1 us: integer ns
+ *   < 1 ms: us with three fractional digits
+ *  >= 1 ms: ms with six fractional digits
+ *
+ * Select units independently for each histogram boundary.
+ */
+enum time_unit {
+    TIME_NS,
+    TIME_US,
+    TIME_MS,
+};
+
+static enum time_unit get_time_unit(uint64_t ns)
+{
+    if ( ns >= 1000000 )
+        return TIME_MS;
+
+    return ns >= 1000 ? TIME_US : TIME_NS;
+}
+
+/* Fixed-width time field for histogram and summary columns. */
+static void print_time_field(uint64_t ns)
+{
+    switch ( get_time_unit(ns) )
+    {
+    case TIME_NS:
+        printk("%15"PRIu64" ns", ns);
+        break;
+
+    case TIME_US:
+        printk("%11"PRIu64".%03"PRIu64" us",
+               ns / 1000, ns % 1000);
+        break;
+
+    case TIME_MS:
+        printk("%8"PRIu64".%06"PRIu64" ms",
+               ns / 1000000, ns % 1000000);
+        break;
+    }
+}
+
+static void print_metric_value(const char *op, uint64_t cycles)
+{
+    printk("%2s %12"PRIu64"  ", op, cycles);
+    print_time_field(cycles_to_ns(cycles));
+}
+
+void xtf_print_histogram(const struct statistics *s)
+{
+    uint64_t low = 0, hits = 0, peak = 0;
+    unsigned int i, entries = 0;
+
+    for ( i = 0; i < NR_BUCKETS; ++i )
+        if ( s->bucket[i] > peak )
+            peak = s->bucket[i];
+
+    for ( i = 0; i < NR_BUCKETS; ++i )
+    {
+        uint64_t count = s->bucket[i];
+
+        if ( count )
+        {
+            uint64_t pct;
+            unsigned int width, j;
+
+            hits += count;
+            entries++;
+
+            /* Per-bucket percentage rounded to 0.00001%. */
+            pct = (count * 10000000ull + s->count / 2) / s->count;
+
+            /* Round up and show at least one marker for a nonempty bucket. */
+            width = (count * HIST_WIDTH + peak - 1) / peak;
+
+            if ( i == NR_BUCKETS - 1 )
+                printk("  >=%12"PRIu64"%12s", low, "");
+            else
+                printk("%12"PRIu64" .. %12"PRIu64,
+                       low, bucket_limit[i] - 1);
+
+            printk(" | ");
+
+            if ( i == NR_BUCKETS - 1 )
+            {
+                printk("  >=");
+                print_time_field(cycles_to_ns(low));
+                printk("%18s", "");
+            }
+            else
+            {
+                print_time_field(cycles_to_ns(low));
+                printk(" .. ");
+                print_time_field(cycles_to_ns(bucket_limit[i] - 1));
+            }
+
+            printk(" | ");
+
+            for ( j = 0; j < HIST_WIDTH; ++j )
+                printk("%c", j < width ? '#' : ' ');
+
+            printk(" | %3"PRIu64".%05"PRIu64"%% | %10"PRIu64"\n",
+                   pct / 100000, pct % 100000, count);
+        }
+
+        if ( i != NR_BUCKETS - 1 )
+            low = bucket_limit[i];
+    }
+
+    ASSERT( hits == s->count );
+
+    printk("\nTotals:\n");
+    printk("    Hits: %"PRIu64"\n", s->count);
+    printk("    Entries: %u\n", entries);
+    printk("\n");
+}
+
+void xtf_finalize_statistics(struct statistics *s)
+{
+    s->p99 = get_bucket_value(get_bucket_by_quantile(s, 99, 100));
+}
+
+enum metric_id {
+    METRIC_MIN,
+    METRIC_AVG,
+    METRIC_P50,
+    METRIC_P99,
+    METRIC_P999,
+    METRIC_P9999,
+    METRIC_P99999,
+    METRIC_MAX,
+};
+
+static const struct {
+    const char *name;
+    unsigned int numerator, denominator;
+} metric[] = {
+    [METRIC_MIN]    = { "min",     0,     0 },
+    [METRIC_AVG]    = { "avg",     0,     0 },
+    [METRIC_P50]    = { "p50",    50,   100 },
+    [METRIC_P99]    = { "p99",    99,   100 },
+    [METRIC_P999]   = { "p99.9", 999,  1000 },
+    [METRIC_P9999]  = { "p99.99", 9999, 10000 },
+    [METRIC_P99999] = { "p99.999", 99999, 100000 },
+    [METRIC_MAX]    = { "max",     0,     0 },
+};
+
+static void print_metric_column(const struct statistics *s, unsigned int id)
+{
+    uint64_t cycles;
+    const char *op = "";
+
+    if ( !s->count )
+    {
+        printk("%2s %12s  %18s", "", "-", "-");
+        return;
+    }
+
+    if ( id == METRIC_MIN )
+        cycles = s->min;
+    else if ( id == METRIC_AVG )
+        cycles = s->sum / s->count;
+    else if ( id == METRIC_MAX )
+        cycles = s->max;
+    else
+    {
+        unsigned int bucket = get_bucket_by_quantile(
+            s, metric[id].numerator, metric[id].denominator);
+
+        op = bucket == NR_BUCKETS - 1 ? ">=" : "<";
+        cycles = get_bucket_value(bucket);
+    }
+
+    print_metric_value(op, cycles);
+}
+
+void xtf_print_metrics(const struct statistics *s, const struct statistics *t)
+{
+    unsigned int i;
+
+    if ( t )
+    {
+        printk("A: %s (%"PRIu64" samples)\n", s->name, s->count);
+        printk("B: %s (%"PRIu64" samples)\n", t->name, t->count);
+    }
+    else
+        printk("%s (%"PRIu64" samples)\n", s->name, s->count);
+
+    if ( t )
+    {
+        printk("%-8s %2s %12s  %18s", "metric", "", "cycles A", "time A");
+        printk(  " | %2s %12s  %18s",           "", "cycles B", "time B");
+    }
+    else
+        printk("%-8s %2s %12s  %18s", "metric", "", "cycles",   "time");
+
+    printk("\n");
+
+    for ( i = 0; i < ARRAY_SIZE(metric); ++i )
+    {
+        printk("%-8s ", metric[i].name);
+        print_metric_column(s, i);
+
+        if ( t )
+        {
+            printk(" | ");
+            print_metric_column(t, i);
+        }
+
+        printk("\n");
+    }
+}
diff --git a/include/xtf/statistics.h b/include/xtf/statistics.h
new file mode 100644
index 000000000000..e074435ed5ad
--- /dev/null
+++ b/include/xtf/statistics.h
@@ -0,0 +1,23 @@
+#ifndef __XTF_STATISTICS_H_
+#define __XTF_STATISTICS_H_
+
+#include <stdint.h>
+
+#define NR_BUCKETS  271u
+
+struct statistics {
+    uint64_t bucket[NR_BUCKETS];
+    uint64_t min;
+    uint64_t max;
+    uint64_t p99;
+    uint64_t sum;
+    uint64_t count;
+    const char *name;
+};
+
+void xtf_add_sample(struct statistics *s, uint64_t sample);
+void xtf_finalize_statistics(struct statistics *s);
+void xtf_print_histogram(const struct statistics *s);
+void xtf_print_metrics(const struct statistics *s, const struct statistics *t);
+
+#endif /* __XTF_STATISTICS_H_ */
-- 
2.55.0


