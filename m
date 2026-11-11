Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373E3606A321
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 19:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=hpOuMEW1;
	dkim=pass (1024-bit key) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=lBeT2vg1;
	dkim=pass (2048-bit key) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=JZYPWUS5;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=LBM2NZDW
Received: from list by lists.xenproject.org with outflank-mailman.1484794.1688169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJi-0003qd-Cx; Wed, 11 Nov 2026 19:49:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484794.1688169; Wed, 11 Nov 2026 19:49:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJi-0003o1-14; Wed, 11 Nov 2026 19:49:10 +0000
Received: by outflank-mailman (input) for mailman id 1484794;
 Wed, 11 Nov 2026 19:49:08 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xREJg-0003cG-EN
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 19:49:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xREJf-00H7yO-Qh
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 20:49:07 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c69b-2eae-0a2a0a5409dd-0a2a4504a988-26
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:49:07 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c6b2-b57f-0a2a45040019-94a39217ed1e-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:49:07 +0100
Received: from pps.filterd (m0367124.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIYdvq2829426
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:49:05 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11010022.outbound.protection.outlook.com [52.101.201.22])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hvuxm9q08-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:49:05 +0000 (GMT)
Received: from PH0PR07CA0085.namprd07.prod.outlook.com (2603:10b6:510:f::30)
 by BLAPR16MB3841.namprd16.prod.outlook.com (2603:10b6:208:273::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Wed, 11 Nov
 2026 19:48:58 +0000
Received: from SJ5PEPF000001D6.namprd05.prod.outlook.com
 (2603:10b6:510:f:cafe::3e) by PH0PR07CA0085.outlook.office365.com
 (2603:10b6:510:f::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 19:48:58 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 SJ5PEPF000001D6.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 19:48:58 +0000
Received: from pps.filterd (m0373460.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIa1fx3212502
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:57 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4htnr3537x-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:57 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id REJTxNOFPvYgUREJTxeGDq; Wed, 11 Nov 2026 19:48:57 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=Evt
	sBGfZ4UWgIlG0zoPivirSgR6EtrRdn5fkJmtIoOY=; b=hpOuMEW1TY6cHfxtCwY
	2fCZ8PoBkqIdw0cxnwf5Ahqs0DtLP3xCc7AvehfQ5EvEwM/m546xnzA2A5qDw+lW
	nJDMC52gSjP8II+2Yrdp4UvzPzxGquzTJYymrQxya5JNBA0MgSyFo0EJ+GfH2CnY
	gR9GmG5MvJxUMvdV30PDNd2QXPxncTJZNyUHegz3MphjOP79J85fahHa94SFwz9p
	yqKoBMDjzGBhADUV4+gNvP5h6a3g6ndUmIDW/f0WZPx+v4yvEhOu2a0BR0Ddoq9g
	pgVtWxNVv3ItR8oGuD7tyqhPvzdhXi8cLOZQcz6M4P+W1n7Chdw2gEpMGBFrpbAp
	3JA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PqeMgyCPqi8GF4i7O9VDyvoUfCGWcZMPLu6Ah4aeIo2/sMmdEXH0tKhCB4XqZvk7W7+AERxgc1h47fTqakdlQv+wgoLtN4e+NtfC7Rx20yjCXDFwVeBnAaX9m5JG3ftvNE+V5KUxQwbfNEeNr6J8tpBuvec0azcf7LL5hYSnzG4Kf1n35QH+rzwTpji9pAXO8/qL+Aq2o0Avu+fRF/xYFtFGe66BEbzUqj7w/wjEKde/ROC71zqZ+mCEtZHfAVjVHEJsvHjMLHBMbHMIz93R2f4hpD6WRSk6BoVYQiNnVaU2gZOIJQ2D62kAyjpGdfjFGP57pokaFqStEKRHFbMBSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EvtsBGfZ4UWgIlG0zoPivirSgR6EtrRdn5fkJmtIoOY=;
 b=j/e+GFuog5SDCqFGtBXl7DnQfP0kevPI83KzJfYYcSSThbHJY/u1QWiT1okomuR464TOnIgubZZrXRWpLgEUDDh73ZIH5LYSkw64vcLli2EFrZPqUF2DPBm+dbiDGPX+Y4DTeQwW/nrrIb4fs3ivsKONNhAXASkNSEpoKnZoEWfqucSTzFwBrZ+ksHLFFvuiJv5HBbYpEsRv+F0YOdKrDPw7zJWaOfHXYCyngp/RXHT5PrtF9M0vdKnUAWqxOq/jVAw6qRk9Smuz2qJjnoBcAvWHXyixJqY+SeD7u446G7J6vrpDCSfCg+kn7Idn715t22XZChlTmXsuLdiYVWaltg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvtsBGfZ4UWgIlG0zoPivirSgR6EtrRdn5fkJmtIoOY=;
 b=lBeT2vg1g67ambM0LW0Z0ZvsIE6xn7O1L+SgCT3S+6SiY30CUedI5FdvhdWgDwPpC4ZN2jHbyyYC+FAiB2axM8DV+LLeh/T7iGsPw5wPNXzB3WzGrEVJnfCyqIr5ZU64b0Sody6o89qEa41o7dyt3ECKEVm99gHvw1QS6M/OM98=
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
	ppserprodsaar; bh=EvtsBGfZ4UWgIlG0zoPivirSgR6EtrRdn5fkJmtIoOY=; b=
	JZYPWUS5RRQbSuMSuy8t1AT7v/F7rRXOFwl1/2J0Wzk6az/6QiP9M4qYV4IMWvaz
	1K1fvS8mEURkioiWjJLbXcLupAF8AQZcdbYMqIv9FnofKgb10x48KmyGoaNlcsfG
	d00LbNtHUywvhoFjMWFJmABCcfUKrPgjuvRjA4VV6ejNYDgH7z8VGUBLghDPJhBk
	Mu1dBYonbvCW8t07bFigt13BcTP2J0kieVb0Bw5xvEWbtKuX5XJGdwY9h8F1qurU
	fLq/2jZ9OmKNqk6R965H6R4EpoMVEF4/bo9nJw3+CrNGDdAe4VQv2k/PEoX7mk8N
	Zj3B9/cWbZcNgkPN+9cRiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=EvtsBGf
	Z4UWgIlG0zoPivirSgR6EtrRdn5fkJmtIoOY=; b=LBM2NZDWJecUp+MZT9juCL8
	iTd9tdUKtS2Cdwc7d1hq/oV5HwEsBHIaBzbNYX5V1Wj8qQiHQRgBVD1zwhhobJk8
	dB4K8NvzgR4Whyrrq58oVDGbmaQFw5U1+cp5tIYGIZqcNzKfBZNt65ZE1Tmm/2Uq
	AYAo6ARbxS3WZ3luT3VAaJj4UGLuH14qgOaeIIUNccdPh8N84MC2DH/78OOp/8kk
	FfT0AV4Y/Acx6psioetBXBYadtB5O3hn6bKsInXEnqDPnILlILtcllob+QJEUgzL
	fo8u9OhMG1aw8XETId/dggRMi0LeKrGoGP9MSbqyjM4LfoLl2/FvIO/PpaqrG6A=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: REJTxNOFPvYgUREJTxeGDq
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v8 18/26] emul/ns16x50: resolve physical I/O port sharing
Date: Wed, 11 Nov 2026 11:47:52 -0800
Message-ID: <20261111194800.1070016-19-dmukhin@ford.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D6:EE_|BLAPR16MB3841:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 352afbf8-875e-4a1e-9ac9-08df402cd39a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|261102123227099003|261021121427099003|261028144727099003|261009223027099003|10067099003|261026121527099003|11063799006|261026140227099003|261022105027099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/AlIHEUyHsayiNjw5WJzLpDbBLGb4L+Vb+nhdv+YEb6kKpfimChJnVYDUWOYn5TogSkMSy/cIiDlH3xDNw46CcwBcPT8mzSscAIlrV3tIrLKzCnveEpgLVOzKh8H7Yw2IX5WvdHNfS52YtU1WJtYTq2G1Lb3eOqGhU+gs7ANCYuHjisZvW2uP+0mwCJamBUr8x6AAq9LKrayPMY2pHStBt95rWUaTJeh6mvagotOK3ju0689dubyXkdiosr9E6V1eJ3GcBmyMxlEBI6zBDHfAx+HmgSRqBBj7C5ut/zMyYyuTrgImoNKxuyld+NHuQ/bL7baG9QqXBUIEBLlXuYMZG+J4YiqRMK1EfTzjCp8xrFqFO+h6Ne1uBfZ7Jm1ebdyk/MBS8tqtXHL/SmRm6QoCxYJmbxH8d3rKkHzOEr8JwoKcXTRXxMFAwVtJGHv9ljFmP+OgHwi4hgILQUZJ8tssmVZlLGUJit1VtDRltBHoVrMBlC3KjoTNG8VGw7SPqr0XrEK+MjF0PC4T9IKMv29wahpPivSsEtGwYaDkHtSQFFkdDtuwN7ulEmTXlf0DoWc/eM70vzl5JdP7aTym5RENXQMl+EJpDijYi0NRTqVxM0sWj3asCPuFkg2mqDpIV5zjqrIEERNimnHuB9vRecZA52L48vGeZfM0luAZlE4/HBuk41eyqY/QhCrRp5syVsSWnU19RbfDblZbyrZQUPzZw==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(261102123227099003)(261021121427099003)(261028144727099003)(261009223027099003)(10067099003)(261026121527099003)(11063799006)(261026140227099003)(261022105027099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1aE1TkTSXSiIIfczTrx+yroPcrenW6z236dNTTE+GOwIhCH3v03gqzLTKWcLw/5oTd9s2a0mXlGzaVflrruhbOjsVKiLHU/AXYkF9q6wd1fCH/yzKyuimrhjkCbbfSzRAA29GRqGQ8B9yq/sYd21vdono2iJxy1N/dmkUL2WgSZR4K/8qsGJmlKkqufctCPA7j3EGLCkFrRHVqGAgRMfYAAGSqOEBwTfa3EylTqfAAkZCH9DUdeny6TrPBnFZeeAn3gO0LhgboRehPJ3a6GFJTQkv3f0vYdj1QxnAG7lH1OCvAlKOiCK4e1PsA6e6VN4rnlkRjX75wcTwdy1eNXHzW5y6DG3/t298DeXAwuEOLFlyK3fn5hH1maWrZUqWzXQNFf3EdIjMNhz9cZ/Mbbj7PomxMhTIAWo6elIVwTnkciyNjSqqEePgMuwWUXHKZg1
X-Exchange-RoutingPolicyChecked:
	YZzPOsi3B5VQDX+lam2J4Z27+lmnbT9ieZiHQf2sZdtEzmToLRb2xbCouololRNJP/iA1280VJck/y0mV8h+P4lxjpNZuJsF6M3HWEAnQhaW6EWp/Fqw34EiqOnw9InbLcBLHNsp0GEEKycDFfjvCrx3QV3mA0mWd+TR+tAowt1VwZBwSOtACzFP1oCw8+pLj1xhpAPjs+lao86MWOCrzGcnZ/FbqcmGd0WpaMopec0uAn1oeOFovaUDgXG7XyOx/LEZKsBsVPZaDX1VPHjAV4WloaTun6+do4A3tO+kEqaCzp16Bs6vDjEWZVxX9XcXwiXttiGvWxnrqw0pGj3L5A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8RDFzmxWWo5cfrJyUKlMuHc/1N5f2PpZhAoaA96v3A0hiyzLoxpos9kNDCBMaEh+eLRkMdSISyUGpn/EE+TmgKCd8FcTK4wKoIRm0oaXwnJLjaoqwM+ofJgMQjFunFxntHD5xm4BDKDzNoahxVLFi0jKvu9582FmHkBHY7nAKAVpJ0rg2u/wbZ4IUg9VaoMhbtJ4CkBnXPI3FzJRcYozmV5wUAMewzmg5o8gzh5zJgyD/fZTHpBe4b4sr7NhvWMCe8QHNC72jdiJo4kyd6cUte0YvrAZQbjQZKN1j+NDDLo0wdQmj+ColL+6vl916kGlUDlFS/gDWGMcFh43YBJ9Cwrpu0JAVGXcaPVRHClnvhdAAdLgE7z/xXi6Xj2NZKCMjLAQt1+Z1r6bQ4uTwrWTs5GXE24qKuYe3wDX/+qwsLeQsyBr185KFg9PpySC6lK4dubMWfIXLK9hpDkcgjdVPdct2y6hubAqNd0pO/KDAn/nRCR/QxPDIXwfdnFJLH/q9/dDI49IZ5J7RSn7KKsoFQ+lKo7s+5Fj4cA8yFQBU6/OqUlnH7M1a4ce6qkgX9LC+EOLqWpjBBnoBCyRa8bsYAfAyR9eqdiRZ5x7mXfGdHKLzyr5egr0210sw9TQTJ8noOeY07fL7D7AnzEyWZ18dw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:48:58.2262
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 352afbf8-875e-4a1e-9ac9-08df402cd39a
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR16MB3841
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX14i+sd4Zq5xU
 WoEAN+AzqXfUR9YjteZARuSINI4k86WCOhdG124qhTCuq89Ybl9E82/FOlAtBcvFTsF0Cqa2M1a
 OLKcWOgguj9cQBLqx0+k6hjnPPxMYUy11pi75RZKQI40xmvQ6h+P
X-Proofpoint-GUID: R47lG4y1r2xF33MN6yQ4-t7S3lZPQIPa
X-Authority-Analysis: v=2.4 cv=ZKBCCn7b c=1 sm=1 tr=0 ts=6af4c6b1 cx=c_pps
 a=e6472ZuTPXVkOcUbIheXHA==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=YJXg7OVxOWrJwj3yZo-i:22 a=cbNQJ9GKAAAA:8
 a=816ZgByVNKkZ2Yfdu_UA:9 a=3whSkbs7g9Me0DR5EJEX:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfXz7x8AIdMEJ60
 gxerUKG+GUG/GNpAoFGEPf8nA5JM0MoQMjyEKmPeYerh1Mer4ffYq1c+vgY9vKEkDAp/c5XAtM4
 uLOl7JcIubPSu2GNmuBtGy5sVa91z2wgL93NdoeK7HrA6MPX6dJ+l+1I8gPaQ9923AHKVCtzgud
 UbqXA4vF684QNSma+qORJ/TOT/d2d/pCHTj7Vp2zU8QUzoDxKHz7kXzh0M/FYGdW8GvNopI0I5j
 MLoMFX4xSd/H2we184VcR54FYIeLUyypiZuUzPJUiSQBNWQqG4FUlLdHysZIS5llwfGOOyBjboR
 7+pFO71XlZvpmKgOqVqfN8ot8P9kUDYX+Y/1anA05pk+F636rifHdm9gUX2qDOMjjP+242cnxuJ
 P+J66J6jyp/qnnmE6CNH/UqczXYzbSX/Y3A6NBzPwkcXsOQps7yZeBSG/hLsLWlerhUfgTPwURR
 GHselr+j/N9CIUJX7jg==
X-Proofpoint-ORIG-GUID: R47lG4y1r2xF33MN6yQ4-t7S3lZPQIPa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110078
X-purgate-ID: tlsNG-ebf023/1794426547-C24CBB50-B4AC4D7B/0/0
X-purgate-type: clean
X-purgate-size: 2155
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Ensure NS16550 emulator does not share I/O ports with the physical I/O
ports, which is essential for emulation in PVH hwdom case (dom0).

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/common/emul/vuart/ns16x50.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
index cda21c15cf78..97e12a99368a 100644
--- a/xen/common/emul/vuart/ns16x50.c
+++ b/xen/common/emul/vuart/ns16x50.c
@@ -901,14 +901,27 @@ static int ns16x50_init(void *arg)
     struct vuart_ns16x50 *vdev = arg;
     const struct vuart_info *info;
     struct domain *d;
+    const char *as;
+    int rc;
 
     ASSERT(vdev);
 
     d = vdev->owner;
     info = vdev->info;
+    as = (info->base_type & IORESOURCE_IO) ? "ioport": "iomem";
 
     if ( info->base_type & IORESOURCE_IO )
     {
+        /* Disallow sharing physical I/O port */
+        rc = ioports_deny_access(d, info->base_addr,
+                                 info->base_addr + info->size - 1);
+        if ( rc )
+        {
+            ns16x50_err(info, "virtual %s range [%#"PRIx64"..%#"PRIx64"]: conflict w/ physical range\n",
+                        as, info->base_addr, info->base_addr + info->size - 1);
+            return rc;
+        }
+
         register_portio_handler(d, info->base_addr, info->size, ns16x50_io_handle);
     }
     else if ( info->base_type & IORESOURCE_MEM )
@@ -928,13 +941,20 @@ static int ns16x50_init(void *arg)
 static void cf_check ns16x50_deinit(void *arg)
 {
     struct vuart_ns16x50 *vdev = arg;
+    const struct vuart_info *info;
     unsigned long flags;
 
     ASSERT(vdev);
 
+    info = vdev->info;
+
     ns16x50_lock(vdev, &flags);
     ns16x50_fifo_tx_flush(vdev);
     ns16x50_unlock(vdev, &flags);
+
+    if ( info->base_type & IORESOURCE_IO )
+        ioports_permit_access(d, info->base_addr,
+                              info->base_addr + info->size - 1);
 }
 
 static void * cf_check ns16x50_alloc(struct domain *d, const struct vuart_info *info)
-- 
2.56.0


