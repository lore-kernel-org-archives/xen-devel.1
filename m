Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E24F606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 02:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=kJbuYGmY
Received: from list by lists.xenproject.org with outflank-mailman.1462805.1673797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLtAU-0007LW-2v; Wed, 28 Oct 2026 02:13:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462805.1673797; Wed, 28 Oct 2026 02:13:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLtAU-0007LP-0N; Wed, 28 Oct 2026 02:13:34 +0000
Received: by outflank-mailman (input) for mailman id 1462805;
 Wed, 28 Oct 2026 02:13:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1xLtAS-0007KX-BQ
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 02:13:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLtAR-009RZ5-Nx
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 03:13:31 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ae159d1-8faa-0a2a0a5109dd-0a2a450686be-28
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 03:13:31 +0100
Received: from [52.101.83.102]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ae15a4b-195a-0a2a45060019-34655366fe3f-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 03:13:31 +0100
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by DU2PR03MB7925.eurprd03.prod.outlook.com (2603:10a6:10:2d8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 02:13:25 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%4]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 02:13:24 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lx51lV0MEEyKDLPK8qVSOIekN1A/sWMUs5ijCrhMhDkK6KTWVI/lpYOddHk3GXEOP1N9oXh8kot20Sw0ohaT7TSh/xRxhfM1u+cqJQSlMGx8ZZcdS50oDSPK+S4yfstgOfO+0jXx0PYJxeSLc1oZIC+Ho81oYE+WZRFbjRay1L3rDgfoPxasFZhYZdsVqRJy/+imoa6R6bRZmxbHEtbYgq8aYQR/fKI25VoAxwlJ80zf+0dgkJVaWATyZ/p1V0XhfOtgUaKf9lgHMNk2mR+OCaKK4ORGLXSR/5dkNwcK/MeHwT3ouq/F9vrpKurjtEYlxuoe+2PolktBWxsHD+02NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Az+cdNp2WiBJsttHXvgElp2UNrxJ/fVqIx1E4Ip5fk=;
 b=zUsFQax1qOrWxwIeNK0iXKvUp0aOu+f3us/R0YVQTVmF6ogr4qgB9eIDFJXUwgq7dTQ1XJ3DFROCYeYevRLhiYTYHxFREpOAVZbmGrzhcmheu7y+FEjP23krldfPZNGnnCxseUDiVVGexZO5r45paP7Seqc83YuS4X8IzofjJHzccjxfZGV8YbJS+TC8Dy8NhzVYeJtE/tmlawLoaFA+EH1lOx4MQpy5B3gvJu6eG9UfRTwakxTx/ZAh1ZL3uvq892PSB4Jv+P37bEsdlCMHTXtbAHwsghTgPZRX06m7zFrBHG9jDLENuPCpcAClh8JNg/3+t/YpHpqpAsHwvzmcuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Az+cdNp2WiBJsttHXvgElp2UNrxJ/fVqIx1E4Ip5fk=;
 b=kJbuYGmYZmHX5nP1MkWqwzkFXRzK7qYXGZgT1M2Pz/dJujJOnlipC3/hD9swUq2U9ZxNHOBmcgsCoouPGyPbndqLxRdh4pGy64AQk/Yt2pFCr8n2lvTtbQkCyBlkbprhxSK5/NJZNJjkNqS3zIUfPwlpE+4JLS0A0CaoxqrkmkI43LcE7BCGhLkHt/d5eUFj9h5051Mqg7EVzz4bal9ouXeaJeIoaNKtGneWXMWzBlzV370JLcJ2b/Jw8zAmoPRJtrZMVDoU88apL0iBR1KwnprQ2eojRGZ2+IT0vujzwzhjMceRg+H7X3R1TvrcbF0zSIZ407+0sjNYf/hy2wxyGg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Hirokazu Takahashi <taka@valinux.co.jp>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"michal.orzel@amd.com" <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: Re: [PATCH] xen/arm: Fix sibling mask setup to only include online
 CPUs
Thread-Topic: [PATCH] xen/arm: Fix sibling mask setup to only include online
 CPUs
Thread-Index: AQHdYt8baAARnjXwY0WMOCpcDnsQgA==
Date: Wed, 28 Oct 2026 02:13:24 +0000
Message-ID: <87h5i6r2rg.fsf@epam.com>
References: <20261023110925.128195-1-taka@valinux.co.jp>
In-Reply-To: <20261023110925.128195-1-taka@valinux.co.jp> (Hirokazu
	Takahashi's message of "Fri, 23 Oct 2026 20:09:25 +0900")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|DU2PR03MB7925:EE_
x-ms-office365-filtering-correlation-id: d7b37322-cc37-452d-e2d3-08df34990c0e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|42112799006|23010399003|261026140227099003|38070700021|11063799006|261021123027099003|56012099006|261021135927099003|261021121427099003|261022105027099003|10067099003|261022075727099003|261026121527099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 628zd70WbszS7/pXW7mca9T8V+/betGg5QaDFccQ+WmJOdKzztOYcoA+i8XUAbn9+OvUudkVtsjxHvSBCTVNV+nWB5DfdQJBvzHmZA9SyWYdNDwoiC2w9YQlIW3Ttmn9w7di8EDNn8sRYtrdKlmrKW1XC73hgUpXrou5D1yl4tco46NOTm8We355UNbHeckZz7Tlpvy4I7lmzHsDOxIxIWU18XaG7zLEq396M7Ztdf+c0D3VjBmrvXpQhSMAWbMBx/uG5g8bg1jfW6R0XCivV014L/N/N07oF/l1PlaBaQNWVgBfOEUE4U9xeIdbfju1GwaNRG1Y03ZAp+n4tg9qHnbI7P/3VhzbPJZpmDxgxpK3oe96tL5ic4Aac+8o+pgLJLM+S5APATDk1VbHmXTKx/jrECFjA2D/mwIc/pib89zEF3TRpa6p4Nh0MEo3g6T5DoJ0nyFTnXGLo393gLlP/gcKzCl6e9BXNF3HD1e8aDYCRLmsBDvrbOxeAXJV/0en01nQHcfe66f1xH5yK8q4F9hG3xAReU763UxJEh53+dm45FU30/Fhn7/wSDtUo6b5E+oAlR2Oy4W69F1311tfypLz3TkdF2ryZo7rFgvoBM0Qfgz68tRksqYLJFIlwVUi3WSxKXAJSU4iFq2TBSIyn1Y67XNGERZ6574Psjwb4YR79w4PEtrb/g1rw38yCef+pBfJN6tq2BoEmxKNfu2F4X7hgSS7sxAIfmhcnQLuvNw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(42112799006)(23010399003)(261026140227099003)(38070700021)(11063799006)(261021123027099003)(56012099006)(261021135927099003)(261021121427099003)(261022105027099003)(10067099003)(261022075727099003)(261026121527099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?dM1jVwK8ZmwKNre0Dl1mV3R7PBEtgHUkyJc9bNiWyn/kDrcOruV0fyF0VX?=
 =?iso-8859-1?Q?XCrtwowgCiQ9j7vPQ61vJLUg4cYkl2/PBR7DMOUHpH43QSLp6Maxt9jTkF?=
 =?iso-8859-1?Q?stk05itTQoFpQ9A3otf4wiOu3j+GLKg+70r0OYHZsSNRnNDhhxh3bFDWSs?=
 =?iso-8859-1?Q?Jfq5kE+v4HiaBw8iDRCfG36sveOUx0a+Wm75dMYStABp1s4EUvnzS9K01w?=
 =?iso-8859-1?Q?3BjIgldLt7K6ZOQTTcZULvIU8+OgRmiLuy7JZa0LoMmsqwfzBaRDsvqBMD?=
 =?iso-8859-1?Q?ElSfEZlcLGIr4AkMFTO+gP/KpGulGIoQQxvNseiy0N4yOaJuAQ4JOWbMuR?=
 =?iso-8859-1?Q?s4A4oKPahqQDscaqmGUPBD1AmijD7bsDMYA6b+9iVsS8Lzo4ZztjqhCcmK?=
 =?iso-8859-1?Q?pyl3U95eNk87rm2/jvP9VnDLpSEaWl00fmPbd+XADp7Msrz3rzGH/YfCX8?=
 =?iso-8859-1?Q?q3FRt3pfgh/ftmd3M66t/5JozDpdpk8VM/iUN5AIaevW0o1vvQgNS3YMmx?=
 =?iso-8859-1?Q?12fK8psa1zyFqSU41nD+HcS9KHEGTOP5NAvvDwAf0juw4bWbsn7uiJ0+sy?=
 =?iso-8859-1?Q?/L3SLnX3MmoQ+tWthy8QsKmZZxYj44jJ6i5YzQxNA/G5UF+qM3+LLHq0AL?=
 =?iso-8859-1?Q?K0QJ5rQ6cJLCPkrQ1QjNzWofS5hbIp4C/ouHAKI5PsFuMXjMIs5WYkBtz7?=
 =?iso-8859-1?Q?rqIZlcTcXuZokFb7DWku9wmUEQxnZF/dRCdxLg52nt8ZJQvqXELvXgzd/d?=
 =?iso-8859-1?Q?UJAMFIqMcRorYICtaUTKRjQjFfmM2JmCT92IlKiWoZkytEqC9BID4muqoc?=
 =?iso-8859-1?Q?BL1lyGqTvK6623kioMQRIew7L/1dsqjPhwdR67YhmeFx9Y3UMKGSR4d29Y?=
 =?iso-8859-1?Q?8yKkjP6p36lTkVAdEZVXWkomAe/qzHLLBQcAg9QoiT8K4+R9L0rXiokOx3?=
 =?iso-8859-1?Q?4gWNsYgFodEXkNsKFhIL++Zvgxf8JVuL1kNQhZirreqAicKm3clRHXca11?=
 =?iso-8859-1?Q?LGyAKfjWG4rgB01MwxcbBS0iqF2Zr79Eu6r1BcXDOJIUf8MYaZjoCxWA5e?=
 =?iso-8859-1?Q?tAn0TC5Fvzeq4VeXS66l1DsPVMPDoem0uCRkHGtnRnySdBPgJCXWCU7IJI?=
 =?iso-8859-1?Q?NxUP0UMgSzdGeBitd67tiRKSfIHJAMHFbNb1Z78/teiqwBnTzu/CgF2vUn?=
 =?iso-8859-1?Q?wsWKxpEKNt93+bFq7FcslKeIXjMJvdp2O92IN1qyRApkp6Gn2c5X7AmfkB?=
 =?iso-8859-1?Q?/bLwHMafymaCehp3T29SFCe/wkajQhWsa8i9F9Puk7jiOtHfkVYjT8TDDD?=
 =?iso-8859-1?Q?kHkKZjEBU4gKpYz/vGgWhqZQg/ITY0em+AVE2zo9cq0C1gt72syl41Tl4B?=
 =?iso-8859-1?Q?7GLY+CCkHdImZcpoeuX6vxkECDyXACU4BbHXNg8UKzpLGwWmFoG9dVQbRH?=
 =?iso-8859-1?Q?8wPod83Nz+FOQwHQFOzZT5akMaKC6rAukEMCBwPFKAe+LMj7k6FPXfHhuC?=
 =?iso-8859-1?Q?5+zpDRPq7G1SOMc/XHhRki82A4UZCXFVgFA86WDE8J6cUueg92SHoxr6qP?=
 =?iso-8859-1?Q?6thdpajzwhFKZZro2aKydOZtZA/la5K/6qpFmZThIWfEORkaR5PciMAeDu?=
 =?iso-8859-1?Q?/1MuQsvofc48OnW3GFUE9lBsXIydbIyK/ZR3bd8NajOQ86zoMI1YarV48y?=
 =?iso-8859-1?Q?CE7qUls0l0rBwDFTLlcGIvvYnvIUdDgtvZpE/BtE3lUh9z6YzFOibpTv/E?=
 =?iso-8859-1?Q?aQ/tWwRTHYhrY+jd5Rthz0c60cRusHTOGIM3VVWlz/wl04CnqyGvOKxrez?=
 =?iso-8859-1?Q?wpywg4gjvbTDjRmOa5mh9Vx+M4Kk57c=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7b37322-cc37-452d-e2d3-08df34990c0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2026 02:13:24.6475
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4jthMAdr78GO8UYLv++u6FugW8WcJxdsqQvM5xLIU/rpQVVRiMPqwqJ4FazdfPcVPjydLFZCwPVMIJfy0MvpjyzNyZd388As6yKdUfs2tP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB7925
X-purgate-ID: tlsNG-16d1c6/1793153611-FEA7477B-25A09298/0/0
X-purgate-type: clean
X-purgate-size: 2663
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Hirokazu-san,

Hirokazu Takahashi <taka@valinux.co.jp> writes:

> Populate the CPU sibling map only with CPUs that are brought
> online. Currently, all CPUs in cpu_possible_map are added,
> which leaves CPUs that failed to boot in the sibling masks and
> may lead the scheduler to make incorrect decisions.

I think that this is a scheduler issue then. A CPU has siblings
regardless of if they are running or not. Also, your change will affect
CPU Hotplug functionality, as with your patch sibling mask will change
in runtime. But partially - only in cpu_up, but not on cpu_down. I am
not sure that schedulers can handle updates to siblings mask in runtime.

Could you please elaborate how it affects scheduler behaviour right now?

>
> Fixes: 701190abb3d5 ("xen/arm: Set correct per-cpu cpu_core_mask")
> Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
> ---
>  xen/arch/arm/smpboot.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index 8c9072f3c1..2d01896cf0 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -91,15 +91,24 @@ static int setup_cpu_sibling_map(int cpu)
>           !zalloc_cpumask_var(&per_cpu(cpu_core_mask, cpu)) )
>          return -ENOMEM;
> =20
> +    return 0;
> +}
> +
> +static void init_cpu_sibling_map(int cpu)
> +{
> +    unsigned int sibling;
> +
>      /*
>       * Currently we assume there is no multithread and NUMA, so
>       * a CPU is a sibling with itself, and the all possible CPUs
> -     * are supposed to belong to the same socket (NUMA node).
> +     * are supposed to belong to the same socket.
>       */
>      cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
> -    cpumask_copy(per_cpu(cpu_core_mask, cpu), &cpu_possible_map);
> +    cpumask_copy(per_cpu(cpu_core_mask, cpu), &cpu_online_map);
> +    cpumask_set_cpu(cpu, per_cpu(cpu_core_mask, cpu));
> =20
> -    return 0;
> +    for_each_online_cpu(sibling)
> +        cpumask_set_cpu(cpu, per_cpu(cpu_core_mask, sibling));
>  }
> =20
>  static void remove_cpu_sibling_map(int cpu)
> @@ -314,6 +323,7 @@ smp_prepare_cpus(void)
>      if ( rc )
>          panic("Unable to allocate CPU sibling/core maps\n");
> =20
> +    init_cpu_sibling_map(0);
>  }
> =20
>  /* Boot the current CPU */
> @@ -385,6 +395,8 @@ void asmlinkage noreturn start_secondary(void)
> =20
>      set_current(idle_vcpu[cpuid]);
> =20
> +    init_cpu_sibling_map(cpuid);
> +
>      /* Run local notifiers */
>      notify_cpu_starting(cpuid);
>      /*

--=20
WBR, Volodymyr=

