Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228D5CC6B08
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 12:11:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1447078.1663247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGbLH-00027Q-Si; Tue, 13 Oct 2026 12:10:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1447078.1663247; Tue, 13 Oct 2026 12:10:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGbLH-00027J-Q3; Tue, 13 Oct 2026 12:10:51 +0000
Received: by outflank-mailman (input) for mailman id 1447078;
 Tue, 13 Oct 2026 12:10:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGbLG-00027D-VZ
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 12:10:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGbLG-007pFh-Cb
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 14:10:50 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ace1fb8-e002-0a2a0a5209dd-0a2a450a8d7e-40
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 14:10:50 +0200
Received: from [40.93.194.11]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ace1fc7-f2d2-0a2a450a0019-285dc20b77f2-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 14:10:49 +0200
Received: from PH3PEPF000040A2.namprd05.prod.outlook.com (2603:10b6:518:1::56)
 by BL3PR12MB6572.namprd12.prod.outlook.com (2603:10b6:208:38f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Tue, 13 Oct
 2026 12:10:42 +0000
Received: from SN1PEPF000397B3.namprd05.prod.outlook.com
 (2a01:111:f403:f90f::3) by PH3PEPF000040A2.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Tue, 13
 Oct 2026 12:10:42 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397B3.mail.protection.outlook.com (10.167.248.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 12:10:41 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 07:10:35 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 07:10:35 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 13 Oct 2026 07:10:33 -0500
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
 b=VWiisakxXyALZBFvNOKJ1ZZwTiCW271071s8NPnDAGF+e+1Y9b4jHZwZ0LcFfRvceaf8rdr/m8Bll/FxvQWFoW+ylljA/mDslHLoMd586+dHb20V/zFrkVb49SlW6ruN5OkWkIlVVn3TQxVPlArQzjUkhIkEy9sBqT4i72wirP8KidJwh6ynDe6QjzuAZt4BNNwDMgKIMsEIMD0NDUGIV3eHhjB3ZUCSsfPWuQzI4lPokVUpqis9sHKhUKX6nJudBUzeJ8kSkyG3ViWWn4eu/g4kHzTzxp8KF5LA9bANT8y1CnIqu+YfSN/rBzop4huTa0RFqBsXGVELnfblYsnipA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FlfHM9JD6FexhY6VBGhDaWriCWiJrXXLaCiMRaaNwh0=;
 b=g5GwaeZrRVZuessWNof4nMJgsc1eGvhZF9JXnsiiFsHlbnKPOD+YXcljqXqI/albqWdKPwz1jKYo7wZpXCAhfQqm2zo0wq9PfH09OMv06xoDvZnzoC4jiR4TbqyAF6B8cwrR18RxHFDB1gcFhmKj7iok6kbm5qfrmsJDMXjSLKGPm8lzs9seOT5vQuHevVhFyxGqV1uIL8Br6xSi6z57rocDDy6ChMCgO8jL76eVmjcOB2/pmSJu9iqZrKM74XXQY+fyVMPD5LbDo1EB9oUr3im1+BnJEigA4KO8F/nLEfT4V0HqZGhO9lAkyxjkEq/hJE6kNAUGPt2s9SSggtoRmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FlfHM9JD6FexhY6VBGhDaWriCWiJrXXLaCiMRaaNwh0=;
 b=C1Y60ZG8PW6+mx3+T7x2nBlGQ+NHQDBdR33K7X9fwYixgf9RrmiMnqSZj+w+RdCapba0r8RB2Y2ixINVfjBeUM/g1czb7oqXOGqeJsl1/132wrgXR1JWz/T1Ry5RGwEaiJptTNiZb2vVLQ4/DjCGr+5UXtzuOGhPjdOuP0DGmNM=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <132a2374-bdd7-465b-bb33-92be961c4393@amd.com>
Date: Tue, 13 Oct 2026 14:10:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] common: dom0less-bindings: introduce XSM labels
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Alejandro Vallejo
	<alejandro.garciavallejo@amd.com>
References: <20261012101453.949907-1-Sergiy_Kibrik@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20261012101453.949907-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B3:EE_|BL3PR12MB6572:EE_
X-MS-Office365-Filtering-Correlation-Id: e003c522-0bde-41cd-83d0-08df2923005c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|6133799003|10067099003|22082099003|18002099003|56012099006|261009223027099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	YxukH5kK51cxaIZg1shz8tDKq7OXP5FjJ2j2VpXFHKbcRGs+JDZZFdLR8B3q6yWlgDyqPGJpKnFq7zx1ds6OAu/y6XobCvFeJY25AfzwnnAcWsqUqJaEoONa4TcVwCuS5LWB2s5qkBNrVqysIOonASXlIF0Ja8z9v2SyZR9NuIY1G46Db8FGuo47cPhqk+8CFZ0RmwO2qCyG7E78H9yfenSLF+sU3C+fzBxXmC0znkXwk36LESpwlg1aQPuHAEWP9izpxwCt4i8Ym3Ss/UZnLGjK4XUb53MUCKr27WNwmX9RlTyj8tjzRmEMclgjblQmntKAQgEu3pIfZzMb7QgIdo/S7/tkWe/XXhmzNeNiFqWicVLUDQ2JYLbtpO98+eTowvl6L9vzHfjFeOcGT/WGVwaYf/YJfqj/7hScpeEhpwWwCuBCLzS90/QdYi8P58Gr+h+3UKKZcTLt6FfknPnCt6ex47YlR1gErO9VLI/c8YRP1a17YiPNuUbNt71/G9HmXBDerW7DI3Y0F1jEV/BiBh9AeF5XjvelCah1bztmZUKJibR5VnusL2KVZLOBBD/erIokLtk87if0kpEMDuh/bjls4N5ch1ghTl1GsoXfDcpzoE48eZJkcXVMjIxcQeWR9SSiJ/ku/xmfsgtyRsAsrH9diQjP/55QxuXU+/nyQ+6afSAFeIN7+liqtZQsxu+MX9waemb8kxHP/o/PMwmd5w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(6133799003)(10067099003)(22082099003)(18002099003)(56012099006)(261009223027099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LxhCnkI2yU3lgrM+AxGH2DVV0fXRLOMpsJjBJVzxehFx5K1+ot4csmKOreIGi2t0GiJT872+ngyoIyfyDtAVfP3mw5SEOJzL6s36GtZqUvZAARafahdil2y92uxXqeuBbbLASXumxqTkTBDESbtWaWjfIViyESW9SSFYAwQ5Uabw1ZyntM9O9X/ZA44Nma7LDMschPIpUz1p07MWKKhJOalmLmPuQDM50U66bgD7YYsaA3/DN4o0PnVTmWJchzzsuys8f250NOd1rjzR+weTGGUHL7/oY5Vz7MBuChWJXeCYxBMl2V02gePbJDEj5SGx29T36b7Gv3u6b85HrM1LaSQcBFJ7t4w+Xw8GU5qk54YioDe5xKvwIa2h4oyiedAK6DaPNUhNsnDAtXZJA0vACvVORNKjAWDoDfGv5OEVfAOwvLejIWvnSC5m4VFMYJd+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 12:10:41.5890
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e003c522-0bde-41cd-83d0-08df2923005c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6572
X-purgate-ID: tlsNG-4011c0/1791893449-51EC2CFC-82DE1360/10/78276251493
X-purgate-type: spam
X-purgate-size: 5099



On 12-Oct-26 12:15, Sergiy Kibrik wrote:
> Add "seclabel" property to be able to specify security label for a domain
> when XSM Flask is enabled, similar to xl configuration files.
> 
> Currently guest domain can't be created by Xen in dom0less configuration when
> Flask is enabled, as domain is assigned "system_u:system_r:unlabeled_t" label
> by default, which Flask denies to create according to current policy.
> 
> Because code from outside of flask can't directly execute its internal API
> a new XSM hook lookup_sid() introduced as part of XSM API exposed
> to rest of Xen.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Please move the CC: lines below the --- so that they don't end up in the
commit message.

> ---
> changes in v4:
>  - introduce XSM hook `lookup_sid`
>  - at SID lookup return error if security server not initialized
>  - document panic if DTS property is used and FLASK disabled
>  - per Michal's request panic if FLASK disabled is left unchanged
> changes in v3:
>  - panic if `seclabel` property found but FLASK is disabled
> changes in v2:
>  - add & use flask_context_to_sid() wrapper
> ---
>  docs/misc/arm/device-tree/booting.txt      | 8 ++++++++
>  xen/common/device-tree/dom0less-bindings.c | 7 +++++++
>  xen/include/xsm/dummy.h                    | 7 +++++++
>  xen/include/xsm/hooks.h                    | 2 ++
>  xen/xsm/flask/hooks.c                      | 7 +++++++
>  5 files changed, 31 insertions(+)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index bcb06bc796..2a69d2537d 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -345,6 +345,12 @@ with the following properties:
>      not passed. This configuration requires static allocation (xen,static-mem)
>      and direct mapping (direct-map).
>  
> +- seclabel
> +
> +    A string property specifying an XSM security label to this domain. Domains
> +    will be classified “unlabeled” if this property not specified.
NIT: Use regular ASCII quotes.
Also, s/property not/property is not/

> +    Note: boot will fail if this property is present but FLASK is disabled.
> +
>  Under the "xen,domain" compatible node, one or more sub-nodes are present
>  for the DomU kernel and ramdisk.
>  
> @@ -422,6 +428,7 @@ chosen {
>          memory = <0 131072>;
>          cpus = <2>;
>          vpl011;
> +        seclabel = "system_u:system_r:domU_t";
>  
>          vcpu0 {
>              compatible = "xen,vcpu";
> @@ -453,6 +460,7 @@ chosen {
>          #size-cells = <0x1>;
>          memory = <0 65536>;
>          cpus = <1>;
> +        seclabel = "system_u:system_r:domU_t";
>  
>          module@0x4c000000 {
>              compatible = "multiboot,kernel", "multiboot,module";
> diff --git a/xen/common/device-tree/dom0less-bindings.c b/xen/common/device-tree/dom0less-bindings.c
> index 41d72d0d58..b03cee0e8c 100644
> --- a/xen/common/device-tree/dom0less-bindings.c
> +++ b/xen/common/device-tree/dom0less-bindings.c
> @@ -11,6 +11,8 @@
>  #include <public/bootfdt.h>
>  #include <public/domctl.h>
>  
> +#include <xsm/xsm.h>
> +
>  int __init parse_dom0less_node(struct dt_device_node *node,
>                                 struct boot_domain *bd)
>  {
> @@ -21,6 +23,7 @@ int __init parse_dom0less_node(struct dt_device_node *node,
>      bool has_dtb = false;
>      bool iommu = false;
>      const char *dom0less_iommu = NULL;
> +    const char *xsmlabel = NULL;
Please drop a dead assignment.

>  
>      if ( !dt_device_is_compatible(node, "xen,domain") )
>          return -ENOENT;
> @@ -141,5 +144,9 @@ int __init parse_dom0less_node(struct dt_device_node *node,
>          panic("'llc-colors' found, but LLC coloring is disabled\n");
>  #endif
>  
> +    if ( !dt_property_read_string(node, "seclabel", &xsmlabel) &&
> +         xsm_lookup_sid(XSM_HOOK, xsmlabel, strlen(xsmlabel), &d_cfg->ssidref) )
xsm_lookup_sid returns an error code that we could print on panic message.
Please do so.

> +        panic("Invalid security context for domain: %s\n", xsmlabel);
> +
>      return arch_parse_dom0less_node(node, bd);
>  }
> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
> index 6331859afa..029cddd5cd 100644
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -823,4 +823,11 @@ static XSM_INLINE int xsm_domain_resource_map(
>      return xsm_default_action(action, current->domain, d);
>  }
>  
> +static XSM_INLINE int xsm_lookup_sid(
> +    XSM_DEFAULT_ARG const char *ctx, uint32_t len, uint32_t *sid)
> +{
We need XSM_ASSERT_ACTION as the top level comment requires.

With the changes above:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


