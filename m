Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6284D606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 19:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=MooLMXc8;
	dkim=pass (1024-bit key) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=E2Hy1pfd;
	dkim=pass (2048-bit key) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=Sz0U1KYN;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=vCuhcBe4
Received: from list by lists.xenproject.org with outflank-mailman.1484945.1688324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREMK-0005q4-5i; Wed, 11 Nov 2026 19:51:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484945.1688324; Wed, 11 Nov 2026 19:51:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREMK-0005ps-2A; Wed, 11 Nov 2026 19:51:52 +0000
Received: by outflank-mailman (input) for mailman id 1484945;
 Wed, 11 Nov 2026 19:51:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xREMI-0005nG-JD
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 19:51:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xREMH-00Bkzc-WE
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 20:51:50 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c748-2eae-0a2a0a5409dd-0a2a4501eb54-32
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:51:49 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c754-5984-0a2a45010019-94a38ff137d6-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:51:49 +0100
Received: from pps.filterd (m0367128.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIYbLB3992212
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:51:48 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com
 (mail-westus2azon11010029.outbound.protection.outlook.com [52.101.46.29])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hvrf7v318-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:51:48 +0000 (GMT)
Received: from CY5PR15CA0089.namprd15.prod.outlook.com (2603:10b6:930:18::35)
 by MW6PR16MB5524.namprd16.prod.outlook.com (2603:10b6:303:242::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Wed, 11 Nov
 2026 19:51:39 +0000
Received: from CY8PEPF00000054.namprd05.prod.outlook.com
 (2603:10b6:930:18:cafe::ac) by CY5PR15CA0089.outlook.office365.com
 (2603:10b6:930:18::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 19:51:37 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 CY8PEPF00000054.mail.protection.outlook.com (10.167.247.58) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 19:51:37 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIXTWi075700
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:51:36 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4htkwgn2js-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:51:36 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id REM0xf8UFQVyyREM1xGB9y; Wed, 11 Nov 2026 19:51:35 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=Rup
	mFEZXLXA0Lt5h6ULLMTC0jzaklR3AE+Zv1tOgKrQ=; b=MooLMXc81R/WxeNxftP
	RqQzR9c/gRcmKdZFfHquuFQ1C94h88upj0lzyMuE+DRH4HNaPhqHq9K1FAqVLMuS
	GnIyvHDGaVNK2an11oUIlqDhmnQS48aOJaAy1dKv/OrUFrBZtVtXKUOTRRhMPn2/
	22hy3qP0IIW+r2tuhamHVulpJ9fbEYnY6Yd+jlGBq8XTlY4m9Ai6cpVhYC7jGXN7
	2maZtwkZ1OqOu56fzcWvcv26fJ5DNIi/R9GxUw2HgpQQpI8VYgV/iYrLYJj+FKts
	9wiyfmPUWSCq3bUrCb8n7f8xfKRygs01HcodgoCr0J3AiyAZhkfeqQgrhtbCq2LC
	40w==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eJfNkKVmThIigQLsdl3FLZIPq8g+SL0hPk5fid2CjHWOLTMW1jXqtOSVdX32YZ/bqVkm5RqMHoZRKp7st1jBAYKhRnYNW1H/iDuWuzBkCYw4Xua7CFqiVfepL3IlGrPM8Vjjo+ceHOz/yaoY1nng946JoLpT8X9gJj2eZvgvjMspztIvx6uh6mJSvhEtbGufR3hAvEJ00sejAWArxPbFXFgjkykW6Yd5xOj3uQX1vSROuxh3c8YH3MNHNJXPoNAUKdcSfJRNyZXbFi2mryyWDjDkDO4T4gblbyyPoFaIyfAxsE+aLy7q7r4OJOrPPxZ0Li/ewU2rfb9a8fsAAUJ/sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RupmFEZXLXA0Lt5h6ULLMTC0jzaklR3AE+Zv1tOgKrQ=;
 b=A719e2/PADNdHg6ohJn0IoQKHNbo8UU9CHWFhvKzElAxC9MTg8i8gV3Mf6fkAYiJc4vI0axr+UxNm8cRyfGoTB+Kd1NvQKsBwuFExMsXtpO8ps7yXkTb0b/K9/40WJ8/EzIArzZa9f5tFEX9Fp0WHR5O7Bhcp8J8MSWSS6/EqzHar6BSpXosyCw+HZLWezlirALBEJi0mga+bN+7TteU3+58ZdnnY1+L2C5h3hkNM6lyoYbyEEMASQwKFLX46T0Zo0NX+a6f7HDa09gKoHZP1WKtJC40zZtxfp5zvIO9eA/gZxQ+kqbxm/S1ZA/dFUfSEpP4ix/7EqpptmuR2gbRFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RupmFEZXLXA0Lt5h6ULLMTC0jzaklR3AE+Zv1tOgKrQ=;
 b=E2Hy1pfdQZtwi9cf99Aq8+PIchk8PlXWqFmNeyLTxDz2T1ddSc2ssbkJK/GQKdUImYqqQLMZ/zh/4jx+9npRU7QoupqLhNRFrQ5XtSFEzbtQqG4JZMbCCVy1RBubAmdc4z2uSKD8c9bpErKnXOQXZ9tyhkJYYCtrqDoHT9g8d3I=
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
	ppserprodsaar; bh=RupmFEZXLXA0Lt5h6ULLMTC0jzaklR3AE+Zv1tOgKrQ=; b=
	Sz0U1KYNK64JYa79mIdUOzVPdciCtkxwLQRqHWFYFHsJlBxkew6vQgCIs7M9xo1i
	fZhXjHMlQmHANpUOlpkD4xsN/p4g1s+13PaCAgIUxDgrGn3gKx2NL0VtkOVyLaYg
	FWMnrW7eXfD1i1zq4zCOD2rsASAu2y9FXQWmagiGP5WHpNmx/yd2afYdqrF/PWBj
	AkQ1I3T+409i0LaY8h28BqOUfjlx+d0hwFbD6u8h9JSoLG03U4wr8rgG5mTVCVrD
	8Th4VzX0T5id441YOkCqiPOxGHdz/a+Hf99mAQi5RhlHOoOoDz2HTN+bfh4T2kS/
	g7dwPAwZyV7DyhWG+ORvoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=RupmFEZ
	XLXA0Lt5h6ULLMTC0jzaklR3AE+Zv1tOgKrQ=; b=vCuhcBe4N20MiG1wBjv04/o
	AeOUl7Du9DV7wbT6edaH2sLQ1qjuWEN7Sji91AMAP+zna9g4teNoMkO1E6H9A7Ad
	lJCmxZvlHOdOqpn/oVA0TqgI+FXImXdyta06/qHT/snHkKKyzZOS3KpUd3+hWfx7
	hjsyrByrF/mN+4j9uFsqITjX3Il/HjC9YoFPkSsAY1g0ZqpUnaYfbFeTm2rR8dkc
	4L6NMsKedzwK0NJsBT3IdwCJql3c6sHzzUBvOCVFVK77gLH3Wma7d8ML2afQEXAk
	TqwTizR/cd3J0apZL0m0RQYIbQcFYOPyNct8jExguVQb9NhjCkroILlOontENPg=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: REM0xf8UFQVyyREM1xGB9y
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [XTF PATCH v1 6/6] x86: add NS16550-compatible emulator test
Date: Wed, 11 Nov 2026 11:51:09 -0800
Message-ID: <20261111195109.1070169-7-dmukhin@ford.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111195109.1070169-1-dmukhin@ford.com>
References: <20261111195109.1070169-1-dmukhin@ford.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2611040001 definitions=main-2611110078
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PEPF00000054:EE_|MW6PR16MB5524:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 063b645c-31e0-4b4e-4243-08df402d326a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|18002099003|22082099003|6133799003|3023799007|10067099003|5023799004|11063799006|261028144727099003|261026121527099003|261021121427099003|261021123027099003|261009223027099003|56012099006|261022105027099003|261026140227099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	ZcppHzkettiPEytNiD1k1MMDwySMTv8qkAl+uXaUzYM6HAAyZY6q7n7tqN2vewmNk49AHjsCLqjWFEqTmJsLXee7WTp1DwEzK3uLkPtrkUE0qTLukeo6JO2zTCqkavAT3fCAGu0N/m9Yl3ve7VNES/8qF3fFKTKQNZdxLM1P5VifZ2OwgXwrp14W3YJJqEtfP316zy0xF6pp6anBVUnYaCkMpXD4xabmoMIVkkqzcrr7i5ED8HZL/necx0Ne3pfAcicLLc1HoTpw44FtmkIR9c3b1gyc8adhd9AlFUgdNOz9i+ojZVZZVsSTbIDw8tWbiRqFRG3MDfsh/LqkE093Ufi6HrhIILkDnN2pG1wKFqvFRX2cD91EHwyYPsp7vXgXSlSao1oBw3MOq/5SQ49iGYsIA56o7+QG3IR0eS1JRMPE+qJOfIzpdixdW4ObbWZq8dIh+PlQeCuxcOw9+uPNIGW1o2DhqHt8ursRqn1Lz0h4Zq90ioy9doxv8Ry49nXS3dTkh2r3KeX0yoTa05I0jMLiQk3CtCNnH0r2IzdIXhMws9UoJPdkaTS2LQ4aAUPKfHsPTlLlmM5lNpPSEIRPItsMzyk9Vc0D8jI/+4HYRc4Ow1mmwD/9oXjxLU5i/oswfptEeIcxCN1pN+jPZapE/EeBBQPm8hcFIiZQo20Q21PaJkNwn/4tiZDQMa8z1LzBdU86zPXu2Un/c+Yecduj+Q==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(18002099003)(22082099003)(6133799003)(3023799007)(10067099003)(5023799004)(11063799006)(261028144727099003)(261026121527099003)(261021121427099003)(261021123027099003)(261009223027099003)(56012099006)(261022105027099003)(261026140227099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8DVtHoHlx/G2gtRHr+SuP0dirLsAvuHG2XQDxdVohvrRoazVfCVMrV5PjTPD0wQlgZs7z00bcpChxsKaplGRyiyhxJmeHfezDqua7viy/PN7w88OmbIVEWVCCOSYn+extT3flzaoEB9xwFkPBtOu7ut4sMLM30ky2SsYlvyhXsC1f5bG8CRPWCIrbYEwZLqITnSPY8bNEwuUDCCjr/D8SL+jSyAnqen1T+hiJYaZ6jMzWAofVw4sRGDfTg+/xwG56OllXIkWAnp6YC2EFl0BJhkppZ48GsBZki1Sq7aBezOy2C5DW5Yzny2hYRn+/7rAVaL/Tb+0Y06MoGBJhygaKcf9ys2t3YfVME435iAyJ6F4TAwQI4rdH9CUZSxBmm87aVM81qJQgFp/cL/OkAlea8gIpRBnMDIdnIx9C9Qa/KL8/IABLql3S4ktXk5IURWJ
X-Exchange-RoutingPolicyChecked:
	4E/ySXuZ1+XqJVMAh7MiNuRsbSoemWNBGiHjW1NSDwrmbs0h12v4yEKSrJ39espFzKMgtxCbpIIgLOtVQw2yvlJ4I6fZzYqKZVDG6wkgBu7TOAImGjQTNpVql6paofDOU5dhZRF4drluzwTj/cx/RQsU7gixYnQzmF2AOqAJuN7TrhrZAVJbof0cnTNFj8Cy37szoavsvdiQBiLdhTMKcqhI1zeF3jwtYKp4SF2p6B2ZKYPN5Pmv/ULaMzZe+42mQMhk1rU744Xg03Nqs6mq2pPthJGPA0qsAJqVb2/GrpNPPwotSjpdvNUVv2+CVQ4Wow4i9DHAdRLqs/mQy2kKyg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bnBHJUpaxJnxV7xXrnBoVKShuSEmPfiICkvVqFRenVZZ2UL1/p1rfkZ1QbWKYaogGM8ifo+h+uaweYuvpRNcxOiwiEYKPL4b+j3oWJkxrHFBi4GncP7Yh8OWlqLIiRH3EjR/+PuYxVYmbjcWQzcZ9rwByLAhIQgBPy/nLI84YWZW00qMj9OsGVQuW9l7/Tfk0w/wTsnrZhS5JOv5SrzMNWccGa23ObR3Ma/39NRUqtopd/Xrr4JFrCBaPaAYmg937sO/mhOeiz2LEItMTgT/E32pq7hqmKguz0NzOPnMYcK+bwvNn3l5oAOb1lceT+tvVBnKJZ67CksTFnlmr5Is+o6Y1OQZSAoqoEAzMOrfHDKDhDEnHI+KkzQYcod5Hqt2+WID36Zj4eGf0qekCbbRsuRxhdM4EvDfMlinMFvAP3mFJ/SlZKRhBHOBj+b/F8szUnpiKR/QN9wYt/DJxNMCu+OS38p+q6yl1AiGkMeRSnPff1/Y2smZC7nEI/xZ+ZrnUFQ78lMz1y1hKLEnxyevHCXE+WwOfQE2tQ7hnfp8soFA3XeTf9dacTOj0zkOgh2lSQKiYfmsMcxJUx4IowXM1dl7R2iduqYYP+Ye2QmHU2KSuDM/SeSSFdIDYZZXYM0zJkmqXAeABbFnd6+DswDVAg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:51:37.1494
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 063b645c-31e0-4b4e-4243-08df402d326a
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY8PEPF00000054.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR16MB5524
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3OSBTYWx0ZWRfXw214bUuRx40I
 IJ5tAkIfrPNYmE3GY9OX9eDfRcBUttiBoT+YH0gs/D2NaOc7IMXGhbv6wf8/5KmY1IOX9s/jBeF
 wxmlY92A7f0bUApsP6+97SItN2AcHwpe+94k9iP+xku/NMG5pM9fmUk4llAI6GA/JP9D8F/4hoV
 okYv6Biq+qBmDVh01NJlwATkQOQdNgVPzTO3+CL/v2q+AozbWopkJMr0rMUW2j9xc5xosqPnyzg
 jlxnynzsV5XruZm1MQ1HKowDgOh0kskuLkZLYf8V4BYgQ9c8WGfCfphqn32mxV/xCvHFxMbM5mB
 jPtAmn0aJpIZ9g1AjgEEpjrdnOjvIbGHDwxgbChZx3Qa59T6xoLK4qd3igY6VZVjQrMqBPL7FMR
 Wnp7T1Q8s8SpptjcZ9hHxX1Q1jEwYKyPTkPirNI0Ht28o8iMSVeZZKmw8EyxMnWBrAIC/QEYxAy
 diorXp6x0YrWszpR+ig==
X-Proofpoint-GUID: w6jW-0iDb_Ty0aISb0KgWNSefQ_P6RBY
X-Proofpoint-ORIG-GUID: w6jW-0iDb_Ty0aISb0KgWNSefQ_P6RBY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3OSBTYWx0ZWRfXwOyzFhUuUrQs
 g4iNSHXV77+tFBJdlfGQjjb2Ap+y1NBMC7mMlDcOS1k9wt+YT5HDoe07qJ1Xx3k5MOivdJbcsbf
 tdrfo1yEhqqcmzTRTiM2aYpI892F2e7nVGHMYpN57U2m3I8rN2S4
X-Authority-Analysis: v=2.4 cv=Ed9d0/mC c=1 sm=1 tr=0 ts=6af4c754 cx=c_pps
 a=V3ntuBz9Vw3KuD7vyzUphg==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=WER9OelvoqQQjwJToBYG:22 a=cbNQJ9GKAAAA:8
 a=eLOO8zXXNe-oGWP2IY8A:9 a=DqJYxgmhk6moR-_7_KoZ:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110079
X-purgate-ID: tlsNG-d62444/1794426709-BE07B757-3358AF15/0/0
X-purgate-type: clean
X-purgate-size: 26785
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Add initial test suite for NS16550-compatible emulator.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 tests/emul-ns16x50/.gitignore |   3 +
 tests/emul-ns16x50/Makefile   |   9 +
 tests/emul-ns16x50/main.c     | 644 ++++++++++++++++++++++++++++++++++
 tests/emul-ns16x50/patterns.c |  65 ++++
 4 files changed, 721 insertions(+)
 create mode 100644 tests/emul-ns16x50/.gitignore
 create mode 100644 tests/emul-ns16x50/Makefile
 create mode 100644 tests/emul-ns16x50/main.c
 create mode 100644 tests/emul-ns16x50/patterns.c

diff --git a/tests/emul-ns16x50/.gitignore b/tests/emul-ns16x50/.gitignore
new file mode 100644
index 000000000000..28fbd61de7b5
--- /dev/null
+++ b/tests/emul-ns16x50/.gitignore
@@ -0,0 +1,3 @@
+*.swo
+*.swp
+
diff --git a/tests/emul-ns16x50/Makefile b/tests/emul-ns16x50/Makefile
new file mode 100644
index 000000000000..11ddfc82fb74
--- /dev/null
+++ b/tests/emul-ns16x50/Makefile
@@ -0,0 +1,9 @@
+include $(ROOT)/build/common.mk
+
+NAME      := emul-ns16x50
+CATEGORY  := functional
+TEST-ENVS := hvm64
+
+obj-perenv += main.o patterns.o
+
+include $(ROOT)/build/gen.mk
diff --git a/tests/emul-ns16x50/main.c b/tests/emul-ns16x50/main.c
new file mode 100644
index 000000000000..39a566d2b1d5
--- /dev/null
+++ b/tests/emul-ns16x50/main.c
@@ -0,0 +1,644 @@
+/**
+ * Tests for NS16550-compatible emulator.
+ */
+
+#include <xtf.h>
+#include <xtf/ns16550.h>
+
+const char test_title[] = "NS16550-compatible emulator tests";
+
+extern const char *pattern_4096;
+
+#define COM_PORT(n,b) \
+{ \
+    .name = n, \
+    .base = b, \
+    .reg_shift = 0, \
+    .reg_width = 1, \
+    .clk_freq = 1843200U, \
+    .baud = 115200U, \
+}
+
+/*
+ * PC COM ports.
+ */
+static const struct ns16550 com_ports[] = {
+    COM_PORT("com1", 0x3f8U),
+    COM_PORT("com2", 0x2f8U),
+    COM_PORT("com3", 0x3e8U),
+    COM_PORT("com4", 0x2e8U),
+};
+
+static const struct ns16550 *uart;
+
+static int ns16550_parse_cmdline(const char *s)
+{
+    const char *console = "console=";
+    size_t console_len = strlen(console);
+    unsigned int idx;
+
+    if (!s)
+        return -1;
+
+    /* console=com2 */
+    while ( *s && *s == ' ' )
+        s++;
+
+    if ( strncmp(s, console, console_len) )
+        return -1;
+
+    s += console_len;
+
+    for ( idx = 0; idx < ARRAY_SIZE(com_ports); idx++ )
+        if ( !strncmp(s, com_ports[idx].name, strlen(com_ports[idx].name)) )
+            break;
+
+    if ( idx == ARRAY_SIZE(com_ports) )
+        return -1;
+
+    return idx;
+}
+
+void test_setup(void)
+{
+    const char *cmdline;
+    int idx;
+
+    if ( !IS_DEFINED(CONFIG_HVM) )
+        return xtf_skip("N/A\n");
+
+    cmdline = (const char *)(uintptr_t)pvh_start_info->cmdline_paddr;
+    idx = ns16550_parse_cmdline(cmdline);
+    if ( idx < 0 )
+        return xtf_failure("not configured\n");
+
+    uart = &com_ports[idx];
+    printk("Testing with %s (0x%lx)...\n", uart->name, uart->base);
+
+    if ( ns16550_init(uart) )
+        return xtf_failure("failed to initialize\n");
+}
+
+static void test_thr(const char *banner)
+{
+    uint8_t iir;
+
+    ns16550_outb(uart, UART_IER, UART_IER_ETHREI);
+
+    ns16550_puts(uart, pattern_4096);
+
+    iir = ns16550_inb(uart, UART_IIR);
+    if ( (iir & (UART_IIR_NOINT | UART_IIR_THR)) == UART_IIR_NOINT )
+        return xtf_failure("%s: expect UART_IIR_THR\n", banner);
+
+    ns16550_outb(uart, UART_IER, 0);
+}
+
+static void test_scr(const char *banner)
+{
+    unsigned int in, out;
+
+    /* Enable all interrupt reasons */
+    ns16550_outb(uart, UART_IER,
+                 UART_IER_ERDAI | UART_IER_ETHREI |
+                 UART_IER_ELSI  | UART_IER_EMSI);
+
+    for ( in = 0; in < 256; in++ )
+    {
+        ns16550_outb(uart, UART_SCR, in);
+        out = ns16550_inb(uart, UART_SCR);
+        if ( in != out )
+            return xtf_failure("%s: wrote 0x%02x, read 0x%02x\n",
+                               banner, in, out);
+    }
+
+    ns16550_outb(uart, UART_IER, 0);
+}
+
+static void test_lcr(const char *banner)
+{
+    static const uint8_t patterns[] = {
+        0,
+        UART_LCR_WLEN8,
+        UART_LCR_WLEN8 | UART_LCR_STB,
+        UART_LCR_WLEN7 | UART_LCR_PE | UART_LCR_EP,
+        UART_LCR_WLEN8 | UART_LCR_SB,
+        UART_LCR_WLEN8 | UART_LCR_DLAB,
+        0xff,
+    };
+    unsigned int i;
+
+    for ( i = 0; i < ARRAY_SIZE(patterns); i++ )
+    {
+        uint8_t r;
+
+        ns16550_outb(uart, UART_LCR, patterns[i]);
+        r = ns16550_inb(uart, UART_LCR);
+        if ( r != patterns[i] )
+            xtf_failure("%s: wrote %#x, read %#x\n",
+                        banner, patterns[i], r);
+    }
+
+    ns16550_outb(uart, UART_LCR, UART_LCR_8N1);
+}
+
+static void test_ier(const char *banner)
+{
+    uint8_t in, out;
+
+    /* Test valid permutations. */
+    for ( out = 0; out <= UART_IER_MASK; out++ )
+    {
+        ns16550_outb(uart, UART_IER, out);
+        in = ns16550_inb(uart, UART_IER);
+        if ( in != out )
+            xtf_failure("%s: wrote %#x, read %#x\n",
+                        banner, out, in);
+    }
+
+    /* Ensure reserved bits are not touched. */
+    out = 0xff;
+    ns16550_outb(uart, UART_IER, out);
+    in = ns16550_inb(uart, UART_IER);
+    if ( in != UART_IER_MASK )
+        xtf_failure("%s: wrote %x, read %#x (expected %x)\n",
+                    banner, out, in, UART_IER_MASK);
+}
+
+static void test_divisor_latch(const char *banner)
+{
+    /*
+     * divisor = 115200 / baud
+     * divisor 0 is invalid
+     *
+     * DLL = divisor & 0xff
+     * DLM = divisor >> 8
+     */
+    static const struct {
+        uint8_t dll;
+        uint8_t dlm;
+    } baud_rates[] = {
+        { 0x00, 0x00 },     /* unsupported */
+        { 0xff, 0xff },     /* unsupported */
+        { 0x00, 0x09 },     /* 50 baud */
+        { 0x00, 0x06 },     /* 75 baud */
+        { 0x17, 0x04 },     /* 110 baud (approx) */
+        { 0x59, 0x03 },     /* 134.5 baud (approx) */
+        { 0x00, 0x03 },     /* 150 baud */
+        { 0x80, 0x01 },     /* 300 baud */
+        { 0xc0, 0x00 },     /* 600 baud */
+        { 0x60, 0x00 },     /* 1200 baud */
+        { 0x40, 0x00 },     /* 1800 baud */
+        { 0x3a, 0x00 },     /* 2000 baud (approx) */
+        { 0x30, 0x00 },     /* 2400 baud */
+        { 0x20, 0x00 },     /* 3600 baud */
+        { 0x18, 0x00 },     /* 4800 baud */
+        { 0x10, 0x00 },     /* 7200 baud */
+        { 0x0c, 0x00 },     /* 9600 baud */
+        { 0x08, 0x00 },     /* 14400 baud */
+        { 0x06, 0x00 },     /* 19200 baud */
+        { 0x04, 0x00 },     /* 28800 baud */
+        { 0x03, 0x00 },     /* 38400 baud */
+        { 0x02, 0x00 },     /* 57600 baud */
+        { 0x01, 0x00 },     /* 115200 baud */
+    };
+    unsigned i, n;
+
+    /* DLAB=0 */
+    ns16550_outb(uart, UART_LCR, UART_LCR_8N1);
+    /* Plant IER - that will be asserted later */
+    ns16550_outb(uart, UART_IER, UART_IER_MASK);
+
+    for ( i = 0; i < ARRAY_SIZE(baud_rates); i++ )
+    {
+        uint8_t dll, dlm, r;
+
+        /* DLAB=1 */
+        ns16550_outb(uart, UART_LCR, UART_LCR_DLAB);
+
+        /* Pre-poison to catch any cross-write. */
+        ns16550_outb(uart, UART_DLL, ~baud_rates[i].dll);
+        ns16550_outb(uart, UART_DLM, ~baud_rates[i].dlm);
+
+        ns16550_outb(uart, UART_DLL, baud_rates[i].dll);
+        ns16550_outb(uart, UART_DLM, baud_rates[i].dlm);
+
+        dll = ns16550_inb(uart, UART_DLL);
+        dlm = ns16550_inb(uart, UART_DLM);
+
+        if ( dll != baud_rates[i].dll || dlm != baud_rates[i].dlm )
+            xtf_failure("%s: 1st attempt failed: wrote {%#x,%#x}, read {%#x,%#x}\n",
+                        banner,
+                        baud_rates[i].dll, baud_rates[i].dlm,
+                        dll, dlm);
+
+        /* Flip DLAB, plant THR, assert on planted IER */
+        for ( n = 0; n < 8; n++ )
+        {
+            ns16550_outb(uart, UART_LCR, UART_LCR_8N1);
+
+            /* THR offset is the same as DLL */
+            ns16550_outb(uart, UART_THR, '\0');
+
+            /* IER offset is the same as DLM */
+            r = ns16550_inb(uart, UART_IER);
+            if ( r != UART_IER_MASK )
+                xtf_failure("%s: IER not survided DLAB flip %d: read %#x expect %#x\n",
+                            banner, n, r, UART_IER_MASK);
+
+            ns16550_outb(uart, UART_LCR, UART_LCR_DLAB);
+        }
+
+        /* Check divisor latch survives */
+        dll = ns16550_inb(uart, UART_DLL);
+        dlm = ns16550_inb(uart, UART_DLM);
+
+        if ( dll != baud_rates[i].dll || dlm != baud_rates[i].dlm )
+            xtf_failure("%s: 2nd attempt failed: wrote {%#x,%#x}, read {%#x,%#x}\n",
+                        banner,
+                        baud_rates[i].dll, baud_rates[i].dlm,
+                        dll, dlm);
+
+        /* DLAB=0 */
+        ns16550_outb(uart, UART_LCR, UART_LCR_8N1);
+    }
+}
+
+static void test_mcr(const char *banner)
+{
+    uint8_t in, out;
+
+    /*
+     * Test combinations of DTR/RTS/OUT1/OUT2 except LOOP, which
+     * is exercised by a separate test.
+     */
+    for ( out = 0; out <= (UART_MCR_DTR | UART_MCR_RTS |
+                           UART_MCR_OUT1 | UART_MCR_OUT2); out++ )
+    {
+        ns16550_outb(uart, UART_MCR, out);
+        in = ns16550_inb(uart, UART_MCR);
+        if ( in != out )
+            xtf_failure("%s: wrote %#x, read %#x\n", banner, in, out);
+    }
+
+    /*
+     * Reserved bits must read as zero.
+     */
+    ns16550_outb(uart, UART_MCR, 0xff);
+    in = ns16550_inb(uart, UART_MCR);
+    if ( in & ~UART_MCR_MASK )
+        xtf_failure("%s: reserved bits readable: %#x\n", banner, in);
+
+    ns16550_outb(uart, UART_MCR, 0);
+}
+
+static void test_fcr_toggle(const char *banner)
+{
+    uint8_t iir;
+
+    ns16550_outb(uart, UART_FCR, 0);
+    iir = ns16550_inb(uart, UART_IIR);
+    if ( iir & UART_IIR_FE )
+        xtf_failure("%s: IIR FIFO bits set with UART_FCR_ENABLE clear: %#x\n",
+                    banner, iir);
+
+    ns16550_outb(uart, UART_FCR, UART_FCR_ENABLE);
+    iir = ns16550_inb(uart, UART_IIR);
+    if ( (iir & UART_IIR_FE) != UART_IIR_FE )
+        xtf_failure("%s: IIR FIFO bits not 0b11 with UART_FCR_ENABLE set: %#x\n",
+                    banner, iir);
+
+    ns16550_outb(uart, UART_FCR, 0);
+    iir = ns16550_inb(uart, UART_IIR);
+    if ( iir & UART_IIR_FE )
+        xtf_failure("%s: IIR FIFO bits stuck after UART_FCR_ENABLE clear: %#x\n",
+                    banner, iir);
+}
+
+static void test_fcr_trigger(const char *banner)
+{
+    static const uint8_t levels[] = {
+        UART_FCR_TRG1,
+        UART_FCR_TRG4,
+        UART_FCR_TRG8,
+        UART_FCR_TRG14,
+    };
+    unsigned int i;
+
+    for ( i = 0; i < ARRAY_SIZE(levels); i++ )
+    {
+        uint8_t iir;
+
+        ns16550_outb(uart, UART_FCR, UART_FCR_ENABLE | levels[i]);
+        iir = ns16550_inb(uart, UART_IIR);
+
+#ifdef STRICT
+        if ( !(iir & UART_IIR_NOINT) )
+            xtf_failure("%s: FCR trigger %#x raised an interrupt (IIR %#x)\n",
+                        banner, levels[i], iir);
+#endif
+        if ( (iir & UART_IIR_FE) != UART_IIR_FE )
+            xtf_failure("%s: FIFO indication lost at trigger %#x (IIR %#x)\n",
+                        banner, levels[i], iir);
+    }
+}
+
+static void test_fcr_clear(const char *banner)
+{
+    unsigned int i;
+    uint8_t lsr;
+
+    ns16550_outb(uart, UART_IER, UART_IER_MASK);
+
+    for ( i = 0; i < 16; i++ )
+    {
+        ns16550_outb(uart, UART_FCR,
+                     UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX);
+    }
+
+    /* Plant a byte via loopback. */
+    ns16550_outb(uart, UART_MCR, UART_MCR_LOOP);
+    ns16550_outb(uart, UART_THR, 'A');
+
+    lsr = ns16550_inb(uart, UART_LSR);
+    if ( lsr & UART_LSR_DR )
+    {
+        ns16550_outb(uart, UART_FCR, UART_FCR_ENABLE | UART_FCR_CLRX);
+        lsr = ns16550_inb(uart, UART_LSR);
+        if ( lsr & UART_LSR_DR )
+            xtf_failure("%s: DR still set after UART_FCR_CLRX (LSR %#x)\n",
+                        banner, lsr);
+
+        ns16550_outb(uart, UART_MCR, 0);
+        ns16550_outb(uart, UART_FCR, 0);
+    }
+    else
+    {
+        return xtf_failure("%s: loopback byte not delivered (LSR %#x)\n",
+                           banner, lsr);
+    }
+}
+
+/*
+ * MCR.LOOP.  Data path first, then the modem path (in loopback the
+ * four MCR outputs route to the four MSR inputs: DTR->DSR, RTS->CTS,
+ * OUT1->RI, OUT2->DCD).
+ */
+static void test_loopback_data_path(const char *banner)
+{
+    unsigned int v;
+
+    ns16550_outb(uart, UART_LCR, UART_LCR_8N1);
+    ns16550_outb(uart, UART_IER, 0);
+    ns16550_outb(uart, UART_FCR, UART_FCR_CLRX | UART_FCR_CLTX);
+
+    /* Discard any stale delta state. */
+    ns16550_inb(uart, UART_MSR);
+
+    ns16550_outb(uart, UART_MCR, UART_MCR_LOOP);
+    if ( !(ns16550_inb(uart, UART_MCR) & UART_MCR_LOOP) )
+        return xtf_failure("%s: UART_MCR_LOOP did not stick\n",
+                           banner);
+
+    for ( v = 0; v < 256; v++ )
+    {
+        uint8_t lsr, r;
+
+        lsr = ns16550_inb(uart, UART_LSR);
+        if ( !(lsr & UART_LSR_THRE) )
+            return xtf_failure("%s: THRE clear before THR read %#x (LSR %#x)\n",
+                               banner, v, lsr);
+
+        ns16550_outb(uart, UART_THR, v);
+
+        lsr = ns16550_inb(uart, UART_LSR);
+        if ( !(lsr & UART_LSR_DR) )
+            return xtf_failure("%s: DR clear after THT read %#x (LSR %#x)\n",
+                               banner, v, lsr);
+        if ( lsr & UART_LSR_ERRORS )
+            return xtf_failure("%s: error status after THR read %#x (LSR %#x)\n",
+                               banner, v, lsr);
+
+        r = ns16550_inb(uart, UART_RBR);
+        if ( r != v )
+            return xtf_failure("%s: loopback corrupted byte: sent %#x, got %#x\n",
+                               banner, v, r);
+
+        lsr = ns16550_inb(uart, UART_LSR);
+        if ( lsr & UART_LSR_DR )
+            return xtf_failure("%s: DR still set after draining RBR (LSR %#x)\n",
+                               banner, lsr);
+    }
+}
+
+static void test_loopback_modem_path(const char *banner)
+{
+    uint8_t msr, mask;
+
+    ns16550_outb(uart, UART_LCR, UART_LCR_8N1);
+    ns16550_outb(uart, UART_IER, 0);
+    ns16550_outb(uart, UART_FCR, UART_FCR_CLRX | UART_FCR_CLTX);
+
+    /* Discard any stale delta state. */
+    ns16550_inb(uart, UART_MSR);
+    ns16550_outb(uart, UART_MCR, UART_MCR_LOOP | UART_MCR_DTR |
+                                 UART_MCR_RTS | UART_MCR_OUT1 |
+                                 UART_MCR_OUT2);
+
+    if ( !(ns16550_inb(uart, UART_MCR) & UART_MCR_LOOP) )
+        return xtf_failure("%s: UART_MCR_LOOP did not stick\n",
+                           banner);
+
+    msr = ns16550_inb(uart, UART_MSR);
+    mask = UART_MSR_CTS | UART_MSR_DSR | UART_MSR_RI | UART_MSR_DCD |
+           UART_MSR_DCTS | UART_MSR_DDSR | UART_MSR_TERI | UART_MSR_DDCD;
+    if ( msr != mask )
+        xtf_failure("%s: MSR after raising all outputs: %#x (expected %#x)\n",
+                    banner, msr, mask);
+
+    /* The read above consumed the deltas; lines persist. */
+    msr = ns16550_inb(uart, UART_MSR);
+    mask = UART_MSR_CTS | UART_MSR_DSR | UART_MSR_RI | UART_MSR_DCD;
+    if ( msr != mask )
+        xtf_failure("%s: MSR deltas not cleared by read: %#x (expected %#x)\n",
+                    banner, msr, mask);
+
+    /*
+     * Drop all outputs.  Lines fall, DCTS/DDSR/DDCD latch again, and
+     * this time no TERI.
+     */
+    ns16550_outb(uart, UART_MCR, UART_MCR_LOOP);
+
+    msr = ns16550_inb(uart, UART_MSR);
+    mask = UART_MSR_DCTS | UART_MSR_DDSR | UART_MSR_DDCD;
+    if ( msr != mask )
+        xtf_failure("%s: MSR after dropping all outputs: %#x (expected %#x)\n",
+                    banner, msr, mask);
+
+    msr = ns16550_inb(uart, UART_MSR);
+    if ( msr )
+        xtf_failure("%s: MSR not clear after delta consumption: %#x\n",
+                    banner, msr);
+}
+
+static void test_iir_noint(const char *banner)
+{
+    uint8_t iir;
+
+    ns16550_outb(uart, UART_FCR, UART_FCR_CLRX | UART_FCR_CLTX);
+    ns16550_outb(uart, UART_MCR, UART_MCR_LOOP);
+    ns16550_outb(uart, UART_IER, 0);
+    ns16550_outb(uart, UART_THR, '\0');
+
+    iir = ns16550_inb(uart, UART_IIR);
+    if ( !(iir & UART_IIR_NOINT) )
+        xtf_failure("%s: interrupt reported with IER == 0: IIR %#x\n",
+                    banner, iir);
+}
+
+static void test_iir_thr_source(const char *banner)
+{
+    uint8_t iir;
+
+    ns16550_outb(uart, UART_FCR, UART_FCR_CLRX | UART_FCR_CLTX);
+    ns16550_outb(uart, UART_MCR, UART_MCR_LOOP);
+
+    /*
+     * THR is already empty, so enabling ETHREI must immediately
+     * assert the THR-empty source.
+     */
+    ns16550_outb(uart, UART_IER, UART_IER_ETHREI);
+
+    iir = ns16550_inb(uart, UART_IIR);
+    if ( (iir & UART_IIR_MASK) != UART_IIR_THR )
+        xtf_failure("%s: THR source not asserted on ETHREI enable: IIR %#x\n",
+                    banner, iir);
+
+    ns16550_outb(uart, UART_THR, '\0');
+    ns16550_drain_rx(uart);
+
+    iir = ns16550_inb(uart, UART_IIR);
+    if ( (iir & UART_IIR_MASK) != UART_IIR_THR )
+        xtf_failure("%s: THR source not regenerated by THR write: IIR %#x\n",
+                    banner, iir);
+
+    /* Disabling ETHREI must retract the indication. */
+    ns16550_outb(uart, UART_IER, 0);
+    iir = ns16550_inb(uart, UART_IIR);
+    if ( !(iir & UART_IIR_NOINT) )
+        xtf_failure("%s: THR source survives ETHREI disable: IIR %#x\n",
+                    banner, iir);
+}
+
+static void test_iir_rda_source(const char *banner)
+{
+    uint8_t iir;
+
+    ns16550_outb(uart, UART_FCR, UART_FCR_CLRX | UART_FCR_CLTX);
+    ns16550_outb(uart, UART_MCR, UART_MCR_LOOP);
+    ns16550_outb(uart, UART_IER, UART_IER_ERDAI);
+
+    /* Nothing pending yet. */
+    iir = ns16550_inb(uart, UART_IIR);
+    if ( !(iir & UART_IIR_NOINT) )
+        xtf_failure("%s: RDA asserted with no Rx data: IIR %#x\n",
+                    banner, iir);
+
+    /* Plant a byte; RDA must assert. */
+    ns16550_outb(uart, UART_THR, '\0');
+    iir = ns16550_inb(uart, UART_IIR);
+    if ( (iir & UART_IIR_MASK) != UART_IIR_RDA )
+        xtf_failure("%s: RDA not asserted with Rx data pending: IIR %#x\n",
+                    banner, iir);
+
+    iir = ns16550_inb(uart, UART_IIR);
+    if ( (iir & UART_IIR_MASK) != UART_IIR_RDA )
+        xtf_failure("%s: RDA cleared by IIR read: IIR %#x\n",
+                    banner, iir);
+
+    ns16550_inb(uart, UART_RBR);
+    iir = ns16550_inb(uart, UART_IIR);
+    if ( !(iir & UART_IIR_NOINT) )
+        xtf_failure("%s: RDA not cleared by draining RBR: IIR %#x\n",
+                    banner, iir);
+}
+
+static void test_iir_priority(const char *banner)
+{
+    uint8_t iir;
+
+    ns16550_outb(uart, UART_IER, UART_IER_ERDAI | UART_IER_ETHREI);
+    ns16550_outb(uart, UART_THR, '\0');
+
+    /*
+     * Priority order is LSI > RDA > timeout > THR > MSI
+     */
+    iir = ns16550_inb(uart, UART_IIR);
+    if ( (iir & UART_IIR_MASK) != UART_IIR_RDA )
+        xtf_failure("%s: RDA does not outrank THR: IIR %#x\n",
+                    banner, iir);
+
+    /*
+     * Drain Rx; THR-empty is still outstanding (the THR write above
+     * re-armed it, and no IIR read has identified it as the source
+     * while it was the highest priority), so IIR falls back to THR.
+     */
+    ns16550_inb(uart, UART_RBR);
+    iir = ns16550_inb(uart, UART_IIR);
+    if ( (iir & UART_IIR_MASK) != UART_IIR_THR )
+        xtf_failure("%s: THR not reported after RDA drained: IIR %#x\n",
+                    banner, iir);
+}
+
+struct test_case {
+    const char *banner;
+    void (*run)(const char *banner);
+};
+
+#define TEST_CASE(b, r)     { .banner = (b), .run = (r) }
+
+static const struct test_case test_suite[] = {
+    TEST_CASE("THR",            test_thr),
+    TEST_CASE("SCR",            test_scr),
+    TEST_CASE("LCR",            test_lcr),
+    TEST_CASE("IER",            test_ier),
+    TEST_CASE("DLL/DLM",        test_divisor_latch),
+    TEST_CASE("MCR",            test_mcr),
+    TEST_CASE("FCR-togggle",    test_fcr_toggle),
+    TEST_CASE("FCR-trigger",    test_fcr_trigger),
+    TEST_CASE("FCR-clear",      test_fcr_clear),
+    TEST_CASE("LOOPBACK-data",  test_loopback_data_path),
+    TEST_CASE("LOOPBACK-modem", test_loopback_modem_path),
+    TEST_CASE("IIR-noint",      test_iir_noint),
+    TEST_CASE("IIR-thr",        test_iir_thr_source),
+    TEST_CASE("IIR-rda",        test_iir_rda_source),
+    TEST_CASE("IIR-prio",       test_iir_priority),
+};
+
+void test_main(void)
+{
+    unsigned i;
+
+    for ( i = 0; i < ARRAY_SIZE(test_suite); i++ )
+    {
+        const struct test_case *t = &test_suite[i];
+
+        printk("  Test: %s\n", t->banner);
+        t->run(t->banner);
+    }
+
+    if ( !xtf_status_reported() )
+        xtf_success(NULL);
+
+    xtf_report_status();
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/tests/emul-ns16x50/patterns.c b/tests/emul-ns16x50/patterns.c
new file mode 100644
index 000000000000..b47cb6345364
--- /dev/null
+++ b/tests/emul-ns16x50/patterns.c
@@ -0,0 +1,65 @@
+const char *pattern_4096 =
+    "The quick brown fox jumps over the lazy dog. The quick brown fox"
+    " jumps over the lazy dog. The quick brown fox jumps over the laz"
+    "y dog. The quick brown fox jumps over the lazy dog. The quick br"
+    "own fox jumps over the lazy dog. The quick brown fox jumps over "
+    "the lazy dog. The quick brown fox jumps over the lazy dog. The q"
+    "uick brown fox jumps over the lazy dog. The quick brown fox jump"
+    "s over the lazy dog. The quick brown fox jumps over the lazy dog"
+    ". The quick brown fox jumps over the lazy dog. The quick brown f"
+    "ox jumps over the lazy dog. The quick brown fox jumps over the l"
+    "azy dog. The quick brown fox jumps over the lazy dog. The quick "
+    "brown fox jumps over the lazy dog. The quick brown fox jumps ove"
+    "r the lazy dog. The quick brown fox jumps over the lazy dog. The"
+    " quick brown fox jumps over the lazy dog. The quick brown fox ju"
+    "mps over the lazy dog. The quick brown fox jumps over the lazy d"
+    "og. The quick brown fox jumps over the lazy dog. The quick brown"
+    " fox jumps over the lazy dog. The quick brown fox jumps over the"
+    " lazy dog. The quick brown fox jumps over the lazy dog. The quic"
+    "k brown fox jumps over the lazy dog. The quick brown fox jumps o"
+    "ver the lazy dog. The quick brown fox jumps over the lazy dog. T"
+    "he quick brown fox jumps over the lazy dog. The quick brown fox "
+    "jumps over the lazy dog. The quick brown fox jumps over the lazy"
+    " dog. The quick brown fox jumps over the lazy dog. The quick bro"
+    "wn fox jumps over the lazy dog. The quick brown fox jumps over t"
+    "he lazy dog. The quick brown fox jumps over the lazy dog. The qu"
+    "ick brown fox jumps over the lazy dog. The quick brown fox jumps"
+    " over the lazy dog. The quick brown fox jumps over the lazy dog."
+    " The quick brown fox jumps over the lazy dog. The quick brown fo"
+    "x jumps over the lazy dog. The quick brown fox jumps over the la"
+    "zy dog. The quick brown fox jumps over the lazy dog. The quick b"
+    "rown fox jumps over the lazy dog. The quick brown fox jumps over"
+    " the lazy dog. The quick brown fox jumps over the lazy dog. The "
+    "quick brown fox jumps over the lazy dog. The quick brown fox jum"
+    "ps over the lazy dog. The quick brown fox jumps over the lazy do"
+    "g. The quick brown fox jumps over the lazy dog. The quick brown "
+    "fox jumps over the lazy dog. The quick brown fox jumps over the "
+    "lazy dog. The quick brown fox jumps over the lazy dog. The quick"
+    " brown fox jumps over the lazy dog. The quick brown fox jumps ov"
+    "er the lazy dog. The quick brown fox jumps over the lazy dog. Th"
+    "e quick brown fox jumps over the lazy dog. The quick brown fox j"
+    "umps over the lazy dog. The quick brown fox jumps over the lazy "
+    "dog. The quick brown fox jumps over the lazy dog. The quick brow"
+    "n fox jumps over the lazy dog. The quick brown fox jumps over th"
+    "e lazy dog. The quick brown fox jumps over the lazy dog. The qui"
+    "ck brown fox jumps over the lazy dog. The quick brown fox jumps "
+    "over the lazy dog. The quick brown fox jumps over the lazy dog. "
+    "The quick brown fox jumps over the lazy dog. The quick brown fox"
+    " jumps over the lazy dog. The quick brown fox jumps over the laz"
+    "y dog. The quick brown fox jumps over the lazy dog. The quick br"
+    "own fox jumps over the lazy dog. The quick brown fox jumps over "
+    "the lazy dog. The quick brown fox jumps over the lazy dog. The q"
+    "uick brown fox jumps over the lazy dog. The quick brown fox jump"
+    "s over the lazy dog. The quick brown fox jumps over the lazy dog"
+    ". The quick brown fox jumps over the lazy dog. The quick brown f"
+    "ox jumps over the lazy dog. The quick brown fox jumps over the l"
+    "azy dog. The quick brown fox jumps over the lazy dog. The quick "
+    "brown fox jumps over the lazy dog. The quick brown fox jumps ove"
+    "r the lazy dog. The quick brown fox jumps over the lazy dog. The"
+    " quick brown fox jumps over the lazy dog. The quick brown fox ju"
+    "mps over the lazy dog. The quick brown fox jumps over the lazy d"
+    "og. The quick brown fox jumps over the lazy dog. The quick brown"
+    " fox jumps over the lazy dog. The quick brown fox jumps over the"
+    " lazy dog. The quick brown fox jumps over the lazy dog. The quic"
+    "k brown fox jumps over the lazy dog. The quick brown fox jumps o"
+    "ver the lazy dog. The quick brown fox jumps over the lazy dog.\n";
-- 
2.56.0


