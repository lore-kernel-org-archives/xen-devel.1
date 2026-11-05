Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC19606A32F
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=HUt/0LgL;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=TM3GWSaX;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=DyVSxIpl;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=snsb/7Fr
Received: from list by lists.xenproject.org with outflank-mailman.1473218.1680883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNa-0007yG-Ln; Thu, 05 Nov 2026 01:35:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473218.1680883; Thu, 05 Nov 2026 01:35:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNa-0007xx-El; Thu, 05 Nov 2026 01:35:02 +0000
Received: by outflank-mailman (input) for mailman id 1473218;
 Thu, 05 Nov 2026 01:35:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmNY-0007hY-N9
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:35:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmNY-00G6d6-48
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:35:00 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd1f-8faa-0a2a0a5109dd-0a2a4503bb5c-12
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:35:00 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd42-fae8-0a2a45030019-94a392173f32-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:34:59 +0100
Received: from pps.filterd (m0482516.ppops.net [127.0.0.1])
 by m0482516.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A50mlYw1531545
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 17:34:58 -0800
Received: from sn4pr2101cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11012002.outbound.protection.outlook.com
 [40.93.195.2])
 by m0482516.ppops.net (PPS) with ESMTPS id 4hr9tfbhbv-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 17:34:57 -0800 (PST)
Received: from SJ0PR03CA0288.namprd03.prod.outlook.com (2603:10b6:a03:39e::23)
 by SAAPR16MB330156.namprd16.prod.outlook.com (2603:10b6:802:302::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:34:52 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:a03:39e:cafe::89) by SJ0PR03CA0288.outlook.office365.com
 (2603:10b6:a03:39e::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:34:52 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:34:51 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50nD1o2970229
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:34:51 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hnxs4nrkf-5
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:34:51 -0500 (EST)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id OmNMxrjPFCiSDOmNNxv4Er; Thu, 05 Nov 2026 01:34:50 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=e3L
	Z4m0W4czz8dEMCWl5vmq0g3rWTQs9k90QwOMyDoo=; b=HUt/0LgLoZCPJ4Y6ovm
	lE4PESarrismXD6xvOUTqiSORJ2RGIbgcyN951iOZ0PDOSR1R7csBcK9aEvCGyGg
	wV5ZCez3kmrwADxdckHlHkLqVp5lJtyYv20oBOSEqcMOF9mvpXJrPY48aQfL1A0V
	jAauIQ+jv3gl1uQ15KeotcvuW+tC8sTjcDOPxQhoP9V4728MYTgPpoVdIHCGbV5D
	mmp7xjLGlRbzZK3xSmKErreUlzAaFH/Cy7tyJmtxY+JM48TmYRl3Cfw27PELQH5s
	nNO0LcTuU9uNZFX9My8SLmFzcUQjFUVZHJdyFXq+hp+e3CKTZ1a6oD7MGoZOHpL5
	5nw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bKJJLsfeA2tAcuHdCugD1ynmAIaptLMWUYuVJnms6iimDsdFAafJ/Pf0t+88UhN0oIAufJCk/O7tV5F2JQgqPcuJfPTBkBDT5LSJra07BG61ZskludaF99fZP5E8pLAQpkyJ0Ya6s/2I5f3uMRRhyp6xiJs9Va7YaryXKW8GVyb4/Kjp6XJmiw7+VpPkZPE2BM/AJeFgAIoXfQj2K7J0dm5QxOP7izdYIk3BcbA2c/9TeoHDZvN0yuf18xBMKLvIf9o8DjWWSdUtsfdSlxy5iS2A36aWYgfQ+4oDoZpx4SR4BglN3hDtehQEoD8TUWbLxtmsp79jLh0xPFtWGuPsWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3LZ4m0W4czz8dEMCWl5vmq0g3rWTQs9k90QwOMyDoo=;
 b=tVj100aER/FKLCC+m96z0poDcjM0JgGNOMORJupg5bhLjUdr/PEFC2f5coB8bH7Stjty3JPJ0BQqWy9j0D1wzphcdiz1bBJFCjxoy3snVrRTkWWWrnjiJVcHYX+x6p4TquJxjfqRX/3oMqx5+wiSPGTpD//eMV/2zeFNWcrpvkGdWgSrqZMMzJUfqCn0QcSDfpiOLYKPJwGq4HkFbGzqYChRMsm82RQk5vf7FuxNjmB/rV5rOvgkjCAYWpBcfYuby2kri4s4O+FE8aC+OeEgL6ZxrLM+FsWh4uljZr3W065Sa/m8m4blSA7eZMeoZN3FaNifYkjKxpZEp8Nup+EXbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3LZ4m0W4czz8dEMCWl5vmq0g3rWTQs9k90QwOMyDoo=;
 b=TM3GWSaXlVUDHPHvnGVuq6jLZSCLuwZSauAOkhGrwObfmZBKXSgq7kHBkRllMrSEQ8WacmzPXOGLb1NDez65Ud3n/0SxeDcKlMbpQTlxYC1fevoNPATSbCOO9M4Li8Cr62r3jQLuO6obi+qhzRaComSedXE0FjKxJEsUdC6UDZQ=
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
	ppserprodsaar; bh=e3LZ4m0W4czz8dEMCWl5vmq0g3rWTQs9k90QwOMyDoo=; b=
	DyVSxIpl/xVWpG5l/uycLvVGCKBXAMvGjQIgE1VlOnm6CoFV3rCdbrXxtX73TUvV
	1eHVRlpqwF6vxJQ7Mfp0FPlnrT53lI+C5GofbBHPGTTcPii9gx3wASNqOSE7gZ1Z
	5vhYYTuw0D1GIztNy8mC5xrQx0wipcY2Oux3h9sPxxjstg5LT7hjEyvBwO1sKTjS
	CHDtk5U/XrEZyTrpKGfYC/af4IsSz2oH+V1HNG8omU8YrRSqLBGF2zpZ+nABma/e
	P5km8AwsiVB9eBPB4G3fIkHQ0p2rYVFKO5yTeK09r83vLkhaOECIWOuR9UxmGFLI
	h4i2U7uVJluu1Qs7j5XM7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=e3LZ4m0
	W4czz8dEMCWl5vmq0g3rWTQs9k90QwOMyDoo=; b=snsb/7FrxhKzg4TbT5ZyY2l
	wGDZV72Os6LRcwDipIGIj12QVQI64yyei2CcHb+L8bY/gSbCvtYjKRObBVGp9XOg
	4Rgg55F++D1NdlsjnNEVDR3nvqsxIAybtkAuOqiSDGwS7sC3jCDAi7kZMYnxEU4L
	HPkZPN4dDU/qpBXa4J+9Vc/60QVj6AMEHAeEp/n4a5msMbSj+Gf1cKcTKZTEu3Cu
	u6BPzWgskgtARig7H4JBEevgXDrUwOCl4N5R/0+2Sl91uaAMIMB2L89o3FTz1+aj
	gNsPHw6bQpmEMg3SS6WK4+a5h2rtnRHBh1jy85pajfE+r6KjkjrwJtFZF0AmsJA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmNMxrjPFCiSDOmNNxv4Er
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
        roger@xenproject.org, teddy.astie@vates.tech, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 17/28] x86/hvm: avic: route interrupt delivery to vCPU
Date: Wed,  4 Nov 2026 17:33:34 -0800
Message-ID: <20261105013347.719392-18-dmukhin@ford.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050005
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|SAAPR16MB330156:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 339fb0cd-6ad1-4cda-b71c-08df3adcfcd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|11063799006|56012099006|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261009223027099003|261102123227099003|261026140227099003|261026121527099003|261028144727099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	YW11dLMlk7Z4mR3ha76jy/6I0Fpfc1wv4kaBTxTowXlXs9eazVtStkUE1ZLWPNeNH7EvyhRRCFBCQt0jEix730RZc7JgCsGxIqZ3XUzfTbRj6lBns24cQcijWe6+wZCfkYykFQDuPCPi9wEJfa5Ad0Qwv7yEmricIxDu8UZplfKWjg4sxO3m1AYFeE+buoepfRAxM8Dl6c7POhgZEweCSLGHLSHUnssBHH0Bf5SBOSyW96UtmLWaiP8/jDByvS9t501SC9unDYqsbNE/7Wfp+liVE0Y5auFT8JJuN/Ah5uPyZHuNMxFZ4D26yEbW8l5zi0UAt1hyDZI6ewsLmbQSq8npdEm4wRY9df6LURw2OlrcHsMNlBhzR5ccDC6xq1wsCPPXw28j0DFKtfXjghTmfabM6yJ1HgCvqMo5fQyIA1u8wRX+JvDrjIVdpHMHWyDSRUePYsC4Fz/R1w6GDddGT8yNj5D3Vd3WRFJpLDwCC7qGI9saLQs2pb5nFVa5MNs8nse5KZyjuNMpeM3cGANAU77KYz+Nutkt5atUUSQamh5qjFgEYp50eLH6ZsGFM8MQEwDnrA39OWb4Ht+w+yum4K786Q2uAzy84fRvDzAi1TcFFYK0prT1dQ0UTR56ctomO9pVWyzJvSIxcTM2Ja4VoZDTszpNYb8OJ6Pqs8+a/kCK/4Ufm/m0ql9VbsWqk5WnQMwjWlWrJ5tjrHCm0bB23Q==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	W243dfjhwVLviO6df3uexQMD/sJXsY+DwEl6AANLEnVjK9VNEA7ngOOvcZ3JdvtrEes/LuaHfI03mfC3woPWko2uNNEV392xs/0jp2eyAOQTmEe5amxK5IHlKubMFKdXbxf8Na7ij0lFLcTmif6K86UZRjQ1v74obu5OC2ORHOcuNfCQNz/9EUIMLwF2Ic7tqxFClsB4w2L61c/cYm+yn00lwvgRfPWBHwhoXaN3uexMVp/rlTqCGuTYyliuvrI2du+WGQy6c7Rk0i4gR5QzwChlijVHHA2fXD9kgzrbYdjVC/DuU9RiXxRnax0b+DEoAjdFOSC0wYCsk6O6HUr+t0+mx7QCyZ/JS6bQ5qwyWev9B9FPiGGBi7migd0kS87yW7aQfJSQ3OT7FuRkZVd1xdc0P0fJfDOVy6II2zTN2fAMJ1aVhCd+gNkO6nwII8bE
X-Exchange-RoutingPolicyChecked:
	xZyDK3v0BywQGes90kWFZdEM7XcU4A1GO92C683255Cwp1ICNT+OPpmpqJ0rejDptfCINkgFcOTH5KbD0XXzh2ZoTSleY55/7syJ9YHkrVB7xLRM/s5Q4RfXJ++FwKHXbucq1T8BeAGZj7WbMOxXsnvEqQE2tmsYjRAFecseD6o6pYAMUcWVu4wOOiBezYtsLboEgesbzG1VRuCwa+RIbwvJpoygMyULwgVG+FxqJapKB08FfHkDgwVSYTvP+AwgXuGp7gusw9DvkRnrtGp3pnRbTF8DA32AEnWpfiFC6sENCz44oOjR5PI1RBZlg2COKkE/jUlbQ8TPuOxpsEcftA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SrwAnGskudoWjByS2RRliAZFeDSmjLSSqaq3oXuHFnTelAYOza48nybuEDwBLxVHLJRIWjmKUHTnB5SB8hgg+fF6Ay5SevBzPmoYnQUfUAqOe0zn0LcTNEICF/WfvkjilBngBVwOQ5dpzX99+PK0FPQAezqj/nciRhUcZ/yoPfVn9QP2ua/6366XHzfppo9dAQwSzC7SvIhswLDko7HyQ0ioHlsQ0kp/tUAc3gFi3K7WE4GESGYO6gbCEPbmTpJJHgTH1yvLGeN11IZyJCN+p2SdvQEvUoT6zfjsntoOYzmOC9KJNzZxlCP2rtco18OFgvZ1A8ZtylPDDKEiods69ju1Ga5eGnVrl2m4HQzpV5m1/JuRgyLjU2N+IuvP16YzMEbIf+zkYydxLNcwn+L2w1vnvVPXMo3xfmGrhnE1ftr/YEagJ52isK3C26TwUJwT6fg2WouYz1lDns8X9B9qrDh3qdyhOFvdR9n5FZsQZ0e+yGWTnXECEeqpMYpf8yh0n1Bls21NtNif/l2Gxrh9B/sywpIVdI8Ut9EICcdadNDoIDnlAFsFCSB7iM90VHCHaFYQmz5riENDCawQK90lTmqXa2XzkqQ+YzspUK5vdJWXgOuSC5pvK5nPXtzd2k+t8CwypacK0sA57KiB7GplOw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:34:51.8196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 339fb0cd-6ad1-4cda-b71c-08df3adcfcd1
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAAPR16MB330156
X-Authority-Analysis: v=2.4 cv=XfAcX455 c=1 sm=1 tr=0 ts=6aebdd41 cx=c_pps
 a=LBR8CsJoUNkXwF8+XrmcNA==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=NvsXeTrgx-CJMFV-xl94:22 a=cbNQJ9GKAAAA:8
 a=eYvIa5XWC3BHbn6lEHkA:9 a=DqJYxgmhk6moR-_7_KoZ:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfXzDRqV38T1sCN
 Uo0JeeFUe+GMb1ZKZBk57zV1z3U1maqlUZWkgLLsVdxIUiDXMIei6TVw4oYezoTBL/7Ni5/EEcE
 oyVXoNzbcJcRkPAsqTMOHa0M/oWPpei5MApv4xg+Y/4fkglHBj2f
X-Proofpoint-GUID: FneIbTRcH1kCe1BdGrISqCo6TgLT1rIm
X-Proofpoint-ORIG-GUID: FneIbTRcH1kCe1BdGrISqCo6TgLT1rIm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX/Kqob5IwLuCB
 bWEt8Q4x9gxwsvmvvB0bKqfOmN/5LW3BsC+pFw/emV6g05GWv+QeaZpYn40gxJZJp8hT6ZW2Gdt
 IklY2bOOjpevPb5ARO6BrDvNBxP9+qJCaAV/GYQAeu2xYZw2LYJaSf3f9qEARLvCxW6w72auB1P
 sjcUUzPv0ot1Oknl4S9Tp85JTVxNWCIPDYkQW1/4MALODPgXCJf5YR7ANj04t+PR177uP7w0AZL
 U+cu1lRRs0feFQRB3s8tEAWELnUErjq1VeN7ivH48ozqG1qcrM1Te7+oOsLE6Fq/uQqlFxlNevQ
 jCXCRXg0o7gn2uV8Wol+urbAPsdYqqq3RuIcjHBv/G6koOnTlXwu6y76Ywio5IxjKm/5x+AJpjc
 tFYp29Td9iX/iyWh3hjeKwBwWYbzE41zqKZu36SF+NlpsPm1lLLc1WEeOmUqbR/JCwKjHGO1PrF
 X7l/my1KawuVZ0Yfp3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050005
X-purgate-ID: tlsNG-33051d/1793842500-6DCD34E9-1B88FE81/0/0
X-purgate-type: clean
X-purgate-size: 12429
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Enabling AVIC implicitly disables the V_IRQ, V_INTR_PRIO, V_IGN_TPR,
and V_INTR_VECTOR fields in the VMCB Control Word.

Introduce new interrupt injection code via AVIC backing page.

Essentially, that is handling of 'IsRunning' bit in physical APIC ID
table entry: it needs to be in sync with the scheduled vCPU. Shadow
the state to work around hardware not perceiving 'IsRunning' bit.

Add new doorbell MSR to accelerate IPI emulation. The MSR can be used
for posting interrupts from hypervisor to the guest (e.g. event
channels).

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/hvm/svm/avic.c              | 156 +++++++++++++++++++++++
 xen/arch/x86/hvm/svm/avic.h              |  17 +++
 xen/arch/x86/hvm/svm/intr.c              |   9 ++
 xen/arch/x86/hvm/svm/svm.c               |  32 +++++
 xen/arch/x86/include/asm/hvm/svm-types.h |   2 +
 xen/arch/x86/include/asm/msr-index.h     |   1 +
 6 files changed, 217 insertions(+)

diff --git a/xen/arch/x86/hvm/svm/avic.c b/xen/arch/x86/hvm/svm/avic.c
index 18a814871133..0bcab0465227 100644
--- a/xen/arch/x86/hvm/svm/avic.c
+++ b/xen/arch/x86/hvm/svm/avic.c
@@ -33,6 +33,8 @@
 #define AVIC_MAX_PHYSICAL_ID                            (0xFEU)
 
 bool __read_mostly svm_avic_enable;
+unsigned int __read_mostly svm_avic_features = AVIC_HW_ISRUNNING |
+                                               AVIC_DOORBELL_MSR;
 
 static const char __section(".bss.page_aligned.const") __aligned(PAGE_SIZE)
     avic_apic_access_page[PAGE_SIZE];
@@ -50,6 +52,11 @@ static int cf_check avic_parse_cmdline(const char *s)
     {
         svm_avic_enable = true;
     }
+    else if ( !strcmp(s, "nodoorbell") )
+    {
+        svm_avic_enable = true;
+        svm_avic_features &= ~AVIC_DOORBELL_MSR;
+    }
     else
     {
         return -EINVAL;
@@ -228,6 +235,7 @@ int svm_avic_vmcb_create(struct vcpu *v)
     entry |= AVIC_PHYSICAL_ID_ENTRY_VALID_MASK;
 
     ACCESS_ONCE(*sv->avic_physical_id) = entry;
+    ACCESS_ONCE(sv->avic_shadow_id) = entry;
 
     avic_vcpu_enable(v, true);
 
@@ -248,6 +256,102 @@ void svm_avic_vmcb_destroy(struct vcpu *v)
     vmcb->avic_vapic_bar = 0;
 }
 
+static void avic_vcpu_set_cpu(struct vcpu *v)
+{
+    struct svm_vcpu *sv = &v->arch.hvm.svm;
+    unsigned apic_id = cpu_data[v->processor].apicid;
+    uint64_t entry;
+
+    BUG_ON(sv->avic_physical_id == NULL);
+    ASSERT(!(apic_id & ~AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK));
+
+    entry = ACCESS_ONCE(sv->avic_shadow_id);
+    entry &= ~AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK;
+    entry |= apic_id;
+
+    ACCESS_ONCE(*sv->avic_physical_id) = entry;
+
+    ACCESS_ONCE(sv->avic_shadow_id) = entry;
+}
+
+static void avic_vcpu_set_running(struct vcpu *v)
+{
+    struct svm_vcpu *sv = &v->arch.hvm.svm;
+    uint64_t entry;
+
+    BUG_ON(sv->avic_physical_id == NULL);
+
+    entry = ACCESS_ONCE(sv->avic_shadow_id);
+    entry |= AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK;
+
+    /* Shadow IsRunning state update. */
+    ACCESS_ONCE(sv->avic_shadow_id) = entry;
+
+    /*
+     * If hardware has problems detecting IsRunning (erratum 1235)
+     * keep IsRunning in the shadow entry only.
+     */
+    if ( svm_avic_features & AVIC_HW_ISRUNNING )
+        ACCESS_ONCE(*sv->avic_physical_id) = entry;
+}
+
+static void avic_vcpu_clear_running(struct vcpu *v)
+{
+    struct svm_vcpu *sv = &v->arch.hvm.svm;
+    unsigned apic_id = cpu_data[v->processor].apicid;
+    uint64_t entry;
+
+    BUG_ON(sv->avic_physical_id == NULL);
+    ASSERT(!(apic_id & ~AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK));
+
+    entry = ACCESS_ONCE(sv->avic_shadow_id);
+    entry &= ~AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK;
+
+    /*
+     * If hardware has problems detecting IsRunning (erratum 1235)
+     * keep IsRunning in the shadow entry only.
+     */
+    if ( svm_avic_features & AVIC_HW_ISRUNNING )
+        ACCESS_ONCE(*sv->avic_physical_id) = entry;
+
+    /* Shadow IsRunning state update. */
+    ACCESS_ONCE(sv->avic_shadow_id) = entry;
+}
+
+/* vCPU enters blocking state. */
+void svm_avic_vcpu_block(struct vcpu *v)
+{
+    avic_vcpu_clear_running(v);
+}
+
+/* vCPU is preparing to resume guest execution. */
+void svm_avic_vcpu_resume(struct vcpu *v)
+{
+    avic_vcpu_set_running(v);
+}
+
+/* vCPU is being assigned a new pCPU. */
+void svm_avic_vcpu_switch_to(struct vcpu *v)
+{
+    avic_vcpu_set_cpu(v);
+}
+
+/* vCPU is being removed from a pCPU. */
+void svm_avic_vcpu_switch_from(struct vcpu *v)
+{
+    avic_vcpu_clear_running(v);
+}
+
+bool svm_avic_vcpu_enabled(const struct vcpu *v)
+{
+    const struct svm_vcpu *sv = &v->arch.hvm.svm;
+    const struct vmcb_struct *vmcb = sv->vmcb;
+
+    ASSERT(!(vmcb->_vintr.fields.x2avic_enable));
+
+    return vmcb->_vintr.fields.avic_enable;
+}
+
 /*
  * Handle the AVIC_INCOMP_IPI #VMEXIT when AVIC is enabled.
  *
@@ -546,6 +650,58 @@ void svm_avic_vmexit_noaccel(struct cpu_user_regs *regs)
         hvm_emulate_one_vm_event(EMUL_KIND_NORMAL, X86_EXC_UD, X86_EVENT_NO_EC);
 }
 
+static void avic_deliver_posted_intr(struct vcpu *v)
+{
+    struct svm_vcpu *sv = &v->arch.hvm.svm;
+    uint64_t entry;
+    unsigned int apicid;
+
+    smp_mb();
+
+    entry = ACCESS_ONCE(sv->avic_shadow_id);
+
+    if ( !(entry & AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK) )
+        return;
+
+    /*
+     * Some AMD systems (e.g. Zen5 Family 26 (0x1a), Model 36 (0x24)) have
+     * broken remote notification via doorbell MSR.
+     * Fallback to brute force, if requested.
+     */
+    if ( svm_avic_features & AVIC_DOORBELL_MSR )
+    {
+        apicid = entry & AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK;
+
+        /* Ensure the pending interrupt wakes vCPU. */
+        vcpu_unblock(v);
+
+        /*
+         * AMD APM, 5.29.8.2 Doorbell Mechanism
+         * The serializing semantics of WRMSR are relaxed when writing to
+         * the Doorbell Register.
+         */
+        wrmsrl(MSR_AMD_AVIC_DOORBELL, apicid);
+    }
+    else
+    {
+        vcpu_kick(v);
+    }
+}
+
+void cf_check svm_avic_hvm_deliver_posted_intr(struct vcpu *v, uint8_t vector)
+{
+    ASSERT(v != current);
+
+    if ( svm_avic_vcpu_enabled(v) )
+    {
+        avic_deliver_posted_intr(v);
+    }
+    else
+    {
+        vcpu_kick(v);
+    }
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/hvm/svm/avic.h b/xen/arch/x86/hvm/svm/avic.h
index f9ff3ffc9346..098924925e89 100644
--- a/xen/arch/x86/hvm/svm/avic.h
+++ b/xen/arch/x86/hvm/svm/avic.h
@@ -6,6 +6,15 @@
 #ifndef __SVM_AVIC_H__
 #define __SVM_AVIC_H__
 
+#include <xen/const.h>
+
+/* Known AVIC hardware quirks. */
+enum {
+    AVIC_HW_ISRUNNING       = BIT(0, U),    /* See erratum 1235 */
+    AVIC_DOORBELL_MSR       = BIT(1, U),    /* Remote vCPU notification OK */
+};
+
+extern unsigned int svm_avic_features;
 extern bool svm_avic_enable;
 
 int svm_avic_domain_initialise(struct domain *d);
@@ -17,4 +26,12 @@ void svm_avic_vmcb_destroy(struct vcpu *v);
 void svm_avic_vmexit_incomp_ipi(struct cpu_user_regs *regs);
 void svm_avic_vmexit_noaccel(struct cpu_user_regs *regs);
 
+bool svm_avic_vcpu_enabled(const struct vcpu *v);
+void svm_avic_vcpu_block(struct vcpu *v);
+void svm_avic_vcpu_resume(struct vcpu *v);
+void svm_avic_vcpu_switch_to(struct vcpu *v);
+void svm_avic_vcpu_switch_from(struct vcpu *v);
+
+void cf_check svm_avic_hvm_deliver_posted_intr(struct vcpu *v, uint8_t vector);
+
 #endif /* __SVM_AVIC_H__ */
diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index 1d39f25e5209..9cceca704a91 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -24,6 +24,7 @@
 #include <public/hvm/ioreq.h>
 #include <xen/domain_page.h>
 
+#include "avic.h"
 #include "nestedhvm.h"
 #include "vmcb.h"
 
@@ -80,6 +81,14 @@ static void svm_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
 
     ASSERT(intack.source != hvm_intsrc_none);
 
+    if ( svm_avic_vcpu_enabled(v) )
+        /*
+         * AVIC delivers pending LAPIC interrupts from the backing page
+         * when the guest becomes interruptible, no need to arm the legacy
+         * V_IRQ/VINTR interrupt-window mechanism.
+         */
+        return;
+
     if ( nestedhvm_enabled(v->domain) )
     {
         struct nestedvcpu *nv = &vcpu_nestedhvm(v);
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index d1a95e441f03..2fac76725c4f 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -35,6 +35,7 @@
 #include <asm/p2m.h>
 #include <asm/paging.h>
 #include <asm/processor.h>
+#include <asm/pv/shim.h>
 #include <asm/vm_event.h>
 #include <asm/x86_emulate.h>
 
@@ -877,6 +878,10 @@ static void cf_check svm_ctxt_switch_from(struct vcpu *v)
     svm_tsc_ratio_save(v);
 
     svm_sync_vmcb(v, vmcb_needs_vmload);
+
+    if ( svm_avic_vcpu_enabled(v) )
+        svm_avic_vcpu_switch_from(v);
+
     svm_vmload_pa(per_cpu(host_vmcb, cpu));
 
     /* Resume use of ISTs now that the host TR is reinstated. */
@@ -914,6 +919,9 @@ static void cf_check svm_ctxt_switch_to(struct vcpu *v)
 
     svm_tsc_ratio_load(v);
 
+    if ( svm_avic_vcpu_enabled(v) )
+        svm_avic_vcpu_switch_to(v);
+
     if ( cpu_has_msr_tsc_aux )
         wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
 
@@ -935,6 +943,9 @@ static bool vcpu_is_vlapic_tpr_emulated(const struct vcpu *v, bool force_noaccel
     if ( vlapic_hw_disabled(vlapic) )
         return false;
 
+    if ( svm_avic_vcpu_enabled(v) )
+        return false;
+
     return true;
 }
 
@@ -982,6 +993,9 @@ static void noreturn cf_check svm_do_resume(void)
             (vlapic_get_reg(vlapic, APIC_TASKPRI) & 0xFF) >> 4;
         vmcb_set_vintr(vmcb, intr);
     }
+    else if ( svm_avic_vcpu_enabled(v) )
+        /* AVIC accelerates TPR accesses. */
+        svm_avic_vcpu_resume(v);
 
     hvm_do_resume(v);
 
@@ -1091,6 +1105,12 @@ static int cf_check acpi_c1e_quirk(
     return X86EMUL_OKAY;
 }
 
+static void cf_check svm_vcpu_block(struct vcpu *v)
+{
+    if ( svm_avic_vcpu_enabled(v) )
+        svm_avic_vcpu_block(v);
+}
+
 static int cf_check svm_domain_initialise(struct domain *d)
 {
     static const struct arch_csw csw = {
@@ -1104,6 +1124,7 @@ static int cf_check svm_domain_initialise(struct domain *d)
     if ( rc )
         return rc;
 
+    d->arch.hvm.pi_ops.vcpu_block = svm_vcpu_block;
     d->arch.ctxt_switch = &csw;
 
     svm_guest_osvw_init(d);
@@ -2493,6 +2514,13 @@ static void __init svm_avic_start(void)
 {
     if ( !cpu_has_svm_avic || pv_shim )
         svm_avic_enable = false;
+
+    if ( !svm_avic_enable )
+        return;
+
+    svm_function_table.deliver_posted_intr = svm_avic_hvm_deliver_posted_intr;
+
+    svm_function_table.caps.virtual_intr_delivery = true;
 }
 
 const struct hvm_function_table * __init start_svm(void)
@@ -2814,6 +2842,10 @@ void asmlinkage svm_vmexit_handler(void)
 
     case VMEXIT_VINTR:
         svm_clear_intr_window(v);
+
+        if ( svm_avic_vcpu_enabled(v) )
+            domain_crash(v->domain, "%pv: VMEXIT_VINTR=%#"PRIx64"\n", v, intr.bytes);
+
         break;
 
     case VMEXIT_INVD:
diff --git a/xen/arch/x86/include/asm/hvm/svm-types.h b/xen/arch/x86/include/asm/hvm/svm-types.h
index 377ad2494e7c..cc40b1b02095 100644
--- a/xen/arch/x86/include/asm/hvm/svm-types.h
+++ b/xen/arch/x86/include/asm/hvm/svm-types.h
@@ -51,6 +51,8 @@ struct svm_vcpu {
      */
     uint32_t avic_ldr;
     uint32_t avic_dfr;
+    uint64_t *avic_physical_id;
+    uint64_t avic_shadow_id;
 };
 
 struct nestedsvm {
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index ad1c6c97f8f7..84fd9b6581b6 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -406,6 +406,7 @@
 #define MSR_K8_PSTATE7			0xc001006BU
 #define MSR_K8_ENABLE_C1E		0xc0010055U
 #define MSR_K8_VM_HSAVE_PA		0xc0010117U
+#define MSR_AMD_AVIC_DOORBELL		0xc001011bU
 
 #define MSR_AMD_FAM15H_EVNTSEL0		0xc0010200U
 #define MSR_AMD_FAM15H_PERFCTR0		0xc0010201U
-- 
2.55.0


