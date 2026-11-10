Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6659606A321
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 14:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=LfG0wNvr;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=LfG0wNvr
Received: from list by lists.xenproject.org with outflank-mailman.1481905.1685795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQmwg-0008NS-9x; Tue, 10 Nov 2026 14:35:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481905.1685795; Tue, 10 Nov 2026 14:35:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQmwg-0008NL-6d; Tue, 10 Nov 2026 14:35:34 +0000
Received: by outflank-mailman (input) for mailman id 1481905;
 Tue, 10 Nov 2026 14:35:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1xQmwe-0008Lo-Ne
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 14:35:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQmwd-006U2m-Ro
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 15:35:31 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6af32bb2-8faa-0a2a0a5109dd-0a2a4504d496-6
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 15:35:31 +0100
Received: from [52.101.66.64]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6af32bb2-b57f-0a2a45040019-34654240275b-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 15:35:31 +0100
Received: from DUZPR01CA0057.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::6) by PAWPR08MB11087.eurprd08.prod.outlook.com
 (2603:10a6:102:46b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 14:35:28 +0000
Received: from MAD0EPF000008BC.eurprd04.prod.outlook.com
 (2603:10a6:10:469:cafe::44) by DUZPR01CA0057.outlook.office365.com
 (2603:10a6:10:469::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 14:35:25 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MAD0EPF000008BC.mail.protection.outlook.com (10.167.241.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Tue, 10 Nov 2026 14:35:25 +0000
Received: from AM6PR08MB4754.eurprd08.prod.outlook.com (2603:10a6:20b:c7::11)
 by AS2PR08MB9198.eurprd08.prod.outlook.com (2603:10a6:20b:579::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Tue, 10 Nov
 2026 14:34:51 +0000
Received: from AM6PR08MB4754.eurprd08.prod.outlook.com
 ([fe80::a011:ffac:e18d:5d83]) by AM6PR08MB4754.eurprd08.prod.outlook.com
 ([fe80::a011:ffac:e18d:5d83%3]) with mapi id 15.21.0592.009; Tue, 10 Nov 2026
 14:34:51 +0000
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
 b=b2AazJm1KOan7o3xcETTcXWkA6z6Tn6i2AhB0MRy0Ib+1hz1+YePlGzC4kLkDWwLxEM4s8f6m3W80xegRp/L4FMhRx98973rQRDdjKt6A4vtwABcakIQ4in+2H1P9cDze4rM7o4/p1X9MP/ecvvWH+1Y5FnJosZ6236/LIZ9ZmrDra4mv6BXF/xT74OVrEAfG4xrBypolTbyKm/IayWRHyAdShcdlyLCHGdyEqHMRXUqQxn9I6a4TUzmrXaNo/WVvgA2UPoMuCq03dFD/gXhxdl/neKp7FTYAcrfkmA9dKJlLFgxfBQTPpBciHCyaCk3QgVlZYcSkZ/sFan01/QusA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+iP7e/TZoNND1LvqmFEhaAdfLTzMt27JLbgCxF7u7E=;
 b=hiLy020610JikiFi/O/MjsjfRSn4FelqZFYIKROKlyjGHVod3oFB1UrCfiTS9+13PeYCOqTfbHbMsRaZhOiVHEJ4U9U7W8t4Y6iW4bMbYWR7MPZJWJUOVg5ucRZ/Gz6JIKJ2flA+2ouoCwoxI+Y2DwAG8ufG6kbdPFzpG/0QjQvmvNojy5y9rAO9HhbaeeqjA6jD7cub3IwL6O7tLsvVhdMFOLUwL4DY9B9YtHuihrtqbiryK4Fi8I1dmcEOLlBIHBf28m6vDwsYgX7zbijxbSC7+Q3lKCZU2V2MQkpSKZru1kMFXikkp7whpqxAbtGgLvmx2NBQQmyHhtuwLKnAeg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+iP7e/TZoNND1LvqmFEhaAdfLTzMt27JLbgCxF7u7E=;
 b=LfG0wNvrYMqGP2D6B+AgMUn0lY7XonJVg/nJzApIewOJHEP8B/eZaCzDt3CYRNpfdcwjpt7l2wuzcmPNtjzXyM0X/f+RZC3j9yxv5Sefv+DhBddRcz702WeDRvN6uQVupclPThZIWNmHdd3jXGDHbKPi0cKkySG9SqKyQhmy3e8=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FmOJ2GOGAOw7geJXcopB490qcw+5GyzJtxePlUn1WyhzcRia8xv4Jzuy/5dzRHpntfizTGyhw3N3/xLRFmXpyrUxfySxRA0fBGVTUCjfENVHD6YXS3XPzheaRYuvYnMM83EeS+kgO87IvGIlft6iL6L+Dkc1bTjkHsCVQ2ztrUcU1MCZNnWzGXnLqw+7bAkW9pI8COBHs42vN7/z5MWRrTrlOOK7yKR2cO1lwdYOzK+srnmhlxb1+hB4BKx7W8wk1GUwlNtCzlh29VJZMDy6NeZfmX6h4kJgUm0c8R5yiPhQU93VxwLjTYVKrz8JAYHO4hxjVQGor25QWXIH3B+uKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+iP7e/TZoNND1LvqmFEhaAdfLTzMt27JLbgCxF7u7E=;
 b=X+ah3aglVJBOOXrcwZpRCoC9s9EefW9UaO1TNsVzxtVzBHcxfdo8aegAZApbi2C96KK33IYRihHUonVn3YMq3zRRaeP1OH8sifa2AgUnaNo0mrjM2zCN86TrH/rwv3GNS+ylevNHAdR37xaIOJZp8aohE1ssd/uwessgJueiWI6QzMVF0tZBVc+q+61cmS3MGoNyhC5y5eaKTVXgfsRnZ3WvnnHzGGZ0qF7R9dbDTAKZj0MmmHzIDHZQvYosTAmsGQDAFx2N/I5ZY/PKj7dT36Vo8F5iByLhZSIvfl5uzpHipkH/XeBirKBeDzE1HTFDxEs/hftHZDNyTBd1+HEvTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+iP7e/TZoNND1LvqmFEhaAdfLTzMt27JLbgCxF7u7E=;
 b=LfG0wNvrYMqGP2D6B+AgMUn0lY7XonJVg/nJzApIewOJHEP8B/eZaCzDt3CYRNpfdcwjpt7l2wuzcmPNtjzXyM0X/f+RZC3j9yxv5Sefv+DhBddRcz702WeDRvN6uQVupclPThZIWNmHdd3jXGDHbKPi0cKkySG9SqKyQhmy3e8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykola Kvach <mykola_kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Luca Fancellu <Luca.Fancellu@arm.com>
Subject: Re: [PATCH v13 03/14] xen/arm: gic-v3: tolerate retained
 redistributor LPI state across CPU_OFF
Thread-Topic: [PATCH v13 03/14] xen/arm: gic-v3: tolerate retained
 redistributor LPI state across CPU_OFF
Thread-Index: AQHdZlcH8ffpXAdblEmVMEzSma2NmbcndI+A
Date: Tue, 10 Nov 2026 14:34:51 +0000
Message-ID: <0BB76C40-88AC-4719-84F3-52D491380271@arm.com>
References: <cover.1793129971.git.mykola_kvach@epam.com>
 <5fbe90be9e32464bf0f03f50614e65fd899d608c.1793129971.git.mykola_kvach@epam.com>
In-Reply-To:
 <5fbe90be9e32464bf0f03f50614e65fd899d608c.1793129971.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.3)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB4754:EE_|AS2PR08MB9198:EE_|MAD0EPF000008BC:EE_|PAWPR08MB11087:EE_
X-MS-Office365-Filtering-Correlation-Id: de164125-473d-4433-2a83-08df3f37dbe2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|6133799003|18002099003|22082099003|261102123227099003|38070700021|261022105027099003|56012099006|261022075727099003|4143699003|11063799006|261026121527099003|261028144727099003|261026140227099003|261021121427099003;
X-Microsoft-Antispam-Message-Info-Original:
 kqbCxkpHbg+I3EjpSJSwNO16eliMisM5xlnQ5CmQzyoOf3TDTX0KKKpwEFXMSWoPcigFZ1KCwCEbVrVyFXzxAAxeemA6zeoU/Mg1fTqe9uzJnixyYNaXl+XeeM+mGxTZtLG9XChQ9aDrurWjqR9Qvp7bhpJ0lFQC4AulbNnYdOHDOB6DnJ947DcO7v+kpkLKvXTS0c8mNj7FirnFOHjGAMvZkaQEAUkIudxn2/bk/i1s6v6G7IuUSwFKSTzRGMaSk4QJp/biWn6T9+WzJvnRRjYhchfPmyWBRomrHX1mFQAh+TyNHNearKjqFD3h5mAbgqM2p3mAAa0fKzThcEQhmk3nSRU6mA/F76VW4oPuVxzn++gOVTQSW8daphQdicXJpReLvKQnP9O5HVoBPMhKQWjSdOUYyjT5uB2KcjqPG1xWrlBWZnxXeT/qUTedSGymzd9FjkW2l4F9w3zl/yKBTQ40WMFIYEi+te6+gE8WNn4anQ5dRCA4gTziDeONJO56O/J9I5F0dBRhe7sgSuBMOLoF+OnAAwL4tSLufkNImgjnBw4hHN7xIM/jycrI7xwCRaYR1p2NA6BOgKK4M/yEYsvBGjygKRRuLMyKXnuR94AaF4gROfQsTm2R569jhvXlwECNZ8kQU6uQeYHmrwXTlVfn/vjZQKK2v5hhlaqst5R1vJWZ/3bWgmnKi31BnHGzqcgshRyTAPPAhy9MsGfaQbCDJmInW8LTNEfpe/kiVAE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4754.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(6133799003)(18002099003)(22082099003)(261102123227099003)(38070700021)(261022105027099003)(56012099006)(261022075727099003)(4143699003)(11063799006)(261026121527099003)(261028144727099003)(261026140227099003)(261021121427099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <93797E645DAD264FB2078EC6E3FFF807@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 PQ7gXwNgqv6mp2jyqXVgiy7jiuEISbFSW1id8k71aSMg/16SRsAKO+jK5XeIt4ELpfetK1MgVJhLrvpScEisfGfzDEIiRbhR697jpqtP8f3e9AuXv7bW30xGUMbero7//Qncz17NhgLxZxd4K7ucHB/Ri6PxPVzQlO+ZauI+nfzzjSHdJ0mXUQhtz/yWfnwbaM7djRC98R3RmRYGlf1ShIqN+Q8xoDVxo/yjFvEyjN9CFvo5r4ua0wjExdSjdm6ZoiQDTUJd7abxXi4exNWM58uFxniaOwWTTNfa1hTQhSzFvNptpBUtqOhFohb63q7nCvzLfsl6B2sYL3uWMrrqjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9198
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MAD0EPF000008BC.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dd3121e1-e90f-426f-6637-08df3f37c785
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|35042699022|36860700016|1800799024|23010399003|376014|11063799006|4143699003|56012099006|18002099003|22082099003|6133799003|10067099003|261102123227099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261022075727099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	X0qceLVX0Iz+FolzIMpriRXEmDmdMIROV6ESlGVhiYFBUS5UVdtZamjuKWX0jJbR7Nz4liggtSPbPEP8Jsc+1GN/tVbnC5vGvciVPU58fg6aBa5MBzlV9dN3ceuCbv1ic3NmEDWnWaZu0rT3xa5pVmWmQfbHvK+JAr+DoQLvSx+GLEb3Ta41GJZwRuZAU8og/idxIIxVuZbg2QbzoRrqhaMy3wamR2prm9h8e0w1cEnBs8riUw/n8bAUtGEmUKO/Jlxa12S7+FzCK3u3OEYG9ptpjeLBBPQnU0VBp40XGcnk4COiv0wZcQXRpwVGw4if4DUytJdZnXm+FoqlnajJBmE/wwU6PXQlY9ltlZzQyajRuNVicLHsAQxGC6+NCeCHb9YZf4ZL4jznkw54BZctpGTHHU2jPna8iigts+DssupFwZ/pI/iqgg1cxt93GTWNzSoGgiy/VGxG1SZWjLoUqLkXuhFYpKhjTl8xjGBqFuTTvzg+IXVpVq3WhXNLEbCi5Rq1flV9TTnSQV2z47UA5mbCFuhlT5GDIZSNUYM+brGd6YUqULFEVaH3BnMpVnyskkO5kk462BdhmwphQyIG17GS4k8cpThtq4FAJwT4s4O8zfsL0KfxkY4Qe2GXJPIJ1xziznyy06QoHkYZywopQyV+Sblt+vYqR2V5HbSYWGA7e3h0wNYvkwVbbf7l6e6bvWKaSaBBxzoxt3HQEClbPg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(35042699022)(36860700016)(1800799024)(23010399003)(376014)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(6133799003)(10067099003)(261102123227099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261022075727099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wgbhC7OT5IM2FO7UE0OElpmZJYx3mtne/QhEum9D1o2Ip5T4rJI+BzC4SIJZWQREVijYdbAx3tfSLuNRVX3q+WYeJep7z5vnt6uPfffjsFu9RZPEu+wAqfLrDfbD5Z4/wWiOFmd9BAogORn+PopqT+iiR6dq33yHMUXYWfSvkHbh0TjyzIlcAvOBnSduS3ucsBWRwc+zTDXcewjjCuTmxaiadmPCkhhYqZ+GY9HzsbDZYlxBADGqfUzqBHZ3zdeBsN/74KyERLNJjpj5QRHpzP1q+umIPpHJkntXhJGVyyeNKXtE1P6CDA/D2j2zzP5+dXID4q16M+ZzehEE29k3vnBPo07tkg1vY745yfqTtBixaINCNEBAtTzP2q94jIoBwpI/Hdl8zGTOT+c8XG2WjtRkRkFJtv3sf/S9QTSrY7TUqtStDACx91AeYistcfyy
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 14:35:25.3075
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de164125-473d-4433-2a83-08df3f37dbe2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008BC.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11087
X-purgate-ID: tlsNG-ebf023/1794321331-C34C3B50-482D82F6/0/0
X-purgate-type: clean
X-purgate-size: 3548
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mykola,

> On 27 Oct 2026, at 22:05, Mykola Kvach <mykola_kvach@epam.com> wrote:
>=20
> PSCI does not guarantee that a GICv3 redistributor is powered down across
> CPU_OFF -> CPU_ON.
>=20
> DEN0022F.b says CPU_OFF powers down the calling core (5.5) and CPU_ON
> brings the core back with a defined initial CPU state (5.6, 6.4).
> However, PSCI leaves interrupt migration and GIC re-initialization to the
> supervisory software/firmware stack: the caller must migrate interrupts
> away before CPU_OFF (5.5.2), and the execution context that is lost in a
> powerdown state must be saved and restored by software (6.8). PSCI also
> calls out GIC management explicitly in 6.8, including retargeting SPIs,
> preventing PPIs/SGIs from targeting a powered down CPU, and reinitializin=
g
> the CPU interface after CPU_ON.
>=20
> This matches the GIC architecture. IHI0069H.b Chapter 11.1 requires the P=
E
> and CPU interface to share a power domain, but explicitly allows the
> associated redistributor, distributor, and ITS to remain powered while th=
e
> PE and CPU interface are off. All other GIC power-management behavior is
> IMPLEMENTATION DEFINED. DEN0050D Chapter 4.2, "Generic Interrupt
> Controller (GIC)", says the GICv3 redistributor may live either in the AP
> core power domain or in a relatively always-on parent domain. So after
> CPU_OFF -> CPU_ON a secondary CPU can legitimately come back to a live
> redistributor with GICR_CTLR.EnableLPIs still set.
>=20
> Handle that case in the LPI setup path instead of assuming a fully reset
> redistributor.
>=20
> The LPI path needs special care because the GIC spec makes redistributor
> LPI state sticky and partially implementation defined. IHI0069H.b 5.1.1
> and 5.1.2 say that changing GICR_PROPBASER or GICR_PENDBASER while
> GICR_CTLR.EnableLPIs =3D=3D 1 is UNPREDICTABLE. After clearing EnableLPIs=
,
> software must wait for GICR_CTLR.RWP =3D=3D 0 before touching the pending
> table. The architecture also permits implementations where, once
> EnableLPIs has been set, clearing it again is not guaranteed to work.
> Where an ITS is present, the spec strongly recommends moving LPIs to
> another redistributor before clearing EnableLPIs.
>=20
> Because of that, treat a retained EnableLPIs state as valid when the
> redistributor still points at Xen's expected PROPBASER/PENDBASER tables.
> Only try to clear EnableLPIs when the retained configuration does not
> match Xen's state, and wait for RWP before reprogramming the tables.
>=20
> This is also consistent with platform firmware reality: PSCI and the GIC
> architecture allow platform-specific redistributor power handling, and no=
t
> all platform firmware implementations force a full redistributor power-of=
f
> through implementation-defined controls during CPU_OFF. Xen therefore nee=
ds
> to tolerate retained redistributor state on secondary CPU bring-up.
>=20
> Keep gicv3_populate_rdist() resident as well, because gicv3_cpu_init()
> reuses it on secondary CPU bring-up after init.
>=20
> Tested using Xen's non-boot CPU disable/enable path on Arm
> FVP_Base_RevC-2xAEMvA, both with and without:
> -C gic_distributor.allow-LPIEN-clear=3D1
> -C gic_distributor.GICR-clear-enable-supported=3D1
> and on Orange Pi 5.
>=20
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Thanks for the added TODO comment.

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


