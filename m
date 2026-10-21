Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D14606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2026 13:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ORYYAfwL
Received: from list by lists.xenproject.org with outflank-mailman.1457117.1670026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJW9t-00068g-Kg; Wed, 21 Oct 2026 13:15:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457117.1670026; Wed, 21 Oct 2026 13:15:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJW9t-00068Z-Gt; Wed, 21 Oct 2026 13:15:09 +0000
Received: by outflank-mailman (input) for mailman id 1457117;
 Wed, 21 Oct 2026 13:15:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xJW9r-00068R-7h
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 13:15:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJW9q-00GhSu-Cp
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 15:15:06 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ad8bacc-e002-0a2a0a5209dd-0a2a4506dea4-48
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 15:15:05 +0200
Received: from [40.107.209.70]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ad8bad7-195a-0a2a45060019-286bd146db11-3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 15:15:04 +0200
Received: from SJ0PR05CA0055.namprd05.prod.outlook.com (2603:10b6:a03:33f::30)
 by DM6PR12MB4265.namprd12.prod.outlook.com (2603:10b6:5:211::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 13:14:57 +0000
Received: from CO1PEPF00018869.namprd03.prod.outlook.com
 (2603:10b6:a03:33f:cafe::49) by SJ0PR05CA0055.outlook.office365.com
 (2603:10b6:a03:33f::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15 via Frontend Transport; Wed,
 21 Oct 2026 13:14:57 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00018869.mail.protection.outlook.com (10.167.249.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Wed, 21 Oct 2026 13:14:56 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 21 Oct
 2026 08:14:54 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 21 Oct
 2026 08:14:53 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 21 Oct 2026 08:14:50 -0500
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dBM/omIy8G+wPF+FVyn8uZSZN45RnR5kl78ybfsy//uwf21btWWkKqKcW4HxDDuv9jr3h+j6pTAmp3yxi5S8B1ERqIv0S5STcx9SNHzmX9K6b8H9Au+euWgKPZLHMCPLDTquuTg+IoSdy9cEpWxJU+DsQUvbrj0NsUr0uDj8YaXATl+YO0TZBVbslgM4TSmxiSXdxLSaOwcB3fMKIPm7SvypFzVvltDFzVa1xPiy1Q1l2Genm5WBVn1u16iIKxtINsSdzPuMUNiST1AjtnfxZv7PFwFL/oA/G6I68pCzd24f8cIYYH131c9sh1O1jdiwrbiCNoaEFknpDqIKdTGIHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VsRJxPyWjlAnynPvNNxxCA/5BkznntMByV7OjIfvvtA=;
 b=eBx4oWfxq6qgW+H7J9RPbtnp3oDGltoKjMBlwhY4Nb0GsGsMexDuTqq3nnQ+zvBQtNZd1vJBpnskjkwejxxFdtIPj7HMnw2L1lxIlkujyoPW7K3bsmgrgNqdnVdFJXlCxwTthhkyqprnOkz4x/n09tqqa6hq0nb2/rskegq5x5rVcgEOs30AusWz/aZcv47m5VjZL8AjrDnwpwv6JnjK193TtLRSrxt3/4mwIx3/ZKtTLwMBqC8prtMpBitoHs2lLxdJRL4PJC4xj9fS45xrx9fMuWfRovsgGqRzo5pOYVVmBHorve2TDP/1QUPbLQ/ZBPMaDzvHP+Jjk+Kk0CD3PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=valinux.co.jp smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VsRJxPyWjlAnynPvNNxxCA/5BkznntMByV7OjIfvvtA=;
 b=ORYYAfwLbfwnYWf5kuLYSo3A0AYaqqQ0AzTSLe50hqTVnZXhPwjhser9TrYAAkacxKO7uhWq0gN1fq4ieeiErKy780fDCWuRoX0U7iZH8tMH+4DfE+muy4BntVQlunpEJI8gIezslC8Vj0YjYrIpg/24yBOL0twiaAkiVfjG90M=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <0d758d59-1ac3-4833-aae6-8c181d5ec1e8@amd.com>
Date: Wed, 21 Oct 2026 15:14:50 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/4] xen/sched: Link CPU topology to scheduler
To: Hirokazu Takahashi <taka@valinux.co.jp>, <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <Mykyta_Poturai@epam.com>, Juergen Gross
	<jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, "Oleksii
 Kurochko" <oleksii.kurochko@gmail.com>, Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <gwd@xenproject.org>
References: <20261019015749.48492-1-taka@valinux.co.jp>
 <20261019015749.48492-3-taka@valinux.co.jp>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20261019015749.48492-3-taka@valinux.co.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00018869:EE_|DM6PR12MB4265:EE_
X-MS-Office365-Filtering-Correlation-Id: 5588ce9a-4b70-4abc-e382-08df2f754d9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|7416014|23010399003|376014|82310400026|56012099006|4143699003|11063799006|261009223027099003|22082099003|18002099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	zgke9+uXsESTuK+b+IjWrDDg8CBEokNSUUwbcdJY9ynLcrSztD32ohAYPXsPWIDF3MgYOO5dd2Sr4wiWjb/8yP7r8ptc/tjSY70Ie4hMw30GlKsUbjBiu9lwioeGfQnFGRbVORR9sOLmtW0eGomP06O9ImOUvY/j0/jGcw579r2N/zcNDG3br0pNl3qFG6mcQyL+9/UHVFSOpiEmqusQVAZHQNV7MlGODAphCbM61I9lw4SycQEpxfRHfREmhvZixYFZhNIiO3S/R77y1ZgVo51Rf2cWK3WE0Qnfj4OMhfd3oyBR/IlBcsOgaMrH4NAgHPQqWtF2g0DRU2NgDHW8x701F1WI7HDaEzLfg105eNEt/XTFIhhmGDhtgQU9+ihNWg+JA6PUJRlMUwqQ1LjuqQpqTwyhKuvSzgJldbOBvUDI+mhO92E15QofMm0mNHfgPJExxU6fya6mmb35ZB9z9LgtjvpURRX2iRBduYH1HGX76A12wR2iGta56aDDoRvuILZz3ilM84Ps637gMwmHt78uc5LwuZ+a10nswDs2UgKumFwJhnEu0/3oq79xPunXv3ln5tGQM23W2XC027ju/EtHyuLLi4LRUlMOvJORLL8U7vWIjOQMbNWIDcjs3VYqlqMaUMKWl7pDyAegkRrRmEh1KKtpB4xoPQenm0GCka8CiP9nqebLICopLci8VST2nNmtq03aXBnVF7aZwRbiQw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(7416014)(23010399003)(376014)(82310400026)(56012099006)(4143699003)(11063799006)(261009223027099003)(22082099003)(18002099003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UaSkD4HOnxF1TEXJujx5ntav6ra1s/z6uC2NsJvNu44ChEPRbD8kUVOZYPgPW2ojA30x/fJGbnB9EkN04dP6UFoBjik5NkYv5JVu6zfrfANdhKU41DzPFE41yfjFf2yvJjRub0V/+4VQBVFYItK3xtOJNW454QTcMPjnqbXvAXgAhBSrELBFuLzKasKCYoiG16wydEeF3piUbvhzh5Hzo5asCKatWjsCPJHhxAP64kx3wSI62VzMJwcwBWQ8KGL4i6t8/sz+e5jpi1RxZrJwBe67420g/6CKPE6TglvH3XwADYBTJ+GKAp1xiWBKSYJRLw3iiSs1Fnf4Gp6M0eAQnEEB+tjGWwisfaHztxfoprfd1KHhY6G7gkGLzxKMBOYS4tTp9qzIEiE0dbnI0QaFhZDOWsZoko6sySwyWkW3e/Y+V9nfv7NTRgEDwCJ94IsW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 13:14:56.9081
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5588ce9a-4b70-4abc-e382-08df2f754d9f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00018869.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4265
X-purgate-ID: tlsNG-16d1c6/1792588505-FCE0677B-A262FC2D/10/78276251493
X-purgate-type: spam
X-purgate-size: 9298
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 19-Oct-26 03:57, Hirokazu Takahashi wrote:
> Make CPU topology information available to the Xen scheduler.
> Additionally, ensure that this topology information is displayed
> when executing the 'xl info -n' command.
> 
> Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Juergen Gross <jgross@suse.com> # scheduler part
> ---
>  xen/arch/arm/include/asm/processor.h   |  4 --
>  xen/arch/arm/smpboot.c                 |  8 +---
>  xen/arch/ppc/include/asm/processor.h   |  4 --
>  xen/arch/riscv/include/asm/processor.h |  4 --
>  xen/common/device-tree/cpu-topology.c  | 65 ++++++++++++++++++++++++++
>  xen/common/sched/credit2.c             |  6 +++
>  xen/common/sysctl.c                    |  1 +
>  xen/drivers/acpi/topology.c            |  3 ++
>  xen/include/xen/cpu-topology.h         | 41 +++++++++++++++-
>  9 files changed, 115 insertions(+), 21 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
> index 8ee8f88fb4..fe4125cd75 100644
> --- a/xen/arch/arm/include/asm/processor.h
> +++ b/xen/arch/arm/include/asm/processor.h
> @@ -614,10 +614,6 @@ void show_stack(const struct cpu_user_regs *regs);
>  
>  #define cpu_relax() barrier() /* Could yield? */
>  
> -/* All a bit UP for the moment */
> -#define cpu_to_core(_cpu)   (0)
> -#define cpu_to_socket(_cpu) (0)
> -
>  struct vcpu;
>  void vcpu_regs_hyp_to_user(const struct vcpu *vcpu,
>                             struct vcpu_guest_core_regs *regs);
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index d34396f9b1..cf4858eb37 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -93,13 +93,7 @@ static int setup_cpu_sibling_map(int cpu)
>           !zalloc_cpumask_var(&per_cpu(cpu_core_mask, cpu)) )
>          return -ENOMEM;
>  
> -    /*
> -     * Currently we assume there is no multithread and NUMA, so
> -     * a CPU is a sibling with itself, and the all possible CPUs
> -     * are supposed to belong to the same socket (NUMA node).
> -     */
> -    cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
> -    cpumask_copy(per_cpu(cpu_core_mask, cpu), &cpu_possible_map);
> +    init_cpu_sibling_map(cpu);
The comment above the cpu_sibling_mask definition is now stale.

>  
>      return 0;
>  }
> diff --git a/xen/arch/ppc/include/asm/processor.h b/xen/arch/ppc/include/asm/processor.h
> index 242346cab9..1bf6f6c66c 100644
> --- a/xen/arch/ppc/include/asm/processor.h
> +++ b/xen/arch/ppc/include/asm/processor.h
> @@ -141,10 +141,6 @@
>  /* Macro to adjust thread priority for hardware multithreading */
>  #define HMT_very_low()  asm volatile ( "or %r31, %r31, %r31" )
>  
> -/* TODO: This isn't correct */
> -#define cpu_to_core(cpu)   (0)
> -#define cpu_to_socket(cpu) (0)
> -
>  /*
>   * User-accessible registers: most of these need to be saved/restored
>   * for every nested Xen invocation.
> diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
> index b1745c1071..c5340a924f 100644
> --- a/xen/arch/riscv/include/asm/processor.h
> +++ b/xen/arch/riscv/include/asm/processor.h
> @@ -52,10 +52,6 @@ struct cpu_user_regs
>      unsigned long hstatus;
>  };
>  
> -/* TODO: need to implement */
> -#define cpu_to_core(cpu)   0
> -#define cpu_to_socket(cpu) 0
> -
>  static inline void cpu_relax(void)
>  {
>  #ifdef __riscv_zihintpause
> diff --git a/xen/common/device-tree/cpu-topology.c b/xen/common/device-tree/cpu-topology.c
> index bfcf153cc4..b7b1acc73d 100644
> --- a/xen/common/device-tree/cpu-topology.c
> +++ b/xen/common/device-tree/cpu-topology.c
> @@ -344,6 +344,67 @@ static int __init parse_dt_topology(void)
>      return parse_package(map);
>  }
>  
> +static void __init setup_cpu_topology_ids(void)
> +{
> +    unsigned int cpu;
> +    unsigned int next_core_id = 0;
> +    unsigned int next_cluster_id = 0;
> +    unsigned int next_socket_id = 0;
> +
> +    for_each_possible_cpu(cpu)
> +    {
> +        unsigned int first_cpu;
> +        struct cpu_topology *topo = &cpu_topology[cpu];
> +
> +        first_cpu = cpumask_first(topo->thread_sibling);
> +        ASSERT(first_cpu < nr_cpu_ids);
> +
> +        if ( first_cpu == cpu )
> +        {
> +            topo->phys_core_id = next_core_id;
> +            next_core_id++;
> +        }
> +        else
> +        {
> +            topo->phys_core_id = cpu_topology[first_cpu].phys_core_id;
> +        }
No braces for single line statements.

> +
> +        first_cpu = cpumask_first(topo->cluster_sibling);
> +        if ( first_cpu >= nr_cpu_ids )
> +        {
> +            /* Clustering is not supported */
> +            topo->phys_cluster_id = 0;
> +        }
> +        else
> +        {
> +            if ( first_cpu == cpu )
> +            {
> +                topo->phys_cluster_id = next_cluster_id;
> +                next_cluster_id++;
> +            }
> +            else
> +            {
> +                topo->phys_cluster_id = cpu_topology[first_cpu].phys_cluster_id;
> +            }
No braces for single line statements.

> +        }
> +
> +        first_cpu = cpumask_first(topo->core_sibling);
> +        ASSERT(first_cpu < nr_cpu_ids);
> +
> +        if ( first_cpu == cpu )
> +        {
> +            topo->phys_socket_id = next_socket_id;
> +            next_socket_id++;
> +        }
> +        else
> +        {
> +            topo->phys_socket_id = cpu_topology[first_cpu].phys_socket_id;
> +        }
No braces for single line statements.

> +
> +        topo->num_siblings = cpumask_weight(topo->thread_sibling);
> +    }
> +}
> +
>  int __init dt_init_cpu_topology(void)
>  {
>      unsigned int cpu;
> @@ -353,9 +414,13 @@ int __init dt_init_cpu_topology(void)
>  
>      ret = parse_dt_topology();
>      if ( ret == 0 )
> +    {
>          for_each_possible_cpu(cpu)
>              setup_siblings_masks(cpu);
>  
> +        setup_cpu_topology_ids();
> +    }
> +
>      return ret;
>  }
>  
> diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
> index c32e753bb4..335cadb8b1 100644
> --- a/xen/common/sched/credit2.c
> +++ b/xen/common/sched/credit2.c
> @@ -9,6 +9,7 @@
>   * Based on an earlier verson by Emmanuel Ackaouy.
>   */
>  
> +#include <xen/cpu-topology.h>
>  #include <xen/errno.h>
>  #include <xen/init.h>
>  #include <xen/lib.h>
> @@ -35,6 +36,11 @@
>   */
>  static unsigned int cpu_nr_siblings(unsigned int cpu)
>  {
> +#ifdef CONFIG_GENERIC_CPU_TOPOLOGY
> +    if ( cpu_topology )
> +        return cpu_topology[cpu].num_siblings;
> +#endif
> +
>  #ifdef CONFIG_X86
>      return cpu_data[cpu].x86_num_siblings;
>  #else
> diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
> index 8fb5ff0af3..6f1839b359 100644
> --- a/xen/common/sysctl.c
> +++ b/xen/common/sysctl.c
> @@ -28,6 +28,7 @@
>  #include <xen/pmstat.h>
>  #include <xen/livepatch.h>
>  #include <xen/coverage.h>
> +#include <xen/cpu-topology.h>
>  
>  long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>  {
> diff --git a/xen/drivers/acpi/topology.c b/xen/drivers/acpi/topology.c
> index f9836447b2..32f5b97c3e 100644
> --- a/xen/drivers/acpi/topology.c
> +++ b/xen/drivers/acpi/topology.c
> @@ -24,6 +24,9 @@ int __init acpi_init_cpu_topology(void)
>      {
>          struct cpu_topology *topo = &cpu_topology[cpu];
>  
> +        topo->phys_core_id = cpu;
> +        topo->num_siblings = 1;
> +
>          cpumask_set_cpu(cpu, topo->thread_sibling);
>          cpumask_copy(topo->core_sibling, &cpu_possible_map);
>          cpumask_copy(topo->cluster_sibling, &cpu_possible_map);
> diff --git a/xen/include/xen/cpu-topology.h b/xen/include/xen/cpu-topology.h
> index 27b9bd443e..52ee93d4d0 100644
> --- a/xen/include/xen/cpu-topology.h
> +++ b/xen/include/xen/cpu-topology.h
> @@ -3,23 +3,60 @@
>  #ifndef XEN_CPU_TOPOLOGY_H
>  #define XEN_CPU_TOPOLOGY_H
>  
> -#ifdef CONFIG_GENERIC_CPU_TOPOLOGY
> -
>  #include <xen/cpumask.h>
> +#include <xen/percpu.h>
> +
> +#include <asm/processor.h>
> +#include <asm/smp.h>
>  
>  struct cpu_topology {
>      cpumask_var_t thread_sibling;
>      cpumask_var_t core_sibling;
>      cpumask_var_t cluster_sibling;
> +    unsigned int phys_core_id;
> +    unsigned int phys_cluster_id;
phys_cluster_id and cluster_sibling are only used to compute each other. Are
they really needed?

> +    unsigned int phys_socket_id;
> +    unsigned int num_siblings;
>  };
>  
>  extern struct cpu_topology *cpu_topology;
> +
> +static inline void init_cpu_sibling_map(unsigned int cpu)
> +{
> +    if ( IS_ENABLED(CONFIG_GENERIC_CPU_TOPOLOGY) && cpu_topology )
> +    {
> +        cpumask_copy(per_cpu(cpu_sibling_mask, cpu),
> +                     cpu_topology[cpu].thread_sibling);
> +        cpumask_copy(per_cpu(cpu_core_mask, cpu),
> +                     cpu_topology[cpu].core_sibling);
cpu_topology[] is built from all CPUs, so a CPU that then fails to boot
stays in its siblings masks. I think a CPU should be added to these masks only
once it is online.

~Michal


