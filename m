Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42AA9C5DF74
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 13:30:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394175.1633009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwJsx-00069S-4J; Tue, 18 Aug 2026 13:29:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394175.1633009; Tue, 18 Aug 2026 13:29:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwJsx-00069L-1E; Tue, 18 Aug 2026 13:29:47 +0000
Received: by outflank-mailman (input) for mailman id 1394175;
 Tue, 18 Aug 2026 13:29:46 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1wwJsw-00069F-1s
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 13:29:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwJsu-009BaM-OX
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 15:29:44 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a845e3a-bab6-0a2a0a5309dd-0a2a45069ab2-18
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 15:29:44 +0200
Received: from [52.101.72.8]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a845e47-195a-0a2a45060019-3465480879a1-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 15:29:44 +0200
Received: from AM0PR10CA0008.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::18)
 by PAVPR08MB9331.eurprd08.prod.outlook.com (2603:10a6:102:303::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 13:29:30 +0000
Received: from AM2PEPF0001C716.eurprd05.prod.outlook.com
 (2603:10a6:208:17c:cafe::a5) by AM0PR10CA0008.outlook.office365.com
 (2603:10a6:208:17c::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Tue, 18
 Aug 2026 13:29:30 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C716.mail.protection.outlook.com (10.167.16.186) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Tue, 18 Aug 2026 13:29:30 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by PAWPR08MB10946.eurprd08.prod.outlook.com (2603:10a6:102:46d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 13:28:56 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%6]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 13:28:56 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OjYYVHB8OBpR5dlVXVQFy7QOSvVZ7ZhRLMXmAWJ1WbYoEAjRFRmzKrBdHV3HYMSbu+z1EE5JAehFUYwIRRrpyODN5LQt37XuFqvKWeINeweSs+3kT87mAt31VDJX6OwivL27CT1gQ32UCuCRnguK3Utu6wM9fOyl8O6czz4sPPFHneloJ6X025oyvsPV2jATmFjXNb7EBPsxzAYLrHLeo9HpN5kgzoWrKlwUg5pbdV6IqX5l4+TYc6/Yzbvr4t75+u3Su1Xon5tsc+hnUQY5y6CGCJyr3f7gDAS2UDrTLRcttkIBj/7yXpgDPk895zrDNSQMuOSBaGQF7vhqAsybrw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vs3t465oTgOJ/gmIgHwch4LThzCGUM61rplAOjWbpkI=;
 b=ZINnH2K6N2eDitB6czqg/6kGGZ+Dv96v8IRg7KYOTxtlQzx2NDlqBCi61RDeWv6WcRhjOD465HLGhp60cot2BucF5nHyWZJmW2hysCpnmshFzVTtTWR6lbxSf5Rsy43pjBFUSoKfUKiWZ56NzS4sFdT0f8yubz3VqZiIMJGbTfe2k4uVdzSuVGBhFpmk8TH3RFHSWE54rzngTcQ6get0ePWDjCo7oUr6LbxsQ6ICaBCuf807I1vhe1yr+21q1Zr3ASxAwGLKtC58Xb+TPWhVL5MRx5sfNWUGDZFzwKyiR+hZolhkZk9AinGopWpHhKlKQxvF1ZR8Jjbi+Upf7UIWog==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vs3t465oTgOJ/gmIgHwch4LThzCGUM61rplAOjWbpkI=;
 b=FxeAeNjF5+QwQgdjD2VD/qU0UUi12kmY7gKd5xwxsitwGuQqIhvm213St6HQIdWCeZ982zh87Dv+R39SowVIcYx9t4HsYcz4k0YQnJfFel9zhQLnCaojHHwDR8b/LayVOkkjVZLXR+lO/TzCKPBiBxbGzioE/dU6gfYpYbfiqSY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eeViMAdKINJPIeHAZD/vXuTjqFcas8JGILz87WGERhDmdqg6nbGgwj/u6BQ86ZnbjKDFseUhPlhQQWjTMaFdfp4ShbQVaMZmcZjlaCJx+rNpqQa12uYf3fRfn1hl37Lvg8RsXyOHENlUqnmhQTR1cAWaPifxan8zyfA+UCH/O647J4ms6OromY/oQEjZFYHzJ1ITbVUrh5p188W8iMU1A0fQJ5el7HxZwWdOEs2sshMqeGAWPg5OyCmMOZtMxdSxeobvVQvtNB48qJHKgw9E6adNmL/f4/PkvGmQetIlJoDxG9iqYznrbA7ivzvhHuMCSCYyM465aRqUWvA2SykmQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vs3t465oTgOJ/gmIgHwch4LThzCGUM61rplAOjWbpkI=;
 b=pBPqRsXoHpX+ZkWVrx6unGGQczctAYkiM7jbPCJ1Prwp9+0/EtESsBt7lIIrJ5ABZghmR6eiUM/r9yAq5B6eX3ZSRL8zFxQf2r2wgJRYpAj2qJPU+PhmFYtmnF43DRJr1JIsw7Fk3nTCRvScPBGGzmlt5aCSORHKmcv9gYtudtVg1/0pbR2l6dm7QmhBnKk5sBmE2k6AjKK2QiJ3hjONZ2hvBxq7NPGKV4IVddg1EZlpGTbjibTY8NZZOyNcntGFhgbQWbcgm2c40tBijFDB4cj7ZtHXeE+QHo4zGLexTMVdqoktSui3rGuZc7mhTxl/wnSzfAon3QAjK8qqTyYbnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vs3t465oTgOJ/gmIgHwch4LThzCGUM61rplAOjWbpkI=;
 b=FxeAeNjF5+QwQgdjD2VD/qU0UUi12kmY7gKd5xwxsitwGuQqIhvm213St6HQIdWCeZ982zh87Dv+R39SowVIcYx9t4HsYcz4k0YQnJfFel9zhQLnCaojHHwDR8b/LayVOkkjVZLXR+lO/TzCKPBiBxbGzioE/dU6gfYpYbfiqSY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Jens Wiklander
	<jenswi@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] xen/arm: ffa: Harden SEND2 against invented loads
Thread-Topic: [PATCH] xen/arm: ffa: Harden SEND2 against invented loads
Thread-Index: AQHdLwt9ezGusG27iE6LBf89mJZswbajv3sAgAANaoA=
Date: Tue, 18 Aug 2026 13:28:55 +0000
Message-ID: <7F03E2BE-44A0-41E9-850C-8480CA0C8F0D@arm.com>
References:
 <1b483ce633bfa7d304cb78458ce029370691f00c.1787055320.git.bertrand.marquis@arm.com>
 <d739485a-72cc-4518-afa9-8d2692a225ae@citrix.com>
In-Reply-To: <d739485a-72cc-4518-afa9-8d2692a225ae@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|PAWPR08MB10946:EE_|AM2PEPF0001C716:EE_|PAVPR08MB9331:EE_
X-MS-Office365-Filtering-Correlation-Id: d2c55618-033e-4496-d50c-08defd2cbbf7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|38070700021|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 JMeLCeNJoiZH1Q0WUZ57p02tL/+tDvCd1VcL/z87qcX/OfR141BfCCu6abULGcBzA+BtSdGI3dsHHmIEvVhLif02hI+HIN5Aovf8Fq8vjy8lq46j552c2TorT+c9Md3jZwZbZwrYEqSPWFSb6QRoZORBDf4+/Q+JfThULc7UXJFv67uK6kBSQBg0+MH0kujHT6v9ppScHGPV62AceIFq5qqd3yAQarxJ9aUcrsjmzqrBVXG/IoLISAV5ppVO3xwQeSXTZaum49BBIXozpKDelVhjMrCj2Q7T1cJ3AqatkPO55AMmxzfHomd2mmzr6lCgcts8RM/JKEGdEIBrFYTpYfG3xEnxyenNjksNQPTrEOqdlVAWgFIHEKGQfsB6Rz6alSxYSsWex6rj91eJgGDMi5FhwW75CD6ZQrLBw7fR3BCIx/5Vs9NdEdCyboW12kzqSxVUxFqWJr8sNAq9+9DmpRwWgmwX7GWeTX0d7IZTmtDNiT8FnQkJaMctUHSkm2F2FsKVfO/avKPYPsipoauubU27WRIACQm9CovYSrxmLBKH9zxMYkOgz4PsdsDzSG5dE7jAfcZB0Hscq7dC2Zc00ZYjn2Oq/sMzROW9tgzh+VCJdrS/GDsN2i54VHOG8khP3MMvQcuZlmubR1KjOIXz1rHs+FpQvW3bSDesvrmDVn4wo8u1uMtp1xi964Z12G/W9jetxiLDFFp+Wa01C2NIwzPs5x33ZWAt8LmWfPxq61Q=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <21552626E6253245B95B7B2D0DA10A9C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 o5zc88oRZQNectCg2jznTnOn3veyJTT2PnQeGejvhRwIpOp20xDDtbzCbqX0UUVMa1Xhf6nerEg6Pl9Sgl6MOReK9bcCGKifiDY3YiNfDp34QsvSo4wJ/WCzPvoh18VTb31ITU94QGXvMhY9FBnPpk+cGfv4RP1aez9Ndcw4WkxpXH758bJMNVcpsh0lekLeMm5hvIjZfF7Y4ni7BjpFDEChRGB2wuhB/sondVHReLKrPNomQ+ZUrxwNkEwMDUrEIFRlL7FaEmsUEUT747a2oCMns2ICEdS1MLIAPYkXGerGacAzlcADl1tmOYgfR9SOaOV1qRwr6IjLBk4quYM1ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10946
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	acf944ce-c3c9-4b3d-8978-08defd2ca749
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|35042699022|1800799024|23010399003|14060799003|22082099003|18002099003|11063799006|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	jsA8c0KtAZdOw07RgJSJ3WMx+Th1Yfg/cm9T335+xQN1TB3nTnTORNe53Vf10W0eDJkM7qNStelxj2JzDJfb+iPvBmDZtA5dLJy34zaDk+mnfo+q9Af41Hw5tadZGaDsHrUfZPntPOFa5cTMVXQJfk9E12fcSRSm8YuovHqNX6P/kvRHOumfFa6PIeCJRSfcSrtLQDOFhsc27ywbzLayCJ8VQAKCYp7Wu6L+7Uvi90G1BILHVoDQbEFvr3JvOv8bSRt0oJ4sxQJ7obeLAY2R78VPRchn4//PghLFnnHAQPQgLoEbX66tiMldFuD34HbhO8kHBwom302RL68TwVbq0R72VfUg04j5De8EpO7fffxtd1/u/w/sA7UTzjUB+OiFUFsZtO0G5LpOxRTkYM0rZa0EOZMSSnJZAVAV58H83x0UVq/FlN8/MtPcbgQNqBaFVbpsZEDhBGbFkOCXDl4sKJ1MMcdXPZjQUVHeQhV87Ck9XvXqQtVkWoiDaH2YYw5+LuXXklw0hQKgICVrOkhgWnTF7bttCJEthZtYtbKekEoiKvziJ1bl68K/LhQ1jrNIDYhM6kmeXksscYZGHv/lBlg3sea6z2pRH6MrHOjkTa3zM7jCrdAStqGtl94KljXfHTIriGdCFvgrpPpK5FrKbqq9K+9PlxxUKY3WFJrotq2fudCPRGKrbJctzWCKdQ0/WzrX5b6npnnjOkFtzwf3Nw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(35042699022)(1800799024)(23010399003)(14060799003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9iHGGkLIVmAlRk3JVq3dGypE7bXoQpv7G5emIzh7wShh0eWp/h7O7+x012VGZXhKyT+A2Hv1UGMtkGMzt7QrYOeBcd0tDAdn70VxdrmQodLNb6ZFTw9nNEYCEbsKQZ/sBW+TMFMp3HIoiXgWjJKROmvoiILIRJg5J/STEQXqTlpc8bhkXataWFYFQn3QD+Qhi/A5qhjRToLK1NBk8SburSYfl5+8ymLMwALyGKT7rM1MdCHob9CnNO2PpiwVqAAHft0imO9Kgtxs3nwQxPVOE74Uz7Q9095DCeYPpwmthD+Yk2vM7WPVdmM3eT50WbUxfT4knHiX3L0Hh5n1MUJsEm53cmQWnSSd7rytjfRWRVI6hQQOi7ZD3ZfXHNXcT9C71DB52YA6KqdViLheJIl2kOxfGdttLnuqTmNbbjz2HoKR9X97oPPaprDtYVrCYLLd
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 13:29:30.6206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2c55618-033e-4496-d50c-08defd2cbbf7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9331
X-purgate-ID: tlsNG-16d1c6/1787059784-FE67277B-8B2B9373/0/0
X-purgate-type: clean
X-purgate-size: 2993

Hi Andrew,

> On 18 Aug 2026, at 14:40, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>=20
> On 18/08/2026 1:16 pm, Bertrand Marquis wrote:
>> Research into compiler-invented loads has flagged FFA_MSG_SEND2 as a
>> possible vulnerability.
>>=20
>> ffa_handle_msg_send2() copies the message header from the guest-writable
>> TX buffer before validating and using its fields. A plain structure copy
>> does not prevent the compiler from re-deriving later field accesses from
>> the live TX mapping.
>>=20
>> For VM-to-VM messages, msg_offset and msg_size are validated against the
>> source and destination buffers, then used to copy the payload. If a
>> sibling vCPU changes the header and the compiler reloads either field,
>> the checked and used values can differ. This can cause an out-of-bounds
>> read from the sender's TX buffer or an out-of-bounds write into the
>> receiver's RX buffer.
>>=20
>> The cross-VM path is gated by CONFIG_FFA_VM_TO_VM, which is disabled by
>> default. The audit ranks the likelihood of such a reload as low, but the
>> C semantics do not guarantee that later accesses use the stack copy.
>>=20
>> Add a compiler barrier immediately after copying the header so that
>> validation and use consume the same snapshot.
>>=20
>> Link: https://github.com/xoreaxeaxeax/schrodingers-toctou/blob/main/obse=
rver-effect/audits/audit-xen-tee-mediator-RELEASE-4.21.1.md#tm-2--ff-a-txrx=
-buffers-ffa_shmc-ffa_msgc
>> Fixes: 98af565b1e61 ("xen/arm: ffa: Add indirect message between VM")
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> xen/arch/arm/tee/ffa_msg.c | 5 +++++
>> 1 file changed, 5 insertions(+)
>>=20
>> diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
>> index 1eadc62870f2..39f561c8237f 100644
>> --- a/xen/arch/arm/tee/ffa_msg.c
>> +++ b/xen/arch/arm/tee/ffa_msg.c
>> @@ -257,6 +257,11 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *=
regs)
>>=20
>>     /* create a copy of the message header */
>>     memcpy(&src_msg, tx_buf, sizeof(src_msg));
>> +    /*
>> +     * Make sure that "tx_buf" which is shared with the guest isn't acc=
essed
>> +     * again after this point.
>> +     */
>> +    barrier();
>>=20
>>     src_id =3D src_msg.send_recv_id >> 16;
>>     dst_id =3D src_msg.send_recv_id & GENMASK(15,0);
>=20
> This does look to be adequate to fix the potential issue, but you should
> drop the ACCESS_ONCE(src_ctx->guest_vers) a little lower down.
>=20
> With a safe copy on the stack, there's no need to further inhibit
> optimisations around it.  In fact, it's unclear why e040b94d0fff added
> the ACCESS_ONCE() in the first place, seeing as it was already an
> on-stack object at the time.

the ACCESS_ONCE is protecting the access to guest_vers which is not on the =
stack
but a value on an internal context accessed by all VMs.

You probably mixed src_MSG with src_CTX ?

Cheers
Bertrand

>=20
> ~Andrew



