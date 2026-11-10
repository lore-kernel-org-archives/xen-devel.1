Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA007606A336
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 14:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=GCh3oaql;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=GCh3oaql
Received: from list by lists.xenproject.org with outflank-mailman.1481887.1685776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQmpd-0005dY-AF; Tue, 10 Nov 2026 14:28:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481887.1685776; Tue, 10 Nov 2026 14:28:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQmpd-0005dR-6p; Tue, 10 Nov 2026 14:28:17 +0000
Received: by outflank-mailman (input) for mailman id 1481887;
 Tue, 10 Nov 2026 14:28:16 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1xQmpb-0005dK-OS
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 14:28:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQmpa-000iSp-J8
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 15:28:14 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6af329ed-2eae-0a2a0a5409dd-0a2a450bccfe-46
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 15:28:14 +0100
Received: from [52.101.83.41]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6af329f8-b7e8-0a2a450b0019-346553295ee5-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 15:28:09 +0100
Received: from AS9PR06CA0737.eurprd06.prod.outlook.com (2603:10a6:20b:487::13)
 by GV1PR08MB8744.eurprd08.prod.outlook.com (2603:10a6:150:3d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Tue, 10 Nov
 2026 14:28:00 +0000
Received: from ZR1PEPF0000E462.eurprd04.prod.outlook.com
 (2603:10a6:20b:487:cafe::94) by AS9PR06CA0737.outlook.office365.com
 (2603:10a6:20b:487::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Tue,
 10 Nov 2026 14:28:00 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 ZR1PEPF0000E462.mail.protection.outlook.com (10.167.241.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Tue, 10 Nov 2026 14:28:00 +0000
Received: from AM6PR08MB4754.eurprd08.prod.outlook.com (2603:10a6:20b:c7::11)
 by MI9PR08MB538100.eurprd08.prod.outlook.com (2603:10a6:290:c3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 14:27:26 +0000
Received: from AM6PR08MB4754.eurprd08.prod.outlook.com
 ([fe80::a011:ffac:e18d:5d83]) by AM6PR08MB4754.eurprd08.prod.outlook.com
 ([fe80::a011:ffac:e18d:5d83%3]) with mapi id 15.21.0592.009; Tue, 10 Nov 2026
 14:27:26 +0000
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
 b=f2Rc7D0GYPrXSBKj4n2NGFDVPZw4N55eoGlB2X/zeX29XJY0ryASyzBhAZNaTmQ9Wv+kyzElQg4a8+3MoieNd8JYwiOr2ncuaSJMWHXUdDbTBb0BCtjrz0NAUKQizmgCVJ8gbtqpIj5i1480KiivQLgm7liR8B+JIGQKnnD91e0A6KpEWfIsm6lgjSUWdBuM7+43Cp+0Gi7ObyL03v2fDHfHxJmbogBte9tVcXgDva5TUiPL6hiz9H/XPI17NYeFnuJ1mU6ohjhecfUPDB4c69j1aC15s72TPnL1X4bX5aAjkX8HSU5Q5WYzaC/WULQAMYCOio7NfRMgM9rm7+9yKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=apPZTgNbjxmMpmw/gs1ts/8hwGrfpXWfH8+SDYRpMXs=;
 b=s0nBmOn1qB6urfs2BYINF9Ar39atIh4/aM5zcf7r5QNFSkl3B/q3Cmdjl02ZPuttJqurDxFz+X70yu9+7O0UgdA/YFa5Ar5TeXD49UgxbhQtYq38B/oV2do6WSgUFTItZzPJ3opPWjh4I1aEbn/Ou6Y5U8nQd4tpsBUU/L/3EnZOz5tqP/5sKPKy89QUsV5k6RJUqK3x0V13K1Hf2nM3ULHRah4RuHuwoCkbfkWo+1ggJKPb5PDg2rl45/RE8WD/UpnDkfZ01fCw+6MUiwqZAgmIOglxbpWbnJ3Sqr9H4J9xmBPqwno+JL//Ma+2GRvA5iVCnpvtQyQZIyEfkVhk5Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=apPZTgNbjxmMpmw/gs1ts/8hwGrfpXWfH8+SDYRpMXs=;
 b=GCh3oaql09Q15bnczmPYZIw0ENiNU5dHf9Tf20iCXCVaGfX6kOAWaLjaw1nBHwxb4qmfgNpl5fH6U/k5W/+y+vKARLNgEqqvAprk4j/HIkbhnGAZlsUOWnHmHSlykibx5NDfUupczLJWVesdsqqaV+g/3orvguM4UQqOGaqlcL8=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+sHLTUpl0EBC9Mriqp0ZUq9jWlJ9JwG8GRCarsGk9YwyZi8MAMDm52Sxn06o0PSfwZjTYXf3fZW5VG44zqDbAK/IpFVLzA9m/1CMtPwgRSP4d4m7QOfyWkS5KvyBNRcdOCsgBKVLp8zZ7joxqQiinP5LKdIDIoexegloouEnDLo3fCtZscmVNFZ52zmFmJFU+QROh+PsoHCZyQMggMSZNPvzkS4pJjUQNQvYhtIdrxh7e759fHaPCzAgtLqY4OLxF5sMY33VZOIWvScTE1/L8Qi/FfofUXbr7riJtkfBYDAEbhvZ7bam1ZlAghZyZ1k8330YJi6uGqRhjl8BJeXUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=apPZTgNbjxmMpmw/gs1ts/8hwGrfpXWfH8+SDYRpMXs=;
 b=jVC3pjP5V0lo8V3I4SkOszf14lXnbjsopMyzTNDRe9u0SbsWquaDqJhTpWM7Da9XwOAIdQ0NVkCxVgI8zSnNDtrpp8JF/VREkoyMgqWqvScg6SPbNgm8foEkyvnxL/PX6r0/xSVyM8MVdw954C7qz73id+xHhZtTYDJx1wNqmy18+kkatQxHPyDvXvMRUClqZTSdDX5lhg/uhEqbW2Gqw3b4WncoWBfUMk3NN/WDsD3BP92lh7Mt3DvgfLo978zFpGUTzsV6JrTF5fZTF+SpJC4p/8BG7GJd1dQbnzfsQH0A+Pg2FTPb3U+v9yrwrADmlSCXLBWEpBeRf461sEQ7sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=apPZTgNbjxmMpmw/gs1ts/8hwGrfpXWfH8+SDYRpMXs=;
 b=GCh3oaql09Q15bnczmPYZIw0ENiNU5dHf9Tf20iCXCVaGfX6kOAWaLjaw1nBHwxb4qmfgNpl5fH6U/k5W/+y+vKARLNgEqqvAprk4j/HIkbhnGAZlsUOWnHmHSlykibx5NDfUupczLJWVesdsqqaV+g/3orvguM4UQqOGaqlcL8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykola Kvach <mykola_kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mirela
 Simonovic <mirela.simonovic@aggios.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Saeed
 Nowshadi <saeed.nowshadi@xilinx.com>, Mykyta Poturai
	<mykyta_poturai@epam.com>
Subject: Re: [PATCH v13 02/14] xen/arm: gic-v2: Implement GIC suspend/resume
 functions
Thread-Topic: [PATCH v13 02/14] xen/arm: gic-v2: Implement GIC suspend/resume
 functions
Thread-Index: AQHdZlcGwNOcdJs5ak+RYvHufcw5obcncnyA
Date: Tue, 10 Nov 2026 14:27:26 +0000
Message-ID: <113E1CA7-F205-4F5D-93DA-9710EE10378C@arm.com>
References: <cover.1793129971.git.mykola_kvach@epam.com>
 <5c1fdca65fcd1862fe7b7ae314c33832ced6c01b.1793129971.git.mykola_kvach@epam.com>
In-Reply-To:
 <5c1fdca65fcd1862fe7b7ae314c33832ced6c01b.1793129971.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.3)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB4754:EE_|MI9PR08MB538100:EE_|ZR1PEPF0000E462:EE_|GV1PR08MB8744:EE_
X-MS-Office365-Filtering-Correlation-Id: d294ff2d-4c4c-42ca-0432-08df3f36d281
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|4143699003|56012099006|11063799006|261022075727099003|261026140227099003|261028144727099003|261026121527099003|261022105027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 gGupJ4gtEMWzK4uCd56M9Wky2rP8yzpgHbwwz+tcnpUtJnO2KIJKl8A/elG56gEi/Mq0kP5meXVwGHttP8rj1YYld43CYN+vPwMBBX4PAhyLCqF9IQOlP1tQQikEoTla5WBargasurD6xRuQd50b4ITuFTGNmgA31byYv3+S19WrY9ot+n/T4B5b8EIFh0f3dVq5rjKO9ftwn++l7Yrm+MD9nHeBYkEggfuMxJ/ZhSP8jNRhYUE0x86/8cs1IJH2vqpqxtDkW6qzcLRJEcouPgn472bNOC3JuOUmgyrG/0CVP8hDsodkutdgjUvPBWJ4q35Rrl/RLu0LpDOrpsuvMlzZAd7aKX92gws6OHRTuOUpT8mEydSwACXbhFVmrkyxvLTPuL7hcBg7ONHQW/LM+PXT+oG56fjuYBvS0CZ6Wn4ANsA5q/uxgiAhmVhIHKvCrttUJZmcstf6fNiP5PFxLwJJ8LmYT68M+ZCA+Gy5LEqko33UG8faG5CWtbKVtVDbzNd0Mh0ThYreGwyx2WFVVpJRoMyR2ClztO09Hm/eLyRivH6crK9/mxVUHwIR1+lwJNYoOvC9Qb2FOkVNX/L9VG4fjAqI3MiI77WKoecly3ldORzlnkcBH+OQVt/mrIwVy90Htq1H/1208bvjBPfBcudXwnxghsl/XmejkrTskurCDrEPbkslyrRbh8eJuLoOmaV2nZHAp7RRAtIjuAAk/4vCwGH8MBRMFO16TksjkvY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4754.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(4143699003)(56012099006)(11063799006)(261022075727099003)(261026140227099003)(261028144727099003)(261026121527099003)(261022105027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <426316DC6AF2724FBE1DE2563C034A58@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 o2NftuDN/qQjBy+YnJzs7qdU0i8oPFC5vYHgH4WN+5gIIhTSXVSkGYl4qWFuxGvUgfwd7FGAal7zmMm1ZDduq6LZcYsjEJQANMRnUA0Tyad6hSzKA6N0+oyGmnCs5hMz9F50ZbxTnpmam6CRD1qAPZcuAKglveJA0ROTiz9Uh+QXdORLMQLZ5Yh3XWdgkF2QWa5KnJnnjgn7zKofX18vdGF1SJfKae7yGBBhU1/B6U28q7Q2+piMQ9NZ+1sC/X8xVsqVmtqyDfh30kwrvXWxhQ8fRd/StPqqUcTl5fRiHcrC1C+E6P6ckIUrzAA/jlmykGNF6NeIseRhqR2P7610Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR08MB538100
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 ZR1PEPF0000E462.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b226bc1b-3717-411b-cf43-08df3f36be2f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|14060799003|36860700016|1800799024|35042699022|23010399003|10067099003|22082099003|18002099003|261022075727099003|261028144727099003|261026121527099003|261026140227099003|11063799006|56012099006|4143699003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	DGd5VPyBLJccf3efWHlBPtxds5u6ZXUAUsAPU01+igXqw628gcS/o+RvE9jOmKb/B5Y8g0nrXku8uZQnVAtXE8pT1uGtTl3tUqwUNcEM0N0DFAqtRpjRx3sMlKTT8TDlFJWh7gSfePVit146Iw5svaXYVtQ96lWplMRA3947dpaNWNwykwnJGJIEt1Ox/1bmuHTEE1TV2DNluOj1N5b+Nz/neYr7NDovt695OE8lXhwTYg73v4Kq5PJ5lForkPI/tfYM0kj5TbaFm+6x+taUhi0s0/ZTpYIdnz9wwHMooi9B0/XQYS8NoU8Jc2EUtL13roOHnPjNtsRLIjMkw+58cpedU2f11Lb4XW0S+UITe+K/bwiS6+12YyQjNOpCDohVDIZQcj0bAs6Y/boB755QtEZ25tW/eEd7rkDaq4NoxPyrHyosU9bOaDdzCZdBoSzVB4Ka4GvTmAiyHzqBjq2pU7UDzwGzkCjgRG3k85o77Z2EoLaL+o1qbAAqQ1gwOOZWiYYugrRoiLKl8RMwZx6w1y+OnDynlVUPyE+cpI/lL84UwDuAvINqU0R080DNz9VFrQXetm/bMAtl/BLvZnsm2yqCEGUHj/Xikxqguj2vY02Cz9lIJN3KtJh6wZPMvtq1jFvLdYU06ZyBy3HxrCeHQcwMff9yQKDvQ1RcYW4gFeC1DE0vhqbqOXCxmVVEYWapeRjla9jqHePcsN/fxeQU0Q==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(14060799003)(36860700016)(1800799024)(35042699022)(23010399003)(10067099003)(22082099003)(18002099003)(261022075727099003)(261028144727099003)(261026121527099003)(261026140227099003)(11063799006)(56012099006)(4143699003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	su+Wv8tWgfPg5vz2JUoaEkPSdUYLnqtW2wA+rTLDfRCJJUiZB3uYxhWxTobubAEgm5QngolpcEA+DtNnOLkUGRyVWO23kjE4C0VtJCaTxVu4pDwsVvqIfK10goKBcAsCrdwgsXCNYk84hBHygETFAljc35VmnhoiD0bRcjEovLd+HEku4V7tuDu3shmSc64uvX1EvlbS7OF8OnOdoPHx8Z5eg5T86JXM5JDW/YAHVU+7Rx8RiMujcBmRbyjvX3K7vW2KxF3/fKKhDkfJNDEEpQDJMN7n4qC77ZrImmin18vw9iuodg6sCRCd3Zs2zxY2ThYMAFdNjfFu1zXyiYJptkiZwkh92l9ejwqYPfxhQUgvbmBJAeTNu1A2swujeEpdJLApbYDuMSsU4jxTJk2u3SSBsQZOTCWIY6/dXU6aEdQFjx2ANhqeA4rOrZFDrXW0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 14:28:00.0865
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d294ff2d-4c4c-42ca-0432-08df3f36d281
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E462.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8744
X-purgate-ID: tlsNG-42698a/1794320894-1AEDE9EA-6A65FE5C/0/0
X-purgate-type: clean
X-purgate-size: 2545
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mykola,

> On 27 Oct 2026, at 22:05, Mykola Kvach <mykola_kvach@epam.com> wrote:
>=20
> From: Mirela Simonovic <mirela.simonovic@aggios.com>
>=20
> System suspend may lead to a state where GIC would be powered down.
> Therefore, Xen should save/restore the context of GIC on suspend/resume.
>=20
> Note that the context consists of states of registers which are
> controlled by the hypervisor. Other GIC registers which are accessible
> by guests are saved/restored on context switch.
>=20
> Do not save or restore physical pending interrupt state, including
> SGIs and PPI/SPI pending bits in GICD_ISPENDR. Before this point, device
> drivers must stop normal I/O and quiesce non-wakeup interrupt sources.
> Earlier events must have been handled or remain recorded outside the
> GIC. The platform must preserve wakeup events throughout suspend entry
> and sleep if the GIC loses state. Level sources still asserted after
> resume become pending again. Edge events need state retained outside
> the GIC; saving GICD_ISPENDR would not cover events arriving after the
> read.
>=20
> Keep the Distributor and CPU interface control state unchanged during
> suspend entry. GICv2 wakeup signals depend on Distributor group enables,
> and firmware may check pending interrupts through the CPU interface
> before accepting SYSTEM_SUSPEND. Leave shutdown and wakeup setup to
> firmware. Disable the interfaces while restoring their state on resume.
>=20
> CPU-interface active-priority state is not restored. Xen enters this
> path with local IRQs disabled and must have no active-priority context
> to replay after resume. If any visible GICC_APRn bit is still set,
> abort suspend with -EBUSY without changing the GIC control registers.
>=20
> This does not apply to distributor active state. With GICv2 EOImode=3D=3D=
1,
> EOIR only drops the interrupt priority; final deactivation is a separate
> step. For guest-routed interrupts, Xen can have already EOIed the physica=
l
> IRQ while deactivation is still pending on the vGIC/GICV path. Therefore
> GICD_ISACTIVER is preserved as architectural in-flight interrupt state.
>=20
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

Thanks for the added comments for PPI/SPI handling.

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


