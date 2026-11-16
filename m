Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B87B60A2609
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 13:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=NxmeOHku;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=NxmeOHku
Received: from list by lists.xenproject.org with outflank-mailman.1490964.1691890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSx9q-0003eq-1Y; Mon, 16 Nov 2026 13:54:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490964.1691890; Mon, 16 Nov 2026 13:54:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSx9p-0003ej-Tb; Mon, 16 Nov 2026 13:54:05 +0000
Received: by outflank-mailman (input) for mailman id 1490964;
 Mon, 16 Nov 2026 13:54:04 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1xSx9n-0003ed-N9
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 13:54:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSx9k-000ui9-M0
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 14:54:00 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6afb0af0-bab6-0a2a0a5309dd-0a2a4507db14-26
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 14:54:00 +0100
Received: from [52.101.84.27]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6afb0af6-b4ea-0a2a45070019-3465541b67e9-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 14:53:59 +0100
Received: from PA7P264CA0147.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:377::7)
 by GV1PR08MB8012.eurprd08.prod.outlook.com (2603:10a6:150:98::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 13:53:49 +0000
Received: from MAD0EPF000008C4.eurprd05.prod.outlook.com
 (2603:10a6:102:377:cafe::1a) by PA7P264CA0147.outlook.office365.com
 (2603:10a6:102:377::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 13:53:49 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MAD0EPF000008C4.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Mon, 16 Nov 2026 13:53:48 +0000
Received: from AM6PR08MB4754.eurprd08.prod.outlook.com (2603:10a6:20b:c7::11)
 by AS2PR08MB8363.eurprd08.prod.outlook.com (2603:10a6:20b:546::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 13:53:14 +0000
Received: from AM6PR08MB4754.eurprd08.prod.outlook.com
 ([fe80::a011:ffac:e18d:5d83]) by AM6PR08MB4754.eurprd08.prod.outlook.com
 ([fe80::a011:ffac:e18d:5d83%3]) with mapi id 15.21.0615.009; Mon, 16 Nov 2026
 13:53:14 +0000
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
 b=wMxsujI0yftxDOFd2VGEE6YqLeGr+Mlfs/Grpiw/wh5sG2dQGoEEb7/USMtEB7d1H45Vv7mTOmFREmbdNVLyU7EXNrhwkXv2nCn890To18eVgs+QVOAce3HGtKNVuIAY07f8vgjHCi1VmFESiMOQRw0RDlTDTMsvbAmQh5VPS9O4wLyPKBR5QtXVBKRPkJ/FxLffcEJHmvlDnMZJlDlm7kwde/e0QoFLsx5fkSlzLKVGgYO1e7DJvxelkxp+ErTvt5s80feeklSZqXSgRhVHWNokwYdkmGbynptdW6k08u+/fWRmztlikBSQtyLkofBTm3C+SqfI+68OBzeyfDSUag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpICOCTcHLa471QLIfNttpCx0NHg6ln7AeO8dQb9FVI=;
 b=kvelrI6I9qjwOwSQVwn3IGHV6PhHXcK6ycMCOO5r/CqWyEvxTI7l9A+LKbyuQ0HNXce9SAahAfHmTGLdZ2h2vrjyxXs2SdzB+mcuzK10b+9n075CbjN0K1ycUyzgQn7TD7VqhiBdXJHgLjhNetCWmjEtmLHbZnTMgUqCQkNgAi107liznWkMIYJ5bwF0wS0q7EYrRMCPbjhK1uTp022DKY3PvEcyL2oqhdyUsvjuJVpVaL40V7S+EUN9HvXDsS7aglfeZpl9/GcSks8rXravgUVD9tJuzjH/CPJz6iCi7Yhg3mOcuhhAF1zY2iqPx81z28Tsc9mhXHnMrymY0ddWMg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpICOCTcHLa471QLIfNttpCx0NHg6ln7AeO8dQb9FVI=;
 b=NxmeOHkuS1wmetnhvzAhyzjQ075AH0UTK6QvY8EDcP7/5CwY1yIUhJZvKxq4zNvIYfhmod/+xkTMnJebiCK29BlRQ9djmDDnrJfP/dgNYoglPI4Ve7xDso7VVSUQdsnwg0afBY1nAKj6gJamw933hjx/BUhnmm/zghXzl/Rcnt4=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SsQSnTui/CqIZ984C/CYOqWEgOazkks12253q05OMp7XDksqUVYOdiLvb0p715hodUnrfdeMDaiV2y7vDNfjvMbjW/fiXWThveot5Ik3z1Y2D8cA3RP1LDvjXnrPqOVCEKt38ail0yf5W9rsM/s4iBfyaT/1XrMXdjJj2sBDE/7FuszmkSQ/XvETIgs2itUOUbEZAjH0dxJkgktp0msmAkFoih1mAt3u+tmnHDC/oqArNHeB4lBlUR3zWvkpq5/jM6r7nqpyyqZm9KyIhPtbI1So07u+PO6U6BulCwZ+CqfuEM6NFWUDWv67xp0DRQ+kgcO/qxt5xIN6HE2Q7/8tZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpICOCTcHLa471QLIfNttpCx0NHg6ln7AeO8dQb9FVI=;
 b=ctRQNtw70gjyGZnJqL5z54xCy7qAQLCtYB+aHX0OqnIl1w71I5dGTq1fcphES7wxtNfBqUA2J9h8vEo/qKlAnTIo4O3qJg38n7jZtgGFXJqwwk5+GtfingWzgzP2WDIAkPCtnhs6Tmgg2yrftKHh1S9qYxYA9c5TvGQny6Gau1hh2IbZDPSx8e2AUsYf6oZmir7I2cSPT+oFZFuD76/K98m7RTwf1iaxg0UqJrviBRIlwUD0vfeMLrHOyaZ5J9tDxK34yGhGBs9sxGlt6TpKu9LhavLEAjNJ4WUqtRsL2pmQZEXodssKXVAsI94ubvHuTRWbR8sjsw5BQHVAjSV16A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpICOCTcHLa471QLIfNttpCx0NHg6ln7AeO8dQb9FVI=;
 b=NxmeOHkuS1wmetnhvzAhyzjQ075AH0UTK6QvY8EDcP7/5CwY1yIUhJZvKxq4zNvIYfhmod/+xkTMnJebiCK29BlRQ9djmDDnrJfP/dgNYoglPI4Ve7xDso7VVSUQdsnwg0afBY1nAKj6gJamw933hjx/BUhnmm/zghXzl/Rcnt4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykola Kvach <mykola_kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mirela
 Simonovic <mirela.simonovic@aggios.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Saeed
 Nowshadi <saeed.nowshadi@xilinx.com>, Mykyta Poturai
	<mykyta_poturai@epam.com>
Subject: Re: [PATCH v13 14/14] xen/arm: Add host system suspend backend
Thread-Topic: [PATCH v13 14/14] xen/arm: Add host system suspend backend
Thread-Index: AQHdZlcTYjcTUmenCEyXqyht7qaK4bcw1usA
Date: Mon, 16 Nov 2026 13:53:14 +0000
Message-ID: <33963756-7324-42BC-9A3D-38C42716B6B1@arm.com>
References: <cover.1793129971.git.mykola_kvach@epam.com>
 <2299a3912c0491680b15d10a39ec5ec7e041a390.1793129971.git.mykola_kvach@epam.com>
In-Reply-To:
 <2299a3912c0491680b15d10a39ec5ec7e041a390.1793129971.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.3)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB4754:EE_|AS2PR08MB8363:EE_|MAD0EPF000008C4:EE_|GV1PR08MB8012:EE_
X-MS-Office365-Filtering-Correlation-Id: 351572d4-82e5-43bb-fe8b-08df43e90a17
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261026140227099003|261026121527099003|261028144727099003|261021121427099003|261021123027099003|261022075727099003|261022105027099003|261102123227099003|38070700021|4143699003|5023799004|56012099006|11063799006|10067099003|22082099003|18002099003|261009223027099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info-Original:
 FqfkBxr/N86BGlFD0JyoIuRhInCjeOM1giwrZpx12HaMgYimIlxyJdWRXvb9AsvTfUm1hnWk6rKwfM6BnWj8g1LULO8yAg9bj39tgw44VILVyhMOx1EeqcCXoJclmRzDxM7+wig2SnFf5kRWKgISQsyxizi9HbJPSKF9RiDn2NGF4gSk5I2M68EDsCOVWcqV8sWax6eDE1LeSTgeLWpRhEBGOMNENxnHKnZycqlslxB2Nv18f4oa7NV5pYXUtFaajAg7LgoCkCbO/sKI/lyRq1xjb2gAA6dF8eeUQcuNTkXkBSGlFsQCNIBdFw8vsow7X3Db0Hsp9k581cjKov3eqvx+gq/eWALEjlYvu2qzuIWZT1xFLMC8Iog281oNdo4+3B/Yq8cT7x51Oe+KyjgxttLRuhdBYQtnj2sTY2UC94SGH27rCgD0WukkvrmFBsDR1ksLiPWLNfKHA4JV2I6M8gN+I34pGnkHgznkH7l3GNLb17aEkAr51HS/4hDs3+XZjPZ2jPHeT0GVR0mCneXKWIujoIuZU/qSu51Z8cIlAPaKWlYFPpvQrrcl62nXvYxRV5fLlnkD5RThory6q3RhFcpSSX31FWXNHtMy9J3D5fIVcR4oIoD+V8SZxgw56b4IL/EeM4I8AgKNlslOxZnA6oKsuxrnGNUwplS6CHZw9J2FRNw4+xlfZX10HL1KpPgJv6IYd2QE/S4dXuEol5Cu2q5Io/3iO3KnShxuCjaHRa8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4754.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261026140227099003)(261026121527099003)(261028144727099003)(261021121427099003)(261021123027099003)(261022075727099003)(261022105027099003)(261102123227099003)(38070700021)(4143699003)(5023799004)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(261009223027099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DCF330214B251347A2AA6302486D5513@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 3HD8l+9GpgDWoDlXqw2qaa+EhuuvXAiDitdCzn/UnAS/nn/R+6jUu995xP0fsBrTiSwnqBuHnGUU/zXKBJe5lTE3rwdSmn1aqJUtPDZTOYfQYuaBezFbZ4rk6hFq2/AScEdKQLeR6DdX2R8RUvMwedFdvde9+e9t0uWE5jRf4vwSiX3nfYQSLBTXR/0/KmyEb+3Hk3YfoSgpBWbfLlyNkjqI13/Td93GRvm/hRa9VfcZgkmlnvPDipjGLWYVN2262ZeTHIAFgRKisjH8YXVQf46DM1wkrdQQkd72A7tkwYfxDk24QzGvjF+TavBKuu+E6GrrpmLpAn/RLhx1pevOkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8363
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MAD0EPF000008C4.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	419ba3fb-b703-487a-6453-08df43e8f5c7
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|376014|35042699022|23010399003|82310400026|36860700016|10067099003|11063799006|4143699003|5023799004|56012099006|261021123027099003|261021121427099003|261022075727099003|261022105027099003|261009223027099003|261028144727099003|261026121527099003|261026140227099003|261102123227099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	xjx5fXbMWB9V6DPq9t4GKw1CqcVJj7iftAlUnJKmyFSTADzhmHb9K7USPj+j0N+lEv0JC6yGlTIrtbpy1uWplrlTJZn6SKHB1LBn5XaaJkLdhWKuDMAN7drIxejA3zyJS4teJ5rNNjjyfVG55uBRmpAcLRVh6Wk0jilqJNNMIsPvALGCPUasZOzlSGjFqYTskcfSTFZqgfu9kjCfZFafajQCed0IIv1pb+KEUAg6e4sKrUvEsXwYj95pW9+I3+8Avbpn+QtO6SluC46W/vU4tBmr+gulseETuSpIVOYCB4mvcTJh0pH3Gch6gVDeCr+sraCa+G9nA5TK4mmK/hlXhx/0pw4Ejos+jFHhCbzPUJAfW5CRUd/u0YD5iWxvORfxny+F+vyyMjkv3snqm2uIw6eFoZ89rl7OpBU+rbh/b1WuNw11rVj0Fp1zhFW3BzQSjN9USjQoSEW7qB07jvtSXB0za6rWTKZ/KMPTIpV6ItiuUuyLGz+ywUSVu/V1cjUMAGKiuklLZaQIdM6seylqC7CJ9yPVZGLiJW8TLxPxNbGv5esjIcUDqXKuyxdrk+mnRsDMz9OKraNbDKuo+IHu8dHrc+Uxmnrkiczrdg2mf0qUQcRF2c0WM88MzTPAoA/0OExIIV3nCXKC12JSrilR2rMn4rZx/GqiV8N9JumY4OD/7o+ZNDToeuas34/FIdbtLlCZA0zhMtRbDv8hkGY3Zg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(376014)(35042699022)(23010399003)(82310400026)(36860700016)(10067099003)(11063799006)(4143699003)(5023799004)(56012099006)(261021123027099003)(261021121427099003)(261022075727099003)(261022105027099003)(261009223027099003)(261028144727099003)(261026121527099003)(261026140227099003)(261102123227099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mWL3OVzYCGhtPKNVf1fXzdDK8JvmyCm9z52gCYggkQYK6FYiz/VOoWIgWDgDF0uYIUhSpv4Xh+BG/Fw9nFsH3Mg64SDjsGynGRcpLUmr5k00EE0mYboIXHY2piK5KBGnUjfBpM23L8uM311T2TILQY4k5EOhls2QP/jhclnQ9XkuxWqXA7JgGwwIMYdbtZXgPZRYzX/M0F1QIRXHVyarDcF2BvmJeCdcOKF+24ZNbbSeQV1+YMwax5rAmG9+97IfGhJWCFefnYG7sLGgSTUq9BSD4AUqpcfrqPM9sQzqR0RyujuaFJZCczCJ3KWlaaRasdqEzs56gTPo2po/RjtIKIpfDCwsD2ojvda1CTa+6yyKKXdH9/BB+HA8o9vfIgpKn4XxtgL7wYROJbUHSIlO9QXvptLD10aRsA6ODNHSNbbnBFzvgMmomawP9FJlE+yy
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 13:53:48.3785
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 351572d4-82e5-43bb-fe8b-08df43e90a17
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008C4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8012
X-purgate-ID: tlsNG-ef75cf/1794837239-A4AC8AE4-C29DA9CF/0/0
X-purgate-type: clean
X-purgate-size: 15374
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mykola,

Sorry forgot to answer this one :-)

> On 27 Oct 2026, at 22:06, Mykola Kvach <mykola_kvach@epam.com> wrote:
>=20
> From: Mirela Simonovic <mirela.simonovic@aggios.com>
>=20
> Add the Xen-wide suspend/resume backend used after a control-domain
> vPSCI SYSTEM_SUSPEND request has been accepted. The vPSCI policy,
> runtime driver blockers and control-domain sequencing checks are handled
> by the preceding commit; this change adds the code that actually drives
> the host suspend attempt.
>=20
> The backend runs from a tasklet scheduled on pCPU0, because non-boot CPUs
> are disabled during suspend. It freezes domains, disables the scheduler
> and then disables non-boot CPUs.
>=20
> Host-side suspend participants are handled in phases. IOMMU and console
> state are suspended first. Local IRQs are then disabled before suspending
> timer and GIC state. On resume or failure, the completed suspend phases
> are unwound in reverse: GIC and timer state are restored while IRQs are
> still disabled, local IRQs are restored, and then console and IOMMU state
> are restored.
>=20
> On boot, init_ttbr is normally initialized during secondary CPU hotplug.
> On uniprocessor systems this can leave init_ttbr uninitialized, so set it
> from the boot CPU before entering suspend.
>=20
> Note: the code is behind CONFIG_HAS_SYSTEM_SUSPEND, which is currently
> only selected when UNSUPPORTED is set and MPU is not set.
>=20
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in V13:
> - Explicitly discard console_resume()'s return value. It always returns
>  zero in the current implementation (MISRA Rule 17.7). No functional
>  change.
> - Remove the redundant rcu_barrier() and its outdated comment before
>  enable_nonboot_cpus(). Per-CPU areas are kept during suspend, and
>  cpu_up() already waits for pending RCU callbacks before CPU_UP_PREPARE.
>=20
> Changes in V10:
> - Re-apply boot CPU local errata/workaround handling after SYSTEM_SUSPEND=
,
>  before resuming the rest of the host suspend path.
> - Move set_init_ttbr() declaration to asm/mmu/mm.h, since it is
>  MMU-specific.
>=20
> Changes in V9:
> - Split vPSCI availability policy, runtime host-suspend blockers and the
>  domain-readiness precheck into the preceding commit.
> - Trigger the host suspend backend from the control-domain SYSTEM_SUSPEND
>  path.
> - Reorder the host suspend/resume phases so the timer is suspended with
>  local IRQs disabled and local IRQs are restored after the GIC and timer
>  resume paths, before the console and IOMMU resume paths.
> - Move HAS_HWDOM_SYSTEM_SUSPEND and related logic to policy patch.
>=20
> Changes in V8:
> - Add a pre-suspend check in system_suspend() after scheduler_disable() t=
o
>  require all domains to be in the shut down state with SHUTDOWN_suspend
>  before proceeding with the global suspend flow.
> - Drop the common-level depends on !ARM_64 || !SYSTEM_SUSPEND from
>  CONFIG_HAS_HWDOM_SHUTDOWN_ON_SUSPEND and model the ARM64 suspend case
>  with an arch-selected capability instead.
> - Rename CONFIG_HAS_HWDOM_SHUTDOWN_ON_SUSPEND to
>  CONFIG_HAS_HWDOM_SYSTEM_SUSPEND.
> - Rename need_hwdom_shutdown() to want_hwdom_shutdown().
>=20
> Changes in V7:
> - Control domain is responsible for host suspend.
> - Add an empty inline host_system_suspend() function when SYSTEM_SUSPEND
>  config is disabled.
> - Use IS_ENABLED() for config checking instead of #ifdef.
> - Replace #ifdef checks in domain_shutdown() with IS_ENABLED() to simplif=
y
>  control flow.
> - Factor hardware domain shutdown condition into a helper
>  (need_hwdom_shutdown()) to avoid preprocessor directives inside the
>  function.
> - Squash with iommu suspend/resume commit.
> ---
> xen/arch/arm/Kconfig                 |   1 +
> xen/arch/arm/cpuerrata.c             |   7 +-
> xen/arch/arm/include/asm/cpuerrata.h |   1 +
> xen/arch/arm/include/asm/mmu/mm.h    |   2 +
> xen/arch/arm/include/asm/suspend.h   |   2 +
> xen/arch/arm/mmu/smpboot.c           |   2 +-
> xen/arch/arm/suspend.c               | 149 +++++++++++++++++++++++++++
> xen/arch/arm/vpsci.c                 |  10 +-
> 8 files changed, 170 insertions(+), 4 deletions(-)
>=20
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index fd5f0ddb17..c3e32fb683 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -9,6 +9,7 @@ config ARM_64
> 	select 64BIT
> 	select HAS_DOMAIN_TYPE
> 	select HAS_FAST_MULTIPLY
> +	select HAS_SYSTEM_SUSPEND if !MPU && UNSUPPORTED
> 	select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH
>=20
> config ARM
> diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
> index 35ad98d29d..5a7f127495 100644
> --- a/xen/arch/arm/cpuerrata.c
> +++ b/xen/arch/arm/cpuerrata.c
> @@ -782,6 +782,11 @@ void check_local_cpu_errata(void)
>     update_cpu_capabilities(arm_errata, "enabled workaround for");
> }
>=20
> +int enable_local_cpu_errata_workarounds(void)
> +{
> +    return enable_nonboot_cpu_caps(arm_errata);
> +}
> +
> void __init enable_errata_workarounds(void)
> {
>     enable_cpu_capabilities(arm_errata);
> @@ -818,7 +823,7 @@ static int cpu_errata_callback(struct notifier_block =
*nfb,
>          * fixed to expect an error at CPU_STARTING phase.
>          */
>         ASSERT(system_state !=3D SYS_STATE_boot);
> -        rc =3D enable_nonboot_cpu_caps(arm_errata);
> +        rc =3D enable_local_cpu_errata_workarounds();
>         break;
>     default:
>         break;
> diff --git a/xen/arch/arm/include/asm/cpuerrata.h b/xen/arch/arm/include/=
asm/cpuerrata.h
> index 1799a16d7e..b93521326f 100644
> --- a/xen/arch/arm/include/asm/cpuerrata.h
> +++ b/xen/arch/arm/include/asm/cpuerrata.h
> @@ -5,6 +5,7 @@
> #include <asm/alternative.h>
>=20
> void check_local_cpu_errata(void);
> +int enable_local_cpu_errata_workarounds(void);
> void enable_errata_workarounds(void);
>=20
> #define CHECK_WORKAROUND_HELPER(erratum, feature, arch)         \
> diff --git a/xen/arch/arm/include/asm/mmu/mm.h b/xen/arch/arm/include/asm=
/mmu/mm.h
> index 7f4d59137d..ee73a77777 100644
> --- a/xen/arch/arm/include/asm/mmu/mm.h
> +++ b/xen/arch/arm/include/asm/mmu/mm.h
> @@ -110,6 +110,8 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
> extern void switch_ttbr(uint64_t ttbr);
> extern void relocate_and_switch_ttbr(uint64_t ttbr);
>=20
> +void set_init_ttbr(lpae_t *root);
> +
> #endif /* __ARM_MMU_MM_H__ */
>=20
> /*
> diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/as=
m/suspend.h
> index 50dc6e9fdf..889a6509d9 100644
> --- a/xen/arch/arm/include/asm/suspend.h
> +++ b/xen/arch/arm/include/asm/suspend.h
> @@ -41,11 +41,13 @@ int prepare_resume_ctx(void);
> void hyp_resume(void);
> bool host_system_suspend_allowed(void);
> void host_system_suspend_disable(const char *reason);
> +void host_system_suspend(struct domain *d);
>=20
> #else /* !CONFIG_SYSTEM_SUSPEND */
>=20
> static inline bool host_system_suspend_allowed(void) { return false; }
> static inline void host_system_suspend_disable(const char *reason) {}
> +static inline void host_system_suspend(struct domain *d) {}
>=20
> #endif
>=20
> diff --git a/xen/arch/arm/mmu/smpboot.c b/xen/arch/arm/mmu/smpboot.c
> index 37e91d72b7..ff508ecf40 100644
> --- a/xen/arch/arm/mmu/smpboot.c
> +++ b/xen/arch/arm/mmu/smpboot.c
> @@ -72,7 +72,7 @@ static void clear_boot_pagetables(void)
>     clear_table(boot_third);
> }
>=20
> -static void set_init_ttbr(lpae_t *root)
> +void set_init_ttbr(lpae_t *root)
> {
>     /*
>      * init_ttbr is part of the identity mapping which is read-only. So
> diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> index c7c26bcf03..e6b7f6a6cc 100644
> --- a/xen/arch/arm/suspend.c
> +++ b/xen/arch/arm/suspend.c
> @@ -1,10 +1,18 @@
> /* SPDX-License-Identifier: GPL-2.0-only */
>=20
> +#include <asm/cpuerrata.h>
> +#include <asm/cpufeature.h>
> +#include <asm/gic.h>
> #include <asm/psci.h>
> #include <asm/suspend.h>
>=20
> +#include <xen/console.h>
> +#include <xen/cpu.h>
> +#include <xen/iommu.h>
> #include <xen/lib.h>
> +#include <xen/sched.h>
> #include <xen/serial.h>
> +#include <xen/tasklet.h>
>=20
> struct resume_cpu_context resume_cpu_context;
>=20
> @@ -44,6 +52,147 @@ void host_system_suspend_disable(const char *reason)
>            reason ? reason : "unsupported suspend/resume path");
> }
>=20
> +/* Xen suspend. data identifies the domain that initiated suspend. */
> +static void system_suspend(void *data)
> +{
> +    int status;
> +    unsigned long flags;
> +    struct domain *d =3D (struct domain *)data;
> +
> +    BUG_ON(system_state !=3D SYS_STATE_active);
> +
> +    system_state =3D SYS_STATE_suspend;
> +
> +    printk("Xen suspending...\n");
> +
> +    freeze_domains();
> +    scheduler_disable();
> +
> +    /*
> +     * Non-boot CPUs have to be disabled on suspend and enabled on resum=
e
> +     * (hotplug-based mechanism). Disabling non-boot CPUs will lead to P=
SCI
> +     * CPU_OFF to be called by each non-boot CPU. Depending on the under=
lying
> +     * platform capabilities, this may lead to the physical powering dow=
n of
> +     * CPUs.
> +     */
> +    status =3D disable_nonboot_cpus();
> +    if ( status )
> +    {
> +        system_state =3D SYS_STATE_resume;
> +        goto resume_nonboot_cpus;
> +    }
> +
> +    console_start_sync();
> +    status =3D iommu_suspend();
> +    if ( status )
> +    {
> +        system_state =3D SYS_STATE_resume;
> +        goto resume_end_sync;
> +    }
> +
> +    status =3D console_suspend();
> +    if ( status )
> +    {
> +        dprintk(XENLOG_ERR, "Failed to suspend the console, err=3D%d\n",=
 status);
> +        system_state =3D SYS_STATE_resume;
> +        goto resume_iommu;
> +    }
> +
> +    local_irq_save(flags);
> +
> +    time_suspend();
> +
> +    status =3D gic_suspend();
> +    if ( status )
> +    {
> +        system_state =3D SYS_STATE_resume;
> +        goto resume_time;
> +    }
> +
> +    set_init_ttbr(xen_pgtable);
> +
> +    /*
> +     * Enable identity mapping before entering suspend to simplify
> +     * the resume path
> +     */
> +    update_boot_mapping(true);
> +
> +    if ( prepare_resume_ctx() )
> +    {
> +        status =3D call_psci_system_suspend();
> +        /*
> +         * If suspend is finalized properly by above system suspend PSCI=
 call,
> +         * the code below in this 'if' branch will never execute. Execut=
ion
> +         * will continue from hyp_resume which is the hypervisor's resum=
e point.
> +         * In hyp_resume CPU context will be restored and since link-reg=
ister is
> +         * restored as well, it will appear to return from prepare_resum=
e_ctx.
> +         * The difference in returning from prepare_resume_ctx on system=
 suspend
> +         * versus resume is in function's return value: on suspend, the =
return
> +         * value is a non-zero value, on resume it is zero. That is why =
the
> +         * control flow will not re-enter this 'if' branch on resume.
> +         */
> +        if ( status )
> +            dprintk(XENLOG_WARNING, "PSCI system suspend failed, err=3D%=
d\n",
> +                    status);
> +
> +        system_state =3D SYS_STATE_resume;
> +    }
> +    else
> +    {
> +        system_state =3D SYS_STATE_resume;
> +
> +        /*
> +         * CPU0 resumes directly from hyp_resume(), bypassing the CPU ho=
tplug
> +         * path that re-checks and re-enables errata workarounds for sec=
ondary
> +         * CPUs.
> +         */
> +        check_local_cpu_errata();
> +        check_local_cpu_features();
> +        BUG_ON(enable_local_cpu_errata_workarounds());
> +    }
> +
> +    update_boot_mapping(false);
> +
> +    gic_resume();
> +
> + resume_time:
> +    time_resume();
> +
> +    local_irq_restore(flags);
> +
> +    (void)console_resume();
> +
> + resume_iommu:
> +    iommu_resume();
> +
> + resume_end_sync:
> +    console_end_sync();
> +
> + resume_nonboot_cpus:
> +    enable_nonboot_cpus();
> +
> +    scheduler_enable();
> +    thaw_domains();
> +
> +    system_state =3D SYS_STATE_active;
> +
> +    printk("Resume (status %d)\n", status);

This print should have at least a log level and I am also not quite sure
how useful the numerical value can be for someone here. This is the
return code of gic_suspend but the user will need to dig to have an
understanding of that and wether it is or not a problem.

Definitely we need a log level here for the rest I leave it up to you.

Cheers
Bertrand

> +
> +    domain_resume(d);
> +}
> +
> +static DECLARE_TASKLET(system_suspend_tasklet, system_suspend, NULL);
> +
> +void host_system_suspend(struct domain *d)
> +{
> +    system_suspend_tasklet.data =3D (void *)d;
> +    /*
> +     * The suspend procedure has to be finalized by the pCPU#0 (non-boot=
 pCPUs
> +     * will be disabled during the suspend).
> +     */
> +    tasklet_schedule_on_cpu(&system_suspend_tasklet, 0);
> +}
> +
> /*
>  * Local variables:
>  * mode: C
> diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> index 0131c297dd..5d4c31df1e 100644
> --- a/xen/arch/arm/vpsci.c
> +++ b/xen/arch/arm/vpsci.c
> @@ -238,7 +238,8 @@ static bool domain_in_suspend_state(struct domain *d)
>     return suspended;
> }
>=20
> -static int32_t domain_psci_system_suspend_policy(struct domain *d)
> +static int32_t domain_psci_system_suspend_policy(struct domain *d,
> +                                                 bool *host_suspend)
> {
>     struct domain *other;
>     bool last_awake_control_domain =3D true;
> @@ -305,6 +306,7 @@ static int32_t domain_psci_system_suspend_policy(stru=
ct domain *d)
>     if ( !host_system_suspend_allowed() )
>         return PSCI_DENIED;
>=20
> +    *host_suspend =3D true;
>     return 0;
> }
>=20
> @@ -315,6 +317,7 @@ static int32_t do_psci_1_0_system_suspend(register_t =
epoint, register_t cid)
>     struct vcpu *v;
>     struct domain *d =3D current->domain;
>     bool is_thumb =3D epoint & 1;
> +    bool host_suspend =3D false;
>     struct resume_info *rctx =3D &d->arch.resume_ctx;
>=20
>     /* THUMB set is not allowed with 64-bit domain */
> @@ -339,7 +342,7 @@ static int32_t do_psci_1_0_system_suspend(register_t =
epoint, register_t cid)
>=20
>     spin_lock(&vpsci_system_suspend_lock);
>=20
> -    rc =3D domain_psci_system_suspend_policy(d);
> +    rc =3D domain_psci_system_suspend_policy(d, &host_suspend);
>     if ( !rc )
>     {
>         rc =3D domain_shutdown(d, SHUTDOWN_suspend);
> @@ -364,6 +367,9 @@ static int32_t do_psci_1_0_system_suspend(register_t =
epoint, register_t cid)
>             "SYSTEM_SUSPEND requested, epoint=3D%#"PRIregister", cid=3D%#=
"PRIregister"\n",
>             epoint, cid);
>=20
> +    if ( host_suspend )
> +        host_system_suspend(d);
> +
>     return rc;
> }
>=20
> --=20
> 2.53.0
>=20


