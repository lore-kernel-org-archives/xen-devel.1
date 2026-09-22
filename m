Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3EBC982F0
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 01:13:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427961.1650654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8p4i-0000Sq-RP; Tue, 22 Sep 2026 01:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427961.1650654; Tue, 22 Sep 2026 01:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8p4i-0000Sj-Ol; Tue, 22 Sep 2026 01:13:36 +0000
Received: by outflank-mailman (input) for mailman id 1427961;
 Tue, 22 Sep 2026 01:13:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1x8p4g-0000SY-PT
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 01:13:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8p4g-003qz4-1n
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 03:13:34 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab1d5cf-8faa-0a2a0a5109dd-0a2a4505b1b4-48
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 03:13:33 +0200
Received: from [52.101.66.136]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab1d63d-4cb1-0a2a45050019-34654288197a-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 03:13:33 +0200
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by AS8PR03MB6837.eurprd03.prod.outlook.com (2603:10a6:20b:292::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 01:13:32 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%3]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 01:13:31 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cTXd7jkNXhRS83Q/c+BFetqNOSz1ZoTFBh21pe9a1u99UWSeEayLfko3R0l5PJgPc5NpFmcClXGDmwQSwos/MG3f8mua42NIPQjhYIBzyl+Pf0g0cFlSceUyjQ4Xw9vuArd5oUxNsRJmb2S/c5vzXVvmNOWvJF6WpFULaDYLhX6yy+5sXrHxcF9HZqlHVb+5h/vpRwQi1RZgq7G3mo9QaJko7CG7hANq2xXmyfQOvJQivoUz2O7BazhuW5JhWje7kzMTfTRgJEl5LnJ7/KCQD+pNISiTFOgp7pUFMSPGyznfEZFU07wfR8MHVbK5JD1j+hweb43KT81j4k/quyObWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztP34H4MVWpWaa9/hwAntMYQxA8O1MoNEGSQSzmeJaU=;
 b=t/xSxlS7WokXMKmS8SrzzToEZ4fEYVLZWXrtG3ShFZTVkBK1b4qAJ9dgf47FWpw4TLChaZRHUiprIC/yO6f5er/eVKuHI5okGCCuShr7BakLt4cdX+Tw4/1jJYtWFAaXZXTCJQU95C4lcCGY/4ohHschNVDh7fCKEnS8+JlFqne1CkqDdO5r7HcX6SJTr0U8ZB4sMi/J1kEiwyP8UJ0pECOGgTocxXPc3RAHqlFUWrGvgRm0BpXdGmKnB7MeJ43ph8UirUGBv4GpraLJDxPzlG/wlBJiAz7qIRrWO8BbJzJ5c3V2Ok3eI135FeOnud7N5Y6GtKlSgUQ+OeAK6Rul3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztP34H4MVWpWaa9/hwAntMYQxA8O1MoNEGSQSzmeJaU=;
 b=Siple0QQ+bFl/REW9uifpKScdDFnsqkhaagknJGtk/deY4SvXD3ad6+xIc08oLL4DcZoAcvuCeMtTTy+wTJdSpGiIUxZFrfQtluPq8mqhUysnM2UtUiIkViDX6yIYr9nuzh+XwCJ9PIrZMq2txMOS+nJUGZhnZTwvLAGXoLFsfhXjXn1ebUcrbM4Pcnn/83m+VJiUUQfT5sM0qhapPiXq1l9moJNHKoq+Wbd3k1swygGADXrg+jm24sw/CcLTICGxdpDIx9KDbKHS+fjMWP1Ju1MKbSUjVUpBLNeXDT+bzCkzR95c5rkcvyWP5iQvZUg0A6aP7AjHHa9xWyD0lbPgg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger@xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v9 6/6] docs: Document CPU hotplug
Thread-Topic: [PATCH v9 6/6] docs: Document CPU hotplug
Thread-Index: AQHdLu5n5DTKasDPakWayAUOcTtpgw==
Date: Tue, 22 Sep 2026 01:13:31 +0000
Message-ID: <87bj9q84w5.fsf@epam.com>
References: <cover.1787042017.git.mykyta_poturai@epam.com>
	<70484b3362f3b816bf4ed5f70c374c198a8a6eea.1787042017.git.mykyta_poturai@epam.com>
In-Reply-To:
 <70484b3362f3b816bf4ed5f70c374c198a8a6eea.1787042017.git.mykyta_poturai@epam.com>
	(Mykyta Poturai's message of "Tue, 18 Aug 2026 08:48:31 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|AS8PR03MB6837:EE_
x-ms-office365-filtering-correlation-id: 208866ba-5a86-4edb-892e-08df1846b7a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|42112799006|366016|1800799024|6133799003|22082099003|18002099003|38070700021|56012099006|11063799006|4143699003|10067099003;
x-microsoft-antispam-message-info:
 fn7cSyRdChKCrZ4aBuLiv81xZv5j71sdEhpmeaLqetxFYSnqbMBBLA4mn3npYCaIkQOwjH4fgljCBzXTewsQUvU8B7RZmWRaRGGIXs193VcTCZw/0+oqMkAlbc7yjNJ5VNr4K7QjSthwvlWN6P4kvxLH4oElm69P0nKJVX2IQzKNQInP5cAhvaJzHV9FN95Kcee6l/H9/Q6ZGOnO6j1s1q2yScMEoPrm5XdJrPkgr1T4NnkP73aWJ7SJu9FMYxsAzxC3OeyuXGuQAev+HQZI/4A62XoetlG0FECeovNUtBuccQtMm3zE1nETPhVwDkok2SQ3Q6Pw3+3U17F+CrA3PpL4iDkw8KfmUQOdakMjBLZ7kYtGo6oItXJlRbHY/4DIEPydd6i5BDxDmkvNqJSeETVB4JGLN07j3VByGfKOKlCDTLtmmbYtb4lbD9CaTdfYN2ahDkfpn8Ftl/xwgvvDam+A2XLgeCHPWl3vmngZ1wH//0T52rxIvo9TRdhV+zb6U90JP/okW2dQc26cbim9JO0+m4Cjh1uAIT0TiywQWbRxoXn7CmCXpUjCOuQtKMb0xAlrLR6C5h1JsKF8stMYZixSfnNMrgsSWuYNmwnQA16+d8rFXQb80W8JPPk5ewoqCs6mDs1XwuTtdNo4VroI4tilAfjiD1mNXDbF57yrEQZMtCtV0/iJd0VYXn82XorGRS84o5OQmO6hqJqNPXbkd9MwYm9zHbVH4Y8jEr0gBUc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(42112799006)(366016)(1800799024)(6133799003)(22082099003)(18002099003)(38070700021)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?AEmo3MVR/DsJdMp2PQrc/6+C7LRV8VWRvNNDGAK2cH8a8vWvF4jMYUsT3M?=
 =?iso-8859-1?Q?4j+sy0EudN6eke4ePBnxlWf64NUy6+ty4f/4cQiNTeELy2dLYB/rVmFvi8?=
 =?iso-8859-1?Q?6z9pVfT0ic2H7wioMQQr30HYcwtn+mjF9sjt4CMhV0lLcIpSIKzPNZTRx+?=
 =?iso-8859-1?Q?jb74TVHIY5/YhCnwzI98uEhUFGNR9BRxwICqxmNzrWf2MFsCvIM6pofejq?=
 =?iso-8859-1?Q?sKYde7aXbW6wbUtqK+VHjWcHeOQaTvpZpysruoBfUsrbH9ewlFmaBlzwUa?=
 =?iso-8859-1?Q?xFclms3/shdTS5in6NtgDRWoHt0VVidP99OiEy7bisoF4NT5IkZH3MiTy3?=
 =?iso-8859-1?Q?80eWAd60lGkcgJTv9PZ0sUxl4+LoQSmuxQF+jr44eQOtYcNoJ1r8CsQJiz?=
 =?iso-8859-1?Q?WFBt9v43+yA+wCuT8tfiZ6alJMs3lC+U5lp8yTP7khAsjOG/Tc88yJCVbF?=
 =?iso-8859-1?Q?BG57wPoPE2+zPYvraU5RB4rjPxhV0qWnAcuEHGNEjLMX4FI1pZuDUCZPef?=
 =?iso-8859-1?Q?de5MRUY5+jdbkmxexzdS4ERmOLbXfrucSCK/YzxcjzeClNVyxKy0NeR6C6?=
 =?iso-8859-1?Q?fBhkGM9uCrvdFltXZ+4eL/ZQNbav+ZqKhGaWKAaPxy3ri1WJ055O/vOBv7?=
 =?iso-8859-1?Q?B0kJSvLl2I+CvzxU+nH8VBB/wC+fcKblcAKdOnNowCaUUiu8pd1VdPwGFB?=
 =?iso-8859-1?Q?nA7fZIpvjC13N4Bi0WqURulOLisgh8/osFE2ubJ5ntOifWgr2vQ8Rzb9qx?=
 =?iso-8859-1?Q?+acgIFO/IIUwTDBeBUCVbRgAgNPo9/t0JrBbTLcu0QuSIzRIAmky7gzwzK?=
 =?iso-8859-1?Q?tz1dl9xUY1QVsD29/ukRzD3bCdSeva8XpsGzzcxXMaEMsFoVb/DU4gMRL4?=
 =?iso-8859-1?Q?hXOXjdSm2deEyemKCB0vdeqVO+B6I+Fm94RpbtoGppOzkbCCthwNqdTcss?=
 =?iso-8859-1?Q?YX2F2KnvICqazwD4/y/sdF1rlv7+b3Y4ZgwCB/G0X5oZdTArkpciq/BnUf?=
 =?iso-8859-1?Q?2K/PYgIX1G6FU7GWyVDDcaZcfQag4Trz5sxF+HfiYbWHGhoVlQsP7H+e2/?=
 =?iso-8859-1?Q?5u5mHs+ytr52Ya1lpk6KjtySNZUkhllLsT2zWM4ABWt7wibUKHnBt0YsQG?=
 =?iso-8859-1?Q?PUrJRA8NdPu2wBMNf3QI6NKx5CD3ABnwP8l3+/FlrVAHvJTDr1ZvY+gIYy?=
 =?iso-8859-1?Q?N1tQ2T3oaUX/8a5V0pcWgzQdgWmttNOxyykdS8vGx1gmp+DDDkftzwldqc?=
 =?iso-8859-1?Q?KX/o0ZWXyb3a10BIdwRDAhoAsWjVXPsmZBg7ak6qIO97tIOu0WlE2tB019?=
 =?iso-8859-1?Q?Hx5Y6WOmdE/sV28+mwSepGvoH3G8gPn7UYIYmpEoWZCDO6hky3fKGvmTLh?=
 =?iso-8859-1?Q?VDeoQMEGiTNNAXfmslZPRUIqfaMo2j+DPSQaDSN2/uCH3NA7SUprf6dGfb?=
 =?iso-8859-1?Q?KzeHcq6PpBI0S1WILilcO7IAIpPYdzz/OOS5WNmL0ucCU26aYXXV+dVw/+?=
 =?iso-8859-1?Q?BF+cM+90k4pgIuovYOCFwkY6cVB5YSmmUr4rnLhl0i+853T0mDtLHDrm9C?=
 =?iso-8859-1?Q?2jUOoxJAJlQ/UVjDyCCRY4T/LqitWa6z3ja4DopDqvRy5WuGw4cBIg3ZY3?=
 =?iso-8859-1?Q?v2QUMBVus0vPjAq29YlgdhA3eiNZGjpmzJbo7sbDQ6aB5Iazk5nKyzw1mu?=
 =?iso-8859-1?Q?mcDsoSQzLVyJQw7bJkj2R82PyR0lCUns+eOV82Pq7roJec2RyyEHYE/I+d?=
 =?iso-8859-1?Q?HS/TcVzqFVjJToPv8cbMtIZp0voEXAJcTO1dQYGjiQ4T+xDDYEjljIM87J?=
 =?iso-8859-1?Q?1FyCz95imxN6lhv9BfG81eMX1Ci1D5o=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 208866ba-5a86-4edb-892e-08df1846b7a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 01:13:31.7858
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N98D5yeuQNQ0Q03hpL1wF+obEP58XFwZGOCLxv5SytujqkKP3MKdiXrBjleZKF66JoINxcOcCYdUr6RrYGvNg5CkflXxFJpdp2MkP1PmSF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6837
X-purgate-ID: tlsNG-c201ff/1790039613-736BD2A1-0AC223FD/0/0
X-purgate-type: clean
X-purgate-size: 4751

Hi,

Mykyta Poturai <Mykyta_Poturai@epam.com> writes:

I have a couple of questions, please see below

> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
> v8->v9:
> * fix typos
>
> v7->v8:
> * remove support status update
> * update config option name
>
> v6->v7:
> * add testing and limitations
>
> v5->v6:
> * no changes
>
> v4->v5:
> * s/supported/implemented/
> * update SUPPORT.md
>
> v3->v4:
> * update configuration section
>
> v2->v3:
> * patch introduced
> ---
>  docs/misc/cpu-hotplug.txt | 98 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 docs/misc/cpu-hotplug.txt
>
> diff --git a/docs/misc/cpu-hotplug.txt b/docs/misc/cpu-hotplug.txt
> new file mode 100644
> index 0000000000..4f6068db30
> --- /dev/null
> +++ b/docs/misc/cpu-hotplug.txt
> @@ -0,0 +1,98 @@
> +CPU Hotplug
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +CPU hotplug is a feature that allows pCPU cores to be added to or remove=
d from a
> +running system without requiring a reboot. It is implemented on x86 and =
Arm64
> +architectures.
> +
> +Implementation Details
> +----------------------
> +
> +CPU hotplug is implemented through the `XEN_SYSCTL_CPU_HOTPLUG_*` sysctl=
 calls.
> +The specific calls are:
> +
> +- `XEN_SYSCTL_CPU_HOTPLUG_ONLINE`: Brings a pCPU online
> +- `XEN_SYSCTL_CPU_HOTPLUG_OFFLINE`: Takes a pCPU offline
> +- `XEN_SYSCTL_CPU_HOTPLUG_SMT_ENABLE`: Enables SMT threads (x86 only)
> +- `XEN_SYSCTL_CPU_HOTPLUG_SMT_DISABLE`: Disables SMT threads (x86 only)
> +
> +All cores can be disabled, assuming hardware support, except for the boo=
t core.
> +Sysctl calls are routed to the boot core before doing any actual up/down
> +operations on other cores.
> +
> +If there are Xen-bound interrupts pinned to the pCPU being offlined, the=
y will
> +be automatically migrated to other online pCPUs. Interrupts used by gues=
t
> +domains are handled by the scheduler when it reschedules the vCPUs to a =
new,
> +online, pCPU. When a pCPU is being onlined, some Xen-bound interrupts wi=
ll get
> +redistributed to the newly onlined pCPU to prevent imbalance.
> +
> +If pCPU being offlined has some vCPUs pinned to it, they will be automat=
ically
> +unpinned and migrated to other online pCPUs.
> +
> +Limitations
> +-----------
> +
> +On Arm64 cpu hotplug is currently not compatible with ITS, due to an iss=
ue with
> +the redistributor assignment.

In this case you probably want to make sure that
CONFIG_CPU_ONLINE_OFFLINE is incompatible with CONFIG_HAS_ITS

> +
> +On Arm64 there can be problems with FFA if secure FW supports the notifi=
cation
> +ABI, and with TEE, as both use non-static IRQ actions.

Could you please elaborate on this? AFAIK, OP-TEE has own
cpu_up/cpu_down callbacks, so it should know which CPUs are online.

> +
> +Configuration
> +-------------
> +
> +The presence of the feature is controlled by CONFIG_CPU_ONLINE_OFFLINE o=
ption.
> +It is enabled by default on x86 architecture. On Arm64, the option is di=
sabled
> +by default and marked as EXPERT. xen-hptool userspace tool is built
> +unconditionally.
> +
> +Usage
> +-----
> +
> +Disable core:
> +
> +$ xen-hptool cpu-offline 2
> +Prepare to offline CPU 2
> +(XEN) Removing cpu 2 from runqueue 0
> +CPU 2 offlined successfully
> +
> +Enable core:
> +
> +$ xen-hptool cpu-online 2
> +Prepare to online CPU 2
> +(XEN) Bringing up CPU2
> +(XEN) GICv3: CPU2: Found redistributor in region 0 @00000a004005c000
> +(XEN) CPU2: Guest atomics will try 1 times before pausing the domain
> +(XEN) CPU 2 booted.
> +(XEN) Adding cpu 2 to runqueue 0
> +CPU 2 onlined successfully
> +
> +Disabling a core with pinned vCPUs:
> +
> +$ xl vcpu-pin 0 3 3 3
> +$ xl vcpu-pin 0 2 3 3
> +$ xl vcpu-pin 0 1 3 3
> +$ xl vcpu-pin 0 0 3 3
> +$ xen-hptool cpu-offline 3
> +Prepare to offline CPU 3
> +(XEN) Breaking affinity for d0v0
> +(XEN) Breaking affinity for d0v1
> +(XEN) Breaking affinity for d0v2
> +(XEN) Breaking affinity for d0v3
> +(XEN) Removing cpu 3 from runqueue 0
> +CPU 3 offlined successfully
> +
> +Testing
> +-------
> +
> +The CPU hotplug feature has been tested on both x86 and Arm64 QEMU setup=
s and on
> +R-Car Gen5 (Arm64) hardware.
> +
> +The tests included:
> +- Offlining and onlining cores with no pinned vCPUs
> +- Offlining cores with pinned vCPUs
> +- Offlining cores with Xen-bound interrupts
> +- Offlining all cores except the boot core
> +- Offlining the boot core (expected to fail)
> +- Enabling and disabling SMT threads (x86 only)
> +- Offlining cores to which guests with passthrough devices are pinned

--=20
WBR, Volodymyr=

