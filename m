Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107F4C98304
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 15:28:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430893.1653305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9OtI-0006fc-TU; Wed, 23 Sep 2026 15:28:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430893.1653305; Wed, 23 Sep 2026 15:28:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9OtI-0006fV-QG; Wed, 23 Sep 2026 15:28:12 +0000
Received: by outflank-mailman (input) for mailman id 1430893;
 Wed, 23 Sep 2026 15:28:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1x9OtH-0006f9-Ew
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:28:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9OtG-002ZOH-Rq
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 17:28:10 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6ab3f004-8faa-0a2a0a5109dd-0a2a4505cae2-14
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 17:28:09 +0200
Received: from [40.107.162.67]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6ab3f009-4cb1-0a2a45050019-286ba243cc57-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 17:28:09 +0200
Received: from DUZPR01CA0287.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::29) by DB9PR08MB6603.eurprd08.prod.outlook.com
 (2603:10a6:10:25a::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 15:28:03 +0000
Received: from DU2PEPF00028D0A.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::6d) by DUZPR01CA0287.outlook.office365.com
 (2603:10a6:10:4b7::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.16 via Frontend Transport; Wed,
 23 Sep 2026 15:28:03 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0A.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Wed, 23 Sep 2026 15:28:03 +0000
Received: from DBAPR08MB5590.eurprd08.prod.outlook.com (2603:10a6:10:1aa::17)
 by GV1PR08MB7348.eurprd08.prod.outlook.com (2603:10a6:150:23::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 15:27:26 +0000
Received: from DBAPR08MB5590.eurprd08.prod.outlook.com
 ([fe80::f68e:1311:9070:68b]) by DBAPR08MB5590.eurprd08.prod.outlook.com
 ([fe80::f68e:1311:9070:68b%5]) with mapi id 15.21.0472.004; Wed, 23 Sep 2026
 15:27:25 +0000
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
 b=kmFto8GYScB4qlt4+Nn5noaewkw9K5aJpLweigDZJlfOhT9sqtm6Zp2BReMoLsfcAWkVUfyHjpmf25CBlllCmA9fDv7tkBDIyEtGJuZPX3L35NZmuO+Wsa7Mo6YEU2YIE/zyedE6ZEHww4GRfQoQpyzcG9C2Q4wxMEDvwzkwB+R6Y60viNnsEmPcDHqflRxeTbwNdKWRdAk31aQhls4sC0Nb2t3/ixmC3h5iSx1acCXUqcEU7OF+SeDggIPtdmcWfOarlcPsciAmKJt4OeiX9U6Iz70I8vshaKeQZSYR3ltXgJXlRQgpECyDat0rVvjR5iaozvnr8e1F5PmZ24dMxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPnnU/bovfMLMFk7Fz37gjc4NKrWmTRVmNUudIt/WoA=;
 b=GNcFOHz/+KIUxIAXMG8eTbbYEa9RCpIHHxRXcjAtBTBtZIgY1/whpiE3k9asWzaSsJ3RqYbx2SdoI784LpG8FKz+khea8C/tF61kcw+kth+mHRtnIthsf+a4dKMg6Wtr0kc8WUi1l+TRQAu7IZd0NhqebtzVwpCA+DkG9mviWQGm+XiWEDJe5WM25awlxueaO6LI+XFY+yBXeg+c75Fsp1qP+Y3KZLJbbqJkGU831OTFswLIKGEUTzaa5GwyUOxKXLlGElcpk3hiZy87WuDrDBg5wVU2w1f78yodIuuYpYSMLLcRqK1Vbr1wb8s67bCxazj1jswgrL49UWVCUD4GHg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPnnU/bovfMLMFk7Fz37gjc4NKrWmTRVmNUudIt/WoA=;
 b=gEeLU5NJESNm6jRKV/96cFsWKWOdI0wID3zHh6yl06W0t3zJkanADPBlOmXgnyHSZ+n/s6Uw/zY003GYBjr0bFKoQpCM6+JJyFOVZ0HIsdfT3NhjTd2leDefly9Zx+GMpDKRQjvjTWlgJSV3PY2ICZpICdEoTEokjO2vdt+A5Co=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mmK6I3X/+Q4duqDQ/4XiE2rOkie0xM1AQWk+1ERk30/0cPMyiiR+ZG+0M7KoAJ3kRgF2t3pOIA+1MI3xvQUAcL1ZAk++DA1C5Sbvllzvp6Uz0guNrRLI2dUjv8QrkPDVzmxI3g5p9fVoZnAoPwcJdycvgwjtSpPiArCl/OCIZUT8uj9W0w4nc1/aoqHDxMeT2cSARj4GpT9ojr3ktaa8FmcpKSTORPbWLTQSZ2jGeDYrmX7e8PwoofgAEJVU8JRbx+owlcLQh4udjIZQEy7R6fKmGhQEaNNk8tQfXcnbRRsOLbbqDX9QLDjRv0wgchOpHY+24VxbPetUNO3hkbUWKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPnnU/bovfMLMFk7Fz37gjc4NKrWmTRVmNUudIt/WoA=;
 b=iibPoN+F4tTtAOcBhIRxdARRmPrNvPDQY77U5HHFH5izY7mJcMuwCb30rteud6JZLIkq5nqMyN35e/xMDG3fS0VVE/JKybyWGtFq2QUWkBpO5CJSDs1x8XhV97ZEcwMACdH/9rcYV4LrC0ZOSnZxAxHV/dcvaylKQMTloXiO0EvQQvS5IMXdGqEC5685hBOgTo7A/36fUmNMhoM04Sh3ZL7KwGd47kuyqbHhfKjG8gQIFAFPgUwR4Aj5Ph4JoRs2YAUpeOBPKXwRsgVWHpPT37c2t8x4u/g7mFJS1YYd1t7hroxKADFjod+qWwgUXZgqXJpJELlEycc7Ryncu0pNlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPnnU/bovfMLMFk7Fz37gjc4NKrWmTRVmNUudIt/WoA=;
 b=gEeLU5NJESNm6jRKV/96cFsWKWOdI0wID3zHh6yl06W0t3zJkanADPBlOmXgnyHSZ+n/s6Uw/zY003GYBjr0bFKoQpCM6+JJyFOVZ0HIsdfT3NhjTd2leDefly9Zx+GMpDKRQjvjTWlgJSV3PY2ICZpICdEoTEokjO2vdt+A5Co=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykola Kvach <mykola_kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Luca Fancellu <Luca.Fancellu@arm.com>
Subject: Re: [PATCH v12 02/13] xen/arm: gic-v2: Implement GIC suspend/resume
 functions
Thread-Topic: [PATCH v12 02/13] xen/arm: gic-v2: Implement GIC suspend/resume
 functions
Thread-Index: AQHdNjDkV92bkh6okkqfhA392pMLzbbcc6SA
Date: Wed, 23 Sep 2026 15:27:25 +0000
Message-ID: <DD46DB7E-3D4A-46BB-9AD0-D529CDDA4113@arm.com>
References: <cover.1787838455.git.mykola_kvach@epam.com>
 <dbdba04cd531cf2f3ccfc0b7e8dbcb4925b25055.1787838455.git.mykola_kvach@epam.com>
In-Reply-To:
 <dbdba04cd531cf2f3ccfc0b7e8dbcb4925b25055.1787838455.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5590:EE_|GV1PR08MB7348:EE_|DU2PEPF00028D0A:EE_|DB9PR08MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: 589f9c86-765a-45c8-2b84-08df1987422d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|4143699003|6133799003|56012099006|22082099003|18002099003|20046099003|11063799006|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 rTzAftJg4uhfGextcAJIwRRojvra6mryEVuipo06qWgXJ7oHgO7+8lJ8RvxGHcWwnJ2JEo8nHhh6EdgnegiObv9+jkL5zSxeOwp1VEykG9C6HOwN21JOrqC9GlfzTHT2QViJR+wY4k92bUmsolYv9vt0Av8l2LO+WaG4y1YYuiX+fEHwle4C6BiLzXisyadXYeqj7uZyx4vCMr0E/J2qQtay5kiwoZ1brOsHjg6fA3HE16cj+sGIUL3Is6VmKnZtVYooVbd6Q/YDn/sxdcQdSpRSLZkwqkBvpoJsINzcixHcjVqm3NHqKWiRfiZAbPY/bOdP4y93YVQeypGyuViyM3BA6n59gMeEshVlRp+LCSKJP1bn8WyRy1HXLbXvK+ZIM508frAkK2kQJ5S8NkSbHf5n9dBHoLvQLUMGX35TKo/Bs4ONLdxjyrSj/cdnrPqeG/ufXC4Wj81vWlHwphQRD+NGL+6+wtLWN764cZw9bQUdSx04LvgOnrRzXhY4ciqlmV0yWHd5Rw5cJawzrsYWWfByUyDCgAAecNe1T5o7WJJQb76P3sN50FntdaRJL6VgNWOPP2inZYjEv2Q0ZTh6XS1afYlgDONXH471yGjtB0H4chl6hjHJorrfqbb3zoPuY6q1nfF4ARzWemXmao/jiiIk3MM/+v7+H6uhUyOZgTmq+sM0+vv/PXDFMqHuEfmBKqYi5jVEwazcMwj9jvLMoNaxzSUrGWReEw1jTPPRTc0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5590.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(4143699003)(6133799003)(56012099006)(22082099003)(18002099003)(20046099003)(11063799006)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <63FF8F03AD858D4AB1775DC97014E8DB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 W2F3/revURwvDmq7JWWOvGwwvEmfVYsOsqFB+NPR82K2jVSPQWS9apz3ot68lggS/nuKk5wJqavRpzsAgMycFicN4AtO15bZ/zVawH89zK/CrN6U9Pyt4J4fMbLJg757VcmBPo4/RcdZzwyo3U188vV9YU0/5h/NEOH8jphOH0bxIAuWntuOBZ1UDcppI1g94LFXatzW7ln3iMtJn8uSwI/JrzXwVwHwK2uz6V/TVja+5dLXNewRSvRF6rrk7cxGDjcRI0r2TfLISfWFHSboP2b3p0vAET2LoX3qNNZseTFIpTvqdaKF3Ns8dfKfJJeFi5tRKp3rJbFXOsslazL3kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7348
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D0A.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	20691a91-c1ee-43fa-82aa-08df19872bf4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|36860700016|35042699022|14060799003|82310400026|6133799003|10067099003|11063799006|56012099006|4143699003|18002099003|20046099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BiRyb4jNQwewQD60SJ6FssKHQGtHE3B+YjBcNBm/AfngYFyX6WWYJbCkfXpMp+kR8zmRJi/8WIQjJkPhTAM4BZbCSgBAsz4fU4pVpl4iqjtvFjrghI3RM/8kaWmiznkFwm4xpdAhFdeaFd2NbbfD0aYNpDtZv/ivGSjr/AULAjsS7hvqP27BaPKeKohBaHF4lVaFQl3zY+NXXvwbA0D3Ye5ziDCpW7zLDyWi9G4xJZNV7NqyBdhWA68SyFWyH9drlK+JasaqRAFZZNhb3057IsOfFWRds/zIhju2pzuAt1nBZPkeVVATPm5nWgUF35fd08ARIMj560621gIRNji0WUpqyQv0awb/8zQNRgutnPhldEM2epCysH/uD2bYHI3wMR7xu4GPQgQxFmG4U3LdeflihRT7SDZBqIBNxrFNVjtoigGeMwYtYB3B936dXIwOZg48JwNiegWjm34uKgCWq/PeZn18Q4Qsm4FAHIJMVZ0KTPehEsbwKyqkVFXhdnEeZ9D7KF4x1RTM3sxE4xLGCf0hgqy3o2KzuwzeN3fGtkZk92lu1WqQXvz3n6TRStysOF0RrgwO/+tKLxkJ+083TVhIgDwNxDB9vF9KQCoy7TgqUUmdG9eCwhj4FrSsWTVPTJKG0QIJKjH0775RRGiW40FlCbGlHdZB9D0lIUSHO6HU5Zjqz3DyI5k2W+futDRtp1JYoeIC5Qnbw3is/NYMkQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(36860700016)(35042699022)(14060799003)(82310400026)(6133799003)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(20046099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TM7TQKvyQTZbe9s1Q1eCm/QOnFQmdygG+BrqiL6069AWJ8KPPXb+aqd9W9fW2kX4BTUZDK7eddqnFsHOIIBtj+FniJnuW429JPPhmoyL03LP6oikgtrNKthihFFmxrTT0OR+J8l2SeiFfJQsCKrSO6PdBfMzPEhYyLIyJnlDrzxxczR5p0QZ4tqk4rAXccuGUwMjs4+KRkK/xwlpW/ne3zJ5EzP7Pn7bqTBn4axvDV70QS6ypTNCTNVJZwBbaRZH22L4NvDY88ZX0YYNPlAK9eqiv5V4zgh9GqctTPmnkCFkqCDSZKOMU0SnvqM0VMq2I3d3hi/VYUcgjnwpTJ2ZWdN/dObPqqYnCnZfcaF0Io2oWasVjvMaMS+R3VTFnfOrlAG6TEzlaD/Ewy2+nMaL/+u27p1o0J8c4UhV6zvZgS6bUjBtQ/Y5lYLtdHLSR8Gb
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 15:28:03.0358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 589f9c86-765a-45c8-2b84-08df1987422d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0A.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6603
X-purgate-ID: tlsNG-c201ff/1790177289-F4EA12A1-AD888603/0/0
X-purgate-type: clean
X-purgate-size: 14912

Hi Mykola,

Sorry for the delay to review this serie.

> On 27 Aug 2026, at 16:31, Mykola Kvach <mykola_kvach@epam.com> wrote:
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
> Transient physical SGI pending state (GICD_CPENDSGIRn/GICD_SPENDSGIRn)
> is intentionally excluded. CPU-interface active-priority state is also
> not restored across suspend/resume. Xen reaches the final suspend path
> at a quiescent point, so there is no active-priority execution context
> to replay after resume. Enforce this with a runtime check after
> disabling the CPU interface: if any implemented GICC_APRn word is still
> non-zero, restore GICC_CTLR and abort suspend with -EBUSY.

You mention SGI pending state but you do not say what would happen for PPI/=
SPI
pending state, and the patch does not look at or save/restore GICD_ISPENDR.

Can you clarify what is expected for those?

Cheers
Bertrand

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
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> Changes in V10:
> - Limit GICC_APR<n> active-priority checks to APR bits visible from
>  the Xen CPU-interface view.
> - Avoid touching reserved GICD_IPRIORITYR/GICD_ITARGETSR words when the
>  last implemented interrupt block is partial.
> - Restore distributor configuration before restoring interrupt enable
>  state, so GICD_ICFGR is written while the corresponding interrupts are
>  disabled.
>=20
> Changes in V9:
> - Skip saving/restoring GICD_ITARGETSR0..7 because SGI/PPI target
>  registers hold no state (read-only on MP, RAZ/WI on UP).
> - Add a runtime GICC_APRn quiescence check after disabling the CPU
>  interface, and restore GICC_CTLR before returning -EBUSY.
>=20
> Changes in V8:
> - disable cpu interface + distributor before suspend
> - change 0xffffffff to GENMASK;
> - cosmetic changes;
>=20
> Changes in V7:
> - Allocate one contiguous memory block for the GICv2 dist suspend context=
.
> - gicv2_resume() no longer unconditionally re-enables the distributor/CPU
>  interface; it now writes back the saved CTLR values as-is.
> - gicv2_alloc_context() now returns 0 on success and panics on failure,
>  since suspend context allocation is not recoverable.
> ---
> xen/arch/arm/gic-v2.c          | 226 +++++++++++++++++++++++++++++++++
> xen/arch/arm/gic.c             |  29 +++++
> xen/arch/arm/include/asm/gic.h |  12 ++
> 3 files changed, 267 insertions(+)
>=20
> diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> index 43a379fdda..a0ef6ffc7f 100644
> --- a/xen/arch/arm/gic-v2.c
> +++ b/xen/arch/arm/gic-v2.c
> @@ -1108,6 +1108,223 @@ static int gicv2_iomem_deny_access(struct domain =
*d)
>     return iomem_deny_access(d, mfn, mfn + nr - 1);
> }
>=20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +/* This struct represents block of 32 IRQs */
> +struct irq_block {
> +    uint32_t icfgr[2]; /* 2 registers of 16 IRQs each */
> +    uint32_t ipriorityr[8];
> +    uint32_t isenabler;
> +    uint32_t isactiver;
> +    uint32_t itargetsr[8];
> +};
> +
> +/* GICv2 registers to be saved/restored on system suspend/resume */
> +struct gicv2_context {
> +    /* GICC context */
> +    struct cpu_ctx {
> +        uint32_t ctlr;
> +        uint32_t pmr;
> +        uint32_t bpr;
> +    } cpu;
> +
> +    /* GICD context */
> +    struct dist_ctx {
> +        uint32_t ctlr;
> +        /* Includes banked SGI/PPI state for the boot CPU. */
> +        struct irq_block *irqs;
> +    } dist;
> +};
> +
> +static struct gicv2_context gic_ctx;
> +
> +#define GICV2_NR_APRS          4
> +#define GICV2_APR_BITS_PER_REG 32U
> +
> +static int gicv2_check_active_priorities(uint32_t bpr)
> +{
> +    unsigned int i, apr_bits, nr_aprs;
> +
> +    /*
> +     * Xen writes GICC_BPR to 0 during CPU init and does not change it. =
Per
> +     * IHI0048B.b, a write below the implementation minimum reads back a=
s the
> +     * minimum supported BPR value. Table 4-47 maps that Xen-visible BPR=
 value
> +     * to the visible GICC_APR<n> bits. Avoid reading APR registers outs=
ide
> +     * that visible range.
> +     *
> +     * This covers both GICv2 with and without Security Extensions.
> +     */
> +    apr_bits =3D 1U << (7 - (bpr & 0x7));
> +    nr_aprs =3D DIV_ROUND_UP(apr_bits, GICV2_APR_BITS_PER_REG);
> +
> +    ASSERT(nr_aprs <=3D GICV2_NR_APRS);
> +
> +    for ( i =3D 0; i < nr_aprs; i++ )
> +    {
> +        unsigned int bits =3D min(GICV2_APR_BITS_PER_REG,
> +                                apr_bits - i * GICV2_APR_BITS_PER_REG);
> +        uint32_t mask =3D GENMASK(bits - 1, 0);
> +        uint32_t apr =3D readl_gicc(GICC_APR + i * 4) & mask;
> +
> +        if ( !apr )
> +            continue;
> +
> +        printk(XENLOG_ERR "GICv2: suspend aborted: GICC_APR%u=3D%#08x\n"=
,
> +               i, apr);
> +        return -EBUSY;
> +    }
> +
> +    return 0;
> +}
> +
> +static int gicv2_suspend(void)
> +{
> +    unsigned int i, blocks =3D DIV_ROUND_UP(gicv2_info.nr_lines, 32);
> +    int ret;
> +
> +    /* Save GICC_CTLR configuration. */
> +    gic_ctx.cpu.ctlr =3D readl_gicc(GICC_CTLR);
> +
> +    /* Quiesce the GIC CPU interface before suspend. */
> +    gicv2_cpu_disable();
> +
> +    gic_ctx.cpu.bpr =3D readl_gicc(GICC_BPR);
> +
> +    /*
> +     * Check the active-priority state for the group Xen drives through =
the
> +     * CPU interface. GICC_CTL_ENABLE enables Group 0 without SecurityEx=
tn and
> +     * Group 1 in Xen's Non-secure view with SecurityExtn, and in both c=
ases
> +     * the relevant state is visible through GICC_APRn. The APR layout i=
s
> +     * implementation-defined, so only test the bits visible from Xen's =
CPU
> +     * interface view instead of reading every possible APR register.
> +     */
> +    ret =3D gicv2_check_active_priorities(gic_ctx.cpu.bpr);
> +    if ( ret )
> +    {
> +        writel_gicc(gic_ctx.cpu.ctlr, GICC_CTLR);
> +        return ret;
> +    }
> +
> +    gic_ctx.cpu.pmr =3D readl_gicc(GICC_PMR);
> +
> +    /* Save GICD configuration */
> +    gic_ctx.dist.ctlr =3D readl_gicd(GICD_CTLR);
> +    writel_gicd(0, GICD_CTLR);
> +
> +    for ( i =3D 0; i < blocks; i++ )
> +    {
> +        struct irq_block *irqs =3D gic_ctx.dist.irqs + i;
> +        size_t j, off =3D i * sizeof(irqs->isenabler);
> +        size_t nr_regs =3D ARRAY_SIZE(irqs->ipriorityr);
> +
> +        if ( i =3D=3D blocks - 1 )
> +            nr_regs =3D DIV_ROUND_UP(gicv2_info.nr_lines - i * 32, 4);
> +
> +        irqs->isenabler =3D readl_gicd(GICD_ISENABLER + off);
> +
> +        /*
> +         * Save distributor active state as part of the hypervisor-owned
> +         * physical interrupt state. In GICv2 EOImode=3D=3D1, EOIR only =
drops the
> +         * priority; final deactivation is separate. For guest-routed
> +         * interrupts, Xen may have EOIed the physical IRQ while the gue=
st/vGIC
> +         * side still owns the deactivate step. Therefore GICD_ISACTIVER=
 can
> +         * legitimately remain set even though transient SGI pending sta=
te and
> +         * CPU-interface active-priority state are expected to be quiesc=
ed here.
> +         */
> +        irqs->isactiver =3D readl_gicd(GICD_ISACTIVER + off);
> +
> +        off =3D i * sizeof(irqs->ipriorityr);
> +        for ( j =3D 0; j < nr_regs; j++ )
> +            irqs->ipriorityr[j] =3D readl_gicd(GICD_IPRIORITYR + off + j=
 * 4);
> +
> +        /*
> +         * GICD_ITARGETSR0..7 cover SGIs/PPIs and hold no state to save:
> +         * they are read-only on multiprocessor implementations and RAZ/=
WI
> +         * on uniprocessor implementations.
> +         */
> +        if ( i )
> +        {
> +            off =3D i * sizeof(irqs->itargetsr);
> +            for ( j =3D 0; j < nr_regs; j++ )
> +                irqs->itargetsr[j] =3D readl_gicd(GICD_ITARGETSR + off +=
 j * 4);
> +        }
> +
> +        off =3D i * sizeof(irqs->icfgr);
> +        for ( j =3D 0; j < ARRAY_SIZE(irqs->icfgr); j++ )
> +            irqs->icfgr[j] =3D readl_gicd(GICD_ICFGR + off + j * 4);
> +    }
> +
> +    return 0;
> +}
> +
> +static void gicv2_resume(void)
> +{
> +    unsigned int i, blocks =3D DIV_ROUND_UP(gicv2_info.nr_lines, 32);
> +
> +    gicv2_cpu_disable();
> +    /* Disable distributor */
> +    writel_gicd(0, GICD_CTLR);
> +
> +    for ( i =3D 0; i < blocks; i++ )
> +    {
> +        struct irq_block *irqs =3D gic_ctx.dist.irqs + i;
> +        size_t j, off =3D i * sizeof(irqs->isenabler);
> +        size_t nr_regs =3D ARRAY_SIZE(irqs->ipriorityr);
> +
> +        if ( i =3D=3D blocks - 1 )
> +            nr_regs =3D DIV_ROUND_UP(gicv2_info.nr_lines - i * 32, 4);
> +
> +        writel_gicd(GENMASK(31, 0), GICD_ICENABLER + off);
> +
> +        off =3D i * sizeof(irqs->icfgr);
> +        for ( j =3D 0; j < ARRAY_SIZE(irqs->icfgr); j++ )
> +            writel_gicd(irqs->icfgr[j], GICD_ICFGR + off + j * 4);
> +
> +        off =3D i * sizeof(irqs->ipriorityr);
> +        for ( j =3D 0; j < nr_regs; j++ )
> +            writel_gicd(irqs->ipriorityr[j], GICD_IPRIORITYR + off + j *=
 4);
> +
> +        /*
> +         * GICD_ITARGETSR0..7 cover SGIs/PPIs and hold no state to save:
> +         * they are read-only on multiprocessor implementations and RAZ/=
WI
> +         * on uniprocessor implementations.
> +         */
> +        if ( i )
> +        {
> +            off =3D i * sizeof(irqs->itargetsr);
> +            for ( j =3D 0; j < nr_regs; j++ )
> +                writel_gicd(irqs->itargetsr[j], GICD_ITARGETSR + off + j=
 * 4);
> +        }
> +
> +        off =3D i * sizeof(irqs->isenabler);
> +        writel_gicd(irqs->isenabler, GICD_ISENABLER + off);
> +
> +        writel_gicd(GENMASK(31, 0), GICD_ICACTIVER + off);
> +        writel_gicd(irqs->isactiver, GICD_ISACTIVER + off);
> +    }
> +
> +    /* Restore distributor control state. */
> +    writel_gicd(gic_ctx.dist.ctlr, GICD_CTLR);
> +
> +    /* Restore GIC CPU interface configuration */
> +    writel_gicc(gic_ctx.cpu.pmr, GICC_PMR);
> +    writel_gicc(gic_ctx.cpu.bpr, GICC_BPR);
> +
> +    /* Enable GIC CPU interface */
> +    writel_gicc(gic_ctx.cpu.ctlr, GICC_CTLR);
> +}
> +
> +static void __init gicv2_alloc_context(void)
> +{
> +    uint32_t blocks =3D DIV_ROUND_UP(gicv2_info.nr_lines, 32);
> +
> +    gic_ctx.dist.irqs =3D xzalloc_array(struct irq_block, blocks);
> +    if ( !gic_ctx.dist.irqs )
> +        panic("Failed to allocate memory for GICv2 suspend context\n");
> +}
> +
> +#endif /* CONFIG_SYSTEM_SUSPEND */
> +
> #ifdef CONFIG_ACPI
> static unsigned long gicv2_get_hwdom_extra_madt_size(const struct domain =
*d)
> {
> @@ -1312,6 +1529,11 @@ static int __init gicv2_init(void)
>=20
>     spin_unlock(&gicv2.lock);
>=20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    /* Allocate memory to be used for saving GIC context during the susp=
end */
> +    gicv2_alloc_context();
> +#endif /* CONFIG_SYSTEM_SUSPEND */
> +
>     return 0;
> }
>=20
> @@ -1355,6 +1577,10 @@ static const struct gic_hw_operations gicv2_ops =
=3D {
>     .map_hwdom_extra_mappings =3D gicv2_map_hwdom_extra_mappings,
>     .iomem_deny_access   =3D gicv2_iomem_deny_access,
>     .do_LPI              =3D gicv2_do_LPI,
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    .suspend             =3D gicv2_suspend,
> +    .resume              =3D gicv2_resume,
> +#endif /* CONFIG_SYSTEM_SUSPEND */
> };
>=20
> /* Set up the GIC */
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index 078049e741..ffc11f36a1 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -438,6 +438,35 @@ int gic_iomem_deny_access(struct domain *d)
>     return gic_hw_ops->iomem_deny_access(d);
> }
>=20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +int gic_suspend(void)
> +{
> +    /* Must be called by boot CPU#0 with interrupts disabled */
> +    ASSERT(!local_irq_is_enabled());
> +    ASSERT(!smp_processor_id());
> +
> +    if ( !gic_hw_ops->suspend || !gic_hw_ops->resume )
> +        return -ENOSYS;
> +
> +    return gic_hw_ops->suspend();
> +}
> +
> +void gic_resume(void)
> +{
> +    /*
> +     * Must be called by boot CPU#0 with interrupts disabled after gic_s=
uspend
> +     * has returned successfully.
> +     */
> +    ASSERT(!local_irq_is_enabled());
> +    ASSERT(!smp_processor_id());
> +    ASSERT(gic_hw_ops->resume);
> +
> +    gic_hw_ops->resume();
> +}
> +
> +#endif /* CONFIG_SYSTEM_SUSPEND */
> +
> static int cpu_gic_callback(struct notifier_block *nfb,
>                             unsigned long action,
>                             void *hcpu)
> diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gi=
c.h
> index ee2c26adb4..29bb9a89a4 100644
> --- a/xen/arch/arm/include/asm/gic.h
> +++ b/xen/arch/arm/include/asm/gic.h
> @@ -301,6 +301,12 @@ extern int gicv_setup(struct domain *d);
> extern void gic_save_state(struct vcpu *v);
> extern void gic_restore_state(struct vcpu *v);
>=20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +/* Suspend/resume */
> +extern int gic_suspend(void);
> +extern void gic_resume(void);
> +#endif /* CONFIG_SYSTEM_SUSPEND */
> +
> /* SGI (AKA IPIs) */
> enum gic_sgi {
>     GIC_SGI_EVENT_CHECK,
> @@ -444,6 +450,12 @@ struct gic_hw_operations {
>     int (*iomem_deny_access)(struct domain *d);
>     /* Handle LPIs, which require special handling */
>     void (*do_LPI)(unsigned int lpi);
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    /* Save GIC configuration due to the system suspend */
> +    int (*suspend)(void);
> +    /* Restore GIC configuration due to the system resume */
> +    void (*resume)(void);
> +#endif /* CONFIG_SYSTEM_SUSPEND */
> };
>=20
> extern const struct gic_hw_operations *gic_hw_ops;
> --=20
> 2.43.0
>=20


