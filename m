Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA1F60A2622
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 15:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=JjhdiVrZ;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=JjhdiVrZ
Received: from list by lists.xenproject.org with outflank-mailman.1482030.1685905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQnxg-0004mL-LB; Tue, 10 Nov 2026 15:40:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1482030.1685905; Tue, 10 Nov 2026 15:40:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQnxg-0004mE-I5; Tue, 10 Nov 2026 15:40:40 +0000
Received: by outflank-mailman (input) for mailman id 1482030;
 Tue, 10 Nov 2026 15:40:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1xQnxe-0004m4-RK
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 15:40:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQnxe-00BFjg-84
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 16:40:38 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6af33ad9-2eae-0a2a0a5409dd-0a2a4506b3dc-44
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 16:40:37 +0100
Received: from [52.101.66.22]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6af33af4-195a-0a2a45060019-3465421674e8-4
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 16:40:37 +0100
Received: from DU7P190CA0019.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::15)
 by DB9PR08MB9753.eurprd08.prod.outlook.com (2603:10a6:10:462::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 15:40:30 +0000
Received: from DB3PEPF00008859.eurprd02.prod.outlook.com
 (2603:10a6:10:550:cafe::10) by DU7P190CA0019.outlook.office365.com
 (2603:10a6:10:550::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 15:40:30 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF00008859.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Tue, 10 Nov 2026 15:40:30 +0000
Received: from AM6PR08MB4754.eurprd08.prod.outlook.com (2603:10a6:20b:c7::11)
 by PA6PR08MB10593.eurprd08.prod.outlook.com (2603:10a6:102:3c8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Tue, 10 Nov
 2026 15:39:56 +0000
Received: from AM6PR08MB4754.eurprd08.prod.outlook.com
 ([fe80::a011:ffac:e18d:5d83]) by AM6PR08MB4754.eurprd08.prod.outlook.com
 ([fe80::a011:ffac:e18d:5d83%3]) with mapi id 15.21.0592.009; Tue, 10 Nov 2026
 15:39:56 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Zoi0s/zwyi+mumQbwBJ+ZZqt2Uk6wRqFvJUNgyUJs3pl3wWrwmPp7TzLV+OC/l4ecCFrGamdQ4aeOQiBgM1kgI1lB6263N6rgwK0V4f8kjWG6rf9JsOND5iaXzCFLxPzGUhzcRU9LG3RdJi2viHG0bkU2ZflwxF9UaRSeHUu0+/k30TXDRzx81njE0w/neKauRFspfZ3Iyy8te//TA8xCmdNd6V98HlVSKCQYxdhEcJtOJoUwkYEJSkoRxGeliqKHHzRmN3Za94qea26nRgPVJYA+I/PNllCd3GjOsrEXRZBkwgvPsQwISctVOw7P5BHcnNFzpUP+aU12CL6bbCFfw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmNLU4ctpOzY9Mhg0h4iKTAeJxOBrg4G+LBpZOzFp+Q=;
 b=gdYP47ZObmgo8lIuyF8yT7PLK4aFTEd2JYFB2mUSK0uPGLiJLSF502k9Y5K+rvY4I8QkU+xQP4DWgqQHS20aedZsQFFWsylOJk6ks0Xewccemlj9/7rQ/xYsZtBl71lQLcL7UzJ/5tcxgOOTksUPvcY76onKabuWp27AALYvM9xwbiy5Q5aRX17T1fHX3i9bW8XGaG1C/gJkIzQZJ+EsehmH2HRBXce5pM/F8kVfxsah6LbRGWjKmD98+GnTBwLQCWUlelFoEnf0xqVz0HunMl6HF7v0fjcZdg9qhPnb7YTRZITpyGQn0nENlZ0g/zKYSaErKJlGyYvt3Wtdsz/wCA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OmNLU4ctpOzY9Mhg0h4iKTAeJxOBrg4G+LBpZOzFp+Q=;
 b=JjhdiVrZf6XlG0tRO85LKNXUEayKsGZU4G4N7dvyV44mFD5gl0EaGaTG5kLAe3cnbO78fJV703MglhG/nFKUuIc2mOdrFPDvFo4iBCLxVHhzjGuGxU0rX0cMQUMDCgbCFaKtqXG1AaFZa9M1Ynsfze1tS5y/0ak586obcMwsdpk=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QBH67lVxMyQ4nLCCMQn/oEbO2/XCwtifl0hN34cAr5jkH3dWtDTlxh1JRBy+tpBBzdz/AaE669spmE3LqrpSYbOjDSm50/DP3ChSYxMiVyK724WuHcNqcBVECTtjpTBm9TyHMOHkC+DRzjN+PNqjws+fvHszaC+pH/rCPWEsWBkMPx5qV9BRPMoNlBQmqafYpYu1DaM++iQR+I43gvtUherXBSxtIgZ2zK2a9kDBXtCWgVaugQW8zjL5zcCtt7dQln26y7Sd7fKrkycy68k/Vx26IBUSn81zJY0bQ4iSRKjKhtbRQ73DG0aqVEllxMvW2wJ6UbNvdfRKRXaPgLhIMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmNLU4ctpOzY9Mhg0h4iKTAeJxOBrg4G+LBpZOzFp+Q=;
 b=QsuLMo2n2Jbul2ZS/M6gyT6IP5/BoPdPGutpV0eHyFsNlwrcfUC/NDg+wy6EdFWuis6MlChXnIkRKWXjHE0EIqCG+D0hakbtU1pXtMZRHJDiVg/q1REOfaQs8vRMEw3PxD786FJy3IW/1q9pG9fAcM0+l3B6X8ip8mTbVfZUkQlTeURMemOrUSHRS6ygi8PfXTp8zAWuSNeXOGrQFCkqCrQPbayKKRKwx6Xw4AjvkrbOCN/s0o85f4GS+L0K0CS/3qiNuqdzAr5Df6JwPCusr1l4UAF8NcX/YrA/WPSvLjSmmHk1B5kxH6IOG58q/psDpObb8kQ9dE8BLi8G/f/OQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OmNLU4ctpOzY9Mhg0h4iKTAeJxOBrg4G+LBpZOzFp+Q=;
 b=JjhdiVrZf6XlG0tRO85LKNXUEayKsGZU4G4N7dvyV44mFD5gl0EaGaTG5kLAe3cnbO78fJV703MglhG/nFKUuIc2mOdrFPDvFo4iBCLxVHhzjGuGxU0rX0cMQUMDCgbCFaKtqXG1AaFZa9M1Ynsfze1tS5y/0ak586obcMwsdpk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykola Kvach <mykola_kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Rahul
 Singh <Rahul.Singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Pranjal Shrivastava <praan@google.com>
Subject: Re: [PATCH v13 10/14] xen/arm: smmu-v3: add suspend/resume handlers
Thread-Topic: [PATCH v13 10/14] xen/arm: smmu-v3: add suspend/resume handlers
Thread-Index: AQHdZlcNSp1ZI6z7WESbo5BBoXAja7cnhr4A
Date: Tue, 10 Nov 2026 15:39:56 +0000
Message-ID: <9F13EB77-A262-419C-8D0D-A4190056AA71@arm.com>
References: <cover.1793129971.git.mykola_kvach@epam.com>
 <6b6566eae874fcc3a92a0730f0d0e5b84f7745a1.1793129971.git.mykola_kvach@epam.com>
In-Reply-To:
 <6b6566eae874fcc3a92a0730f0d0e5b84f7745a1.1793129971.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.3)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB4754:EE_|PA6PR08MB10593:EE_|DB3PEPF00008859:EE_|DB9PR08MB9753:EE_
X-MS-Office365-Filtering-Correlation-Id: 26a4871b-edb2-4543-32fe-08df3f40f359
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|261026140227099003|261028144727099003|261021121427099003|261021123027099003|261102123227099003|261026121527099003|261021135927099003|261022075727099003|10067099003|261022105027099003|261009223027099003|3023799007|6133799003|11063799006|18002099003|22082099003|4143699003|56012099006|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 QcWuGdeBrMwpjbRNsDNdK8AnJk8BadRmc866t95O97jvh5HcPz0h9RxeSfos4nFYAIjClrKWRNwap8HY8pPLubHvvJ7m7bMTcR5NPqz64oVOiBG9v+pLx7d638VeDCQwJgdJ0ErW0L5Mbxnq5vG+aZCUnYfY1OvxXzqUwDz+ckRxjZWkPDnTHVDNdMF9xv7P5nQ1wZXU1jE6zhLqUube2xi4G+vqgzvUunHMZa6b66aXoGlSHZ9y+TZvlUvAiMjTEfkEqQBmE80YHru9i5A2v7wngusphICOjszLIXaTilkVuuyBt2tgZL52EO9M4jw0hZzjJQp/44fjum2vesIxjCl41p2RGqdSBtNj7OV5yRKGc04g3NM6EdbyiTRpL4jXtSkoi7i6/deFGC5wsvWDzDQJGhpEAQGP6++CUzIVukq6UoOgMc2N44zcd+mPVzy+lZpAKVY005b+4FGXE8jXmWmZqnWOuvGiS7FX4B+5lfF5C6ExWyiPxJEZWWc+Q/S8nXXlNJlfYNBlMfQSO7cOgRM1GYbQKo6UwX4FYdvatqj/o2ZHNS3NhI0FyRY2kuuYOla2AEM9j2+7mEGUqma0Jlg/V1KsxHtUbDKa3+YfKRRynU63U9kXnetIMjsxdN75wOq7YKhJs3kXg7wTq2XlADnafhkgBzR2I146kUNJG10=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4754.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261102123227099003)(261026121527099003)(261021135927099003)(261022075727099003)(10067099003)(261022105027099003)(261009223027099003)(3023799007)(6133799003)(11063799006)(18002099003)(22082099003)(4143699003)(56012099006)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <42D103FFD16DAB4A93A8B69DE1D49435@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 j0QBkkyko9UGTBNeUpRZ1Midz+XpS83nQr5WsYKpLZF3Ub+Xx5GoV3UACzjHliwMpBdrSKEkmG9qfDd0wIX4AImJYVn4RXXwScqgZ1L4xDuhwzuapdVtfq5URgXW8Gol1ZTUgn1fsE14mAnSqy+B+tWTdlJsjp0/grSTIG6O2t31B1IN2x4ljD9O/c6qb3qfNvG4nJdT15KwCKRH/q7a0+OvFnhoA9l30kp/vmb4wWC6vEFW8wt6Yboow7fZy/eZWj7F9nIz3fwpejMFU/P+gmVU7I/yEpv1Bd3C+C1pJwoEetiG3jxW54LA17iq+kZMt1384zsnhIE0bbMDzNeTNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10593
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3e85a174-fa10-435b-aa97-08df3f40df51
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|35042699022|376014|14060799003|23010399003|18002099003|6133799003|22082099003|10067099003|3023799007|13003099007|4143699003|11063799006|56012099006|261102123227099003|261028144727099003|261026140227099003|261022075727099003|261022105027099003|261021135927099003|261021123027099003|261021121427099003|261026121527099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	YgCXvRKmiXLEI7Jc7/MA2qe3vH9yQEd67sxX1J3h20L6nH7o1Qvc2PjLlLHbL8VubBWfnc/zLiBP3gOXCR+g/QOFamrpq0QQ7S12r6UdY5J9uAX52ym7/6QLi0vlliUBKtYSfaaEPTs7FVevCkEQ6yMx/AHyqPtOS4dvzsKq2U0XyMHSuRMf2gif3nKYzgTJOqqrPfANx0KrDLJ+52IVxuZWlBSq9Oi5YMg1QvWpNVQILcou6lv0CAQfJJjicsjp8vVHYbJcU8LfAAu7zGMwoWYWVKxKmxDbzgA9u6yzFMsgZLYeffztGiKT972ZULsGC4IkhQHdNs5sueiPbcWPKhIWAFXcJB2beAhRoW4hUD+cjGN6tRtHe2fAoOJDG/7kaSjVkaUINrmht2u/u3KBV+7xYIVxUhW+7vqWsmLKzuFtZiBU6N6xP5SZnT3MMiDL+fDaZw5h81u2iEJlotj/lIqBbaG+54o/GcX7PS0TXAlvKrzS7dafG2PTFyWMdXEOTpjcTrBK1AnejGuS6EjfiUd0wWttM0Y0HfyF/FJOWltW/ug0isZYvf1VanCUSwx7joRvUyzS5FQ8UoyEnaiJ5xynoHKE23PNVwQEmBWQl6svZjg5A9FKUu7BoMUvMRUotKExENBBBMxTMWeBizCCAnEMQxNuCYx3Y3RScBepXsU=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(35042699022)(376014)(14060799003)(23010399003)(18002099003)(6133799003)(22082099003)(10067099003)(3023799007)(13003099007)(4143699003)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261022075727099003)(261022105027099003)(261021135927099003)(261021123027099003)(261021121427099003)(261026121527099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	K1BEox5iAVc391C3023pJBo+HK12rHdoMlt2X8BXLdXyaULduy1pSCB28Vqko2gSE7H94yh3n8vQm4NrZ6pOSMbTCXfT0GvRo1oJ8nN/zO3VzHkJ+U972/gjKZBA6oCTeRq7XjYBQ4WfZM+R2WwDPoT0TVF/TFhxf8x3gIIAQmDVgZOrokWmi7JpXoknDrpOe1Vtne+VCXuAF0MrxqvjNTy50Bn5aqyoI88yQhD2OxLP10btHcyoHsPVkeAl1+A+23m44RjLmO048TilzRWRQCLDnmwLcF6KA7sP02vL3hR59S/6ahTpqblj+hAouTbHXxTJ1ghr8xqTjpxhO16cPLVnRvmas2/giVfPLWEDah/aWp8f10rOftMEmUPn30cjFXcdtryweHhE4O04K0XWXF+V5uZtV+2M+OuxtvisLh+Nq2Yfkt45hNec4kc1x5dw
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 15:40:30.1979
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26a4871b-edb2-4543-32fe-08df3f40f359
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9753
X-purgate-ID: tlsNG-16d1c6/1794325237-F4A0477B-3F5202CD/0/0
X-purgate-type: clean
X-purgate-size: 22652
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mykola,

> On 27 Oct 2026, at 22:05, Mykola Kvach <mykola_kvach@epam.com> wrote:
>=20
> Add system suspend/resume callbacks for the Arm SMMUv3 driver.
>=20
> During suspend, set GBPA.ABORT and disable the translation interface and
> EVTQ/PRIQ, while keeping CMDQ enabled. Save the queue producer indices af=
ter
> the disable acknowledgements, then issue CMD_SYNC to wait for all earlier
> commands to complete. Disable interrupt generation before stopping CMDQ,
> and handle any remaining global errors before the SMMU loses power.
>=20
> If the initial GBPA update fails, leave that SMMU enabled and restore onl=
y
> the previously suspended devices. For later failures, restore the current
> SMMU as well. Before each rollback reset, wait for EVTQ/PRIQ to stop and
> save their producer indices. This also covers a CR0ACK timeout before the
> normal suspend path has saved the indices. Failure to stop the queues or
> to reset during rollback is fatal, since the host suspend error path
> allows domains to run again. Check GBPA and CMD_SYNC errors in reset so
> an incomplete restore is not reported as successful.
>=20
> Resume uses arm_smmu_device_reset() to restore the SMMU registers and que=
ue
> indices, invalidate cached configuration and translations, and enable the
> SMMU. Schedule tasklets for unread queue entries: enabling interrupts doe=
s
> not report events that were recorded before the interrupt source was
> enabled. Prevent pending GERROR interrupts from accessing CMDQ while it i=
s
> reset.
>=20
> Probe also changes with CONFIG_SYSTEM_SUSPEND disabled. Request IRQ
> handlers only after the queues and tasklets are ready. If reset fails
> during probe, call arm_smmu_device_disable() before freeing resources,
> since queues may already be enabled. Panic if disabling fails: the SMMU
> may still access the queue memory. The GERROR guard is also compiled in,
> but is cleared before handlers are registered and stays clear after probe=
.
> Reset now returns GBPA and CMD_SYNC errors in these builds too.
>=20
> Clear MSI target addresses on both probe and resume, also without
> CONFIG_MSI. Arm IHI0070G.b, sections 6.3.21 and 6.3.30, specify that thes=
e
> addresses reset to UNKNOWN and that zero disables MSIs while allowing
> wired IRQs. The corresponding IRQ_CTRL and IRQ_CTRLACK enable bits must
> both be clear before writing these registers. Disable interrupt generatio=
n
> and wait for IRQ_CTRLACK, as described in section 6.3.16, before clearing
> the addresses.
>=20
> Xen currently does not support SMMUv3 MSI interrupts or PCI ATS/PRI. Acti=
ve
> MSI configuration restore and ATS/PRI endpoint suspend handling remain
> outside this patch.
>=20
> Link: https://lore.kernel.org/r/20260929034510.2023173-1-praan@google.com=
/
> Based-on-patch-by: Pranjal Shrivastava <praan@google.com>
> Assisted-by: Codex:GPT-6
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in V13:
> - Rename __init_or_smmu_suspend to init_or_smmu_suspend to avoid a reserv=
ed
>  macro name (MISRA Rule 21.1). No functional change.
> - Check arm_smmu_device_disable() after a probe reset failure (MISRA Rule
>  17.7). Panic if disabling fails, before freeing queue memory.
> - Adapt the relevant fixes from v11 of the Linux SMMUv3 suspend series.
> - Request IRQs after the queues and tasklets are ready, only during probe=
.
> - Disable the SMMU on probe-time reset failure before freeing resources.
> - Check GBPA and CMD_SYNC errors in reset, and make a failed rollback res=
et
>  fatal before the host suspend error path can resume domain execution.
> - Leave the current SMMU enabled if the initial GBPA update fails; restor=
e
>  only the previously suspended devices.
> - Clear MSI target addresses on probe and resume, also when using wired
>  IRQs, and document the register requirements from IHI0070G.b.
> - Save EVTQ/PRIQ producer indices after confirming that the queues have
>  stopped, both during suspend and before rollback reset. Cover a CR0ACK
>  timeout before the normal snapshot. Schedule tasklets after reset to
>  process unread entries without waiting for a new interrupt.
> - Keep GERROR handling available until interrupt generation is disabled,
>  then gate its IRQ handler before stopping CMDQ. Handle remaining global
>  errors before power-off and allow the handler again once CMDQ is restore=
d.
> - Drop Luca's Reviewed-by tag because the patch has changed.
>=20
> Changes in V11:
> - Keep arm_smmu_update_gbpa() and arm_smmu_device_reset() in init text wh=
en
>  CONFIG_SYSTEM_SUSPEND is disabled.
>=20
> Changes in V10:
> - Disable SMMU interrupt generation during suspend before disabling the
>  SMMU interface, matching the resume/reset path which re-enables IRQ_CTRL=
.
>=20
> Changes in V9:
> - Use CMD_SYNC in suspend instead of polling CMDQ_CONS, so the suspend
>  path waits for command completion rather than only command consumption.
> - Document that arm_smmu_setup_irqs() is probe-only and that future Xen
>  SMMUv3 MSI support will need to restore SMMU IRQ_CFGn registers on
>  resume.
> - Restore the reference to Pranjal's Linux runtime/system sleep series an=
d
>  clarify that MSI/ATS/PRI resume handling is outside the supported Xen
>  path.
> - Prefix the subject with xen/arm for consistency with the rest of the
>  Arm suspend/resume series.
>=20
> Changes in V8:
> - Honor ARM_SMMU_FEAT_SEV when draining the CMDQ during suspend, matching
>  the existing runtime CMD_SYNC path.
> - Fold the suspend rollback reset path into a helper and rename the error
>  reporting to describe suspend rollback rather than resume.
> - Treat SMMU reset failure during resume as fatal instead of logging and
>  continuing with a potentially unusable IOMMU.
> - cosmetic changes
> ---
> xen/drivers/passthrough/arm/smmu-v3.c | 308 +++++++++++++++++++++-----
> xen/drivers/passthrough/arm/smmu-v3.h |   1 +
> 2 files changed, 258 insertions(+), 51 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthro=
ugh/arm/smmu-v3.c
> index bf153227db..58530ef2d1 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -94,6 +94,12 @@
>=20
> #include "smmu-v3.h"
>=20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +#define init_or_smmu_suspend
> +#else
> +#define init_or_smmu_suspend __init
> +#endif
> +
> #define ARM_SMMU_VTCR_SH_IS		3
> #define ARM_SMMU_VTCR_RGN_WBWA		1
> #define ARM_SMMU_VTCR_TG0_4K		0
> @@ -903,10 +909,10 @@ static void arm_smmu_priq_tasklet(void *dev)
>=20
> static int arm_smmu_device_disable(struct arm_smmu_device *smmu);
>=20
> -static void arm_smmu_gerror_handler(int irq, void *dev)
> +/* The caller must serialize with the IRQ handler. */
> +static void arm_smmu_handle_gerror(struct arm_smmu_device *smmu)
> {
> 	u32 gerror, gerrorn, active;
> -	struct arm_smmu_device *smmu =3D dev;
>=20
> 	gerror =3D readl_relaxed(smmu->base + ARM_SMMU_GERROR);
> 	gerrorn =3D readl_relaxed(smmu->base + ARM_SMMU_GERRORN);
> @@ -948,6 +954,14 @@ static void arm_smmu_gerror_handler(int irq, void *d=
ev)
> 	writel(gerror, smmu->base + ARM_SMMU_GERRORN);
> }
>=20
> +static void arm_smmu_gerror_handler(int irq, void *dev)
> +{
> +	struct arm_smmu_device *smmu =3D dev;
> +
> +	if (!read_atomic(&smmu->gerror_blocked))
> +		arm_smmu_handle_gerror(smmu);
> +}
> +
> static void arm_smmu_combined_irq_handler(int irq, void *dev)
> {
> 	struct arm_smmu_device *smmu =3D dev;
> @@ -1814,8 +1828,8 @@ static int arm_smmu_write_reg_sync(struct arm_smmu_=
device *smmu, u32 val,
> }
>=20
> /* GBPA is "special" */
> -static int __init arm_smmu_update_gbpa(struct arm_smmu_device *smmu,
> -                                       u32 set, u32 clr)
> +static int init_or_smmu_suspend
> +arm_smmu_update_gbpa(struct arm_smmu_device *smmu, u32 set, u32 clr)
> {
> 	int ret;
> 	u32 reg, __iomem *gbpa =3D smmu->base + ARM_SMMU_GBPA;
> @@ -1836,6 +1850,20 @@ static int __init arm_smmu_update_gbpa(struct arm_=
smmu_device *smmu,
> 	return ret;
> }
>=20
> +static void arm_smmu_clear_msi_cfg(struct arm_smmu_device *smmu)
> +{
> +	/*
> +	 * IHI0070G.b, sections 6.3.21 and 6.3.30: ADDR resets to UNKNOWN.
> +	 * ADDR =3D=3D 0 disables MSIs while allowing wired IRQs. The correspon=
ding
> +	 * IRQ_CTRL and IRQ_CTRLACK enable bits must be clear before writing.
> +	 */
> +	writeq_relaxed(0, smmu->base + ARM_SMMU_GERROR_IRQ_CFG0);
> +	writeq_relaxed(0, smmu->base + ARM_SMMU_EVTQ_IRQ_CFG0);
> +
> +	if (smmu->features & ARM_SMMU_FEAT_PRI)
> +		writeq_relaxed(0, smmu->base + ARM_SMMU_PRIQ_IRQ_CFG0);
> +}
> +
> #ifdef CONFIG_MSI
> static void arm_smmu_free_msis(void *data)
> {
> @@ -1864,13 +1892,7 @@ static void arm_smmu_setup_msis(struct arm_smmu_de=
vice *smmu)
> 	int ret, nvec =3D ARM_SMMU_MAX_MSIS;
> 	struct device *dev =3D smmu->dev;
>=20
> -	/* Clear the MSI address regs */
> -	writeq_relaxed(0, smmu->base + ARM_SMMU_GERROR_IRQ_CFG0);
> -	writeq_relaxed(0, smmu->base + ARM_SMMU_EVTQ_IRQ_CFG0);
> -
> -	if (smmu->features & ARM_SMMU_FEAT_PRI)
> -		writeq_relaxed(0, smmu->base + ARM_SMMU_PRIQ_IRQ_CFG0);
> -	else
> +	if (!(smmu->features & ARM_SMMU_FEAT_PRI))
> 		nvec--;
>=20
> 	if (!(smmu->features & ARM_SMMU_FEAT_MSI))
> @@ -1911,7 +1933,8 @@ static void arm_smmu_setup_msis(struct arm_smmu_dev=
ice *smmu)
> static inline void arm_smmu_setup_msis(struct arm_smmu_device *smmu) { }
> #endif /* CONFIG_MSI */
>=20
> -static void __init arm_smmu_free_irqs(struct arm_smmu_device *smmu)
> +static void init_or_smmu_suspend
> +arm_smmu_free_irqs(struct arm_smmu_device *smmu)
> {
> 	int irq;
>=20
> @@ -1995,19 +2018,38 @@ err_free_evtq_irq:
> 	return ret;
> }
>=20
> -static int __init arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
> +static int arm_smmu_enable_irqs(struct arm_smmu_device *smmu)
> {
> -	int ret, irq;
> +	int ret;
> 	u32 irqen_flags =3D IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
>=20
> -	/* Disable IRQs first */
> -	ret =3D arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
> -				      ARM_SMMU_IRQ_CTRLACK);
> -	if (ret) {
> -		dev_err(smmu->dev, "failed to disable irqs\n");
> +	if ( smmu->features & ARM_SMMU_FEAT_PRI )
> +		irqen_flags |=3D IRQ_CTRL_PRIQ_IRQEN;
> +
> +	/* Enable interrupt generation on the SMMU */
> +	ret =3D arm_smmu_write_reg_sync(smmu, irqen_flags,
> +				      ARM_SMMU_IRQ_CTRL, ARM_SMMU_IRQ_CTRLACK);
> +	if ( ret )
> +	{
> +		dev_warn(smmu->dev, "failed to enable irqs\n");
> 		return ret;
> 	}
>=20
> +	return 0;
> +}
> +
> +static int arm_smmu_disable_irqs(struct arm_smmu_device *smmu)
> +{
> +	return arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
> +				       ARM_SMMU_IRQ_CTRLACK);
> +}
> +
> +/* Probe-time only; reset has configured the queues and disabled IRQs. *=
/
> +static int init_or_smmu_suspend
> +arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
> +{
> +	int ret, irq;
> +
> 	irq =3D smmu->combined_irq;
> 	if (irq) {
> 		/*
> @@ -2028,22 +2070,7 @@ static int __init arm_smmu_setup_irqs(struct arm_s=
mmu_device *smmu)
> 		}
> 	}
>=20
> -	if (smmu->features & ARM_SMMU_FEAT_PRI)
> -		irqen_flags |=3D IRQ_CTRL_PRIQ_IRQEN;
> -
> -	/* Enable interrupt generation on the SMMU */
> -	ret =3D arm_smmu_write_reg_sync(smmu, irqen_flags,
> -				      ARM_SMMU_IRQ_CTRL, ARM_SMMU_IRQ_CTRLACK);
> -	if (ret) {
> -		dev_warn(smmu->dev, "failed to enable irqs\n");
> -		goto err_free_irqs;
> -	}
> -
> 	return 0;
> -
> -err_free_irqs:
> -	arm_smmu_free_irqs(smmu);
> -	return ret;
> }
>=20
> static int arm_smmu_device_disable(struct arm_smmu_device *smmu)
> @@ -2057,18 +2084,31 @@ static int arm_smmu_device_disable(struct arm_smm=
u_device *smmu)
> 	return ret;
> }
>=20
> -static int __init arm_smmu_device_reset(struct arm_smmu_device *smmu)
> +static int init_or_smmu_suspend
> +arm_smmu_device_reset(struct arm_smmu_device *smmu, bool resume)
> {
> 	int ret;
> 	u32 reg, enables;
> 	struct arm_smmu_cmdq_ent cmd;
>=20
> +	ret =3D arm_smmu_disable_irqs(smmu);
> +	if (ret) {
> +		dev_err(smmu->dev, "failed to disable irqs\n");
> +		return ret;
> +	}
> +
> +	/* A pending GERROR IRQ must not access CMDQ while it is reset. */
> +	write_atomic(&smmu->gerror_blocked, true);
> +	arm_smmu_clear_msi_cfg(smmu);
> +
> 	/* Clear CR0 and sync (disables SMMU and queue processing) */
> 	reg =3D readl_relaxed(smmu->base + ARM_SMMU_CR0);
> 	if (reg & CR0_SMMUEN) {
> 		dev_warn(smmu->dev, "SMMU currently enabled! Resetting...\n");
> 		WARN_ON(!disable_bypass);
> -		arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
> +		ret =3D arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
> +		if (ret)
> +			return ret;
> 	}
>=20
> 	ret =3D arm_smmu_device_disable(smmu);
> @@ -2107,10 +2147,15 @@ static int __init arm_smmu_device_reset(struct ar=
m_smmu_device *smmu)
> 		return ret;
> 	}
>=20
> +	/* GERROR handling can use CMDQ again once its registers are restored. =
*/
> +	write_atomic(&smmu->gerror_blocked, false);
> +
> 	/* Invalidate any cached configuration */
> 	cmd.opcode =3D CMDQ_OP_CFGI_ALL;
> 	arm_smmu_cmdq_issue_cmd(smmu, &cmd);
> -	arm_smmu_cmdq_issue_sync(smmu);
> +	ret =3D arm_smmu_cmdq_issue_sync(smmu);
> +	if (ret)
> +		return ret;
>=20
> 	/* Invalidate any stale TLB entries */
> 	if (smmu->features & ARM_SMMU_FEAT_HYP) {
> @@ -2120,7 +2165,9 @@ static int __init arm_smmu_device_reset(struct arm_=
smmu_device *smmu)
>=20
> 	cmd.opcode =3D CMDQ_OP_TLBI_NSNH_ALL;
> 	arm_smmu_cmdq_issue_cmd(smmu, &cmd);
> -	arm_smmu_cmdq_issue_sync(smmu);
> +	ret =3D arm_smmu_cmdq_issue_sync(smmu);
> +	if (ret)
> +		return ret;
>=20
> 	/* Event queue */
> 	writeq_relaxed(smmu->evtq.q.q_base, smmu->base + ARM_SMMU_EVTQ_BASE);
> @@ -2163,17 +2210,18 @@ static int __init arm_smmu_device_reset(struct ar=
m_smmu_device *smmu)
> 		}
> 	}
>=20
> -	ret =3D arm_smmu_setup_irqs(smmu);
> -	if (ret) {
> -		dev_err(smmu->dev, "failed to setup irqs\n");
> -		return ret;
> +	/* Register handlers only after their queues and tasklets are ready. */
> +	if (!resume) {
> +		ret =3D arm_smmu_setup_irqs(smmu);
> +		if (ret) {
> +			dev_err(smmu->dev, "failed to setup irqs\n");
> +			return ret;
> +		}
> 	}
>=20
> -	/* Initialize tasklets for threaded IRQs*/
> -	tasklet_init(&smmu->evtq_irq_tasklet, arm_smmu_evtq_tasklet, smmu);
> -	tasklet_init(&smmu->priq_irq_tasklet, arm_smmu_priq_tasklet, smmu);
> -	tasklet_init(&smmu->combined_irq_tasklet, arm_smmu_combined_irq_tasklet=
,
> -				 smmu);
> +	ret =3D arm_smmu_enable_irqs(smmu);
> +	if (ret)
> +		goto err_free_irqs;
>=20
> 	/* Enable the SMMU interface, or ensure bypass */
> 	if (disable_bypass) {
> @@ -2190,10 +2238,18 @@ static int __init arm_smmu_device_reset(struct ar=
m_smmu_device *smmu)
> 		goto err_free_irqs;
> 	}
>=20
> +	/* IHI0070G.b, section 6.3.16: re-enabling IRQs does not replay events.=
 */
> +	if (resume && !queue_empty(&smmu->evtq.q.llq))
> +		tasklet_schedule(&smmu->evtq_irq_tasklet);

Shouldn't we always schedule the EVTQ tasklet on resume?

The saved indices may indicate an empty queue even if an event arrived
after EVTQ was enabled but before its IRQ source was enabled. That event
would not generate an interrupt.

The tasklet already refreshes the producer index, so scheduling it
unconditionally would cover this case too.

Rest of the code looks ok to me.

Regards
Bertrand


> +	if (resume && (smmu->features & ARM_SMMU_FEAT_PRI) &&
> +	    !queue_empty(&smmu->priq.q.llq))
> +		tasklet_schedule(&smmu->priq_irq_tasklet);
> +
> 	return 0;
>=20
> err_free_irqs:
> -	arm_smmu_free_irqs(smmu);
> +	if (!resume)
> +		arm_smmu_free_irqs(smmu);
> 	return ret;
> }
>=20
> @@ -2558,10 +2614,21 @@ static int __init arm_smmu_device_probe(struct pl=
atform_device *pdev)
> 	if (ret)
> 		goto out_free;
>=20
> +	/* Initialize tasklets for threaded IRQs*/
> +	tasklet_init(&smmu->evtq_irq_tasklet, arm_smmu_evtq_tasklet, smmu);
> +	tasklet_init(&smmu->priq_irq_tasklet, arm_smmu_priq_tasklet, smmu);
> +	tasklet_init(&smmu->combined_irq_tasklet, arm_smmu_combined_irq_tasklet=
,
> +				smmu);
> +
> 	/* Reset the device */
> -	ret =3D arm_smmu_device_reset(smmu);
> -	if (ret)
> +	ret =3D arm_smmu_device_reset(smmu, false);
> +	if (ret) {
> +		/* Reset may have enabled queues before failing. */
> +		if (arm_smmu_device_disable(smmu))
> +			panic("SMMUv3: %s: Failed to disable during probe cleanup\n",
> +			      dev_name(smmu->dev));
> 		goto out_free;
> +	}
>=20
> 	/*
> 	 * Keep a list of all probed devices. This will be used to query
> @@ -2575,7 +2642,6 @@ static int __init arm_smmu_device_probe(struct plat=
form_device *pdev)
>=20
> 	return 0;
>=20
> -
> out_free:
> 	arm_smmu_free_structures(smmu);
> 	if (smmu->page1)
> @@ -2855,6 +2921,142 @@ static void arm_smmu_iommu_xen_domain_teardown(st=
ruct domain *d)
> 	xfree(xen_domain);
> }
>=20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +static void arm_smmu_save_queue_producers(struct arm_smmu_device *smmu)
> +{
> +	/*
> +	 * IHI0070G.b, sections 6.3.9.4 and 6.3.9.5: EVTQ/PRIQ disable
> +	 * acknowledgements make committed entries visible. The caller must
> +	 * wait for these acknowledgements before reading the producer indices.
> +	 */
> +	if (queue_sync_prod_in(&smmu->evtq.q) =3D=3D -EOVERFLOW)
> +		dev_warn(smmu->dev, "EVTQ overflow detected during suspend\n");
> +	if ((smmu->features & ARM_SMMU_FEAT_PRI) &&
> +	    queue_sync_prod_in(&smmu->priq.q) =3D=3D -EOVERFLOW)
> +		dev_warn(smmu->dev, "PRIQ overflow detected during suspend\n");
> +}
> +
> +static void arm_smmu_reset_for_suspend_rollback(struct arm_smmu_device *=
smmu)
> +{
> +	int ret;
> +	u32 reg;
> +
> +	/*
> +	 * The queues have been requested to stop, but a CR0ACK timeout may
> +	 * have skipped saving their producer indices. Wait for the queue
> +	 * disable acknowledgements before reset overwrites those indices.
> +	 */
> +	ret =3D readl_relaxed_poll_timeout(smmu->base + ARM_SMMU_CR0ACK, reg,
> +					 !(reg & (CR0_EVTQEN | CR0_PRIQEN)),
> +					 1, ARM_SMMU_POLL_TIMEOUT_US);
> +	if (ret)
> +		panic("SMMUv3: %s: Queue stop timed out during rollback: %d\n",
> +		      dev_name(smmu->dev), ret);
> +
> +	arm_smmu_save_queue_producers(smmu);
> +	ret =3D arm_smmu_device_reset(smmu, true);
> +
> +	/* The host suspend error path allows domains to run again. */
> +	if ( ret )
> +		panic("SMMUv3: %s: Failed to reset during suspend rollback: %d\n",
> +		      dev_name(smmu->dev), ret);
> +}
> +
> +static int arm_smmu_suspend(void)
> +{
> +	struct arm_smmu_device *smmu;
> +	int ret =3D 0;
> +
> +	list_for_each_entry(smmu, &arm_smmu_devices, devices)
> +	{
> +		/* Abort all transactions before disable to avoid spurious bypass */
> +		ret =3D arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
> +		if ( ret )
> +			goto rollback_previous;
> +
> +		/* Disable the SMMU via CR0.EN and all queues except CMDQ */
> +		ret =3D arm_smmu_write_reg_sync(smmu, CR0_CMDQEN, ARM_SMMU_CR0,
> +					ARM_SMMU_CR0ACK);
> +		if ( ret )
> +		{
> +			dev_err(smmu->dev, "Timed-out while disabling smmu\n");
> +			goto fail;
> +		}
> +
> +		arm_smmu_save_queue_producers(smmu);
> +
> +		/*
> +		 * At this point the translation interface is disabled and the
> +		 * SMMU won't access translation/config structures, even
> +		 * speculatively, as per the IHI0070 spec (section 6.3.9.6).
> +		 * CMDQ is still enabled so that a CMD_SYNC can complete any
> +		 * previously issued commands.
> +		 */
> +
> +		/* Ensure all previously issued commands have completed. */
> +		ret =3D arm_smmu_cmdq_issue_sync(smmu);
> +		if ( ret )
> +		{
> +			dev_err(smmu->dev, "Timed-out waiting for pending commands\n");
> +			goto fail;
> +		}
> +
> +		/* Stop IRQ generation before gating the handler and disabling CMDQ. *=
/
> +		ret =3D arm_smmu_disable_irqs(smmu);
> +		if (ret) {
> +			dev_err(smmu->dev, "Timed-out while disabling SMMU irqs\n");
> +			goto fail;
> +		}
> +		write_atomic(&smmu->gerror_blocked, true);
> +
> +		/* Disable everything */
> +		ret =3D arm_smmu_device_disable(smmu);
> +		if ( ret )
> +			goto fail;
> +
> +		/* Other CPUs are offline and the IRQ handler is gated above. */
> +		arm_smmu_handle_gerror(smmu);
> +
> +		dev_dbg(smmu->dev, "Suspended smmu\n");
> +	}
> +
> +	return 0;
> +
> + fail:
> +	/* Reset the device that failed as well as any already-suspended ones. =
*/
> +	arm_smmu_reset_for_suspend_rollback(smmu);
> +
> + rollback_previous:
> +	/* An initial GBPA failure leaves this SMMU enabled: do not reset it. *=
/
> +	list_for_each_entry_continue_reverse(smmu, &arm_smmu_devices, devices)
> +		arm_smmu_reset_for_suspend_rollback(smmu);
> +
> +	return ret;
> +}
> +
> +static void arm_smmu_resume(void)
> +{
> +	int ret;
> +	struct arm_smmu_device *smmu;
> +
> +	list_for_each_entry(smmu, &arm_smmu_devices, devices)
> +	{
> +		dev_dbg(smmu->dev, "Resuming device\n");
> +
> +		/*
> +		 * The reset will re-initialize all the base addresses, queues,
> +		 * prod and cons maintained within struct arm_smmu_device as well as
> +		 * re-enable the interrupts.
> +		 */
> +		ret =3D arm_smmu_device_reset(smmu, true);
> +		if ( ret )
> +			panic("SMMUv3: %s: Failed to reset during resume: %d\n",
> +			      dev_name(smmu->dev), ret);
> +	}
> +}
> +#endif
> +
> static const struct iommu_ops arm_smmu_iommu_ops =3D {
> 	.page_sizes		=3D PAGE_SIZE_4K,
> 	.init			=3D arm_smmu_iommu_xen_domain_init,
> @@ -2867,6 +3069,10 @@ static const struct iommu_ops arm_smmu_iommu_ops =
=3D {
> 	.unmap_page		=3D arm_iommu_unmap_page,
> 	.dt_xlate		=3D arm_smmu_dt_xlate,
> 	.add_device		=3D arm_smmu_add_device,
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +	.suspend		=3D arm_smmu_suspend,
> +	.resume			=3D arm_smmu_resume,
> +#endif
> };
>=20
> static __init int arm_smmu_dt_init(struct dt_device_node *dev,
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthro=
ugh/arm/smmu-v3.h
> index ab07366294..93986886f2 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.h
> +++ b/xen/drivers/passthrough/arm/smmu-v3.h
> @@ -613,6 +613,7 @@ struct arm_smmu_device {
> 	int				combined_irq;
> 	u32				sync_nr;
> 	u8				prev_cmd_opcode;
> +	bool				gerror_blocked;
>=20
> 	unsigned long			ias; /* IPA */
> 	unsigned long			oas; /* PA */
> --=20
> 2.53.0
>=20


