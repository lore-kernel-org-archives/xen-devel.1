Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127C8C53219
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 06:44:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375161.1622391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woy1h-0005xU-Lw; Wed, 29 Jul 2026 06:44:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375161.1622391; Wed, 29 Jul 2026 06:44:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woy1h-0005xN-JG; Wed, 29 Jul 2026 06:44:25 +0000
Received: by outflank-mailman (input) for mailman id 1375161;
 Wed, 29 Jul 2026 06:44:24 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1woy1g-0005xH-DV
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 06:44:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woy1f-009DZ4-I5
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 08:44:23 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a69a145-5cb7-0a2a0a5109dd-0a2a4501e84c-2
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 08:44:23 +0200
Received: from [40.107.130.6]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a69a146-5984-0a2a45010019-286b82067d53-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 08:44:22 +0200
Received: from AS4P190CA0024.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::15)
 by PAXPR08MB7382.eurprd08.prod.outlook.com (2603:10a6:102:22d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 06:44:16 +0000
Received: from AM3PEPF00009BA2.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::5f) by AS4P190CA0024.outlook.office365.com
 (2603:10a6:20b:5d0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Wed,
 29 Jul 2026 06:44:16 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009BA2.mail.protection.outlook.com (10.167.16.27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Wed, 29 Jul 2026 06:44:16 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AM0PR08MB5458.eurprd08.prod.outlook.com (2603:10a6:208:185::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 06:43:13 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%6]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 06:43:13 +0000
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
 b=QNramig3Rcrt8CroIkrHOgWy3Ny3WrIlNVjg7mZueutukuRZD1yQXNPFy3qdcjQpgxw8hTvxCx24/oZeIAiF3VYPVIras7buP0QaXBt/EbraPrMWuFKpVKOikMf2jzMYalE1vZrQl+v+Qk6lWjheHEPBuxnZGkHRKiEDK52SJDS3dSrZm3oqu+mksHP1AV7WJ9AdB8RZNU+yFtIO3Og78FuLrYp0vDIW07Qf/oxddKLXzUwrhqoarzpbFwda2moTHUtkAxTzf7Bu3Z7liv5ZL+tOpW2hBoG8tAXOkAoEhB0z9M9VTLnwzxUCShs/Lv7h9phM1H1liUxNDvrl5+S0GA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kc2DpSiJQuW98VB2RMgvZbLFpx0hC99rJGFgFEP6Y4Y=;
 b=H8LHiBIH3L1bnd4Ylm/DW1qgjKyiSA1NNmoHz8qMQghFDW6MdXzlEDHs44Y5VcJ6bB/9CPCg1ti/xsJx8FAxqJvK7R/Iy5giE4XmBrxlGs2VSpRxD0UU4gb7g9NgfDZr3aZbo7TioA3h07uOsB5g5Snq3+y4gLfnnxCumFS2Ys7oU5kO9frlbxtVAaxREp9eQ3KlPNt9PyUsNpPGXIWnrjL4ZvIPRdG4OY03gR6c8XcwIdOHPz9btznQhmePxkZedwrzOgNYQrAGSe3BRDqPUXZzRts2pqgQ8F0ked+A8a6b8U2uuksvwKVxtw2Tgy65rx4+4Gc89s1bPDKpTrSfKw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kc2DpSiJQuW98VB2RMgvZbLFpx0hC99rJGFgFEP6Y4Y=;
 b=KegZTjBwxhRMtcEJW46AJgMXQEH2AQKfg6OspTkOuuTkwAwPZ2TT63SrxxNjzZ/kpwDX3FwnMkgLXmQh+loqGh1DA4OX52AZuNjYBUBV2PnuU7bNio7UKIvU7SXSc1XjbkKoHysv2W8RByK9PzJcB76OwuiajWU+ksEL88lA44E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kcwq5xso8pks+5Xrcacd37MeKcQFM5PAdvzSK19vdajn864IpprSr19DffL7ML9P5+rcbd9skodXZIqGk2aj4RTQzvyj1XbAs/6stSLXTePBi6FmVqaqCYVHtkJ4smwfxdikXJMDrTQ1e0e3PsLzlccE0CT3X0eLJbxLqZqhOhHvrwB/54/p6BNJBctucSIWF7KqnM3NDBI45AimvPNUGsRUSSgCtuPQN0m+GuGalliCqiFJlw2x9CvhAoreoMqSYXcqB+V6i7aEdIpOZ9f75R+5+XxzgKfkyEdx8ffXdVS6v692oe2uiSL/pV+yukf0aAMmJB+7AJg4QZmdx25Sfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kc2DpSiJQuW98VB2RMgvZbLFpx0hC99rJGFgFEP6Y4Y=;
 b=gW/4OXn7Zt0xxlzCht3D4Wsys7/FtS2aLK6uKKOTns2qluU64nBKOo/P/TWEZcLs2lQh8pJClOPitUXC7AXahPCGwoklNGEffgWaJuaHUBpYqSaEzv32IPcFzof+Y+DJIBMklEMGrcB+bt5TstBRI4ntoiJ1yZODh3T3UmvJxsJ8RLdkkXJkkAqY1ag75n9vhzmMhWiYKVlSnBH+yuaTBq29ZtLj2idVh+6WFoJy+afUPdG6GTRu7na6xhXq9qaRPnJEzxRP732s8q+VZiVspXFgj/xz06tx5W837nLWD4o1Srmij4z/EYv96zqwY/YgcF6nt6rWBzkOWxHq0/i+GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kc2DpSiJQuW98VB2RMgvZbLFpx0hC99rJGFgFEP6Y4Y=;
 b=KegZTjBwxhRMtcEJW46AJgMXQEH2AQKfg6OspTkOuuTkwAwPZ2TT63SrxxNjzZ/kpwDX3FwnMkgLXmQh+loqGh1DA4OX52AZuNjYBUBV2PnuU7bNio7UKIvU7SXSc1XjbkKoHysv2W8RByK9PzJcB76OwuiajWU+ksEL88lA44E=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Community Manager <community.manager@xenproject.org>, "committers @
 xenproject . org" <committers@xenproject.org>, Julien Grall <julien@xen.org>,
	"Orzel, Michal" <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH] CHANGELOG: add Arm and RISC-V entries for 4.22
Thread-Topic: [PATCH] CHANGELOG: add Arm and RISC-V entries for 4.22
Thread-Index: AQHdEs2bgCv+muPD6UKnmhJ7FnziuraEJWaA
Date: Wed, 29 Jul 2026 06:43:13 +0000
Message-ID: <24C3741F-1803-4ED7-84E3-0A2801468D41@arm.com>
References:
 <8087862a1149a8875b578c2b3d044919d8563a39.1783950107.git.oleksii.kurochko@gmail.com>
In-Reply-To:
 <8087862a1149a8875b578c2b3d044919d8563a39.1783950107.git.oleksii.kurochko@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AM0PR08MB5458:EE_|AM3PEPF00009BA2:EE_|PAXPR08MB7382:EE_
X-MS-Office365-Filtering-Correlation-Id: c2143743-a11f-4670-a354-08deed3ccf2d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|38070700021|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 DT4wSUVLKdNTVIboLgWdHkejugDr2QP5R+EKPrZQW6m/2VjH6v3VI7NGjO/y3rHJXNSGR89wDegF3PzK8cAEKb0YBefAKYn4sIPitLuynu3lCZwKlhSLLMr+fU0oBCbaqYjddnQMURut6mcgPJSJuuBj58v4ID+H+m88UoX5cN2JCoXPRIzca/E5i0qucCtQ4mVcrevTf2DG8EHFa2nXLwtDbvb2PfKY8NNzbMwrzaHKu/VcFRup7vTcfuA4dAd2rjht915enK/rzq+mcrhsSlmwPbu0vLl8k4kut9TGqcCwNjuZmdtZKJGPvsk5GlWXijEKygQo1KiahSa0A8Mi/H3U3C39R4BDYWIlNPi2gR6KEQXwkcAocUusM8WyPfBmz6CxLJVXVNRv6Rik/3IIAOBXToxcGIM2v1+UTr3l039GdVR2malPZa8OEL6owA4f15a+0QgESszakkjCsjrdzFKF0/Z0L7GZACa/i58J1nnaXgUWNcyfWicsvv3vzg2FGd/QdnvUH7lJoVuKDrR/3kqjCaLZO7Wi4lLCJA9mVfJ4zMv223TtUkGSCzYHwExu9PkYAWPpeXXYifMNXZGItvV9/CtfSRLfd04ZBIOwQZfVfkE1tUJEZNDGArouRl+LrDnXja1b1gy+R/iu56nI7yLJlYHUBXXFHBHT4IFeiM0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(38070700021)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1F776A3F99FD054FAA51ACDD6F18E224@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 I7ceVMikhhcNgxqI8hyXSd3fjTgSdPjNVjoBp7ZtKMn4gFKFvWU/ZuYf0Znj35487nLG156R/Mb+jmkKUsN/JvIZ/6GBQsyKEAxAJzwIn8pKzcQ93XvzXXUcdo5fiLXaCG1Xqej/GsPEf7LTKSkpfF454OObUs37BinG3gPKa/0bipLAnMXbkukh/wi6xgJkQkxvkubKf4a6gqtkW9lfAiIDll9rghSgyyBfR7s8I5eOJ0STpMeU86ETxwKr7lwcCalR5zsaLX5Sc7OgnPtoYlQ5p8nut0/qv5CouGzZY4vJUZd3xqIYHgtFi1GU+ejfUqzrrd3MMFeLXymeAmWQxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5458
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b8a48b41-31b6-4ae3-e6ba-08deed3ca9e0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|35042699022|1800799024|82310400026|36860700016|14060799003|23010399003|18002099003|22082099003|13003099007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	CcdgXeNUFYP88v1O7CS9KkoBE3NGZO+54bvy6vGv7ExXMtCyV+MVe+ybg01m5/3l0e7fct1AYaPs1mUqIpRLy27GtPJLNNqlhE3Hv6RqojRgKY4EX90y438lp1v/T7pOQkaeWZy3B3WX8OuYLreVnOgTugrinmGxB9sI6kspf+hs+m3OQrsMDJF3Tu1fsJamiwmYRawwYSkk3qXbZI88FULWTSbHuC9D9miwoBElGEh/geaUjZ7Dp1yJx5By1UTUawLJxlJsj6LEy5kQrOHz8LnNX1l27F/bSKImQ+iVwBLIOH+juAh7p1M5bej1Uw16rkeu3t0puLYH5cnpaTWYxW3eYddpFXPtX5HMz66MwvstciQxeNbeKTKsngNYKDWFFmvfrzKBN8zezHC5IxqNX38WgoxfJjsk9GC/QUac8g82nGKkb3ww2DH712HSOyLmMVFBCy2CUzgLDt1a1HtKMZrr5OTspAauGOyBwhQy9wKIy3qq7EzunqmpfBPggMz2ZhU5naLuJ/GM4FwVJLirCXjhMmiZjTnLdTTf3yliiIuU1MeoEAnZcs0qrU9rQeC8Z3iB+wlBGsNaHsoXnuaZLa7ZkQewoQ3l3136+sy1VNcNJxvnpu1MV57LrUUzJrj6SkJVlACpVtXOWDn0EBanrw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(1800799024)(82310400026)(36860700016)(14060799003)(23010399003)(18002099003)(22082099003)(13003099007)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	feGfZJGa8y954kpKQ7YvsG7aL2ofs0F1LI6cvbYDNPtAQZqNPJFtKXKoNtJpPdZdOJZnJCsZJa5DMnnNkvFgJNdn9OfGFF0xbo+npxJv5EfLxqfs7oNBtakGusMu/h/9HVHIT4I9q4TrpJ373yKYfbEgVRvxGhIP21ORvvCtWZTAhc182Gnoe2HL9nk1I8rbSyUO/w9EjxnUepP6zuizn+yiorsJzcOa/MrMyJ7YwTxpYgOsvpChtsm3hNz303r9rTqA3SKJEWG4KsdkmeWul+z66Ar8f4d7P1ZP2+4tlOGRlNmskyzZW4dzdV3h9MWYL98AyY+0wHYunWsVyi1ROfUt27QJQarAHLMhcWxJ+EC3JuECb2VI/zv8bIydYwav1Blf4kDNjp0xLhnFMnADZOv69z4HSy37dvcubHsFl0TO46uMB+w1HADsakLZgO5x
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 06:44:16.1979
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2143743-a11f-4670-a354-08deed3ccf2d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7382
X-purgate-ID: tlsNG-d62444/1785307463-C5341757-EF0164AC/10/73395122804
X-purgate-type: spam
X-purgate-size: 1334

Hi Oleksii,

It seems that this was missed.

> On 13 Jul 2026, at 15:43, Oleksii Kurochko <oleksii.kurochko@gmail.com> w=
rote:
>=20
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertramd

> ---
> Changes in v2:
> - Address the comment from ML.
> - Reword second RISC-V's item.
> ---
> ---
> CHANGELOG.md | 9 +++++++++
> 1 file changed, 9 insertions(+)
>=20
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 356be88351a9..4dca8359cd4a 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -46,6 +46,15 @@ The format is based on [Keep a Changelog](https://keep=
achangelog.com/en/1.0.0/)
>  - On Arm:
>    - Support for guest suspend and resume to/from RAM via vPSCI.
>      Applies only to non-hardware domain guests.
> +   - Continued Armv8-R MPU enablement.
> +   - Drop ThumbEE support.
> +   - FF-A v1.2 support.
> +
> + - On RISC-V:
> +   - SSTC extension support for Xen (not for guest yet).
> +   - Introduce domain build helpers (CONFIG_DOMAIN_BUILD_HELPERS) which =
allows
> +     to load Linux kernel, initrd and allocation related things forfor d=
evice
> +     tree-based domains, laying the groundwork for guest boot support.
>=20
> ### Removed
>  - On x86:
> --=20
> 2.54.0
>=20
>=20


