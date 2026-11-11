Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9FE606A321
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 19:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=YVcy0toV;
	dkim=pass (1024-bit key) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=DfzHaWku;
	dkim=pass (2048-bit key) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=VXNBic7D;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=LzWDqQbs
Received: from list by lists.xenproject.org with outflank-mailman.1484852.1688235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREK9-0007Q2-MO; Wed, 11 Nov 2026 19:49:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484852.1688235; Wed, 11 Nov 2026 19:49:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREK9-0007Pi-Cm; Wed, 11 Nov 2026 19:49:37 +0000
Received: by outflank-mailman (input) for mailman id 1484852;
 Wed, 11 Nov 2026 19:49:36 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xREK8-0007Hw-2t
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 19:49:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xREK7-004SfK-Fp
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 20:49:35 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c6b3-8faa-0a2a0a5109dd-0a2a450ba22c-22
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:49:35 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c6cd-b7e8-0a2a450b0019-94a3921718ce-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:49:35 +0100
Received: from pps.filterd (m0367126.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIYVSZ878259
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:49:33 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com
 (mail-centralusazon11010040.outbound.protection.outlook.com [52.101.61.40])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hvsu3u5q9-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:49:33 +0000 (GMT)
Received: from DS1PR06CA0018.namprd06.prod.outlook.com (2603:10b6:8:23e::10)
 by MW5PR16MB4716.namprd16.prod.outlook.com (2603:10b6:303:194::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 11 Nov
 2026 19:49:10 +0000
Received: from MWH0EPF000D8953.namprd05.prod.outlook.com
 (2603:10b6:8:23e:cafe::59) by DS1PR06CA0018.outlook.office365.com
 (2603:10b6:8:23e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 19:49:10 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 MWH0EPF000D8953.mail.protection.outlook.com (10.167.249.219) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 19:49:09 +0000
Received: from pps.filterd (m0373460.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIZYou3211158
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:49:09 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4htnr35386-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:49:09 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id REJexkePzSDpjREJexIVvF; Wed, 11 Nov 2026 19:49:08 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=PQG
	G5jJMrKLnZxo+UlTXYroUI0SioJlqv8PF6kpIJ3w=; b=YVcy0toVccWHRIeksIA
	hWd/QrY6r4GrsqEwz0e0LwMG0Phrhp2hlk9dUIeV4kYfVtTSYgUJfsIr6wAPsrAD
	RqFXHyw/evJrR7DwVdwwZe1cChqT2/pMP+vzHN3o7/AdpIYgVSd2Di3fYhXNjKE1
	gCWtkQykaS7hUbid0OCp6wyqp0fiI0QsV9a+RAMn2vIuKSc/mIq/si3rke2fE5af
	lM9BLThzCWkX77o+XYiTqKWbyVHqjuW1VAHTOvlPKZDUN47A2cAHxDeO2XVNkQQm
	hdzstUbuN2U2faDR1LR3M8JqLkE4DbVcKNpmTlV806ME3wtp0Lho6vM5k8j2VB0G
	4lg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oAWIzPXy9hUwtzD3eExFSHNgOloCL/AX8Yv7eVcLAJB41PGfg/pg1HnejSXGasWpu5eaQCPNrZvBPW32wYKXp5Ba0aYBLcFcOjGHmFif3gjgXpTSkrWBsne9m+Q6f7nXKjcDdGCeSA079UUzmVJwH0IKd8tzMF5so0+wdiMRaYd1Os8A3oFZXSQTPuwjcPQISaira1wuNQngowuGIiiLMjFQKKN3sZjyiJViYDFsKR2Vy3vXi+3IFtImswD/Wx35H7yyslq9+ghCZzGZoUcXNAFjQX7POpHKIm5JxCYBttfqAz7BGdMUjhKpXGX5ug404GJK4azm25fEIPdFPZtD9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQGG5jJMrKLnZxo+UlTXYroUI0SioJlqv8PF6kpIJ3w=;
 b=ublYEcrbDTxox8wwzViEGFuNvemunczEogpuSdN/9uOHvs8EzSpoS1AsQYHcQeK3GnXg2WI0WgP9M968jyXxJMDhQjN6T2n3XARARzAknXo/y6Pw7VtwjF/etXoh1vJj4RjN55WBFUcCKrCfJ8V+JdiwHrnaCYGHDXcNoteniLQ7TCqnIhiB1oUJZ/w63zWhwfg4iMX4VlDR/ZP4m15kxlUmYyGzX1w/QhH/HPuo8j40eNSrwMq5U5vaLAKd8Gv2Xgq+CNiSIp2cCi6uFMXBHCvaH5Nlrrshq9ntdSKBmEY8wm5RAA1vgIomZ2ilcvXULHBd5NPzJ+aeB4/7q7GKnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQGG5jJMrKLnZxo+UlTXYroUI0SioJlqv8PF6kpIJ3w=;
 b=DfzHaWkuMBcC4Va47yXo4eDxx1kwL4Qi7MXa8xB1+X9eiijKpbGdc2HwFTNcV2Jz0W06tMkiaFWJfzdp9fOuUQKDRl3fXh/24/RsQrQXfNDv7UypgPPeamo/FKejnrrz7BlGqd/s94syfWkLg1J5m1RJG6KEtukQW8QhhQNeVgs=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 205.220.161.53) smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	ppserprodsaar; bh=PQGG5jJMrKLnZxo+UlTXYroUI0SioJlqv8PF6kpIJ3w=; b=
	VXNBic7Dhkru3+s+Nxn65gSUv4a4LKO6XdmBg0yeNRG4+piuX45w9APwZGL+TfdH
	GmF0OHvVJvDlXK+ARw+P9pwh4HnBOgzxSz6G1IViRsl600LG3UiecDsIJoEeruyu
	AX2lYWL/WkkWu03HYV/XFTKvKHTJ2Lv0qh9hHMsRGzRkHsNkH4Kh9b55MgpnRzL2
	TAtNAw2lswtt9WxfFpsM1DpmOOW6gQ80xqIGkquXe5BEQpNtMXpAiBIZCqek/1ik
	Vf8wdShI63WOC6j1ESD0jMaAB2qLpz+0oTduXK+YQwLnDvAe8/+aBob0NUh7yuXy
	l5EzXsH4xlyhj176FdgiKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=PQGG5jJ
	MrKLnZxo+UlTXYroUI0SioJlqv8PF6kpIJ3w=; b=LzWDqQbsq780QnSxh0XgthY
	RTPI2YxbzfEHNZJc+jRD7r1D5P/Z3+gJePf2cp/RxmvDgKjDhh5r6Qdbg1ULzN3n
	BbD6j+IawDMkGDaMBOJpe9tlfQAOmzPUXuW5QKaXmmTE94wIqlOlLHTX3ijGjwz4
	OjpZy8EpxH0aJXW/mgOLKMnlb/7xRNhJmETPrEKtj5ivFH2gMF40ngEbjDbtOcZM
	nfcMUqu19Lp6WgzN0zDTbjrUUt/TYnM3cHTzUJLr0vidUBt5ANsoTlOw/65Hl8SI
	ugO0fol72H21UjfDUERwFwsPtha4TryqxEBDcL2rI4vvBioXMgzI5114AHwBXgQ=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: REJexkePzSDpjREJexIVvF
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v8 22/26] MAINTAINERS: add myself as vUART framework maintainer
Date: Wed, 11 Nov 2026 11:47:56 -0800
Message-ID: <20261111194800.1070016-23-dmukhin@ford.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111194800.1070016-1-dmukhin@ford.com>
References: <20261111194800.1070016-1-dmukhin@ford.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110078
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000D8953:EE_|MW5PR16MB4716:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b9c62be4-7d6f-40d9-7456-08df402cda95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|22082099003|18002099003|10067099003|261102123227099003|261028144727099003|56012099006|11063799006|261026121527099003|261022105027099003|261026140227099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	GL3bkG5bXRKZt+82GjbLMMDSopFHBB3XM97MFUo607ftawWFHsAZ+toN43yANPQqqz8xaQedblkoYVxPqUTon8V/HAXsKBKOr1gCyXOJFAk6h5tReBwPwrLg7kU3F/jcv3zjuly7wHCqzV5ErE3J6tRfA27ayRYIRaW2M4mPHYpP7BdXVJe6WxOSxiY/o+6veDEDUbIMNmewD+r3nLF+nQxj/XSsSJQ9Yqp8wxLg3875/MzYsrDLF2WK/5OoYk8ljYvJx/8LFLdNffavca9nGdReojA6oXAHFLe5724Jvhw9V5gzCWb2WbZXUQxY0bTatQA8njgHNaLuovuQeXyjICbyZ0w7um1hQZDTCik2r/BcOCYkoKFy1xI5+e9AHvY0SNMH7I1eRHW1IDp1+E3U34dwyxyEsYodCzk3Ya1NZn7l2fMSj8ptc2rU95WjznjXiZ0Uy9uP/twU59+xH2ALwfCfcLhJNKY8cgIF6RBoDPK6yl55ZeXoVY+7iih/9XVDh5b5RdKR5b1K9Or3lIG8Zk8nmNyAXDrtn3z0kyEOYJMJbq/G3JnDGQNn35WT1T0D4dlKXWo0/R4WN8jqbAlxKvzUHpe9VfIEOb8Xgn6xroGht3STqHH5TG5cJQiePfoT570BIEKH9nk4Avn31Dr6SG1VZtj12/K5F5cS3ODFMXoAtusMcVkRS6LDnO4mn/cR7VdzbbfwYz0876cKiBMNfg==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(10067099003)(261102123227099003)(261028144727099003)(56012099006)(11063799006)(261026121527099003)(261022105027099003)(261026140227099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WU8SB+z4ODDTB6UO4nbPnjGqI7xPAfjittaPDQFDz1QKgETdCHM0FeioBx51a/StYxC6WOCWzD757+fRG0v8eMramHEeRjC2kM+mF/IK84s2cBphZPHhtA+2ZL/5m84EW2DyKouUJbiaGz3kJsDGJu8d8pV3Tar5fkEGLux5oIb9uXR+0dzbpdMStSz/xL1ItlSQRwhWt1Gau1g5l/XpyG5l16rAXKlVPYHTPY1a/h+zZBDjbrC1HCpJ6NOD1CK0pcz7jPVHMDMQtk4+Hu5AtT5PtJFu5clXBNYexRQYQz6Ch3Ixq09WQVbJib7SUpa1xYSx5JxOxfxcAMBxMnkJ36IaECJ3jpmwcmYoyzWPRCEzoid0qlcq/Q35Y6xTiWQJAZrCJfpEU5+rDE5BVJHgY9oeWA76iCwqAzW21JC5v9KlwwcXrTAwiABvJxgWnzdX
X-Exchange-RoutingPolicyChecked:
	WMZqYDct2KA55zwLK4rwevGDJg4yOg+ueetDJfP8LaTgNNcwTPzpUmwlbeqcAfRTcbGsieoOHxqEAc+pZejDgH5/DtKuh7il6FSrUyGtjnesYjAxmeoLeWeS0guwHgd8WIkb2SpYUMlqQz2jJPMT2OFCQLKhV1UDNmDR7eR9CrMwbLZjCKy2Phk9KKD+U5V+wVZDxyxQSWXxjfWkY7sjkEkNhatSBC9mwfXcdCM4DrxpbD136BBboJcTQK9/wzVth6wuhGJO6/pRTNOQ5e/34j4fV00uSwxZWohy8/VWjL36rmqrtCcPGKUWNxpl/quzy8UJEvCuP2AryJyHEoB5Ow==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LbfoGnHCnD2FBB9piDJUBBP1cqRBc+7FSv0Htv4C1ZZay0gSazJUEbm9ishy4EHKqzK4iCDKHKqZ4V2lhoKec6yQTtzDDe2r59/r84yYh9WuUAyboQNQvIgdJlAV3k0JyZ8N+glW7s7LwcHzcnPUWPHbFJfJtEGduvWrAQFmIOVNxddFqxIM1l8f/VSmsNPm/Hw8iXPJSM8PXeLtuhMByc0k3qRsAUXaADKX+OlNcCUZk5v4C9PmyKV0NOxFPbbdsYUSjyZdLH/89hiCT41UX0zBG52Uh3MFVxs6v5g7nhqqeuSkn9JrS+Eds06SiV27EfeIxJqmryYN3/GxJxsZwXENdThsvrSZYbPF7JtYyto3Va4ARPY4Fk3crI/lPWIbnst8/iZhwjb4ARFHq1VAKMyA0xeDpxd5CGXqGlwC5pX08Nx6V1jWvxk04mZU9O4kPOK5maFy3DxJLYNyLsmYL6WHueDmipkcQPBPtnVXFaxCG6lKgF+YbDdIM5oSSbUY6NI3XN5a93i1R5pWuPH0VYQ+TcW1j1DINvgxr2uy9zeXQAcyTZfowdiKsoD/t2DaPisMGwGO8FJCXluqXVm9c7BIpIxOZ8b1cA5P5fKPOQssEKpl9Qoq+QMsz9pTM1Lx6PaSZAVSXxjLth+j3pp2nQ==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:49:09.8063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9c62be4-7d6f-40d9-7456-08df402cda95
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000D8953.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR16MB4716
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfXzA0EWh4vlpXZ
 9BVpVXrvVK7Nv5bATYmXGfh9YAeO4OYM7jH5ol2nMnq0qHZCQ5mMX/+LAwQMEpkv81FZuJZhXPm
 52v4YD/3MZNLiwiyZGOY9vmIgDcIA24/M2/vcO9GS8CBqqVJ3NyK
X-Proofpoint-ORIG-GUID: deWhp_sYxj7RgwtdK8jDBZ-FRQptCUpL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX1tqmYErpLPhn
 q/xNS9PhoAQ+S0RizWmtrq0ehYnm2IVhs+RVhCllVBY5cqTtHZ7q+9+bXt3h/EV3wmkaEiiflVP
 tt6m4Q0pHlVKAwoIcRsjKTV0NJdFWBrqfOzfBXsXU7mZI4qogmBOGtjFCFKkjfZq+HfhZk2Kel9
 GFBgCteOEpNuC0GWR/YKw4ffQK94IHRknv0h5I9l9nuJUWwSc1JtYScryygbzNFUuXF6gJYdSsp
 ncJ8vaaZSR4T/24sKT1qg9xO9x9ov7Y0hVYF/xDgtb/LChVJD0fRTPmUu7WItnWxlPOUpyCr4AU
 LsxR0vjdeCe8FCi99noRAfzeYXCD2XWHGJKaM7kcORkzX18EmGV+x4Vk3u4XoEwqCzjPiI8Blo6
 ewcCbwZKD1dmtcH9U/bliI3vDDku4a58GnuOFaQAEEFIPzahzoCNy5GWxR/g3XWYH/L86Md3lWO
 nmgopkk/sdkrjk1RMEQ==
X-Proofpoint-GUID: deWhp_sYxj7RgwtdK8jDBZ-FRQptCUpL
X-Authority-Analysis: v=2.4 cv=I5Pw19gg c=1 sm=1 tr=0 ts=6af4c6cd cx=c_pps
 a=v5NpUkBk8u87wj8Ets5Xkg==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=-OawqTZBqJjt90xPb8wn:22 a=cbNQJ9GKAAAA:8
 a=iox4zFpeAAAA:8 a=tHz9FfFoAAAA:8 a=oX6sQOh5f4QriJ02HC0A:9
 a=G69WFyCBNqGPyalROSdv:22 a=WmVTiCyuxqgg3mnwYu6p:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110078
X-purgate-ID: tlsNG-42698a/1794426575-AACDF9EA-9E471527/10/78276251493
X-purgate-type: spam
X-purgate-size: 676
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b804434d52d6..327adf4641a1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -615,6 +615,14 @@ F:	stubdom/vtpm/
 F:	stubdom/vtpmmgr/
 F:	docs/misc/vtpm-platforms.txt
 
+VUART
+M:	Denis Mukhin <dmukhin@ford.com>
+S:	Maintained
+F:	common/emul/vuart/ns16x50.c
+F:	common/emul/vuart/vuart.c
+F:	docs/misc/console.txt
+F:	xen/include/xen/vuart.h
+
 X86 ARCHITECTURE
 M:	Jan Beulich <jbeulich@suse.com>
 M:	Andrew Cooper <andrew.cooper3@citrix.com>
-- 
2.56.0


