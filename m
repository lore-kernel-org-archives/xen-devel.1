Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701CBC624DE
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 12:08:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408369.1640974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Shw-0005yB-9W; Fri, 04 Sep 2026 12:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408369.1640974; Fri, 04 Sep 2026 12:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Shw-0005y4-6w; Fri, 04 Sep 2026 12:07:48 +0000
Received: by outflank-mailman (input) for mailman id 1408369;
 Fri, 04 Sep 2026 12:07:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1x2Shu-0005xm-8o
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 12:07:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2Sht-005ilj-Kp
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 14:07:45 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a9ab483-8faa-0a2a0a5109dd-0a2a450c9b4e-20
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 14:07:45 +0200
Received: from [52.101.83.68]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a9ab48b-f479-0a2a450c0019-34655344bc18-4
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 14:07:40 +0200
Received: from AS4P251CA0023.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::20)
 by VI0PR08MB10894.eurprd08.prod.outlook.com (2603:10a6:800:258::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 12:07:31 +0000
Received: from DU6PEPF00009528.eurprd02.prod.outlook.com
 (2603:10a6:20b:5d3:cafe::6e) by AS4P251CA0023.outlook.office365.com
 (2603:10a6:20b:5d3::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Fri, 4
 Sep 2026 12:07:31 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009528.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8 via
 Frontend Transport; Fri, 4 Sep 2026 12:07:30 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DU0PR08MB9050.eurprd08.prod.outlook.com (2603:10a6:10:47a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 12:06:56 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%6]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 12:06:55 +0000
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
 b=dU0+ivHTChEgqqUah5TBhKwZCNxZXR/O2ycmJaV4EoPkl9gi3lb4r1hMlQ1N3bl/ENxTxwmZlaJOnPzEgtctbUo8/48sammMScG3UVVY1eADQ3SVzixpY5lB/L4BgMekNd6UNN7fLBhVFnA0jbE5cElXeYlr2/EVg3fVodWxaJthITkrbQUtbaijgaYjZDivvF0YHNNyE2/lbYUjQLcluxVt34EnKlg639nTuk3qCw5Y0yWvoFzFfVL7gAuEGxXvMz9PZJWWrgAH4fpG6Izg2dSd9T9b+IEUVJEOdtN2f+Oul/7ngiTK7kwCjyg1V/Hntl6Z89CtDwQmYnxBqbiOQg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHH2LJGq2s9bmE7lTon0qixFJJZHEon2hXaujTVIQss=;
 b=NqFohXAkv9b1YiaclXT8JzJ0knx0FSWvsnckikyAFiRLi+6VxpKl4ZQDEEAPmwIS8bIUII0WvsmvqKo6TamgRaiqtqgZHzMfD9tKDoEX7zDOlTjY+47WVufRNKDUhL+Bh1BO50beTMqyHfIbt9rZfZO8amlM27YbDDEid1lf3LxYgLcp+E4X6KJA1Dz/4q7AeLV1iDswx5VmCeHjhA1vmP7eY1uzUVW9Cn1W3OH1bKiE7U310O85GTY+TcH2Zwc7MjPlaTs++Ww4gcsC1+xploR8g/NTDCO5ATWnioL7L8rXFGypkADpuScoQ/jRaf8xgDTImmQAoag+JADz/m77cA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHH2LJGq2s9bmE7lTon0qixFJJZHEon2hXaujTVIQss=;
 b=AdUQ2J9mOHXlB/WvLeBwq/D/UGC+CDnJeuds9f4vVX1P8RNMPTeUiOTXoj2380O0hCzPYY6Yl/e/SB+g7mz1HpktSITPLlD55u7Z6K+pRcY+p7PNh9ZvXIiM4ed/e7QkoBlMRp4T1Ijpcqz454EM2Wlj3E3os7vgiMNdzYRzjRw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bDS9om4Plii9H4WdKEmQ0kFuGyD6SGSCbISnvggmvtsxipG+W0ukRYEKu7OUpis45jplj9wxKS3xa6D7IsznN5grc8/Q1ie5bCtoOzOUds6ImU3jftYrQVx0dCP5m3soIWCJhGyh4X5WO45e/VY2y9u8T+7UsWwoaryRxs5YsPFAIDbl3IwBD6mf5BE3xUxFzgluv/Ddd0F5vaBelVYxXLdSSed0GiG10lNhNZykLiiYhtOsSNgCdkuriVkqOU/PMiWhUop0r7FElHuodl5diStMYiQFAX12Y+b1AJVlT+H/m89u3UYLDn/6jHNlxTZeQtlZEehAO2r0LPIOYgYDYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHH2LJGq2s9bmE7lTon0qixFJJZHEon2hXaujTVIQss=;
 b=b5a3cEW3bNny6L+rJgFWsZLGW1n512E4oa5tjZarFO7Bi12Qpcm4y3fS4xfBf9b0Kuth929rczfn7o+f5Osp2mbd4WrEvYK0i8r0BxIk9x1uvwNjiCsKOsxEghsYZoIv3EBGCOy1+2732xvZ6Eu0Ihv1Raruiz4d3q8jP3/jRdovAgu3ftGlxKIwOrNGavdXh/4rnN8yJTEE/mI7N5GiFxNaZXizvLSplxCj3J4yvPrVgYyDVodJFsz3/af19XBcJiJsXsZM3B86xqeNqarE1+WqafNlTJ8uRBVOP2kNEL7A8Yug6Urn23aZQL0BjDayWFUqnrZ85svx7g4k5Ahckw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHH2LJGq2s9bmE7lTon0qixFJJZHEon2hXaujTVIQss=;
 b=AdUQ2J9mOHXlB/WvLeBwq/D/UGC+CDnJeuds9f4vVX1P8RNMPTeUiOTXoj2380O0hCzPYY6Yl/e/SB+g7mz1HpktSITPLlD55u7Z6K+pRcY+p7PNh9ZvXIiM4ed/e7QkoBlMRp4T1Ijpcqz454EM2Wlj3E3os7vgiMNdzYRzjRw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Setje-Eilers
	<Jan.SetjeEilers@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 1/5] xen/arm: Fix evaluation of parameters for SMCCC
 calls
Thread-Topic: [PATCH v2 1/5] xen/arm: Fix evaluation of parameters for SMCCC
 calls
Thread-Index: AQHdPF5LioCdLX4zMEeYNEbpyTgPEba+UviA
Date: Fri, 4 Sep 2026 12:06:55 +0000
Message-ID: <0F45E34D-1828-43C7-9386-3339DC4E0E93@arm.com>
References: <20260904111228.3022634-1-andrew.cooper3@citrix.com>
 <20260904111228.3022634-2-andrew.cooper3@citrix.com>
In-Reply-To: <20260904111228.3022634-2-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DU0PR08MB9050:EE_|DU6PEPF00009528:EE_|VI0PR08MB10894:EE_
X-MS-Office365-Filtering-Correlation-Id: 210b40d8-595c-434b-648b-08df0a7d1846
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 eMvvweTv0D9bQTHgC4qo/VmzprAQOhqnLx4Tlb13/CzlzyWhsyqLu7saKwL2nrrE2mqUHODXQB/5d+g8XDCgpLEs1eoapMlXliRLKfFGtN6vgF6Q6WYIhASSCB8Cs4bxvQVW4/71hKascqWFMywdHi6dtZv2juTrucxv8MFBHIL7ggF/YtUCxwfIsrAiYoEEtnrl9MMVAjG1FuliNqWEkpPvpYkam6MSq/XMmSnQD2JBwVqW5B7d1Ur/Bo+jn+Jrh8AA7W+bkycc/p6I+/gPySWau0lMnYFlyFmNfMWzCWnjxm67L9b8Uo6nJRQWjUCoKElTc6gd10pt7pJgL/nbehOtzNVaTzaGYKMU6M+HGs3YBr2cMeApeVLhQuGflLD0lTZklzjyPk7swokRZj/eCQuSO0xiF0ngqWu4dVdXSIBKP5XYEE2eqqZ5n67AEmijQHu7kl6jD1WVOvUbZCEXA9h37/iWTRSbvkBN/y4TSQ6d0Bihjdfv96k2+/yIZb+ET6DFR/IJDjextW8ZZ1mfCe4UsxCKUmTYapJRpDd89j4nZwJ4FD9ZFt94WoPmdRccXtVFVnPohprbNX49rLy6tHXNA5jI5CYyP0bFbX/ljQ5IqK23GJ4+27xiHmmuZ1mDyJ/PIcAoRbQaczQ3b6uIQ336zvXsb5CR79JXdqNUoYAqO+LN03QyUcNoW97nWq7zDE8AXGTpzcr1CqbySDhqPEAUHQKeYoYE0i3PagBr6FY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A18DBE4F4B108F45B2862EB11495D5AA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 HU/lcOyw1XakJt5ATmUoGTA97zSqSFlKpxzbg2AYw8jPpWGdTFiMpCsrk76aCDiLsCGnHcRFn3eynFlTZ1JRJNrTZBZjM0XUGv9lYaDr74zehZJPQrQYsbq01MM0oissh/Exq0wrMYoBzw+Iv1KWeR6PpMJCafe8aTi9P4XjHRICxdf0/5ohVaxuj9XpFRq9QhngKLAQU+TzqDAthJX4E1FmYd9wniJ/3Al52/SW7IfKBvJd/s7LGIoYUgsypLuOorvbJWrkh0Jj7reMvHnVB2qMyBCyeqD6NHDJb/9kxh7joOKTx3VWqi8DeDcDxo8gcuxlHhIHQ5WkXQ30otmGJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9050
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8febf785-2bad-444c-1f75-08df0a7d03b2
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|14060799003|23010399003|36860700016|82310400026|35042699022|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	LiKLAoB/F9+zc/f+4VGnXiNrW94GeXgyoHe+fsGQDPqM4KqfsATQMlvGsNON9SM9YONFKcrL395aHNXFtH7KkuJ1lv/0ZHQ8phCommEa84KDKVF1lyw5qBAwXxOwp9b7lJ7Zt9/4BfD80A7QjgtETrJb9FOpBFo9ouLFFuYOG9PpHBhdzCD8hnI9A85m5SuHqfxRwFZMWLMSrVldscmOnFTWyQrS3Aeq8nowhtzd8aaAn4OfJtgw4ZI8j8aX16OY4IASS/iwPnJzK5gFcLlVLwGpwIm1Sx6Ts/kjZtBWybg5RO2uva8NqngmZj41dhsm+PFU0D+GOdTY3gkvlY5z5aY1FhC7FbiH2AZ/ihZk9aBHny3OuU5MGm53pvTlt4vRFs/UNi7rDznB2LsqyMkU/7vtYQ1BEPaP91aWQzPvJfxmlUW0ipciQBqIZkNBE+tIoUTXefSimGnuAkszZXeTjS50gZqttsjxHeD9ydyMWooVH0ysy6aVz9Mn0dFtuS9B28de1PcxzKlUV+8V038NIzBAld2Z7LtG3HOhl2la/UNJnasB37TR1oBCxYJYTgYcfbKJHsQXd9lg7HmKAnn5zZQnB51+GhAxnSn59wn8X3uxfM1/WnhHDQ+hWSygXnfmz1RH05vrW8t6dHYMklXi+lZyhp8LfWXq3D90x1OlNT4=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(14060799003)(23010399003)(36860700016)(82310400026)(35042699022)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Wi3dUCDuEOSAalSgPBZIe746YTis1gZNcYsPzaLK/ncKHNuClJUeV7iaza0tficFE97GdcH+rTVY/iLylwW2bG3g9PRWwgHui+Up7sp/PyyF6tKxlxRnmLeT0HrvDoHNDv/00Nbytrss5W5H5VG2W83Kyy9Bnz8xjh0b9k3+WskgdvD1555VGuIL7AT9aLmWwyYfBsQDDczgHN2xH61cBojmSvo72NsZFENoFykbFiutvwnhOruBve+bg9WmEwLnkSqtyBKjZbmEjMKo+iMubTKDhFhdbz60OZ6Efa4yoz49KGYX/98L6SvR7X1qeAlaMb2zn8TKMP5LvPmBqY2x/lOJ0xXubDWZJLBnDMA1LGe5rJz/S/25iPn7tke9M2o6e8jlusUeG4TjP0LbTp9yUQT+Exfb1aq6BybxRzti+tSMzQrcTRyCjN1Aln7H4mqp
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 12:07:30.3243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 210b40d8-595c-434b-648b-08df0a7d1846
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10894
X-purgate-ID: tlsNG-d25034/1788523665-5290EA5B-4A7CE097/0/0
X-purgate-type: clean
X-purgate-size: 5122

Hi Andrew,

> On 4 Sep 2026, at 13:12, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>=20
> Contrary to what was claimed in commit 67bcf5eae709 ("xen/arm: Simplify t=
ype
> handling for SMCCC declarations"), there is an important reason to retain=
 the
> intermediate variable.  It is unsafe to have any logic between the assign=
ment
> of the register variabes and the asm() block they're used in.

One small typo here s/variabes/variables/

You can fix on commit and retain my R-b

Cheers
Bertrand

>=20
> This logically reverts commit 67bcf5eae709 ("xen/arm: Simplify type handl=
ing
> for SMCCC declarations") while retaining the conversions from commit
> 7f15d5d13221 ("xen/treewide: More typeof() -> auto conversions").
>=20
> Adjust __declare_arg_0() to match.  It happens to be safe because it's th=
e
> first register expression once all macros are expanded, but it really sho=
uld
> be consistent with the others.
>=20
> Leave a comment explaining why they must be written like this.
>=20
> Fixes: 67bcf5eae709 ("xen/arm: Simplify type handling for SMCCC declarati=
ons")
> Reported-by: Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>
> ---
> xen/arch/arm/include/asm/smccc.h | 31 +++++++++++++++++++++++--------
> 1 file changed, 23 insertions(+), 8 deletions(-)
>=20
> diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/=
smccc.h
> index 62c6985e7315..53cdddb690b7 100644
> --- a/xen/arch/arm/include/asm/smccc.h
> +++ b/xen/arch/arm/include/asm/smccc.h
> @@ -108,37 +108,52 @@ struct arm_smccc_res {
> #define __constraint_read_6 __constraint_read_5, "r" (arg6)
> #define __constraint_read_7 __constraint_read_6, "r" (arg7)
>=20
> +/*
> + * Macro arguments MUST be evaluated before being assigned to a register
> + * variable.
> + *
> + * This is manual register scheduling for the asm() statement, and any o=
ther
> + * logic to evaluate may clobber the already-scheduled registers.
> + */
> #define __declare_arg_0(a0, res)                            \
> +    auto __a0 =3D (uint32_t)(a0);                             \
>     struct arm_smccc_res    *___res =3D (res);                \
> -    register unsigned long  arg0 ASM_REG(0) =3D (uint32_t)(a0)
> +    register unsigned long  arg0 ASM_REG(0) =3D __a0
>=20
> #define __declare_arg_1(a0, a1, res)                        \
> +    auto __a1 =3D (a1);                                       \
>     __declare_arg_0(a0, res);                               \
> -    register auto           arg1 ASM_REG(1) =3D (a1)
> +    register auto           arg1 ASM_REG(1) =3D __a1
>=20
> #define __declare_arg_2(a0, a1, a2, res)                    \
> +    auto __a2 =3D (a2);                                       \
>     __declare_arg_1(a0, a1, res);                           \
> -    register auto           arg2 ASM_REG(2) =3D (a2)
> +    register auto           arg2 ASM_REG(2) =3D __a2
>=20
> #define __declare_arg_3(a0, a1, a2, a3, res)                \
> +    auto __a3 =3D (a3);                                       \
>     __declare_arg_2(a0, a1, a2, res);                       \
> -    register auto           arg3 ASM_REG(3) =3D (a3)
> +    register auto           arg3 ASM_REG(3) =3D __a3
>=20
> #define __declare_arg_4(a0, a1, a2, a3, a4, res)        \
> +    auto __a4 =3D (a4);                                   \
>     __declare_arg_3(a0, a1, a2, a3, res);               \
> -    register auto           arg4 ASM_REG(4) =3D (a4)
> +    register auto           arg4 ASM_REG(4) =3D __a4
>=20
> #define __declare_arg_5(a0, a1, a2, a3, a4, a5, res)    \
> +    auto __a5 =3D (a5);                                   \
>     __declare_arg_4(a0, a1, a2, a3, a4, res);           \
> -    register auto           arg5 ASM_REG(5) =3D (a5)
> +    register auto           arg5 ASM_REG(5) =3D __a5
>=20
> #define __declare_arg_6(a0, a1, a2, a3, a4, a5, a6, res)    \
> +    auto __a6 =3D (a6);                                       \
>     __declare_arg_5(a0, a1, a2, a3, a4, a5, res);           \
> -    register auto           arg6 ASM_REG(6) =3D (a6)
> +    register auto           arg6 ASM_REG(6) =3D __a6
>=20
> #define __declare_arg_7(a0, a1, a2, a3, a4, a5, a6, a7, res)    \
> +    auto __a7 =3D (a7);                                           \
>     __declare_arg_6(a0, a1, a2, a3, a4, a5, a6, res);           \
> -    register auto           arg7 ASM_REG(7) =3D (a7)
> +    register auto           arg7 ASM_REG(7) =3D __a7
>=20
> #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
> #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
> --=20
> 2.39.5
>=20


