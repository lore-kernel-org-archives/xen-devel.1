Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D832DC54F51
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 07:34:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375234.1622454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woyo7-00017c-16; Wed, 29 Jul 2026 07:34:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375234.1622454; Wed, 29 Jul 2026 07:34:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woyo6-00017V-Ua; Wed, 29 Jul 2026 07:34:26 +0000
Received: by outflank-mailman (input) for mailman id 1375234;
 Wed, 29 Jul 2026 07:34:25 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1woyo4-000176-W4
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 07:34:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woyo4-001je0-CZ
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 09:34:24 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a69aceb-2eae-0a2a0a5409dd-0a2a45078ddc-46
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 09:34:24 +0200
Received: from [52.101.84.10]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a69acff-b4ea-0a2a45070019-3465540a8e6a-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 09:34:24 +0200
Received: from DB9PR02CA0009.eurprd02.prod.outlook.com (2603:10a6:10:1d9::14)
 by AS4PR08MB8117.eurprd08.prod.outlook.com (2603:10a6:20b:589::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 07:34:16 +0000
Received: from DU6PEPF0000A7DE.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9:cafe::60) by DB9PR02CA0009.outlook.office365.com
 (2603:10a6:10:1d9::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Wed,
 29 Jul 2026 07:34:15 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7DE.mail.protection.outlook.com (10.167.8.38) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5 via
 Frontend Transport; Wed, 29 Jul 2026 07:34:15 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by GVXPR08MB7872.eurprd08.prod.outlook.com (2603:10a6:150:16::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Wed, 29 Jul
 2026 07:33:12 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%6]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 07:33:12 +0000
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
 b=BwclX4G5+gJeHHxXAG+k1aJ1rEQshaBHfMJHbM19RwMHRhbURsaKq+5b/JKibe8hV36nzPQYFpwCX8Rwe3jrcmJ5mSnNMO4gWkHVAhNga9jbuVVPabCpcP4UAiFV2XJbtqsvbIU9geDUpVAgIym+gQOQJovTwi54EO0saTmFFG2QDcMguCj2KQM4DRyr3YvYlZptu/NEBn6l505fCtVgimZPjJPcU7mYFIyLtUWLFFfvjhrslEYNHgmpPRU1hzFfRGC36LUpyDLwDpM77oCI4hergJvtSTRwEp/PIia7VVJTKeQvVmxdwtF8oPZexHqEbl4c3AcszovEcJx8aYtxiw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q4GMW0NQzElnhyngtJUncnCCZTMBxBsDAFT6IObqqaE=;
 b=sMCoM+aq2UR5yX3suQbCSIswEk1SAlbnjca4IBAZI2mTw48KWGi0W/B/O8McmaWIWnIJYjI0UKJJEezPTWdHY0KqOz1g9s2Ui9IM2EY+SXZ6FelWz4mU2TyE8xIQGKQ50CU7X+MvxXdgWK6nFVNmwnTk428tjZ74Izwi0xifAYswHIEeB7nnaXpjuc5517Z4Cl6uM+hHbhmRnb1RFwAI4IPrU30EEtIY2fLmTp7d/0b7gE4jTse3EycTCgRBk80dSNVpH1nUls6f2afP+PStpV1FnxbO2CR6ObXzk+ZkaUljS+OtrZ4lwYEqXUVYDdX6L/lfqpI8FlWCmC+4VlHq+Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q4GMW0NQzElnhyngtJUncnCCZTMBxBsDAFT6IObqqaE=;
 b=AndPpM3+MhUxjuX0ImxyXtRn1/btz3cjWcF+6vcXPfOsgnHbA0v1x9AZ148LrG/+w3Abi9Azy4fDKLRdlHaass+LEAcKtaL6eAzsp4dIN6GcHnY7hRI4CYk7f8ldnu45pZ/fOdj9Uru9i3CvWgsF+G9w7ubfIHSCjUUg36VrCWw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iux4qRA1kRzWaBH5Yd3qMC1VP3k9e+IF3Q4dRkVIs5LqkAqVy7hovlv6phKZN+Vmb5LhdQat06UAss6YbRt9El99mdOQ3ILel/9XQ5Gf1W+DKcWO5XUu84TsV2aelKr4Vaw2LrcmvKpNvCAqWVHjWLmpOm2qxJTEONaUZSZeu4W4AK9G589Ebkjn686W9/s0TW/+ijqpX/nnnhI+tFSjtKWF5UmjN5cmUUNlwEUZVj62PDk5/UHvx4lWzcuQqf+PLe/qpwpmUjEs7l5I5wBqDQe8mJ0vWKwAIOW081bEywOrLaxpv5aNSl7EkYuaTtNBPvsp21U73P47QK8fBvuyww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q4GMW0NQzElnhyngtJUncnCCZTMBxBsDAFT6IObqqaE=;
 b=cOQnDzqX24cz/S+36CcEAlVc/+nbxMbiIq3Q7b4hJohMYGKJnO3PWoAqlkbJzyh6kQAmPOSPBnS+ymEmAy51igX09pl6BjQd22v9NXeiQK/voFJgEmMNnAi2yPd6EGJAmPOM1fwu3xToLEzfYs16vkekPmLjPLsGeTDsGf5F/5bPODrVy6nafkLXuY4eGLJARvRklZSqAHkAOjn5GF6EBcRmmuabPxTqymg4+aQNofC5G6xUeU7tdYGR0TVMOpV8sGky1uvSvVMQ8DxMYkmWETINgU2OX84petfeZaDsKuLTRMrozVMgvXCrZabiy43niatP1jiZFdI27v8+9SjtAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q4GMW0NQzElnhyngtJUncnCCZTMBxBsDAFT6IObqqaE=;
 b=AndPpM3+MhUxjuX0ImxyXtRn1/btz3cjWcF+6vcXPfOsgnHbA0v1x9AZ148LrG/+w3Abi9Azy4fDKLRdlHaass+LEAcKtaL6eAzsp4dIN6GcHnY7hRI4CYk7f8ldnu45pZ/fOdj9Uru9i3CvWgsF+G9w7ubfIHSCjUUg36VrCWw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3] xen/arm: gic-v3: Introduce CONFIG_GICV3_NR_LRS
Thread-Topic: [PATCH v3] xen/arm: gic-v3: Introduce CONFIG_GICV3_NR_LRS
Thread-Index: AQHdDUxnpNWLH92ScEigAcOkgcohAraEPl+A
Date: Wed, 29 Jul 2026 07:33:12 +0000
Message-ID: <734D78C2-5B91-49BB-8633-A6D982A91620@arm.com>
References: <20260706133553.3026786-1-ayan.kumar.halder@amd.com>
In-Reply-To: <20260706133553.3026786-1-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|GVXPR08MB7872:EE_|DU6PEPF0000A7DE:EE_|AS4PR08MB8117:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b8baee5-ea16-487d-7cb6-08deed43caed
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|38070700021|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 A7eWZge/zE/A942XaAuTzE/pLx4uHvYvFAR6D2bW23ElWWjVkq/oWIhTl1Rurp0fJ4HBI3/zhKaqSTtkk3BhPfMIl7zQCCHJI0rrNvYdeoc6J5Gq8hoGYZdnOuBPFyepS2TTNqmoIVWeKV4FM0k4o32vgWnyM/Z6kbljiSww4/NQzqXKh8h7Kho8JB9a4enkjQWNidZ6dYXenaYNTEOewTc2EITXpAE3EXsQu0tlXMO5FHYm2ql8CkmESLIRW3oH3DZeEKjmjcbFI7wm15zC/w7DyTL8rsQsDGIFZuFElQ+/C7m0GqV8rEaLudOBglZLXW6T13iO9BLcRtBzdJtgUjZLeOe9tJpKMhFFzW6z1Ym0qWDhD+RDLOm33GCngt3BL80KiFP9cKxJxbnHzFp09ODw9O9HNIWAZjroVbfzz/TCMpf5LkieZhbQ9kvapdC03f5W2FGAnTyWEIcomPIHsJ/b6QNz4VatfjTUPCg59iXfledzufDWepMXlRVQmimP+tN0zrHioABWr+HDif7YiQkhakbCJeHZjV+H+i+rYUSfH16AetCd86YOm4g0tbeUSF3e8Pa88/Vh7UXl2Eq51oSzx4jXpqS7xAWnc99JSjddjPdMklR21Qn+Kze0ZdgEK1lTLBFgwpMwS58fjquW/vJUe/blHBPejztZx9NNTbSIFaGHhlYewjr1swOcdxwh5VI0Aa05Nfc3aR2iXMsIJ0TiTTE/QPt1QQBRIqjSJyY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(38070700021)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <90F23C9A04EA3E419BBB2FB1ED76D4BB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 npZqS2OEAr8rnpw7t0s0k8p+VNQKHIUIU2f486xLdjlL7Xs8sSbU+5ekrX1UztLFu174tg8weMuPXfX5gVX77wND7iuxLw3njNWmEYNDgldGD6BGpJHSJpWdq0yl3fEcHk0IVEaX1CYLI+iFJHiTR3wLY+RocZ0WOMMtKWCwP879o6YjSvUYxFUUaVZsg/CQOCMXaJZ+iOYCPuUjrTTl4u71OyeEqSZUCMR9GLlkv8G75wnmL6iB5OWNdgbkQ27e4YRolrjUWSPAIrWV4SJdpFr0xAZvaLGLers1u4E0wL2lhoyb00cuAPbMYq0uwl5hCp7XhCbIdf8ecQEn/m8PuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7872
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	863aabdd-43ec-433a-9723-08deed43a527
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|35042699022|1800799024|23010399003|376014|14060799003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	GWc1q4ThmQL0mveMXocxSYjequs7cHm98UbeaWgSyznke72neAk+3AVtbJG9jPI9A5u4CUJUvCKzus+sef0vCZNjFJwmcMl+80vSnrnqxNo6BK5kY0F/uaPmN1Z3FrUA0tykCzcfq55ZXHhTf3v1Vdk9MLQVr3iGDomea0/h592erRCtC7/tCST8K0KmRDnhi/HoaxqSwqjt1Mwj1/xBNW/7y9emHF6p49AquHiFNh6LhIbmkIEh3KjOnn/a3NPzduXzU7c9AZ/+rPQA0CIlKUUGIdPZJytQNVXnXNYlojfdXqsaoTWZekIwuyaODdDEUXqyfULHil/yt7LXk0P8Js6XerucG/Kdke/mgKFP/dX5VcaZFsF1mSIDq7Iczo24Dbesh/aewCTe7Ccfc0j2WrTJxN+bffFXOEiqGEBq3iTp9+3RQ8O5+snP/TUQpl6FXQG7jXL1xw83g0gITdaygjR143X33hry/JnVOVbX1DGmiJkNEANDelmKzelWq26T2bmHVQDEgnCyOEUDOKtOtSIh3LRsgs7YLOHCc109wp51VJp7X7v04/KU4Y6empM7DT5NSaCSsINfVwMmSU2IoBgQrt5D8rEjwh2pa9HaDmVISe7ETMffXqTRhluHRkS3mMe8B96ZorQ9MaQmdhbMREGnYRi+EVZxanomRjtmieprc+L1cnXF6Zv8wRw1yTjSDI0SsD0iyLV94iFFJu8+Pg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(35042699022)(1800799024)(23010399003)(376014)(14060799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oT+Bvdq5RrnoBWI49GZR8oVxuFHCL9ZQ3wtZGUmvMeEZ5xljL+ORtLEzBgoM8pO+trFzIe9tG6SCi6Dd1qK+1Cnur80QjquiFpFU1M9ppiWVQJpWKK9P0ILRIAJfzeZjMQI5X6xjONH5FSVK8cCujlZroIQFwshh2x0XUlOKfVYQCjpj00tXRYLdffn1t7kR/Ixb3oawjFqK8GIAnGuEvt18TNYbba4Z90zWCmi4Jmdmc2OHzNxFVfDrJUE53z0PfZdmWraTV8fiSkAFDPzsIPo4FvJesQcmYXLft7nn5xgbvOenohxVhw+rn9WXvS3PbHm8n53KUYtxQAm6AzO6B/jNEV1tbvu5gsJwwaF+rQ+l02X1pDT0KyQUIXeR95CShLpPji4CSEwfmj2IEMKDU2iw3zYuGY9F4h8khipMKp9S7tKlZtaE3NDaw041S0em
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 07:34:15.5205
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b8baee5-ea16-487d-7cb6-08deed43caed
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8117
X-purgate-ID: tlsNG-ef75cf/1785310464-A4AC8AE4-E6BD4979/0/0
X-purgate-type: clean
X-purgate-size: 5601

Hi,

> On 6 Jul 2026, at 15:35, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wr=
ote:
>=20
> Add a Kconfig option that lets an integrator hard-code the number of
> GICv3 Link Registers Xen uses. The default (0) keeps reading the count
> from ICH_VTR_EL2.ListRegs at boot. A non-zero value is validated
> against the hardware count in gicv3_hyp_init() and replaces
> gicv3_info.nr_lrs.
>=20
> gicv3_hyp_init() now panics if CONFIG_GICV3_NR_LRS exceeds the
> hardware count, and zeroes all hardware LRs (once per CPU) as defensive
> hardening, so any interrupt left in an LR that Xen will not manage
> cannot be picked up by the GIC.
>=20
> gicv3_ich_read_lr()/gicv3_ich_write_lr() now reject out-of-range
> indices with an error message, ASSERT_UNREACHABLE() and WARN() instead
> of silently returning RAZ/WI; reaching this path indicates a bug.
>=20
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

With the typo Link/List registers fixed:

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes in=20
> v3:
> - Validate CONFIG_GICV3_NR_LRS against the hardware count in
>  gicv3_hyp_init() and panic if it exceeds it (Julien, Luca).
> - Allow an integrator to select fewer LRs than the hardware supports;
>  gicv3_info.nr_lrs is replaced with the clamped value (Julien).
> - Zero all hardware LRs in gicv3_hyp_init() as defensive hardening.
> - Replace the silent RAZ/WI out-of-range path in gicv3_ich_read_lr()/
>  gicv3_ich_write_lr() with gprintk() + ASSERT_UNREACHABLE() + WARN()
>  (Julien).
> - Renamed the Kconfig from LRS to NR_LRS (Julien).
> - The link-time dead-code-elimination guard is split out into a
>  separate follow-up patch.
>=20
> v2:
> - s/lrs/LRS.
> - Implement RAZ/WI instead of panic.
>=20
> xen/arch/arm/Kconfig  |  9 ++++++++
> xen/arch/arm/gic-v3.c | 50 ++++++++++++++++++++++++++++++++++++++++++-
> 2 files changed, 58 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 5fa89fcb24..798bc8e9b2 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -143,6 +143,15 @@ config GICV3_ESPI
>  range, from 4096 to 5119. This feature is introduced in GICv3.1
>  architecture.
>=20
> +config GICV3_NR_LRS
> + int "Number of GICv3 Link Registers used" if EXPERT
> + depends on GICV3
> + range 0 16
> + default 0
> + help
> +  Controls the number of Link registers to be used.
> +  Keep it set to 0 to use a value obtained from a hardware register.
> +
> config HAS_ITS
>         bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPOR=
TED
>         depends on GICV3 && !NEW_VGIC && !ARM_32
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index acdac22953..46ab0b6329 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -178,6 +178,15 @@ static inline void gicv3_restore_lrs(const struct vc=
pu *v)
>=20
> static uint64_t gicv3_ich_read_lr(int lr)
> {
> +    if ( lr < 0 || lr >=3D gicv3_info.nr_lrs )
> +    {
> +        gprintk(XENLOG_ERR, "GICv3: LR read index %d out of range (nr_lr=
s %u)\n",
> +                lr, gicv3_info.nr_lrs);
> +        ASSERT_UNREACHABLE();
> +        WARN();
> +        return 0;
> +    }
> +
>     switch ( lr )
>     {
>     case 0: return READ_SYSREG_LR(0);
> @@ -203,6 +212,15 @@ static uint64_t gicv3_ich_read_lr(int lr)
>=20
> static void gicv3_ich_write_lr(int lr, uint64_t val)
> {
> +    if ( lr < 0 || lr >=3D gicv3_info.nr_lrs )
> +    {
> +        gprintk(XENLOG_ERR, "GICv3: LR write index %d out of range (nr_l=
rs %u)\n",
> +                lr, gicv3_info.nr_lrs);
> +        ASSERT_UNREACHABLE();
> +        WARN();
> +        return;
> +    }
> +
>     switch ( lr )
>     {
>     case 0:
> @@ -1041,9 +1059,39 @@ static void gicv3_cpu_disable(void)
> static void gicv3_hyp_init(void)
> {
>     register_t vtr;
> +    uint8_t hw_nr_lrs;
>=20
>     vtr =3D READ_SYSREG(ICH_VTR_EL2);
> -    gicv3_info.nr_lrs  =3D (vtr & ICH_VTR_NRLRGS) + 1;
> +    hw_nr_lrs =3D (vtr & ICH_VTR_NRLRGS) + 1;
> +
> +    if ( CONFIG_GICV3_NR_LRS && CONFIG_GICV3_NR_LRS > hw_nr_lrs )
> +        panic("GICv3: CONFIG_GICV3_NR_LRS (%u) exceeds hardware nr_lrs (=
%u)\n",
> +              CONFIG_GICV3_NR_LRS, hw_nr_lrs);
> +
> +    gicv3_info.nr_lrs =3D CONFIG_GICV3_NR_LRS ?: hw_nr_lrs;
> +
> +    /* Zero all hardware LRs. */
> +    switch ( hw_nr_lrs )
> +    {
> +    case 16: WRITE_SYSREG_LR(0, 15); fallthrough;
> +    case 15: WRITE_SYSREG_LR(0, 14); fallthrough;
> +    case 14: WRITE_SYSREG_LR(0, 13); fallthrough;
> +    case 13: WRITE_SYSREG_LR(0, 12); fallthrough;
> +    case 12: WRITE_SYSREG_LR(0, 11); fallthrough;
> +    case 11: WRITE_SYSREG_LR(0, 10); fallthrough;
> +    case 10: WRITE_SYSREG_LR(0, 9); fallthrough;
> +    case 9:  WRITE_SYSREG_LR(0, 8); fallthrough;
> +    case 8:  WRITE_SYSREG_LR(0, 7); fallthrough;
> +    case 7:  WRITE_SYSREG_LR(0, 6); fallthrough;
> +    case 6:  WRITE_SYSREG_LR(0, 5); fallthrough;
> +    case 5:  WRITE_SYSREG_LR(0, 4); fallthrough;
> +    case 4:  WRITE_SYSREG_LR(0, 3); fallthrough;
> +    case 3:  WRITE_SYSREG_LR(0, 2); fallthrough;
> +    case 2:  WRITE_SYSREG_LR(0, 1); fallthrough;
> +    case 1:  WRITE_SYSREG_LR(0, 0); break;
> +    default: BUG();
> +    }
> +
>     gicv3.nr_priorities =3D ((vtr >> ICH_VTR_PRIBITS_SHIFT) &
>                           ICH_VTR_PRIBITS_MASK) + 1;
>=20
> --=20
> 2.25.1
>=20


