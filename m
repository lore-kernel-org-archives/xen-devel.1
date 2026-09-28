Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797D8CA5FA2
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 16:19:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436151.1654925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBE4t-0002IV-8j; Mon, 28 Sep 2026 16:19:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436151.1654925; Mon, 28 Sep 2026 16:19:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBE4t-0002IO-3a; Mon, 28 Sep 2026 16:19:43 +0000
Received: by outflank-mailman (input) for mailman id 1436151;
 Mon, 28 Sep 2026 16:19:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1xBE4q-0002Ht-N7
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 16:19:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBE4q-006HKy-3e
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 18:19:40 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6aba938a-2eae-0a2a0a5409dd-0a2a4502e0b0-24
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 18:19:40 +0200
Received: from [52.101.66.19]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6aba939b-6ca4-0a2a45020019-34654213b04a-3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 18:19:39 +0200
Received: from ZR2P278CA0079.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:65::18)
 by GV2PR08MB726458.eurprd08.prod.outlook.com (2603:10a6:150:37f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Mon, 28 Sep
 2026 16:19:33 +0000
Received: from ZR1PEPF0000E6AD.eurprd05.prod.outlook.com
 (2603:10a6:910:65:cafe::4d) by ZR2P278CA0079.outlook.office365.com
 (2603:10a6:910:65::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 16:19:32 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 ZR1PEPF0000E6AD.mail.protection.outlook.com (10.167.241.84) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 16:19:32 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by GV2PR08MB11820.eurprd08.prod.outlook.com (2603:10a6:150:303::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.4; Mon, 28 Sep
 2026 16:18:57 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 16:18:52 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XM4g3UG99ytz8F9ShI3DRihjhGlrNa48JhTA7+8Uyb3NmXAXvNsQVRjMaPfy+VN9PSkwQXx4+WMQ1eOC1UQmtnSA+j21iz/kexgVhWDIcIXLx7aXtqKreIPxfVXWROqSWPHpjn1kodfmdOP/cn0rfE6jUtx4AFvSJrpzymQahKJ685vwxCDV9MO6eo0REuZt/66aIF1wN1NWFon5DOP7cz8PEcxSU076HerhRg92Imi66B/PNafJwRiYONifLWG4BNvopAxEE5eOh431z4eexkK04lPAi/Fsy3FO/ySsdQuEYMtK68ocjgJRe8oqtRL87+sVxty3tCP8mYHNLyYlAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PNqtsGdseRpzW7+fwffSbKgE+JGfb4g69I9s7Jso9g4=;
 b=J0/DCAcxXjrkRUjD7IQg7l+MbGoWjFYVWlbZFNQ+Rx/27Ag7TaJ/sqVVLtEEPz2EnIR1mMZhOh6QHmfBqR0XDV6F8SdnaXJazCG8MveWBicN3NG5f9OqNSZ7Og9yru18NCV5g3XSYS0EgysctVSFH6C1I3+6qshd+zsLJZHJn88UKfFaeEWDAdfVxN6M6CaM4zOSkn4f3VN8aZatoxfvttnwHgoXRUCODZIDNjAfn9BhGHh5PkYMWcLfuBKfxvAt/QKDrKqdRWRRkB50QF/kSjVnPhhzgoU8RD5JqNSXFgN9SjMfo23bQOZ8MMCDwzR6gfGTfUk8XxSrpXWO3ViyuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNqtsGdseRpzW7+fwffSbKgE+JGfb4g69I9s7Jso9g4=;
 b=ILP/4we1oPRnJ3A0x74msvOoK44xZQXebCWH87kuf0MCEF9oUTXmPGZhj6+shU36M8RBhekw4fePc68J0gav5XjXARdwRBRZbp0ecERH0poOLOoQpJ2KZi1IRDgjbvo77LX24WCYFdNWirrwkFG6/X74+mgwF9dLg9NneHtR+vs=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNqtsGdseRpzW7+fwffSbKgE+JGfb4g69I9s7Jso9g4=;
 b=ILP/4we1oPRnJ3A0x74msvOoK44xZQXebCWH87kuf0MCEF9oUTXmPGZhj6+shU36M8RBhekw4fePc68J0gav5XjXARdwRBRZbp0ecERH0poOLOoQpJ2KZi1IRDgjbvo77LX24WCYFdNWirrwkFG6/X74+mgwF9dLg9NneHtR+vs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykola Kvach <mykola_kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger@xenproject.org>, Rahul Singh
	<Rahul.Singh@arm.com>, Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
Subject: Re: [PATCH v12 12/13] xen/arm: Add vPSCI SYSTEM_SUSPEND policy
Thread-Topic: [PATCH v12 12/13] xen/arm: Add vPSCI SYSTEM_SUSPEND policy
Thread-Index: AQHdNjDrgi4QeGJqQEWa1xeBJUyD5LbkXawA
Date: Mon, 28 Sep 2026 16:18:52 +0000
Message-ID: <4FB9774A-1929-443D-ACA1-F1E1734021A1@arm.com>
References: <cover.1787838455.git.mykola_kvach@epam.com>
 <1d4cee919353f883f6be9c9de4f317432d61206e.1787838455.git.mykola_kvach@epam.com>
In-Reply-To:
 <1d4cee919353f883f6be9c9de4f317432d61206e.1787838455.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|GV2PR08MB11820:EE_|ZR1PEPF0000E6AD:EE_|GV2PR08MB726458:EE_
X-MS-Office365-Filtering-Correlation-Id: ca73b19c-1691-476c-6ae6-08df1d7c477b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|4143699003|10067099003|260925021311599003|18002099003|6133799003|260925021911599003|56012099006|11063799006|22082099003|38070700021|260925022911599003;
X-Microsoft-Antispam-Message-Info-Original:
 nD5vGHoGOZKRhLzGdbTfE575P7guXeH7ET5jACR8mZfkXNSa08dOHzMegIrk+mrxvRPD/iINWAoSYQzarco5K4XQzJ9mn9m7jO9PFbc11XAsqJR7uLFRh6uOuzRU1EQqhsmYyt80oY+vMz/LuNpJk21ibvNhQ+zFPuADU0jrCtFHqktJngjwSI+6x22rg9+4IAJDrkAIpO8vo0bJp8ucVAMXqx4DOJ5EM9jPMWJghWDU7Kfu0x8951DoHkIZr5Q0mJ973ABaBV2FsD45TGUk96xl7Eiod5c2oqyrBqBCW6g0YnY+SC8uHUPLbrywqd1aH6nk2oFXygxTEq7XigGQTwGK/otU366SJWEHVRCRi54CQKgN5fhPPjO94IESzFz6NEppoUJpBtNTAX+aOfouzu+0ocpV8pFNvSGTlFdNApjHoo9rm0QQRVsyCBM47mtMCPXv0vSnXN/gcqHa7XJXvBzHfPkc/8SsObFUQdzNVAyoTZsbPQ+Dx7EWUrCQPy48w2Y699ruS1PupgtAwz6O7eTK0PvYRj16jxOgkGaxZ6w2cyP861aGVFoi1IydZimFT9JUUacMvz7BZzTV+Q4TTxiWOIw2yIpXvH0fbXh5Q1ZSmm8AyK1qdwe8jvDUu7nUQtv1Wm3Ua9nFNKJRhZwpKOf9BnE4IsvGEPgNQ78koitF/LAz+8KrWyhF+uTWsx3KnQ3www2ZuhGwhGKucc31hp/GXITISRcRQWDB1OFulDs=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(4143699003)(10067099003)(260925021311599003)(18002099003)(6133799003)(260925021911599003)(56012099006)(11063799006)(22082099003)(38070700021)(260925022911599003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <B19D0FCDD0CA1548AD42B14DE08D92E3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 cvRBD89vi2XdO+jc461FnkCfP4l5NYIV3uGbRAV7n6pOot3LCzzdtVWX055Mm2ibQI3Yf8jfBchla543HulZXDw0HDgtOIxyfxiOXi1vwq0X7IBuHfs9gl2FtYnoWRjEdj8mWswn/1zX+dIzrS3+XEOZGSiZjjrHX9KYY0xVhrajCrw0mbP8jwaStuRS/Zw/GQrFLYcRNIqXtXiR0VEC1AdV2kHeO1SVt3H6EpWD2T1Aa3nedxyADRr1ecMNIsSHSmi0epeXTvBbeR/8lKfs+cQ/7HtAERW/ezZKWy1KZXK/G3asWxR8zAfWmg9u6H9XD/ZULoDQ42PQQaIxO9ZUIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11820
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 ZR1PEPF0000E6AD.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9c89d60b-85c0-4613-241f-08df1d7c2ffc
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|7416014|36860700016|376014|14060799003|35042699022|6133799003|18002099003|22082099003|10067099003|4143699003|56012099006|260925021311599003|260925021911599003|260925022911599003|11063799006;
X-Microsoft-Antispam-Message-Info:
	Gj7gc0ciGo6r9P1znbkEougOrKBvMvi57tblE4fSNKxN77EY4zqk9mCaM3G9ikq9lVOxXI0b71ZX/vFWev0VooEAQu+4eW6KVYyfnlP3GVaLuEw1hWOtaEzVqPBnbwulQaOB9fSvcuHr5EbfHlC7FQjFLkuu4IBK3mSYM11sg23qxKv2mcpTNNlX2/iXL4bKx9+3T5z4pNEOkQ8xv6layeMxN8KHybyFQ6eurKQjnKeWizg7ChSFKznK3aQM4rWJUAzDneBjDdApxgEKQHppdYAM7mtLXNvqxILzL4jS2kCLV13asenFW4IpQheUFwlS9HEKQfY7iEawfBc1zrfz+dEbivzJw7PJJg43tTM2MEp7ZvlMcPmCc2ODx8jlYXF794EMiMm0UjMBukkdHgmsQRHZJFYN16BqhKiP3MUuc/Chtrcgj1/62vS5pF2e/9crJoQJzsU4obGD+pZtRb7vN7B+mKqdh9o9U9xPfPzYDGU5YxBML7F8Mlafs27AGyNGXu1iPZYdj8MbwXSfNRgQtek5NwjNrcvM7Ru9oCoHhWGdUiYyN3tChd1ditzYTPbwEQlszpDS97Jfr09V9zq+GYvjdG7s0tf26fu3g0csJu8TR0+wrrOTCCeoF1MkqXYHZG2kAJw7iL5rulaKpk7Z+JWUAsmkuYYgAtMkSDRDcwCFrDtOdAibJ5434pPYyrgaDE383IH0YYtm4FSHXVmPUA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(7416014)(36860700016)(376014)(14060799003)(35042699022)(6133799003)(18002099003)(22082099003)(10067099003)(4143699003)(56012099006)(260925021311599003)(260925021911599003)(260925022911599003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	J2yIkijvzoFZC9Wbh1TGtNnry0Nz1NgXbxfPzKm2EAogMkkLkSSo9+MXD7ugXBLZgiycWABIaP+Gvig+vUws5Ts5qjXGS7vEifuEgctHp8GtjBav5A7w/n9ykrSng/Zzc0cLYtmDEGwtc5tA9gZFp3dgALotV1+sY8wNGU+oUvGGheMHXRYIuZ5DIRi3/27T871/Jwych1xAzysXUCCfiW6hokbaY2wq4oxDR4JSWSoapHG2CwTM4Us+D3MtFIAl8cQwinst0kwjcqEIEH5Nn3zSNd1onDUL971PlEKAFJWZ07GhpMvHn5BQ6zslh1OyRj6ht+YnlVtBkxD52qlDwFbRcwTdhnObR89unn73rUX/UgZO3xj18ON7sbeIWCe4H/hfF/B7+n1FE7KfS9BwlcjrAocTgZyDSnr8LRWUPsNQwkCRPxTo0KIMGqOkURO8
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 16:19:32.0641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca73b19c-1691-476c-6ae6-08df1d7c477b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E6AD.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB726458
X-purgate-ID: tlsNG-720697/1790612380-F0EA32AC-ED2BCBA4/0/0
X-purgate-type: clean
X-purgate-size: 19915

Hi Mykola,

> On 27 Aug 2026, at 16:32, Mykola Kvach <mykola_kvach@epam.com> wrote:
>=20
> Introduce CONFIG_HAS_HWDOM_SYSTEM_SUSPEND as an architecture-selected
> capability for platforms where the hardware domain can be parked with
> SHUTDOWN_suspend without calling hwdom_shutdown().
>=20
> Expose PSCI SYSTEM_SUSPEND as a vPSCI operation for all domains. For
> non-control domains, including the hardware domain when it is not acting
> as a control domain, the call is handled as a guest/domain suspend reques=
t
> and parks the domain in SHUTDOWN_suspend.
>=20
> Control domains need additional sequencing because their SYSTEM_SUSPEND
> request is used to coordinate host-wide suspend. A non-last awake control
> domain may be parked in SHUTDOWN_suspend without requiring the host
> suspend path to be available. The last awake control domain is treated as
> the point where the request becomes a host-suspend request, and it may
> only proceed when all non-control domains are already in SHUTDOWN_suspend
> and the host suspend path is available.
>=20
> Keep the control-domain sequencing and domain-readiness checks out of
> PSCI_FEATURES. They are per-attempt runtime conditions rather than stable
> PSCI function availability. Advertise SYSTEM_SUSPEND as implemented by
> vPSCI and report attempt-time policy failures as PSCI_DENIED.
>=20
> Select HAS_HWDOM_SYSTEM_SUSPEND independently from CONFIG_SYSTEM_SUSPEND
> so that SHUTDOWN_suspend from the hardware domain can be treated as a
> domain suspend state rather than as a hardware-domain initiated host
> shutdown. This does not by itself imply that host-wide suspend is
> available.
>=20
> Add host_system_suspend_allowed() to combine the host PSCI SYSTEM_SUSPEND
> capability with runtime blockers reported by Xen-owned subsystems. Add
> runtime blockers for registered serial, IOMMU, GIC and SMMUv3 MSI IRQ
> paths lacking suspend/resume support. These blockers are runtime based,
> so they only apply to drivers or paths that Xen actually uses on the
> platform. For SMMUv3, the blocker applies only when Xen actually uses the
> MSI IRQ path, since resume does not restore the SMMU *_IRQ_CFGn MSI
> registers yet.
>=20
> Add a struct domain forward declaration to xen/suspend.h so the generic
> header can expose arch_domain_resume() without requiring a full domain.h
> include.
>=20
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> Reviewed-by: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
> ---
> Changes in V12:
> - handle missing is_shut_down, change checking to call of
>  domain_shutdown_completed
>=20
> Changes in V11:
> - Mark host_system_suspend_runtime_allowed as __ro_after_init.
> - Avoid printing the SMMUv3 MSI IRQ host suspend blocker more than once
>  when multiple SMMUv3 instances use MSIs.
> - Wrap the Arm IOMMU host suspend blocker in CONFIG_SYSTEM_SUSPEND to mak=
e
>  its policy-only use explicit.
>=20
> Changes in V10:
> - Return PSCI_DENIED rather than PSCI_NOT_SUPPORTED when the last awake
>  control domain cannot proceed to host suspend, keeping PSCI_FEATURES
>  stable once SYSTEM_SUSPEND is advertised.
> - Shorten SYSTEM_SUSPEND blocker messages and use %pd when logging the
>  control domain.
> - Mark serial_suspend_available as __ro_after_init.
> - Mention the struct domain forward declaration added to xen/suspend.h.
>=20
> Changes in V9:
> - Select HAS_HWDOM_SYSTEM_SUSPEND independently from CONFIG_SYSTEM_SUSPEN=
D
>  so that hardware-domain SHUTDOWN_suspend support is not tied to
>  host-wide system suspend availability.
> - Add runtime host suspend blockers for Xen-owned subsystems lacking
>  suspend/resume support.
> - Keep vPSCI SYSTEM_SUSPEND advertised through PSCI_FEATURES and enforce
>  control-domain sequencing in the call handler.
> ---
> xen/arch/arm/Kconfig                  |   1 +
> xen/arch/arm/gic.c                    |   6 ++
> xen/arch/arm/include/asm/psci.h       |   3 +
> xen/arch/arm/include/asm/suspend.h    |  10 ++-
> xen/arch/arm/psci.c                   |   7 ++
> xen/arch/arm/suspend.c                |  40 +++++++++
> xen/arch/arm/vpsci.c                  | 114 +++++++++++++++++++++++---
> xen/common/Kconfig                    |   3 +
> xen/common/domain.c                   |   7 +-
> xen/drivers/char/serial.c             |  12 +++
> xen/drivers/passthrough/arm/iommu.c   |   6 ++
> xen/drivers/passthrough/arm/smmu-v3.c |   9 ++
> xen/include/xen/serial.h              |   1 +
> xen/include/xen/suspend.h             |   2 +
> 14 files changed, 208 insertions(+), 13 deletions(-)
>=20
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 843a43897e..9027aa17eb 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -19,6 +19,7 @@ config ARM
> select HAS_ALTERNATIVE if HAS_VMAP
> select HAS_DEVICE_TREE_DISCOVERY
> select HAS_DOM0LESS
> + select HAS_HWDOM_SYSTEM_SUSPEND if !MPU
> select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
> select HAS_STACK_PROTECTOR
> select HAS_STATIC_MEMORY
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index ffc11f36a1..0695474432 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -26,6 +26,7 @@
> #include <asm/device.h>
> #include <asm/io.h>
> #include <asm/gic.h>
> +#include <asm/suspend.h>
> #include <asm/vgic.h>
> #include <asm/acpi.h>
>=20
> @@ -44,6 +45,11 @@ static void __init __maybe_unused build_assertions(voi=
d)
> void register_gic_ops(const struct gic_hw_operations *ops)
> {
>     gic_hw_ops =3D ops;
> +
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    if ( !ops->suspend || !ops->resume )
> +        host_system_suspend_disable("GIC driver lacks suspend support");
> +#endif
> }
>=20
> static void clear_cpu_lr_mask(void)
> diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/p=
sci.h
> index bb3c73496e..142fa1bfe5 100644
> --- a/xen/arch/arm/include/asm/psci.h
> +++ b/xen/arch/arm/include/asm/psci.h
> @@ -24,6 +24,9 @@ void call_psci_cpu_off(void);
> void call_psci_system_off(void);
> void call_psci_system_reset(void);
> int call_psci_system_suspend(void);
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +bool psci_system_suspend_allowed(void);
> +#endif
>=20
> /* Range of allocated PSCI function numbers */
> #define PSCI_FNUM_MIN_VALUE                 _AC(0,U)
> diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/as=
m/suspend.h
> index c848fc6340..50dc6e9fdf 100644
> --- a/xen/arch/arm/include/asm/suspend.h
> +++ b/xen/arch/arm/include/asm/suspend.h
> @@ -39,7 +39,15 @@ extern struct resume_cpu_context resume_cpu_context;
>=20
> int prepare_resume_ctx(void);
> void hyp_resume(void);
> -#endif /* CONFIG_SYSTEM_SUSPEND */
> +bool host_system_suspend_allowed(void);
> +void host_system_suspend_disable(const char *reason);
> +
> +#else /* !CONFIG_SYSTEM_SUSPEND */
> +
> +static inline bool host_system_suspend_allowed(void) { return false; }
> +static inline void host_system_suspend_disable(const char *reason) {}
> +
> +#endif
>=20
> #endif /* ARM_SUSPEND_H */
>=20
> diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
> index e05dae1133..e9d78668fd 100644
> --- a/xen/arch/arm/psci.c
> +++ b/xen/arch/arm/psci.c
> @@ -41,6 +41,13 @@ static bool __ro_after_init has_psci_system_suspend;
>=20
> #define PSCI_RET(res)   ((int32_t)(res).a0)
>=20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +bool psci_system_suspend_allowed(void)
> +{
> +    return has_psci_system_suspend;
> +}
> +#endif
> +
> int call_psci_cpu_on(int cpu)
> {
>     struct arm_smccc_res res;
> diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> index 6ea4a0f9cc..c7c26bcf03 100644
> --- a/xen/arch/arm/suspend.c
> +++ b/xen/arch/arm/suspend.c
> @@ -1,9 +1,49 @@
> /* SPDX-License-Identifier: GPL-2.0-only */
>=20
> +#include <asm/psci.h>
> #include <asm/suspend.h>
>=20
> +#include <xen/lib.h>
> +#include <xen/serial.h>
> +
> struct resume_cpu_context resume_cpu_context;
>=20
> +/*
> + * Non-PSCI infrastructure can make host suspend impossible even when th=
e PSCI
> + * SYSTEM_SUSPEND conduit is present, e.g. when a Xen-owned driver has n=
o valid
> + * suspend/resume path.
> + *
> + * This gate is checked only when the last awake control domain attempts=
 to
> + * turn a guest SYSTEM_SUSPEND request into a host-suspend request.
> + */
> +static bool __ro_after_init host_system_suspend_runtime_allowed =3D true=
;
> +
> +static bool host_serial_suspend_allowed(void)
> +{
> +    if ( serial_suspend_supported() )
> +        return true;
> +
> +    printk_once(XENLOG_INFO
> +                "Host SYSTEM_SUSPEND blocked: serial unsupported\n");
> +
> +    return false;
> +}
> +
> +bool host_system_suspend_allowed(void)
> +{
> +    return psci_system_suspend_allowed() &&
> +           host_serial_suspend_allowed() &&
> +           host_system_suspend_runtime_allowed;
> +}
> +
> +void host_system_suspend_disable(const char *reason)
> +{
> +    host_system_suspend_runtime_allowed =3D false;
> +
> +    printk(XENLOG_INFO "Host SYSTEM_SUSPEND blocked: %s\n",
> +           reason ? reason : "unsupported suspend/resume path");
> +}
> +
> /*
>  * Local variables:
>  * mode: C
> diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> index ac6af6118f..a41355d75d 100644
> --- a/xen/arch/arm/vpsci.c
> +++ b/xen/arch/arm/vpsci.c
> @@ -5,6 +5,7 @@
>=20
> #include <asm/current.h>
> #include <asm/domain.h>
> +#include <asm/suspend.h>
> #include <asm/vgic.h>
> #include <asm/vpsci.h>
> #include <asm/event.h>
> @@ -219,6 +220,89 @@ static void do_psci_0_2_system_reset(void)
>     domain_shutdown(d,SHUTDOWN_reboot);
> }
>=20
> +/*
> + * Serialise SYSTEM_SUSPEND policy decisions with the domain suspend tra=
nsition,
> + * so multiple control domains cannot all observe each other as still aw=
ake.
> + */
> +static DEFINE_SPINLOCK(vpsci_system_suspend_lock);
> +
> +static bool domain_in_suspend_state(struct domain *d)
> +{
> +    bool suspended;
> +
> +    spin_lock(&d->shutdown_lock);
> +    suspended =3D domain_shutdown_completed(d) && (d->shutdown_code =3D=
=3D SHUTDOWN_suspend);

This lines is over 80 chars and should be broken down.

> +    spin_unlock(&d->shutdown_lock);
> +
> +    return suspended;
> +}
> +
> +static int32_t domain_psci_system_suspend_policy(struct domain *d)
> +{
> +    struct domain *other;
> +    bool last_awake_control_domain =3D true;
> +    bool awake_non_control_domain =3D false;
> +
> +    /* Only control domains participate in sequencing policy. */
> +    if ( !is_control_domain(d) )
> +        return 0;

I am wondering what would happen in a dom0less setup with no control
domain if the domains request SYSTEM_SUSPEND.

Could you explain how they would be resumed?
Should we deny SYSTEM_SUSPEND requests in this case?

Cheers
Bertrand

> +
> +    rcu_read_lock(&domlist_read_lock);
> +
> +    for_each_domain ( other )
> +    {
> +        bool suspended;
> +
> +        if ( other =3D=3D d )
> +            continue;
> +
> +        suspended =3D domain_in_suspend_state(other);
> +        if ( suspended )
> +            continue;
> +
> +        if ( is_control_domain(other) )
> +        {
> +            last_awake_control_domain =3D false;
> +            break;
> +        }
> +
> +        awake_non_control_domain =3D true;
> +    }
> +
> +    rcu_read_unlock(&domlist_read_lock);
> +
> +    /*
> +     * Another control domain is still awake. This request is only the f=
irst
> +     * phase of the sequencing: park this control domain and leave the h=
ost
> +     * running. Host-wide suspend gates must not block this intermediate=
 state.
> +     */
> +    if ( !last_awake_control_domain )
> +        return 0;
> +
> +    /*
> +     * This is the last awake control domain. It must not be parked unle=
ss the
> +     * request can proceed as a host-suspend request; otherwise Xen woul=
d lose
> +     * the last domain that can coordinate the system suspend.
> +     */
> +    if ( awake_non_control_domain )
> +    {
> +        printk(XENLOG_DEBUG
> +               "SYSTEM_SUSPEND denied for %pd: non-control domains awake=
\n",
> +               d);
> +        return PSCI_DENIED;
> +    }
> +
> +    /*
> +     * Host-wide gates are relevant only for the last-control-domain cas=
e. They
> +     * must not block parking of a non-last control domain, but they mus=
t deny
> +     * the last control domain when host suspend is not currently availa=
ble.
> +     */
> +    if ( !host_system_suspend_allowed() )
> +        return PSCI_DENIED;
> +
> +    return 0;
> +}
> +
> static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t c=
id)
> {
>     int32_t rc;
> @@ -232,10 +316,6 @@ static int32_t do_psci_1_0_system_suspend(register_t=
 epoint, register_t cid)
>     if ( is_64bit_domain(d) && is_thumb )
>         return PSCI_INVALID_ADDRESS;
>=20
> -    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
> -    if ( is_hardware_domain(d) )
> -        return PSCI_NOT_SUPPORTED;
> -
>     /* Ensure that all CPUs other than the calling one are offline */
>     domain_lock(d);
>     for_each_vcpu ( d, v )
> @@ -252,16 +332,29 @@ static int32_t do_psci_1_0_system_suspend(register_=
t epoint, register_t cid)
>     if ( rc )
>         return PSCI_DENIED;
>=20
> -    rc =3D domain_shutdown(d, SHUTDOWN_suspend);
> +    spin_lock(&vpsci_system_suspend_lock);
> +
> +    rc =3D domain_psci_system_suspend_policy(d);
> +    if ( !rc )
> +    {
> +        rc =3D domain_shutdown(d, SHUTDOWN_suspend);
> +        if ( rc )
> +            rc =3D PSCI_DENIED;
> +        else
> +        {
> +            rctx->ctxt =3D ctxt;
> +            rctx->wake_cpu =3D current;
> +        }
> +    }
> +
> +    spin_unlock(&vpsci_system_suspend_lock);
> +
>     if ( rc )
>     {
>         free_vcpu_guest_context(ctxt);
> -        return PSCI_DENIED;
> +        return rc;
>     }
>=20
> -    rctx->ctxt =3D ctxt;
> -    rctx->wake_cpu =3D current;
> -
>     gprintk(XENLOG_DEBUG,
>             "SYSTEM_SUSPEND requested, epoint=3D%#"PRIregister", cid=3D%#=
"PRIregister"\n",
>             epoint, cid);
> @@ -287,10 +380,9 @@ static int32_t do_psci_1_0_features(uint32_t psci_fu=
nc_id)
>     case PSCI_0_2_FN32_SYSTEM_RESET:
>     case PSCI_1_0_FN32_PSCI_FEATURES:
>     case ARM_SMCCC_VERSION_FID:
> -        return 0;
>     case PSCI_1_0_FN32_SYSTEM_SUSPEND:
>     case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> -        return is_hardware_domain(current->domain) ? PSCI_NOT_SUPPORTED =
: 0;
> +        return 0;
>     default:
>         return PSCI_NOT_SUPPORTED;
>     }
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index da80fdba84..52bd98f7ad 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -140,6 +140,9 @@ config HAS_EX_TABLE
> config HAS_FAST_MULTIPLY
> bool
>=20
> +config HAS_HWDOM_SYSTEM_SUSPEND
> + bool
> +
> config HAS_IOPORTS
> bool
>=20
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index e16f1ac383..10c358c7aa 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1377,6 +1377,11 @@ void __domain_crash(struct domain *d)
>     domain_shutdown(d, SHUTDOWN_crash);
> }
>=20
> +static inline bool want_hwdom_shutdown(uint8_t reason)
> +{
> +    return !IS_ENABLED(CONFIG_HAS_HWDOM_SYSTEM_SUSPEND) ||
> +           reason !=3D SHUTDOWN_suspend;
> +}
>=20
> int domain_shutdown(struct domain *d, u8 reason)
> {
> @@ -1393,7 +1398,7 @@ int domain_shutdown(struct domain *d, u8 reason)
>         d->shutdown_code =3D reason;
>     reason =3D d->shutdown_code;
>=20
> -    if ( is_hardware_domain(d) )
> +    if ( is_hardware_domain(d) && want_hwdom_shutdown(reason) )
>         hwdom_shutdown(reason);
>=20
>     if ( domain_shutting_down(d) )
> diff --git a/xen/drivers/char/serial.c b/xen/drivers/char/serial.c
> index cf0abf1893..1cdf4968ac 100644
> --- a/xen/drivers/char/serial.c
> +++ b/xen/drivers/char/serial.c
> @@ -490,6 +490,8 @@ const struct vuart_info *serial_vuart_info(int idx)
>=20
> #ifdef CONFIG_SYSTEM_SUSPEND
>=20
> +static bool __ro_after_init serial_suspend_available =3D true;
> +
> void serial_suspend(void)
> {
>     int i;
> @@ -506,6 +508,11 @@ void serial_resume(void)
>             com[i].driver->resume(&com[i]);
> }
>=20
> +bool serial_suspend_supported(void)
> +{
> +    return serial_suspend_available;
> +}
> +
> #endif /* CONFIG_SYSTEM_SUSPEND */
>=20
> void __init serial_register_uart(int idx, struct uart_driver *driver,
> @@ -514,6 +521,11 @@ void __init serial_register_uart(int idx, struct uar=
t_driver *driver,
>     /* Store UART-specific info. */
>     com[idx].driver =3D driver;
>     com[idx].uart   =3D uart;
> +
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    if ( !driver->suspend || !driver->resume )
> +        serial_suspend_available =3D false;
> +#endif
> }
>=20
> void __init serial_async_transmit(struct serial_port *port)
> diff --git a/xen/drivers/passthrough/arm/iommu.c b/xen/drivers/passthroug=
h/arm/iommu.c
> index 100545e23f..461e01703e 100644
> --- a/xen/drivers/passthrough/arm/iommu.c
> +++ b/xen/drivers/passthrough/arm/iommu.c
> @@ -19,6 +19,7 @@
> #include <xen/device_tree.h>
> #include <xen/iommu.h>
> #include <xen/lib.h>
> +#include <xen/suspend.h>
>=20
> #include <asm/device.h>
>=20
> @@ -46,6 +47,11 @@ void __init iommu_set_ops(const struct iommu_ops *ops)
>     }
>=20
>     iommu_ops =3D ops;
> +
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    if ( !ops->suspend || !ops->resume )
> +        host_system_suspend_disable("IOMMU driver lacks suspend support"=
);
> +#endif
> }
>=20
> int __init iommu_hardware_setup(void)
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthro=
ugh/arm/smmu-v3.c
> index 7f1d00fb81..16947a12f2 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -91,6 +91,7 @@
> #include <asm/io.h>
> #include <asm/iommu_fwspec.h>
> #include <asm/platform.h>
> +#include <asm/suspend.h>
>=20
> #include "smmu-v3.h"
>=20
> @@ -1866,6 +1867,7 @@ static void arm_smmu_write_msi_msg(struct msi_desc =
*desc, struct msi_msg *msg)
>=20
> static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
> {
> + static bool __ro_after_init host_suspend_blocked_by_msi;
> struct msi_desc *desc;
> int ret, nvec =3D ARM_SMMU_MAX_MSIS;
> struct device *dev =3D smmu->dev;
> @@ -1910,6 +1912,13 @@ static void arm_smmu_setup_msis(struct arm_smmu_de=
vice *smmu)
> }
> }
>=20
> + if ( !host_suspend_blocked_by_msi )
> + {
> + host_suspend_blocked_by_msi =3D true;
> + host_system_suspend_disable(
> + "SMMUv3 MSI IRQ path is unsupported for host suspend");
> + }
> +
> /* Add callback to free MSIs on teardown */
> devm_add_action(dev, arm_smmu_free_msis, dev);
> }
> diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
> index 8e18445552..418b00ead0 100644
> --- a/xen/include/xen/serial.h
> +++ b/xen/include/xen/serial.h
> @@ -137,6 +137,7 @@ const struct vuart_info* serial_vuart_info(int idx);
> /* Serial suspend/resume. */
> void serial_suspend(void);
> void serial_resume(void);
> +bool serial_suspend_supported(void);
> #endif
>=20
> /*
> diff --git a/xen/include/xen/suspend.h b/xen/include/xen/suspend.h
> index 6f94fd53b0..a941331035 100644
> --- a/xen/include/xen/suspend.h
> +++ b/xen/include/xen/suspend.h
> @@ -6,6 +6,8 @@
> #if __has_include(<asm/suspend.h>)
> #include <asm/suspend.h>
> #else
> +struct domain;
> +
> static inline void arch_domain_resume(struct domain *d) {}
> #endif
>=20
> --=20
> 2.43.0
>=20


