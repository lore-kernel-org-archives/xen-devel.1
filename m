Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99D2606A32C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 17:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=avilRQXg;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=avilRQXg
Received: from list by lists.xenproject.org with outflank-mailman.1492925.1693168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTMXl-00031C-69; Tue, 17 Nov 2026 17:00:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492925.1693168; Tue, 17 Nov 2026 17:00:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTMXl-000315-1r; Tue, 17 Nov 2026 17:00:29 +0000
Received: by outflank-mailman (input) for mailman id 1492925;
 Tue, 17 Nov 2026 17:00:28 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1xTMXj-00030z-Vu
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 17:00:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTMXj-001ngB-CH
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 18:00:27 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6afc8824-2eae-0a2a0a5409dd-0a2a450ce1ee-16
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 18:00:26 +0100
Received: from [52.101.70.47]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6afc8826-f479-0a2a450c0019-3465462fda4b-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 18:00:23 +0100
Received: from AM9P250CA0006.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::11)
 by DB9PR08MB8481.eurprd08.prod.outlook.com (2603:10a6:10:3d7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 17:00:19 +0000
Received: from AM2PEPF00070CF2.eurprd02.prod.outlook.com
 (2603:10a6:20b:21c:cafe::6) by AM9P250CA0006.outlook.office365.com
 (2603:10a6:20b:21c::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 17:00:19 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF00070CF2.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Tue, 17 Nov 2026 17:00:19 +0000
Received: from PR2PR08MB4761.eurprd08.prod.outlook.com (2603:10a6:101:17::21)
 by DU0PR08MB7392.eurprd08.prod.outlook.com (2603:10a6:10:353::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 16:59:47 +0000
Received: from PR2PR08MB4761.eurprd08.prod.outlook.com
 ([fe80::b71f:1158:311d:f87f]) by PR2PR08MB4761.eurprd08.prod.outlook.com
 ([fe80::b71f:1158:311d:f87f%3]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 16:59:47 +0000
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
 b=aR6zMzWPBw35/EvotZMgBGAGqPDalmZx/88dMTkkE+SirYtHz9+L/EeyWlC0Zw9KEkT4BUTtW8G+TI3ZdpUidCks4i92zgm/+Vbc49tEeEkCG+NCe0mCzQvIUL9pR8DHhl0NM6fj3j1j8jx6ZtgX3IA9jxyQlUYf0fKC5Zw5UupltPlf291N6rDPIUCryroWjGkZ+zJQQy28prXSW6WGEtzuGFSPsvknv+b0Sh83nYbJK3kaJXSpuG8DSb5SZR0Fcp4cCUTa9v6KSFljBxBZoDcm/RJoIaQaRhRGLHsLNUwaWhbGHub+BSh/v7kp6G5jWbeaMTkjv3KJV5Z7yFineg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hX0TrCe1JiwXtf3oAAlHYpPWuCmQQZtoVr0I+L8xCsk=;
 b=pzVVXbVmZdcknwqPxsx+d5nIaMnUV6N7AnDwqrJ8Y7X8vvlprYtmYNdf2qFP2kvn7zB7TZEF3sGI8teJWFnX0i5YbGZ1CV2rS9fFvpSB1d1dzvrHwmpyoH8GvkDICyip0leFe9ue8jxTAhRJqmX6qa4XVqeknlFOvXxaBwgmWQzRa1ds/wm9PEuHw04Xa2aHwKZxSGVH7l1T5C3+KpnyNl8DPRk4yQ5CBrpJQc/EEatGNd68wJgV2obFMNQRADWXDItCccv/lwP1dUq3GZfGTX1n5mTrrtT/zucXYcgpPFrgyOGu8T0l3w7xuvYNJ7VZZYjNgqp2UC18wKCRJouVbg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hX0TrCe1JiwXtf3oAAlHYpPWuCmQQZtoVr0I+L8xCsk=;
 b=avilRQXg7hpjwPyFQ15YGOe54ia45I6teUcD11CgFBidl8p8ggEr/OVdt/iILvxCBjcDKi4TnQNaSOlOwlT3sU33ol7Lr2huLNrgyGXpxPfBlRq52X+mvQq6tPbe7GGzU4f63Wqs7zyS9m+5To2MPqz5YhIrr7TntgOejBlxp/E=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PN11ezlslo/khwX4Khn1hnEN7Gy4TX9gy9V2nK5qtYWh3cpGEVypwwE672GjCm6876Jfc/SuyERiqTSWUmCjR+1OA2r+Zh575MlkpY3cQf0TSN/uSjbTqVEnaCFFCbUOhE4UmrM/73OGHo5dT7Ex1oKS0j7Ya/MyagihzUUCgHlJWInClGuSRQT+pp//o4nTel0doDxL/tUn4HpTlAJ62Dz2FDt/lN0OUq/e5OdeFz4x/lMmnEmrTOiERqx1ISt7oKucFhCJ2rmyXK/4WeJPHEsHtdUAA5QhpFNql37BvPm0UYoguHzjTRazM0iCOozJjUx6V62GYgtj1j1TKDae3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hX0TrCe1JiwXtf3oAAlHYpPWuCmQQZtoVr0I+L8xCsk=;
 b=Uxq1Cv4Lv/qIk/kcZhe07jqv4ozM+pIUrC1+IEkNFbly7rE/EFLEb0201J72k2nOwHBt7/BoiQBt6Vw26z7efLeTRDXrx8N9VO6HUC1pFqrT9VsL+0DJB9F9tO9cBanvrBeIuv7wplsJf/6W/OqGZqHkDai6eldUzxRxec/wgzF9b/Vi26GQZbZiLFj9r2AWLhcmxtWa5WknEEWXFcG3SsJy29Da0zkSYRuXjHIT37vmTCXVlXCteJKJEoe4tqHBSkss9R6PMt5l2qhtDRqFdaQx1xXnn2rb7GAdpOniJPvRBWY56w8Mb+Tqip6lRBBJdy/hAqcnsaovyf8IoEd4gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hX0TrCe1JiwXtf3oAAlHYpPWuCmQQZtoVr0I+L8xCsk=;
 b=avilRQXg7hpjwPyFQ15YGOe54ia45I6teUcD11CgFBidl8p8ggEr/OVdt/iILvxCBjcDKi4TnQNaSOlOwlT3sU33ol7Lr2huLNrgyGXpxPfBlRq52X+mvQq6tPbe7GGzU4f63Wqs7zyS9m+5To2MPqz5YhIrr7TntgOejBlxp/E=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykola Kvach <mykola_kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v14 11/15] xen/arm64: Keep the early UART message in the
 identity mapping
Thread-Topic: [PATCH v14 11/15] xen/arm64: Keep the early UART message in the
 identity mapping
Thread-Index: AQHddi+5/wTTfQS5BkKY3n/uTdMRW7cyfa0A
Date: Tue, 17 Nov 2026 16:59:47 +0000
Message-ID: <323DF6BC-D4CA-4B9C-8A68-5ADF3474BDFF@arm.com>
References: <cover.1794873792.git.mykola_kvach@epam.com>
 <b4f1d64bf62ecbfa0899092ccfdc43db4240559b.1794873792.git.mykola_kvach@epam.com>
In-Reply-To:
 <b4f1d64bf62ecbfa0899092ccfdc43db4240559b.1794873792.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.3)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR2PR08MB4761:EE_|DU0PR08MB7392:EE_|AM2PEPF00070CF2:EE_|DB9PR08MB8481:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c54588d-829b-4a6c-d248-08df44cc42d9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|261009223027099003|4143699003|56012099006|11063799006|261102123227099003|261021121427099003|261022075727099003|261021123027099003|38070700021|10067099003;
X-Microsoft-Antispam-Message-Info-Original:
 72Q5bLKDtnZW9uEbzlfvRwyb06R2aSLtGesSH1y1eSSGncn3MP/6Jw2i3IwukucwsnLgMXm+uPtRKrVwV6+Z+aTTpoxGRG+sHCkFnRQ5H7O3Qs0dWny3sze9jMX4s84+9SFAbWKRUC4nkAIV4GYExKzlIY03kfLdTXVZBV84K22OyEoNdwu99gncY7/A+FHgXPTkm/MxBv9/u/KXV2MnUZZIrqYCE1Tx72lZdc66/EQWeVKx1gZeVDsNY0Q+5Oh3Hzh4mEtcSlxdEScM4xjfEWo55Y9os/oiyteOE2WxX2rkBI3f7v7XdDLQx+hlnyUZbKpsU0OVVWQMrMW5yBOqwO5GxVDafsmHMbIkGaCR9yEGLM5d83Ql3tN7AV3lYCELQKIFrsz7TMKWRdEm0p0yTUeWDUzhBh3Jon8nOhMLxCxLkk38w2NfJ/rWkBrASZTuWXhdpZCSMdLOatZY/Qp1Ot1LCNyTr7p8LdLt+TrrPSlLc9KUA2bBNAvLuJeu2rM1A6Fc8/oKGKUuVN0NwTsin5NW+u7fWT4A25shqq53NeHCsLCUJ737urgOkoyaOiBldJ/L6fDliu2RHqTOYKjArkS6GKlou+YidZ0KmIC2igdja3LVbbVhSbCpC2ingHN6qiInGOJd4Rcou+aNa0041W7oo6BZfG/nYfJlXQT8IWm4mS0t4CgdQwkrZSTOUBRUvfR3SEqDw3CklGkZTvVnE7ENdtHfM4zPJ6DQpiGs9hw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR2PR08MB4761.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(261009223027099003)(4143699003)(56012099006)(11063799006)(261102123227099003)(261021121427099003)(261022075727099003)(261021123027099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6DD90EF5BBAE47499CBE57672D33325F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 IemJA5poMnVyHStRqYGNl/ImB/LJyFOdmQ3OD/nHoMbGcXFimCIczPl0fP3ur5YC3RwhMXZgmjEiA8v4ePGphyEWUmtyZtF489h9m3ORGWd6yOQneE1fXoQeQFYPbhVdl/xdFMaSPM9R+dtQleHQDQ9rsPLCcM50vgiG+IZ8hJH2tvdr2xyO86v2aix2szJbt9xpaLYo9IwHbJJjbACTnMR0lRyGsvLtKhrpfLlXyAs7EePYzp3c/XJ8ryqMRQp1Zc6cED4ADs13AIXu4ja4qdrmXkeUujLhFeIR67/n1uL7fwy1mwI2BU2PypTbL2oFenLZ7U7MVPCZ6xYsnlKbAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7392
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF00070CF2.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0605af87-0bdc-480c-2e1f-08df44cc2f91
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|23010399003|82310400026|36860700016|1800799024|35042699022|376014|22082099003|18002099003|11063799006|4143699003|56012099006|10067099003|261021121427099003|261021123027099003|261009223027099003|261022075727099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	2Atxcgqlac/lAIQAajrukqKjBt3yu64l3gZTXrqUry7jDxM9W+tMs00gf3zbRbxFUl85AFT1G7BR2pdteJ9lulcSko5stwhNnJIs8RmjANiOTyKdrqA6j8KhNymU7O5Bef73SA1gidbfKPG2nAbe3R9qtDnlc52DsOM+GEMTLqjbVPvDSxvxJe+fOH1gdIURsqDFD5isYKkL+QIwT5fPIrUlR0yX0xehq/lTlmvBSs7qYaolaotpQkqFPOXY6M9Ht0yw7YSqT31t/K/eEbg+NbvXrTFsteGgNnx3f1E4FOKIMEdMbyRtOsbim0TxBMKrR/aq7kopLPjR4S1pXMUZcP3Nipzi+e38XfIbdb0E6RRR0Shavp5P5EcRnbDG7YQnq3mkw8RqHsBHQAyTPzcT4zS4LY9EJ/HaZ0FubbsT5tZd3gYU4Vs4wHG97uUs73eOdq9xVcvDOXiN7iA8TreprXZwBdzUJme4ZQ/gzjsidyS36GMV72nT0SEFOAZsOFPRV20XwilE4kOUJIlbpsSfBWkvM1F6wJk3kT1C8th8P2gy13cVblwUkgjIhg67OL6+Ue2p5bjJDQW6d+DA1IpgFMvLfugLG/nM/N5uhIDlJEqDJ+G4NweibR7REMwGMCyDGn20OJApjRDQ/KAJa/rf2CEVqcl+VXgOFd/83kaiFwla7GEy8L/MepAUL370kqXwkowr6LjC7sPtyqFAya3pSw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(23010399003)(82310400026)(36860700016)(1800799024)(35042699022)(376014)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(10067099003)(261021121427099003)(261021123027099003)(261009223027099003)(261022075727099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nDxkJkXdQtkkDqfcIdh6CU85fxUDv5tjV1Msw1B+8sX5ZJ7VXBp9KpRXjRuqb/GFlI6aXfOjG0KU+qeAQ/tIIoOWrQJ8eKd0f1sjjbpO2SN7cPO5vlGO12xOj7QISIgbB6cDNqtThbsRNtlvD6sO5KpA/pEcfXBQ9NzybDwNfEooo7Rn4430U1aM0TVrUxUHd0Es7F7RR9v2nWp3yjLMljU119jmfiNTFzOxNzNufTCPUot4cP5yzyjTq98PcGZBj2I+mXEJp7v8pkPmaM39twjo2AnxKnj8yORydwWcpkF6GgwcPQXSjCectFI81uzJ3W6PUuGmOUNaWcDt/YDmGGx71L+ruGXFobgVarI+RswIWMUsTY/7gtZH0ALLpv1C2o+axYEtOKJn/AIqkPXvpikHqF2+V6M+CFk8/kEHB0CqmLfrfxJBWi7C8W/cRzZP
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 17:00:19.4525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c54588d-829b-4a6c-d248-08df44cc42d9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF00070CF2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8481
X-purgate-ID: tlsNG-d25034/1794934826-51538A5B-B2F1ABD3/0/0
X-purgate-type: clean
X-purgate-size: 1347
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mykola,

> On 17 Nov 2026, at 02:05, Mykola Kvach <mykola_kvach@epam.com> wrote:
>=20
> init_uart() uses PRINT(), which places the UART message in .rodata.str.
> This works during boot, before cache coloring relocates Xen.
>=20
> The upcoming SYSTEM_SUSPEND resume path will also call init_uart() with
> the MMU disabled. With cache coloring, Xen is no longer physically
> contiguous, so the PC-relative address used by PRINT() may not point to
> the string's physical location.
>=20
> Use PRINT_ID() to keep the message in .rodata.idmap, alongside the code
> that needs it before enabling the MMU.
>=20
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes in v14:
> - New patch.
> ---
> xen/arch/arm/arm64/head.S | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 7d1e205353..f523427d48 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -447,7 +447,7 @@ FUNC_LOCAL(init_uart)
> #ifdef CONFIG_EARLY_UART_INIT
>         early_uart_init x23, 0
> #endif
> -        PRINT("- UART enabled -\r\n")
> +        PRINT_ID("- UART enabled -\r\n")
>         ret
> END(init_uart)
>=20
> --=20
> 2.53.0


