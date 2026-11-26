Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF8A606A31E
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 09:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=yg8naujG
Received: from list by lists.xenproject.org with outflank-mailman.1503230.1699015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWVj2-0003o7-6z; Thu, 26 Nov 2026 09:25:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1503230.1699015; Thu, 26 Nov 2026 09:25:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWVj2-0003o0-3o; Thu, 26 Nov 2026 09:25:08 +0000
Received: by outflank-mailman (input) for mailman id 1503230;
 Thu, 26 Nov 2026 09:25:07 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xWVj1-0003mp-7P
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 09:25:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWViz-00F4Ca-Eo
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 10:25:05 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6b07faef-2eae-0a2a0a5409dd-0a2a4503c9e8-4
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 10:25:04 +0100
Received: from [40.107.200.5]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6b07faef-fae8-0a2a45030019-286bc805d7dc-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 10:25:04 +0100
Received: from CH2PR04CA0025.namprd04.prod.outlook.com (2603:10b6:610:52::35)
 by PH8PR12MB6724.namprd12.prod.outlook.com (2603:10b6:510:1cf::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 09:23:58 +0000
Received: from CH1PEPF0005BD62.namprd02.prod.outlook.com
 (2603:10b6:610:52:cafe::15) by CH2PR04CA0025.outlook.office365.com
 (2603:10b6:610:52::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 09:23:58 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0005BD62.mail.protection.outlook.com (10.167.244.251) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Thu, 26 Nov 2026 09:23:58 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 03:23:57 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 03:23:57 -0600
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Thu, 26 Nov 2026 03:23:56 -0600
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
 b=MRWXoCHlp58YhMTd6fM1zYP6plkLs5ACkzxwC8Cc9c8/CIPQNmGAC7jz7N17ZihwoG+IEkzPEOzcSQOYs3yLJi3Bx20DrBJo3FdJPV5Du8dKpkXZfVK+jlpXqQl4G0qDCSg75p8EFjhSbtsViXCvNhXI4WU87fgvy6uOecB43WnAHXnyNoO4+3ncGiQt5jg0bYzxeGGUzD8CcA+t89DAnVLYp82b+xJFLsi6Kk40gaNcj3MTWukjuxtRJqS1cY4CUrjkP9w263Z2BQi5gT3wxgwz4eSnhSBcqqfgTNot2HSzQm3xYAHq7pM552wKJC0eFIz/lBDL+IdtkcBIyVQfPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3g3Gp7BxPOcXA7SVg0zjOOfyI1U03rv7zyB3iD6oXE=;
 b=vcAUGD2//QKXgIJcf2vShq3J7yhj+0F96RI4vP7jV7bnKQ7Ul63BocWiGjgj3Pu6Zji5OLEeXnTlSrFF7xZog6Se26yDT9M065KZ8v3zf+J+gSWtOiu2VKbxu23fGTRiBQ9/Qt5fWARQgvbZ6u/UE+v6EK2ZXrBJr8kaMJLmkIinRPIQSFd7uZbWNMNYPMk7GLPQNp4GLhpuIA0z737XvXbf9MazP5Y1v2JgUKyaEiGC3tLI1hT4auWfGebZiv423PwpocvuBzXyyCVYVKBNswvKHVusitwpq4zNni9muOybKCGZEdPwgP4XdqY+hHNaM3bOauXj1bl07SdCQZA4MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=valinux.co.jp smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3g3Gp7BxPOcXA7SVg0zjOOfyI1U03rv7zyB3iD6oXE=;
 b=yg8naujGsalqa4PnbMMqJ2wFA+S0yyGnO9w5VyZWnuKI4QymcYtCs11hsZnN6MbTFz2FKprpqirqSg3CIDtby9isrPw5Bpe2EwwhvLnBungp/4qihb3+HPIi3uihBy+G8kvdkeO8o8XAxp2z4sBanHRUYxukVHL737FS1uNxfdE=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <87b23da3-6418-40d1-9ec8-3b26f6b000b1@amd.com>
Date: Thu, 26 Nov 2026 10:23:55 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/arm: Fix sibling mask setup to only include online
 CPUs
To: Hirokazu Takahashi <taka@valinux.co.jp>, <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>
References: <20261126044340.14779-1-taka@valinux.co.jp>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20261126044340.14779-1-taka@valinux.co.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0005BD62:EE_|PH8PR12MB6724:EE_
X-MS-Office365-Filtering-Correlation-Id: 45563298-893f-49f2-7479-08df4b9efff7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|261022075727099003|261022105027099003|10067099003|56012099006|11063799006|261026140227099003|261026121527099003|261028144727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	gS/aaIVpaZmA/D6YYXSkd7Mf4kJNdVLM67yxUjp4zDvsL1Illxk+n59ykwT8ppiS9NSxloioS2tFf/+xj+a3lmolYO/B/VTA9EQGERD4GGtEFnsfn8flWaf3A6A15jQlIb8gomwm5xIXNH0h2bVxPlqblvVHLB4C3cLBuQsZ1htD1VT6UnGv6apHIheO1J9aBBoaa4oOQfhofSSDBW3c+92GNbvOCxCm4k2sW6HjRbANW8+rg6TuM9tPqVJLOx9VzgmsvVYcsIsjfGz3lkYKPo6cZX1Xn7idEfadXve2pHUDshKqSMNgcqPCXQxRBI2aMvRS/MJNjkXYYl7hlM0KIN0rCQhetnhvpB8vNblxaAwCXc3r49g/V7YyOT+e3crC6cEva7QU6uDKFXPfabqlmIZ7Em9D/ln14uWNXyyjexETw4D65MnT2Jb8aXjoXEyonwCfAECCrsy/pA0F++GMBUTb7XaJhmPXfc3oQr1Ug1KZ8HBfwhOkCFKa/Ak3UNX+unuwagxn/wuigDlLc+ZzRB+DIxnTruw+f9tV5kk3tqbrp0R2j6qUBBqStmM0Ne8ROEEgBiaSR203Po/XOSdBKCwOP1AsC2wELVb0+70bew8rN7PtdCgm9pz+QTqh4I+e3ca494AY1nRI/6nOZRAJCGaXwZ1g2A7ZEs/b2r07NbV1ubrRc9oZj4il0BLLJvZ1o6FxakeGpHAMeCrcgWqGJQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(261022075727099003)(261022105027099003)(10067099003)(56012099006)(11063799006)(261026140227099003)(261026121527099003)(261028144727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FkF8vFeHP9/dr2AdF9GlcmQMoHFAKuu5Xe0EeMgNzePv4fWIf9Mn1O05JGMdjMK6mBx7ecOOTgec42Gul22uisP1ObnBnxLa6Y1Tmo40Arjb9iEUi1JGZrbxY5HM4HszCNSLhvvDziHf7Yz8kGrQ4QWuUdu1nHe7zfaw/Sl6Qlcb5X7oBAQiq6N0Fv80Z1zxnOAVdFat5EDXYwnHQdXb3Dnamm4nVeCY1ZdcJnqckuxtonC2fnnN94xtd6jnk7nOJ61ecxDxqxGbTVZPDDWt7uHr1kP9oMaIL7mN9IdsZf5mWEik9+Nof9etnQaQmbvS1R5PFrG9YxXEvntTIZOGL9NPKEfv9slX+TdioHV37N//KVV/fnsnpOSGV6zUzfsdyIPQqkrfuQB9qbY/6dNc4o4RKggDQlPvVl5JFcIjdxTQwxhirmvQUalTgI52ZaOK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 09:23:58.0651
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45563298-893f-49f2-7479-08df4b9efff7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0005BD62.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6724
X-purgate-ID: tlsNG-33051d/1795685104-77AC44E9-39E78C66/0/0
X-purgate-type: clean
X-purgate-size: 3413
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 26-Nov-26 05:43, Hirokazu Takahashi wrote:
> Populate the CPU sibling map only with CPUs that are brought
> online. Currently, all CPUs in cpu_possible_map are added,
> which leaves CPUs that failed to boot in the sibling masks and
> may lead the scheduler to make incorrect decisions.
Please mention the removal part as well which you added in this revision.

> 
> Fixes: 701190abb3d5 ("xen/arm: Set correct per-cpu cpu_core_mask")
> Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
> ---
> Changes in v3:
> - Remove the CPU from sibling maps when it goes down, introducing
>   remove_siblinginfo() to match x86 Xen.
> - Change the cpu parameter type of set_cpu_sibling_map() to
>   'unsigned int' to align with x86 Xen. Also use 'unsigned int'
>   for the cpu parameters of remove_siblinginfo() and
>   remove_cpu_sibling_map().
> - Minor code cleanups.
> 
> Changes in v2:
> - Rename init_cpu_sibling_map() to set_cpu_sibling_map() to align
>   with x86.
> - Use BUG_ON() in set_cpu_sibling_map() to verify that per-cpu
>   cpu_sibling_mask and cpu_core_mask are allocated.
> 
>  xen/arch/arm/smpboot.c | 39 +++++++++++++++++++++++++++++++++++----
>  1 file changed, 35 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index 8c9072f3c1..c4c9f535e3 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -91,18 +91,44 @@ static int setup_cpu_sibling_map(int cpu)
>           !zalloc_cpumask_var(&per_cpu(cpu_core_mask, cpu)) )
>          return -ENOMEM;
>  
> +    return 0;
> +}
> +
> +static void set_cpu_sibling_map(unsigned int cpu)
> +{
> +    unsigned int sibling;
> +
> +    BUG_ON(!per_cpu(cpu_sibling_mask, cpu));
> +    BUG_ON(!per_cpu(cpu_core_mask, cpu));
> +
>      /*
>       * Currently we assume there is no multithread and NUMA, so
> -     * a CPU is a sibling with itself, and the all possible CPUs
> +     * a CPU is a sibling with itself, and the all online CPUs
>       * are supposed to belong to the same socket (NUMA node).
>       */
>      cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
> -    cpumask_copy(per_cpu(cpu_core_mask, cpu), &cpu_possible_map);
> +    cpumask_copy(per_cpu(cpu_core_mask, cpu), &cpu_online_map);
> +    cpumask_set_cpu(cpu, per_cpu(cpu_core_mask, cpu));
>  
> -    return 0;
> +    for_each_online_cpu(sibling)
> +        cpumask_set_cpu(cpu, per_cpu(cpu_core_mask, sibling));
>  }
>  
> -static void remove_cpu_sibling_map(int cpu)
> +static void remove_siblinginfo(unsigned int cpu)
> +{
> +    unsigned int sibling;
> +
> +    for_each_cpu(sibling, per_cpu(cpu_core_mask, cpu))
> +        cpumask_clear_cpu(cpu, per_cpu(cpu_core_mask, sibling));
> +
> +    for_each_cpu(sibling, per_cpu(cpu_sibling_mask, cpu))
> +        cpumask_clear_cpu(cpu, per_cpu(cpu_sibling_mask, sibling));
On ARM a CPU is a sbiling with itself only, so this loop is redundant. Please drop.

> +
> +    cpumask_clear(per_cpu(cpu_sibling_mask, cpu));
> +    cpumask_clear(per_cpu(cpu_core_mask, cpu));
> +}
> +
> +static void remove_cpu_sibling_map(unsigned int cpu)
We try not to add unrelated changes to the patch that is meant to do something
else (here s/int/unsigned int/). If at all, it should be mentioned in the commit
msg.

With that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


