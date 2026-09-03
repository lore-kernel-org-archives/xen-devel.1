Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F63EC624A4
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 12:23:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407096.1640236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x26Ss-0000vp-Fc; Thu, 03 Sep 2026 12:22:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407096.1640236; Thu, 03 Sep 2026 12:22:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x26Ss-0000vi-Cb; Thu, 03 Sep 2026 12:22:46 +0000
Received: by outflank-mailman (input) for mailman id 1407096;
 Thu, 03 Sep 2026 12:22:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1x26Sr-0000vc-3o
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 12:22:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x26Sq-00Eitr-DW
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 14:22:44 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a996684-bab6-0a2a0a5309dd-0a2a4504e83a-38
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 14:22:41 +0200
Received: from [52.101.84.34]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a996690-b57f-0a2a45040019-346554224a37-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 14:22:40 +0200
Received: from AS4P191CA0047.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::22)
 by VI0PR08MB11599.eurprd08.prod.outlook.com (2603:10a6:800:2eb::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 12:22:35 +0000
Received: from AM4PEPF00027A66.eurprd04.prod.outlook.com
 (2603:10a6:20b:657:cafe::9e) by AS4P191CA0047.outlook.office365.com
 (2603:10a6:20b:657::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Thu, 3
 Sep 2026 12:22:35 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A66.mail.protection.outlook.com (10.167.16.91) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Thu, 3 Sep 2026 12:22:34 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by GV1PR08MB10855.eurprd08.prod.outlook.com (2603:10a6:150:161::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 12:21:56 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%6]) with mapi id 15.21.0382.007; Thu, 3 Sep 2026
 12:21:56 +0000
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
 b=LtAFHuF6joQ2lWeC0obXBTM+h+FqWu6Msrst3T8D4ELoYhku4czSJrLaO6tgV98zZiONjdXOdj5fOCGibUsxK1wqET6p6YRwoUYNz6vqh0QuC6Obn22qtizmxKu7rPfIkY9QKoBCheV8A3irWLB0T8OJFmoEWUhYx0qkXvS9GCdzEWD9ycf4stB8j/0FFQs3w6Dw4rZgouSJGwxAW55wdZN9mNZx9Dko9c4LAzPT0GMlKXmru3HPhUc2L26aLF4dvQEhfJo2nDeAQlK7seHrXKedKLL2/uWLjCGYRbDosnEvoiyiljMtVpWTWHUm2ei1y9GCK8ckSXuvNt803Z5kmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJDhisrPT7KRkn9ZUrUZvS4F5Oue3c+POnHTH3QxaO8=;
 b=UY7OvaPLUmrg6nmvduyYTb7EH/8LCI7Ga7ZiR5tQ4D1yoi1NETO8a97054+8/+UK5wuDqoDH6p/lubz1BCdA3wKVjhqbF3OsAKTJ2mojjebVfbRi2ljnxRjswQGUeervGguUfHyChAkaUXZfRaqdS7lKdfI94MN/mhZjA64IhriS6EfooByJcR3ZWsYXmXbCSntzMpmbcS7Nmdn6frIbBHpK3mFNZzb61li80zQUl1eoQrYhbewFVCAKDvFGgvxntDpIOEXhtfvT/mw9aKybP5+4efojgs/ldNEAqDrnxTzb5NCAxQFsEb7ezm8PtMxQ4Aui+wNX74kLQd+FkFmgvw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJDhisrPT7KRkn9ZUrUZvS4F5Oue3c+POnHTH3QxaO8=;
 b=JAxv+fUBlUq/SpHwZrg8Ee/ZTLLe7aOi4dVy5SQZ2Zk+fuP/kKj82WLof7TcuZ5GXbsHrCqi6OIhmqY1B+5SuPIM+jQd9t62ttDRVOAmHixLWWv+mn30OQmhti3PoJRTlt2rcgjQswYSXmlftRahgljVZz67XqhnRbimCYQZwag=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b+sJb+Z599MfNjlJ8scUGxZNoI0ymEZhrOsB9u1jCVVgKM1jo0Bjg/J8Qc1EvO9Nex/sVMNqAuMkv5fe8vgj9b97LaC027iNvN/MYt78Gpw6FSvpBq2JoKDmdmjkspgSDehcWAZVT7FtZbziSAzJhuuBSm+RuDN5TITZz7WzLjjvQy9D99TQXH6ROFRZiRsgIaRDFqtzcReVpUomrgm0Etj0AYskkZqkll4AmO9M1pUgjS8hoj1iQYL16t+zZjrTCh2aVSjKDGvauBDg0ZjyfcNAK9JdcjvSFh0Z355YyCpxn48sHRJt0oimNgOMahVfclfC0jSQu11sLyeJ+BG+QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJDhisrPT7KRkn9ZUrUZvS4F5Oue3c+POnHTH3QxaO8=;
 b=KEhJx/QkdmDxDF7jguEfEJHaUVmTL5ql4oe2GeIJRlm9+ItL/JPhWsFMKuUit5d8uXnoIJ0KjukP10qu9Wm7GkrIGzk+ufxYf+C4KcAz/pSgZFGO4TkVWJq1DThoM/myaO0AGoWRkGKPrZCXqc63fX9QJgTw076PGC+LmI/SemvlN2uY/Jo7SmqYkopR4Jq2vfeREsO4nCVucxYhc6b0I0uUnB+ULiqobKEzajv5WoywCXM7CG1mAFbJNFfA3zmU25zJEF5iO85bdlFZEelc0McceE8MUVLA1cRTT3HShCPNE2caJgNx7ILUPbe8dYW16g0t0iZtPnSR7hM11rnAMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJDhisrPT7KRkn9ZUrUZvS4F5Oue3c+POnHTH3QxaO8=;
 b=JAxv+fUBlUq/SpHwZrg8Ee/ZTLLe7aOi4dVy5SQZ2Zk+fuP/kKj82WLof7TcuZ5GXbsHrCqi6OIhmqY1B+5SuPIM+jQd9t62ttDRVOAmHixLWWv+mn30OQmhti3PoJRTlt2rcgjQswYSXmlftRahgljVZz67XqhnRbimCYQZwag=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Michal Orzel <michal.orzel@amd.com>, Jan
 Setje-Eilers <Jan.SetjeEilers@oracle.com>
Subject: Re: [PATCH 5/6] xen/arm: Rewrite arm_smccc_*() to return by value
Thread-Topic: [PATCH 5/6] xen/arm: Rewrite arm_smccc_*() to return by value
Thread-Index: AQHdOUMMdGYQSoUTg06DeJ9wBORtlLa8ywwA
Date: Thu, 3 Sep 2026 12:21:56 +0000
Message-ID: <3357C375-C5A5-4D93-AE86-86F27B0655DF@arm.com>
References: <20260831121944.2908139-1-andrew.cooper3@citrix.com>
 <20260831121944.2908139-6-andrew.cooper3@citrix.com>
In-Reply-To: <20260831121944.2908139-6-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|GV1PR08MB10855:EE_|AM4PEPF00027A66:EE_|VI0PR08MB11599:EE_
X-MS-Office365-Filtering-Correlation-Id: afc51428-823a-4a5b-a9ce-08df09b60911
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|6133799003|18002099003|22082099003|38070700021|10067099003|4143699003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info-Original:
 Mec+LJhWlcBt1MsWZSXwiE7jAAdl1bvcKxEDoh1iK2SKY90NZAk/AzhkDmVuxgylVIS4PT4d8vQiSbn7RTgeJ5HDV8FGtMDqhV+tmRb+b82ivFoEks5R+OmrEWEAYnI73if+5qGM7DT3t4Wip0dZtyL+Hqx8wc/O8tc7OhhMxADe2263Z5VurXJBYb3Mc+l++AeUzTazPLVjAElDeVsaW2PB5nhwSaQkI2fE9xvrgM0Dw+QNRknZkgIKb6PzzA8DyDpVyeJoIkxi291XJKl3rK+czYcH57Nugbk8YS7JqwRJAbwEzoOGG0BLPbMyFoQY00x+FQfozTthfkBFmZieG5ggA/vlkpeh+N69nP323fpKrAr5jHO9xZhZFwUIosdABQka98HhDDbUF2dfoMhfQqNTEbnYb+zbzXt3MERaAQltxOj/+hStokHkMShPVIi3lpDJ51+ZDLMiziUlTvLcDrWOkGQNx5GCnFpvrK8uaqfqzIKDd9lAMKwpSggh3j7SckVt3LjPYM/Zdq1Niphbrx7QHpB/li53HW985L7E+pixkB4YB2fowsa1YbzO1Z7Gcmv1WYhaH1Pdz06uAZuqNgZ7yMOlxL9SIC04KKjB9kplRQ/w6CDfk1y0ZwRxLVxS2tiyl15b4RGXoad1q1kayQb4pgMXSqY3vYbeKevtiY4xKnItlmjcQVFBwa+O7QGg/PGYPp6BquwgKYn54kdzQ5ulGlKJ+ooTTftSvLZ7ULE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(6133799003)(18002099003)(22082099003)(38070700021)(10067099003)(4143699003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <04CDB87BB48DA844BC34FEC52AC5CF70@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 pcwyDEPcbGlbbibEYhfXqF4RsolJ59NvAEF6yd1QTKyJWNBdHgvonu+rzktFd6XFntUyu0vpfnSvlOqFIa+PHXTkKjoZIsT5+XLyPRVI/1BnQdcb3ao2uvYiwyxl/Sk4e7eHPuWWHmBOOJRGZ3cNkn9eWHljyrD+L/fDuZr5l66UeFiwS3Gsu1qx4RRhtd1YpBhPBLQfrs9eoZrJQwgsINCvVDyrgG98KIdBBiueX2O0jBSVehaWCUGcKmqMikxxUeB7y1bmLsnrdeGV5agv90qhjAuuSIlKrQUuj6wvR6aGgrcbTjcnYy8Tx9LG0igtLN2FLU9XyO1OQ7Rv+M2QFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10855
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A66.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	411d25d8-0b2d-4dbc-b1f7-08df09b5f219
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|23010399003|1800799024|35042699022|82310400026|36860700016|376014|6133799003|18002099003|22082099003|10067099003|4143699003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	C0y+XwqmoNAOmOFZ5AUgebZDkEh4UDAYbpfL+RgRVbTn7ObBab9NEfE9ekG1aHkMVrW8Lym+bD8hgLeGDUYNM28D33woHNze/Zeifd3vlSgnfoRx8iZnkRv0ZHcLqYVu3VyL8U7QeR+9QuIMqZ5omW94qeSCVW2q/tWLmIkzo3Lq7Olxmgf0Qrj1eRY8CfHuSVp8ZsIpqQu1Ib8zkPePgIaU3Yk0WOv6xXxSbQ6s+b0u2P8nb6MD05ZicbhLzasFXky0Ody/155eKU8JyQBybX5vFWOUsbErrwhg2cltecUQnTdNtLwUmZJlhfGCY/zfYk3e3WaEW4wQjG7knaRDXdfz39lEemAf2rEb2KxkQ0R6g29srqcdVTqI3fm7gVnYzYpRsuqA5HsCsz8JzNuvNWnRZ9vk5Ql4bG+fPaP1wST+gtKH2iw7YorYip8kpfEzKv1XszHcFsNhJhAySq9MWWVP+BJF90j+yGtQQBK0f7NyPx2otDYmJFFo0dxm+HJfGBbctU6gL1WRDqshwa3VamNceky3Pdmn8l1Nve1a9me3Cg/g8y0tZcCMhP1RqkBgqSR2iRhBvHKp0avSw49P3OgtxXqucGss6TisdX1jeX6nNMXU3R5OyWNYyqvL9tugQxiZtzd58QEEs9rJoXu3du0TVBlnBGntM0WvHpgWuiQ=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(23010399003)(1800799024)(35042699022)(82310400026)(36860700016)(376014)(6133799003)(18002099003)(22082099003)(10067099003)(4143699003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jgTleyGTQDYNDASXkToBPjT+7ngFXF4pWCcGTtQczmfsbyqsxUsYLpFZpdZv4ZPNrjSlB3O5kdOzWqiBzM+mfZ2xrQZk5i0Umdlfbxmt/sToPaD8uqNFDYsZ5OgiPSg8zdUA3L7M8GFFZ+HZPG2rgi4X+j5/EXAf92q2hbDvGgJ484rufx1BNjPMSJg4vbBXTLenGPxzFGjlmDM0EbnfhlzmAt2k4CzMTApjV4GhIEsh7zFtwLsiYrTScLF4fPg/gQXkqp/dzOjscdnGgv3uvYjsRINoA20iH7RRWnIlmPQgUerne6i2CyrUGbsUjZnQ+9JleHF4Oc2cQirM0nwjm4tKgNgaHPDN4g0CwhhBkhmeiiN0g7vhPD5lNwrOyNl1MTkZScbkQc7DbcJHwIfTM32npdmiELqJjWGdLaHA9fdUnitr2/MVcfVSVI0nypd7
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 12:22:34.9697
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afc51428-823a-4a5b-a9ce-08df09b60911
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A66.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11599
X-purgate-ID: tlsNG-ebf023/1788438160-C06DAB50-2073A522/0/0
X-purgate-type: clean
X-purgate-size: 25190

Hi Andrew,

> On 31 Aug 2026, at 14:19, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>=20
> Use statement expressions to return struct arm_smccc_res which makes the =
code
> read a lot more normally, and avoids needing to pass in NULL in order to =
skip
> return information.
>=20
> More importantly, it removes the local implementation of __count_args() w=
hich
> is off by two and deeply confusing to try and follow.
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
> Xen compiles identically before and after this change, for both arm32 and=
 arm64.
> ---
> xen/arch/arm/cpuerrata.c         | 18 +++----
> xen/arch/arm/include/asm/smccc.h | 87 ++++++++++++++------------------
> xen/arch/arm/platforms/exynos5.c |  2 +-
> xen/arch/arm/platforms/seattle.c |  4 +-
> xen/arch/arm/psci.c              | 17 +++----
> xen/arch/arm/tee/optee.c         | 47 +++++++++--------
> xen/arch/arm/traps.c             |  4 +-
> 7 files changed, 84 insertions(+), 95 deletions(-)
>=20
> diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
> index 3a32183618dc..35ad98d29d14 100644
> --- a/xen/arch/arm/cpuerrata.c
> +++ b/xen/arch/arm/cpuerrata.c
> @@ -179,8 +179,8 @@ static int enable_smccc_arch_workaround_1(void *data)
>     if ( smccc_ver < SMCCC_VERSION(1, 1) )
>         goto warn;
>=20
> -    arm_smccc_1_1_smc(ARM_SMCCC_ARCH_FEATURES_FID,
> -                      ARM_SMCCC_ARCH_WORKAROUND_1_FID, &res);
> +    res =3D arm_smccc_1_1_smc(ARM_SMCCC_ARCH_FEATURES_FID,
> +                            ARM_SMCCC_ARCH_WORKAROUND_1_FID);
>     /* The return value is in the lower 32-bits. */
>     if ( (int)res.a0 < 0 )
>         goto warn;
> @@ -256,8 +256,8 @@ static int enable_spectre_bhb_workaround(void *data)
>         if ( smccc_ver < SMCCC_VERSION(1, 1) )
>             goto warn;
>=20
> -        arm_smccc_1_1_smc(ARM_SMCCC_ARCH_FEATURES_FID,
> -                          ARM_SMCCC_ARCH_WORKAROUND_3_FID, &res);
> +        res =3D arm_smccc_1_1_smc(ARM_SMCCC_ARCH_FEATURES_FID,
> +                                ARM_SMCCC_ARCH_WORKAROUND_3_FID);
>         /* The return value is in the lower 32-bits. */
>         if ( (int)res.a0 < 0 )
>         {
> @@ -398,8 +398,8 @@ static bool has_ssbd_mitigation(const struct arm_cpu_=
capabilities *entry)
>     if ( smccc_ver < SMCCC_VERSION(1, 1) )
>         return false;
>=20
> -    arm_smccc_1_1_smc(ARM_SMCCC_ARCH_FEATURES_FID,
> -                      ARM_SMCCC_ARCH_WORKAROUND_2_FID, &res);
> +    res =3D arm_smccc_1_1_smc(ARM_SMCCC_ARCH_FEATURES_FID,
> +                            ARM_SMCCC_ARCH_WORKAROUND_2_FID);
>=20
>     switch ( (int)res.a0 )
>     {
> @@ -429,7 +429,7 @@ static bool has_ssbd_mitigation(const struct arm_cpu_=
capabilities *entry)
>     case ARM_SSBD_FORCE_DISABLE:
>         printk_once("%s disabled from command-line\n", entry->desc);
>=20
> -        arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 0, NULL);
> +        arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 0);
>         required =3D false;
>         break;
>=20
> @@ -437,7 +437,7 @@ static bool has_ssbd_mitigation(const struct arm_cpu_=
capabilities *entry)
>         if ( required )
>         {
>             this_cpu(ssbd_callback_required) =3D 1;
> -            arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 1, NULL);
> +            arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 1);
>         }
>=20
>         break;
> @@ -445,7 +445,7 @@ static bool has_ssbd_mitigation(const struct arm_cpu_=
capabilities *entry)
>     case ARM_SSBD_FORCE_ENABLE:
>         printk_once("%s forced from command-line\n", entry->desc);
>=20
> -        arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 1, NULL);
> +        arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 1);
>         required =3D true;
>         break;
>=20
> diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/=
smccc.h
> index 8920c54b09a6..ebed2ff7c7d2 100644
> --- a/xen/arch/arm/include/asm/smccc.h
> +++ b/xen/arch/arm/include/asm/smccc.h
> @@ -95,20 +95,14 @@ struct arm_smccc_res {
>     unsigned long a3;
> };
>=20
> -/* SMCCC v1.1 implementation madness follows */
> -#define ___count_args(_0, _1, _2, _3, _4, _5, _6, _7, _8, x, ...) x
> -
> -#define __count_args(...)                               \
> -    ___count_args(__VA_ARGS__, 7, 6, 5, 4, 3, 2, 1, 0)
> -
> -#define __constraint_read_0 "r" (arg0)
> -#define __constraint_read_1 __constraint_read_0, "r" (arg1)
> -#define __constraint_read_2 __constraint_read_1, "r" (arg2)
> -#define __constraint_read_3 __constraint_read_2, "r" (arg3)
> -#define __constraint_read_4 __constraint_read_3, "r" (arg4)
> -#define __constraint_read_5 __constraint_read_4, "r" (arg5)
> -#define __constraint_read_6 __constraint_read_5, "r" (arg6)
> -#define __constraint_read_7 __constraint_read_6, "r" (arg7)
> +#define __constraint_read_1 "r" (arg0)
> +#define __constraint_read_2 __constraint_read_1, "r" (arg1)
> +#define __constraint_read_3 __constraint_read_2, "r" (arg2)
> +#define __constraint_read_4 __constraint_read_3, "r" (arg3)
> +#define __constraint_read_5 __constraint_read_4, "r" (arg4)
> +#define __constraint_read_6 __constraint_read_5, "r" (arg5)
> +#define __constraint_read_7 __constraint_read_6, "r" (arg6)
> +#define __constraint_read_8 __constraint_read_7, "r" (arg7)
>=20
> /*
>  * Macro arguments MUST be evaluated before being assigned to a register
> @@ -117,44 +111,43 @@ struct arm_smccc_res {
>  * This is manual register scheduling for the asm() statement, and any ot=
her
>  * logic to evaluate may clobber the already-scheduled registers.
>  */
> -#define __declare_arg_0(a0, res)                        \
> +#define __declare_arg_1(a0)                             \
>     auto __a0 =3D (uint32_t)(a0);                         \
> -    struct arm_smccc_res    *___res =3D (res);            \
>     register unsigned long  arg0 ASM_REG(0) =3D __a0
>=20
> -#define __declare_arg_1(a0, a1, res)                    \
> +#define __declare_arg_2(a0, a1)                         \
>     auto __a1 =3D (a1);                                   \
> -    __declare_arg_0(a0, res);                           \
> +    __declare_arg_1(a0);                                \
>     register auto           arg1 ASM_REG(1) =3D __a1
>=20
> -#define __declare_arg_2(a0, a1, a2, res)                \
> +#define __declare_arg_3(a0, a1, a2)                     \
>     auto __a2 =3D (a2);                                   \
> -    __declare_arg_1(a0, a1, res);                       \
> +    __declare_arg_2(a0, a1);                            \
>     register auto           arg2 ASM_REG(2) =3D __a2
>=20
> -#define __declare_arg_3(a0, a1, a2, a3, res)            \
> +#define __declare_arg_4(a0, a1, a2, a3)                 \
>     auto __a3 =3D (a3);                                   \
> -    __declare_arg_2(a0, a1, a2, res);                   \
> +    __declare_arg_3(a0, a1, a2);                        \
>     register auto           arg3 ASM_REG(3) =3D __a3
>=20
> -#define __declare_arg_4(a0, a1, a2, a3, a4, res)        \
> +#define __declare_arg_5(a0, a1, a2, a3, a4)             \
>     auto __a4 =3D (a4);                                   \
> -    __declare_arg_3(a0, a1, a2, a3, res);               \
> +    __declare_arg_4(a0, a1, a2, a3);                    \
>     register auto           arg4 ASM_REG(4) =3D __a4
>=20
> -#define __declare_arg_5(a0, a1, a2, a3, a4, a5, res)    \
> +#define __declare_arg_6(a0, a1, a2, a3, a4, a5)         \
>     auto __a5 =3D (a5);                                   \
> -    __declare_arg_4(a0, a1, a2, a3, a4, res);           \
> +    __declare_arg_5(a0, a1, a2, a3, a4);                \
>     register auto           arg5 ASM_REG(5) =3D __a5
>=20
> -#define __declare_arg_6(a0, a1, a2, a3, a4, a5, a6, res)    \
> -    auto __a6 =3D (a6);                                       \
> -    __declare_arg_5(a0, a1, a2, a3, a4, a5, res);           \
> +#define __declare_arg_7(a0, a1, a2, a3, a4, a5, a6)     \
> +    auto __a6 =3D (a6);                                   \
> +    __declare_arg_6(a0, a1, a2, a3, a4, a5);            \
>     register auto           arg6 ASM_REG(6) =3D __a6
>=20
> -#define __declare_arg_7(a0, a1, a2, a3, a4, a5, a6, a7, res)    \
> -    auto __a7 =3D (a7);                                           \
> -    __declare_arg_6(a0, a1, a2, a3, a4, a5, a6, res);           \
> +#define __declare_arg_8(a0, a1, a2, a3, a4, a5, a6, a7) \
> +    auto __a7 =3D (a7);                                   \
> +    __declare_arg_7(a0, a1, a2, a3, a4, a5, a6);        \
>     register auto           arg7 ASM_REG(7) =3D __a7
>=20
> #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
> @@ -181,21 +174,20 @@ struct arm_smccc_res {
>  * makes it stick.
>  */
> #define arm_smccc_1_1_smc(...)                                  \
> -    do {                                                        \
> +    ({                                                          \
>         register unsigned long r0 ASM_REG(0);                   \
>         register unsigned long r1 ASM_REG(1);                   \
>         register unsigned long r2 ASM_REG(2);                   \
>         register unsigned long r3 ASM_REG(3);                   \
> -        __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
> +        __declare_args(count_args(__VA_ARGS__), __VA_ARGS__);   \
>         asm volatile (                                          \
>             "smc #0"                                            \
>             : "=3Dr" (r0), "=3Dr" (r1), "=3Dr" (r2), "=3Dr" (r3)        \
>             : PASTE(__constraint_read_,                         \
> -                    __count_args(__VA_ARGS__))                  \
> +                    count_args(__VA_ARGS__))                    \
>             : "memory" );                                       \
> -        if ( ___res )                                           \
> -            *___res =3D (struct arm_smccc_res){ r0, r1, r2, r3 }; \
> -    } while ( 0 )
> +        (struct arm_smccc_res){ r0, r1, r2, r3 };               \
> +    })
>=20
> /*
>  * The calling convention for arm32 is the same for both SMCCC v1.0 and
> @@ -208,8 +200,8 @@ static inline void arm_smccc_guest_smc(struct cpu_use=
r_regs *regs)
> {
>     struct arm_smccc_res res;
>=20
> -    arm_smccc_1_1_smc(regs->r0, regs->r1, regs->r2, regs->r3,
> -                      regs->r4, regs->r5, regs->r6, regs->r7, &res);
> +    res =3D arm_smccc_1_1_smc(regs->r0, regs->r1, regs->r2, regs->r3,
> +                            regs->r4, regs->r5, regs->r6, regs->r7);
>=20
>     regs->r0 =3D res.a0;
>     regs->r1 =3D res.a1;
> @@ -229,7 +221,7 @@ static inline void arm_smccc_guest_smc(struct cpu_use=
r_regs *regs)
>  * so imply list x4 through x17 as clobbered.
>  */
> #define arm_smccc_smc(...)                                      \
> -    do {                                                        \
> +    ({                                                          \
>         register unsigned long r0  ASM_REG(0);                  \
>         register unsigned long r1  ASM_REG(1);                  \
>         register unsigned long r2  ASM_REG(2);                  \
> @@ -249,7 +241,7 @@ static inline void arm_smccc_guest_smc(struct cpu_use=
r_regs *regs)
>         register unsigned long c15 ASM_REG(15);                 \
>         register unsigned long c16 ASM_REG(16);                 \
>         register unsigned long c17 ASM_REG(17);                 \
> -        __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
> +        __declare_args(count_args(__VA_ARGS__), __VA_ARGS__);   \
>         asm volatile (                                          \
>             "smc #0"                                            \
>             : "=3Dr" (r0),  "=3Dr" (r1),  "=3Dr" (r2),  "=3Dr" (r3),    \
> @@ -258,11 +250,10 @@ static inline void arm_smccc_guest_smc(struct cpu_u=
ser_regs *regs)
>               "=3Dr" (c12), "=3Dr" (c13), "=3Dr" (c14), "=3Dr" (c15),   \
>               "=3Dr" (c16), "=3Dr" (c17)                            \
>             : PASTE(__constraint_read_,                         \
> -                    __count_args(__VA_ARGS__))                  \
> +                    count_args(__VA_ARGS__))                    \
>             : "memory" );                                       \
> -        if ( ___res )                                           \
> -            *___res =3D (struct arm_smccc_res){ r0, r1, r2, r3 }; \
> -    } while ( 0 )
> +        (struct arm_smccc_res){ r0, r1, r2, r3 };               \
> +    })
>=20
> #define arm_smccc_1_1_smc(...) arm_smccc_smc(__VA_ARGS__)
>=20
> @@ -271,8 +262,8 @@ static inline void arm_smccc_guest_smc(struct cpu_use=
r_regs *regs)
> {
>     struct arm_smccc_res res;
>=20
> -    arm_smccc_1_1_smc(regs->x0, regs->x1, regs->x2, regs->x3,
> -                      regs->x4, regs->x5, regs->x6, regs->x7, &res);
> +    res =3D arm_smccc_1_1_smc(regs->x0, regs->x1, regs->x2, regs->x3,
> +                            regs->x4, regs->x5, regs->x6, regs->x7);
>=20
>     regs->x0 =3D res.a0;
>     regs->x1 =3D res.a1;
> diff --git a/xen/arch/arm/platforms/exynos5.c b/xen/arch/arm/platforms/ex=
ynos5.c
> index f7c09520675e..f08d50c1fe38 100644
> --- a/xen/arch/arm/platforms/exynos5.c
> +++ b/xen/arch/arm/platforms/exynos5.c
> @@ -249,7 +249,7 @@ static int exynos5_cpu_up(int cpu)
>     iounmap(power);
>=20
>     if ( secure_firmware )
> -        arm_smccc_smc(SMC_CMD_CPU1BOOT, cpu, NULL);
> +        arm_smccc_smc(SMC_CMD_CPU1BOOT, cpu);
>=20
>     return cpu_up_send_sgi(cpu);
> }
> diff --git a/xen/arch/arm/platforms/seattle.c b/xen/arch/arm/platforms/se=
attle.c
> index 64cc1868c24b..dfa5cf4265c0 100644
> --- a/xen/arch/arm/platforms/seattle.c
> +++ b/xen/arch/arm/platforms/seattle.c
> @@ -33,12 +33,12 @@ static const char * const seattle_dt_compat[] __initc=
onst =3D
>  */
> static void seattle_system_reset(void)
> {
> -    arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_RESET, NULL);
> +    arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_RESET);
> }
>=20
> static void seattle_system_off(void)
> {
> -    arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_OFF, NULL);
> +    arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_OFF);
> }
>=20
> PLATFORM_START(seattle, "SEATTLE")
> diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
> index b6860a776031..634d0d7467cf 100644
> --- a/xen/arch/arm/psci.c
> +++ b/xen/arch/arm/psci.c
> @@ -41,8 +41,8 @@ int call_psci_cpu_on(int cpu)
> {
>     struct arm_smccc_res res;
>=20
> -    arm_smccc_smc(psci_cpu_on_nr, cpu_logical_map(cpu), __pa(init_second=
ary),
> -                  &res);
> +    res =3D arm_smccc_smc(psci_cpu_on_nr, cpu_logical_map(cpu),
> +                        __pa(init_secondary));
>=20
>     return PSCI_RET(res);
> }
> @@ -54,7 +54,7 @@ void call_psci_cpu_off(void)
>         struct arm_smccc_res res;
>=20
>         /* If successfull the PSCI cpu_off call doesn't return */
> -        arm_smccc_smc(PSCI_0_2_FN32_CPU_OFF, &res);
> +        res =3D arm_smccc_smc(PSCI_0_2_FN32_CPU_OFF);
>         panic("PSCI cpu off failed for CPU%d err=3D%d\n", smp_processor_i=
d(),
>               PSCI_RET(res));
>     }
> @@ -63,13 +63,13 @@ void call_psci_cpu_off(void)
> void call_psci_system_off(void)
> {
>     if ( psci_ver > PSCI_VERSION(0, 1) )
> -        arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_OFF, NULL);
> +        arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_OFF);
> }
>=20
> void call_psci_system_reset(void)
> {
>     if ( psci_ver > PSCI_VERSION(0, 1) )
> -        arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_RESET, NULL);
> +        arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_RESET);
> }
>=20
> static int __init psci_features(uint32_t psci_func_id)
> @@ -79,7 +79,7 @@ static int __init psci_features(uint32_t psci_func_id)
>     if ( psci_ver < PSCI_VERSION(1, 0) )
>         return PSCI_NOT_SUPPORTED;
>=20
> -    arm_smccc_smc(PSCI_1_0_FN32_PSCI_FEATURES, psci_func_id, &res);
> +    res =3D arm_smccc_smc(PSCI_1_0_FN32_PSCI_FEATURES, psci_func_id);
>=20
>     return PSCI_RET(res);
> }
> @@ -116,9 +116,8 @@ static void __init psci_init_smccc(void)
>=20
>     if ( psci_features(ARM_SMCCC_VERSION_FID) !=3D PSCI_NOT_SUPPORTED )
>     {
> -        struct arm_smccc_res res;
> +        struct arm_smccc_res res =3D arm_smccc_smc(ARM_SMCCC_VERSION_FID=
);
>=20
> -        arm_smccc_smc(ARM_SMCCC_VERSION_FID, &res);
>         if ( PSCI_RET(res) !=3D ARM_SMCCC_NOT_SUPPORTED )
>             smccc_ver =3D PSCI_RET(res);
>     }
> @@ -191,7 +190,7 @@ static int __init psci_init_0_2(void)
>         }
>     }
>=20
> -    arm_smccc_smc(PSCI_0_2_FN32_PSCI_VERSION, &res);
> +    res =3D arm_smccc_smc(PSCI_0_2_FN32_PSCI_VERSION);
>     psci_ver =3D PSCI_RET(res);
>=20
>     /* For the moment, we only support PSCI 0.2 and PSCI 1.x */
> diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
> index 3d2633237074..e38223d49801 100644
> --- a/xen/arch/arm/tee/optee.c
> +++ b/xen/arch/arm/tee/optee.c
> @@ -178,7 +178,7 @@ static bool optee_probe(void)
>         return false;
>=20
>     /* Check UID */
> -    arm_smccc_smc(ARM_SMCCC_CALL_UID_FID(TRUSTED_OS_END), &resp);
> +    resp =3D arm_smccc_smc(ARM_SMCCC_CALL_UID_FID(TRUSTED_OS_END));
>=20
>     if ( (uint32_t)resp.a0 !=3D OPTEE_MSG_UID_0 ||
>          (uint32_t)resp.a1 !=3D OPTEE_MSG_UID_1 ||

You missed one conversion just after this (line 190):
arm_smccc_smc(OPTEE_SMC_GET_THREAD_COUNT, &resp);

It also needs to be converted.

> @@ -209,7 +209,7 @@ static bool optee_probe(void)
>      * call. It will return OPTEE_SMC_RETURN_UNKNOWN_FUNCTION if
>      * OP-TEE have no virtualization support enabled.
>      */
> -    arm_smccc_smc(OPTEE_SMC_VM_DESTROYED, 0, 0, 0, 0, 0, 0, 0, &resp);
> +    resp =3D arm_smccc_smc(OPTEE_SMC_VM_DESTROYED, 0, 0, 0, 0, 0, 0, 0);
>     if ( resp.a0 =3D=3D OPTEE_SMC_RETURN_UNKNOWN_FUNCTION )
>         return false;
>=20
> @@ -243,8 +243,8 @@ static int optee_domain_init(struct domain *d)
>      *
>      * a7 should be 0, so we can't skip last 6 parameters of arm_smccc_sm=
c()
>      */
> -    arm_smccc_smc(OPTEE_SMC_VM_CREATED, OPTEE_CLIENT_ID(d), 0, 0, 0, 0, =
0, 0,
> -                  &resp);
> +    resp =3D arm_smccc_smc(OPTEE_SMC_VM_CREATED, OPTEE_CLIENT_ID(d),
> +                         0, 0, 0, 0, 0, 0);
>     if ( resp.a0 !=3D OPTEE_SMC_RETURN_OK )
>     {
>         printk(XENLOG_WARNING "%pd: Unable to create OPTEE client: rc =3D=
 0x%X\n",
> @@ -681,8 +681,8 @@ static int optee_relinquish_resources(struct domain *=
d)
>      *
>      * a7 should be 0, so we can't skip last 6 parameters of arm_smccc_sm=
c()
>      */
> -    arm_smccc_smc(OPTEE_SMC_VM_DESTROYED, OPTEE_CLIENT_ID(d), 0, 0, 0, 0=
, 0, 0,
> -                  &resp);
> +    resp =3D arm_smccc_smc(OPTEE_SMC_VM_DESTROYED, OPTEE_CLIENT_ID(d),
> +                         0, 0, 0, 0, 0, 0);
>=20
>     ASSERT(!spin_is_locked(&ctx->lock));
>     ASSERT(!atomic_read(&ctx->call_count));
> @@ -1171,15 +1171,14 @@ static void do_call_with_arg(struct optee_domain =
*ctx,
> {
>     struct arm_smccc_res res;
>=20
> -    arm_smccc_smc(a0, a1, a2, a3, a4, a5, 0, OPTEE_CLIENT_ID(current->do=
main),
> -                  &res);
> +    res =3D arm_smccc_smc(a0, a1, a2, a3, a4, a5, 0, OPTEE_CLIENT_ID(cur=
rent->domain));

This needs wrapping as it is over 80 chars.

>=20
>     if ( OPTEE_SMC_RETURN_IS_RPC(res.a0) )
>     {
>         while ( handle_rpc_return(ctx, &res, regs, call)  =3D=3D -ERESTAR=
T )
>         {
> -            arm_smccc_smc(res.a0, res.a1, res.a2, res.a3, 0, 0, 0,
> -                          OPTEE_CLIENT_ID(current->domain), &res);
> +            res =3D arm_smccc_smc(res.a0, res.a1, res.a2, res.a3, 0, 0, =
0,
> +                                OPTEE_CLIENT_ID(current->domain));
>=20
>             if ( !OPTEE_SMC_RETURN_IS_RPC(res.a0) )
>                 break;
> @@ -1619,8 +1618,8 @@ static void handle_exchange_capabilities(struct cpu=
_user_regs *regs)
>     caps =3D get_user_reg(regs, 1);
>     caps &=3D OPTEE_KNOWN_NSEC_CAPS;
>=20
> -    arm_smccc_smc(OPTEE_SMC_EXCHANGE_CAPABILITIES, caps, 0, 0, 0, 0, 0,
> -                  OPTEE_CLIENT_ID(current->domain), &resp);
> +    resp =3D arm_smccc_smc(OPTEE_SMC_EXCHANGE_CAPABILITIES, caps, 0, 0, =
0, 0, 0,
> +                         OPTEE_CLIENT_ID(current->domain));
>     if ( resp.a0 !=3D OPTEE_SMC_RETURN_OK ) {
>         set_user_reg(regs, 0, resp.a0);
>         return;
> @@ -1664,8 +1663,8 @@ static bool optee_handle_call(struct cpu_user_regs =
*regs)
>         return true;
>=20
>     case OPTEE_SMC_CALLS_UID:
> -        arm_smccc_smc(OPTEE_SMC_CALLS_UID, 0, 0, 0, 0, 0, 0,
> -                      OPTEE_CLIENT_ID(current->domain), &resp);
> +        resp =3D arm_smccc_smc(OPTEE_SMC_CALLS_UID, 0, 0, 0, 0, 0, 0,
> +                             OPTEE_CLIENT_ID(current->domain));
>         set_user_reg(regs, 0, resp.a0);
>         set_user_reg(regs, 1, resp.a1);
>         set_user_reg(regs, 2, resp.a2);
> @@ -1673,15 +1672,15 @@ static bool optee_handle_call(struct cpu_user_reg=
s *regs)
>         return true;
>=20
>     case OPTEE_SMC_CALLS_REVISION:
> -        arm_smccc_smc(OPTEE_SMC_CALLS_REVISION, 0, 0, 0, 0, 0, 0,
> -                      OPTEE_CLIENT_ID(current->domain), &resp);
> +        resp =3D arm_smccc_smc(OPTEE_SMC_CALLS_REVISION, 0, 0, 0, 0, 0, =
0,
> +                             OPTEE_CLIENT_ID(current->domain));
>         set_user_reg(regs, 0, resp.a0);
>         set_user_reg(regs, 1, resp.a1);
>         return true;
>=20
>     case OPTEE_SMC_CALL_GET_OS_UUID:
> -        arm_smccc_smc(OPTEE_SMC_CALL_GET_OS_UUID, 0, 0, 0, 0, 0, 0,
> -                      OPTEE_CLIENT_ID(current->domain),&resp);
> +        resp =3D arm_smccc_smc(OPTEE_SMC_CALL_GET_OS_UUID, 0, 0, 0, 0, 0=
, 0,
> +                             OPTEE_CLIENT_ID(current->domain));
>         set_user_reg(regs, 0, resp.a0);
>         set_user_reg(regs, 1, resp.a1);
>         set_user_reg(regs, 2, resp.a2);
> @@ -1689,21 +1688,21 @@ static bool optee_handle_call(struct cpu_user_reg=
s *regs)
>         return true;
>=20
>     case OPTEE_SMC_CALL_GET_OS_REVISION:
> -        arm_smccc_smc(OPTEE_SMC_CALL_GET_OS_REVISION, 0, 0, 0, 0, 0, 0,
> -                      OPTEE_CLIENT_ID(current->domain), &resp);
> +        resp =3D arm_smccc_smc(OPTEE_SMC_CALL_GET_OS_REVISION, 0, 0, 0, =
0, 0, 0,
> +                             OPTEE_CLIENT_ID(current->domain));
>         set_user_reg(regs, 0, resp.a0);
>         set_user_reg(regs, 1, resp.a1);
>         return true;
>=20
>     case OPTEE_SMC_ENABLE_SHM_CACHE:
> -        arm_smccc_smc(OPTEE_SMC_ENABLE_SHM_CACHE, 0, 0, 0, 0, 0, 0,
> -                      OPTEE_CLIENT_ID(current->domain), &resp);
> +        resp =3D arm_smccc_smc(OPTEE_SMC_ENABLE_SHM_CACHE, 0, 0, 0, 0, 0=
, 0,
> +                             OPTEE_CLIENT_ID(current->domain));
>         set_user_reg(regs, 0, resp.a0);
>         return true;
>=20
>     case OPTEE_SMC_DISABLE_SHM_CACHE:
> -        arm_smccc_smc(OPTEE_SMC_DISABLE_SHM_CACHE, 0, 0, 0, 0, 0, 0,
> -                      OPTEE_CLIENT_ID(current->domain), &resp);
> +        resp =3D arm_smccc_smc(OPTEE_SMC_DISABLE_SHM_CACHE, 0, 0, 0, 0, =
0, 0,
> +                             OPTEE_CLIENT_ID(current->domain));
>         set_user_reg(regs, 0, resp.a0);
>         if ( resp.a0 =3D=3D OPTEE_SMC_RETURN_OK ) {
>             free_shm_rpc(ctx,  regpair_to_uint64(resp.a1, resp.a2));
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 625d229396bb..6a5dcef2aa87 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -1991,7 +1991,7 @@ void asmlinkage enter_hypervisor_from_guest_preirq(=
void)
>=20
>     /* If the guest has disabled the workaround, bring it back on. */
>     if ( needs_ssbd_flip(v) )
> -        arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 1, NULL);
> +        arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 1);
> }
>=20
> /*
> @@ -2334,7 +2334,7 @@ void asmlinkage leave_hypervisor_to_guest(void)
>      * If the guest wants it disabled, so be it...
>      */
>     if ( needs_ssbd_flip(current) )
> -        arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 0, NULL);
> +        arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 0);
> }
>=20
> /*
> --=20
> 2.39.5
>=20

Cheers
Bertrand


