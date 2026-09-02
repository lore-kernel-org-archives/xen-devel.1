Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB6DC624D0
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 09:45:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405495.1638999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1hWp-0005RR-Ld; Wed, 02 Sep 2026 09:45:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405495.1638999; Wed, 02 Sep 2026 09:45:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1hWp-0005RK-Il; Wed, 02 Sep 2026 09:45:11 +0000
Received: by outflank-mailman (input) for mailman id 1405495;
 Wed, 02 Sep 2026 09:45:11 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ayan.kumar.halder@amd.com>) id 1x1hWo-0005Pa-MD
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 09:45:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1hWn-00B1lJ-Uw
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 11:45:10 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a97f025-8faa-0a2a0a5109dd-0a2a4508977a-0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:45:09 +0200
Received: from [52.101.53.59]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a97f024-f659-0a2a45080019-3465353bd724-4
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:45:09 +0200
Received: from SN7PR04CA0087.namprd04.prod.outlook.com (2603:10b6:806:121::32)
 by IA1PR12MB8555.namprd12.prod.outlook.com (2603:10b6:208:44f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 09:45:02 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10b6:806:121:cafe::ac) by SN7PR04CA0087.outlook.office365.com
 (2603:10b6:806:121::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Wed, 2
 Sep 2026 09:45:02 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 09:45:02 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 2 Sep
 2026 04:45:01 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 2 Sep
 2026 04:45:02 -0500
Received: from [10.71.198.170] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Wed, 2 Sep 2026 04:44:59 -0500
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
 b=VaNaFkPxxuKAWjK+plyShAHfpb7UHbH8apYtwWlfqt0LUChEo92aVXQGoS3IQo/eZGvpI1pxUatWqlrIpzfF9AnN6+UrmwIb/OutSXLYWBebd5yY9rK+RYXrXbf0PTBcHi4SM8YJH3KLQ6q6szDMbxrJPL+rsoeDq03o8Z9jyiV2whOScmvARrZXM81X6RJoL4GzGWZeN6188gXixmurO9wc6Y6ivyp/U0Pn7fs4e7UnEXAxELHFbHsvPMpdOJYmtsmUtEZWwsi0+rZsnBm7BzwF/kwijgaOhzQcHLxphJ2mpfIJRIEbeMFs+IwgymcXW/TeeXr7HnTm5cC6nkyHLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9R2QEKRMjFQlZwrUsSGWRWGD22RJL6fva8FfRxAifWs=;
 b=uU5d62TdugIhQn4QndoC3jM03z8pJUpdOJBiWBcpWXlUvAk9jJsrt9VYSz/tqnKsyA2GHfHQAIx7BI9VC+kaquy7hb5RW0mH2jY//bdBJhya8CtZKblVNZZ+v7UdmPIMvyspsbOLgrgWv7VIn3T7v925Yjb1EAaXjdiyw8di4QP9l4oGLxl/Fmv/5t8yp96FPdvE9gwvU71v2kGJ61ZD7UcdJCm6OPTAhjorp3OTqQBCtcdKJq0TNbM3Fx/84cGn75DG7uYf/BtljGT52pW0Z76KLIiN7v5XLxgOLf9m67E1jPP71VW62GxWRqIi8Fm9QwVNMBTXxaDq6bZWPrAbYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9R2QEKRMjFQlZwrUsSGWRWGD22RJL6fva8FfRxAifWs=;
 b=ynBBusbrqaA51jgKzHAoa9j9rPfDywwXhbZ9OAvAijT0CG3Mpgp3dH8uhvpQAkmGdMl8uPeEiqIj2fqK/acjBlpn3fcU9n0IFvfn52m9i/peaoVRJ7pTM/BywFEfJiFYVnIVffn65J71QoZ7ygoT24B+um8fYMcBpCPeV6UMSUI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <48a7a4a3-605a-4a22-a7ad-2a4041f65b77@amd.com>
Date: Wed, 2 Sep 2026 10:44:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drivers/char: Panic when the requested UART fails to
 initialise
To: Michal Orzel <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>, Alistair Francis <alistair.francis@wdc.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, <matthew.l.weber3@boeing.com>, Andrei Buzdugan
	<andrei_buzdugan@epam.com>, Simone Weiss <simone.weiss@linutronix.de>,
	<uwendi@gmail.com>, <harunobu.kurokawa.dn@renesas.com>
References: <20260902073606.61062-1-michal.orzel@amd.com>
 <20260902073606.61062-4-michal.orzel@amd.com>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <20260902073606.61062-4-michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|IA1PR12MB8555:EE_
X-MS-Office365-Filtering-Correlation-Id: 515725c5-a3b3-4da4-7b1b-08df08d6dc6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|36860700016|82310400026|1800799024|6133799003|10067099003|4143699003|5023799004|11063799006|18002099003|22082099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	7ceoMUCm+nuDrvlp6SKHwa8VceiLa2THAXEnBwLO/gY/hC4rKFaOaSkBYYfNqWY7hcTiZKmzP7pDpx0qifUBOWnYTPb+kvg/0yii5ren4va//QD3hJONPW/BkTt+xQNL9YF30m1lFJiImukaYDIOQKUYccdiwcFbByIAeFpnds13KrWc7xlhxcGIiN86V0nhdl0hCLft3OBVGQlFxZYUEONQZOQjx2MDCn35uP3U1wVwiDTPPg5JeOahxeUIN5/cJZpZjGBH/b5pfhBO/0B1/SW1VXd8olab7OaBOg99UteUcB48e2r5rALY6hSo+RDUnKrKkDZpZRBvpoYV8tJEMPabVrhCAJ5dubFr3MOJAEz7unjwhW9G+BH+ZrddmhjVrsStdko7tIJr2VsLy9ZTi0sIiW2bpkdcbveZUrwpO6YbbnRcsq8V1cJG7kXu9ded04f8YRdYc/Rm0mn1qE1alYGqmWlu9vpJyba9fNpKdaOhrQGS//YErXhb7Y6HlYC4mI5DYnlGpqcvWa2IcWlsJ8CSoOtdB/451ehSIBHsbtoqdsQ1eb51B32pYFNi6ceTAOr5Vcc7a69Z8RUr0I+9mlZLFFB+DWes29pUUgXioJEnKjxWRI+KhGFSlVqrMlXlkqahRvv4UA/W8xkzwNB6nDfyW+Rb4VXlr+h9CKYXX+/hI4gFdD1J9LshuBiIf8eO333r5Z+/P/rPx4qr0BcDJA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(36860700016)(82310400026)(1800799024)(6133799003)(10067099003)(4143699003)(5023799004)(11063799006)(18002099003)(22082099003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fMhOU3878vSw22WL8qE9NTNGedcBv7jPK72gHRAZAa4tCWdnbMt7reNRUjr/U2byWiZA+mjszvIwHDvs9Mk5jhLOCCJsEZIUrnxLNR7dZUOOn+Jv13kTHc/wH0rDXMNKOtsMaEdjdOAmiVAyw8mJ18W49Ok8JprIV7SMQxGupCUlHRYGJM7uPwqJK1aNd2O+bcTsQiz9taLeffyiLJNSLTCcoQgXlvFYzGTucMdxS0ZK8EtdIYGsUcmSMz2Fy+tdBu7TTQGiQloh2m/PSE0IsvW0uHpgYyKRiiIbtuwH3+MrNM63cl424sSZAXmCD2ZlmEVdZbke+hIXZnbGGSOYvTLCcLECvsfI6d+Qh9ffriEdfVQ4Aws7kxQdLRDg+F1IZvMFZAKDWIcRH15IcvZSdawgCOhDVkcTPor9PZamwj/9FShJVAHX6ivCuMNkecXh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 09:45:02.3432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 515725c5-a3b3-4da4-7b1b-08df08d6dc6d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8555
X-purgate-ID: tlsNG-c1860d/1788342309-CE54487B-F36AF1EC/0/0
X-purgate-type: clean
X-purgate-size: 7631

Hi,

On 02/09/2026 08:36, Michal Orzel wrote:
> uart_init() cannot tell its caller that the UART the user asked for did
> not come up: every failure path only printks. Arm and RISC-V carry on
> into console_init_preirq() and boot without a console, rather than
> refusing to boot as they do elsewhere when a user request cannot be met.
I just want to emphasize that from functional safety perspective, this 
is the preferred approach. The user's request is given the priority and 
whenever it cannot be satisfied, Xen should panic.
>
> Return an error from dt_uart_init() and panic in start_xen(). An
> explicit request Xen cannot satisfy should stop the boot rather than
> silently degrade it,

If there is a silent degradation, then we need to document this behavior 
somewhere. I am happy to keep this documented under docs/fusa.

In the safety manual, we should mention all the instances when there is 
a silent degradation observed, the underlying reason and how the end 
user can detect it.

Other FuSa experts can comment.

>   which is what start_xen() already does for the rest
> of the boot configuration.
>
> Only a path given on the command line counts as a request we have to
> satisfy. Falling back to /chosen/stdout-path or acpi_uart_init()
> therefore never fails. SPCR is firmware provided, the analogue of
> stdout-path, and there is no ACPI equivalent of dtuart= to make an
> explicit request with.
>
> While here, decide whether the SPCR table was found from the returned
> acpi_status rather than from the table pointer, which was only NULL
> because the caller initialised it - acpi_get_table() writes it solely
> on success.
>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> With this change diagnosibility decreases only for a single scenario:
> when dom0 is reachable not via console (e.g. network) and you'd have used xl
> dmesg to read messages from the conring.
>
> On Arm (I suppose RISC-V is similar), given that safety becomes the major
> use-case and we need to satisfy all the user/guest-xen contracts, I think the
> patch moves us in a direction we already chose (i.e. we panic on every boot
> failure where we cannot meet the requests).
> ---
>   xen/arch/arm/setup.c         |  5 +++-
>   xen/arch/riscv/setup.c       |  6 ++++-
>   xen/drivers/char/uart-init.c | 52 +++++++++++++++++++++---------------
>   xen/include/xen/serial.h     |  6 ++++-
>   4 files changed, 44 insertions(+), 25 deletions(-)
>
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 6310a47d68b6..d0066db42e7c 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -379,7 +379,10 @@ void asmlinkage __init noreturn start_xen(unsigned long fdt_paddr)
>   
>       gic_preinit();
>   
> -    uart_init();
> +    rc = uart_init();
> +    if ( rc )
> +        panic("Failed to initialize the requested UART (%d)\n", rc);
> +
>       console_init_preirq();
>       console_init_ring();
>   
> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> index 56a0907a855f..07f46ac3ce27 100644
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -77,6 +77,7 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>   {
>       const char *cmdline;
>       size_t fdt_size;
> +    int rc;
>   
>       remove_identity_mapping();
>   
> @@ -149,7 +150,10 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>   
>       intc_preinit();
>   
> -    uart_init();
> +    rc = uart_init();
> +    if ( rc )
> +        panic("Failed to initialize the requested UART (%d)\n", rc);
> +
>       console_init_preirq();
>   
>       intc_init();
> diff --git a/xen/drivers/char/uart-init.c b/xen/drivers/char/uart-init.c
> index eb7f85549593..b79135be9620 100644
> --- a/xen/drivers/char/uart-init.c
> +++ b/xen/drivers/char/uart-init.c
> @@ -30,15 +30,17 @@
>   static char __initdata opt_dtuart[256] = "";
>   string_param("dtuart", opt_dtuart);
>   
> -static void __init dt_uart_init(void)
> +static int __init dt_uart_init(void)
>   {
>       struct dt_device_node *dev;
>       int ret;
>       const char *devpath = opt_dtuart;
>       const char *options;
>       char *split;
> +    /* Set on the command line, as opposed to inherited from /chosen */
> +    bool explicit_request = strcmp(opt_dtuart, "") != 0;
>   
> -    if ( !strcmp(opt_dtuart, "") )
> +    if ( !explicit_request )
>       {
>           const struct dt_device_node *chosen = dt_find_node_by_path("/chosen");
>   
> @@ -62,7 +64,12 @@ static void __init dt_uart_init(void)
>       if ( !strcmp(opt_dtuart, "") )
>       {
>           printk("No dtuart path configured\n");
> -        return;
> +
> +        /*
> +         * console=dtuart is the compiled-in default, so an absent dtuart= is
> +         * not a failed user request.
> +         */
> +        return 0;
>       }
>   
>       split = strchr(opt_dtuart, ':');
> @@ -83,48 +90,49 @@ static void __init dt_uart_init(void)
>       if ( !dev )
>       {
>           printk("Unable to find device \"%s\"\n", devpath);
> -        return;
> +        return explicit_request ? -ENODEV : 0;
>       }
>   
>       ret = device_init(dev, DEVICE_SERIAL, options);
> -
>       if ( ret )
>           printk("Unable to initialize dtuart: %d\n", ret);
> +
> +    return explicit_request ? ret : 0;
>   }
>   
>   #ifdef CONFIG_ACPI
> -static void __init acpi_uart_init(void)
> +static int __init acpi_uart_init(void)
>   {
> -    struct acpi_table_spcr *spcr = NULL;
> +    struct acpi_table_spcr *spcr;
> +    acpi_status status;
>       int ret;
>   
> -    acpi_get_table(ACPI_SIG_SPCR, 0, (struct acpi_table_header **)&spcr);
> +    /* SPCR is firmware provided, so nothing here is a failed user request */
> +    status = acpi_get_table(ACPI_SIG_SPCR, 0,
> +                            (struct acpi_table_header **)&spcr);
>   
> -    if ( spcr == NULL )
> +    if ( ACPI_FAILURE(status) )
>       {
>           printk("Unable to get spcr table\n");
> +        return 0;
>       }
> -    else
> -    {
> -        ret = acpi_device_init(DEVICE_SERIAL, NULL, spcr->interface_type);
>   
> -        if ( ret )
> -            printk("Unable to initialize acpi uart: %d\n", ret);
> -    }
> +    ret = acpi_device_init(DEVICE_SERIAL, NULL, spcr->interface_type);
> +    if ( ret )
> +        printk("Unable to initialize acpi uart: %d\n", ret);
> +
> +    return 0;
>   }
>   #else
> -static void __init acpi_uart_init(void) { }
> +static int __init acpi_uart_init(void) { return 0; }
>   #endif
>   
> -void __init uart_init(void)
> +int __init uart_init(void)
>   {
>       if ( !console_has("dtuart") )
> -        return; /* Not for us */
> +        return 0; /* Not for us */
>   
> -    if ( acpi_disabled )
> -        dt_uart_init();
> -    else
> -        acpi_uart_init();
> +    return acpi_disabled ? dt_uart_init() : acpi_uart_init();
>   }
>   
>   /*
> diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
> index 8e1844555208..3a71da767dd7 100644
> --- a/xen/include/xen/serial.h
> +++ b/xen/include/xen/serial.h
> @@ -170,7 +170,11 @@ void xhci_dbc_uart_init(void);
>   static void inline xhci_dbc_uart_init(void) {}
>   #endif
>   
> -void uart_init(void);
> +/*
> + * Returns 0 unless a UART explicitly requested via dtuart= failed to
> + * initialise.
> + */
> +int uart_init(void);
>   
>   struct physdev_dbgp_op;
>   int dbgp_op(const struct physdev_dbgp_op *op);

LGTM

- Ayan


