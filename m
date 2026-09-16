Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A2CC88E77
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 12:50:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1423095.1648387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6p5H-0002ou-4u; Wed, 16 Sep 2026 12:49:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1423095.1648387; Wed, 16 Sep 2026 12:49:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6p5H-0002on-09; Wed, 16 Sep 2026 12:49:55 +0000
Received: by outflank-mailman (input) for mailman id 1423095;
 Wed, 16 Sep 2026 12:49:53 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ayan.kumar.halder@amd.com>) id 1x6p5F-0002nI-Lf
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 12:49:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6p5F-002eo5-2V
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 14:49:53 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6aaa905f-2eae-0a2a0a5409dd-0a2a4503ad00-42
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 14:49:52 +0200
Received: from [52.101.43.69]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6aaa906e-fae8-0a2a45030019-34652b458713-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 14:49:52 +0200
Received: from MN0PR02CA0030.namprd02.prod.outlook.com (2603:10b6:208:530::20)
 by IA1PR12MB7663.namprd12.prod.outlook.com (2603:10b6:208:424::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 12:49:42 +0000
Received: from BN3PEPF0000B06A.namprd21.prod.outlook.com
 (2603:10b6:208:530:cafe::9b) by MN0PR02CA0030.outlook.office365.com
 (2603:10b6:208:530::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Wed,
 16 Sep 2026 12:49:41 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B06A.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.1 via Frontend Transport; Wed, 16 Sep 2026 12:49:41 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 16 Sep
 2026 07:49:40 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 16 Sep
 2026 07:49:40 -0500
Received: from [10.71.198.170] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Wed, 16 Sep 2026 07:49:38 -0500
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
 b=VoRFHW+6GXrySzh6X388L0L/BwMx5gXMo9xqH9ruvn+ZmqcKkuQDzH8QFI1tBq+I7pXkghEH1InJDysCEtC/5yzDZMEHK3xcU5NoRUYJOgS1WDIgTRIQkBzaPyjOs3OtsuO8GvWkuvATOSmkrNtnSy5wDc5KRuwUxwXpFMfe2i7K0OR+mR7Q416Q0G0gLcDIhVILGec8RBLWVLYKSQkyQU0dQkRwvt+x6CJp3lcSTAG02hYmr2ujzDMgymRc3EeMca4iJ4u6CMXzxnEhH8Bht/99fdrFpQakOfZJazAq4TocDLkT3xRcSwu86TvoicD8+Ov0Czu91PLI/7LgkbATfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p7rj08W+9s+ncwSiQ/vMxa2pDYFXixayHnpEoVjV+s8=;
 b=wyOS0MBX/upHjZa0DnR/Bl9rSLsGNwj7IQaPmFhaAR0f703aItXRn2+ZB1wxzmP93l4nRKgXbPLA/A52nFPDXIAjqk/Giqa3ih4Badf3jIb44+131LWXUemVPzzg3mgM/Ip08bm20M895mdg1IbiTnsONJBKmLS0my+ik0T3Gwnj9AwWzdcW4rxp2SCVCH+CsZ81O6nF5sUcQRuyRLeIb/QoCEOqSthY2VWUUXIGIQ0OzR/oA2dvqB3xJTAeHCggty3Macu98iCxI+tWLqB7eJdyHzQ/TXThE26mKzKhyNjTF2ubvD51mboDa2rfC7EVihupiTJkngT/hyjZ/mcNyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7rj08W+9s+ncwSiQ/vMxa2pDYFXixayHnpEoVjV+s8=;
 b=4yevIhmpDaCSdCba9AHwzOYs8fbwQR/fEerL7XGxt/zcSW/NwNnYumOwHedYBgR49OfQNP33S5a/4gEsjFjFhmuv4JKx1LjEKYCuiPl6A7/LO3VRqHF0y6xQ/fqtgdMlFco6YHA050gqhLlrUF0J6rx+lm6o0vXuI3fWlW42xAU=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <e4588f6c-6c27-4bbf-a87b-1d18dc08b70e@amd.com>
Date: Wed, 16 Sep 2026 13:49:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 for 4.23] Add GIC SGI boot/self tests in Xen
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, Roger Pau Monne <roger@xenproject.org>, "Doug
 Goldstein" <cardoe@cardoe.com>
References: <20260529170956.49797-1-ayan.kumar.halder@amd.com>
 <20260828102933.2853627-1-ayan.kumar.halder@amd.com>
 <7d6ffbc7-83e7-4254-9cc2-f2a7113088ab@xen.org>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <7d6ffbc7-83e7-4254-9cc2-f2a7113088ab@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06A:EE_|IA1PR12MB7663:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cc6fe51-e725-4d5e-194a-08df13f0fa09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|23010399003|1800799024|56012099006|11063799006|4143699003|6133799003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2x+U8YY9nqqPJ48XvQ/KkYwJn0T/Q2Mq3vZJ9Ucy6WKFKYAK6nIpxh4nGcgyJgEo8PzNNpgvGO7jjlrFFkYicg/KnDMuut4GUXGea4MXEcwqeVCf7s3LFkA+A01ejNNNENlk9eWU9C9ak2PICm1iKbvSsfkrXVhVXU14u2vGLNJbixNkIIvKY5OQKjXDnZqMFPJRHlD9VlDzsMxIjX700oz93vEG1uhSU2WkszMZPgz9j24I/yQgpr0WC1ixTAy49GcoubA7yyHXVfnrxLCjL1a8XCK5R7j61ETlnsnaa0i2vkPt5IWKVu8HWhpWBbTrXJ8fgdOJBlmIQ4CZWTBNf7UKhoFE4b8mWGqXLaSWjIbfrrbbXBDm64mNzKAoT7Qaguvk7Nnd2I7YhW9sp0QEE4nrQWdiWBff5ZxBdVP5X4puDaFZGPp4gAslqIr0OrCTf/N4kosMTlKWDsoB3UZyA78GgVHNbgApV4e0MlnQ+s1PFOT5Fe5Hz7pO/86K8CogXOaVtfdGGvfAC6yrJFtJ9ZQthC7kkqZMwIrlR6ltA/iKgNaZfZhB1uInIgWQUYNC//WNDr5Uu/OghTm/gT2k+PcsjAPn0f+SbuKPpK4uctCrAr7oCTQ2PiYslY7Cy9LLvQpxmqYhz5x9Xknc03ytdDIQdlobzGiHmpaH2xbPAErqMTKaZFrC3HUCKktKGIVnH19MHWz2WX0Nu0+tnZlHKA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(23010399003)(1800799024)(56012099006)(11063799006)(4143699003)(6133799003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tVch2RuI8a78GdlOWOMWD+EiKpQfo7LPRmX7Cej1bDgk9j2CSloPiNPJxwt4KXQ4qKL38WdRj5snniSJ4/hr7wSJ9Ar4Lpi46zToL3riRCc2YQA0TLfkw2PC7P7J7IxBC22Fb7kShGpONId8bMcw6bLmhvE81gfeHlLF4+jjozDHdkBYnPnjwFJVtvjVOVXOxCPI2ZVi9PVzmJyvGQYTduU4QRS5i30XJtfiwZo3WeTKPstPdzLjAU/8m86QtyOTG9kxH/ltgdwsUu93ifIGlugmsG/ISE2ZZjkTKlyOhc5q95FdxAb/IRur7/rhefvfMpxfZg1q94QDptCpuaC9uL/9L3msAwkMdNwAMQ4mZVPDCGnI8E0qpcBLof2ODF17E9Suj5qoJoyuQIYlXtGFupR8xvN8sQL7A8K8H8KpowemII4TYFzE1PqJWhOCetBI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 12:49:41.7434
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cc6fe51-e725-4d5e-194a-08df13f0fa09
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06A.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7663
X-purgate-ID: tlsNG-33051d/1789562992-6F2C84E9-C74597F1/0/0
X-purgate-type: clean
X-purgate-size: 6500


On 04/09/2026 20:21, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> It is usually preferred to send a new version in its own thread rather 
> than in-reply-to an existing version.
Apologies, this was my mistake (bad git send command).
>
> On 28/08/2026 12:29, Ayan Kumar Halder wrote:
>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
>> index b7afd3e58c..71f177824b 100644
>> --- a/xen/arch/arm/Makefile
>> +++ b/xen/arch/arm/Makefile
>> @@ -24,6 +24,7 @@ obj-y += domctl.o
>>   obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
>>   obj-y += efi/
>>   obj-y += gic.o
>> +obj-$(CONFIG_BOOT_SELFTEST) += gic-test.o
>>   obj-$(CONFIG_GICV2) += gic-v2.o
>>   obj-$(CONFIG_GICV3) += gic-v3.o
>>   obj-$(CONFIG_HAS_ITS) += gic-v3-its.o
>> diff --git a/xen/arch/arm/gic-test.c b/xen/arch/arm/gic-test.c
>> new file mode 100644
>> index 0000000000..9ddd47cad2
>> --- /dev/null
>> +++ b/xen/arch/arm/gic-test.c
>> @@ -0,0 +1,102 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>
> The preferred license for Xen is GPLv2-only (see COPYING). Can you 
> confirm the use of GPL2+ is intended?
fixed
>
>> +
>> +#include <xen/atomic.h>
>> +#include <xen/cpumask.h>
>> +#include <xen/init.h>
>> +#include <xen/lib.h>
>> +#include <xen/param.h>
>> +#include <xen/percpu.h>
>> +#include <xen/smp.h>
>> +#include <xen/time.h>
>> +#include <asm/gic.h>
>> +#include <asm/processor.h>
>> +#include <asm/setup.h>
>> +
>> +static bool __initdata opt_gic_test;
>> +boolean_param("gic-test", opt_gic_test);
>> +
>> +static DEFINE_PER_CPU(unsigned int, sgi_test_count);
>> +
>> +void gic_sgi_test_interrupt(void)
>> +{
>> +    this_cpu(sgi_test_count)++;
>
> In sgi_count(), you are using ACCESS_ONCE() to read the content of the 
> variable, but I am not entirely sure this_cpu(...)++ is guarantee to 
> be a single write.
>
> As this happen on different CPU, don't we also need to use 
> ACCESS_ONCE() here too
ACCESS_ONCE(this_cpu(sgi_test_count))++;

>  or atomically increment?
>
> [...]
>
>> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
>> index 078049e741..6a132c64e1 100644
>> --- a/xen/arch/arm/gic.c
>> +++ b/xen/arch/arm/gic.c
>> @@ -330,6 +330,11 @@ static void do_static_sgi(struct cpu_user_regs 
>> *regs, enum gic_sgi sgi)
>>       case GIC_SGI_CALL_FUNCTION:
>>           smp_call_function_interrupt();
>>           break;
>> +#ifdef CONFIG_BOOT_SELFTEST
>> +    case GIC_SGI_TEST:
>> +        gic_sgi_test_interrupt();
>> +        break;
>> +#endif
>>       default:
>>           panic("Unhandled SGI %d on CPU%d\n", sgi, smp_processor_id());
>>           break;
>> diff --git a/xen/arch/arm/include/asm/gic.h 
>> b/xen/arch/arm/include/asm/gic.h
>> index ee2c26adb4..40635a9d32 100644
>> --- a/xen/arch/arm/include/asm/gic.h
>> +++ b/xen/arch/arm/include/asm/gic.h
>> @@ -306,6 +306,9 @@ enum gic_sgi {
>>       GIC_SGI_EVENT_CHECK,
>>       GIC_SGI_DUMP_STATE,
>>       GIC_SGI_CALL_FUNCTION,
>> +#ifdef CONFIG_BOOT_SELFTEST
>> +    GIC_SGI_TEST,
>> +#endif
>>       GIC_SGI_STATIC_MAX,
>>   };
>>   @@ -321,6 +324,11 @@ extern void send_SGI_one(unsigned int cpu, 
>> enum gic_sgi sgi);
>>   extern void send_SGI_self(enum gic_sgi sgi);
>>   extern void send_SGI_allbutself(enum gic_sgi sgi);
>>   +#ifdef CONFIG_BOOT_SELFTEST
>> +/* Record a GIC_SGI_TEST delivered to this CPU (see 
>> arch/arm/gic-test.c). */
>
> I would suggest to remove (see ...). One can easily find 
> gic_sgi_test_interrupt() and this reduces the risk of stale file name.
>
>> +void gic_sgi_test_interrupt(void);
>> +#endif
>> +
>>   /* print useful debug info */
>>   extern void gic_dump_info(struct vcpu *v);
>>   extern void gic_dump_vgic_info(struct vcpu *v);
>> diff --git a/xen/arch/arm/include/asm/setup.h 
>> b/xen/arch/arm/include/asm/setup.h
>> index 0adfa4993a..2fdf5da526 100644
>> --- a/xen/arch/arm/include/asm/setup.h
>> +++ b/xen/arch/arm/include/asm/setup.h
>> @@ -50,6 +50,15 @@ void setup_mm(void);
>>   extern uint32_t hyp_traps_vector[];
>>   void init_traps(void);
>>   +#ifdef CONFIG_BOOT_SELFTEST
>> +#define __initcallboottest(fn) \
>> +    static const initcall_t __initcall_##fn __init_call("boottest") 
>> = (fn)
>> +
>> +void do_init_boottests(void);
>> +#else
>> +static inline void do_init_boottests(void) {}
>> +#endif
>> +
>>   int handle_device(struct domain *d, struct dt_device_node *dev, 
>> p2m_type_t p2mt,
>>                     struct rangeset *iomem_ranges, struct rangeset 
>> *irq_ranges);
>>   diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>> index 6310a47d68..c7abbdb04e 100644
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -83,6 +83,24 @@ static void __init init_idle_domain(void)
>>       /* TODO: setup_idle_pagetable(); */
>>   }
>>   +#ifdef CONFIG_BOOT_SELFTEST
>> +extern const initcall_t __initcall_boot_test_start[],
>> +    __initcall_boot_test_end[];
>> +
>> +void do_init_boottests(void)
>> +{
>> +    const initcall_t *call;
>> +
>> +    printk("CPU%u: boot self-tests start\n", smp_processor_id());
>> +
>> +    for ( call = __initcall_boot_test_start; call < 
>> __initcall_boot_test_end;
>> +          call++ )
>> +        (*call)();
>> +
>> +    printk("CPU%u: boot self-tests done\n", smp_processor_id());
>> +}
>> +#endif /* CONFIG_BOOT_SELFTEST */
>> +
>>   static const char * __initdata processor_implementers[] = {
>>       ['A'] = "ARM Limited",
>>       ['B'] = "Broadcom Corporation",
>> @@ -470,6 +488,8 @@ void asmlinkage __init noreturn 
>> start_xen(unsigned long fdt_paddr)
>>       enable_errata_workarounds();
>>       enable_cpu_features();
>>   +    do_init_boottests();
>> +
>>       /* Create initial domain 0. */
>>       if ( !is_dom0less_mode() )
>>           create_dom0();
>> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
>> index 1806c47a08..97d8b19cf4 100644
>> --- a/xen/arch/arm/smpboot.c
>> +++ b/xen/arch/arm/smpboot.c
>> @@ -28,6 +28,7 @@
>>   #include <asm/gic.h>
>>   #include <asm/procinfo.h>
>>   #include <asm/psci.h>
>> +#include <asm/setup.h>
>
> Style: I think this wants to go after asm/tee/tee.h (acpi.h seems to 
> be misplaced).

fixed.

- Ayan


