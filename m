Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C18C61DCB
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 13:12:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1402024.1637440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzwN8-0000dD-HQ; Fri, 28 Aug 2026 13:11:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1402024.1637440; Fri, 28 Aug 2026 13:11:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzwN8-0000d6-Dh; Fri, 28 Aug 2026 13:11:54 +0000
Received: by outflank-mailman (input) for mailman id 1402024;
 Fri, 28 Aug 2026 13:11:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wzwN6-0000d0-Vw
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 13:11:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzwN6-000rFV-Al
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 15:11:52 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a9188f7-2eae-0a2a0a5409dd-0a2a45038b1e-42
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 15:11:52 +0200
Received: from [40.107.209.9]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a918916-fae8-0a2a45030019-286bd1092167-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 15:11:52 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by LV3PR03MB7586.namprd03.prod.outlook.com (2603:10b6:408:286::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 13:11:49 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 13:11:49 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zShWBNj2jIDMcg8vUJ/huLUS1IJ7prZrRmWOAaIboEpdkNxCigd+Q7e4dyAoENBLf42n98DKGGe2gp2fxOhhtfE9WGchn2hI0yYiI8moS0CWi7RgXUvzbQH1Fpbgn9DmOSbs33RkWiK2EhPbCiBmDYaMkmFzfL5XTSzM1P0fMs04OiV0tx3PDi6PSY44V71NvPkZCiHh2YyDBx7y2zoGIwjdV9+6dcDc+sA202nzhb+uu6x6UZfD8ZArUdNAnTWDw/kRcd5x0HQ6y2aw8GaRv7Lla/WxWJEGL5x9ZapecH+fh5opkEQZ16Kwz4nutedqqRkF3+bUm9/z5ngN45EVBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m618uZvrNNW+v72teHEjrdAKqzSLZK/Etee0z95QFx4=;
 b=O1Zds4Vv3c3XTt4LGhCrS9jv4G4/Kend6UewnwEOy3sG75OdaT9S22Wq7JjFnIuwOq/31s6Dfu3hKv0jw1tB+iKGGuumHjHknGzBJW2RPA24v8b6TYqrXD5ogMbGRVUmgWdDWSaeMnM7zsJbAnYct31vzLMhnCzn6Sjl7GZBF/d1bLraYmfpjOoC96JQReqg318RctAHMDcPe/cKdYOnvrHmEwtm23iC6VkOG/wzm5EN0/68kz/B2uyVE8QaZEfHITjLdqlo66tRLC5jDmlrf7cFP/jl7GoDQjgJAiKWVk12SGek1Ms3jbbUSYEmoRTWJN9Ry5/wQntQHKGnm4oljA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m618uZvrNNW+v72teHEjrdAKqzSLZK/Etee0z95QFx4=;
 b=bfkWfyPRn35FOlVWT4aaca1+HUR90OE0jHDxjvlzjSp4o9VyJ5r1R7p93EjFv7fC5V1gD0pRNXNqvQogScezFqUb/l9gtIGUe7K/X7qjpRakzlHZDUAUynaXJFmRJLXcjKut3H5vAm1ZBCVW092dWk30gZn+0U1rtLiu3b/hEu0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v1 0/2] Viridian changes for Hyper-V as a guest
Date: Fri, 28 Aug 2026 14:11:40 +0100
Message-ID: <20260828131142.3986110-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0151.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::6) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|LV3PR03MB7586:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d16f6c7-8e87-4b45-116f-08df0505eb4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10067099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	4Bov6t2UlxWIbxm3A25YvQFWrWCoyJp9rICs4Zo7jVvxrq/Z9VmQt+U/JGifsJvyuWSJHMHK2ZYVFpIDrb3qzXLuOFjSDe3+eLGvinOMsQ5orX3aWEqxWc3jSTQSdR9aIVizSKIZf5wpxzshaGnUGz9vBHu59vQmIelfNSgUJ9s9yNxYCCBhvHbJHfSdHLpXH/j7m7vCSv5/u1/XV1cUlncoilXHs3Mz8OmAg19TaoxMVvmU2isOtvC5Ll0C6jXIBtfSdh4kKH6Ok5WXJqBWGxZ+PZXmJWHS30XaFjxa5Qh1KY4J7k7YXlhkv9oGkd6ASp6VsdxG3Mc8RkWyoV5+ybz3QhGSVcagV2ioSy4eugIkr3qz7eRFcHugs3Thf+5bsGcIk8UVYwyoLM9ur2bSuqp6b1iZTmkGQI1jIVwQemQheNHsywHz+/45Seihelv7RptdyEedXtPrAyb/HfPi60+J+qojIWpB23V1r9d9tByWTBXe/H6Mzpa9lmp4CjdvLgna4Mj17xXOEwSslu4NMy/ak8zSKKmxc5A2kSUj9qXPsh1PXib4raf8i2bX5P1hBimzaIWbqDml9moxnDdY2tjbrwESaSKhQApEL8tYTR+TeOaY96+G5dimXnMnoIRFG1g7U47M8RA63j3b0saIsLO02YvjRr673g2+3HzMx2o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ie6AZZYPzCEjGg1YbZvlQN6KQTZFi68QaikTg8nkDf5ryc+YnbrZrzhknuIQ?=
 =?us-ascii?Q?x7SMlAmJOX+cpgfUHrX//Tegc0W+9ZV9RVlaLrt5zzwgyTjXnyMCJ/vFfgMo?=
 =?us-ascii?Q?HGLCzzlkleZHFskGNKQDdRJWCe8LQN/goviHDlG9XHqma/tps1Yx0z4/xPk+?=
 =?us-ascii?Q?fu6YeSjPG32q5jQqN2M93caFuYfsfLVJ9mf+tP+RyjvPAC07hrdlrN+KC6Cw?=
 =?us-ascii?Q?ZLRtt5i0NP1Ota7c/WUo56VkjdlMaPwf+qdYyEqzaNS+Z89xb22Qh3pzm7fv?=
 =?us-ascii?Q?5QXsiI0vNCkfZJqSMou1czPVmJJyQ4Q6/RNaPuxabnTLo5jzloh1V12qxKRV?=
 =?us-ascii?Q?9bsLvpKDux//kyboS07EA45rs89YwBvnDXkSbnZtNN3N+BT5vLxYr3VHzzfr?=
 =?us-ascii?Q?3NtBj3PbBYVBIYw26+DtFhlbqLMjhgvfbW5kiVCF1fbZoWXp9f6PIJK+tV7p?=
 =?us-ascii?Q?zRcR5TjagUVCEy5rvSeJ5X6EFnhcLNpIl7kGnSyzg/yVTWTgcUUqiOM68rXC?=
 =?us-ascii?Q?8YYfU/bQiAYj/zbbebrDrrf7lGl+5Cc1Re8JryzEjfALDpeqR3V68Qsyk0X+?=
 =?us-ascii?Q?vLytza3vy+ToiMxHM2FJiwhgT/UcPiYLzhPgCzN5DFxArc29hKGXYZ2z3lH7?=
 =?us-ascii?Q?Cz7IprWzYoqA7ccSFYXYnHkKU6g//E65XFSE8CH5n+w1/eP11r0I041nrUHB?=
 =?us-ascii?Q?OxoZT6MtkWHfYqs/7KokrrABlqd1sElbidzNObAudM3OupL8rpV3YUic1sTC?=
 =?us-ascii?Q?Cl4BWcUbK5Hyi9I9/+WeO6rSifpzC2WAwUhqdCFIAqMcuWrFLeiHYLBHK2OJ?=
 =?us-ascii?Q?1rGSqEYsHByL/brX7amseb+Y9mmRXsibG1FrMntALGdu8Fsnlf+RE3eC6SnR?=
 =?us-ascii?Q?nmZuYDjazNX3BllPRSeR0+ORmG8kYx2pX7JHeHgavGb05dlgBjItOEGMSIZx?=
 =?us-ascii?Q?ZDk3xl/1XOt55vdAC+djCkXYyAykwlIzdEvIKtTpZY6w+rVNZnBuezBEwjHE?=
 =?us-ascii?Q?wT7UkevAW5bFXudDyYlywZosOn/TEp8rPzNXiF9uz0KWEB+7mq/edCq4BOmR?=
 =?us-ascii?Q?HjYoX0qBvYrnRgPe4JDy228oXLcISHYQzAG5UzwznH4kjBnSY2wqSH2KlG5I?=
 =?us-ascii?Q?Y2xPVgeTSnIfu69Gnq6jAhV+wqMhH2oFu4nwnAaNKcc6kbwTEn1jrCOGulwq?=
 =?us-ascii?Q?gHCiG4aZORGX7/NKaBijRLhUWHmG9PinkQ+TJA2BjFTnJw/AUdLasn1gswUj?=
 =?us-ascii?Q?8gFd44noI8ucxTd3cJnw6JYVbxKXAbkuAgFP1eC1d7D0PjsCcTfpLQn7kU3e?=
 =?us-ascii?Q?Ok+RHo30rPCY1JsBZBScbLiZniVjMI8LhjrZhwsI6Yb+2PPznBqryx1ISzzz?=
 =?us-ascii?Q?RIUcCIfKDgGuOLjdR/JuAbFDarpcUzAL358SwgM+nfxQjlxaXJ6/DjzQ5/JE?=
 =?us-ascii?Q?4ROjO5yqHewYs7n8pzlEu6C5qA4KsyjLcKNn1EhpxMoz1EmkQTkWe3/lyVQn?=
 =?us-ascii?Q?235+YK2GFt/H0OCyuudxap6GMyejRNzzEpl5zegSMrmGJgcWEQNkBF7pyxpk?=
 =?us-ascii?Q?QvYLhteXouaStAUdnsjO7SbnJELM/p09qT2IECvV1hWXKlrwGuexx2Y+u9XR?=
 =?us-ascii?Q?czYnwEit0kWq7v4Na3edajBLC4SlGzAM3n5YwULpz66rz6rQl7MvzznHCG3+?=
 =?us-ascii?Q?1gXC1/TTvzVLGDqC8VtModi0zt+jiZtt6TMKJ4j3Q4GzKUxt+eRbedJnnVM0?=
 =?us-ascii?Q?bgYRGEN0ICwdnoZfEPo2jw/UJRI6ZDo=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d16f6c7-8e87-4b45-116f-08df0505eb4f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 13:11:49.1500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uXBEJZH0ASGc5vQcin1slyxvzC8m8NCfNNLpyIL1VM4hfg6WdVqupO3fqssfFk+mh55rQp0WlfmrPB83P+XGZ/tK0TkpfPBrrjq4tdt8XjU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7586
X-purgate-ID: tlsNG-33051d/1787922712-6D8D54E9-C1BA1F13/0/0
X-purgate-type: clean
X-purgate-size: 638

Hi,

Here are two changes to get the existing Virdian enlightenments working
when running a Windows 11 guest with Hyper-V enabled

Hyper-V also depends on some unimplemented MSRs to boot, but that will
be addressed in a separate series.

Thanks,
Ross


Ross Lagerwall (2):
  x86/viridian: Workaround Hyper-V GP fault writing to MSR
  x86/viridian: Implement synthetic timer direct mode

 xen/arch/x86/hvm/viridian/synic.c    |  3 +++
 xen/arch/x86/hvm/viridian/time.c     | 25 +++++++++++++++++++------
 xen/arch/x86/hvm/viridian/viridian.c |  3 +++
 3 files changed, 25 insertions(+), 6 deletions(-)

-- 
2.53.0


