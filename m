Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B2EC624D3
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 12:09:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408391.1641002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Sjt-0007nm-5W; Fri, 04 Sep 2026 12:09:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408391.1641002; Fri, 04 Sep 2026 12:09:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Sjt-0007nd-2H; Fri, 04 Sep 2026 12:09:49 +0000
Received: by outflank-mailman (input) for mailman id 1408391;
 Fri, 04 Sep 2026 12:09:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1x2Sjr-0007nL-Fp
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 12:09:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2Sjq-004SOL-SV
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 14:09:46 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a9ab502-bab6-0a2a0a5309dd-0a2a450c9f2e-4
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 14:09:42 +0200
Received: from [52.101.70.41]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a9ab505-f479-0a2a450c0019-346546292b1c-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 14:09:42 +0200
Received: from PAYP264CA0035.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:11f::22)
 by GV2PR08MB8413.eurprd08.prod.outlook.com (2603:10a6:150:c3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 12:09:33 +0000
Received: from MI3PEPF00008550.eurprd05.prod.outlook.com
 (2603:10a6:102:11f:cafe::45) by PAYP264CA0035.outlook.office365.com
 (2603:10a6:102:11f::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Fri, 4
 Sep 2026 12:09:33 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MI3PEPF00008550.mail.protection.outlook.com (10.167.240.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Fri, 4 Sep 2026 12:09:32 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DU0PR08MB9050.eurprd08.prod.outlook.com (2603:10a6:10:47a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 12:08:59 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%6]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 12:08:59 +0000
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
 b=RBvhPrRj563kcxqA5bEEBOdifPB3g71mnUdbkTqPKOBAZyNtRH1jRB1KHTdytHwvjjDKf0xmqgU/slx4SahR0dxIiIfBQ995ZSZitYdpk0Hbcrw27wFG6y4qad+AeMZvqCL2A1BJ019PFdeRlmSe1W+rYRoAh5CWxQSsbCK5240pZDt5NJwwFh926ZTemkxLIZQ/VQLgwZUJXWkJX5j4EBx+5yq9o/OZuw0RxeKZ8gCV7gZ+/WZoGn9L7ZHXkA2wc5ELcB634JStRm5PFpobMRP/AOi5JZFMq1rg7kXJRB0uqGrKyn0ZExLR9cjSM1nJpEroTe/Y2RFAIIaXR1jRFw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOytzZh/5HlhwJyTF14TzukEBwFY6/0ffjgYTXdK2YQ=;
 b=q/akePR8BPdK5kE3jYZj2QMJ6RKVK8VuwlJCnhKAlW/Km1G17yIfgJRjw75ghk7mXCej1vUrhvkBXjk96trKNvLUNQRRDJiyrEy20U8+FPOH1pZ+qC4flEzbU3S5b2+LQWWuGc+DJzMt3odDWqjW5PjRPIYw8mlmfh2P8Qt0cprW51Y69fbWe3d4i20mZkIP1/XgVkJLJLqtM1XYsZ5nIQ3wrw+nny17emLoz58x6SKknr1XajVEh7tIiZfNwsh7KpYcu3Lpc9grqmN+F9olN1UqWCK9NRCEmBYzmf2nQpjK2sNBitsVsH8gm26d0YPHmBsQ1VqCk5qv0qvsY6SKZQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QOytzZh/5HlhwJyTF14TzukEBwFY6/0ffjgYTXdK2YQ=;
 b=f1RQ3OO6JwSBwbedjbKMmy6hNtlikxfSC3/JJKL5zpOfiR3QNQxQMMiRkSAUL3aEq8Meza5jqaBEr049xfIJwQmETr90wW/ju4B+XMdysO077R6A5/P5nedfyrDwJnaIpVTG/y5Djj+q5IqPNf8SgfxcK5QmEmQMOYlPru1ddDI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FfVihgfT6o+4lbI5eA4cIoGbWylFBENVEtPe8wSpdLkLgRR5POnuO17649bP7nDaKbIm1fwbZYUuSaqXvtVfJvfm0hk46kOVuzd+YRPwdK4E/+HTXfh7kghjAu6a+hiQVmOBCCgkuBlMExxHd0cI94RSUBOsnh0BS2z72PWTgfEmdFwSDE5k9gKFTWWxKbf0ojy9wmPsiJDMHOEfwCSLzW72yHcxEGFJEPUbA4gbhiA5LEweC0gAK0MezUtxW6DgaAi8fkDjrKfv3Gem2LdWhLSWHuO0mhDfahMPoajrHJ8gunyfbipjMbIp45mK9qZFPKbTjpHLX4xChz6C32e+Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOytzZh/5HlhwJyTF14TzukEBwFY6/0ffjgYTXdK2YQ=;
 b=xYtpAMw+dTwaoasmv7Mp4C5GTlj8JRhkoUeOcD1PBclooxZXjpiwrV2omcNRRRN5cEAsE4PsI+9Bwl37NubdWwYMJrFS59/psYNN2zbzmANGwAIyS+U7MSf/ghzzP3O+MWJJDtcto0TkeEVVMI4CGscGUlxS2MMO5HfEyzT/SWD0WlLktzrRTE6pWJV55h3GNSFc+Q3i0dlDltOxFmfNu1XYrXtpNEH3vJGjnyu47UMeNG1gufjkL+SZ3snuSXpzpmouM/th24Y3u2rWUgmX8FBg6j8Au1pMKXmGpZ+KLMNp9RUZWSK/S7GJym8lqg3w3oseTdqVTzrUBJmonmwD+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QOytzZh/5HlhwJyTF14TzukEBwFY6/0ffjgYTXdK2YQ=;
 b=f1RQ3OO6JwSBwbedjbKMmy6hNtlikxfSC3/JJKL5zpOfiR3QNQxQMMiRkSAUL3aEq8Meza5jqaBEr049xfIJwQmETr90wW/ju4B+XMdysO077R6A5/P5nedfyrDwJnaIpVTG/y5Djj+q5IqPNf8SgfxcK5QmEmQMOYlPru1ddDI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Michal Orzel <michal.orzel@amd.com>, Jan
 Setje-Eilers <Jan.SetjeEilers@oracle.com>
Subject: Re: [PATCH v2 4/5] xen/arm: Rewrite arm_smccc_smc() for arm64
Thread-Topic: [PATCH v2 4/5] xen/arm: Rewrite arm_smccc_smc() for arm64
Thread-Index: AQHdPF5OKtIIWDItQUCAcbYOebdKZ7a+U4sA
Date: Fri, 4 Sep 2026 12:08:59 +0000
Message-ID: <28333BBC-9E6C-4F87-B70E-2A6EA427462B@arm.com>
References: <20260904111228.3022634-1-andrew.cooper3@citrix.com>
 <20260904111228.3022634-5-andrew.cooper3@citrix.com>
In-Reply-To: <20260904111228.3022634-5-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DU0PR08MB9050:EE_|MI3PEPF00008550:EE_|GV2PR08MB8413:EE_
X-MS-Office365-Filtering-Correlation-Id: 36bc6f5e-4e24-4cdf-bce3-08df0a7d6139
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|56012099006|10067099003|11063799006|4143699003|3023799007|18002099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 IJRbty9F8dgpwye+5C2l+TQUpZBX0a5DR/IOzttcCsJbGifqcjVsnQWuhAlW4/Fl5ojReM20SrXErN8vJLXpzFDMN4a0x1gBOF4TZ9ElToWAiuTtJjP3Z7C4ltWz0ZLmks3AIwatjttDh1YBF5qOA8bOCB8fNulWVprcbjipz4Z1Yi8wE6gFz0chAnW9ub00sfAFu5Pnk0cfNUJ3sbNwdzGcBP0ThE3vYNKzsuzxZSQWSqTfQ55nP3hVotvpdRShSZzIHFXLEf+TE0oRTksSjPaSqMwt8QDO1cQrb2S1MwGIVPldpYCSshIxzcC2yiZhXEvnAZhDpxWu4ASXbsAHiMBob0HexRa/VGA3BW4vW8PqqEl5Kj9GgxFFsXNcRG8igNBudGzp8ZrYB1CKM4Acrwo+CwPi3grQvncT+d2t8wnnpCev4dgKBogJ+RFbYg8G02xMf4xUHFnC+jPliERUDHVp2hWmmiraqOHpppgyR9LyYWecU42fUDTWOM3mJuTNxziK6vqgKC5zAP+zwHukoA9Lc3df2NaiDZuNuB3oySBA0l7E3lYP06oCPEuLiWT/BEbKqMicRI3wY0zVA87xjSlzv53BYjp4AXlzHAvLSaqAGo63/ydie7jzIN+24IsT4YTMJmtKJa9F/8LK67Am75gnUrvWEZLbhsfFdMte/LYlImMlKDHg8B+RJGqNl6nEeURSsfuy/Nam/IIio6oIDElK/MTZxEZNEEgGTErXHNs=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(4143699003)(3023799007)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A3F10C582ACD3141A12E9D72ADE588D3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 bvCm1VmdL/a3r3z5K6oFy2TQPYQBqSlGYtWkiNpLhCNgbDyHqxUF8B0DjBrezIdLToNMauuJVul8Y2T8PWjXpU4nZ5E5GGoUO/c65sykMY5sCiY15STFB0fL7drwUhpgGKX1czYcIDIWflc2k/7lh1AhLDC5FTrbvoXzjtJaKFNzzgTurudaeIdSeeDaNL47TiTUt4oVKmKB6tqZmWyuJdnz7t95mikWtsbkDL0KGmk11YQDZc20GQRmxO+WycP3Yh0+yqeskivhgEeb4ER1IUExuJSuh8BiO6/cVcftVoNir6NOtOQQmgSoEn3CMidTKJqOpfPJz1o2y2yma9Gt7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9050
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MI3PEPF00008550.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ed03a81b-b600-4220-ca3d-08df0a7d4d2a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|35042699022|23010399003|14060799003|36860700016|82310400026|1800799024|11063799006|10067099003|4143699003|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	JUAFPGyHFO7yZtjujOqq8p7HMN3CiuEEn6uVN2KF6D7UZ7+NoYxKg2CBg2f7yqChGv4Y00QMnWKkVWIt4qvBcWgb0NJlvLa1UE2ZMeAYU5RsPjUXYpwVJWyz2n9fLPPjHVzURD4KKieU9SunQr0AmyO5R/Q70DXbAlbcrZ9Venf8Rz9wxaeM5IFf6PUVhDvebgzis4u/G2e+XxKTBvmxMEGBjzXWYwo7gYLqEZTUpUeatW2jf5t+nvVVZdwQVRaRMJLDRUtU112ZvwQTMyR7aVOolBqaQ5qiRCHG0/NJHet6yRtohgptVORaPVbLl8hd7SZDTCs2+zOP9NGnWRP/QumB6dqtcWVGPlzkwoA6b0sXeOuUTsj3IS3s203UzSXWZBelzYGZ+3/p0oqoROo6F7z+z1ptzTpgzlSdmR/OW0QKkpbBhd3lkGjZa8MoNjOgbO8zed/M4P14foOnb+lPGG/jFWYZ27BnYOHE+lt/TRe+bN6TruHgqCSojBbFvBdyji/5+lLKRsxRepsQ1QHRRKnnsf624MWv4MBFcfqOXlHB+P++YzhuE+ivlkMGsJ6RH30Eboy/wteudiJflfsDHFh4ukK1gOb6MRuXYC15AveLgqobDSQQ3fT0yCLQh+anI1zYQdviISr8X8+BEA3QoSgfwv2T5jEIozsganq62uM=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(23010399003)(14060799003)(36860700016)(82310400026)(1800799024)(11063799006)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9w+ztd038/dL4l5Lo4rbUTeJ5uk6CxzinsgxbKherzbdzdhLMAlNmd6T5fVnhzByZEZ6+vPoHLH3OUMnvKL/gYzMw9aRZTh8MemuwpYE7+yyI/er5eM9iNkY/LrcvHJ+3IRBb7TpLvIJB0n34TBIQKf7o3Ponbi4/rqLluAfZQhT7ex9zgofeGk4A5fHGiyF2wKYi4PnbVPYcVUQadtBsjb/aSGaDVZDMXu2LqUg2pucdRpmNTIZDMJcxqub4LjPr7YI9ZuCYBzucFvtych+nHPlmvZKtGajNOxr72Ktj/Cqbo7FX5L9r2zcMlpY3MxAAR3ydX0wRSgYMuIQyiq3yVS7OSq6pccSN9h9p7CJ8tH2SbXhXkVzMXUmvqLwxHrrEw4HkaQZGsfCPbMhvkQTOM/dhuvojLhmAr4QGDaNH02l5CDHKWnJfs3wmUnwv7Nu
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 12:09:32.6289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36bc6f5e-4e24-4cdf-bce3-08df0a7d6139
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008550.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8413
X-purgate-ID: tlsNG-d25034/1788523782-77AD4A5B-B0D5E2FE/0/0
X-purgate-type: clean
X-purgate-size: 10423

Hi Andrew,

> On 4 Sep 2026, at 13:12, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>=20
> SMCCC v1.0 says that x4 through x17 may be clobbered.  SMCCC v1.1 says th=
ey
> are strictly preserved, and SMCCC v1.2 permits them to contain extra retu=
rn
> values.
>=20
> Xen deals with this by having __arm_smccc_1_0_smc() as an out-of-line
> function, but this causes awful code generation in arm_smccc_smc().
> cpus_have_const_cap() is opaque to the optimiser, so we end up with one b=
asic
> block doing the reasonably-ok arm_smccc_1_1_smc() code generation and a s=
econd
> basic block setting up all 8 input registers even when they're not needed=
,
> spilling or discarding x8 through x17, and calling an out-of-line functio=
n.
>=20
> Remove __arm_smccc_1_0_smc() entirely, and rewrite arm_smccc_smc() to dec=
lare
> x4 through x17 as clobbered.
>=20
> This fully inlines the SMC, is a single basic block which instructs the
> compiler to spill or discard the potentially clobbered registers, and onl=
y
> sets up the necessary number of arguments for the call.
>=20
> No functional change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Lot better thanks for the fixes.

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>
>=20
> v2:
> * s/PSCI/SMCCC/g
> * Rewrite the comment for the new arm_smccc_smc().
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
> is more amenable to having SMCCC v1.2 worked into it too.
> ---
> xen/arch/arm/arm64/smc.S         | 16 ------
> xen/arch/arm/include/asm/smccc.h | 92 ++++++++++++++++----------------
> 2 files changed, 45 insertions(+), 63 deletions(-)
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
> index 5fe54013ac83..4ed2a40ed0ac 100644
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
> @@ -218,53 +219,50 @@ static inline void arm_smccc_guest_smc(struct cpu_u=
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
> + * Make an SMC call compatible with both SMCCC v1.1 and v1.0.
> + *
> + * SMCCC v1.0 says that x4 through x17 are clobbered.  SMCCC v1.1 says t=
hey
> + * are strictly preserved.  Always mark x4 through x17 as clobbered.
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
> +        /* Potentially clobbered in SMCCC v1.0 */               \
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


