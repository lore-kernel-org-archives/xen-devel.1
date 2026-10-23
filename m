Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C34606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 06:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Rp4K+Oh3
Received: from list by lists.xenproject.org with outflank-mailman.1458949.1671023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK8yr-0004Yp-M1; Fri, 23 Oct 2026 06:42:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458949.1671023; Fri, 23 Oct 2026 06:42:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK8yr-0004Ye-Hs; Fri, 23 Oct 2026 06:42:21 +0000
Received: by outflank-mailman (input) for mailman id 1458949;
 Fri, 23 Oct 2026 06:42:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xK8yq-0004YY-2s
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 06:42:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xK8yo-00Bas8-8z
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 08:42:18 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6adb01b7-8faa-0a2a0a5109dd-0a2a4504aa04-36
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 08:42:17 +0200
Received: from [52.101.193.51]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6adb01c7-b57f-0a2a45040019-3465c1331b23-4
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 08:42:17 +0200
Received: from BN9PR03CA0111.namprd03.prod.outlook.com (2603:10b6:408:fd::26)
 by SJ2PR12MB9240.namprd12.prod.outlook.com (2603:10b6:a03:563::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Fri, 23 Oct
 2026 06:42:11 +0000
Received: from BN5PEPF00046989.namprd02.prod.outlook.com
 (2603:10b6:408:fd:cafe::5c) by BN9PR03CA0111.outlook.office365.com
 (2603:10b6:408:fd::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 23
 Oct 2026 06:42:11 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN5PEPF00046989.mail.protection.outlook.com (10.167.245.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 06:42:11 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 23 Oct
 2026 01:42:11 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 23 Oct
 2026 01:42:10 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 23 Oct 2026 01:42:09 -0500
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
 b=Zt/Gc3VJoEYY6LTtxg/98zPUqOvLSy2R3HrB3AdaQXNI35zDy5jvukuids5+SygssAGNoKSRgkXyi5ZquiKsV6HBCq96Hn//0ZQbSxP+jT1Kefxp+8jBj1WSfeMcFjSy1l4i/snbTVTw1KnvmyWkbaCQhLkkvUtLPg/g08p5kPWvO9sctWodN3hY1BymmVikOphrSs/81cztkB7jQl23gMX4pRYY6husaySEGYuHWqj8Nsr1xZpq0tCavtxLOSpQs+gUdlQo7Zgfsa8LzKqmQZg9839CbK2z8pNRSrmhQCwpfhnhHR+Q9YZJ9YRFTcVhBCPGJAsopZlGjpfLCp8ZCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5b+zrEmH1CSPIlxb1L1IesYcivOifJwEYUWzV0eeB90=;
 b=HYf8dJP77R+1yBwBE70Q2KcZHS07ZX7/DkO3o+w+7bHtcTuACY41xXbM3laiO5ldlCPUHH0RqK+Pko2//fiXRst8CKJxvrCcl63BdeJ53w7pqvKh/K+cgABRE7EUJKXEgWBlw4CRxtb39cbIY2dUUKCYtx4jvkDhh5KQ1nOH4O2mkG4woDk7yOUoYgG0JvkCNy7to1jaFuF1F0rNcWF06LqT1SP7fPs4Cz6WChhooN2PCXBrp4U0gliY574tfjn5r9eb/n84tw9Di+0HMbYn3SdD77/02ecZY9Zgsdp7IYT3Y4U7D1EazextIqi1gHA6oW+uG0u7qGuEH5csngDRHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5b+zrEmH1CSPIlxb1L1IesYcivOifJwEYUWzV0eeB90=;
 b=Rp4K+Oh3mcuaqdj9Dhu3wPfKz0X8JWdQTRwLRVta7Uyf1hySolsZjRRPqiymmrxDt9w5gggM7VyjM3amzwlz4gdda/Gb09jGFR7O4WFi7Bl9XiDoO+GNUbOJFueHIXNhgIpNXmmSqkDfp2VndXr4wX6DYg2bJ4BRNz+EuukwqFw=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <8e4131b5-18e7-484a-bc4f-f9e6f279606e@amd.com>
Date: Fri, 23 Oct 2026 08:42:04 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: psci: Do not keep a rejected PSCI version in
 psci_ver
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20261021132640.599126-1-ayan.kumar.halder@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20261021132640.599126-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF00046989:EE_|SJ2PR12MB9240:EE_
X-MS-Office365-Filtering-Correlation-Id: 43cd7009-8267-4706-6ffe-08df30d0c445
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|261021123027099003|261022105027099003|56012099006|11063799006|261009223027099003|18002099003|22082099003|10067099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	GhVWzE3deQ05qQ47QTXlySKvx7Sn6L1Vup5tf92zl4RhyWlQ1x9qG7KfHC0WJPhQINQwEldTx2m3ySM5elDh5PHy5FBKV1uu2CFpAWF5ID2CIoh8BksWxS2nhEsQ7xrV1IwxSAqZbvaAVk+c+CBRHTzt+52xhJI/a1XHaPIajrgPQwY0/wkShDWAdmAdKztFjHp4pXziCa5GkbYQ5EClQ6lOnEex8odg6b5lKzx62jbtLSy173eWIKzQW2WH1A9S80lvTORv4CP3LbFZ+7qITCN7+r8FnpECO7ZIjlKmP4d75ZB9XJV7ElcUzO9rNaIUy+Kpw1uv4KM1JNVerHehdW6czhIVBeIGJPsGPAKx8hZ+dk3/ekxKmEaeTMin6tsU2WBPFvvLjKaOyCiMgNFLVs+GphK0yjCf34SC+kLv99LULJfjMiXvNf1fHee6OUltwvQTgL8Z3bPjaL3rDciIzuEqrHlqj2lXv21/D12WyGADo6JLr9CTlRLdOw4RTtKp3aC/QUCoud6ookKXBaBCH0BsHqSDZiHNerg3AgW/iehnUqSyuITnkK0FMf13KZSzNIWs6WlzHD1AHLBU1gCBaH8FExqIFd77A/9Ckt4pNaiyKdaPCluHdpj3WdyVKtEtgWOYM/4tMyUFbg6v2jI5bB4gnr7ao4QwkC0hCIkwFDh0K5B35gJwSC3y/bSXiILf9KiMf7w3Ogcucp59PNyQ4Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(261021123027099003)(261022105027099003)(56012099006)(11063799006)(261009223027099003)(18002099003)(22082099003)(10067099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GKhKyKCqKbjj8tTjH6b0zCAtY0cny9gI4Ct9PesjrwX0XkTHG9SiDqNjclUmBPA8GLw5P+GtdXf3FtNaOqHJEGslywqs8Lt0KR8y/Ny+AfoGq2ytgrw6oUVdrckmeinnTONElQtbSIg541BxUihZ7Ik9oq59WLjQRgllNUZxO+Y+/Vmabv2XADUCso9lGhYwJbqg1qdN2yzBuKLUUUT0CQUhg3JlX78TPILqansrxQzkogWLhwhWDFFhZK6iyFFfQj59MU1Uu1DEbP0M4XjpDFTzS1K0AQerF81dyPAl730KNulk0t12JwR4HmL8BjRa7dqlFjqUjPeEWhBbs/DHRCY/QzRRHtMpldYd0SneL7VxmBrwxjZClvHOJt3WkjGSZX7CLX/nb2ny78wf1GpIfjmP8byUIezxa6snaeE9YL3lDr3TPyL0WAQhZKkte5YF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 06:42:11.3691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43cd7009-8267-4706-6ffe-08df30d0c445
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN5PEPF00046989.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9240
X-purgate-ID: tlsNG-ebf023/1792737737-C12DCB50-F3A059E5/0/0
X-purgate-type: clean
X-purgate-size: 3496
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 21-Oct-26 15:26, Ayan Kumar Halder wrote:
> psci_init_0_2() stores the value returned by PSCI_VERSION in the global
> psci_ver before checking that Xen supports it. When the firmware reports
> a version other than 0.2 or 1.x, the function prints "Unrecognized PSCI
> version" and returns -EOPNOTSUPP, but psci_ver keeps the rejected value
> and psci_cpu_on_nr stays 0.
> 
> psci_init() then tries the PSCI 0.1 fallback, which overwrites psci_ver
> on success. When the fallback fails as well (the /psci node is not
> compatible with "arm,psci", it has no "cpu_on" property, or Xen boots
> with ACPI), psci_init() returns an error that smp_init_cpus() ignores,
> and psci_ver still holds the rejected version. All the users of
> psci_ver then consider PSCI as available:
>  - on arm64, smp_psci_init() installs call_psci_cpu_on() as the method
>    to bring up the secondary CPUs;
>  - on arm32, platform_cpu_up() calls call_psci_cpu_on() instead of the
>    platform specific cpu_up() callback;
>  - call_psci_cpu_off(), call_psci_system_off() and
>    call_psci_system_reset() issue their PSCI calls.
> 
> As a result, Xen brings up each secondary CPU with an SMC using function
> ID 0. An SMCCC compliant firmware refuses it, and Xen reports "Failed to
> bring up CPU<n> (error -1)" for each secondary CPU.
> 
> Only set psci_ver once the version has been accepted, so that a rejected
> version leaves psci_ver at 0 and Xen behaves as if PSCI was not
> available. In the case above, Xen no longer issues any other PSCI call:
> on arm64 the secondary CPUs using the "psci" enable-method are rejected
> by smp_psci_init() and Xen boots on the boot CPU only; on arm32
> platform_cpu_up() uses the platform cpu_up() callback, if any. CPU_OFF,
> SYSTEM_OFF and SYSTEM_RESET are not issued either, as when the PSCI 0.1
> fallback is used.
> 
> Fixes: 4d3d72c01467 ("xen/arm: Initial support for PSCI-0.2")
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>  xen/arch/arm/psci.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
> index 634d0d7467..a720cf8d41 100644
> --- a/xen/arch/arm/psci.c
> +++ b/xen/arch/arm/psci.c
> @@ -169,6 +169,7 @@ static int __init psci_init_0_2(void)
>      };
>      int ret;
>      struct arm_smccc_res res;
> +    uint32_t ver;
>  
>      if ( acpi_disabled )
>      {
> @@ -191,16 +192,17 @@ static int __init psci_init_0_2(void)
>      }
>  
>      res = arm_smccc_smc(PSCI_0_2_FN32_PSCI_VERSION);
> -    psci_ver = PSCI_RET(res);
> +    ver = PSCI_RET(res);
>  
>      /* For the moment, we only support PSCI 0.2 and PSCI 1.x */
> -    if ( psci_ver != PSCI_VERSION(0, 2) && PSCI_VERSION_MAJOR(psci_ver) != 1 )
> +    if ( ver != PSCI_VERSION(0, 2) && PSCI_VERSION_MAJOR(ver) != 1 )
>      {
>          printk("Error: Unrecognized PSCI version %u.%u\n",
> -               PSCI_VERSION_MAJOR(psci_ver), PSCI_VERSION_MINOR(psci_ver));
> +               PSCI_VERSION_MAJOR(ver), PSCI_VERSION_MINOR(ver));
>          return -EOPNOTSUPP;
>      }
>  
> +    psci_ver = ver;
>      psci_cpu_on_nr = PSCI_0_2_FN_NATIVE(CPU_ON);
>  
>      return 0;
The patch would be simpler if you just set psci_ver = 0 right before
returning -EOPNOTSUPP. No need for the new local variable then. If you agree, I
can change on commit. With that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


