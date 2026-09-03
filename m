Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EC9C61DD3
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 12:17:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407084.1640227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x26Nl-0007Il-OW; Thu, 03 Sep 2026 12:17:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407084.1640227; Thu, 03 Sep 2026 12:17:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x26Nl-0007Ie-Lm; Thu, 03 Sep 2026 12:17:29 +0000
Received: by outflank-mailman (input) for mailman id 1407084;
 Thu, 03 Sep 2026 12:17:27 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1x26Nj-0007IU-Ku
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 12:17:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x26Ni-007NE7-Ol
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 14:17:26 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a99653c-8faa-0a2a0a5109dd-0a2a4506e008-38
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 14:17:26 +0200
Received: from [52.101.84.41]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a996556-195a-0a2a45060019-34655429737a-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 14:17:26 +0200
Received: from DU2PR04CA0156.eurprd04.prod.outlook.com (2603:10a6:10:2b0::11)
 by PAWPR08MB10238.eurprd08.prod.outlook.com (2603:10a6:102:365::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 12:17:17 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:2b0:cafe::5f) by DU2PR04CA0156.outlook.office365.com
 (2603:10a6:10:2b0::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Thu, 3
 Sep 2026 12:17:17 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Thu, 3 Sep 2026 12:17:17 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by VI3PR08MB503919.eurprd08.prod.outlook.com (2603:10a6:800:374::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 3 Sep
 2026 12:16:43 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%6]) with mapi id 15.21.0382.007; Thu, 3 Sep 2026
 12:16:43 +0000
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
 b=B131Em2Q/20YS852OiAxwcLEBD1X/aqqFEZ5flcbTCgE5yWZ1pl/YKHjT0dheTWgvOqMIE5I/HaCtK6AgBWOVvxqFDAQ7SyM2DxMRbskSspsgWPp9fTkORUiMh1+wpgv1PmMEx/OS+DG2c/JcBXGZZs+DVDGUFVPLQlGm523cisCxoJwSD+3T3ljPL/0LKkjJSVSxb8/nmau3CNKWE4kWJZQFW79KK10RBCTzbjRLfnVYku+ck7p0JrZqr62i0eouHhG8z4v3cN1JUVvkReEopfsXsm91fbbmruK6yuYek0Y32GGhfWRob2+vY/RcVXVwVHcXFFlIlnJQWE/HR8aaA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=almdTduugfhJxPUhUsAMBuCWjKuuztE0KCai7PylSxI=;
 b=H0nG+cqiqonuzsbrvtCgA1Uc8/bHFr4IRo3RahTmgLXcbvnAZbp0jS1kDvUNDZJNu4TITRpGs1af0iQs0Gt5bauVHtcraGdv7sBwYfT9+t8GqiGJDC+utanaicpc94iuiRAgiqJWYtXAUhYC7nTNyNiNcXNLldTjf9OrcJAFFwUOwUCsDC81Zwi5Y4T8rkpdZ0ha57u0aUCYq6YshguF+EHuGqiDx0d70RMYgMkkcNqCAHQSmT8GB5miatXEVUcnCaUIuTlnSv3z8NflZMtVRSW91OxrBPBwaFdYl/e1HU/3gnUaxI8A0PM/0rKHnQavu1/B7utAbHcJSU2orHAA/g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=almdTduugfhJxPUhUsAMBuCWjKuuztE0KCai7PylSxI=;
 b=gAsNGRj4R3Qafa9Z+LDr7YHTOOIx1TMXOyhGcOJ4tLjtVs+wOOwshmBZLHq1M4Mb3vgkM6/cTZ/9xZI4H24Y7XbpbOiQi7OnoH3rvC+FBen7SsNKVF6UgnV/KhBDCv0oIEbGIb0Ku7wcz13WKUzq1ehqxUZBzjzxqw5c7x5SlHY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JAllUQ0tprERnA2uOXwj+y2w4DnTSlHJRyYytwqjL52kxy3zOWuIvAe2ahgKiwKBNl4kizbJ/WHDVA4Nd/q4kQZsCcKf6U2tvIEqYL3YR65WO61QZJTeFKb4OIXVAJr+FHKftNEzYeMjDaoYm4fDX+Js+kAo04IsUVXjKASVF3jIL56GIpOIH8xu3wjhBVud+R+q8C21sOyzRrMbzMZ6gFAcuzJ0ZvWVoifn+9hI3l2zB/ilhAqc1XJ2zOSYfBEHCZBrh/0XIwtSer+yG8L5PbnZA1vSfrGoyWDRWefTjmezb6byWujpRNByeTuCjqmdf0Yjxf/FyR5vnqkOGox//A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=almdTduugfhJxPUhUsAMBuCWjKuuztE0KCai7PylSxI=;
 b=u7x6S9JixaR6copODYPmDsHcfnOpYzi1RPC7PdM2nOXFSYZsw11bXSEZ3zLqY0JIb3nldVjxOTySmTdm5s1MQd3LfuGHkt0XzODlfCslkizbs6jTkaT8FT27XW9ROQxXgZpZhp8GCagp/2bbyTcMq0TwNOfdFk7MflkuqErHYFszqTztHejV7tbz/VaZPgWScyfPSbkxftRvK1tUWsL8OqaA4gfwpJIYAjSFpef6e4UFxzsspLmoJsSAOtsv0tVT/d89lcBp+MVpvyMmwlRD3LDxKAh+pzvkcdgSB5TNjrzh5nUlqSRNJIjmPoE69HhdoOwjB1/b36zTh5dueaPOHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=almdTduugfhJxPUhUsAMBuCWjKuuztE0KCai7PylSxI=;
 b=gAsNGRj4R3Qafa9Z+LDr7YHTOOIx1TMXOyhGcOJ4tLjtVs+wOOwshmBZLHq1M4Mb3vgkM6/cTZ/9xZI4H24Y7XbpbOiQi7OnoH3rvC+FBen7SsNKVF6UgnV/KhBDCv0oIEbGIb0Ku7wcz13WKUzq1ehqxUZBzjzxqw5c7x5SlHY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Michal Orzel <michal.orzel@amd.com>, Jan
 Setje-Eilers <Jan.SetjeEilers@oracle.com>
Subject: Re: [PATCH 4/6] xen/arm: Rewrite arm_smccc_smc() for arm64
Thread-Topic: [PATCH 4/6] xen/arm: Rewrite arm_smccc_smc() for arm64
Thread-Index: AQHdOUMQZh82tXnNpUyZDf50Fke+A7a8yZeA
Date: Thu, 3 Sep 2026 12:16:43 +0000
Message-ID: <D043ADF5-504C-42B6-BFD9-4438469858A3@arm.com>
References: <20260831121944.2908139-1-andrew.cooper3@citrix.com>
 <20260831121944.2908139-5-andrew.cooper3@citrix.com>
In-Reply-To: <20260831121944.2908139-5-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|VI3PR08MB503919:EE_|DB1PEPF00050A00:EE_|PAWPR08MB10238:EE_
X-MS-Office365-Filtering-Correlation-Id: 57b68ae3-c412-4713-136f-08df09b54bcf
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|10067099003|3023799007|22082099003|18002099003|56012099006|4143699003|11063799006|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 eepBfxcGTqoiUvMPlg79uoS84YWsK+cD0kkd38Cutkw/i6jCVvuO2yk8YPFL/eGL/2w2Xf4CjLT1Rxq4eoPsQuUbmTdJVcrjI8qrTMPtJQ+msuyNZYYeKWNUhfFcokEh6mYQVxxI07XsDLYWelUIc4vAVJlhihNqnJm9oDjwegAlUYFpWIwZKQJR43zrfhnSvDDl3aa8Rj9dT+2MDlCJhGoiTVHMnJidFmkFqg+aHDUaHf4WXyhGa59lGhoc3TAjBNDDDAHGw1wxTsEBS87q96sCOQcoy+Acd9qyaxJxNakQC3137bdH0vsq4dJALl83BrRcJki5aQQvCUSn9VvBohhVjp2dN+LatsktqQj6UewMohFszXIGbICuBLjKrjUM7uLeCYB8DEoPETUddiC4QnREjKfrl2Q83VR13AovqwcvlYzLJWfKFWLiancd99NU17bgi8gWoKo3kVU2SVjlIKZxyKbrE8uRsqrpiPq3oLIahhA7nR6OVsFxBF1yvvyTasoqpwENlptTEo0FV22nr/DklAp1zESZDMEz0ewSBGz+zh/rgYNIVJSSTvtUodUeVcjSAvWVt2B7rQuIkZvPnnQpjiLWAf+LuXgvL7oOq+vMWWV6BebjjsVZnvY5gyvsyY1B4y2AvQxyCS5rwYKCv9DFs2/LVh4IeB1crUw/eIvcyPWO9BAKx/ODay5yyxJUuKKRN5W/1rMB1KYPBTyyNLfAziCkeFjXlICjf/qbsOY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(3023799007)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1A8FD8E2C3248948A60C4CD3FECCB6A9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 BdgqUmpwEibNgQAb9xHTTUwOGOuX/k+zJ5gLvTncjtYE15JgYgtRe0GotXTVGYej7ppDy98fZcyv5qvkanRRTVah5FJivNjDYYXdpiLjkoZ4CKUCN5h+/IFWQfWMbCYOJY7toXtI0hgHaBXeigP/skeNExTZb+yvM9taQpr8WAgd2xRiY280cxmjD40pybLRdNG2BPUZFecXKuvfqpo8+Li5Le2y2rJb7h5Z145nDKMEmq0n31EurnpVZc9rLXp6EaTtL+U/0n6R5SEVTrWEiObj7gW9aRZiYhaRgsYFdmWY1kwpLWI8968cn2O5D5uEJqOMDoGnEjoBtR3q36nNBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI3PR08MB503919
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	327f6cf8-ce72-4639-77e9-08df09b537a4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|23010399003|1800799024|35042699022|82310400026|36860700016|376014|22082099003|18002099003|11063799006|56012099006|3023799007|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	WVXdvqWVlBFg0juuiuSLRnuY/w99HoL5X4CUhUDKHeX7t1iILVmhkClyKkKPs4AiDcW5GAuCf7IB6d5gMAOHErGhd0pZDdU9fSaVP1XuNtabajnc7zvR7d9uA9z8SFrPw+myFWFqVfz3Rz7uKRXhEqhCWoBRLPdHKpFLFvVcO+RJFwOUVwcY6GVivP34ssLPlV7FXQWQbZeElw5QpkVfaxW2LZQwPNMpPmrV/q5aVgUGKa7QysIUdVLBf6PB263rJG4VFJrTKhwhj6Mzmjeo9rnzfk++c3AzJNSUltN+oBGUzV7U03H6d0NXGxDmzlSTGu8+Ajpd2TyTs/6W29JkiMd3jGO5X/WF4/TN1V0+73jgAGM0NvbOUgeAKcrl06CI63PhrY29QOGQO7cCblusphFm0WZ83ICoqaYVS4qsN0s2FmMo46X5IIp2SzFZ8G7m+O+ReX/e4EvwPYr96A2JljXWF1aqjrmlc+D5fzLuTkZneoddrZDNXLSEO48LKE+W3UXx1giVUBYvtsBTkGK2lVTiHDttrMls7qRpphUSERJbnntGUr3ZAnPMizadiUggbAwdInmOYZlJ5gPWVlZl7c2rWCvbhlUICPTtd2fwfzg9prklrYV8aVOi671vvYtia8DI5PNvlXJLfgkhNUg/6uUODO3Pf23NBtzKkzfXDpg=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(23010399003)(1800799024)(35042699022)(82310400026)(36860700016)(376014)(22082099003)(18002099003)(11063799006)(56012099006)(3023799007)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nLRWohvkHqpsRiVEzxoI54ZyeARfzGkrbNYdtPhYtzBBWYhHgAmLmgij5m2GlOJp95MnLtUWDNDpSpEPZdth/5zeFwIG3YdSYnWEv2EpIaE9RIYLH5AtBSS6Dgx/Rjs2ZO3vv43vDb1rauFP7ShhWgxYyiuSwd3qLT342rkDnYVITWWMnVMSkPItWvs7ERYbURXk1dU5EbmueoLnHMqpN2PyRrcaUKyw+JnRE5ChgV2udpfrOfuvhs16eLuWQ0bGrjoReF7zou+0wG2Iwb5rbzwegC7Yi9nBv6zY7EPMq1fcs8BU2FHwGveXXxT2NabeP7VZ0kloUvtKNtOset+0L0rXyfXQG7vlAk3N7PGN16UxRexoSaxH5ky1amK7nbPs8qgi7tcUExX8sKyEaQCs22qJ+R0N6LHq20mgI0fzOjDrChLTuB3lg7jW9P3nCmYW
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 12:17:17.4417
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57b68ae3-c412-4713-136f-08df09b54bcf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10238
X-purgate-ID: tlsNG-16d1c6/1788437846-1F8CB77B-6FAF18F5/0/0
X-purgate-type: clean
X-purgate-size: 11088

Hi Andrew,

> On 31 Aug 2026, at 14:19, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>=20
> PSCI v1.0 says that x4 thru x17 may be clobbered.  PSCI v1.1 says they ar=
e
> strictly preserved unless they contain return values.

I think the PSCI reference here and in the rest of the commit message and t=
he patch
should not be used and should be SMCCC references instead (which would also=
 be
more coherent with the fact that this code is not PSCI but SMCCC and is use=
d by=20
others than PSCI).

PSCI does not define the preservation rules, this is defined in SMCCC spec =
and we
have a way to detect the SMCCC version.

SMCCC defines the following rules:
- 1.0: x4-x17 have an unpredictable return state.
- 1.1: x4-x17 must be preserved.
- 1.2: x4-x17 may additionally be defined as result registers, otherwise th=
ey remain preserved.

So the commit message and comments should consistently say SMCCC instead of=
 PSCI.

Other than this the code is right i think.

Cheers
Bertrand

>=20
> Xen deals with this by having __arm_smccc_1_0_smc() as an out-of-line
> function, but this causes awful code generation in arm_smccc_smc().
> cpus_have_const_cap() is opaque to the optimiser, so we end up with one b=
asic
> block doing the reasonably-ok arm_smccc_1_1_smc() code generation and a s=
econd
> basic block setting up all 8 input registers even when they're not needed=
,
> spilling or discarding x8 thru x17, and calling an out-of-line function.
>=20
> Remove __arm_smccc_1_0_smc() entirely, and rewrite arm_smccc_smc() to dec=
lare
> x4 thru x17 as clobbered.
>=20
> This fully inlines the SMC, is a single basic block which instructs the
> compiler to spill or discard the potentially clobbered registers, and onl=
y
> sets up the necessary number of arguments for the call.
>=20
> No functional change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>
>=20
> Bloat-o-meter reports:
>=20
>  add/remove: 0/1 grow/shrink: 0/10 up/down: 0/-795 (-795)
>  Function                                     old     new   delta
>  symbols_sorted_offsets                     23832   23824      -8
>  symbols_names                              42962   42943     -19
>  symbols_addresses                          35128   35104     -24
>  __arm_smccc_1_0_smc                           32       -     -32
>  call_psci_cpu_off                            144      76     -68
>  seattle_system_reset                          92      16     -76
>  seattle_system_off                            92      16     -76
>  call_psci_system_reset                       112      32     -80
>  call_psci_system_off                         112      32     -80
>  call_psci_cpu_on                             252     124    -128
>  psci_init                                    628     424    -204
>=20
> An alternative way to do this would be to have x8 thru x17 in the clobber=
 list
> rather than the output list which would reduce the source size, but this =
form
> is more amenable to having PSCI v1.2 worked into it too.
> ---
> xen/arch/arm/arm64/smc.S         | 16 ------
> xen/arch/arm/include/asm/smccc.h | 95 ++++++++++++++++----------------
> 2 files changed, 48 insertions(+), 63 deletions(-)
>=20
> diff --git a/xen/arch/arm/arm64/smc.S b/xen/arch/arm/arm64/smc.S
> index 68b05e8ddd12..65b4eabe4f87 100644
> --- a/xen/arch/arm/arm64/smc.S
> +++ b/xen/arch/arm/arm64/smc.S
> @@ -13,22 +13,6 @@
>  * GNU General Public License for more details.
>  */
>=20
> -/*
> - * void __arm_smccc_1_0_smc(register_t a0, register_t a1, register_t a2,
> - *                          register_t a3, register_t a4, register_t a5,
> - *                          register_t a6, register_t a7,
> - *                          struct arm_smccc_res *res)
> - */
> -FUNC(__arm_smccc_1_0_smc)
> -        smc     #0
> -        ldr     x4, [sp]
> -        cbz     x4, 1f          /* No need to store the result */
> -        stp     x0, x1, [x4, #SMCCC_RES_a0]
> -        stp     x2, x3, [x4, #SMCCC_RES_a2]
> -1:
> -        ret
> -END(__arm_smccc_1_0_smc)
> -
> /*
>  * void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
>  *                        struct arm_smccc_1_2_regs *res)
> diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/=
smccc.h
> index 5fe54013ac83..8920c54b09a6 100644
> --- a/xen/arch/arm/include/asm/smccc.h
> +++ b/xen/arch/arm/include/asm/smccc.h
> @@ -16,9 +16,6 @@
> #ifndef __ASM_ARM_SMCCC_H__
> #define __ASM_ARM_SMCCC_H__
>=20
> -#include <asm/alternative.h>
> -#include <asm/cpufeature.h>
> -
> #define SMCCC_VERSION_MAJOR_SHIFT            16
> #define SMCCC_VERSION_MINOR_MASK             \
>         ((1U << SMCCC_VERSION_MAJOR_SHIFT) - 1)
> @@ -57,6 +54,9 @@
> #ifndef __ASSEMBLER__
>=20
> #include <xen/macros.h>
> +#include <xen/types.h>
> +
> +#include <asm/asm_defns.h>
>=20
> extern uint32_t smccc_ver;
>=20
> @@ -160,6 +160,8 @@ struct arm_smccc_res {
> #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
> #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
>=20
> +#ifdef CONFIG_ARM_32
> +
> /*
>  * arm_smccc_1_1_smc() - make an SMCCC v1.1 compliant SMC call
>  *
> @@ -199,7 +201,6 @@ struct arm_smccc_res {
>  * The calling convention for arm32 is the same for both SMCCC v1.0 and
>  * v1.1.
>  */
> -#ifdef CONFIG_ARM_32
> #define arm_smccc_smc(...) arm_smccc_1_1_smc(__VA_ARGS__)
>=20
> /* Make an SMCCC v1.1 compliant SMC call with guest register state. */
> @@ -218,53 +219,53 @@ static inline void arm_smccc_guest_smc(struct cpu_u=
ser_regs *regs)
>=20
> #else /* CONFIG_ARM_64 */
>=20
> -void __arm_smccc_1_0_smc(register_t a0, register_t a1, register_t a2,
> -                         register_t a3, register_t a4, register_t a5,
> -                         register_t a6, register_t a7,
> -                         struct arm_smccc_res *res);
> -
> -/* Macros to handle variadic parameter for SMCCC v1.0 helper */
> -#define __arm_smccc_1_0_smc_7(a0, a1, a2, a3, a4, a5, a6, a7, res)  \
> -    __arm_smccc_1_0_smc(a0, a1, a2, a3, a4, a5, a6, a7, res)
> -
> -#define __arm_smccc_1_0_smc_6(a0, a1, a2, a3, a4, a5, a6, res)  \
> -    __arm_smccc_1_0_smc_7(a0, a1, a2, a3, a4, a5, a6, 0, res)
> -
> -#define __arm_smccc_1_0_smc_5(a0, a1, a2, a3, a4, a5, res)  \
> -    __arm_smccc_1_0_smc_6(a0, a1, a2, a3, a4, a5, 0, res)
> -
> -#define __arm_smccc_1_0_smc_4(a0, a1, a2, a3, a4, res)  \
> -    __arm_smccc_1_0_smc_5(a0, a1, a2, a3, a4, 0, res)
> -
> -#define __arm_smccc_1_0_smc_3(a0, a1, a2, a3, res)  \
> -    __arm_smccc_1_0_smc_4(a0, a1, a2, a3, 0, res)
> -
> -#define __arm_smccc_1_0_smc_2(a0, a1, a2, res)  \
> -    __arm_smccc_1_0_smc_3(a0, a1, a2, 0, res)
> -
> -#define __arm_smccc_1_0_smc_1(a0, a1, res)  \
> -    __arm_smccc_1_0_smc_2(a0, a1, 0, res)
> -
> -#define __arm_smccc_1_0_smc_0(a0, res)  \
> -    __arm_smccc_1_0_smc_1(a0, 0, res)
> -
> -#define ___arm_smccc_1_0_smc_count(count, ...)    \
> -    __arm_smccc_1_0_smc_ ## count(__VA_ARGS__)
> -
> -#define __arm_smccc_1_0_smc_count(count, ...)   \
> -    ___arm_smccc_1_0_smc_count(count, __VA_ARGS__)
> -
> -#define arm_smccc_1_0_smc(...)                                          =
    \
> -        __arm_smccc_1_0_smc_count(__count_args(__VA_ARGS__), __VA_ARGS__=
)
> -
> +/*
> + * Make an SMCCC call compatible with both PSCI v1.1 and v1.0.
> + *
> + * PSCI v1.1 says that x4 through x17 are strictly preserved unless they
> + * contain return data.  PSCI v1.0 says they clobbered.
> + *
> + * Xen doesn't make PSCI v1.1 calls which expect more than 4 return regi=
sters,
> + * so imply list x4 through x17 as clobbered.
> + */
> #define arm_smccc_smc(...)                                      \
>     do {                                                        \
> -        if ( cpus_have_const_cap(ARM_SMCCC_1_1) )               \
> -            arm_smccc_1_1_smc(__VA_ARGS__);                     \
> -        else                                                    \
> -            arm_smccc_1_0_smc(__VA_ARGS__);                     \
> +        register unsigned long r0  ASM_REG(0);                  \
> +        register unsigned long r1  ASM_REG(1);                  \
> +        register unsigned long r2  ASM_REG(2);                  \
> +        register unsigned long r3  ASM_REG(3);                  \
> +        /* Potentially clobbered in PSCI 1.0 */                 \
> +        register unsigned long c4  ASM_REG(4);                  \
> +        register unsigned long c5  ASM_REG(5);                  \
> +        register unsigned long c6  ASM_REG(6);                  \
> +        register unsigned long c7  ASM_REG(7);                  \
> +        register unsigned long c8  ASM_REG(8);                  \
> +        register unsigned long c9  ASM_REG(9);                  \
> +        register unsigned long c10 ASM_REG(10);                 \
> +        register unsigned long c11 ASM_REG(11);                 \
> +        register unsigned long c12 ASM_REG(12);                 \
> +        register unsigned long c13 ASM_REG(13);                 \
> +        register unsigned long c14 ASM_REG(14);                 \
> +        register unsigned long c15 ASM_REG(15);                 \
> +        register unsigned long c16 ASM_REG(16);                 \
> +        register unsigned long c17 ASM_REG(17);                 \
> +        __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
> +        asm volatile (                                          \
> +            "smc #0"                                            \
> +            : "=3Dr" (r0),  "=3Dr" (r1),  "=3Dr" (r2),  "=3Dr" (r3),    =
\
> +              "=3Dr" (c4),  "=3Dr" (c5),  "=3Dr" (c6),  "=3Dr" (c7),    =
\
> +              "=3Dr" (c8),  "=3Dr" (c9),  "=3Dr" (c10), "=3Dr" (c11),   =
\
> +              "=3Dr" (c12), "=3Dr" (c13), "=3Dr" (c14), "=3Dr" (c15),   =
\
> +              "=3Dr" (c16), "=3Dr" (c17)                            \
> +            : PASTE(__constraint_read_,                         \
> +                    __count_args(__VA_ARGS__))                  \
> +            : "memory" );                                       \
> +        if ( ___res )                                           \
> +            *___res =3D (struct arm_smccc_res){ r0, r1, r2, r3 }; \
>     } while ( 0 )
>=20
> +#define arm_smccc_1_1_smc(...) arm_smccc_smc(__VA_ARGS__)
> +
> /* Make an SMCCC v1.1 compliant SMC call with guest register state. */
> static inline void arm_smccc_guest_smc(struct cpu_user_regs *regs)
> {
> --=20
> 2.39.5
>=20


