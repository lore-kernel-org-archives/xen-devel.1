Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F464C5B572
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 06:40:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394641.1633314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwZxh-00054e-Ho; Wed, 19 Aug 2026 06:39:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394641.1633314; Wed, 19 Aug 2026 06:39:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwZxh-00054X-Eh; Wed, 19 Aug 2026 06:39:45 +0000
Received: by outflank-mailman (input) for mailman id 1394641;
 Wed, 19 Aug 2026 06:39:44 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1wwZxf-00054R-LV
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 06:39:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwZxf-008IAx-2B
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 08:39:43 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a854f99-e002-0a2a0a5209dd-0a2a4508c4bc-24
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 08:39:42 +0200
Received: from [52.101.83.24]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a854fad-f659-0a2a45080019-3465531807b6-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 08:39:41 +0200
Received: from DU2P251CA0016.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::18)
 by AS8PR08MB7337.eurprd08.prod.outlook.com (2603:10a6:20b:444::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 06:39:36 +0000
Received: from DU6PEPF00009525.eurprd02.prod.outlook.com
 (2603:10a6:10:230:cafe::65) by DU2P251CA0016.outlook.office365.com
 (2603:10a6:10:230::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Wed, 19
 Aug 2026 06:39:36 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009525.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3 via
 Frontend Transport; Wed, 19 Aug 2026 06:39:35 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AS8PR08MB6599.eurprd08.prod.outlook.com (2603:10a6:20b:332::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 06:39:03 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%6]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 06:39:03 +0000
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
 b=JVB+MhqXPF5c3iWwBFv2TER6uvLSHinvHUtyBFdYswfC4mx7HSyF7GYxXI1+KQ5eB7MdPNUtSCkftFgWBOS57WSUdbbsiM4kNu/mwRLL3mn/OmsYk7hjs5Nh4A3gv9JQs+oekByjSiyzDM43z4BAoiMGst88iL7/ZerwfaaCVAl5adkAW0jgYUVYK71gEMou3jDA7tKDjO/txrL5Oh2Xl+yv2zmMvHig8VFqOI0Z4fjKvB3H7oOwb6Fyh09GV8XafNl3j04dz8cDw8aFmTvshvqy3YGvGpd3+3xXCK0PY/FJnQ0OB4VRXS2nJBkSMh366ddc4H57sebabc2xy5ZQIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZacAcQDsE5OOl2iLFSsAvmPjBCOQWiDF5j/s9C5nOYA=;
 b=fzY43MG+SRdx005ZdPrnUqTMeJCuM1QFldpVU6w3XSjs85qipdhcM04Ecyp0fN1MkkkRUnHWRI4iAeYJ8lyf/93wZTiaOUo0nV3V1Didv1u5aFtyaBBuWaKR+5m3T/J3SS+1QUPUroIKUsIQdtZWv3DAU1F8iGYHF64Ga0lfUyWiClCxqwqHPqB63ycBBzSE+fxMETBcrVHxKNMAitVxKYwUixq47PjE15LyaltfCQZLuq0vL9VYeRcoKytrzC7Ldvq89rybqPqWlXoqKR8ZUd/kezBsYjj9eIzoWb2A6VqLuETHHGe3FPB0fgMQxt9Ay4UEJdpnW3th/H6/NVQMGA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZacAcQDsE5OOl2iLFSsAvmPjBCOQWiDF5j/s9C5nOYA=;
 b=Ri8Aog0Md/7Fb4SXEiXklY4+Yme4XldRlTa+2zzFv6ndrHITpBm/1/3sRk7onOKCxn/BZqsWx+gefcSBtzGHcRrp/D8TO2ToqMDqLEFvdNCuFSDQ6KPjWtHdq/ZUSGYUKTZ0aLZGJc7BcyCJybvrzmYNGs8aRLUnUf2FlY3LbMc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cvP/PXRNniBKhf033xnWToOsjHXAdoMAiraWMLGOAo/oFFf2TiH2SlY/x342bSnWy7vt434xc3tDfem564ca9rtz20/JvtrSE93KvAi8DMIzkGjn0qkOOiiELFMp7M3vS5NmDZR5zeUeCrQ8/SydAAIioRwpR/CCpYGewdfgr/Z8qVFtOK/xqIKnbjgf/JigOpgQ2H4obFWSluFIALHRJEhKDywqYNsKeThsdFLoUK/6D9dUXlHubdEypSHI+AVpKX6J9Knnef1DniSPa0QXkCgo68/ScwrZ2EhRG4maTzf7W7V0wYKkWvoK6lFUgKx6xJjrbHBFqZJViqGgufUaEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZacAcQDsE5OOl2iLFSsAvmPjBCOQWiDF5j/s9C5nOYA=;
 b=k9CeA1KNHjwojVujJ1HPzTtcDb32S0B1UqLBMLwZOwPtxF2u/oMe3goLvbCsyPNAyn9mgToiNbZOUIo8J1jG8B6OZDQuJrYJMY9lDBEi8ksxLYAo3PMZcF+rEggJkVofoZPkLLEu4akHoZNHlQ1jKgLw0i3HxfQNxIt9rTARA4gRV1LuEhCx5JxPS39u5MZhyY3jmk7i/4YgBn+6QD+m+2qCwDmnuJUMt7Nc4L7VtjGJzBE/yozDniUFm0Lg2OjJbQeOqFh3SQHxedjmtSHz1CxQwtqowAcxB/QRJk7YaIO36R8ftIZ8Pi6/iT1lj2J5skXxbCLXM2RpXteKbX2/gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZacAcQDsE5OOl2iLFSsAvmPjBCOQWiDF5j/s9C5nOYA=;
 b=Ri8Aog0Md/7Fb4SXEiXklY4+Yme4XldRlTa+2zzFv6ndrHITpBm/1/3sRk7onOKCxn/BZqsWx+gefcSBtzGHcRrp/D8TO2ToqMDqLEFvdNCuFSDQ6KPjWtHdq/ZUSGYUKTZ0aLZGJc7BcyCJybvrzmYNGs8aRLUnUf2FlY3LbMc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Jens Wiklander
	<jenswi@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] xen/arm: ffa: Harden SEND2 against invented loads
Thread-Topic: [PATCH] xen/arm: ffa: Harden SEND2 against invented loads
Thread-Index: AQHdLwt9ezGusG27iE6LBf89mJZswbajv3sAgAANaoCAABXGgIABCguA
Date: Wed, 19 Aug 2026 06:39:03 +0000
Message-ID: <57EE3124-D60E-485B-ACDE-4F9431BA7F3E@arm.com>
References:
 <1b483ce633bfa7d304cb78458ce029370691f00c.1787055320.git.bertrand.marquis@arm.com>
 <d739485a-72cc-4518-afa9-8d2692a225ae@citrix.com>
 <7F03E2BE-44A0-41E9-850C-8480CA0C8F0D@arm.com>
 <07151e7f-3179-4432-b7fe-e70890f1ba4f@citrix.com>
In-Reply-To: <07151e7f-3179-4432-b7fe-e70890f1ba4f@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AS8PR08MB6599:EE_|DU6PEPF00009525:EE_|AS8PR08MB7337:EE_
X-MS-Office365-Filtering-Correlation-Id: f554c3d7-fa0c-410f-3dde-08defdbca2a9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|56012099006|4143699003|10067099003|11063799006|18002099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 xgbdQYEaldSHoKcJu009GOliaL+VhTRPRQQhjlvagk3YTvFa3NoMsCz3jm7opgdu2YkG3w0SLyWCSuPAp75jhPOqVIxTnXFBklDnttgfsrb7E+Ec89Pe+u/4Mn4hCYiv85TMlPZy1egu8h0QX0bTjspHf7xogUPAOESVGl1V21qAWkVeITSNtu0hPMx5FtXC1fjEOI7H1/oTa7nuoToSfRtF9iKPLdzWZU1d1UgYXW96rt6cQq6ebprpi9KtzA83vpyNmEMuWE28cm6Ymks/oT91RUHXeS9vJ5mxBEzjj6783D68vqsp2HVPFbF2iLDWuhGZ8bLxARpwxCrwZu5r07bui7P8dr6yM7MZyvnXl7dY5fvWloR3P89aTmKKEFfaG+mUnifq6vJpU/toiaRr7jO+cPVBG5DAEJ2yxuRnOXSwiM8KLvzx9imlsqOgye9GYmAYDIdUaaGd/TZfNmXcY0VSjJHkFAQdlnMV8XRQSWoZr2+ttFCZFzqf81bkC4qUbPxxgTDYNpNfKX12IFauMN1WWGBf9oggspf6HhNiBQ/nnLq5wo7/RX3doVHGsZmzmbgOB9vu0NLmz/UHKpRv541HS5Y06Y+FELjc5PUFvj3SpUsT1BmOqhBElkhKe0FWFukgw1HGIjv36QRYF7O6phTfOnsoGEKCpBAd7uT2ixtSnE51z/Wpdkx+6qXwysEd4pticIcXfKM95cMJgNkZRIQoqMTHL4SMlH5rYmlet0E=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(4143699003)(10067099003)(11063799006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B48B6C0AACDEDA4A8391139B42FEFC11@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 eaNeOJ6Q88z9Eb9D3fPynkOEsMZS6pdz1oSQOrydI5g1RL21E6KkKmy9io7DPdj2FINk6z5k3ZPMkrtC4uULHAA1fjiiBbVUp55en2heepJQblfoePFk1cTvvZMnAppMftJ6iS5iLO49ZhClP/qc1K5+PzWWQ+prX2Iv4nnWZAH7FVOBeG0118qgb4cf6fLAdocKy7pJ9wRA5gkKRrLZdqNbYW5TfbGHU0hbtKQADWQB5T1mqeKBsyn+M09zPVVliVKKObFq35Dl8U/Zh/a1bR1DGo/d7awE4qIopo+DKCv7YRqQqkThTQ9Jeod5VS3/FySc+Lo4l3hBzMNT9vwxRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6599
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b3c018b4-98e7-447b-a512-08defdbc8fa5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|14060799003|82310400026|35042699022|376014|36860700016|4143699003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8S9GJI2I2sGYqW9NYoJ4oKSvZkkf1uXAZIP8gDQhFzUMVA+ao8UkhSzuSvZxXTcETHy/fdKYiGrpFmYd/N98GNADrp6+LO9p+b/UqFZRurchUf6DtQkzk1IaLhUBvIEZkVTyEdXl7Yax+OT+RjPRkOD9NPE/yg6/g9eoKAXORp5tZW7WcFLlNqItBHKFyqlDzDb/dLc3HWZYrxXKJpN9SvFibwWPBps3wFNBLzDVGaLfANeTAJ8Jn1753ibJvn/gX2FFWJQY/M+crjxfLBbwgEm5L1ZMu+BV/iYOjZBFaEbF120vgSo3SiCGKNJG1wKG1xpckKanu8Ro8EOLbEb4+/IVH/5OOj7EYKRrhV2pbF5weTCq/YVjTNJfXqBCj1MfF8t1VRmXLMxRLsVqycXHuKRSgKBkp4DKXlogLheh1oBFKACnLD7p7k3ZKpysuNjgefnVe8uH75eedw4T+oiHCaD/556fnRZbijdKn87vgeVMBKASXmtBM210KSRpcEU+9+suFLgcWo2nVEqKC63eHnNGRgIqGH4XwE2KEybOxoxlLci8fnajm0/VsxyzXPaNY7QffDok6iGXfVds9dSDsbR5SBLcmvscCF1PVQnbSU3NCsYQ9qzibsOs4fG6DQd368CyCBK8cPmqigBa6JxrppgQ04uJBx6lMKUD8eam+n1kFcuBFJRT4QOsShIot2RfVfwPa9vVZ31H5KJoEVD1MA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(14060799003)(82310400026)(35042699022)(376014)(36860700016)(4143699003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	f+uaSCbYCMDQQZ2HNV7Zq1BFGQXDu/Lcrq1I0/j5iMaWzYws203llt6vSndEuT9PzsYzr1MhCAnzq8vru5CNFAc8YaKXXFI5y5gRsAipKy+GDgsotEocgiyuXj3OeTbNfpeOr8K82AGwLZOqkqzbmwtvDGR4rqBG7RWhNeGEf4Mxk+9PXILzHpfBIdxj7Iy4VXZmtbPcwl5hWxuI5UrSL9Wm5NCbDxyJ4Z5P9AQqYAdJ9CAeeyIbkV2AHBX54/nrN1xPOGvPCKhv36phKS6shPt9sgrxReM7zk/5IcdzrKrDB9epLlXYUBKZUA1MXEchMNUraXhUcxk7ZT+Ph9JR90lHtnBopofrNV/ZxaCcb8uXYn02ow4yYcVM1uOHm2B1fL7ryO9N2zyGkPjxR5QnFNqpmV9EraEA99wrqSQF+Rxdq6jFbMfYqVjkZArQaU4p
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 06:39:35.6886
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f554c3d7-fa0c-410f-3dde-08defdbca2a9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7337
X-purgate-ID: tlsNG-c1860d/1787121582-D654487B-052157AC/0/0
X-purgate-type: clean
X-purgate-size: 3535

Hi Andrew,

> On 18 Aug 2026, at 16:46, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>=20
> On 18/08/2026 2:28 pm, Bertrand Marquis wrote:
>> Hi Andrew,
>>=20
>>> On 18 Aug 2026, at 14:40, Andrew Cooper <andrew.cooper3@citrix.com> wro=
te:
>>>=20
>>> On 18/08/2026 1:16 pm, Bertrand Marquis wrote:
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
>>>> +     */
>>>> +    barrier();
>>>>=20
>>>>    src_id =3D src_msg.send_recv_id >> 16;
>>>>    dst_id =3D src_msg.send_recv_id & GENMASK(15,0);
>>> This does look to be adequate to fix the potential issue, but you shoul=
d
>>> drop the ACCESS_ONCE(src_ctx->guest_vers) a little lower down.
>>>=20
>>> With a safe copy on the stack, there's no need to further inhibit
>>> optimisations around it.  In fact, it's unclear why e040b94d0fff added
>>> the ACCESS_ONCE() in the first place, seeing as it was already an
>>> on-stack object at the time.
>> the ACCESS_ONCE is protecting the access to guest_vers which is not on t=
he stack
>> but a value on an internal context accessed by all VMs.
>>=20
>> You probably mixed src_MSG with src_CTX ?
> Oh, maybe.  Those really ought to have more distinct names.

No worries.=20
Would you consider renaming them a requirement for this patch?=20
If not, I would prefer to keep this fix focused on adding the barrier and a=
void unrelated churn.

Cheers
Bertrand

>=20
> ~Andrew


