Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B0AC982C4
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 14:38:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1423239.1648467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6qmQ-0003Pu-IX; Wed, 16 Sep 2026 14:38:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1423239.1648467; Wed, 16 Sep 2026 14:38:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6qmQ-0003Pn-FM; Wed, 16 Sep 2026 14:38:34 +0000
Received: by outflank-mailman (input) for mailman id 1423239;
 Wed, 16 Sep 2026 14:38:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1x6qmP-0003Pd-9O
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 14:38:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6qmO-005BHt-MJ
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 16:38:32 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6aaaa9df-8faa-0a2a0a5109dd-0a2a4503d58a-36
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 16:38:32 +0200
Received: from [40.107.209.39]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6aaaa9e6-fae8-0a2a45030019-286bd127ec3b-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 16:38:32 +0200
Received: from SJ0PR13CA0125.namprd13.prod.outlook.com (2603:10b6:a03:2c6::10)
 by SA0PR12MB4414.namprd12.prod.outlook.com (2603:10b6:806:9a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 14:38:25 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::d2) by SJ0PR13CA0125.outlook.office365.com
 (2603:10b6:a03:2c6::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.7 via Frontend Transport; Wed, 16
 Sep 2026 14:38:25 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Wed, 16 Sep 2026 14:38:24 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 16 Sep
 2026 09:38:21 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 16 Sep
 2026 09:38:21 -0500
Received: from [10.59.21.158] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Wed, 16 Sep 2026 09:38:17 -0500
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
 b=aIulBRCVpxYjEGIoVnTriNNJ37MVs3zqy12fzDuk/jec3u9nI9lmLBfCRO3awe2CV/N4WtIhPQ0ye0YP36or7PO8u8EQqRrlK/b48HoTDe0iKcnaVGduCiqZ8bGuATv6a2Q9XGjGRWsrMZRtF1+bmhQEeEz+4fVvaV8Bj1otTsUtHrO131IwZxfjrYDM+6rISoe2mPokLBCeTee3tDyzVU9M92oWGwfwDzZZcbd2ANdoZ9JTFvD8bfG9MGwTxqm3hnTqyKRzCmNzio2q5IJpFD3mvU0ai55G2nqNph1d5NrQwr86VrnpEjff635s+EWypPQJDGa4rVBCMMF/zfyvCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c1VYw1JVMv0jGKjEWxwkh/UE1+S6crJIjV50/HX6X7M=;
 b=oi2f1frZEFjtokASrjI7wRKHpOa9BtCIe8cCbL/r/StUJosveyl7azGEy52qxeZO1kasYaymtct2I+5+nG2TchH3/HeMd36bz4LJ5gnWvtM87i4Pn/SRdi2LsWy1iQDgcCJ/h/7rnGFoBKeLm5AvNijSGxykhjX2Sgbvh/W40SmCOwlpppu7RhG9TarUDG/MSAnRGzYdthTM42TFKqsyrYAZAgK375sVIrR6ZDsVFMNtg4F90bHTge1w3hEBeI8wdffcW/4NdXfES7E8WIy9miRqnV5O4ewrxf/i+zl9x6lXpqJFdiMow/mFRMN7Jib859zGFnJJjiYe9jDs9KoGyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c1VYw1JVMv0jGKjEWxwkh/UE1+S6crJIjV50/HX6X7M=;
 b=OO5ZN++HmtG0NFP1hIeUVheEvWmarNpiRNh4KsODX3m3EPEwoJPly2i3Hkc1mICpEQZFekWJHFwC8G4EOp9ziXXMiblhyQkuXjY8e6/FnEe2hRPdpVzIu+xF0SEn+miBoefc7D/0U5nDOv0XepWrgxzFnGj7S4fciggMOWUPr+o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <8f347150-0634-4e02-b000-d3f2ed0d6090@amd.com>
Date: Wed, 16 Sep 2026 16:38:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] xen/arm: report clock_frequency via sysctl
 physinfo, not createdomain
To: Julian Vetter <julian.vetter@vates.tech>, <xen-devel@lists.xenproject.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, Andrii Sultanov
	<andriy.sultanov@vates.tech>, Guillaume Thouvenin
	<guillaume.thouvenin@vates.tech>, =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Teddy Astie
	<teddy.astie@vates.tech>
References: <1789130592.8631fc262581453bbf619ec5b2062170.1a0907e5286000c4f3@vates.tech>
 <1789130864.8631fc262581453bbf619ec5b2062170.1a0908275e9000c4f3@vates.tech>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <1789130864.8631fc262581453bbf619ec5b2062170.1a0908275e9000c4f3@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|SA0PR12MB4414:EE_
X-MS-Office365-Filtering-Correlation-Id: f407d348-2dc8-412a-c70f-08df14002a28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|7416014|376014|1800799024|82310400026|4143699003|56012099006|5023799004|10067099003|11063799006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	4+TgrCwr01+ouWdu/qswmlqzPrvnA0EXDbW/PxtnqxRaWM374C15jfeRA4mUXdWx3lqd53YIj4G0/OUmvzNdbC9fS348cYbVKB9sOtpQyDjRZngj4GdTCRkHNiIFqZ5eCaEhAd1EBdvk2kuZp0vYNiZRkZtNHdF3N5TLCVvy7YJpAOis6PGzMR0eHtR/e46vuhNbSmIl2I1IUbE5kmeUnUg02ASgvbq3BfTERPqsujVz4Hrp4GBm21Ucrf1t49tuf0+4QUx3QlaFtaSdHiWG0Yws9eUCkI7WAOjRkSKVZuKfqsDp+CLk0Xfbv6zvimAiXDJ9cL340ORJj7gsbL/oKZab2z6aof6HoMVS+RbjEgksIV3KE1JqFNs8/ftsSQvgRm3HmPsh1obU9a4j2DydOyToRJkgyXVH4Vw3HTdBwFvI/52nTsbxwIn5yl3OzMIrhgYSaYPTEDRwt0LtpsP5m8COVvcVeE2D3siK7AYUb6xN0Wah70e9kfyHFru+sm9lFHq+8Uhh7md38MWIsRqJkJ+6WHe3zo+sa/cDnIIsDJdQI8HK2ggJkvlyp7ev23+ddWgOK45oVUcYZRlZrhDjPYotAQV5/QhsDxTIrpKA7RSEV11QMpr3ax4RxfdzKgeq5kIf3EcnI3AgXYi+h5mzJOWYTjQd2yFde1hLfvPY/jcKUlyhgcOGjhcpMISVz6eaufKJw5kv+Roc9dlKiAHM3Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(7416014)(376014)(1800799024)(82310400026)(4143699003)(56012099006)(5023799004)(10067099003)(11063799006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XOunlzLN87a6XwUc1s9tmzMnOiFXJkkUS8DevWjOHsjwGdzbGhLt1ZQBRk1VbUl/kDgj1l7QXh2qC8beXHm7GSyaLlvMbZPxKxLcOBPOzZ8bKjJlAAMVD78RxP4y7a0is7LqeDuT30sYpm68+ifDIUgniK9phsa0DyPNrEQJ8AZSsYiNJz9y0YmumIVMAr7LYnyj3rR+v7UMc47KpwtQ46MZofXJQeGG0uWT6GktugAq7Ud54YlazuXMI5ZKZQEerrJjHRSunInCrW6RBx9Rufs3P9o870QTnW4D5wW2yzzr+LegG7YtxF5qjCqZbPyhzs1aJK+3QeG2c2JYM43gl4lx1G36eSHXU8gVY8SvumMaqBEfcoqwoV/ZPzX0KxuscWCx0f58Gj6oQ6ELa0UsvDy2EVic/Q5zhnEDajG+Z+Qlcm/V3mNKcS46wjEx9Rvc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 14:38:24.8762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f407d348-2dc8-412a-c70f-08df14002a28
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4414
X-purgate-ID: tlsNG-33051d/1789569512-752854E9-ECC4ACE7/0/0
X-purgate-type: clean
X-purgate-size: 3248



On 11-Sep-26 14:47, Julian Vetter wrote:
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
> The DT "clock-frequency" property exists because firmware might leave
> CNTFRQ_EL0 wrong, and since CNTFRQ_EL0 cannot be trapped the only fix is
> to replicate the correct value into the guest DT. To keep that signal, a
> new XEN_SYSCTL_PHYSCAP_ARM_TIMER_DT_FREQ capability bit records whether
> arch_clock_frequency_hz came from the DT property. Then libxl only emits
> a "clock-frequency" property into the guest timer node when that bit is
> set. A guest whose CNTFRQ_EL0 is already correct keeps an unmodified
> timer node, exactly as before.
> 
> Although the CNTFRQ_EL0 register is 64 bits wide, and some current timer
> implementations run at 1GHz, a 32bit value is sufficient to store the
> timer value, because it only mirrors the DT 'clock-frequency' property,
> which the bindings define as a single 32-bit cell.
> 
> In struct xen_sysctl_physinfo the new field just reuses the former pad
> word, so sysctl consumers are unaffected. struct xen_arch_domainconfig
> however loses clock_frequency from its middle, which shrinks the struct
> and shifts every field after it, so bump XEN_DOMCTL_INTERFACE_VERSION.
> 
> The xen_arch_domainconfig parameter passed to domain_vtimer_init() is no
> longer needed, so drop that parameter entirely. libxl now fetches the
> frequency via libxl_get_physinfo() in libxl__arch_domain_save_config()
> instead of reading it back out of the createdomain reply. The OCaml
> xen_arch_domainconfig mirror drops the field too.
> 
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
[...]

> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index 9d3bf11cbd..5d15f572c7 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -335,7 +335,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>  #define XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_VMSA    2
>  
>  struct xen_arch_domainconfig {
> -    /* IN/OUT */
> +    /* IN */
This belong to one of the previous patches.

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

You still need a toolstack maintainer tag.

~Michal


