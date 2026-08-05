Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406F1C55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 12:37:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383360.1626615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrars-0001QI-Sr; Wed, 05 Aug 2026 12:37:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383360.1626615; Wed, 05 Aug 2026 12:37:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrars-0001QB-Ov; Wed, 05 Aug 2026 12:37:08 +0000
Received: by outflank-mailman (input) for mailman id 1383360;
 Wed, 05 Aug 2026 12:37:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1wrarq-0001Q5-VL
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 12:37:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrarq-00CF1S-8Q
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 14:37:06 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a732e71-5cb7-0a2a0a5109dd-0a2a450ad472-4
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 14:37:05 +0200
Received: from [52.101.65.71]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a732e6c-f2d2-0a2a450a0019-346541473830-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 14:37:00 +0200
Received: from AS4P191CA0033.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::20)
 by DU2PR08MB10201.eurprd08.prod.outlook.com (2603:10a6:10:496::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 12:36:55 +0000
Received: from AM4PEPF00027A6A.eurprd04.prod.outlook.com
 (2603:10a6:20b:657:cafe::4a) by AS4P191CA0033.outlook.office365.com
 (2603:10a6:20b:657::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.19 via Frontend Transport; Wed, 5
 Aug 2026 12:36:55 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A6A.mail.protection.outlook.com (10.167.16.88) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Wed, 5 Aug 2026 12:36:54 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by GVXPR08MB11541.eurprd08.prod.outlook.com (2603:10a6:150:2e2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 12:36:22 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%6]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 12:36:21 +0000
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
 b=h7odzjxf8BQ6ldplA6o9NJqYIJqIoAC54m/QDw7BQ+1rcsopagJShSfQRDeRr3W2cd6tQ/iFwbvJMk1GPTqlnrp5fHj/sqb1FZh3n4Rn8I7A/0wI7ii5Vs/KYDlwvIocx6i9/hI4zhhoyzBRJqb+34bwvMF9DAlLkHI0CrKgl2y/oxkKBtMPe6mdh/hPlemNHvGOl6QW37g1z2IUIWHw08rMX1K5hO1uGegp95SG8uxj/wVf6FG2ru8YMkI3K7FK6ppQp0BTcSZqru2ar+EzYJaxdl2OBpaeISiI9OJdAidoF3XvYIiDpQZ7BO2RL59Ru6QbjvOoWI8+Rw5T1aPzIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JDS7KKBKW4Tb50TD937EvBFtqo53hc8n1Bbyf2j1eKw=;
 b=ghW5l6iExF8jvHcUfAE1MbrYgm2gU46wSK6vJ5LNweDady4QSAKHL9S8EpN4TatP+JjRqNDKNxhhqVM6IFId7fM3Zm9481+JmsC2bkMyC6vpnOhCjyj4zsTMYjje13CmtCn+F45KiBv6W9Nbvhf4fpkDKyWRaFWGObb2KCqfUk+w/r34K3yRx9qH5wxlEYtU6Rc8dQLDH/JWH71nzEN69s6S2qIpuvZm7EWxWo9mT3mAGYBP5Z8/qsC7KK92z8DIjunyurODwonUnEZERm76o2LORQwYfcCbyvOAH1tesXmcVTjI57l3nmrNx8B9EoUKhG8VyYDZAGNktN6T0ihljQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JDS7KKBKW4Tb50TD937EvBFtqo53hc8n1Bbyf2j1eKw=;
 b=ACANzZEmhpaoSmtOEZ6JBoEGJ8c+Hz1BJPkip470x4r3cdkG0RSgOoQbinwStCBuqAnmKaN3VV0kXRRgWwAmysnLlzmUaurTT6qvBBe5LqGAopZ5eYZUhsN823lkIieYHCh/jf7zTrVDwg40lVeQF50X/Jd5Jo5Ie9SMXM+kCiw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D7c7zbuXW9vzrQJLSN2rh4u9z1DdD6l3vx9tACVFVRiG80+8dgH5XOZwvwPa1owJ1pBZsovcl5dkFEJetLlPg4h6oSAXLd7/JaEd+fHM9LaxwoItd2W7dA1l0X0BvgTZ7mA9PPPij/V0+3rnXuav6RKvKBpC9nmVRJw3KTAI/DznymGI2YFlc9IynmwB2OA/NWZ6OAVIJFt0Wjv8sn12SPFUjddP8XI7CLZzkQqZUimRPkB6c+5R9kbLtE4ZpNZ46uutiJ7/fDXpiBJNkLEo1G+HLfpCvLzpfeP9Iu1Z2AK0zfogTVYEFQxw4AxfyFEM19o5Ko2UmyCghC7RdsAdfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JDS7KKBKW4Tb50TD937EvBFtqo53hc8n1Bbyf2j1eKw=;
 b=e2N3WIBLsWHA1nWjid7sKr32/wSTSDKGtZ7F/OA+70T5XWkYUVT2EkXG5iBzMdUw43wVJImLm1a9Uucs9ai5wlAxN/MM6DQAxb9bmlVmF92+XpJJu0R9ir33XXz3itcswbP4DKyuaUPpYgbR3TerlLk84vOHDIk7VIEX8Wr4lvbC7fuNcTVTcFs7ViBqHifROUuEeq5riiRhbtWshaDomXzPDQZVu0aQKR1jliKohAF/6ecUYVpvGVDgjYuKJDvcwW6T8mzIYclsM7zwUoGXt5QEvtpwknDLW8W+jA6yLnnYj953XCClq0HF3D6oJ08Ga1G8E4dT8de39Wk0p7kvwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JDS7KKBKW4Tb50TD937EvBFtqo53hc8n1Bbyf2j1eKw=;
 b=ACANzZEmhpaoSmtOEZ6JBoEGJ8c+Hz1BJPkip470x4r3cdkG0RSgOoQbinwStCBuqAnmKaN3VV0kXRRgWwAmysnLlzmUaurTT6qvBBe5LqGAopZ5eYZUhsN823lkIieYHCh/jf7zTrVDwg40lVeQF50X/Jd5Jo5Ie9SMXM+kCiw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen/dt: reject "xen,static-mem" when CONFIG_STATIC_MEMORY
 is disabled
Thread-Topic: [PATCH] xen/dt: reject "xen,static-mem" when
 CONFIG_STATIC_MEMORY is disabled
Thread-Index: AQHdJNOUeuyw7dxJRkGaYTQIrzZGNraPZFaA
Date: Wed, 5 Aug 2026 12:36:21 +0000
Message-ID: <040DF1FA-14D5-466D-8139-22FA3B6C86B0@arm.com>
References: <20260805121124.150017-1-michal.orzel@amd.com>
In-Reply-To: <20260805121124.150017-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|GVXPR08MB11541:EE_|AM4PEPF00027A6A:EE_|DU2PR08MB10201:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f4b0ada-5b17-4f34-6035-08def2ee3ba6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|11063799006|56012099006|38070700021|10067099003;
X-Microsoft-Antispam-Message-Info-Original:
 TIDFX+z3m/b3vYTYKbaDpb136eYYyyyDqMHD0OkijxVkBFEj+v1y51ZisliATH/N8HKniy2hutSvqn6+dqOUXXYyekjWLWil1X4QOujQqbmPYK272ygGsxb8V8rxWHUk+49lKiAvkNzpo5ltHuWP7OD8DjvOh6f5RBmpNgNsNuQWoTi+Cw/VRoqL6ckytZ4o2UHQDP4XlZcyOzptmr6hEBd3aNxS0v8QQlSmdpZzrQkqBJrRE+cgNbT8+9yr4MiYb23glOaN+oZXrpqYKfelwThA3gffohZDPi7mIJ942+qpiPcbxuXo9ZKKQdAQ0EacN/94w7k99DAawTv6w1oHwLYeq6yzVrttlSUZRdacZ1xWEva3hhqtUZ5NYZnCufeQtxGwxI3XcxB9uR3/XLExxvbfEtFPo6bDYpL4CZL4Axvfqd10l8HvvEifFd5Qw73AKcsDQ4oT5DULhSomaJewN1D1+JCVeXWM7c+sGxKp/0f8ezqNwuFzV6UlejKHTBhGladUJr/fSSRA8kvLdbMyBT70sjFhuWGcJu7BgwfVvNkCVoQLGm5pcNay1Ttk0c/6Gn6P10kqJhJDwAeROYrY+LnBnNirp2uBkS4EAOkCCTtorQfvoeNrljX4SPfsOQGh/TENlRBqIEwsVcDLJlGm+RgiI7AFq372iwrA8+4EL2YrIdPiUkUEdOyn6PaBs7LeryIP55QojnIHVdhOWGYt7Vmzux6Hv7M+/JZW3w7wonI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(38070700021)(10067099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EA34F65E996E7347A6833BC1BC22881A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 X7PtPt1MGD9At8nACIU2GidkG9yTyUQFdU/Zb2z5p6Ufu6sUFAlWwwmD47wrW3+i4MRR1ldhW2wcUcwHcR4s+pNttJxTs/k+VQ2PAlCQK86lwOy3Yd6Nchu/Ea3blYSwk5PPbs8grHIpS/5lMBZciWm49+dRP+BBPOMcQXpJGvGf0Bjwd+E17TFx3eIVHgUlStcmvOnjDVI5gSbw+4ahAJD9zTLoODY2WxbnSjPRYIxOOmrW7+KoEdH8G/yHNCW3RC1e6eppMq7UiDLIYJdAYe6UFhni4O2eRRMef4OAManr8WASG9Am3Bq49q2D5bgEpuG1B9B+FyBqiVnDFYjnRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11541
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A6A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1bf17a0c-c981-452a-a2e1-08def2ee27ce
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|376014|82310400026|1800799024|23010399003|36860700016|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0GkIquKFzGmVa1D95dnUQVCCOinErv/ewQ5JM+bpUqO/UbhVujyh57uwgAlX3xLCBPaMBNlrpS+7SLXAvOFCX7chacZCP2OTSKkWIWcDD9xPCyS3qwgu6UIPtpIJTv1R/DIE/hx4zi884My30bDLrcZuur6vjNGPdJ1NFXALQpv7vRMco3lv2p9zIfwXv3qopHYtogRCwyBVwvZCeGqHIcBahg5pPMxuyQsSL2idC10HYMhUTuSnmb95Wyzw5QCmpj8e1sxPYLNf5QxQWKQE+aKmpTyY55NdPe0/dEDmFOmSTiuU5HENOYfQ9Eh9x6OUvWgiIA8WPWeQpuO4qyLNZ9Nymtx1eTKu00zkb6trdNRMRzG2BWKeMe2QGjhGhH5AazOkRVBP5ycRpoI+Xm3BkV1rSnJij8tFR02FFtRrMzDW7TCFZ9TFB4vizAULTcvPz80EcNlRRqvvpswVU9UKQlFyBPQVX1nTS7cY2T5SR4g9EtVsQk8nnXQtZTIy6uAa9mf5xM9EH7cH0vzCwo8gBzyoRDuwu21hIHr8VLT9ybL6XknUYawM20GXKIGHedE0I91KvdeJQO7GU8CvgdGV+U5ysbHuXFzAcIjCf5XCtWlXOZ5Nim6uAMXn9C6+Aw9jnw+0cpmi3bL1B5VenNx6aG/TN3TWEZowGPLFYM8iAywWv7x+YnDX7OmOg5jFGPksGMlHWmV4XdEi0DdFYYByBg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(376014)(82310400026)(1800799024)(23010399003)(36860700016)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2gPPcS+PgzxDd33T6BblDXVf5jxfhhE7qWGi7YSKuIbVwINACQu2ho4GolwwmuZt8Qp8QkbjYsFj6yU1K3vYx71wJkZ+NaF4d+sI9E7EfGdhDEeP+yyQnXnq8H4idD5VfpAGbji+Ui5NXarv6iI+Zb1aDs8pkxdibgsuo0uDCfxqZdJT0oSTNrlCCjO6aZoHOJLLqksgV13BabrS3HG2XDnpsJ6EvUMkpih8expzDtnn6E7r9TvUdBL6pCd0ph38L7pQjX6fQufWmZG/XRJ03gRnom2TgG/pbGOxsFBUESEplpRjOMnfI4rw1wHH9KFs+3B3UgiRh+oGcu9fMIYsqP7ABEYm/KFMU0ymtuFKu9B5Bcltm3/WN52pIzEpvyyU9jln00V+l19OifCfgc8EJpfHbkIYNN9VLDkB3ozn6Hs74HfaBdA5b92KKX4jglaH
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:36:54.9175
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f4b0ada-5b17-4f34-6035-08def2ee3ba6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A6A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10201
X-purgate-ID: tlsNG-4011c0/1785933425-50ACCCFC-51586234/0/0
X-purgate-type: clean
X-purgate-size: 1749

Hi Michal,

> On 5 Aug 2026, at 14:11, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> process_domain_node() parses "xen,static-mem" regardless of
> CONFIG_STATIC_MEMORY. With the feature off, init_staticmem_pages() is a
> no-op stub, so boot carries on until construct_domU() reaches the
> ASSERT_UNREACHABLE() stubs of allocate_static_memory() /
> assign_static_memory_11(): a debug build trips the assertion, a productio=
n
> build gives the domain no memory at all.
>=20
> Bail out at parse time instead, like process_shm_node() already does for
> CONFIG_STATIC_SHM.
>=20
> Fixes: 41c031ff437b ("xen/arm: introduce domain on Static Allocation")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/common/device-tree/bootinfo-fdt.c | 6 ++++++
> 1 file changed, 6 insertions(+)
>=20
> diff --git a/xen/common/device-tree/bootinfo-fdt.c b/xen/common/device-tr=
ee/bootinfo-fdt.c
> index 272b5a6c0ae6..ca64daf4cdc8 100644
> --- a/xen/common/device-tree/bootinfo-fdt.c
> +++ b/xen/common/device-tree/bootinfo-fdt.c
> @@ -349,6 +349,12 @@ static int __init process_domain_node(const void *fd=
t, int node,
>         /* No "xen,static-mem" present. */
>         return 0;
>=20
> +    if ( !IS_ENABLED(CONFIG_STATIC_MEMORY) )
> +    {
> +        printk("CONFIG_STATIC_MEMORY must be enabled for parsing xen,sta=
tic-mem\n");
> +        return -EINVAL;
> +    }
> +
>     return device_tree_get_meminfo(fdt, node, "xen,static-mem", address_c=
ells,
>                                    size_cells, bootinfo_get_reserved_mem(=
),
>                                    MEMBANK_STATIC_DOMAIN);
> --=20
> 2.43.0
>=20


