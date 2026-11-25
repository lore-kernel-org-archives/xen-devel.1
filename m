Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49135607DDCD
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 09:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ZmNZ2Ooh
Received: from list by lists.xenproject.org with outflank-mailman.1501945.1697931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xW9Ou-0001lf-Cm; Wed, 25 Nov 2026 09:34:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501945.1697931; Wed, 25 Nov 2026 09:34:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xW9Ou-0001lY-AG; Wed, 25 Nov 2026 09:34:52 +0000
Received: by outflank-mailman (input) for mailman id 1501945;
 Wed, 25 Nov 2026 09:34:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xW9Ot-0001lR-1K
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 09:34:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xW9Os-003PGk-Dh
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 10:34:50 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6b06abb1-8faa-0a2a0a5109dd-0a2a4505bd36-32
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 10:34:50 +0100
Received: from [52.101.46.60]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6b06abb7-4cb1-0a2a45050019-34652e3c2e59-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 10:34:49 +0100
Received: from DS7PR03CA0094.namprd03.prod.outlook.com (2603:10b6:5:3b7::9) by
 SN7PR12MB7449.namprd12.prod.outlook.com (2603:10b6:806:299::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 09:34:42 +0000
Received: from CY7PEPF000000E8.namprd04.prod.outlook.com
 (2603:10b6:5:3b7:cafe::89) by DS7PR03CA0094.outlook.office365.com
 (2603:10b6:5:3b7::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 09:34:42 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY7PEPF000000E8.mail.protection.outlook.com (10.167.247.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 09:34:42 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 03:34:41 -0600
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 25 Nov 2026 03:34:40 -0600
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
 b=BNkhEWwK/I9gEY95oMo+4TRbW3EsrUGIdkOCTvPOFxLBKK0atQsfblQy3owHZfdqetddEUDD+aNmacxM+yfQu1V0RlxQ6Yo/QaZkV42wCzgJPH7xxujdpz2nX2BPHaNzvzEHh4GZja+iGQLbE23TF3QtVfJodf3Iy5Ivb1Aivv5FQsHYk6p/rtY2ai/Esi+BTBdLID+EEB81NIc1pfYkAVLHrCvuad+IoihQgYwp0B5YOyrOnVfyN4ZwzB+02EGl3d6cZFsoYjoqTHwN8b9iP8rlkLO4SEVCIZ2N1MP+B3u55gE1k0tbXnZvFvPwA+si58eTM2caNNVbwlbiowa/lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qS4MMu0ln260crs4iSZr3Squ3TcWHUw1j6Wqr00mcF4=;
 b=BZGMQLfC5u8Zln+c2hFUrwSVny0jKNA/k5MCKNJ33XYBlSt9ImXRzPNtBPZZI/iZr3pPWhfutWBd8mta6aWLziUn8xYJVe+NyuxAA6DqOVkO8eohTUyrdhCpxVqLkn/rKMhUls/D6KPCMxOeqhzIB29F8iT4L4ipTN/BEIc+gaATeY0nXgniHGsI6g2ubStIiPUxlGrL71c0XCD+ReUj82H+wwy/g1mUC1T7NZzcVU85bdopdyDevQFVvNp4W/S4cfEwbrxxEmSRJf1ScS6slQjasQYllQxboUJeE4QNC39aIMZ3Ok55aMt6DSgGpuOUH4nLR0Z2R9vr1K4ECoZZlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=valinux.co.jp smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qS4MMu0ln260crs4iSZr3Squ3TcWHUw1j6Wqr00mcF4=;
 b=ZmNZ2OohSGraNRiAr23PLhy6mQJgvj04EmeHXsEasRBJoabJIgfg6JazdkG7x9LxxtkgHr2uVYNJ4DPpGup2xDz9vZSWJKKNq/dfM8tIYNZlQE2l+0jmDi4GoeO96cJkflQlSsVHiOeMpRKJjnDarvvS3WxYvP59FnY75QaKGgs=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <317e6f9b-ea48-45bf-a42c-a59534bb5179@amd.com>
Date: Wed, 25 Nov 2026 10:34:39 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: Fix sibling mask setup to only include online
 CPUs
To: Hirokazu Takahashi <taka@valinux.co.jp>, <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20261109054515.1690-1-taka@valinux.co.jp>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20261109054515.1690-1-taka@valinux.co.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY7PEPF000000E8:EE_|SN7PR12MB7449:EE_
X-MS-Office365-Filtering-Correlation-Id: 3567e9f7-1ed3-4fe7-e550-08df4ad75575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|10067099003|56012099006|11063799006|260925022911599003|260925021911599003|260925021311599003|261022105027099003|261022075727099003|261028144727099003|261026140227099003|261021123027099003|261021121427099003|261102123227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kM1I3TQPV78Bl0U9hkNY7tDc7oq4P3DiYMsosNStTRHQ1GMo+IjkgMlEZqlZtx6AJ0JEoFhAbFFGyb1xudbX8RQ4zMpgsdQlvZh2bbe0+zwEcXZJk4S8Y2SdTB+Wg/105UxueDuT60KbA6lhPjZ3SbUbhnpgyMP+zpmsfidCjAhppaXfbVP6xRBM3LYYlftUMxKS61vazs8/yn/Xfo6W0vF37dSLgqY8TVki9Cc/ExAYsLHYAevOTwGuREyJ14m6VQ0gsNiVZxYfqo3b8OLdH79X7yeAYDmbZ67uUtvZme4odsrg2Y9N3+N0cZOZVi2Imv0ZN33DLw3L5fiLu8a9YF4+B7lUtJF0ewlns+UBrmrJ5mwd+ZunOCJaPpRmMfryubOQeIenpVIfDuh3dXEMNTpUyVmvoz9t2p5D7UfRxz0GibYDb7ARfKS+7FTnslDYSIlUH0UL8/xiq256dQKSgg1rAl3xwHauOJWUK82aCHiIIp1KmbhL0sP8jX2RQFPJAD1s3ZEDZI6YJ2g4fPUG4MVEz5lvdk356KFctSj1MuGdHd2Y6eiTKw7btwN8Fb+osct38ErWwd6DbPF8jryw5wxBDOAw7oHoePO2skxj1WQFwKjNramfMQe+i+io3CTMosy0vYyPwfYOQ/uaDng1nu7qZj6nv9ta6EoAcWGYZt7D9ea8iwjVW7nNnRMROmjs9t2Ae4scAJugLojunLr6RA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(10067099003)(56012099006)(11063799006)(260925022911599003)(260925021911599003)(260925021311599003)(261022105027099003)(261022075727099003)(261028144727099003)(261026140227099003)(261021123027099003)(261021121427099003)(261102123227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1WhtAzyCColYPvmJDAW+1NgRX/WYMRol2R/Xpxj04C8gtTrbVH7RAMRAcLqQf9nKW5UIIyXliM65boKNB3xfcGD7NfRPkJdoZzdC0Qan/z9frmUkY7eegC2vBIXUsluqnT99CFOryDGJV6pSQ0853HM7vOrDKUC3fkaKi1zdAUM0BgZuFIpk2BracOAljjj4PGkb0ToL1haAAgC+x4BZ4yMpoBmfBiwoZzvwISKzOoTuDBWc+7+h85a1ianxoCGKRxeVIDW6mdxfBmgarIPi4jIzgwSLHkvVnUsiUGXijS0y0gHsvM34Pvpq6Ee01jNJ+pYN9dz8e9syne28wlYfLSSiFHZB5y18DpD6/ZFYVobLZMfURSGB53v2PNu64kqb2e/XiMRsCf/EVOKtZ8Pl6TaZcyxx7INX7q/1tKaJXbdjbjIlc7Wp0BQi7JnQMy6/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 09:34:42.1198
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3567e9f7-1ed3-4fe7-e550-08df4ad75575
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY7PEPF000000E8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7449
X-purgate-ID: tlsNG-c201ff/1795599290-F5CA82A1-B0DDF8BF/0/0
X-purgate-type: clean
X-purgate-size: 2253
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 09-Nov-26 06:45, Hirokazu Takahashi wrote:
> Populate the CPU sibling map only with CPUs that are brought
> online. Currently, all CPUs in cpu_possible_map are added,
> which leaves CPUs that failed to boot in the sibling masks and
> may lead the scheduler to make incorrect decisions.
> 
> Changes in v2:
This should be moved after '---'

> - Rename init_cpu_sibling_map() to set_cpu_sibling_map() to align
>   with x86.
> - Use BUG_ON() in set_cpu_sibling_map() to verify that per-cpu
>   cpu_sibling_mask and cpu_core_mask are allocated.
> 
> Fixes: 701190abb3d5 ("xen/arm: Set correct per-cpu cpu_core_mask")
> Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
> ---
>  xen/arch/arm/smpboot.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index 8c9072f3c1..9237576440 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -91,15 +91,27 @@ static int setup_cpu_sibling_map(int cpu)
>           !zalloc_cpumask_var(&per_cpu(cpu_core_mask, cpu)) )
>          return -ENOMEM;
>  
> +    return 0;
> +}
> +
> +static void set_cpu_sibling_map(int cpu)
unsigned as on x86?

> +{
> +    unsigned int sibling;
> +
> +    BUG_ON (!per_cpu(cpu_sibling_mask, cpu));
there should be no space between BUG_ON and parenthesis

> +    BUG_ON (!per_cpu(cpu_core_mask, cpu));
> +
>      /*
>       * Currently we assume there is no multithread and NUMA, so
>       * a CPU is a sibling with itself, and the all possible CPUs
your change switches to online, so a comment should be updated

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
With your change I think we should remove the cpu that is being removed from its
every sibling's cpu_core_mask on CPU_DEAD.

~Michal

