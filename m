Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A720606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 19:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=TZTCSA7h;
	dkim=pass (1024-bit key) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=SsJpHpcn;
	dkim=pass (2048-bit key) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=ckJnVzK7;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=maRGwgv7
Received: from list by lists.xenproject.org with outflank-mailman.1484741.1688118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJP-0001Ge-P3; Wed, 11 Nov 2026 19:48:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484741.1688118; Wed, 11 Nov 2026 19:48:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJP-0001GE-KN; Wed, 11 Nov 2026 19:48:51 +0000
Received: by outflank-mailman (input) for mailman id 1484741;
 Wed, 11 Nov 2026 19:48:49 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xREJN-0000vZ-Na
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 19:48:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xREJN-004SUA-41
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 20:48:49 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c699-8faa-0a2a0a5109dd-0a2a4502b0a6-6
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:48:49 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c69f-6ca4-0a2a45020019-94a3921721b4-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:48:48 +0100
Received: from pps.filterd (m0367123.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIYONg3902281
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:48:47 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11012062.outbound.protection.outlook.com
 [40.93.195.62])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hvtpxthtn-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:48:46 +0000 (GMT)
Received: from BN9PR03CA0988.namprd03.prod.outlook.com (2603:10b6:408:109::33)
 by SA1PR16MB5865.namprd16.prod.outlook.com (2603:10b6:806:3ab::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 19:48:40 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:408:109:cafe::f) by BN9PR03CA0988.outlook.office365.com
 (2603:10b6:408:109::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 19:48:40 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.2
 via Frontend Transport; Wed, 11 Nov 2026 19:48:40 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIZX1p4131284
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:39 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hvjh28ufd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:39 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id REJAxNNsPvYgUREJBxeFmS; Wed, 11 Nov 2026 19:48:38 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=1QR
	cdiXRmtacN/pNnj4vEqZJ9tCPmHxrkEtP4X2KZNs=; b=TZTCSA7hcVVRutrJ/sD
	PlliQKb22QnQIO7YRFq+ba5mz3h8+L38+fm+APaeVF2sDWSXhIqvnsw/q55dM5MM
	rzNZzb/zIx1tLAos5pNj4pvetZHR9te6Paa72MQxxMH6B0bYWcCycVE7ydAdb2fd
	V5rA/VWnvT5NEpaYZpyLddgH7TMed0dC9i9LY27z5yVKLsc1HO4MoNpa9j+Ad1qO
	Np7y6zZ/AvPEStbh3P2UwIFapWbREI7hKUN2iK+vJRCX/wJAwUZcy6M8hnx9ylSn
	s2W+sp0B9Dt2NXKDvk8XeIZ6SjNqhHJf4yq71oEUjEeS1Wa8pSRbD9nutVlbttZ7
	1gg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=laSwNeqrsaHruB/DqHBGUIwbEQBXUwh87yIjz7nwsPFtvAnfi/Mooga7TfnodUGHvPINxChBuMAIXe3XtnJRvCDh4UcDy0H2G80vty/OzS6G+brMMPQ8eIs+4ILpyM+EzVITlgP8VpGMEhbzjob1hUbKhPPXme8E8LDeczpM395tjJajWBpM2lr/WqalQgcQ2gROtrINK7hq7bOGD2xaVE5lx2tMuxBzStXdCRtBzPrpTs/1uR3AYs2MoUjgt7Dov4iztgCAZfKS1hxUCpU63yX2iFYdQuRD9QfIWnhY41rv0lGNCsTrkYhlaJWV98S/bt34QqdhtZw8oPCwLauCdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QRcdiXRmtacN/pNnj4vEqZJ9tCPmHxrkEtP4X2KZNs=;
 b=ij13LwzdKpNQBxkg6eVMml2WWDHr4Pu9EKf2U50O2Vc1YncqTfPXsuvZ7QMEPqVJIcvKcon+wUn/PwsWhRhR+UrlrQx9wKEr30oIpKVmdBuMBQrrJKe+YdkopKY7TMpELXP5Tlmfi5U4slvL7Rbjk3pSazLXAtQ/yKJKcOf4Qm0Celr+dwTyeIasiF1i1cf6dsgaSMjotRmVHHIn2lbDV7w0o9BpGnDUd/2HXOwUHHmnmCsTt0OBjWheB5JWUwslTAOdMpC17nAUVKvUhRiCkvVs8uWrHjkjlOTR1qHh1+WT/aNgaatIRWcT5gIkvSu4CQrAcrJr0m8IqglacI62/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QRcdiXRmtacN/pNnj4vEqZJ9tCPmHxrkEtP4X2KZNs=;
 b=SsJpHpcn7bSrvcqdBhFnaxR24xT1KndmFTwY5ebmgwquSn+gIhQKn3qsFl0IO5BGmHq0wTMv4a++P7jcF0rGVsK8EKUmRaG+/pzubf1AhQSv32mFjSVnKUZUD0nGC1Q5+frUgnqn5rVsNVqhq7fbuOyX8zE2f0Y00QDVL9sOshE=
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
	ppserprodsaar; bh=1QRcdiXRmtacN/pNnj4vEqZJ9tCPmHxrkEtP4X2KZNs=; b=
	ckJnVzK78nbGhXtsClmVMp8+nRktNU0scb7jhiOC6uWvh3JJLOYfx96iJL+fzNj4
	qSEU3LXWRFHsC35lA8ZNW3uERFvGDg3K1rrKLAUnjKHUdFFqzc1co2jLbjp8F726
	l9ZahnUY0L3yofWN8ivLB4Kb4VOCLl5/+FibXL3h/wNpDpAruL/7wMH4wAYTLmW0
	4ttgl0A/mNUDOxNdID0a6IoQYckhYA/m2RfFDoh5vMDF4C3DZd2Xq8ysrzwKYLhE
	wgkcFSRX6gxYfPsKblprjqEKh9TZczoCbcZeKc40xpq/E7z7KX/hdRwYim9JIKrV
	EAxxOlARGG0EGZ7ivuZF2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=1QRcdiX
	RmtacN/pNnj4vEqZJ9tCPmHxrkEtP4X2KZNs=; b=maRGwgv7GoDKGkVodv88x8K
	PMjK6/QCMf3QLr5SXk6K9OE15Z7qwzQWPFuj1CLposC6D3pqCJ7Toa/apsijQile
	D2cFLZ82oit7OZuP0DDg8O7iH06KiuuwIGBpUVM6oB2Is+SwkIYhXYw9d91hvNvN
	a//b+I58cimMdnddT1BYSKUKY+wd9EHTiqZ8nOnasHSRMC+rLZ4kOR519naWLU+j
	/GCK48BI/W9n8Ll5P2ad4A8KnPoJfk6Fa8+HRGt37eOGY6NDYm7EDcFPFxbZTB2A
	gwMXhIkdFYoHD0B5Yb3YJlBQNabUx3NwjQDmgP2iPqm11VVsrDhFSnlsLooDjeg=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: REJAxNNsPvYgUREJBxeFmS
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v8 11/26] emul/ns16x50: implement THR register
Date: Wed, 11 Nov 2026 11:47:45 -0800
Message-ID: <20261111194800.1070016-12-dmukhin@ford.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110078
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|SA1PR16MB5865:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cc0655f2-02ce-4ba5-67a7-08df402cc919
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|261026140227099003|11063799006|56012099006|261021121427099003|261013131602099003|261021135927099003|261009223027099003|261021123027099003|261022105027099003|261102123227099003|261026121527099003|10067099003|261028144727099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	iUuOJt0UEiamSaruUZT58MdVZsJ+beGJ4BIwwRTWk3jQ7E19uoULD2aAT/19oVc0L+KIZolbcbUtvNriEgZtNcxMCpl4FzwBbudv5EN85wTO+6x34o6SIwLxXBsAp2cTlVppC56rLofoQtwwHQaG/8gxbGTX7CglC6C+xZmDJ/+98x8IVj2ZgkYSgGyb2ufdy/DtyBVvjMEWjjvup3NEvdo19twp5MzycPH32kmpTUzDV7Tf7FxSk5r47c3epj+rb4orNorFzteCY8SuOVJKIj+w5/6eBfu+3BJePDIWfSNPVsb0mw4trGNRtNZsQ9tHGGFIJMf0HpnMJJWMd8HKav13fcMS3CFl/+z4Sw1S1t24j7UfgS+AUOTEsc/EcVXa6JEM4Bz84pVeDhRpK7RRMsE6b+/Bcx9KPHE2etN6owbgTxqPs+JwwcqgijEY69uLbSWE78fQHR2PPubztYbWOPVs30p6tega2RAOvEeCtLxrOeuaKVphQ9Vk2lK1ejvjV4ouX9Tp0FL14zOP1RzvQW6KQNT4H4NDrexQb5mzAS1ZkK2zMX0KUIsHCwKTKeySY2okjdqgpuisyZPHdDA2o4BcRx25uXV9RtgzBYosDiveTrRFnz/4LRcDMP5G7I4bvxx9QskvivhOrj24MCpzAdjtqy3pqGA9oHtds52TaNul5QBIc8plvRyAHxyjXIFHQF5ZuKXKFduKT+z0ve9vMQ==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(261026140227099003)(11063799006)(56012099006)(261021121427099003)(261013131602099003)(261021135927099003)(261009223027099003)(261021123027099003)(261022105027099003)(261102123227099003)(261026121527099003)(10067099003)(261028144727099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nY0qkD2A9FKPuvBt9mYkPAHIcy8tm8oIwLVTppU8Ib2LfOQhEIDZLoNyYkWJXrTrIbFIJpxJz74BHn/UssEGszBqdr23fcvZch6fWujqm49dRldZtIBfeTLEcdjrBnyULb36cL0b5HFco29mOLSDFXz7q43hHj9jCw9uNvEVosR/nXihGO31/vE0aYiR1UPjcYCBusceVSLZdbvsJumx2P6EnRmGYzQYzPUXV62zCJaNF9/NZD3yAQSOmKBJS+8Q7Bu5AaIO3PWGCg4nDrJmRl7ie9bmaxxdLs46KxMwOKsMcZ/s35MT1GTFQnMkQ6vvJN7ILtp2B8UC8p0fvF31o1rEgxpQNneubIErIYIjJx1ROJYZSh5Sg59x1tB2C3b9OZD1+HPLeOtQfx79bfdkFaMi+5o0ywyMQae3696ceaqvQVhcNXbfA2jLsjrrBI9Q
X-Exchange-RoutingPolicyChecked:
	Pu3VP3MIryethN4BbljYibRpLC6sgT1B+5dF23yPQsu4hbzkKf3IcXAagZyRlABDTo6wIZ+T/LzD0oIfqHT73U+ZZXK65iEA/lbD1cfx+w2+RrjVr8rAaj3yD+g0csh3pQ/3kSWdjSSVD9We6ygVcTu7uKUhyPehuC9oKUKBV5jggrmnn1SAgDLhykVLgMQlup8lflWSLJ8CnrI9/hAaKysDuwQHA3ZhdiVmFuWEWwVOeBJO4l7gj5bc67h1j8vplqb5/VSWLBpePx6CCTvbtRgLza2H3bF9oxqAbpjZ7UUpa0/p5AL2IEOAPoV7M/CkVSyQAdZ03yZdvRFwf4YLvA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CyG1WDuyR5HjaB3kE3CzPS2ytwFT0HjpntTIeRvZzRNwbHIxzraylA2+hm2CbUc09FeNTC0LqPNLjFPmvTSMPOpU/AagsGPA40+xQiLmk6np8DGCsAeQogdikEMtuTVkwI5ggs68OLhe1KFH5J5dZKOqMRM3hADpfQpZwa+9K/r55ihpabKjqQQAZQI0qa3p9ba0xlxWeY3FkyMpGvnEDsYc8eT6Pi/GRjxFPEzLe6KByh+PLi/59lMZgGv0KN7qlh0sEnTa8sdIajB/0g+8DuMS7gXyaKtXCOOX2Yrz8h0t7xSw/L6dUfBobPXCuCQjN7poM2bDdOqLk32KJLlIpd7+3eeTKpsOrZc0u5c5PdXMHo0CoNg82j4Wrs/ccQr/Q63QD/M2Tt6jJiuVo21xU48CEda/eP/8Ee5ivFb7s0iyi0/b9B0c0UiGmm72WlAy+oaCDm05R/yG8A3mTHjhhLawSBuG/U/KWuoQT2iyWCOnMFG3/3B4lA3EyAkkJDFBtLCKoYzsq+uKgEj4McPG394Bm5tid8EvCglVT9JoTX1KChcPESdFFAyQWLZZuG1NDeXdrW+jeO9RCDIvImKcmgE06G24m0zv6ImIQzoBYYb37bCIsT20MdyVFLnp0dY8iu+S87n6Dkbb1H/jwutYfg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:48:40.3424
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc0655f2-02ce-4ba5-67a7-08df402cc919
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR16MB5865
X-Authority-Analysis: v=2.4 cv=V6XoQuni c=1 sm=1 tr=0 ts=6af4c69e cx=c_pps
 a=KmUIp0grITFNz0c0ipdWMg==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=N9_n2FxmZfwfyRXvS9-E:22 a=cbNQJ9GKAAAA:8
 a=gah6nITjj2-i8FdLogoA:9 a=3whSkbs7g9Me0DR5EJEX:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX7a/Vet2OqmPy
 gr0+HGq9PlgP+Rjt8eQzoGPEpAaytdhP/BWAQm+jcHiMiz+vK53luJl+Yh/9EOO109GPh0oXduM
 u/xAg95vbrI3ITGYgokq+UplIj+i2SUjkLH5nOyKxRECLl4rDx6P
X-Proofpoint-GUID: -z__60MUw4t2XLK1essODBXnl3yzFpv2
X-Proofpoint-ORIG-GUID: -z__60MUw4t2XLK1essODBXnl3yzFpv2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX0hAwotwqHtnb
 02dNKaVshx1xyh+wN2uHhOQciyhxSAauZaNlSfyx0RGu/n0Wjjz40TeJ3h0BFrGjyVLskGwgRcR
 S8GdXFLg9XwaU6+xVS07pVjmBm61H1gey1BwtqPDwiqtmxhLv9gQ3PppLIAXaqi6chopCMMUAt2
 50pHc/vJ1Zw2K7RgbSofIH5M4b1Y7KBX5WLN//VA+E06Vm23j9O5liUSyt+n+x26wpmvQXejqB1
 CgOKjrNgdgE4AHFzm4M0PAPQ02MZWpdCWHfgguyTHPAJnOqLRjDR7/W3oVTBZIQPwPOUS66F+A7
 hbXdjavsJmFd03tPpSZVCuFt1A/AmISISRScKrbxLLm+8bbICJLhqeeNhPQw2A9ImM20n1RE8Iu
 O8ghN770lCdbBo78FoI+GggNiIX0SZsKbvglFEPzYHzw3OjWLFMncTQMFhn26bULG3AZ0KiDUfT
 k1p91A7zcuIQclfEugA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110078
X-purgate-ID: tlsNG-720697/1794426529-662A92AC-EBA63FCA/0/0
X-purgate-type: clean
X-purgate-size: 6348
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Add THR register emulation to the I/O port handlder.

Add TX FIFO management code since THR depends on TX FIFO.

TX FIFOs is emulated by using xencons_interface which conveniently
provides primitives for buffer management and later can be used for
inter-domain communication similarly to vpl011.

Account for DLL == 0: in this case, disable transmitter.

Add UART_IIR_THR interrupt reason handling since it depends on THR
register access.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/common/emul/vuart/ns16x50.c | 121 +++++++++++++++++++++++++++++++-
 1 file changed, 120 insertions(+), 1 deletion(-)

diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
index d04caf2baf2c..8d3845a8a4cd 100644
--- a/xen/common/emul/vuart/ns16x50.c
+++ b/xen/common/emul/vuart/ns16x50.c
@@ -98,6 +98,7 @@ struct vuart_ns16x50 {
     spinlock_t lock;                    /* Protection */
     struct xencons_interface cons;      /* Emulated RX/TX FIFOs */
     bool irq_asserted;                  /* IRQ line status */
+    bool thr_pending;                   /* THR interrupt reason status */
 };
 
 static inline void ns16x50_lock_init(struct vuart_ns16x50 *vdev)
@@ -185,6 +186,72 @@ static int ns16x50_fifo_rx_putchar(struct vuart_ns16x50 *vdev, char c)
     return rc;
 }
 
+static bool ns16x50_fifo_tx_full(const struct vuart_ns16x50 *vdev)
+{
+    const struct xencons_interface *cons = &vdev->cons;
+
+    return cons->out_prod - cons->out_cons == ARRAY_SIZE(cons->out);
+}
+
+static void ns16x50_fifo_tx_reset(struct vuart_ns16x50 *vdev)
+{
+    struct xencons_interface *cons = &vdev->cons;
+
+    cons->out_cons = cons->out_prod;
+}
+
+/*
+ * Flush cached output to Xen console.
+ */
+static void ns16x50_fifo_tx_flush(struct vuart_ns16x50 *vdev)
+{
+    struct xencons_interface *cons = &vdev->cons;
+    struct domain *d = vdev->owner;
+    XENCONS_RING_IDX i, j, n, m, len = cons->out_prod - cons->out_cons;
+
+    ASSERT(len <= ARRAY_SIZE(cons->out));
+    if ( !len )
+        return;
+
+    /* Tail of the FIFO */
+    i = MASK_XENCONS_IDX(cons->out_cons, cons->out);
+    n = min_t(XENCONS_RING_IDX, len, ARRAY_SIZE(cons->out) - i);
+
+    /* Head of the FIFO */
+    j = 0;
+    m = len - n;
+
+    /* Linearize the FIFO */
+    if ( m )
+        guest_printk(d, guest_prefix "%.*s%.*s",
+                     n, &cons->out[i],
+                     m, &cons->out[j]);
+    else
+        guest_printk(d, guest_prefix "%.*s", n, &cons->out[i]);
+
+    cons->out_cons += len;
+}
+
+/*
+ * Accumulate guest OS output before sending to Xen console.
+ */
+static void ns16x50_fifo_tx_putchar(struct vuart_ns16x50 *vdev, char ch)
+{
+    struct xencons_interface *cons = &vdev->cons;
+
+    if ( !is_console_printable(ch) )
+        return;
+
+    if ( !ns16x50_fifo_tx_full(vdev) )
+    {
+        cons->out[MASK_XENCONS_IDX(cons->out_prod, cons->out)] = ch;
+        cons->out_prod++;
+    }
+
+    if ( ch == '\n' || ch == '\0' || ns16x50_fifo_tx_full(vdev) )
+        ns16x50_fifo_tx_flush(vdev);
+}
+
 static bool ns16x50_is_tranceiver_enabled(const struct vuart_ns16x50 *vdev)
 {
     BUG_ON(vdev->regs[UART_LCR] & UART_LCR_DLAB);
@@ -205,7 +272,7 @@ static bool cf_check ns16x50_iir_check_rda(const struct vuart_ns16x50 *vdev)
 
 static bool cf_check ns16x50_iir_check_thr(const struct vuart_ns16x50 *vdev)
 {
-    return false;
+    return vdev->thr_pending;
 }
 
 static bool cf_check ns16x50_iir_check_msi(const struct vuart_ns16x50 *vdev)
@@ -316,6 +383,38 @@ static int ns16x50_io_write8(
         }
 
         /* DLAB=0 */
+        if ( !ns16x50_is_tranceiver_enabled(vdev) )
+            break;
+
+        /*
+         * THR is no longer empty.
+         */
+        vdev->thr_pending = false;
+        regs[UART_LSR] &= ~(UART_LSR_THRE | UART_LSR_TEMT);
+
+        /*
+         * Drop the IRQ line before completing this immediate
+         * transmission, if THRE was its only reason.
+         */
+        ns16x50_irq_check(vdev);
+
+        if ( regs[UART_MCR] & UART_MCR_LOOP )
+        {
+            if ( ns16x50_fifo_rx_putchar(vdev, val) )
+                regs[UART_LSR] |= UART_LSR_OE;
+
+            regs[UART_LSR] |= UART_LSR_DR;
+        }
+        else
+            ns16x50_fifo_tx_putchar(vdev, val);
+
+        /*
+         * Backend transmission is synchronous in this emulator,
+         * so THR is immediately empty again.
+         */
+        regs[UART_LSR] |= UART_LSR_THRE | UART_LSR_TEMT;
+        vdev->thr_pending = true;
+
         break;
 
     case UART_IER: /* DLAB=0 --> UART_IER, DLAB=1 --> UART_DLM */
@@ -327,7 +426,13 @@ static int ns16x50_io_write8(
         /* DLAB=0 */
         else
         {
+            uint8_t old = regs[UART_IER];
+
             regs[UART_IER] = val & UART_IER_ALL_INTR;
+
+            if ( (old ^ regs[UART_IER]) & UART_IER_ETHREI )
+                vdev->thr_pending = ( (regs[UART_IER] & UART_IER_ETHREI) &&
+                                       (regs[UART_LSR] & UART_LSR_THRE) );
         }
         break;
 
@@ -497,6 +602,14 @@ static int ns16x50_io_read8(
 
     case UART_IIR: /* RO */
         val = ns16x50_iir_get(vdev);
+
+        /*
+         * Reading IIR when THRE is the reported reason clears the
+         * THRE interrupt latch.
+         */
+        if ( (val & UART_IIR_IMA) == UART_IIR_THR )
+            vdev->thr_pending = false;
+
         break;
 
     case UART_LCR:
@@ -679,6 +792,7 @@ static void ns16x50_reset(struct vuart_ns16x50 *vdev)
 
     memset(vdev->regs, 0, sizeof(vdev->regs));
     vdev->irq_asserted = false;
+    vdev->thr_pending = false;
 
     vdev->regs[UART_LSR] = UART_LSR_THRE | UART_LSR_TEMT;
     vdev->regs[UART_MSR] = UART_MSR_DCD |
@@ -722,8 +836,13 @@ static int ns16x50_init(void *arg)
 static void cf_check ns16x50_deinit(void *arg)
 {
     struct vuart_ns16x50 *vdev = arg;
+    unsigned long flags;
 
     ASSERT(vdev);
+
+    ns16x50_lock(vdev, &flags);
+    ns16x50_fifo_tx_flush(vdev);
+    ns16x50_unlock(vdev, &flags);
 }
 
 static void * cf_check ns16x50_alloc(struct domain *d, const struct vuart_info *info)
-- 
2.56.0


