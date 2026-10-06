Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4FDCA5FED
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 10:23:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441340.1658925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE2KJ-00015t-6V; Tue, 06 Oct 2026 10:23:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441340.1658925; Tue, 06 Oct 2026 10:23:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE2KJ-00015i-32; Tue, 06 Oct 2026 10:23:15 +0000
Received: by outflank-mailman (input) for mailman id 1441340;
 Tue, 06 Oct 2026 10:23:13 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xE2KH-00014V-N4
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 10:23:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xE2KG-00GD4T-JN
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 12:23:12 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ac4cc07-2eae-0a2a0a5409dd-0a2a4507b9c6-32
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 12:23:12 +0200
Received: from [40.107.208.16]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ac4cc0e-b4ea-0a2a45070019-286bd0107d4a-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 12:23:12 +0200
Received: from CH0PR03CA0427.namprd03.prod.outlook.com (2603:10b6:610:10e::30)
 by SA1PR12MB7037.namprd12.prod.outlook.com (2603:10b6:806:24c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 10:23:06 +0000
Received: from BL02EPF00029927.namprd02.prod.outlook.com
 (2603:10b6:610:10e:cafe::5f) by CH0PR03CA0427.outlook.office365.com
 (2603:10b6:610:10e::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue, 6
 Oct 2026 10:23:05 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00029927.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Tue, 6 Oct 2026 10:23:05 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 6 Oct
 2026 05:23:04 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 6 Oct
 2026 05:23:03 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 6 Oct 2026 05:23:02 -0500
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
 b=kHBoaaWfMBP1gqFg7pWv8yV8/piN0nzJBWhiLE+z1AceNVy8Oc3l5iZMy6AEiYXzBefEUB+yOcNt2UMBgDUKWQ8L7vumc8KeYbo9YClbPxeVHxK1j381vjKxKLcFkz4TVfUwEGNOg3UpU4GYA4Fv48tWeV8oTa4NYPSefGLb5gMgPa4Cz+FYOqb5Hg1qA4Em36JF9Ep2CgLc1VSOGIYMm7h8ity02s+ygHuISMF2DW4z2i4o//9+PJlS4AG0yUFMpvhPUNiZlBbrnBXxgqIZQYiTuJz6V6fZjwbacjaHqxiC9DzbxGrmDmPWMUPmfUSoaiyZEESiL5JmLSz/ynI5qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lfNd1lVOmWIcKJtfAvE5HZDVpRKAV40UT90Eetbqppk=;
 b=hM32WG3VeqSnklFoynkr3CPKlOmeZIrGh5qIh5lN8TsDla8NTCgJRiFfmpUEQCTnLetY9PNbRuMNhaIp7WCHpBycyyPQRCOn/RBIqyFW55HHiBOKhhXzJDaV6gBbs7I2ltkQkjoGfmyMVjQw+RnUd9DSDbcZQEJcfZNwvaUVFKjEIuZLNILJALPjjynmUyebt0nQgs48acElRb5WwwPU9+4VW9vN1tul2utZUmzFXRcCFl8m9dCXfr5K3VzZ1gR27gPOsQ9QK9NQFEy4GBO3+SiC62Vjdz9MZiYWHRixHXvoAtatoCvc1tFkKj/z3Gn9DMcZmBpXru3mUqyMVu6krw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfNd1lVOmWIcKJtfAvE5HZDVpRKAV40UT90Eetbqppk=;
 b=rK9voV+8sosNw2up0NGojkpsi5iAQgWf4hgUbAZn4OeTAyuFBflXw7PaNIkvOf4lo8MppYgT0yvnxX7VfU5fWE+PH3bTA7nnkALREqvexAlTJrv7fXjUBlUropKKVA8lt9HQ5W9Zshkmb68JpU+HE/tOc63AQy58WtO20D5up8U=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <2c5da778-2e5e-42ed-9e12-930043316b8d@amd.com>
Date: Tue, 6 Oct 2026 12:22:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: gicv3: initialize eSPI unconditionally
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Julien Grall <jgrall@amazon.com>
References: <13181424f9be3f5e31977fbd505209cd0508571b.1790102501.git.leonid_komarianskyi@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <13181424f9be3f5e31977fbd505209cd0508571b.1790102501.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029927:EE_|SA1PR12MB7037:EE_
X-MS-Office365-Filtering-Correlation-Id: 37ac1213-b73c-4070-e359-08df2393cf40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|6133799003|22082099003|18002099003|10067099003|56012099006|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	JPDIWpFaTVL72sS/MC/BXaZX9lmaos1Wuj7SzDcqpz9ZjVRrS6ykm1ubn3idSJxL+vIPOmuGU87N2xTJoUGlnNq4SZp9Y6DvOMHvRPMMKSPMAPONSANuUx6fo0IQ7WxyUlfmMihOy/DQbNOMkRP8Ye/QTZB6SpQip8xKMX4Eu0KFbG7EhRBRw99wygHDhG5t3qfORxWKQye+qDiuATCjtnh3Ww1IJTfctnONz2eiKRWTOBux3DhI7LiBYmXtVFW9ZCfTb0qqr9SwKPvzLWrMDRZie/xVBc43aGgKHgAcyl8HSEocwBAiPYkdwoysiH80hfeWAk8OF3QgxIYQQqnj7bqbQKizTnXfI33X8eMrmJSZOeu1e+NmZ7/Cc/JMB3BGduD/R0rzr5u02dV0rfdBqeVcnIO8hR6ZXmoKXyJPC4H1d7RszxJIyaWJIHZZcfYjyi03NDSU2ifexz0TCjpD1Y5efXRP/veGjpukY9P6+eMP+4/UUsZGwottu7EF01bDH2cfrWEV/yyIPR5uyJzhAb9NzjhLU6ERr8l/SWmk62O5xDGvALp4/IYwU8BsWLhXbpelmGqAA2jI1LVE7SEBfvu2vTJtwoG/USV0XMrY7e6lt5GFxFp0zABXZHGMK/cKVV2lhomwLOdUiw0RI2OsoQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(6133799003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1YQ6i7uP27BcRhh4XKqp8/96kENj0i4NThNwsJZgNyDsOPZQWNNQOOm4hiLyeTjOZsYCSYuLfRvpe6JaLpJPq1l39Fo3TSqZrUqDmQsn0LftsDxKaZr8LqxSq2icEADFlolo3qGoNJTF8gZTOAsOlqB9r8r/MynL/wg0RTFQ7rCOXZrM5UktaVGMhQ32EzKIQp6T5Zc08RXn49SYhpBe/GNSVOzp3xWrzGFYOICWK4CQyZIkICBN26VmvelsMdY4ap25RbBddW6PJ5h9VQV7dPlje5qua0s7cqctpitorJxHyiEH7J+9bAu8LzrpN8mOgAjiHgJz2GltiFXQkkupYSf/e9QJ9MkvDa7aX5CM6V6oafXpPNR2xzT/y8mQjEsdn6r2KIXthLj7S3YMCFTZfawPaWHGRME3MXWZ5Av7IoESPTnDX6dJDATGOrO25uC2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 10:23:05.3719
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37ac1213-b73c-4070-e359-08df2393cf40
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029927.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7037
X-purgate-ID: tlsNG-ef75cf/1791282192-360C5AE4-D52F64C1/0/0
X-purgate-type: clean
X-purgate-size: 2372



On 22-Sep-26 20:58, Leonid Komarianskyi wrote:
> Since the firmware may initialize eSPIs before Xen, and without
> CONFIG_GICV3_ESPI enabled, Xen would not reinitialize them properly
> during boot. In such cases, once the GIC is re-enabled in Xen,
> interrupts may be received that cannot be handled.
> 
> To ensure proper operation on hardware with eSPI feature, even when the eSPI
> config is disabled, gicv3_dist_espi_common_init() should be invoked
> regardless of whether CONFIG_GICV3_ESPI is enabled or not. This will not
> affect hardware without eSPI support, as the function checks if the
> hardware supports eSPIs by reading the GICD_TYPER.ESPI field (using
> GICD_TYPER_ESPIS_NUM macro), which indicates whether the extended SPI
> range is supported. If the hardware does not support eSPI, the function
> will not perform any actions.
> 
> There are no functional changes for setups where CONFIG_GICV3_ESPI=y.
> 
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
> Acked-by: Julien Grall <jgrall@amazon.com>
> ---
> Changes in v2:
> - rebased on the current staging
> - placed Suggested-by tag first to keep tags in chronological order
> - added Acked-by from Julien Grall
> 
> This is a follow-up patch related to the discussion:
> https://lore.kernel.org/xen-devel/820704d0-4047-4f02-a058-01daba2765f1@xen.org/
> 
> Sending v2 with the requested changes, as I only now noticed
> that this patch has not been merged yet.
> ---
>  xen/arch/arm/gic-v3.c                  | 32 ++++++++++++++------------
>  xen/arch/arm/include/asm/gic_v3_defs.h |  2 --
>  2 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index acdac22953..463769d77b 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -703,17 +703,32 @@ unsigned int gic_number_espis(void)
>      return gic_hw_ops->info->nr_espi;
>  }
>  
> +static void __init gicv3_dist_espi_init_aff(uint64_t affinity)
> +{
> +    unsigned int i;
> +
> +    for ( i = 0; i < gicv3_info.nr_espi; i++ )
> +        writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTERnE + i * 8);
> +}
> +#else
> +
NIT: no blank line here. I'll remove on commit.

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


