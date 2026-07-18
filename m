Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D37EC44515
	for <xen-devel@archiver.kernel.org>; Sat, 18 Jul 2026 02:54:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1365337.1615885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkvCA-0000Yj-Lj; Sat, 18 Jul 2026 02:54:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1365337.1615885; Sat, 18 Jul 2026 02:54:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkvCA-0000Yc-Hq; Sat, 18 Jul 2026 02:54:30 +0000
Received: by outflank-mailman (input) for mailman id 1365337;
 Sat, 18 Jul 2026 02:54:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wkvC9-0000YW-4L
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2026 02:54:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkvC8-00B3GI-3Q
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2026 04:54:28 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a5aeaa1-e002-0a2a0a5209dd-0a2a4503ccc4-28
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jul 2026 04:54:28 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a5aeae2-fae8-0a2a45030019-94a39217c3fc-3
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jul 2026 04:54:27 +0200
Received: from pps.filterd (m0482516.ppops.net [127.0.0.1])
 by m0482516.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66I2rtN83620504
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 19:54:25 -0700
Received: from co1pr03cu002.outbound.protection.outlook.com
 (mail-westus2azon11010016.outbound.protection.outlook.com [52.101.46.16])
 by m0482516.ppops.net (PPS) with ESMTPS id 4ffx3mgsue-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 19:54:25 -0700 (PDT)
Received: from SA1P222CA0157.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c3::24)
 by SJ0PR16MB4173.namprd16.prod.outlook.com (2603:10b6:a03:319::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Sat, 18 Jul
 2026 02:54:18 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:3c3:cafe::3b) by SA1P222CA0157.outlook.office365.com
 (2603:10b6:806:3c3::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.13 via Frontend Transport; Sat,
 18 Jul 2026 02:54:18 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Sat, 18 Jul 2026 02:54:18 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66HNFkeU3396291
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 22:54:17 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4ffpungp3b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 22:54:17 -0400 (EDT)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id kvBtwxiGGAJcNkvBuwYakt; Sat, 18 Jul 2026 02:54:16 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=fail header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=OVW
	BObfHs9LP8RPaEwAO+3AQg0JC9wygjavEw81XAvs=; b=LiaDaVojWVc4g/pgkKa
	D8sLs1NiVfpGV0LD1FP94FFI4LWUiDk2VBUJqs34OspaZWUkqohu3+vpX74ctxAY
	Naf2UasrgLl+Ltd1Ww1rnB2etCr8HIY3jxr+6pk4ehQHKRECg7FaxTP7nw2lyfCZ
	aBgspIK4QAnZGmmY1Woc64IPQm0mdJRNBK+LHzVD2lWB3CjDTOYvshxJDnyFb734
	nTYf9iLERccfzwiZ8HL+rzU8nvIVvVxpSLmSpY5hvCNEP/OD2ANJ9EebOMZ5afEy
	9mbXfG4rVI2sGtTtUuC4vCij3je06pUXMnwqs0PVX0fFX1G9ine1pmkqGBFOhj94
	tgw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KnN5CObOrag6QUvwqnpnjm/EOuHfzseDeKACFMQpROmexecx5TxgnVlhh83Ahy5SjYvhqlUWs7EMUugT5PEAaom4h6hXQSE9U2meFJB/hyO4JmLVGQ1VXkyH9tNPPbYWd+AfjBYf0a9nXNHq4qHIYi6cGG4nD06PmCUb+vTbAEWcMEt8kPTFyHOq3qo35ne+1qJCwW9mNeOQ6ceuhDpCWrYCE9UqEOWQXZsh+sMmPUmUjyC6rAi6jVbGpCHgp97p2XDk8cfAxz63F62ZDWmFdb3evwMu+4CN0FB1xYL3WXqDUwDIO7NBFqfnQ8VwRn3u3mCdhiOZ2K+PWlnUhfuWAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2JANl6oE/gZtjo6HsYZWGgpGYZ446/ZhLlDZcE6ocw=;
 b=QzgeaY57zr0Hkrx8C/SLPtA3io1qCR2HNc6xYjZ7Leg9mZlnRhqSlR0dbM1eq+PyKE8W6+V4mS3PxXJqTnJT7M+aX/1REk9+yYmKcZQhAo6bJoUmoWsRsYjBqUc2ELneSS/nbgbFK7y6cai5oWzypsd5VITOVYCxoGROOLzaVoEUKaMQqPRjCEiaYEam2Y79n2LL6sFwOV9KqsgDnFvFRgYIK8c8uGOHpSRrsbOArMBjo8qOU5Dg4RdnkkHU59QD40MaTkpK7gBe5Bbol9JxrolOTfr/uVVWSeaQMuLkd+G+DtO8thQSVimAlJQckt1kADwMmb/d1gVJ+6kxN8goTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m2JANl6oE/gZtjo6HsYZWGgpGYZ446/ZhLlDZcE6ocw=;
 b=bJ2AprfNGV51S1DVcduAMPkPEV7VB/s8TPikCBlx/o7pPj5yHS7U51ighCby4fXRm3d/XfttP/F06BTFTI6oxrPWCM3yVWrGaxC07ZZQYnz2XVG1XybywufcBpHjViM+2u33SnoRQgGeEEN8Eo71I7grwu9+VCyH6J2MYHo5zRY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to; s=ppserprodsaar; bh=OVWBObfHs9LP8RPaEwAO+3AQg0JC9wy
	gjavEw81XAvs=; b=MOmjCQ2mvL82y5bvdQJFj7UmfSlKl4RVKG8jLKnyzGKqgrV
	I1aGovb92OFEpozHPYSjWytFtfq30MLyegKKV4GZHX8LxdGD4kQ14rKWyL4/gL74
	nTx5k7fx+kGFYH6+e41PKhgEyPcYqeAgUVu2lSLa8zpm/lq7Eof4VNm5K7um1u7l
	+hRvuz2DbLfd6N1/otruJwnQ5edz7oR1QPRFvCusye9DxQ7nE87Kc5+iiUfCwMRo
	ge6L7SNZiUHVlbWHTM4VczbGwrDcGH9oWDiyIWg5te66Ny8sXurGc/x+4tqcVXwt
	BK7RcrYJz6f5A7Q0TryH4dpK3g4Xre6nk7f3zAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppfserpocford;
	 bh=OVWBObfHs9LP8RPaEwAO+3AQg0JC9wygjavEw81XAvs=; b=WoM4qSXHJX5I
	wr17wBbNTlDueMb3OWCcOT6oschyv6wK1mwUme2ojY5m6FzI7mFysLqv40RPxNVn
	6eNRsgeju+27bkaDZudEdmAxKUsoHxdk1SlFnKkyMeAc8hWwlcizWPiJEqHHjvzK
	zfcUKn28HjtMKCdfW40+TFofFVZW/mvHc/hpTXFBuUIA+kz5odqpmjfnXSI5r/Pw
	sgZmVI99LZHkgZwlcmTyxlVD52gtZi8akXFS14eO/uNIL+BCufqEPRPe9hj2D/Ve
	sCjxiwVjiA6Uzot0z+zGUP9FOLDb42gNG4oBKY4I7YpH6hreRxJ76pXlhzIpyp38
	dmRjBeOM4A==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: kvBtwxiGGAJcNkvBuwYakt
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Fri, 17 Jul 2026 19:54:13 -0700
To: dmukhin@ford.com
Cc: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org,
        andrew.cooper3@citrix.com, anthony.perard@vates.tech,
        jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com,
        roger.pau@citrix.com, sstabellini@kernel.org
Subject: Re: [PATCH v3 3/4] xen/console: add build-time rate-limiting controls
Message-ID: <alrq1e7inTDutBbq@kraken>
References: <20260715201902.2984407-1-dmukhin@ford.com>
 <20260715201902.2984407-4-dmukhin@ford.com>
 <1784195975.8631fc262581453bbf619ec5b2062170.19f6a5e0923000edb5@vates.tech>
 <alrmP1FHd7AzlBxC@kraken>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alrmP1FHd7AzlBxC@kraken>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180026
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|SJ0PR16MB4173:EE_
X-MS-Office365-Filtering-Correlation-Id: 75b697f6-52a8-43d5-6441-08dee477dc57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|22082099003|18002099003|3023799007|10067099003|4143699003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	EJuCRN1Y98Y1L4NWFOfVOp2I8fbggtN//MLM1SXHgFXR5Qnotpon9HWZL892rKG7XROxzLHxshRMUhWJ5BO7fpJkMdhhOZAPw5rmVO+FYMlg30F2DIikL5X5lVY4Bi+YkHPcKskGEjblSDqwQPKH4eNodNhy0PjT26jKIFdNpV/nufErUTB9WidJqpEOR8LqrTjdNC1LJkyurAvfoYaLl/hTUwsSazauIyxMHE6PRM1TIO8m9EW1W4Znd3wx2mX0yx+CTIfzvAEsLa2OAEixwFHSvRmt+nCqjWv1j8H1hmYznOmaKgIVu46eEOGx35hFpgRXeZ1OZtEQ45yY8mXKLHLodK6Q+34N7Mw3NgUAnpudzG8T1bb99SGaXGlb+s1cqw1EEW2VWV/l9pgnqNMh1JwJEcIiXbURX9x9v9x1uP32WtlrsrHVOSIeTmrv3bcxfJKy6Z1rATgLXboAQjGE+peW0WDeFUrcZxoBJclkDhIsoimwM57+sXetFML6KgVsak94aR4+RtAL8YtM3PWvrnpHhJbbdtV0dFVYbZNz8ZXtYvxBBbprZ3HtPT+y9re1QqalZaIaeUvS+eRQ8N3TmSwRoHKf9cwofB/iZGQZFsOIiMFzCeOmORmA2GpOgkzwD5PciTr/IJw8EZ6mTml7wALqbXqvHsAp0IgEnJ6DtQTC9wFLwLwn0o/1dRevd5Zl9u0wzKpiJzUDAvgsY8wWnw==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(22082099003)(18002099003)(3023799007)(10067099003)(4143699003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	G0pu0SK2a5M7ObSNVsxZ40wpw9/tzCR9EuDm0ILBzktfx22Qu4tfj8p8kFh8MDIErhKBRZg4FCL6BjIDWp96p95/36cbPuk6AV9Y0ya6KrmqXQh5CGqyWyuuxSqhozm/Lhbip7KLPzBex0T+HmBpI6cF+fliSNLqN1fYI77RN0waVq463bCPEdzU1rWsEzlL8nLo0HeOnQQZfQ/C/jm7XgrAOwjqpExclihOgcgYzMrD8OT+9SPY16VquPBVBNAheVrIuXk0io+xwnpsWz2Fv9X8EeUB1SyCIggosvYn7CEUAlaZwDENlxlkpc4DEF+ChulZvBkKcN1+5WUmRY2d8k5+WwBfoPTUnCsf4r1p4kUVq/4Bi/B5QrC26bcuovuzeg2IoWYiYGzZVFFE4wyOgQMThd1svve+TghkDORT1h+9TXNmXFfyPyNJO0/adGaI
X-Exchange-RoutingPolicyChecked:
	ndYJiG7KmG2dcHGbxg8mX1sTPSlsSbylGLayZG9HwLYmMtkkmhWr/4hOxwHz2XL2Ba3kUVGsRVVR6BvT/YtFjssUPEZ8xehULkmFv07WTpGlm/N6333KTrf9xWxjeG5kfdVZPc27j7iycrq8ezMsD0RQ5cq4QrvJPBqknhlC7hDr0xePFJW7p8AyDYTrYF/FMN8CDgXugveXYo0bmbWRgXPdwf94j2KhNedBd+LfrDsnUwC0Gaa+QrSunFSRept5HubzEbp2ur+qqS2CY09wTWaZEG1GOWTZ4eMTtr/mAAt74HkAhrY4hIIgubqGku0zOuhpQhSWk3mFxQ5VccZAGQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DUYve0jo4WsiDl0+BAzpa6IkJKi5Q0h7E60FQMr1wKA0u1Kt4/SNMnpzu16vKUkMrwM3EMeqcIpFC6rkOMrYu1//ktQ3wVFWMR6R09kldTP6A6UdVUVIjXciHS7bilkruSLauyUC9IMW8cX8fbil+n0hdIrzKc9J+EkPusq+EI8ntZtUbIYU/GA2/3C/0dgTLHv4uXCpZ2L+Syuin5C7hIhoRVzbQ9gzPg946UZqMjRpm6BGKZGF15s7a5wlDZK63Tiy+MBrIMEr/+bSS9qexjKs+mcIytKnArRxQbpL6zjtPqERDGv0X1h/gba84i5AAOe/Jy0h8ZMjPLAbX2D5Fjg4XujBKrL5rEhesihfp4xEieeLjBphv5hqlKGB8j2NIWDyafdpHjhrvYzSEJx1Jgbts5VW1AGSqf3ZRyK9qzdc/L0gKDD8uTYFJ17HYX4Fwx2uqrJ3DDHnQgSsGJr8t2nKpMKl+BX2ad/nwfFub113IvtIl5OpgFc4Ashv3BFEYx7PvJbSTlOxabJOITXF7EEOhJO+Von3wIAT1rxewCSQNlIJJAWPGsCpWGpt7wQEvDRrsS4Jh4KV3UJQwxKV6WS+GJvKNSSIwBqzdqOigvZJ7KJpDEMZSjNK3d6HQVfjr99yu1BabwMIKthxZn/30A==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2026 02:54:18.0731
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75b697f6-52a8-43d5-6441-08dee477dc57
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR16MB4173
X-Authority-Analysis: v=2.4 cv=C+fZDwP+ c=1 sm=1 tr=0 ts=6a5aeae1 cx=c_pps
 a=+tUgqrp9vGCFEjR5l+cGAg==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=NvsXeTrgx-CJMFV-xl94:22
 a=cbNQJ9GKAAAA:8 a=o9aIDJZ9gNO1dne_i9wA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=P0bj-C3X3jJDpopQwM1U:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDAyNyBTYWx0ZWRfX26HoLOL01PAg
 ZO3FV/crL6JIJV20VmEDqspLrbtpcpZddG6ZqsgNE79+faTKTmReKnlxN8n6JY5bG0yyUVH81Zf
 aNC48+hcSFxisiOe1eHMrFRoQeZKwJfI/6FucGxYUNvnqpBoqiHUGcFD83BoraFA/lCnruJEJmt
 cJDpNdMihFi5uzJXO9GEhlyjXXqOnnuzBle3OizQzuxiTrZ9kqobSY9IQ0pWozBtmA++6t5FWsB
 OOohrao8gBiLRLOYyS1QGXcRtC/w4pOVoaGg+9blsdzk928Ll0PLR3E5OgNnIIH6CJvI2CtxpNa
 rW2vRXXqj2lKz2Seic8RHLH62T8U1KJVEx+73AThlCSxmbT3sPU9NZVPq1wA+6EBUu9FnttbTQV
 vzHshrsDKT9CePG7PT0I23YqHcwYoXFtFkB5xdQm4DXoIB0eNWGgaiyN5PciJmT6Cs7bWeFAD0g
 9aAHMPgluphhNDnxrhw==
X-Proofpoint-ORIG-GUID: sjzOaUU2_LF3UbpsDj_2cTALzJMAW9_S
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDAyNyBTYWx0ZWRfX83eQPLSNrO4H
 iZeJUZR2aWOHXbt2eDTLc6RuAwJJw34q8w1ZQaWUNb3WSfpMcrP4nRcuN+V9VW7myL5ezmxxkqJ
 pzvANp66vbWfrkXoK7xulG7PwdVblG0VflSr2FcFmbzXWl4T8cfb
X-Proofpoint-GUID: sjzOaUU2_LF3UbpsDj_2cTALzJMAW9_S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180027
X-purgate-ID: tlsNG-33051d/1784343268-6E6CE4E9-E171EAB8/0/0
X-purgate-type: clean
X-purgate-size: 3223

On Fri, Jul 17, 2026 at 07:34:39PM -0700, dmukhin@ford.com wrote:
> On Thu, Jul 16, 2026 at 11:59:34AM +0200, Teddy Astie wrote:
> > Le 15/07/2026 à 22:24, dmukhin@ford.com a écrit :
> > > From: Denis Mukhin <dmukhin@ford.com>
> > > 
> > > Introduce CONFIG_PRINTK_RATELIMIT_MS and CONFIG_PRINTK_RATELIMIT_BURST
> > > for configuring rate-limiting policy at the compile time.
> > > 
> > > Use symbols for global rate-limiting initialization in the console driver.
> > > 
> > > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > > ---
> > > Changes since v2:
> > > - moved rate-limiting controls to common/Kconfig
> > > ---
> > >   xen/common/Kconfig         | 29 +++++++++++++++++++++++++++++
> > >   xen/drivers/char/console.c |  6 ++++--
> > >   2 files changed, 33 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> > > index da80fdba8469..fd22806884e0 100644
> > > --- a/xen/common/Kconfig
> > > +++ b/xen/common/Kconfig
> > > @@ -672,4 +672,33 @@ config PM_STATS
> > >   	  Enable collection of performance management statistics to aid in
> > >   	  analyzing and tuning power/performance characteristics of the system
> > > +menu "Console rate-limiting"
> > > +
> > > +config PRINTK_RATELIMIT_MS
> > > +	int "printk rate-limiting time window (milliseconds)"
> > > +	default 5000
> > > +	help
> > > +	  Specifies the time window, in milliseconds, for rate-limited printk
> > > +	  messages. No more than `CONFIG_PRINTK_RATELIMIT_BURST` messages will be
> > > +	  printed within this window.
> > > +
> > > +	  Setting this value to 0 disables rate-limiting entirely.
> > > +
> > > +	  Rate-limited messages are those controlled by the `loglvl` and
> > > +	  `guest_loglvl` command-line parameters.
> > > +
> > > +config PRINTK_RATELIMIT_BURST
> > > +	int "printk rate-limited message burst size"
> > > +	default 10
> > > +	help
> > > +	  Defines the maximum number of rate-limited printk messages that may be
> > > +	  printed within each `CONFIG_PRINTK_RATELIMIT_MS` time window.
> > > +
> > > +	  Setting this value to 0 disables rate-limiting entirely.
> > > +
> > > +	  Rate-limited messages are those controlled by the `loglvl` and
> > > +	  `guest_loglvl` command-line parameters.
> > > +
> > > +endmenu
> > > +
> > >   endmenu
> > 
> > Given that setting 0 to either will disable rate limiting, would it be
> > preferable instead to have a more general PRINTK_RATELIMIT toggle, where :
> > 
> > Setting it to true would enable configuration of ms and burst (rejecting 0
> > if possible).
> > Setting it to false would set both to 0 hence disabling rate limiting by
> > default.
> > 
> > And we do something like
> > 
> > static const unsigned int printk_ratelimit_ms =
> >   IS_ENABLED(CONFIG_PRINTK_RATELIMIT) ? CONFIG_PRINTK_RATELIMIT_MS : 0;
> > 
> > (similarly for burst)
> > 
> > ?
> 
> I can hide both selectors behind CONFIG_PRINTK_RATELIMIT.

Oh, I haven't seen Jan's feedback on that suggestion before answering.

TBH, I am fine either way, but I think just having _some_ controls is more
than enough for now given that there's no certainty on how ratelimiting will
evolve...

