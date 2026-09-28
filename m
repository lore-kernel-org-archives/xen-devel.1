Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A143CA5FA2
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 16:18:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436135.1654906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBE3s-00016s-JU; Mon, 28 Sep 2026 16:18:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436135.1654906; Mon, 28 Sep 2026 16:18:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBE3s-00016e-Fb; Mon, 28 Sep 2026 16:18:40 +0000
Received: by outflank-mailman (input) for mailman id 1436135;
 Mon, 28 Sep 2026 16:18:38 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1xBE3q-00015f-J2
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 16:18:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBE3o-009zb7-Cl
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 18:18:36 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6aba9331-8faa-0a2a0a5109dd-0a2a4508863a-34
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 18:18:36 +0200
Received: from [40.107.130.39]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6aba935b-f659-0a2a45080019-286b82270d95-3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 18:18:36 +0200
Received: from PAZP264CA0195.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:237::23)
 by FRWPR08MB11679.eurprd08.prod.outlook.com (2603:10a6:d10:1b0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Mon, 28 Sep
 2026 16:18:32 +0000
Received: from MI3PEPF00008552.eurprd05.prod.outlook.com
 (2603:10a6:102:237:cafe::99) by PAZP264CA0195.outlook.office365.com
 (2603:10a6:102:237::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 16:18:32 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MI3PEPF00008552.mail.protection.outlook.com (10.167.240.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 16:18:31 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by GV2PR08MB11820.eurprd08.prod.outlook.com (2603:10a6:150:303::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.4; Mon, 28 Sep
 2026 16:17:59 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 16:17:59 +0000
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
 b=fv3pyUWxwm5sfNEGJ4cWT5uGTVC+WQp+AnyTpFS7okYnEqVccbRRP+K0kPmeKajldPQnDu91Akt8fymuVgobWnQTP3v6485x0ZwdlfbXJJOQV8ppOvVDgq+Bb+m4xoBs5+9QuCeh0R672iYubzXXiFcbIclJQfTC8kkqJ2KtwgoAtpLetJWiE+loj11tMKHaM32MBrWXvqWUGvwrTxJepEbOXEtMjYGUbnyRJfAXjLuGhLMyjYxJ8noxUDZITUliHXZP+TpwUulhG8FD1v3RwT9+N1m41XARI3u6xrP9i8XM20NlWCwbssnRWsXAaQzCWhSZvR6WpW+PEdw6Yb7PlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHfQ6x0TuWYN9jzUa+00XdYZIgWlMVC7rUAENlKK84w=;
 b=spE7BWz3zMTiz8X2YlL9aSFEN75vITiFCZBnZ0CgUgr+81PLI1p8EEd566b9yRNo0b3OR+EvG/7mUOhpubpjMq/EJZyBRREpk3pVojezYnTLnqYs9uzzA0s1FYo/US2nulLGJ7kcCkQed7vOBoqjoqqpfkQFanJLq522KBXqIyYyiaEyVYSJiO6jDaDHjLYVquNPqwKMYVh5quuvRmPZh2qXjq0qSowy+grIaGxrFg+Zd5dHHk454+5d7SDxlmLgWg0pQ387/ADrZZ/O43gyWUX5oXe/CR+M4eVTfELWge1Wok0+2CC2x+WZmzA8vQ9iSIWx/SXm6X8Kdjopa9ihgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHfQ6x0TuWYN9jzUa+00XdYZIgWlMVC7rUAENlKK84w=;
 b=nEaZNqS1BF/AWezKbH27ag4Ve4vuDTO4tVi8j4n2h8UaSQtkLSyXftBl70fbxAxAaL0wBDx0U6Zu93bk1P/+h5qsyHpmoLPFNN7/pKX46dD0wJxu9ifSL/wqO6Cn7kuUyj+ZmRd9JYRi4jYnIAYCPWz/wBbEdsh9iJwJLCAir3k=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHfQ6x0TuWYN9jzUa+00XdYZIgWlMVC7rUAENlKK84w=;
 b=nEaZNqS1BF/AWezKbH27ag4Ve4vuDTO4tVi8j4n2h8UaSQtkLSyXftBl70fbxAxAaL0wBDx0U6Zu93bk1P/+h5qsyHpmoLPFNN7/pKX46dD0wJxu9ifSL/wqO6Cn7kuUyj+ZmRd9JYRi4jYnIAYCPWz/wBbEdsh9iJwJLCAir3k=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykola Kvach <mykola_kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Luca Fancellu
	<Luca.Fancellu@arm.com>
Subject: Re: [PATCH v12 10/13] xen/arm64: Save/restore CPU context across
 SYSTEM_SUSPEND
Thread-Topic: [PATCH v12 10/13] xen/arm64: Save/restore CPU context across
 SYSTEM_SUSPEND
Thread-Index: AQHdNjDrck5tdQi+nEWf4DlkNNzg5rbkXWsA
Date: Mon, 28 Sep 2026 16:17:59 +0000
Message-ID: <08F80D50-EA31-49AB-B8C2-A38A01A8C2BD@arm.com>
References: <cover.1787838455.git.mykola_kvach@epam.com>
 <552b979775f1f67d49f7ac303c1a1d4feafe820a.1787838455.git.mykola_kvach@epam.com>
In-Reply-To:
 <552b979775f1f67d49f7ac303c1a1d4feafe820a.1787838455.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|GV2PR08MB11820:EE_|MI3PEPF00008552:EE_|FRWPR08MB11679:EE_
X-MS-Office365-Filtering-Correlation-Id: 135f340a-e5a5-450a-f132-08df1d7c23a0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|4143699003|10067099003|260925021311599003|18002099003|6133799003|260925021911599003|56012099006|5023799004|11063799006|22082099003|38070700021|260925022911599003;
X-Microsoft-Antispam-Message-Info-Original:
 TPuQrbTy88PXDYNILSL6UoAwwcqOiATTTNlkZvO3jxbuZUz5bzwUs1/hpnLhihUWbHyTl8msHA5K93I2bFmqLRhHAYnT8GynySjYuREVdSAyPCSrLdXnGL535fh40FJjufdrTAA70DrQZ1oBzO6FPp6wMbaNEFd7erxJVvv9hlRkeUDjcsFAIQqtbaaZRPEl45SP0sjkFjTZnYXi60TX7zNWGkO4qDOLR2BxBcxowq4Be5Kpqg9R20R7g2Uj5MAajBxZp5s/Z+KOisxWA+fp38UwCLIiIp9071tad1y0t7hlFATOjY+V0W8CBRL8JBM1OhYbMnZFrbPdpHGClrSG/tcfw9GFpaArq79njgykCPoffjs9EhLw+3SeyxNv/uW6udEbTVUEjE7O/z8MAU4HlEmEo6ATmFGme6zVJ4dQUoDs6eSwe//rXLpzCpe2sWOxHT0puEumZGrBLCUWbovVNKKgV09m4UDLHnS1TRmOQBLdXCsDd37nAoSWW0DzvjMDehB2bVr58AioekAzrLqMwrNAEjK/cjrwHQ+VIkGVcArs3QBjTjlQgzFrykMNUr9fnexiYfT/xrFq1SdFCaS9Ytf6gqxvBTlw0ywNcG+YgTLvn539jpNxw8h9ueaSgNx2hpTM3kUJZ5XDNxm8fWUMuV26+/cXbwITylPfrWRRYI8RLNhhAbSduHECy/MwONazHWIXgyCqWsBYWAzyBFDlit6YUV8izcTIc0ruFnin2KQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(4143699003)(10067099003)(260925021311599003)(18002099003)(6133799003)(260925021911599003)(56012099006)(5023799004)(11063799006)(22082099003)(38070700021)(260925022911599003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DB33AC02F8B0D04DBD187133D4300FD8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 blQ0ZjGiGtQNUiX4jSbouG69eWvm3Y9vbvSw7zxze1gHmiNVc2+VJQZJZ8Bu/dk/+OKd9AeTWvm6v5aKNUg8noOJcSC/M1TLtNwPFlwYmvk4u3EkqBg0W0GfZLXEjdQVtgsWZNRxTC/+uhvERYTo0mAst9Z1ko55DUieoGpgSm1me6xOI0yuT7lR+9E0CnlJE6br5KTMbA4DY7/CEFRwRFevZA2rApVFi4gz+TGJfMYieqedcI4pLsYxyhI6hVfHYUxvlvzAw5Oa9rpTr6+vMRVIGl9FYWNJwz35xXPqmpDY9Q7Ymh55CAi3vMPYhs9iYK2bHNXg6OShHavhFz4feA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11820
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MI3PEPF00008552.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c3b19029-be5d-417b-fcdc-08df1d7c1002
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|35042699022|14060799003|376014|36860700016|10067099003|260925021311599003|11063799006|260925021911599003|5023799004|260925022911599003|6133799003|22082099003|18002099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	aJfWOFiiyJlzme98Bj3r5WH7zKTVNGo9g4LilCmt+K2oWUpQqOxj+kRxStNc/kpVQZrUsts+byUqxc2ZRWesBeD5WYbsIeYxGHbhkFvjcAO2Z2krvF0lxbRoabiHIXO8AfLBcI/2R3oQYxAAZTEDAMbO2mrIbWso22WYzU51IVKFQkY7CMiQhlz+acvPuuzlAyGe879h9ow9OmefzOWzmod2KAMQiRawNGQ6xQtIuE6mEInNRtE9JHaADyjc2YUHPdC+0YbIaUricNIVIgn4u+c13IQP2DbRoUlWKYPReKxyl63XggpQVHuzNA0JGUCvdgkhbi3kSBtS2gmW/27414sJkrdvTgF9CPx4+JsNOWDykPRkTPjSQG241KjTouvTy74xwdP8grwrYWoW7t4DME0aWfxVZjlQXEeJ7kRhEO1bHP6qFbbdrufudymO4y7kQBu14SrbeASzrCmH9njtYYL0iCgNv+KrwaGjR2daYvVTSPGS4RDuoMWtcZVCFFmPvUN6bmitdr+BNG/AfxziWXtKUju72c7ZB//tpnONR8LYW32ZJc63awYTnvHjO+U8MlPR47lW+IsxbN8Gc+0pbD/k0h4c7xUSUCHcnaNiLXIwXk/MecKBo8RXd/wg+L5XIZl90knmRDD+uxCWyxPyN7+c9wM9iMxysMLmpVp+h9SmEwG3VbZVGzQf+JPIF35D87ouJHi9ovU3tClVLQGHdQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(35042699022)(14060799003)(376014)(36860700016)(10067099003)(260925021311599003)(11063799006)(260925021911599003)(5023799004)(260925022911599003)(6133799003)(22082099003)(18002099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kkVn0ee3/u5kUrmF2bMQ4cKZfoJE57AvBNqaGLoT3ruXuByczRndVazeTBKnJc+m53KwvinVOfzKxwfo34a5BhFza5qr3B1CJ1hparqIrUnRRsdTrXIcQmp4ARbLqpMakUoGJKfMSIgjXDU8ETeb6kmk7ZDOXrh62qW/3O+3xXadeEQ8toguf3Z60Hifqhh3i5s+BxcXOFOEf1tf4ObArzR+w9+TBdOOaSJ5LM6fGWjQ1kyInTZy3lHva8VcDBm1kyIs6rBSwE4rVcYgvTAN7H9YbJsOvOG03JTNg0HmL9h2qpO+npTxoVlkQiALgu66Dg7mwPSyeRKSo4mz2FeKv/Hg/NNBEyYdplgGVBY6rs4jdRjQxHbLq7mJ5uKBhtTeys4uWWNVJGh9xRclMy8Qg/Lr841U73lp3gO991VsnLXmmsLRbZyWPsP/22NDuGi5
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 16:18:31.8858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 135f340a-e5a5-450a-f132-08df1d7c23a0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008552.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR08MB11679
X-purgate-ID: tlsNG-c1860d/1790612316-D654487B-EFC20A49/0/0
X-purgate-type: clean
X-purgate-size: 12373

Hi Mykola,

> On 27 Aug 2026, at 16:31, Mykola Kvach <mykola_kvach@epam.com> wrote:
>=20
> From: Mirela Simonovic <mirela.simonovic@aggios.com>
>=20
> On wakeup from PSCI SYSTEM_SUSPEND, Xen re-enters EL2 with the MMU and
> data cache disabled. The resume path must first switch back to Xen's
> runtime page tables before it can access the saved CPU context using
> virtual addresses.
>=20
> Add an arm64 hyp_resume trampoline that reuses enable_secondary_cpu_mm()
> to enable the data cache and MMU, switch to init_ttbr, and resume in the
> runtime virtual mapping. The trampoline then restores the saved CPU
> general-purpose and system-control register context.
>=20
> prepare_resume_ctx() must be invoked just before the PSCI system suspend
> call is issued to the platform firmware. It saves the current CPU context
> and returns a non-zero value so that the caller enters the physical
> SYSTEM_SUSPEND call.
>=20
> On resume, hyp_resume restores the saved context, including the saved lin=
k
> register. Control therefore returns to the place where prepare_resume_ctx=
()
> was called. To avoid re-entering the suspend path, the restored path sees
> prepare_resume_ctx() return zero.
>=20
> The assembly save/restore code uses offsets generated by asm-offsets.c
> from struct resume_cpu_context, keeping the assembly memory accesses in
> sync with the C structure layout.
>=20
> Support for ARM32 is not implemented. Instead, compilation fails with a
> build-time error if suspend is enabled for ARM32.
>=20
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes in v10:
> - Save and restore CNTHCTL_EL2 across SYSTEM_SUSPEND
>=20
> Changes in v9:
> - Drop the misleading prepare_resume_ctx() pointer argument and make both
>  save/restore paths use the global resume_cpu_context.
> - Squash the arm64 resume trampoline into the context save/restore patch.
> - Document in code that hyp_resume relies on PSCI initial-state rules.
> - Use generic platform firmware wording instead of ATF-specific wording.
> - Rename the saved context type/storage to resume_cpu_context and rely on
>  implicit zero-initialization for the file-scope object.
> - Use asm-offsets.c-generated RESUME_CTX_* offsets to keep the assembly
>  save/restore code in sync with struct resume_cpu_context.
>=20
> Changes in v8:
> - Fix alignments in code.
>=20
> Changes in v7:
> - No functional changes, just moved commit.
> ---
> xen/arch/arm/Makefile              |   1 +
> xen/arch/arm/arm64/asm-offsets.c   |  21 +++++
> xen/arch/arm/arm64/head.S          | 122 +++++++++++++++++++++++++++++
> xen/arch/arm/include/asm/suspend.h |  27 +++++++
> xen/arch/arm/suspend.c             |  14 ++++
> 5 files changed, 185 insertions(+)
> create mode 100644 xen/arch/arm/suspend.c
>=20
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index b7afd3e58c..788db83ba9 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -51,6 +51,7 @@ obj-y +=3D setup.o
> obj-y +=3D shutdown.o
> obj-y +=3D smp.o
> obj-y +=3D smpboot.o
> +obj-$(CONFIG_SYSTEM_SUSPEND) +=3D suspend.o
> obj-$(CONFIG_SYSCTL) +=3D sysctl.o
> obj-y +=3D time.o
> obj-y +=3D traps.o
> diff --git a/xen/arch/arm/arm64/asm-offsets.c b/xen/arch/arm/arm64/asm-of=
fsets.c
> index 38a3894a3b..5d60406e9c 100644
> --- a/xen/arch/arm/arm64/asm-offsets.c
> +++ b/xen/arch/arm/arm64/asm-offsets.c
> @@ -13,6 +13,7 @@
> #include <asm/mm.h>
> #include <asm/setup.h>
> #include <asm/smccc.h>
> +#include <asm/suspend.h>
>=20
> #define DEFINE(_sym, _val)                                               =
  \
>     asm volatile ( "\n.ascii\"=3D=3D>#define " #_sym " %0 /* " #_val " */=
<=3D=3D\""\
> @@ -57,6 +58,26 @@ void __dummy__(void)
>    OFFSET(INITINFO_stack, struct init_info, stack);
>    BLANK();
>=20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +   OFFSET(RESUME_CTX_X19, struct resume_cpu_context, callee_regs[0]);
> +   OFFSET(RESUME_CTX_X21, struct resume_cpu_context, callee_regs[2]);
> +   OFFSET(RESUME_CTX_X23, struct resume_cpu_context, callee_regs[4]);
> +   OFFSET(RESUME_CTX_X25, struct resume_cpu_context, callee_regs[6]);
> +   OFFSET(RESUME_CTX_X27, struct resume_cpu_context, callee_regs[8]);
> +   OFFSET(RESUME_CTX_X29, struct resume_cpu_context, callee_regs[10]);
> +   OFFSET(RESUME_CTX_SP, struct resume_cpu_context, sp);
> +   OFFSET(RESUME_CTX_VBAR_EL2, struct resume_cpu_context, vbar_el2);
> +   OFFSET(RESUME_CTX_VTCR_EL2, struct resume_cpu_context, vtcr_el2);
> +   OFFSET(RESUME_CTX_VTTBR_EL2, struct resume_cpu_context, vttbr_el2);
> +   OFFSET(RESUME_CTX_TPIDR_EL2, struct resume_cpu_context, tpidr_el2);
> +   OFFSET(RESUME_CTX_MDCR_EL2, struct resume_cpu_context, mdcr_el2);
> +   OFFSET(RESUME_CTX_HSTR_EL2, struct resume_cpu_context, hstr_el2);
> +   OFFSET(RESUME_CTX_CPTR_EL2, struct resume_cpu_context, cptr_el2);
> +   OFFSET(RESUME_CTX_HCR_EL2, struct resume_cpu_context, hcr_el2);
> +   OFFSET(RESUME_CTX_CNTHCTL_EL2, struct resume_cpu_context, cnthctl_el2=
);
> +   BLANK();
> +#endif
> +
>    OFFSET(SMCCC_RES_a0, struct arm_smccc_res, a0);
>    OFFSET(SMCCC_RES_a2, struct arm_smccc_res, a2);
>    OFFSET(ARM_SMCCC_1_2_REGS_X0_OFFS, struct arm_smccc_1_2_regs, a0);
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 72c7b24498..962be716ae 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -561,6 +561,128 @@ END(efi_xen_start)
>=20
> #endif /* CONFIG_ARM_EFI */
>=20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +/*
> + * int prepare_resume_ctx(void)
> + *
> + * CPU context saved here will be restored on resume in hyp_resume funct=
ion.
> + * prepare_resume_ctx shall return a non-zero value. Upon restoring cont=
ext
> + * hyp_resume shall return value zero instead. From C code that invokes
> + * prepare_resume_ctx, the return value is interpreted to determine whet=
her
> + * the context is saved (prepare_resume_ctx) or restored (hyp_resume).
> + */
> +FUNC(prepare_resume_ctx)
> +        ldr   x0, =3Dresume_cpu_context
> +
> +        /* Store callee-saved registers */
> +        stp   x19, x20, [x0, #RESUME_CTX_X19]
> +        stp   x21, x22, [x0, #RESUME_CTX_X21]
> +        stp   x23, x24, [x0, #RESUME_CTX_X23]
> +        stp   x25, x26, [x0, #RESUME_CTX_X25]
> +        stp   x27, x28, [x0, #RESUME_CTX_X27]
> +        stp   x29, lr, [x0, #RESUME_CTX_X29]
> +
> +        /* Store stack-pointer */
> +        mov   x2, sp
> +        str   x2, [x0, #RESUME_CTX_SP]
> +
> +        /* Store system control registers */
> +        mrs   x2, VBAR_EL2
> +        str   x2, [x0, #RESUME_CTX_VBAR_EL2]
> +        mrs   x2, VTCR_EL2
> +        str   x2, [x0, #RESUME_CTX_VTCR_EL2]
> +        mrs   x2, VTTBR_EL2
> +        str   x2, [x0, #RESUME_CTX_VTTBR_EL2]
> +        mrs   x2, TPIDR_EL2
> +        str   x2, [x0, #RESUME_CTX_TPIDR_EL2]
> +        mrs   x2, MDCR_EL2
> +        str   x2, [x0, #RESUME_CTX_MDCR_EL2]
> +        mrs   x2, HSTR_EL2
> +        str   x2, [x0, #RESUME_CTX_HSTR_EL2]
> +        mrs   x2, CPTR_EL2
> +        str   x2, [x0, #RESUME_CTX_CPTR_EL2]
> +        mrs   x2, HCR_EL2
> +        str   x2, [x0, #RESUME_CTX_HCR_EL2]
> +        mrs   x2, CNTHCTL_EL2
> +        str   x2, [x0, #RESUME_CTX_CNTHCTL_EL2]
> +
> +        /* prepare_resume_ctx must return a non-zero value */
> +        mov   x0, #1
> +        ret
> +END(prepare_resume_ctx)
> +
> +FUNC(hyp_resume)
> +        /*
> +         * PSCI states that SYSTEM_SUSPEND follows the CPU_SUSPEND initi=
al
> +         * state rules, so PSCI-compliant firmware must enter the return
> +         * exception level with DAIF masked.
> +         */
> +
> +        /* Initialize the UART if earlyprintk has been enabled. */
> +#ifdef CONFIG_EARLY_PRINTK
> +        bl    init_uart
> +#endif
> +        PRINT_ID("- Xen resuming -\r\n")
> +
> +        bl    check_cpu_mode
> +        bl    cpu_init
> +
> +        ldr   x0, =3Dstart
> +        adr   x20, start             /* x20 :=3D paddr (start) */
> +        sub   x20, x20, x0           /* x20 :=3D phys-offset */
> +        ldr   lr, =3Dmmu_resumed
> +        b     enable_secondary_cpu_mm
> +
> +mmu_resumed:
> +        /* Now we can access the saved context, so restore it here. */
> +        ldr   x0, =3Dresume_cpu_context
> +
> +        /* Restore callee-saved registers */
> +        ldp   x19, x20, [x0, #RESUME_CTX_X19]
> +        ldp   x21, x22, [x0, #RESUME_CTX_X21]
> +        ldp   x23, x24, [x0, #RESUME_CTX_X23]
> +        ldp   x25, x26, [x0, #RESUME_CTX_X25]
> +        ldp   x27, x28, [x0, #RESUME_CTX_X27]
> +        ldp   x29, lr, [x0, #RESUME_CTX_X29]
> +
> +        /* Restore stack pointer */
> +        ldr   x2, [x0, #RESUME_CTX_SP]
> +        mov   sp, x2
> +
> +        /* Restore system control registers */
> +        ldr   x2, [x0, #RESUME_CTX_VBAR_EL2]
> +        msr   VBAR_EL2, x2
> +        ldr   x2, [x0, #RESUME_CTX_VTCR_EL2]
> +        msr   VTCR_EL2, x2
> +        ldr   x2, [x0, #RESUME_CTX_VTTBR_EL2]
> +        msr   VTTBR_EL2, x2
> +        ldr   x2, [x0, #RESUME_CTX_TPIDR_EL2]
> +        msr   TPIDR_EL2, x2
> +        ldr   x2, [x0, #RESUME_CTX_MDCR_EL2]
> +        msr   MDCR_EL2, x2
> +        ldr   x2, [x0, #RESUME_CTX_HSTR_EL2]
> +        msr   HSTR_EL2, x2
> +        ldr   x2, [x0, #RESUME_CTX_CPTR_EL2]
> +        msr   CPTR_EL2, x2
> +        ldr   x2, [x0, #RESUME_CTX_HCR_EL2]
> +        msr   HCR_EL2, x2
> +        ldr   x2, [x0, #RESUME_CTX_CNTHCTL_EL2]
> +        msr   CNTHCTL_EL2, x2
> +        isb
> +
> +        /*
> +         * Since context is restored return from this function will appe=
ar
> +         * as return from prepare_resume_ctx. To distinguish a return fr=
om
> +         * prepare_resume_ctx which is called upon finalizing the suspen=
d,
> +         * as opposed to return from this function which executes on res=
ume,
> +         * we need to return zero value here.
> +         */
> +        mov   x0, #0
> +        ret
> +END(hyp_resume)
> +
> +#endif /* CONFIG_SYSTEM_SUSPEND */
> +
> /*
>  * Local variables:
>  * mode: ASM
> diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/as=
m/suspend.h
> index 31a98a1f1b..c848fc6340 100644
> --- a/xen/arch/arm/include/asm/suspend.h
> +++ b/xen/arch/arm/include/asm/suspend.h
> @@ -3,6 +3,8 @@
> #ifndef ARM_SUSPEND_H
> #define ARM_SUSPEND_H
>=20
> +#include <xen/types.h>
> +
> struct domain;
> struct vcpu;
> struct vcpu_guest_context;
> @@ -14,6 +16,31 @@ struct resume_info {
>=20
> void arch_domain_resume(struct domain *d);
>=20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +#ifdef CONFIG_ARM_64
> +struct resume_cpu_context {
> +    register_t callee_regs[12];
> +    register_t sp;
> +    register_t vbar_el2;
> +    register_t vtcr_el2;
> +    register_t vttbr_el2;
> +    register_t tpidr_el2;
> +    register_t mdcr_el2;
> +    register_t hstr_el2;
> +    register_t cptr_el2;
> +    register_t hcr_el2;
> +    register_t cnthctl_el2;
> +} __aligned(16);
> +#else
> +#error "Define resume_cpu_context structure for arm32"
> +#endif
> +
> +extern struct resume_cpu_context resume_cpu_context;
> +
> +int prepare_resume_ctx(void);
> +void hyp_resume(void);
> +#endif /* CONFIG_SYSTEM_SUSPEND */
> +
> #endif /* ARM_SUSPEND_H */
>=20
> /*
> diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> new file mode 100644
> index 0000000000..6ea4a0f9cc
> --- /dev/null
> +++ b/xen/arch/arm/suspend.c
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <asm/suspend.h>
> +
> +struct resume_cpu_context resume_cpu_context;
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> --=20
> 2.43.0
>=20


