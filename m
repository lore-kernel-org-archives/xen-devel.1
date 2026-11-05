Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A193606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=JT+pHz9A;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=hiB0JDp4;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=RgMHRHXv;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=TjJdanyS
Received: from list by lists.xenproject.org with outflank-mailman.1473381.1681027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmPr-0000ri-CU; Thu, 05 Nov 2026 01:37:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473381.1681027; Thu, 05 Nov 2026 01:37:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmPr-0000rZ-8k; Thu, 05 Nov 2026 01:37:23 +0000
Received: by outflank-mailman (input) for mailman id 1473381;
 Thu, 05 Nov 2026 01:37:21 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmPp-0000on-NJ
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:37:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmPp-000xTH-3c
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:37:21 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebddb9-bab6-0a2a0a5309dd-0a2a450be758-26
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:37:21 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebddcf-b7e8-0a2a450b0019-94a392179934-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:37:20 +0100
Received: from pps.filterd (m0367124.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mW5Z1469725
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:37:19 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11012027.outbound.protection.outlook.com [40.107.209.27])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hrdk511yn-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:37:18 +0000 (GMT)
Received: from PH0PR07CA0037.namprd07.prod.outlook.com (2603:10b6:510:e::12)
 by CH3PR16MB5843.namprd16.prod.outlook.com (2603:10b6:610:1b1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 01:37:15 +0000
Received: from PH2PEPF00048919.namprd05.prod.outlook.com
 (2603:10b6:510:e:cafe::7f) by PH0PR07CA0037.outlook.office365.com
 (2603:10b6:510:e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:37:14 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 PH2PEPF00048919.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:37:14 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50nDlC3230937
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:37:14 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hnydrnpbe-3
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:37:14 -0500 (EST)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id OmPfxdKHgmeVDOmPgxZoaF; Thu, 05 Nov 2026 01:37:13 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=zuj
	fODrMzhuoOtTw8KoD9MLBWhlkSYHoJbtVpREWChU=; b=JT+pHz9Af1JLdkJ83HN
	PLLXcn4eIoQy0RJW69h3YZzAFyyXOd/A4XD2Y88ExSKvNW4NQZG201NUDhb4LUlT
	tSLQ+VtmiKSL4ms+Amk2tdHCzMABK7E+wFPFP1ALJtmibNVvsyoE5ommJ4VUx717
	BAgAb1ZwzdenjwpOx7H2VkAMb7ZDB644BNcvQzs2JHNAFUJygDHCXr+V9MqZYy02
	IFQAv9PyaRyiKL+0a7vIYa3TdhJj/FMYq/tqxKgWAJy9BlGn5MixpFeBSaMmPZ/Q
	oHVbwt16P5opYmURlSm/+S9Gmv5JiikNmS6uaVXtV6df6oDBd9EloA263+ms24qT
	Rqw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9nu0rGVF0BGa72rupRwbfYRlsw2HF3r3zQcuQkLuT9TGTIWXE3Uud0wzir49B45QVXWSQH6MK3sCMB+Vn+55RTH5iDt3yDqW/OW/Pmdrg1+GWrTu8RkBaU0UWdMhLOGKJawpJu0B8F0baegY5CcCBYCvVFnXC8TgG/UagUTixGtl/xLZNC7Mvh4iaLYF43QjQzrsTnUJNRBdaY12rC2uI3s7aQRG7EZqE/l3m1hj7M/4daKgEuwRbJrCoBvKIk9GyilEuYCWCDf6dVS+oj9u3V9Rlgndd8EAq0XgufrG5Q80zIuNz4HIrbOEGNk0+9GeTBYRLDInTAZq/mPdmRzcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zujfODrMzhuoOtTw8KoD9MLBWhlkSYHoJbtVpREWChU=;
 b=GYDeRk2pR1nzLvq/GJQh/DKSra/MBdUjQWo325MDP9iRuVE1KPrFI+F6jEXaJFsQZhp0QMEte8oHFhFzSTjussaQEItBxBBTYbzPcRLe4h/7bPRJ3hWNxjrtNhbAd2DUSZCJ9yfgE0E+/ko1Hh9zSMFW6IHs7jVZisdBDp+mFkoD7gAHYZqQROkG/I3aLLW1YF9+lEo5dZrZV4PnlgzpnDBpa1rnr47kQkuVZJOPsL4ksGNKSCv4yhBZINYFh99KfEnxU70Xp4752IEXG5TSjoI3biC2iijrIGeUCVd0bIIM0VT0VkK7suENnJcklUYUJJ0hv+CCw2JvUD7zK9gxfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zujfODrMzhuoOtTw8KoD9MLBWhlkSYHoJbtVpREWChU=;
 b=hiB0JDp4cPZXW6tUe7NM0DFVX2vGr265UNAfsAErJNg/gAfeJEiXaQd3LQVz7lEqxSjK2wep3nWovwyyxcXJ5yCfCubzeaQv50Hp/TJ+xPlTWMWW65skhUVxkYWXE0IvanmS5YGwgCH01dmc4dQc5HVPZ/xF0CMy241MGpcQn6o=
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
	ppserprodsaar; bh=zujfODrMzhuoOtTw8KoD9MLBWhlkSYHoJbtVpREWChU=; b=
	RgMHRHXvXRfrVk/u9sxbxjfCOOURFHsDHLsOfxvvz6RK4Iki2d8A0pBUWKtQJv9y
	Q631x895lgScwDeRcKnmj6GQsBFtVMSQfU50jkLPNQk1Ir+jI8C/TXwIKqdSPbKB
	5r/SvXuS6hgPmSeg0fBXTl0fZmAMJg1ByH/nHWnL1DGCRC6b2pX69d9BAMnsMuFI
	19Ruo8THkfeuvo8dw1y90KtvZXXFjn9M22mUjkOEYu+RBn4SYYNbY/HSgUdsYeUZ
	pLv/2NJW7cdOClQ/FCB9NJoioqhByxx1NSFJ4PFSnlZ1BXxLFnhAUBSFuALuov02
	MqT88GNOXQnfS5iWBpdtvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=zujfODr
	MzhuoOtTw8KoD9MLBWhlkSYHoJbtVpREWChU=; b=TjJdanySDhS17JNeEcu0JRm
	PBE+Gsg3yshARg67k6XzOLX8816k46uZSyUqWAP2B1KxBZc4hE+Rk7dXDmIj9GD7
	TyM3YM7o2/Gb+XKcHdsJ5DVW/H/xirkX1cdLVBA/1HBSJYCBX7qf7EPNuHrCAl14
	nvyl+B1mEk8M9vNCFNQSe7UjAy2seuVBEA7knNnEnglwOnGpAZCJkq5j6W5gR0DR
	8wgalSRJxE4WeAxqMP+pfSZPe7FBQ6njcEW/oE7/u/gx6cbHfiuzr42qDCXtX2jl
	1fO2qeVsqjXNrvLzSfnHTLLmxtP63Z0fYsKW7t0yHjogdGSSLGBBT7ov8E2ebbQ=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmPfxdKHgmeVDOmPgxZoaF
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 03/13] CI: unify naming for hypervisor extra arguments
Date: Wed,  4 Nov 2026 17:36:51 -0800
Message-ID: <20261105013701.719658-4-dmukhin@ford.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105013701.719658-1-dmukhin@ford.com>
References: <20261105013701.719658-1-dmukhin@ford.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050005
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH2PEPF00048919:EE_|CH3PR16MB5843:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ff9b5b01-fc9e-47a3-967c-08df3add521b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|261026121527099003|11063799006|261021123027099003|261021121427099003|56012099006|261009223027099003|261102123227099003|261022075727099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	eEscxWOw0zFSSERa1CuplHZZIe/Kx8DCWHwnChWhzXzpxQRxOXD8JtKj2LRJGwiyjyxHOc6MTyhW9f0s/2bkg5iF91zR5Ja2gmVal/YcNfphw2OygUqwFcaBC0G7o0spFiQHvBibc3GVQRrX9YBhn429DwACWrxJypBQn/ttHSXoxbLzsZ44N31rEKOWDSXNVB4+pR/yntCjIbt7eUGswMhaXKGaG2UiOCyxN2iJ01iGpdZWXeC5nYPqnmj4qqe5ufPMSVxD7WRUss/RTcRBlksFlSkQpDcNiWlnd6rodMi/+WB0x8gmijZiy0wp5MGKulMTwD1FY1wEo1Vu95/MygUCqn4hwr3FU3ukIPCQ6rSHVmULOUI9cFYNMjd+XThPtYb5e5JiY99YIEHjk/sjRh3gm+1XlbxJCkGozrKOyVCKSQmlmomoqtJ5lvGTy1s0UjuwMqVoBMeJ1HgDckSK74sSGbdKKMCiSpzColOKgl+S/zllX8M5nVHb8Q1pG2SJ1Cb3IhdZdrPAy9hZDeMStr2HEZYULx/ULbnoPcD5h46mbfwUJZbaEoVNlAZeGRwsVc90P/qh23nu7M4GEem19Vb/P6CKsoxdTtMsS+WQXlic5+ueRc8qr+UGRt4YB7yhLwTCmUcHoa3XTaesTgoxpWVqc6Fj4T1tfv4wmgnCI2ueqbI9dTW3Ww6TbOqeu9jMB/N0vRP5Bjpo766cI5CFAQ==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(261026121527099003)(11063799006)(261021123027099003)(261021121427099003)(56012099006)(261009223027099003)(261102123227099003)(261022075727099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PI0iDt+1o8oFl7MxFHqEt/SleM+CO7MFLvMlV031G96L7B2Mx6MjkPKMpV8oRX0Y7IJY0W9/8mn+oAPMFo1IqSybfefZ13tb6Tl6OMu/Tp0Ek31nXXepmqExKSr+aTphBOpYmPLVTMNUMLqKl+OpzWepItR9RwZJVABdBCPWslze1UeHifip48UQR/TXpRhBwCfPpQMHwvSh5UhwnVmwYfoZ5mZMO+kAfkj0vyr7k1fe1rZ8QVLs1zo/lWC45gnREyaBZiRtsl2RhN3vcb8TLhc5SWRorvidFQ+Tq1ubbJJW2guuEXU5+8/EZ7qkFt5O/GnaeobesfIRkJNhwAMKEPvOQMzy4XtkXOXOEisYF2pVPOcPx/d5ymKLKh3jh2LtEpOioDy+0uov5KNZwCu53aQ0JP/w7vAEDi6pfNy+u0RbeCvTyMKuom+fI85uXIs6
X-Exchange-RoutingPolicyChecked:
	Uj4lmp/cqOieyxRO4FZEKU/KlcOCpMOP1VTkl4ZjrMZsIdjWwVeN3vrYm50c3CWO/ugLK5VGsXLttHENR7iIlSMKAzV8VGCG769eutEObxiRgV4VsNhvR77MP6siLezKFJ4cOfTmXFIIqdg8iSi4zy7N/UaxjDAs6Ck2uMvvH/G7MnUxMIrWmGS3q4CKLXTnL62IM2cgJWHzfYWBVOvQTJmDP3dzffO/IroiEJDkDJafdh3mR1Bddo3g29Sq3A2JKrjAW9dqGZkTz6vzUOlcURZuS7HDSWfHA5/HFyZ1uMZnHrGDZgZ6h6/KWLKqzNxU3FCpGIO6rTGQRiy2ocoydw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+W3OeRaDrPqyKazuochSXhnEyqWbxv+leGxiYdhyP3I3NU8l6qAyOwChRsDY1MqpHGxAvO3i4SqWV0RxPO9DmrpohuIyeo7UlLGMflWCXRoXtTEE2gSKz35VUxGi2Ucor8bidRT9P8wi034RHSrKf4w+8P7Vp79WvW1BX0eHS6epKJ7V2kRyjnpvHVcBvzX7EX5kgyN9kZWn8MQpQLUN4f09kjfVcGRNvWWpCIezLcrVhWHF6tse/0UM1SRUf3gG+4/2Y2i/gdBjQsaccvkzMmt0DkF68hzbuDPQNQTsNNIwF8IcbS+IDBCu3h9f6HhBIcm+UdCDxdf7Q1ysrwY3t4N1d+ro3iMb6KOWC+lS9cnLXA/Sa43/9G3QiGF1HgbxphtdpFmK7YzvdAqoGnchunk2OAq71/HdxeYluByc/jhoqeNrsO1tMwaKrWJHmZq0ZHfRR1GcYtz+BwYPnhRMGHbuiYSnuItH7eJwAxYBtPucOWuLFOeZ2cyliGAndKBiKRvEFvdNCm2dV8m8stkCMfyuKaF9/tdj9Eyo1bUgSrcFC3L4prylu3txuP/L8uhgVd4z5xDA9zL4Mp8DHm9reNe6fatxsqyR4gcCoU085RKlR3lEb9mjLYO0XViUwf0fjxgV8n5x431V483lkdr1mA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:37:14.8466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff9b5b01-fc9e-47a3-967c-08df3add521b
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH2PEPF00048919.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR16MB5843
X-Proofpoint-GUID: elxcNwdaW8WDbxOEV0XBj0QGt2o6uGgu
X-Proofpoint-ORIG-GUID: elxcNwdaW8WDbxOEV0XBj0QGt2o6uGgu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfXzHJs0noRi0oS
 MEowB1HjiUZNy+pbB1TO1SpqiD4SbD8tYDZp6OrxRkWlDEUKvnNULQHE/XJNm2CfnwWaAizI3NW
 beyqBSB4mheg6+SvT8ZT0nT4rjyw7p+2lMqnjaobNuM0XrUsRqXL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX6HwY3DwQNvxo
 kj6ftHT8iZjp2LE/OsRQLXJMv2Dx6W9sAjKEte5Rf7MMC9TEDz9UqPDE+Tg/bYab3Ak7V8KX25p
 YvH3iHD2i1/Fx5d+YgXi/i/exwLeUdBF9yPn8xUC52E/w9vu8vtuZpg5PjLHaEk4qwJfTzDQskI
 c8/3/gF9qQoOYwm0BofmKsknT+mkhW/lWcvjxWetQ2GQCvZfrE/EH+90GHhUkHitfH8ozwuyjs2
 2mW1c637qi/P00xbBhFPd9OyfRowORygN+ASBF5EFg2fXYvPEXv8fE8lsdLa9bRW2+VrVCJ4Qw6
 Balbca9ZSCWgHuPsAXO/delXFPbic1iSf95iJr2owQkOlpZpp70zNvUuiXQ1TgLbdODzQATPuoc
 UtDFXX+Y0I/K6xrJ00c3TZEI4v2WmvXdbROXY3yqbUl79nS3RK11cqcrNqTsDLdxm6+vGSlIbZb
 IAumMcyUMtezjR23B5Q==
X-Authority-Analysis: v=2.4 cv=BOImP1QG c=1 sm=1 tr=0 ts=6aebddce cx=c_pps
 a=HiuaN0cSM6iMs60el9to+g==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=YJXg7OVxOWrJwj3yZo-i:22 a=cbNQJ9GKAAAA:8
 a=Z880l8yvlKrMw_Gkw6kA:9 a=P0bj-C3X3jJDpopQwM1U:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050006
X-purgate-ID: tlsNG-42698a/1793842641-AB0DD9EA-DF2C9586/0/0
X-purgate-type: clean
X-purgate-size: 2117
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Update the name of environment variable used to append an extra
hypervisor arguments to 'EXTRA_XEN_CMDLINE' for consistency
with existing 'XEN_CMDLINE'.

Not a functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 automation/gitlab-ci/test.yaml     | 2 +-
 automation/scripts/qubes-x86_64.sh | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index f984c34a922e..047c4d513a65 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -177,7 +177,7 @@
     PCIDEV: "56:00.0"
     PCIDEV_INTR: "MSI-X"
     XEN_CONSOLE: "console=com1 com1=115200,8n1"
-    EXTRA_XEN_OPTS: "fred"
+    EXTRA_XEN_CMDLINE: "fred"
     SUT_ADDR: test-22.testnet
   tags:
     - qubes-hw22
diff --git a/automation/scripts/qubes-x86_64.sh b/automation/scripts/qubes-x86_64.sh
index 73cbdff2be72..580a1e86f1ef 100755
--- a/automation/scripts/qubes-x86_64.sh
+++ b/automation/scripts/qubes-x86_64.sh
@@ -260,14 +260,14 @@ TFTP=/scratch/gitlab-runner/tftp
 CONTROLLER=control@thor.testnet
 
 echo "
-multiboot2 (http)/gitlab-ci/xen $XEN_CONSOLE loglvl=all guest_loglvl=all dom0_mem=4G console_timestamps=boot watchdog ${EXTRA_XEN_OPTS-} $extra_xen_opts
+multiboot2 (http)/gitlab-ci/xen $XEN_CONSOLE loglvl=all guest_loglvl=all dom0_mem=4G console_timestamps=boot watchdog ${EXTRA_XEN_CMDLINE-} $extra_xen_opts
 module2 (http)/gitlab-ci/vmlinuz console=hvc0 root=/dev/ram0 earlyprintk=xen
 module2 --nounzip (http)/gitlab-ci/initrd-dom0
 " > $TFTP/grub.cfg
 
 echo "#!ipxe
 
-kernel /gitlab-ci/xen $XEN_CONSOLE loglvl=all guest_loglvl=all dom0_mem=4G console_timestamps=boot watchdog ${EXTRA_XEN_OPTS-} $extra_xen_opts || reboot
+kernel /gitlab-ci/xen $XEN_CONSOLE loglvl=all guest_loglvl=all dom0_mem=4G console_timestamps=boot watchdog ${EXTRA_XEN_CMDLINE-} $extra_xen_opts || reboot
 module /gitlab-ci/vmlinuz console=hvc0 root=/dev/ram0 earlyprintk=xen || reboot
 module /gitlab-ci/initrd-dom0 || reboot
 boot
-- 
2.55.0


