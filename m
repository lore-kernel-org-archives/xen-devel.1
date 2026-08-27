Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B761C61DC2
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 11:34:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400588.1636205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzYMq-0006pp-8w; Thu, 27 Aug 2026 11:34:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400588.1636205; Thu, 27 Aug 2026 11:34:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzYMq-0006pi-6N; Thu, 27 Aug 2026 11:34:00 +0000
Received: by outflank-mailman (input) for mailman id 1400588;
 Thu, 27 Aug 2026 11:33:58 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wzYMn-0006pc-Pc
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 11:33:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzYMl-00917C-7z
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 13:33:55 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a902086-2eae-0a2a0a5409dd-0a2a4501cc96-38
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 13:33:54 +0200
Received: from [52.101.201.8]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a9020a0-5984-0a2a45010019-3465c9081f19-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 13:33:54 +0200
Received: from BY3PR04CA0006.namprd04.prod.outlook.com (2603:10b6:a03:217::11)
 by PHXPR12MB999256.namprd12.prod.outlook.com (2603:10b6:510:3ca::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Thu, 27 Aug
 2026 11:33:46 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:217:cafe::20) by BY3PR04CA0006.outlook.office365.com
 (2603:10b6:a03:217::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Thu,
 27 Aug 2026 11:33:46 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Thu, 27 Aug 2026 11:33:45 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 06:33:43 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 06:33:43 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Thu, 27 Aug 2026 06:33:39 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NHqpIPAAWkSsI3i5F2nxLkGRjmHl9GDFNvD/y/4dW3bml8JDoETSD/bHhIbjMd5cVCG9IGfbehVEOk+7khgGd8zmd+9K1NZXLvzXjJeUwT1bSCXZOR3WftRaLgWGbVcBsMbUgV+aDdfOa6I7JYsupJWn6J9EU+RRYrI9bNOEQF+FPGgAEmjkeQlROy2WiekPzKsOXpDtRmo0lkWujd+w9fCAxBXPy9GBVIy58uFbjG81H6rDtRSnpEHw6pyupJzdxOlc4GT+lQjpbbrlg0afK97IZxLlWm40NZC1D0XBPJwCDHKVMwDcvZ2txd/Yg61hVdeKkQAZWrMbkndBsbn5qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+IG0YjbwUBcfGAukbLobS15jYceW1vbr7Zm+mLlg8A=;
 b=q+IxbBKy6NV56CYfg8F4CHAkq2IPUCCgehHidZsKkP9nrLPPDddTWU9rFqGPJO9Pi5FZXqbtsUmS2XYhP09fqvNZCLLLYETR1ZZ1BNWXawViwmKT5J9G0GE7f/jatUeIs8ITY5FQuJP8rwGr6BM830jTe7xw6//QjkmMnSKE493WYgKa2+MNGxMU86bG2/VVdyyAiZPe6Zo1dJaAcL6X0EMU2UbPPGbdNeCCKnImKjLfgZKqh4tBswwjROds4SgZ3y7mUmYCf3Ag8fkwgxgMdVLgRtwdg4H2KHWpxy24R5DTnJolpken25x5xnhRACsJ3H0yTD8eNYtHsFv+MlWzKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+IG0YjbwUBcfGAukbLobS15jYceW1vbr7Zm+mLlg8A=;
 b=v1p1SPMU4fz8X7N368+WzkT8GeiI21l3n8CO+rPkCjcDGlU4gAVvs840ooFJ7Vs8v4rf1p13LIHu3kqnUN8kYvqwm9TjsbYvlwoTCW6DR1dO3XYXmyCOziUUa/2y7a6xlSoaobQ1y2XcgahLKT6uX2zZFXz3zwqI2bWZEdf2AQY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <0a316355-3fb8-451e-883f-5cf906e1b1c2@amd.com>
Date: Thu, 27 Aug 2026 13:33:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] xen/arm: report clock_frequency via sysctl
 physinfo, not createdomain
To: Julian Vetter <julian.vetter@vates.tech>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>,
	Andrii Sultanov <andriy.sultanov@vates.tech>, Guillaume Thouvenin
	<guillaume.thouvenin@vates.tech>, =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, "Oleksii
 Kurochko" <oleksii.kurochko@gmail.com>, Teddy Astie <teddy.astie@vates.tech>
References: <20260820123805.2033085-1-julian.vetter@vates.tech>
 <20260820124016.2033421-1-julian.vetter@vates.tech>
 <1787229625.8631fc262581453bbf619ec5b2062170.1a01f2fdb8f000c4f3@vates.tech>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <1787229625.8631fc262581453bbf619ec5b2062170.1a01f2fdb8f000c4f3@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|PHXPR12MB999256:EE_
X-MS-Office365-Filtering-Correlation-Id: 76fd22e3-5faf-4870-e0ba-08df042f0e3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|7416014|23010399003|22082099003|18002099003|56012099006|3023799007|6133799003|11063799006|4143699003|5023799004|10067099003;
X-Microsoft-Antispam-Message-Info:
	pQwUyyNQ+wphidtCzG+ftIuleQgQT/SjfK1jlhhW97J+13xSyV/OSakGr5+3JiCnwO+ewvhfyLTwkgjubRTe2e9C8SZk1JJuJyh2BKBoMXTknQTcrm+OG4ndhi864j/nySQqBZjNkGNqFJWbeZvp1zk/DABotaFWEtdTPXOVfyvbiQP/zGV18g85R/xzxopABml9N5Tgso9OkatGdbPvoUICLORF+VKSekBHKyhgX2SQOP6ZCpx2NJhUvgpcWRR8P9Xf9V48sepullqobwf+NoqSfB0xzJ1r3s1/9C7LcgmyeYsesqKKp8bSkIXWZxMkiJMumBYefVMZNbrJbuv7bpXNSuo/WFkg9tyn1v2ApxoCF1rwKEfqQ9kzDXUnQAGsWyuCTVGDFq3lz3XiPazpVLBQvJSOuKXi4Zpf/jWdFStefXcgBFHQsEfJd/WewSNelqOcCbqtz4p20xgwt3kQT1vHfqchwM0M0x6kGJLFsmgKc3gVOM3ZZQrV9gVTzUxIVmqn1j5nfWe81kqhTAX8bH/SkXSXQZjWRTb6t1IY3ckcsexpWms41wG/t7nmb4KGK5yXSu0OaVEu/EHUU1YetQCRhuo32vAFDXMAhkYhekA8VHEmGa0mZwg8z0om3NAXcotNqU9/gMnsIpBfeVK6zcsTx5AvxxlTVVBOmaAlXOp8ojKNcmCElN9PGccs4Ul1V45IQpwMvfshIqH1GgekXA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(7416014)(23010399003)(22082099003)(18002099003)(56012099006)(3023799007)(6133799003)(11063799006)(4143699003)(5023799004)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UcsHiPs/HndlMnkwSQZel84+nt6C761fMH8SjskocFvnzvFw6tT68mFdjWIfpqw3xMMCFrWbrFKH5kDHKTwmTgzNI8SqGetEqMAP+8xmHbqUOIIPJVfVr/s4fz7e7rk0w8K75hIwm+76PKN1TAnvEHjUp0hxyNPre4VwOWdMmP5DLIHf5tKy8nKYMLnhgzp+TTU1zfhGAnleUmSXyEKIszK0oI2X9TsbOattHFdyltolH++l7z+tbiQiPb0UZrkbu2vCRlS8hNqNBn4O3Z+HAdbvOaNy9koKDPK/vBxy3ptdkG59++j97NwdSxewyYrqqPYtjgElqNBwIagegBS9svogWdTfjZaVIs/i4nwVQQfcaEGe3B/rYfH/brrq1q4dB1spLXdnf6/5AylTIxZa8QsP+Ax6MKqqpGdVTV33p0ZUCcgrr7e8BGmjg6SvL7Zn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 11:33:45.8175
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76fd22e3-5faf-4870-e0ba-08df042f0e3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PHXPR12MB999256
X-purgate-ID: tlsNG-d62444/1787830434-C495A757-AA199CAC/0/0
X-purgate-type: clean
X-purgate-size: 13638



On 20-Aug-26 14:40, Julian Vetter wrote:
> The xen_arch_domainconfig.clock_frequency value is populated in
> domain_vtimer_init() during XEN_DOMCTL_createdomain from the global
> timer_dt_clock_frequency, which comes from the host's DT timer node and
> has nothing to do with the domain being created. Like now removed
> GIC_NATIVE resolution, this is a host-wide system property being
> smuggled out through a domain-creation IN struct.
> 
> Expose it instead as a new arch_clock_frequency_hz field in
> XEN_SYSCTL_physinfo, populated via arch_do_physinfo(), and mirroring how
> the GIC capability bits were already moved there.
> 
> Rather than making the field dependant on DT boot, make Xen always
> report the timer frequency, either via the DT "clock-frequency" node, or
> directly via CNTFRQ_EL0. preinit_xen_time() already computes cpu_khz for
> every boot path. The renamed timer_clock_frequency_hz now captures
> whichever of the two produced that value, in full Hz precision, instead
> of only recording the DT case. So, ACPI guests get a real value too,
> allowing to drop the special case.
> 
> Although the CNTFRQ_EL0 register is 64 bits wide, and some current timer
> implementations run at 1GHz, a 32bit value is sufficient to store the
> timer value, because it only mirrors the DT 'clock-frequency' property,
> which the bindings define as a single 32-bit cell. The
> XEN_DOMCTL_INTERFACE_VERSION doesn't need to be bumped, because only a
> previously zero'ed / ignored field is now used.
I think you meant sysctl here where you're re-using the padding. For domctl, you
remove the member in the middle so the following fields have changed offsets and
the struct changes size from 16 to 12B. I think the version should be bumped.

> 
> The xen_arch_domainconfig parameter passed to domain_vtimer_init() is no
> longer needed, so drop that parameter entirely. libxl now fetches the
> frequency via libxl_get_physinfo() in libxl__arch_domain_save_config()
> instead of reading it back out of the createdomain reply. The OCaml
> xen_arch_domainconfig mirror drops the field too.
> 
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> ---
> Changes in v4:
> - Rename timer_dt_clock_frequency to timer_clock_frequency_hz
> - Always populate the frequency, and record it on the CNTFRQ_EL0 path in
>   preinit_xen_time(), instead of only when booting via DT
> - ACPI guests now get a real frequency value instead of 0
> ---
>  tools/libs/light/libxl.c          |  1 +
>  tools/libs/light/libxl_arm.c      | 13 ++++++++++++-
>  tools/libs/light/libxl_types.idl  |  1 +
>  tools/ocaml/libs/xc/xenctrl.ml    |  1 -
>  tools/ocaml/libs/xc/xenctrl.mli   |  1 -
>  xen/arch/arm/domain.c             |  2 +-
>  xen/arch/arm/include/asm/time.h   |  6 +++---
>  xen/arch/arm/include/asm/vtimer.h |  3 +--
>  xen/arch/arm/sysctl.c             |  3 +++
>  xen/arch/arm/time.c               |  7 ++++---
>  xen/arch/arm/vtimer.c             |  4 +---
>  xen/include/public/arch-arm.h     | 16 +---------------
>  xen/include/public/sysctl.h       | 12 +++++++++++-
>  13 files changed, 39 insertions(+), 31 deletions(-)
> 
> diff --git a/tools/libs/light/libxl.c b/tools/libs/light/libxl.c
> index a1fe16274d..ec7e6d3f65 100644
> --- a/tools/libs/light/libxl.c
> +++ b/tools/libs/light/libxl.c
> @@ -410,6 +410,7 @@ int libxl_get_physinfo(libxl_ctx *ctx, libxl_physinfo *physinfo)
>      physinfo->cap_gnttab_v2 =
>          !!(xcphysinfo.capabilities & XEN_SYSCTL_PHYSCAP_gnttab_v2);
>      physinfo->arch_capabilities = xcphysinfo.arch_capabilities;
> +    physinfo->arch_clock_frequency_hz = xcphysinfo.arch_clock_frequency_hz;
>  
>      GC_FREE;
>      return 0;
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 926d651857..cf441f0737 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -252,6 +252,9 @@ int libxl__arch_domain_save_config(libxl__gc *gc,
>                                     libxl__domain_build_state *state,
>                                     const struct xen_domctl_createdomain *config)
>  {
> +    libxl_physinfo info;
> +    int rc;
> +
>      switch (config->arch.gic_version) {
>      case XEN_DOMCTL_CONFIG_GIC_V2:
>          d_config->b_info.arch_arm.gic_version = LIBXL_GIC_VERSION_V2;
> @@ -264,7 +267,15 @@ int libxl__arch_domain_save_config(libxl__gc *gc,
>          return ERROR_FAIL;
>      }
>  
> -    state->clock_frequency = config->arch.clock_frequency;
> +    libxl_physinfo_init(&info);
> +    rc = libxl_get_physinfo(CTX, &info);
> +    if (rc) {
> +        LOG(ERROR, "failed to get physinfo");
> +        libxl_physinfo_dispose(&info);
> +        return ERROR_FAIL;
> +    }
> +    state->clock_frequency = info.arch_clock_frequency_hz;
`make_timer_node()` will now put clock-frequency into every libxl guest DT which
is not correct. I'm not sure how you want to signal to the toolstack that the
frequency comes from the DT property and not from the CNTFRQ.

> +    libxl_physinfo_dispose(&info);
>  
>      return 0;
>  }
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index a7893460f0..e24a3253f8 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -1201,6 +1201,7 @@ libxl_physinfo = Struct("physinfo", [
>      ("cap_gnttab_v1", bool),
>      ("cap_gnttab_v2", bool),
>      ("arch_capabilities", uint32),
> +    ("arch_clock_frequency_hz", uint32), # ARM only
>      ], dir=DIR_OUT)
>  
>  libxl_connectorinfo = Struct("connectorinfo", [
> diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
> index 147afa62c2..582897af6d 100644
> --- a/tools/ocaml/libs/xc/xenctrl.ml
> +++ b/tools/ocaml/libs/xc/xenctrl.ml
> @@ -32,7 +32,6 @@ type xen_arm_arch_domainconfig =
>    {
>      gic_version: int;
>      nr_spis: int;
> -    clock_frequency: int32;
>    }
>  
>  type x86_arch_emulation_flags =
> diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
> index 9fccb2c2c2..9414b87164 100644
> --- a/tools/ocaml/libs/xc/xenctrl.mli
> +++ b/tools/ocaml/libs/xc/xenctrl.mli
> @@ -26,7 +26,6 @@ type vcpuinfo = {
>  type xen_arm_arch_domainconfig = {
>    gic_version: int;
>    nr_spis: int;
> -  clock_frequency: int32;
>  }
>  
>  type x86_arch_emulation_flags =
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 94f8f077e9..96dc65270b 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -710,7 +710,7 @@ int arch_domain_create(struct domain *d,
>      if ( (rc = domain_vgic_init(d, config->arch.nr_spis)) != 0 )
>          goto fail;
>  
> -    if ( (rc = domain_vtimer_init(d, &config->arch)) != 0 )
> +    if ( (rc = domain_vtimer_init(d)) != 0 )
>          goto fail;
>  
>      if ( (rc = tee_domain_init(d, config->arch.tee_type)) != 0 )
> diff --git a/xen/arch/arm/include/asm/time.h b/xen/arch/arm/include/asm/time.h
> index c194dbb9f5..07091648a3 100644
> --- a/xen/arch/arm/include/asm/time.h
> +++ b/xen/arch/arm/include/asm/time.h
> @@ -87,10 +87,10 @@ enum timer_ppi
>  };
>  
>  /*
> - * Value of "clock-frequency" in the DT timer node if present.
> - * 0 means the property doesn't exist.
> + * The timer frequency, in Hz, that Xen ended up using: either the DT
> + * "clock-frequency" override, or a direct CNTFRQ_EL0 read.
>   */
> -extern uint32_t timer_dt_clock_frequency;
> +extern uint32_t timer_clock_frequency_hz;
>  
>  /* Get one of the timer IRQ number */
>  unsigned int timer_get_irq(enum timer_ppi ppi);
> diff --git a/xen/arch/arm/include/asm/vtimer.h b/xen/arch/arm/include/asm/vtimer.h
> index 9d4fb4c6e8..6bbfcf4e69 100644
> --- a/xen/arch/arm/include/asm/vtimer.h
> +++ b/xen/arch/arm/include/asm/vtimer.h
> @@ -20,8 +20,7 @@
>  #ifndef __ARCH_ARM_VTIMER_H__
>  #define __ARCH_ARM_VTIMER_H__
>  
> -extern int domain_vtimer_init(struct domain *d,
> -                              struct xen_arch_domainconfig *config);
> +extern int domain_vtimer_init(struct domain *d);
>  extern int vcpu_vtimer_init(struct vcpu *v);
>  extern bool vtimer_emulate(struct cpu_user_regs *regs, union hsr hsr);
>  extern void virt_timer_save(struct vcpu *v);
> diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
> index 8411deb7e2..789ad78a14 100644
> --- a/xen/arch/arm/sysctl.c
> +++ b/xen/arch/arm/sysctl.c
> @@ -15,6 +15,7 @@
>  
>  #include <asm/arm64/sve.h>
>  #include <asm/gic.h>
> +#include <asm/time.h>
>  #include <asm/vgic.h>
>  
>  #include <public/sysctl.h>
> @@ -26,6 +27,8 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>      pi->arch_capabilities |= MASK_INSR(sve_encode_vl(get_sys_vl_len()),
>                                         XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
>  
> +    pi->arch_clock_frequency_hz = timer_clock_frequency_hz;
> +
>      /*
>       * The GIC version(s) we're happy creating guests with. Right now for
>       * simplicity it is tied to the active hardware version, but this will
> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
> index 6955b2788f..bcbd038cb2 100644
> --- a/xen/arch/arm/time.c
> +++ b/xen/arch/arm/time.c
> @@ -35,7 +35,7 @@ uint64_t __read_mostly boot_count;
>   * register-mapped time source in the SoC. */
>  unsigned long __read_mostly cpu_khz;  /* CPU clock frequency in kHz. */
>  
> -uint32_t __read_mostly timer_dt_clock_frequency;
> +uint32_t __read_mostly timer_clock_frequency_hz;
>  
>  static unsigned int timer_irq[MAX_TIMER_PPI];
>  
> @@ -120,7 +120,7 @@ static void __init preinit_dt_xen_time(void)
>      {
>          cpu_khz = DIV_ROUND(rate, 1000);
>          validate_timer_frequency();
> -        timer_dt_clock_frequency = rate;
> +        timer_clock_frequency_hz = rate;
>      }
>  }
>  
> @@ -136,7 +136,8 @@ void __init preinit_xen_time(void)
>  
>      if ( !cpu_khz )
>      {
> -        cpu_khz = DIV_ROUND(READ_SYSREG(CNTFRQ_EL0) & CNTFRQ_MASK, 1000);
> +        timer_clock_frequency_hz = READ_SYSREG(CNTFRQ_EL0) & CNTFRQ_MASK;
> +        cpu_khz = DIV_ROUND(timer_clock_frequency_hz, 1000);
>          validate_timer_frequency();
>      }
>  
> diff --git a/xen/arch/arm/vtimer.c b/xen/arch/arm/vtimer.c
> index 2e85ff2b6e..18f5676158 100644
> --- a/xen/arch/arm/vtimer.c
> +++ b/xen/arch/arm/vtimer.c
> @@ -52,7 +52,7 @@ static void virt_timer_expired(void *data)
>      perfc_incr(vtimer_virt_inject);
>  }
>  
> -int domain_vtimer_init(struct domain *d, struct xen_arch_domainconfig *config)
> +int domain_vtimer_init(struct domain *d)
>  {
>      d->arch.virt_timer_base.offset = get_cycles();
>      d->arch.virt_timer_base.nanoseconds =
> @@ -60,8 +60,6 @@ int domain_vtimer_init(struct domain *d, struct xen_arch_domainconfig *config)
>      d->time_offset.seconds = d->arch.virt_timer_base.nanoseconds;
>      do_div(d->time_offset.seconds, 1000000000);
>  
> -    config->clock_frequency = timer_dt_clock_frequency;
> -
>      /*
>       * Per the ACPI specification, providing a secure EL1 timer
>       * interrupt is optional and will be ignored by non-secure OS.
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index e95fa33eb7..c7118e7884 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -335,7 +335,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>  #define XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_VMSA    2
>  
>  struct xen_arch_domainconfig {
> -    /* IN/OUT */
> +    /* IN */
>      uint8_t gic_version;
>      /* IN - Contains SVE vector length divided by 128 */
>      uint8_t sve_vl;
> @@ -343,20 +343,6 @@ struct xen_arch_domainconfig {
>      uint16_t tee_type;
>      /* IN */
>      uint32_t nr_spis;
> -    /*
> -     * OUT
> -     * Based on the property clock-frequency in the DT timer node.
> -     * The property may be present when the bootloader/firmware doesn't
> -     * set correctly CNTFRQ which hold the timer frequency.
> -     *
> -     * As it's not possible to trap this register, we have to replicate
> -     * the value in the guest DT.
> -     *
> -     * = 0 => property not present
> -     * > 0 => Value of the property
> -     *
> -     */
> -    uint32_t clock_frequency;
>      /* IN */
>      uint8_t arm_sci_type;
>      /* IN */
> diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
> index d20ebf3644..04cb1f3bdc 100644
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -120,7 +120,17 @@ struct xen_sysctl_physinfo {
>      uint32_t cpu_khz;
>      uint32_t capabilities;/* XEN_SYSCTL_PHYSCAP_??? */
>      uint32_t arch_capabilities;/* XEN_SYSCTL_PHYSCAP_{X86,ARM,...}_??? */
> -    uint32_t pad;
> +    /*
> +     * ARM only. The timer frequency, in Hz, that Xen is using. Either
> +     * "clock-frequency" property from DT timer node or CNTFRQ_EL0 value.
> +     *
> +     * As it's not possible to trap this register, we have to replicate the
> +     * value in the guest DT.
> +     *
> +     * = 0 => non-ARM, or the frequency could not be determined.
I'm struggle to understand the second condition. On Arm we validate the
frequency to be at least 1kHZ, so this field cannot be 0 on Arm.

> +     * > 0 => The frequency, in Hz.
> +     */
> +    uint32_t arch_clock_frequency_hz;
>      uint64_aligned_t total_pages;
>      uint64_aligned_t free_pages;
>      uint64_aligned_t scrub_pages;

~Michal


