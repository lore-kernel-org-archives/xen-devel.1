Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB08A606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=tZifbnWc;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=i3A/YhNq;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=ORVSEUKw;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=t0MH9/Px
Received: from list by lists.xenproject.org with outflank-mailman.1473223.1680893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNd-0008TV-Dc; Thu, 05 Nov 2026 01:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473223.1680893; Thu, 05 Nov 2026 01:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNd-0008TG-6v; Thu, 05 Nov 2026 01:35:05 +0000
Received: by outflank-mailman (input) for mailman id 1473223;
 Thu, 05 Nov 2026 01:35:03 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmNb-0008B4-Iv
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:35:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmNa-001wz8-V9
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:35:02 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd20-2eae-0a2a0a5409dd-0a2a450191ee-26
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:35:02 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd45-5984-0a2a45010019-94a39217574c-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:35:02 +0100
Received: from pps.filterd (m0384718.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50n8nV967253
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:35:00 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com
 (mail-westus2azon11010009.outbound.protection.outlook.com [52.101.46.9])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hrc5ghv2k-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:35:00 +0000 (GMT)
Received: from BY1P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::9)
 by CH4PR16MB6603.namprd16.prod.outlook.com (2603:10b6:610:228::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 01:34:56 +0000
Received: from SJ1PEPF000037A4.namprd04.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::ab) by BY1P220CA0024.outlook.office365.com
 (2603:10b6:a03:5c3::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:34:56 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 SJ1PEPF000037A4.mail.protection.outlook.com (10.167.244.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:34:55 +0000
Received: from pps.filterd (m0426315.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mP0C3108414
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:34:54 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4hp33swayu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:34:54 -0500 (EST)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id OmNRxkWJTqQa1OmNRxYl2S; Thu, 05 Nov 2026 01:34:54 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=wKw
	xSCddw3N6g1jdEGFy2Ei+Ah8bdjLIK81kbPqdH28=; b=tZifbnWc4GScEbJz9Jp
	xuqM7jQyQdARrf2SOuO4aQ/DC/6sCt+C8raIZv1ltUMW+z5Axie1Qb6WQqxRSBOn
	XbqXRUJ3NwVVqmVdiasV6E0O+S4lFqRMa+ySbdtLQ9OBYeALzY/oO+vP/OWto5qo
	xjiUF5gnIDeKc8bL//I5MDkh7nhrfHhN34OsJikxnPKc8PyE9t//4OiUrJNpe1Gy
	fdQP7EQxjyrFRJGfhqszsTrltT1/NWalaGYbIzEA3lE4t4L9fthdnivJicuTGgak
	Q2v6Zdt5zo0w1liazNXf9GwqcTzD9KyaxWesn+6rJJUilDJ5X/gb5VD2C7eRBpJJ
	rnw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qHzM4fuo69yaBHBcRKydFy04Tqna1brjS8wbPmhFtVPHO6iB2BWoGLgEKqPQFcOWIodEYe6DvOUO7vpu9rwnSE9FujOmzHbC112mCDY5DMBXGXjA00LxrQ1hQQRvp5B7TONlsH6mYEx4LxElC3gpOMUiIb4GFudBowW59zmnI6f34GGX7jEjAefLessjKpcn/knNnv8A/E1Ul8if7EBT1DxcTDSTyG4odQwjRsn1aLhr8UUDm9pUTNbWZ6FcBmyZ7pPjLeXunwDTFWncgJMShR5//6Z1G9P+C4piLml/b4yDFiazXOzc67/g1Zkmbbw92ajOWNVhNd8SU1B7Z+1GTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKwxSCddw3N6g1jdEGFy2Ei+Ah8bdjLIK81kbPqdH28=;
 b=PXaLOubTMpOkq+Oy8xsHEIQO3dhP29IVjSqmUUQzmGJ5nJ5xycT2THdVC/zLTg50S/mowrRL/rdqVlgxnA22aU4/z4mvgrm9QVAn1j+BCl4PbP1J+h9u1MrRGJhjZN4EMLQRLDiNqIQ9bIQurlPcuHhSaTrI6fdr6tArmZxtYHm0S/rW4s/GcGHxHzCyUNlUy1Q+oYQjqtcladBAa6U8LbW6I/lWpY4zZKACTbLuzzXWsKS/zrmDPOVIgG+4V2RTq4YxJ8r1xUcrTKxke58Nx/psk35ddBMdkQ1s2dl/sg0BWb4uCkT/Me5BXc51cVP+tlvyRzVqhhHFiSB/ALsZNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKwxSCddw3N6g1jdEGFy2Ei+Ah8bdjLIK81kbPqdH28=;
 b=i3A/YhNqs/o3fkjd/WTldIsW43OfJNdAly2i18kbN1FArgoWkpQaOXWTfo2+5MZ4gjseTOr98vkPwKwhB7tUEd7Bi9bmsxh7MuVPeHzGa9zox2BzyfZJPhsT7LdaLXma2AYZZosvVQsvGSe6XKJOYCndHzFmTG6hhPH5R9oTGdA=
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
	ppserprodsaar; bh=wKwxSCddw3N6g1jdEGFy2Ei+Ah8bdjLIK81kbPqdH28=; b=
	ORVSEUKwAh1vWZKtOIWQg3XqYaHCDNDfWR7MCQwT8JPiboIrY07ssTOr/+5kRxc1
	88qxVAxglLB/E6TD9CWvFXOMBe/BTDuKXsaIX2GbV64RNsdIAgRC1/du9QHImlx3
	j78obmiUX5pYpXyauDW2JZTIsNzcJ8vMB9yTaF4o3AR3nA5oAIPoFNmmvVbrf7SA
	tI3IHOBFCsRHo+x2ckDJz9A6llHNWL6B08Chjn7LtXZqDsdAOO2ZXRmbbrzIidAA
	n64nzkuLalxwMjBh55ZjjNMX7IWSYwIM96xrO34hN6KxWW8VoZemD8/qj/kphn2S
	4Q8UyKV6GP7klBYgVR+NmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=wKwxSCd
	dw3N6g1jdEGFy2Ei+Ah8bdjLIK81kbPqdH28=; b=t0MH9/PxqSs9lHttD6OvrmK
	TBGVGi03o0Rq6Bpg7q3YtaVsaAg1OemB1Qmoj/4nKWZEDNX9zfpe12mNrJn/vzFv
	RPB93w1dzuGNIipBEyyGIE18C78BtfE/qb5ENP1+NPr1zaY1IsU/tPTErlTW1FDT
	ki4yi+s6xC8/dzeu1bOEQqlEqIalBeHmPmy+u924yw99bdQCDwdtTLuiA5fvs9Vv
	q6R8dSkk+Cc4rZdA/DTESS616dyxSVwwlhfvq+50RnHYP5du9tANFfFKS43IyMP2
	Ai+DeOtx3Txbc2IqOx1h/bLY4o5FWEcGv0nDcKUz0gQaONKvtzhcUTFRtetDp+A=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmNRxkWJTqQa1OmNRxYl2S
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
        roger@xenproject.org, teddy.astie@vates.tech, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 19/28] x86/hvm: avic: enable SVM AVIC statistics reporting
Date: Wed,  4 Nov 2026 17:33:36 -0800
Message-ID: <20261105013347.719392-20-dmukhin@ford.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105013347.719392-1-dmukhin@ford.com>
References: <20261105013347.719392-1-dmukhin@ford.com>
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
 definitions=main-2611050005
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A4:EE_|CH4PR16MB6603:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6fe61f51-917c-4c52-91bf-08df3adcff44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|11063799006|56012099006|261021121427099003|261021123027099003|261022105027099003|261022075727099003|261009223027099003|261102123227099003|261026140227099003|261026121527099003|261028144727099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	h20bseIsp1ZswDcyQfJWX/lB6a4AQAkJDWeEc7KW1ZFCDPnr/8gzyUj3MEYXpeO2ChjWpPlN5+FL6negjkR5M4UkRvWogiXWN6ooH5ye9zS1mdgB050tLii9XiLyaDyKj7BQMKucpzYWy/AO2bgQdw+VYFdRKnHYoSVMakzsPYGR4SbCYslsN5TDQdhuCweoF0EkabKw8enac9sU8XxWT1z/QZFtuRyteqPuQlLy8Y+5BnugFjF0WOZbJwuIeHgXcfHg6iAJZom46ZCTWF13FZi4nkUcmNeiP5p5tB3h/YENkk8KeYlnFjdqy2GmtmajQD5r6q0ncPtr8SkVqVBQc/PMgujVsKtB2XBoofXlIfWkEtzaSCNcImPtbjiJEYOz+OZtwH9+9Eax6qUQQQ2qPOHVT2vxjRDoLvUjJNJY5rluRTl9lsuRADINJh9qYxl7Fxk8cgPmqW7qVMDx/kqZMaMdAr/Vz6JdLFSuXm3/iQawFpPs/WOrgSphNTeP+2DeU84AZshJiUlvmJFGMC+wkP7EFscC8gGz5jsVKKKNG030wHFvwg3Q/C8Ogh4ABC7Wz5K6gfaMzXLvxJgfqFfoXreYOtTUgGPjwS7XfhZY+Kcnn9nS5xkam6Y6kpEbom7OMmkHoM+C8Q82GjdT6UxV7NmuARoLtRib1xWdju1y7Vk+Z4AZSaxRLJVRx1/7GmTJ7e3AUzO7DmdYA+BvIXnJLQ==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003)(261009223027099003)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kJXV3LOEkfXMJx12rsTy3t/XIp/2Rzh3wUyIJwI8FWA197TwjK3Rl6djXKpeiib0WVpT87WutnswRUYEzO+jOx2KnldzK1kVq0LxEHOhgf0BwhQbHqXktEHisdhVi76IdzQ5z2edwQfwIQEwIW90vZd0/O2LN3tovq9M7M4o8T+uxdtFvxxdbO0V71JHB7pI2raDC7W+eHdlsiiITs1LHrJSB3PIYPAN7nKMS4mFZct+I/GE2RJxKeYY6YuK6Vi7TOggqB4x7DvcyLe4RJXabRRnZn+sfhJqNM9/YGBC1vWrV8x/q3rI0Ptx/HVWfDSO5/Tn4r/+4cS82+JO7ukQpXbkxVjAxCPtBKHDyH2TpJFQ8yrciOH1EHT0RykpJlv5sr6XAYztI5vohhWvY8mzffrsT0neeNyooY/CqIWQ7cIEX2h29GdLJJD/soM9UpTp
X-Exchange-RoutingPolicyChecked:
	I3LNy89iHPi5eAchmlNhv9vAcJ+DZWZqN/hkwASALe+GI95rnXS2aR1xgI9ZIDCmYMSimNv15ZhnWuzUhLgPOUqTLil1zJFbgcay+x5P8cctIEgZAxe0jpR9C3lmYRgdlwGv66oYCGfcKCZVRpITAAHUdN7ceu3E6zMfUKu2Nvq6MPRPOXTYt5ygP13T5H1wjuW7RY/6cFNyh8ZWXmEvdkUPYFFsUN+h5oO1nK0i9iFJxCBCoKxF0twAsjbtZdItP9fqFVqxp7dXpxzHYy2JyudPeZdUuk7jzaXohUKbv5xZ36IsKtQjtd9QRpgrzxn9ZqwffC5JegVTXt90a9Bh/Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	potCOeB1GtCc/bOEohpzo5kJYanriDPWuCgVTnz2b6SQvAWgjUL6XOspMhNx0+2k13z4vtlVgSHpHq3HijfZdAWGc6AA2jSrSQxQcIoN6uVuYN2e0WCJcQvFsHmiAViVbo3GHOBHaQhtoYiP4rancDiNwuLt9dx9E0GA6446ctDMACUHSAeAgrxwM+qcUJv+jfsSJhbjVjuz7cFjIe+2bASXHkuwwV2E4NrnSoqVaAqa8BgP9vcibjqNIQRbisCDk37W44KWC/Ln9lhpKS4BygBDLQ+qHHRCKU4aqvqyiipHiUlmWfiPvJ2985sfzqq8IkQzsFHzXfxksV18xe2+0d9ZD8S6SOHv7ibMY1i4nhMb7ux9UFnWARQ/30fKfyWhnh+W65rSEHlrWmroo4Tbr43WNH5K1kJZ0VgjVogY1DDON/YLU+MtAFr68GeFKTNy2aFIkQ3jWTwu7gFFACFdnUwo+UMLer0Mo2UnTRPGMp9a3SvWzY2kyBev1bbE2jzgzxUiUvRIauSdtGBp2McIca5hh2ICMPO6mrrHz0/ARAR0F9U/m9r7wmNXSPExldAfNiZu1nkDu6Hi3Db3uxLS4Qu0ErQhrTE7mcB6mOynVktIH1mfFPTUjom39YGxz5BVS1aJsAMDAv8QEAQ85d7FSw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:34:55.7100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe61f51-917c-4c52-91bf-08df3adcff44
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR16MB6603
X-Authority-Analysis: v=2.4 cv=JawpPkKV c=1 sm=1 tr=0 ts=6aebdd44 cx=c_pps
 a=aX6hwv3pUrsX0fnHaj1tZQ==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=ARvDHhclS48edyKYUbLB:22 a=cbNQJ9GKAAAA:8
 a=8c1b9s5flN10_E_f-5UA:9 a=3whSkbs7g9Me0DR5EJEX:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX1d1xnYn64a/c
 CtC5gKMlR6SWgDJ+y0wze84DxO7P//DBBF4Za8YF7sOiCaEPplunHLdklxI92vfG6fFr/UpgRNc
 /k6EG+0Ttkrk6OIu7PtwolEFxNcHbaOZud7p2Oylp45aPaJfz2y83tHvsjai457WUbcwMdlACMb
 TxwNAqjz6yhZNVisi1BTcXkVQzvD4Id2cWZ3rEWSsYMc2BvNVfy0gb/aLaQOngJTu/UKkRie0E9
 dr+kLJ0isnVUe/lktLcMN2V8j+5Fv1zbbnqFGFi6+CINMLpaO+xChLPu/9dyuK+ivIo+368qoam
 Fzn8bPi4LnWuDMNQdiOLs+Yu5A9spf/6kGKUR9jbDj7oKp41Cq4cpqYOZxmhyvnflSL7tXIcQt4
 8kZiA+sfnCtWPzn+Kg3ef9Ic4KbFjk2Hl2W8Pnmyketw01Y40H2PPeTcwlHeezLF9puNDpHcnuf
 P8ryJRK5JASfl9r2wow==
X-Proofpoint-ORIG-GUID: uMYsOMqY2WNkYA1keQ_4BIw9WvrU3gWQ
X-Proofpoint-GUID: uMYsOMqY2WNkYA1keQ_4BIw9WvrU3gWQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX+Ythho2ecsGb
 mkc0/6RcV3Zal6RcUlulGEjwIQwr2b5Uv45oEKefZjxLDnvqObRcu9lMnU8I0Ekpv4UhG0nNrzn
 DOtnCTG4XLVTj/1+IEUlJf2qMyPOlqMpCmRrwm/hZDLyB9sjwl8Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050005
X-purgate-ID: tlsNG-d62444/1793842502-1D87F757-4AC6D9CE/0/0
X-purgate-type: clean
X-purgate-size: 5608
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Introduce performance counters for AVIC.

Enable statistics reporing via new 'dump_posted_intr' mechanism.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/hvm/svm/avic.c              | 50 ++++++++++++++++++++++++
 xen/arch/x86/hvm/svm/avic.h              |  1 +
 xen/arch/x86/hvm/svm/svm.c               |  1 +
 xen/arch/x86/include/asm/hvm/svm-types.h |  5 +++
 4 files changed, 57 insertions(+)

diff --git a/xen/arch/x86/hvm/svm/avic.c b/xen/arch/x86/hvm/svm/avic.c
index 0bcab0465227..4dcd2c94ea87 100644
--- a/xen/arch/x86/hvm/svm/avic.c
+++ b/xen/arch/x86/hvm/svm/avic.c
@@ -201,6 +201,17 @@ static void avic_vcpu_enable(const struct vcpu *v, bool enable)
            v->domain->max_vcpus);
 }
 
+static void avic_stats_reset(struct vcpu *v)
+{
+    struct svm_vcpu *sv = &v->arch.hvm.svm;
+
+    memset(sv->avic_cnt_incomp_ipi, 0, sizeof(sv->avic_cnt_incomp_ipi));
+    sv->avic_cnt_noaccel = 0;
+    sv->avic_cnt_post_intr = 0;
+    sv->avic_cnt_doorbell = 0;
+    sv->avic_cnt_kick = 0;
+}
+
 int svm_avic_vmcb_create(struct vcpu *v)
 {
     struct domain *d = v->domain;
@@ -237,6 +248,8 @@ int svm_avic_vmcb_create(struct vcpu *v)
     ACCESS_ONCE(*sv->avic_physical_id) = entry;
     ACCESS_ONCE(sv->avic_shadow_id) = entry;
 
+    avic_stats_reset(v);
+
     avic_vcpu_enable(v, true);
 
     return 0;
@@ -380,6 +393,8 @@ void svm_avic_vmexit_incomp_ipi(struct cpu_user_regs *regs)
 
     BUG_ON(sv->avic_physical_id == NULL);
 
+    sv->avic_cnt_incomp_ipi[id]++;
+
     switch ( id )
     {
     case AVIC_IPI_FAILURE_INVALID_INT_TYPE:
@@ -627,6 +642,8 @@ void svm_avic_vmexit_noaccel(struct cpu_user_regs *regs)
     uint32_t offset = vmcb->exitinfo1 & AVIC_UNACCEL_ACCESS_OFFSET_MASK;
     uint32_t rw = (vmcb->exitinfo1 >> 32) & AVIC_UNACCEL_ACCESS_WRITE_MASK;
 
+    sv->avic_cnt_noaccel++;
+
     if ( is_svm_avic_vmexit_noaccel_trap(offset) )
     {
         /* Handle AVIC Trap (intercept right after the access). */
@@ -675,6 +692,8 @@ static void avic_deliver_posted_intr(struct vcpu *v)
         /* Ensure the pending interrupt wakes vCPU. */
         vcpu_unblock(v);
 
+        sv->avic_cnt_doorbell++;
+
         /*
          * AMD APM, 5.29.8.2 Doorbell Mechanism
          * The serializing semantics of WRMSR are relaxed when writing to
@@ -684,24 +703,55 @@ static void avic_deliver_posted_intr(struct vcpu *v)
     }
     else
     {
+        sv->avic_cnt_kick++;
+
         vcpu_kick(v);
     }
 }
 
 void cf_check svm_avic_hvm_deliver_posted_intr(struct vcpu *v, uint8_t vector)
 {
+    struct svm_vcpu *sv = &v->arch.hvm.svm;
+
     ASSERT(v != current);
 
     if ( svm_avic_vcpu_enabled(v) )
     {
+        sv->avic_cnt_post_intr++;
+
         avic_deliver_posted_intr(v);
     }
     else
     {
+        sv->avic_cnt_kick++;
+
         vcpu_kick(v);
     }
 }
 
+void cf_check svm_avic_hvm_dump_posted_intr(const struct vcpu *v)
+{
+    const struct svm_vcpu *sv = &v->arch.hvm.svm;
+
+    /* NB: Do not gate with svm_avic_vcpu_enabled() check for tests */
+    printk("%pv: AVIC: incomp_ipi = %"PRIu64"/%"PRIu64"/%"PRIu64"/%"PRIu64"/%"PRIu64""
+                     " noaccel = %"PRIu64""
+                     " post_intr = %"PRIu64""
+                     " doorbell = %"PRIu64""
+                     " kick = %"PRIu64""
+                     "\n",
+           v,
+           sv->avic_cnt_incomp_ipi[AVIC_IPI_FAILURE_INVALID_INT_TYPE],
+           sv->avic_cnt_incomp_ipi[AVIC_IPI_FAILURE_TARGET_NOT_RUNNING],
+           sv->avic_cnt_incomp_ipi[AVIC_IPI_FAILURE_INVALID_TARGET],
+           sv->avic_cnt_incomp_ipi[AVIC_IPI_FAILURE_INVALID_BACKING_PAGE],
+           sv->avic_cnt_incomp_ipi[AVIC_IPI_FAILURE_INVALID_IPI_VECTOR],
+           sv->avic_cnt_noaccel,
+           sv->avic_cnt_post_intr,
+           sv->avic_cnt_doorbell,
+           sv->avic_cnt_kick);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/hvm/svm/avic.h b/xen/arch/x86/hvm/svm/avic.h
index 098924925e89..24d5fab59b29 100644
--- a/xen/arch/x86/hvm/svm/avic.h
+++ b/xen/arch/x86/hvm/svm/avic.h
@@ -33,5 +33,6 @@ void svm_avic_vcpu_switch_to(struct vcpu *v);
 void svm_avic_vcpu_switch_from(struct vcpu *v);
 
 void cf_check svm_avic_hvm_deliver_posted_intr(struct vcpu *v, uint8_t vector);
+void cf_check svm_avic_hvm_dump_posted_intr(const struct vcpu *v);
 
 #endif /* __SVM_AVIC_H__ */
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 2fac76725c4f..83977d411b0a 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2519,6 +2519,7 @@ static void __init svm_avic_start(void)
         return;
 
     svm_function_table.deliver_posted_intr = svm_avic_hvm_deliver_posted_intr;
+    svm_function_table.dump_posted_intr = svm_avic_hvm_dump_posted_intr;
 
     svm_function_table.caps.virtual_intr_delivery = true;
 }
diff --git a/xen/arch/x86/include/asm/hvm/svm-types.h b/xen/arch/x86/include/asm/hvm/svm-types.h
index cc40b1b02095..ac411f781ed4 100644
--- a/xen/arch/x86/include/asm/hvm/svm-types.h
+++ b/xen/arch/x86/include/asm/hvm/svm-types.h
@@ -53,6 +53,11 @@ struct svm_vcpu {
     uint32_t avic_dfr;
     uint64_t *avic_physical_id;
     uint64_t avic_shadow_id;
+    uint64_t avic_cnt_incomp_ipi[AVIC_IPI_FAILURE_MAX];
+    uint64_t avic_cnt_noaccel;
+    uint64_t avic_cnt_post_intr;
+    uint64_t avic_cnt_doorbell;
+    uint64_t avic_cnt_kick;
 };
 
 struct nestedsvm {
-- 
2.55.0


