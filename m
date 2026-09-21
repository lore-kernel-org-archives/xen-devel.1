Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED1AC982E6
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 14:40:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427630.1650434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8fBK-0002Aw-Qf; Mon, 21 Sep 2026 14:39:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427630.1650434; Mon, 21 Sep 2026 14:39:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8fBK-0002Ap-Ny; Mon, 21 Sep 2026 14:39:46 +0000
Received: by outflank-mailman (input) for mailman id 1427630;
 Mon, 21 Sep 2026 14:39:45 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1x8fBJ-0002Aj-Hh
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 14:39:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8fBI-007Gq4-Kc
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 16:39:44 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ab14194-8faa-0a2a0a5109dd-0a2a4503c794-42
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 16:39:44 +0200
Received: from [52.101.193.31]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ab141ae-fae8-0a2a45030019-3465c11fdc83-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 16:39:44 +0200
Received: from BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
 by PH8PR12MB999321.namprd12.prod.outlook.com (2603:10b6:510:40e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 14:39:39 +0000
Received: from BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740]) by BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740%3]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 14:39:39 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QzIUuNkzN6szTu6xsloIIGC3F71I9Q02XGfCxFrt4Htza4h4UoV/T20NOVfkUHKcEcP6QiEWqHjR89DInEjgI3ryqbhHZLTANQQAJnSNNBVKZYDOyqCC8UJ80cNDndhEEbWCK4ApJNzxpUiJquMoB+MS6bjB18ikDlAdPzu19BKPw06lWVcM7DWcr4PV8Rf1rndmXpKRBr7RaIrePct27AxrOvdeLI78LVA2X9r5lYYgzhQV+EXbYwGFaic4OWMpbPVJFIFxLafB+RlNbqC8UsT7EvhjAK8Fr6UajwbbUGdizgyiydzQYAVHMn/fv1XUiRb4bwRml8fvUYlbnjZeOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gT+t27osKtV55UohSlWhFHu4gLqd2cAfltY7uhyf/fw=;
 b=tjGzHhZeC8e9K2qcU6ShGKCB+IVAT7vr9lL8xuH+hwaS072GzA5uKOKMUpJpLIaUO7iMd7r4PEoDRtudUiOvbfHnodvR1JEDawWZlI+GBEtScs+cnSUuJ/6gaJGwukOJAe2ladCIsF7hMsRTkXvU9R805sY7j9tF3iaEWBUCu4ViittTkcDA4wv3vnZqlRrwF6xCNw0FU9N6z33uD5Xte+4jZ0wZ46MGFmikzK1vS6C1GLjrekxsxo2mStB1azOthBHmsMw0QMThjrLzi4I5asX10WvojZ3/tQ2lQ7PaO/vTzC5wRqZUzWEJueuS5lkyEyrzzkLpc2YjdGEiXWiWMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gT+t27osKtV55UohSlWhFHu4gLqd2cAfltY7uhyf/fw=;
 b=094Dn2BRDVxs24ightV3ES18sZwLzQ9T/Tgl+r5v+kIY5xlOylV2iNH1SydHW98gJzyoaTW3LdXJ0qBpbA4ifebRoZLba8B/kC1Cr10DvWNkf7Zy3mglLTkU1rS8C7GXpOPhySxaiIxkp8MJyTfDifuWaMe8+tKHZyzKVkMe7ZQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 16:39:35 +0200
Message-Id: <DLL2LNJKTG8V.3K7ZHRZUEQV6X@amd.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD"
 <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan
 Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, "Doug Goldstein" <cardoe@cardoe.com>
Subject: Re: [PATCH v2 0/6] automation: add QTB test framework for riscv64
 smoke tests
From: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>
To: "Baptiste Le Duc" <baptiste.le-duc@vates.tech>,
 <baptiste.leduc38@gmail.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.17.0
References: <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech>
In-Reply-To: <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech>
X-ClientProxiedBy: MA3P292CA0009.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::10) To BY5PR12MB4999.namprd12.prod.outlook.com
 (2603:10b6:a03:1da::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4999:EE_|PH8PR12MB999321:EE_
X-MS-Office365-Filtering-Correlation-Id: 710700f0-7081-4f8a-f6fe-08df17ee2aa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|56012099006|10067099003|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Ia4g8aZToaIkBe4ZNyM0dYAXTvpL9mBdj0pkVnWorZCOLUMVvdAwfaNy+T91v7xMEUKmiTVFJ2JbiflNtHZnwUUmyUe5aFBy+pifsdcka4uGjf3k21zQtVYYhjdhe1Ep8pmkLRcmeytxURhtu1l+YizQPzbC2ue92X50yirN/Lokv5MRciSAdQnLd3w4dB2Y6bNBkQlZwyO/neZOF78zrJtocXP4lC9rV1fG6Wmz+N+NiV0/eCVNRDOJ5CpELdoObZq75L/8jX+d0OeZAS3/Os5Z34UHQXBmgPNNVoNCZVL7Lnwy+jE9m5M/UCh2saAGdG0DD5FjP8wBGhtoT0BG8eG8aH2fVuQtnZGH56aIx7+DVpcVCV8uR/OQd2qWGiLGYNqfn3sX3cl/RY92eRx1+WQD50c8iTqT9+PVCYaw/sEhMVsYMURsAEDqNiX/qQpe2jA9db8b1Ljl7ggxxUJu+VqrWMIXiMpn8bBCtDe1WnYR3P5XTKE8a4kV4+k3v0HeJwvdQp6xBRaA50vzIpaT6EFh5o01lF40D01v7ctgUu1xVoeGUOT4Mxw281Cu5ZRATizswMuxtqVQY2lrCd5c+n5t0ACxUAVWGFPzm03gJpHynKeM6aA60Vo43TMWJiRI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4999.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(56012099006)(10067099003)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Snl3VFcwNjcrVUw4K1Ywd3VOVFJqWitGc1QrR3VyVXJKdndvYVpkalpxTGFQ?=
 =?utf-8?B?WnNRRHR6aW1JYWw2cFZ2bzFFbXgxVTM5dFNiT0cyUDRmdEFadDhlekxTL1N2?=
 =?utf-8?B?cDYybkNKb3U2Z3FxVWErSGpCUFZxSlZ0UTN1T0xzRTFMRFJqc0NBYjA4NTF3?=
 =?utf-8?B?dlVxcjY3aVVmdGdQZHhPcU0yeXFVV0YxYWZXejg4L0IzNDBtb25aUVI3bzd0?=
 =?utf-8?B?aGxJK3lBaUxLRVVsZnppUjB2eDUwbUZ4VjNZTDV2ZTNjK0Z5L21ydm5ZQWpv?=
 =?utf-8?B?c3pEUFdsbHJJdEpEVk5UcWMwRExGblN6VXdEVEVuVHBGMVZsZ1p0UzVTVGRE?=
 =?utf-8?B?dGJaZnkyRTZwUDFYM2RUc0ErZHJSbmhHbTZkL3UzdnI1MzI1emh5S1IvcmRO?=
 =?utf-8?B?VjRqWm1qazdONXlkSjAvMmtab0dwZWZFMVlCOG5LM1piNkJGTE00R2JBTHBy?=
 =?utf-8?B?eFlnbWxGU0w2ME5oV0hsaGVQcWE1anVydWdETDhUdU43RzFVUWllVXJrb3lS?=
 =?utf-8?B?SDRTcUxwRStDa2ROSmFxV1Z1TThIeEpkclNpMHhIR2F5a1diWXBZdW54Qmgr?=
 =?utf-8?B?bFc2ajRpaFM4MWtzMVNQT0R3VGVQZEx4VmdYNVh5NWxIbTNBNDZ2R3ZyZk1v?=
 =?utf-8?B?Y0t0ZE50dVppYXZTQThTNkpiTVpiZ01IK01sVVFzQ0UzNWVRckxCRHQrN3k0?=
 =?utf-8?B?a0hJSmU4N0Q0ZXFRbjRtbVpIc2tWeVpDeVZvQXczUXZRUUxPc0doa0VGUzNB?=
 =?utf-8?B?Q2k2TEJUOTlERnlFTS9KcjVKL0lhcDEyNzU1RXl0bENvUktJNUljc2JXc1RP?=
 =?utf-8?B?UVlaalNySERlTzNEMnNYYmNVeXNqOUh5MzZpSitwVjVreWFPRzhJdHR5TDRY?=
 =?utf-8?B?cmc1YkdKODRKN2d6QUZwcmwxb3V2MHEwTjhkOVJnL2lIR1YzMkIrcXFFWjN1?=
 =?utf-8?B?MEx6TGM2bENPSzFmTk9rSW9tY2UvTVdiMnQxaXc1VnU5L1h1SnVXY3pjSzR1?=
 =?utf-8?B?SlAxZERuOGtjdmlDZDhTc1g5ZEhDVzZXQWNKQlowd3A3L3pha2I1QnlXanJE?=
 =?utf-8?B?Vk0yd2xOM1ZmUEVjT3JIYkkxQ2tRcy9hRWpXcDdaZm9ONjkxWHBjSjRUMEtN?=
 =?utf-8?B?TG9pZEM0VTFPUzlXYXFnY0NzY1NlSnNxWmU1M1piSTBWeWZndVkwTjdNTCsx?=
 =?utf-8?B?eWRpNkh4dFJaRTlmNWtMS1owN25WdFlWMW9FcW1SeHlSQ0UwQXpsVWxNTnJ4?=
 =?utf-8?B?RWFXTFdwSUdva2ZhZFhhcjk5eDYyTSthZStrRWVWWEtleFR0dkIybjhjT1Ba?=
 =?utf-8?B?MnE1cXcxb0o2UE1FV2xKZlg1M21XZ01QT0k0NDRKZDJqN2NVMmNTbFo4VmZT?=
 =?utf-8?B?RzlhQmsybDRtaVVaQ05HZi9udnVDcm11cHpxWkY0c2tRNk9USkxkSFJZWGpD?=
 =?utf-8?B?NHEwZUFGR0tiN0lXdFZzR1R2dE1Ta3JzN3dvMzJQU2NLWXJhY2htWGdETkxP?=
 =?utf-8?B?d3lZWmZRMGcrSHczUHlYT1lOQ2pqME55ZnVtakMxbVd6Yy9ERmRKV0NzM2Vp?=
 =?utf-8?B?Y2JKa0VRekJRTUZPczd0bC9PbkV3aEh4ekVmby93d1pJQ0hWc3Y3N1dMYTB6?=
 =?utf-8?B?SFg5WEZpNGRpNytKQ3E5ZUZlY1J0dDF1MjlhOStpMXpnOWNZbGNTVE9rUFdH?=
 =?utf-8?B?WnhiVzBDZmpTZTdGakduZ1doU3J4ZFQ1VUtzUjlWdnVSWHg5R0hubS9Ya2FN?=
 =?utf-8?B?bW82TmxwcDg1VUM5T2F4bGZ2TEJRd1JuT3pqRmxqbTRLbU5wVFc4SUQ0WW5q?=
 =?utf-8?B?VURINEg3SjFJQUZwbHIvQjhKeFRjS2srME9RTDF1bkZ3MjBTN2RrRlhTZ1NH?=
 =?utf-8?B?d3VGWGtYa3NHZ2hKY0NnY3MwekRyTXZ0c2NQUm53T1ptaUVCNkdQZEhybU0x?=
 =?utf-8?B?YVh5SzBUSysxZklRYzUyeGdDK2oxU0lrTTJORmpTME80SGtVOWlOcHFmTlpD?=
 =?utf-8?B?ckx5Y1pOUU9mMytqMnVDWUh5Q3VicWhFRG1aeHRQRUVkWnYxOXJveDhWN0VU?=
 =?utf-8?B?UVlKWWRlNTFIM2Vzdk14RjNIdDJqTmdrYUlsZjdkT3lqQU0yUVFuSFBlcjZH?=
 =?utf-8?B?T2h3Qnc5MDRrck1DR1k4bEI3VmJSOFlFYmwxcmJXUlNaREc3eXlEN1JGekU5?=
 =?utf-8?B?REI4dmVBQ1pCbGF1RFZOUE9uR2ZHTUUwOGRZUG9lN1VZeE1IeUpNQ1pMWTRL?=
 =?utf-8?B?SEEyaCt5U1lUTzNqMVpGNDFrSlltRDZUd0JHSktSdGZwT25aVjdJa0Y2RUM3?=
 =?utf-8?Q?q+1tcIPzi6nbA/IS0F?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 710700f0-7081-4f8a-f6fe-08df17ee2aa0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4999.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 14:39:39.5693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1stA75IHURvis2rCFzLAqX/4EgExXmqr+x7wUTLUKGw4pqINXbLMMHh77ZWl6+5J8Oj8K/yWLbCWnQfB1J4Wbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB999321
X-purgate-ID: tlsNG-33051d/1790001584-6D0D94E9-F8A89367/0/0
X-purgate-type: clean
X-purgate-size: 8891

On Thu Aug 27, 2026 at 11:35 AM CEST, Baptiste Le Duc wrote:
> v1 was posted on 2026-08-10 with no response yet (13 business days). This
> v2 also fixes a bug flagged during internal review, see "Changes since v1=
"
> below.
>
> Xen is being made safety certifiable to IEC 61508 SIL 3 and ISO 26262 ASI=
L
> D, with Arm and x86 as the current targets [1]. Evidence at those levels =
is
> requirements based testing plus structural coverage, produced automatical=
ly
> and repeatably in CI.
>
> QTB (QEMU Test Bench) [2] is the framework AMD wrote for it as part of th=
e
> Xen safety initiative. It drives a live QEMU instance over qtest, QMP and
> GDB, so a test has full access to the machine while emulation runs: read
> and write the consoles, inspect registers and memory, inject interrupts a=
nd
> faults, all from Python and all reproducible in a pipeline. QTB is not
> upstream in QEMU yet, but is planned to be.
>
> RISC-V is not in the certification scope today. It is also the youngest
> port, so it has close to no test infrastructure to undo, which makes it t=
he
> cheapest place to adopt QTB. Starting the riscv64 tests on the framework
> now means the port grows its tests in the shape certification asks for as
> the port itself grows, instead of a pile of expect scripts to convert lat=
er
> if riscv64 ever becomes a certification target. It also puts a second
> architecture on QTB, which is useful to the framework itself before it is
> proposed to QEMU upstream.
>
> Concretely, the riscv64 CI coverage today is one expect script,
> automation/scripts/qemu-smoke-riscv64.sh, which boots Xen alone under QEM=
U
> and greps a single string out of one serial console. The machine it boots
> is hardcoded, so a second configuration means a second script, and a test
> with a DomU in it means growing guest handling from scratch.
>
> This series replaces that script with a data-driven framework using QTB. =
A
> machine is a YAML entry (pcpus, scheduler, interrupt controller, boot
> arguments), a test type is a small Python class saying what to do with a
> booted machine, and a test binds a machine to that type's expectations.
> Adding a configuration to CI is then a config change and a job stanza.
>
> Patch 1 goes to test-artifacts [3] and must land first, since patches 2-6
> run inside the container it adds. Patches 2-6 go to xen.git.
>
> test-artifacts [3]:
> - Add a QTB container to run the Xen riscv64 tests
>     debian:13-qtb-riscv64, carrying qemu.qtb from AMD's QEMU fork and the
>     dtc/fdt dependencies the framework needs at run time.
>
> xen.git:
> - automation/qtb: add jinja2 device trees for riscv64 smoke tests
>     The host tree varies with hart count, MMU type and device set, so it =
is
>     rendered per machine from a template rather than shipping one static
>     .dts per configuration.
> - automation/qtb: add Python QTB framework with the console-test type
>     The base layer every test type builds on (machine catalog lookup, hos=
t
>     DT generation, QEMU invocation, per-console log capture) plus the fir=
st
>     test type, which asserts every string listed in console-test.yaml is
>     printed on the expected console.
> - automation/qtb: add unit tests for the QTB framework
>     pytest coverage of the QEMU-agnostic parts, for developers only.
> - automation/qtb: add QTB framework README
>     How to add a machine, add a test type and run one locally.
> - CI: run the riscv64 smoke test via QTB framework console-test
>     Repoints qemu-smoke-riscv64-gcc at the framework and drops
>     qemu-smoke-riscv64.sh, which then has no caller left.
>
> Testing: Unit tests + QEMU only, as the existing riscv64 CI does.
> qemu-smoke-riscv64-gcc runs the same check as before.
>
> The catalog ships a single Xen-only machine, since Xen cannot boot a DomU
> on RISC-V yet. DomU machines plus an irq-test type using QTest interrupt
> injection follow once DomU support lands.
>
> CI pipeline:
> https://gitlab.com/xen-project/people/baptleduc/xen/-/pipelines/279590704=
2
>
> [1] https://elisa.tech/blog/2026/07/22/the-final-phase-of-xen-safety-solv=
ing-coverage-and-residual-gaps-stefano-stabellini-amd/
> [2] https://gitlab.com/xen-project/people/amd/qemu/-/tree/safety
> [3] https://gitlab.com/xen-project/hardware/test-artifacts
> [4] https://lore.kernel.org/xen-devel/1786980254.8631fc262581453bbf619ec5=
b2062170.1a01052c27d000c4f3@vates.tech/

These patches are way too coarse to be looked at carefully, imo. It'd
help a lot if you managed to split further up the series until each
patch is <200LoC at least. Otherwise it's just a an exercise in
frustration just to find out how everything works.

Even at 200 it's annoying, but it's manageable at least.

Cheers,
Alejandro

>
> ---
> Changes since v1:
> - Resolve qemu-system-riscv64 from $PATH instead of pinning qemu-9.0.0 in
>   test.yaml, dropping the now-unneeded OpenSBI entry too: the
>   13-qtb-riscv64 container already bundles both (flagged by Zheng Zhang
>   during internal review [4]). Also drops the qemu-9.0.0-riscv64
>   test-artifacts dependency noted above.
>
> Baptiste Le Duc (5):
>   automation/qtb: add jinja2 device trees for riscv64 smoke tests
>   automation/qtb: add Python QTB framework with the console-test type
>   automation/qtb: add unit tests for the QTB framework
>   automation/qtb: add QTB framework README
>   CI: run the riscv64 smoke test via QTB framework console-test
>
>  .gitlab-ci.yml                                |   3 +
>  automation/gitlab-ci/test.yaml                |  20 +-
>  automation/scripts/qemu-smoke-riscv64.sh      |  19 --
>  automation/scripts/qemu_smoke_riscv64.py      | 122 ++++++++++
>  automation/scripts/qtb/__init__.py            |   2 +
>  automation/scripts/qtb/riscv/README.md        | 182 +++++++++++++++
>  automation/scripts/qtb/riscv/__init__.py      |   9 +
>  automation/scripts/qtb/riscv/config.py        | 119 ++++++++++
>  automation/scripts/qtb/riscv/config.yaml      |  17 ++
>  .../qtb/riscv/console_test/__init__.py        |   4 +
>  .../qtb/riscv/console_test/console-test.yaml  |  18 ++
>  .../qtb/riscv/console_test/console_test.py    | 145 ++++++++++++
>  automation/scripts/qtb/riscv/dt.py            |  57 +++++
>  .../scripts/qtb/riscv/dts/qemu-host.dts.j2    | 160 +++++++++++++
>  automation/scripts/qtb/riscv/machine.py       |  57 +++++
>  automation/scripts/qtb/riscv/paths.py         |  60 +++++
>  automation/scripts/qtb/riscv/qtb_test.py      |  53 +++++
>  automation/scripts/qtb/riscv/unit/__init__.py |   2 +
>  automation/scripts/qtb/riscv/unit/conftest.py |  42 ++++
>  .../scripts/qtb/riscv/unit/test_config.py     | 121 ++++++++++
>  .../qtb/riscv/unit/test_console_test.py       | 217 ++++++++++++++++++
>  automation/scripts/qtb/riscv/unit/test_dt.py  |  99 ++++++++
>  .../scripts/qtb/riscv/unit/test_machine.py    |  60 +++++
>  .../scripts/qtb/riscv/unit/test_temp_dir.py   |  42 ++++
>  .../scripts/qtb/riscv/unit/test_xen_dt.py     |  46 ++++
>  automation/scripts/qtb/riscv/xen_dt.py        |  58 +++++
>  26 files changed, 1709 insertions(+), 25 deletions(-)
>  delete mode 100755 automation/scripts/qemu-smoke-riscv64.sh
>  create mode 100755 automation/scripts/qemu_smoke_riscv64.py
>  create mode 100644 automation/scripts/qtb/__init__.py
>  create mode 100644 automation/scripts/qtb/riscv/README.md
>  create mode 100644 automation/scripts/qtb/riscv/__init__.py
>  create mode 100644 automation/scripts/qtb/riscv/config.py
>  create mode 100644 automation/scripts/qtb/riscv/config.yaml
>  create mode 100644 automation/scripts/qtb/riscv/console_test/__init__.py
>  create mode 100644 automation/scripts/qtb/riscv/console_test/console-tes=
t.yaml
>  create mode 100644 automation/scripts/qtb/riscv/console_test/console_tes=
t.py
>  create mode 100644 automation/scripts/qtb/riscv/dt.py
>  create mode 100644 automation/scripts/qtb/riscv/dts/qemu-host.dts.j2
>  create mode 100644 automation/scripts/qtb/riscv/machine.py
>  create mode 100644 automation/scripts/qtb/riscv/paths.py
>  create mode 100644 automation/scripts/qtb/riscv/qtb_test.py
>  create mode 100644 automation/scripts/qtb/riscv/unit/__init__.py
>  create mode 100644 automation/scripts/qtb/riscv/unit/conftest.py
>  create mode 100644 automation/scripts/qtb/riscv/unit/test_config.py
>  create mode 100644 automation/scripts/qtb/riscv/unit/test_console_test.p=
y
>  create mode 100644 automation/scripts/qtb/riscv/unit/test_dt.py
>  create mode 100644 automation/scripts/qtb/riscv/unit/test_machine.py
>  create mode 100644 automation/scripts/qtb/riscv/unit/test_temp_dir.py
>  create mode 100644 automation/scripts/qtb/riscv/unit/test_xen_dt.py
>  create mode 100644 automation/scripts/qtb/riscv/xen_dt.py


