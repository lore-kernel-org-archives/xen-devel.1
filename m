Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988CDC5DF6D
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 08:19:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394863.1633487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwbVq-0003cD-40; Wed, 19 Aug 2026 08:19:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394863.1633487; Wed, 19 Aug 2026 08:19:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwbVq-0003c6-0F; Wed, 19 Aug 2026 08:19:06 +0000
Received: by outflank-mailman (input) for mailman id 1394863;
 Wed, 19 Aug 2026 08:19:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1wwbVo-0003c0-SY
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 08:19:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwbVo-004qMk-5b
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 10:19:04 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a8566ed-8faa-0a2a0a5109dd-0a2a4503b45a-40
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 10:19:03 +0200
Received: from [52.101.65.31]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a8566f6-fae8-0a2a45030019-3465411fe646-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 10:19:03 +0200
Received: from AS8PR04CA0196.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::21)
 by VI0PR08MB10559.eurprd08.prod.outlook.com (2603:10a6:800:20f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 08:18:59 +0000
Received: from AM4PEPF00027A62.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3:cafe::73) by AS8PR04CA0196.outlook.office365.com
 (2603:10a6:20b:2f3::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Wed,
 19 Aug 2026 08:18:58 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A62.mail.protection.outlook.com (10.167.16.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Wed, 19 Aug 2026 08:18:58 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AS8PR08MB5941.eurprd08.prod.outlook.com (2603:10a6:20b:296::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 08:18:24 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%6]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 08:18:24 +0000
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
 b=CV20b8b2eQhmU9fXtT0zL900SZcbXazbeUUlQ9XHG4V6i3j92Y0xOnZ6D4e1QG0eRnrn5ttSAVXyViBrcwaSsLfJOFv+tYKWEemRhKNmasFKctUh03vmaWWl/PkBmIx7wJ89V/dXNc5X8EstC993/ZklwNjbq80OtFy+kMRdrIqP0N+IfCNxe7D2xAk8aaKu3D1bOHqeItiXrn0GWAQSVA28NDM2gfxmIu9jXqF1nZWO/Y7QWRG4fEIUb1uMYaynrjFsUTpULBP6FT2o1HYXiVxHlENCfenxrs4CgOM5wS9NoEXbdPb9IOis+n2mu5siNqcgkO5wFn6octhVZiQ1CA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nmfV9jZkRiW5RX0g53UAkRH+0KpBfEnmsl36tJuhhGM=;
 b=xmQ4CJbPGCauo2mn20dVOXgb419tENqwLBq70vvHLTkqzHep4fdxJLEO5e8qJmVyr95b96DU8gjGs/G6AoZDrDRpxrgWPbBYbmLw4Ph4+yKG87ENIBFqA+2P+up/k0Qp0dT8UmIPSLeIQjhGh29wFroOwFBM3kUmRqlhEpG2wEnDXYMGRmDTSMKOu+6zjRW6yJv5XJUnIfKbuIMXT7mQYrCKLCGeo3+GPlfHW6QHM2BUb+oVeqch50bCn58yimC30ggxA/jfFlw8kfn8lF+PhJ/ZZSk92HRiM3oZJDsGy2j98GTdgLXA/J7iFqZYPCEm8c8NRB9M9O85UyQWu9Bvlg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmfV9jZkRiW5RX0g53UAkRH+0KpBfEnmsl36tJuhhGM=;
 b=WbPpit4EGanfgUUbMhAXxQQWpsWl77Q0NBFaF6JfJvLW6pQtI7Oc16cPxFdBBet+jXHI46RgVKSj40USDAZ5vp80BDUVg1fqfYN+9VrA+a/pDYvfjQo8fjyvVycFZKwaTRDMPF8ZyendcA8nfAS7Hm1mu1iG1FTGIoyCUaOKHXc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZZWq4W8pVTrWF7NUzLSsqq5fgAd8atd1xGeXKcwms02oQLcPRuEl/dlrurKn0Ox8jY8nOg1cLT10RztqZ2EW5oPE4RmrLG2HfL0k7aeCRJXA8aabv9EdJIGVyjBDRYERqwcWAq3NaZ7fahkMRHORrSCzoGCsSIMUt9oxvCQg9Q2FpgXyYcOAHnCs0zOaSOteUmK2kb1UTSzTTUwRjS5q6jqWbAqTKF+RRIU7RYSQ0FpZaVyuC/hPPH/3xPe8OEN170/amhP/Zms6Bvr2nPyjs+1srL3oVaa7/4Tvvr+qdX/2Axe/UnioaeMaIC4mpRTMaFcKf1Uj9MSgHLzBQIlKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nmfV9jZkRiW5RX0g53UAkRH+0KpBfEnmsl36tJuhhGM=;
 b=lOCu/GqeiuLLQxlK6vaVdR8JQ6PPjWhTG7YaHSYcsbTywosg/LI73v2QutIhwQQ7rt+iOj/9kEUDuPGIeXpIYMypdwjNn9FlRYPEWRGOYL4aenPRp8SoC4T7nyXugcXi4zZuU58atU4Vj1prWl0oRWI17gtfK/24kDHZJYaJpkz4nRh1LjG0SjjeDXDLl2SPpGYXUTeAcVLDYju5HQrYAtgAmjHgkHlFMOkoZF1s5xIO+RFfA+AWPO00tj/ODX6I6cM4y55CvgY31QH4zM2DiFdUg3bOMaMAsX9soGIi6D0W0jlY0pn/51fhXS6eguQuw/OW/TvcpD3CzIhpAaywCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmfV9jZkRiW5RX0g53UAkRH+0KpBfEnmsl36tJuhhGM=;
 b=WbPpit4EGanfgUUbMhAXxQQWpsWl77Q0NBFaF6JfJvLW6pQtI7Oc16cPxFdBBet+jXHI46RgVKSj40USDAZ5vp80BDUVg1fqfYN+9VrA+a/pDYvfjQo8fjyvVycFZKwaTRDMPF8ZyendcA8nfAS7Hm1mu1iG1FTGIoyCUaOKHXc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Jens Wiklander
	<jenswi@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>
Subject: Re: [PATCH] xen/arm: ffa: Harden SEND2 against invented loads
Thread-Topic: [PATCH] xen/arm: ffa: Harden SEND2 against invented loads
Thread-Index: AQHdLwt9ezGusG27iE6LBf89mJZswbak//uAgAAD2ICAAAIrAIAAAnoA
Date: Wed, 19 Aug 2026 08:18:24 +0000
Message-ID: <93FE9979-8787-4473-A356-34FD3C1AEACD@arm.com>
References:
 <1b483ce633bfa7d304cb78458ce029370691f00c.1787055320.git.bertrand.marquis@arm.com>
 <bb5a2a10-39ae-429f-a414-631b89d0bc89@amd.com>
 <59299B15-47CD-46AA-890F-E8991F41C01B@arm.com>
 <3db3822e-5f40-462f-9f44-aab17806b656@amd.com>
In-Reply-To: <3db3822e-5f40-462f-9f44-aab17806b656@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AS8PR08MB5941:EE_|AM4PEPF00027A62:EE_|VI0PR08MB10559:EE_
X-MS-Office365-Filtering-Correlation-Id: 50d114cb-f07f-4f77-998a-08defdca84a5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|22082099003|18002099003|38070700021|56012099006|10067099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info-Original:
 1vV7+KJsynwQ/PdQZ9F24pcGutEF4J+t2DZH0emQhlntSwXtlbtGNNAjKoV6vpsRj43dKxj7st+xfrjws8nhx6CcDxQ4u+1GeNm7nFt5kslQshzHDBPNg0b66s9fvvIiu/aym/6wTrDiAuFesobJoyVLaXvSxc+N/XzdUR6nPB46OAawwyZCuCPOhHL6bWDh/6BIVwgqceYb4jpJ6gSMkKx07zcigxYukcDc/CaLDjRThwPH31LcwFu00UzZziA3ocKOjodg7AcVjLS4A6DSv//ZoHPhzGs9OIsSaVHhMsXkej7Ew0QZNzzI8ZeM80MogYLxABy+F6t4H7MeJrmnmPvB641fgrlRH9OjnnOy3IICZ46Lmdd2K6+lLk9U4eTlXSTqZ7sJw5Kg6imuzDE8nAqzmPTTku8ra6gq3Xd6doq0PEDPq5x6OanYKbu5OUf9Uh93P9R/t7mEORFMCK6e9b78eoQdMGQGNoxnBwY7nixa6fVSAGXTPjn6+VQT+W9DghqOZcVcQz6cLHBZfMDpAA3cRUwCobd4aNRs+GR1Om7SCNaGxo7Mle6MdqIMxv82wyKzfieskslJ68gm/9qb7z8cYvSdTYzc4F1pU42TNUT8wJ0EZ2Fi30xHG9v2O4XEuqJQVkqFnpKP5nrvQOB78gMT5gRuPTduhKkP/VCQr0XmLVBUwSp7rxqq0UdEil+VINXrkubuDFoHPzF/xhxv4+hEBqdMVX6OMdGdFkP88+w=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(22082099003)(18002099003)(38070700021)(56012099006)(10067099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B7D3DBABC316114CBDE51B643FB6B502@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 KZmChN8N1RVTw3DkpzUSCkBG2j+MPbrjHBiADB7qMFOFcaDxPHahUa3xgjNvfB81tiEOc7TxDBICaYsk3VedAA1zOdNGXMLDzWu9PKc+nDNsUqcXPzb4/2jE8qC2FZ+OOAlwXG4mtzNH39muH31C91VCh9FethniJqScNh8lOPXnvCkiwAnIqUcZjrAG7z14iYIC0ieSSTRMEeApXAS+mURJzVZqscsdk/rqEdR8LBcZ/Mrq3u7G+Jroqk0G7k+QM45CbhErKXJna6uimmHiO/8hoY+EvNtcEH0xLpwJmvidRCUQveuAYYMD2YhfJxdc93NpKOuxniKN0wTrj32Odg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5941
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A62.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	04e4377c-2c26-45b7-02fc-08defdca7071
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|14060799003|23010399003|35042699022|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QEWpCC7eidPODXHb+Zb8s3XrCIcUcm3B0wz0baWz1qMlDJ0b0rfovGUOBDkGOLDrGZ6K6opLgowzQzN9BfeUON1Wo02ixShSJefK87K7nKk6XL8ZBprF0YGoS/u6Ri742RDXl1Yxl4jdTNgoXjr0Gkzm2gEbi5sYcAd6CYaTwMlb5OdsYzuZTRBAQng4XGtDx6lmOFoSeyrfNERc1rruOryhMJQeyxvg1YSELF4Qp4LpIgHTuFmCAfm721CB/45CtEot/YZG4pZLXGqv03PNwi6+oC2dNQdsS6MGN/ikJ+KZZJdEoUXRWxtB1g2oLZxc+qQymrIZ9fjI8zGE1cQ7/z/lNlYeGd08fvGNd6ofXPKxBe/3oCdJmBO9be9LILtzBCKqelVzoBbX5I1FsAUYEeZIIhn1Y7wb7XUAutJvxqND/GzEawqcC+ky6sux3PieJ31lKwzrkSuBeJ+LHH4c7KLdDigE1PSdhd+RUvRC5qAF9A1JSXoiM0IDW1bBhsX96Mckt/5d3lkK4G3L/DFpx7CWulIJmtQfmPRVgCr+eUOvMY/e3ZCplqSY5FwSc5QBPPIy3iTP7SxvF7ESeaeDfnKsx4JdACkJYYi95xbBullkYa3mfA/a6OZTKlO2TulgEqhnJuLmx1OFctGgQHj68SX68p/7glWTR2/MR5fsGtOoaKyvpQ1ZNWiBlT+5AdVs1myLtq1Fc867tM44OsJkUg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(14060799003)(23010399003)(35042699022)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sxvW4I0i1v+yn8nXkZjqByaDSQK1KzvZQWNq6/rqfPkv+JEpfBdbCH9MgconS6z5HGzr6chKOexa7BbmQSNLT1AdnTL+V6Lz0s5/3qKkDzuknIrplqZ6TVq9d9gVzxvL/R/1Dkacpp/W2A50g3d/M4LWr2OY3R4r23b9o6zW47OpNF2AzbnA+RRrZeHMFOhA30EIfyd875oB5NaHFpPCF+jRkU7qzrcUax5tDeSZT/J+0XiijLjHL4m1mLvH1BU6wofe5HrESs4D+wlPwq2MiiJKNGOgOe0bQHcQBqWGWQv0qFS3+1dm779cFjbh6T5FK/y/cbaozfU9csbyIo8+E2cSmryHbGsyV7Bcwp1uJIZleGG6GY0S2F5wYqDJ2T4hRhl5iquu7YMnknt+Pwuh12hw6LO1Q9axeN4GuU9ypYaaE+1mX6KWzz2H1paFlJ7X
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 08:18:58.2924
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50d114cb-f07f-4f77-998a-08defdca84a5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A62.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10559
X-purgate-ID: tlsNG-33051d/1787127543-6C8DD4E9-8D3CE50F/0/0
X-purgate-type: clean
X-purgate-size: 2872



> On 19 Aug 2026, at 10:09, Orzel, Michal <michal.orzel@amd.com> wrote:
>=20
>=20
>=20
> On 19-Aug-26 10:01, Bertrand Marquis wrote:
>> Hi Michal,
>>=20
>>> On 19 Aug 2026, at 09:47, Orzel, Michal <Michal.Orzel@amd.com> wrote:
>>>=20
>>>=20
>>>=20
>>> On 18-Aug-26 14:16, Bertrand Marquis wrote:
>>>> Research into compiler-invented loads has flagged FFA_MSG_SEND2 as a
>>>> possible vulnerability.
>>>>=20
>>>> ffa_handle_msg_send2() copies the message header from the guest-writab=
le
>>>> TX buffer before validating and using its fields. A plain structure co=
py
>>>> does not prevent the compiler from re-deriving later field accesses fr=
om
>>>> the live TX mapping.
>>>>=20
>>>> For VM-to-VM messages, msg_offset and msg_size are validated against t=
he
>>>> source and destination buffers, then used to copy the payload. If a
>>>> sibling vCPU changes the header and the compiler reloads either field,
>>>> the checked and used values can differ. This can cause an out-of-bound=
s
>>>> read from the sender's TX buffer or an out-of-bounds write into the
>>>> receiver's RX buffer.
>>>>=20
>>>> The cross-VM path is gated by CONFIG_FFA_VM_TO_VM, which is disabled b=
y
>>>> default. The audit ranks the likelihood of such a reload as low, but t=
he
>>>> C semantics do not guarantee that later accesses use the stack copy.
>>>>=20
>>>> Add a compiler barrier immediately after copying the header so that
>>>> validation and use consume the same snapshot.
>>>>=20
>>>> Link: https://github.com/xoreaxeaxeax/schrodingers-toctou/blob/main/ob=
server-effect/audits/audit-xen-tee-mediator-RELEASE-4.21.1.md#tm-2--ff-a-tx=
rx-buffers-ffa_shmc-ffa_msgc
>>>> Fixes: 98af565b1e61 ("xen/arm: ffa: Add indirect message between VM")
>>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>> ---
>>>> xen/arch/arm/tee/ffa_msg.c | 5 +++++
>>>> 1 file changed, 5 insertions(+)
>>>>=20
>>>> diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
>>>> index 1eadc62870f2..39f561c8237f 100644
>>>> --- a/xen/arch/arm/tee/ffa_msg.c
>>>> +++ b/xen/arch/arm/tee/ffa_msg.c
>>>> @@ -257,6 +257,11 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs=
 *regs)
>>>>=20
>>>>    /* create a copy of the message header */
>>>>    memcpy(&src_msg, tx_buf, sizeof(src_msg));
>>>> +    /*
>>>> +     * Make sure that "tx_buf" which is shared with the guest isn't a=
ccessed
>>>> +     * again after this point.
>>> This is a bit misleading because it *is* accessed in ffa_msg_send2_vm. =
The
>>> comment should say what you wrote as the last paragraph in the commit m=
sg.
>>=20
>> Yes, this should be something around:
>> Ensure validation and use of the message header use the same snapshot.
>>=20
>> Do you agree ?
> Yes. I'll fix on commit.

Thanks :-)

Bertrand

>=20
> ~Michal



