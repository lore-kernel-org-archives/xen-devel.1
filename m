Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80545C54F53
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 06:51:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372099.1619513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wobf4-0002gq-Mh; Tue, 28 Jul 2026 06:51:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372099.1619513; Tue, 28 Jul 2026 06:51:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wobf4-0002gh-Io; Tue, 28 Jul 2026 06:51:34 +0000
Received: by outflank-mailman (input) for mailman id 1372099;
 Tue, 28 Jul 2026 06:51:33 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wobf2-0002fC-Ro
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 06:51:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wobf2-00FyOR-86
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 08:51:32 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a68516c-bab6-0a2a0a5309dd-0a2a4504c804-22
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 08:51:32 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a685172-b57f-0a2a45040019-94a39217ae0e-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 08:51:31 +0200
Received: from pps.filterd (m0367124.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66S6G6EZ728431
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:51:30 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11013059.outbound.protection.outlook.com
 [40.93.201.59])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4fpq0nr6yy-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:51:29 +0000 (GMT)
Received: from MN0PR03CA0015.namprd03.prod.outlook.com (2603:10b6:208:52f::17)
 by MW5PR16MB5056.namprd16.prod.outlook.com (2603:10b6:303:1c0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 06:51:26 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:208:52f:cafe::47) by MN0PR03CA0015.outlook.office365.com
 (2603:10b6:208:52f::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Tue,
 28 Jul 2026 06:51:26 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.1
 via Frontend Transport; Tue, 28 Jul 2026 06:51:26 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66S6YqJx280912
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 02:51:26 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4fnc6atkh5-12
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 02:51:25 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id obetw3WBzjJj0obeuwDnUA; Tue, 28 Jul 2026 06:51:25 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=FfU
	mF3lDqPHPO10oFYinrvOJ4TMnoZNSWgcuFZ8UNqQ=; b=CUg/dmYc+kq9oMgzDP3
	rz9zJqTYQNpwxpSAQn67MWU7EiYBSe0KEPHcbeIsVgp9Q541vnDqYg8jwDmafrdC
	4Hxp9YivFDE8aU822XIOddglnwkDrtnjMQeQ2bTH4ud7S0iBLBLuWbD1/oPNWli+
	vH3x0xGiUZvX1XPy+34e00AcBwDyB4tAOxzH+wRDBGFkoDnDT08exT6EjWDohSml
	uyrXFyqXG5MGOeu71VS6GGyp5Vaagp1+ppcwiUQwS99An/x4A/xFecbHrTx1ZFL5
	hLm9VCabsagYIFIPoAFmJOpbkloa1ZO62XWRg/Kgp9GJnD0VKVU16Xy3UbxKaBpH
	Ijg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cdGbWU99WVKCyA+3Fc4sCHZHC1wCDK7ywdJErVtp4ZlQ5gMFwIUKFyNVNF5z47eVgbUdzMFhcKe+Wzczb6tE4wcBPZS7NoTci0TntwB1y1py0ATf/NOpT95XLtr5970Gr2NS+//cfpybVaTdySjBXSr01NP2txul+RwqlCSCEyFz3Dq0E+eo3qw7v6LSAKogjWVRJ8H7utoKT+fEVfne/ZsdemtFTL/pEAPex5psW/mFHOqys7xvyI0KCsnu+K6v2uoN1TYqd+rPDbKDNlH/m6jflCeVSJd+IaInI/1e4AUqjxCPWVQq5rTESyAbdFUNv0FM2UM0mL+80uu1IpGZwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfUmF3lDqPHPO10oFYinrvOJ4TMnoZNSWgcuFZ8UNqQ=;
 b=nvfjA6o0+TvagLjQjlRvZU6j5ZVzgNggNr262P8xPUVrYi7uqhgFE4vH5ujqVOV9mJjr0kpKP9G6GbLGLIVV8LThtmvUB/a6AYF2xGAAIZy4vDmzfGypN92F4ICRJOI60z6YW5xJmEi7FWR0IBJgLeAjkw1wivjvIrCWZIxeGQbgjGRjb8dL9TtJ+BFPIXgL+gOUrWsOZwmpewqAdF8Osn7ddWFBG0E3rxYk7LTpXePOZ5oyIPjDq2qUNzPDGk6HsKtbkwcFrSt3SGB9GyuUqiJB5Y03ImTSOh/7DSBfYFvT8IVFxyrhjcdzSqJXyZYA06kSCB2Om9mgDu1cUzjAOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfUmF3lDqPHPO10oFYinrvOJ4TMnoZNSWgcuFZ8UNqQ=;
 b=G2Bc4GjS9tuzzxezJUfXJZJ8XqpM5dScGbZ/ib22tMyiFCaMkulrCR/UrcRdIueKzS7drLzgGM4D9+SGIGy2h2BRA2kTHPYu0vNqSlEFwhimlZaZcxugKarL7pAYgUTTqjZDMvutu6aUcgKQ2WuMfFdiDIpjMo4ji2h0NByDTfQ=
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
	ppserprodsaar; bh=FfUmF3lDqPHPO10oFYinrvOJ4TMnoZNSWgcuFZ8UNqQ=; b=
	mBxh6I+Cctv/XQw1NConyFDIxWze9yhMJ61tn24saAu0egeHvWxoF0dOLT4vx6f0
	A2D1h/8S7DJHoGjG1+0LkXfknm8sYoCMLr7YGwP7yWFI8XTH2+7NLrHFbobKbtsB
	0D8AZL05jeEKXEPWv9+aUJUqlMfWwgC6nsnF7rf4J4nZjyymg2KwK9QVocwSF35c
	bUYt7CQUcaXEcRB+J0qwWjI7htiWWkIic2GvTK4J0SaP+b3QiItnlZDrmCRXfTRW
	UABhd2gEaZ55RKAqLFRuODXdYwMhyvqUIvflHE9N8D6N0ugNp1libyQfARmRKL8c
	Oyv4BZOG9QEvugm2sg5jew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=FfUmF3l
	DqPHPO10oFYinrvOJ4TMnoZNSWgcuFZ8UNqQ=; b=uHk6IU5bdHFADXPVw86aAKw
	nCK+s764qUxgvP1wzFfQoKu+x9bo6+DuzEJed0ISb7r37ftHZxY5mTu6QLdpkabu
	SFH+LK6VlvAOOKwK0hRQFMM/xOkUMVe2jxIZszcgWFZwD2Yc6M4wmprpDBgwzOK3
	BCs9JW7cTo08JdPWIy+FLUvUySBL0FKapFahFFRJKk3MA1uDpwzjxodHkhi7nJ6m
	fKF7xrw+lJ+pCnclXue22W65lrlSsYGQ3DThZGtGFtLPQdgNhSxZ53QZvtOxYI5f
	v7N9ex7SR6rohP5Ir07RoyP5wYVYRms6zcCDYPS5uncrcK66xMVKw658F+SdFiA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: obetw3WBzjJj0obeuwDnUA
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v8 4/7] xen/serial: switch txbuf runtime allocation to xvmalloc
Date: Mon, 27 Jul 2026 23:50:46 -0700
Message-ID: <20260728065049.1318143-5-dmukhin@ford.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|MW5PR16MB5056:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d9dd3ef4-098a-489f-fcd3-08deec74a533
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dOzF9O2P2s9m53YEDsGhlWNAWpiQb8OH93DjR+TaHERyJTYNkZmIVNQlNg8gmLWpWKYZiLqnLWMQB4BeyQc2L8l2KppMkoY5mRWdv1LEM7O6uFFNDJEh9GWzRYwAXAd4JLjdsSmLlBVRzwL9HPMUScGCJFm6VDyVzzrXU8Sc3FNN32Xzas5jRwxqu0Gh8onAQHSkIR1Ml1AfS5p6Gm5u/KknZ67w1gETwaFbTRTHg9pxuc9Ypo5p4TWSlk6Zg0sh2RF2pmwcpODKQHKoJ+zqRYMP9FbjE7qcl2Ehvk12WMO9mruUIEbX2BUDSyT4XRhmg/axMT6UbXVMoVKn40a56zOGjVT8186tqPmbfKgEQJlDOXaOwWBnwgtHoSBXIoQM4RFHKJs2iEdqRm4nLCfo3TMqgIv8PNcZnVx94h5DfZBilh5bKFfsSooKfCG8LZUd+7SScAmnPibOC7FScJ5U3U8OAUo5voM1qaj+tvmC9uriCo1LLeAF3i7zJ/KydI53CuLyxEy0sLOL1u90tU7m13UqXQO8ZOYeBFz0BumVpT0bj1JsrxwDJVFsRYRavlSvtmLZ3JYF+Tt+QX3kWWosji5nnUB4JOiYvYvjq/vo3tE4CKGfBrsH+l2ZnlqPsoaTh2qSUEA35kU/US2Dk8DDVAp/Jm1TTWQdczjArORKtgrNxKb8QN6O7L8Ae9EpkerOqQMRD1XUyR3n+bc4zLMSaA==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1OGJkVawBbdWURonwNswCQrJDK4inQPXsYY47g4e+/0EeZ12Q6XJOyjuLahi7PuJXXMLwxi7DaDsOBAXP6KFP/VliW0KwZsNdu5qSILDSAGDp7tvO2Y/qhHBMlonvR+Ete7jrtVjrwR5EyM5rHH7P3ODwn97D02qZ/iNPD7LK8bg/nQjN2zXvS3UCj4DOKnqYIVS6Hx/Mfx9BVgFO/TsKRc0eCiJAmvBA4POkaXCS5EUorNMWMmUMB/gZIRYJI4CDm0KP1cj0vgTMaQMSJmaREf/Ad6KAUJ80x5TWFG7p33Z/Bgcz3GiZcE6lsRUpzxPyyGYmWMjir2APJAld86V4UlLkqKdJtsssFzV9+imZoXH4zUIw4flgU29O5CPhDltYI2NqdEXPDu9c58pUm53CFpejhIWjGgibqzzp83BqBgHArh1dPadpIoqLIEGKm4D
X-Exchange-RoutingPolicyChecked:
	qVI/9w4dsPoZmr5kOGX+Qukg+sqieBBg6JDRiRKT10dohLB+hJb5U0h843ooDy4hKXlacxClqPJTRiMw+AEo6PuZOXOv2jwQLQzt2+fTMj+pevy7xQawQZ1B4R5qhVusWDcqYV/+82kIkLgjn69gTO80+Dtk3ka7/qOR9i1OgUxdErgdEAxv9JPFIWcMNLG7HC4osA5fotrTYsB7arwQaSJh1qVh0+mSOnHEbWMfpPjKK9L2AABQwohtW6ksQ4Aswo/ohI0lQhjQeZsZNgL2lwth1sRQLo2o5ZktSECU1Mw+V0WLvZ66Z3NAHtYB6OJEUC69+BvdrYsLLt4n1PSPDw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	n3fNFUS0HD4bxrSJYt4s1AXYnn6xzY/40kQCZVA852RxO/6lgXDCZk2dXzFPxn085ysam9v2Dt4jyxbyL6PTSEXkE4E3Y6qdClN3L1LYEguRlMBwN0RSzTQ35zXCMj3zXq4OAdBXq2v4ezuYSkzCnXfKuGJJFC7mNFXM5/8oF2ycBwMSbxxYcNkL41VFKXIdPT8j8AtkZePhtaH3GhBFkGJOT+A9bujM/E3bQYtScM1u1kiiE31wnEgS6J359OyNywIox1e7rBSfJr0ppXHdEAKNFZV2VLecCZ+UcSuawe5xiXb/pfIvAk0QUi1NHINreqTQG+JDWrknck6SKEgrm+KAlF0QCU4Jx4sOkvzB5Tl6Ghr5hXUm+66Pnhd65cqDqVUIyNvAQudvlE9oTjP3MLNhOPw/faejyzgU8hT5agyFtlhT3m9zHDQeoklpzh26YS3wBn7DJ+FeVI/rvhTswzCaeRjOdzfdQb+1h9wsA8DUi5ldXFlX6v3zjU8j+4ewQujDRrlCEd47drwpnenc+d38Pjnk6RlaE3vMFpQ0h0rDi04PGRX11qOGkj04dYxFNf18EJJ2qD7pswyqaNGdC0npeik1QBrPGSuovRX0qHaXnEIh7zuY24dxxN0eATrca+LlGenBwh/gvM3cDT7/7g==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 06:51:26.4326
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9dd3ef4-098a-489f-fcd3-08deec74a533
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR16MB5056
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2MCBTYWx0ZWRfXxgwOBpAj+zwa
 nfE5JAYJF156MoS8lP4IaM5RFowHVC7Z8+hzuuFZMhfdrcfmSZAO4g2oAlPYFdr5EGmbP2+Maw4
 FuW6605JIGR20yVrBYTwGJ8izS5k8ZpFhfnkYIAv8tIDL8WLu9NI
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a685171 cx=c_pps
 a=sTSJOlcUIwiiAZkT7IHz4Q==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=YJXg7OVxOWrJwj3yZo-i:22 a=cbNQJ9GKAAAA:8
 a=iox4zFpeAAAA:8 a=xSatE7sVNPENPfsXoLAA:9 a=DqJYxgmhk6moR-_7_KoZ:22
 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2MCBTYWx0ZWRfXwO1K80aK6niR
 SB7Dh7JcT/df0FBqQOkhN1daUalEa2E9NKZlBgmNpjwjOU3egG7Y/D/YnWv4NsLOtV9Y3AU25YV
 aXHkF6s6xZjg/kAkuCq06C6zoyhhe7JOqRy3tfY+G/r/XrP8JYSCAwAJ3fQ3YjiGHEZ5r1ISyU/
 8dkINTlMztQG5HvNpe34Ueend/7aCi/GxLUfitLr2ToDujk78ulFy46b++7G43DgqJztNuRGw9b
 TAYOnEDA/XK8ZLdudqqw1wHBHhAsHp3ChFmLbPUPfGXneFgbHf98VajUgVwX86LJXsE1xeyMD4/
 YFfXrxboApxbdo3BgffXS1EeiaAuyKXzzGV5lrffpBnJatHcpE+547w6gha2cZs4looZY8M1XNb
 s69pl9TMGhjE6IAB9pbaJA0+bF3O+0vIjyX8rB47LnIYKiQmw9+9dy2rMBdEjC1MDc8aO+7iN9W
 dSAkPbINnJjNrm4luGA==
X-Proofpoint-GUID: iWwYyc57iAdzCARk7h3_t4SOwAhDUZnX
X-Proofpoint-ORIG-GUID: iWwYyc57iAdzCARk7h3_t4SOwAhDUZnX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280060
X-purgate-ID: tlsNG-ebf023/1785221492-585C7B50-99AB7DDC/0/0
X-purgate-type: clean
X-purgate-size: 1126

From: Denis Mukhin <dmukhin@ford.com> 

Switch 'txbuf' allocation to xvmalloc_array() since there is no
hard requirement to have buffer physically contiguous.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v7:
- new patch
---
 xen/drivers/char/serial.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/char/serial.c b/xen/drivers/char/serial.c
index e3c356408987..cf0abf1893e5 100644
--- a/xen/drivers/char/serial.c
+++ b/xen/drivers/char/serial.c
@@ -12,6 +12,7 @@
 #include <xen/param.h>
 #include <xen/sections.h>
 #include <xen/serial.h>
+#include <xen/xvmalloc.h>
 
 #include <asm/processor.h>
 
@@ -524,8 +525,7 @@ void __init serial_async_transmit(struct serial_port *port)
         serial_txbufsz = PAGE_SIZE;
     while ( serial_txbufsz & (serial_txbufsz - 1) )
         serial_txbufsz &= serial_txbufsz - 1;
-    port->txbuf = alloc_xenheap_pages(
-        get_order_from_bytes(serial_txbufsz), 0);
+    port->txbuf = xvmalloc_array(char, serial_txbufsz);
 }
 
 /*
-- 
2.54.0


