Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435D6C88E4C
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 07:58:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1415915.1645114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4w9Y-0006Th-Dc; Fri, 11 Sep 2026 07:58:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415915.1645114; Fri, 11 Sep 2026 07:58:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4w9Y-0006Ta-8G; Fri, 11 Sep 2026 07:58:32 +0000
Received: by outflank-mailman (input) for mailman id 1415915;
 Fri, 11 Sep 2026 07:58:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1x4w9X-0006SL-6o
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 07:58:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4w9W-000VaJ-Jn
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 09:58:30 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6aa3b4a4-8faa-0a2a0a5109dd-0a2a450aaf80-2
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 09:58:30 +0200
Received: from [40.93.195.40]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6aa3b4a4-f2d2-0a2a450a0019-285dc3287cea-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 09:58:30 +0200
Received: from SJ0PR03CA0172.namprd03.prod.outlook.com (2603:10b6:a03:338::27)
 by SJ2PR12MB8944.namprd12.prod.outlook.com (2603:10b6:a03:53e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 07:58:25 +0000
Received: from SJ1PEPF000026C3.namprd04.prod.outlook.com
 (2603:10b6:a03:338:cafe::6f) by SJ0PR03CA0172.outlook.office365.com
 (2603:10b6:a03:338::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.6 via Frontend Transport; Fri, 11
 Sep 2026 07:58:25 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000026C3.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 07:58:25 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 11 Sep
 2026 02:58:24 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Fri, 11 Sep 2026 02:58:23 -0500
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
 b=KNc0T6TVMcz6RM/cLpQ4d6nwqTCCYZEroq3aFvHauV7qakFi5ZqUP+R1EmaQcwI5+OZJ/3rrWpOsbG9ijIeMwBBw3sIdxkZCa6T9oI6qYY4flS0asPVa3zzXbAA7cXVbonUb+R1dWdoP5lqVp5B00oMfaVetGuApMJFqCD2JkXDkevXCxoeCBpra4s7CDjyovfi2cVAen0PP+jiD4nt7HuHNGxwZE098PcyoJZrAZQZ2R9KWdPiRIbtWjTepi9jwuyPz1/Towzvk4tkq6c+MhrRJeDnLi17F2aHTzH0RY1M4g9IOAc7AwaaI9Ws8A0yjDzxmIvqNmDiofFXKwPLg5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4D0UCDSldlI+bfLGmqYPvawtPB+ljyuKptP3kiiIqOU=;
 b=o/qdL8VYTnmF94zUexmMU0/zQxRT+/rmKjXNoHE4WJWBhvoG4n85OpQxiVeMLfsk1FrRcoMPxp+MLPrweAO2eXo8y/UlMCpj1zdtpTHKQPLfEjejkt1NC7O1Nn6m089CRCS+KIj1AqiN0RZMyW45Vslu6Qyx5dcwy0mlYFjkIeH9cSbhPTpk6awNywprB6QjRb0Zm8JfzCQhtXpQeLA0NNQ1CFeWLgewmO/8liDSGWhYxswknmFUgzi/lsR6WZcUc4GSPs+TI5UcLjNHYXIVXtO+5Ztf4Qthd5yhoO9JFFIvr5mz0fyM3Q8ppuy0a7QdCNM+iHyS+D9K+4XPm4RYbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4D0UCDSldlI+bfLGmqYPvawtPB+ljyuKptP3kiiIqOU=;
 b=28pfF4h54FkvrOSleC5GtyOk3ORU7cmdxcFFy9dNFMnmDP0/wFZqHH8IxFaeQrAHcAldUs3vIjnCrTP3c7BC6hD+sHJogi0/ET7oghXbnFTCkKsEz6gKtpnJL5px2KH7KV11AN31clZPhVUcHmnnGftR6Ok71RqQqrL8215386s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <d13a53d1-cadb-4b04-9894-ebfc1283ff46@amd.com>
Date: Fri, 11 Sep 2026 09:58:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] common: dom0less-bindings: introduce XSM labels
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20260909085707.2359322-1-Sergiy_Kibrik@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260909085707.2359322-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C3:EE_|SJ2PR12MB8944:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f718cce-4112-46b1-5306-08df0fda7530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|6133799003|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DdJTLs/JkImbyqJPNtnzuEYli00XBQ+D33lcG3jZSm46b/6Rx0LH58nWfA6s5eIsgbe0kOsEhHVN6xEvaJNZw+JIaaascU3UxSyJu6Rl0B8yn2VCCLZ1TN5mJXotfLFJq801o/RlvOpSR6ozE8L9RMTnWM7CWae7akCEqZGMLg/Q42Uud/5bZ7gXJ5AL4aSzI6gewHhw5OHvr5dfQolPa1JMx/SiMBpeiTZvSmv+s06Ff68wsoJUfbs8X0n2T+1WGl/pucpJRtoN6z4LopMSKp+j3Sw+uUrUmn1vM2wWde2j1u7SYD2jT4K6Hutry85STR/mvboHbfMljn0XnDOVErmITGvt8uSfCl/D3l1cj2vEarDVIaVp6pq00CsSAJa/CVXyCD7e3/FL/TT80CHYOLV7jO9NhZSlqG1F0voRQuU3mcZgmBx/E3QLW7nboNtBF7DVDU/pXaavGHvuNAAjEz9FQsKT4BU+By75HWegzMoJtzVbQ8wRA+YRlOi40jttHK6vZJuWtSl2v3HnC/rPrZlG/URB14NYgxfeXBRiHZ4D0Q5EOhU/7HcKH72JJhxe4WL/ekapSuUv/8/CgawraEetHxzHF+X5HSvsVUDFo3gNVkOhtoSRmEqviJwjR/MKKG/6P2Lcgw98DBi6vMELwEay3GxxhN1oXLgAaj/fM2meb4JmiTXker29onncJgpLcXs903XAl/f7TBdWIwBM2Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	C9WhHuTUKc1Vpt44P3b+rhZI03LH0xeG+fzKiv4N1aOzLHVZz71AiIX0rcI3u9caiyTixlDom1zgUW/BzPukIYKvzzKblp5mpCd+JnyHDfzY4MJGgqHkuBNxd1d/lL93nkxzF2QnwWLN3FRRIIDi/BR/z8QTn7Y4WduqI5s4yJ6cFJW7lnWkpExmd9ux7OE1I+Lcn9jZLtBiee6K78vx813MkkDEPPZOYE8mnRU3ZMs2adpX5oqlhMwG6fvc2fP+w5ox6dFwNBU4hRK+M2sUSgdoi73ECnGcfNNfJvi59Rg8crVIwGvKn7XZF+ZOhIsUXGi6EHwYitUK8M8KsZ1wAgXkkvbq+szuXmPJHz+kSjryqsJsprY0vjtmnr50dGsht0nwjzYuo5N/0WtRrFB3s23Jc1FUilK/SmlQ7oT2ATo+bXM47Zh7nMhQeTZlg4DU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 07:58:25.2024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f718cce-4112-46b1-5306-08df0fda7530
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8944
X-purgate-ID: tlsNG-4011c0/1789113510-508CDCFC-8F834504/0/0
X-purgate-type: clean
X-purgate-size: 3996



On 09-Sep-26 10:57, Sergiy Kibrik wrote:
> Add "seclabel" property to be able to specify security label for a domain
> when XSM Flask is enabled, similar to xl configuration files.
> 
> Currently guest domain can't be created by Xen in dom0less configuration when
> Flask is enabled, as domain is assigned "system_u:system_r:unlabeled_t" label
> by default, which Flask denies to create according to current policy.
> 
> Because code from outside of flask can't directly execute its internal API
> a new routine flask_context_to_sid() introduced as part of XSM API exposed
> to rest of Xen, which is a direct wrapper for security_context_to_sid().
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> changes in v2:
>  - add & use flask_context_to_sid() wrapper
> ---
>  docs/misc/arm/device-tree/booting.txt      |  8 ++++++++
>  xen/common/device-tree/dom0less-bindings.c | 11 +++++++++++
>  xen/include/xsm/xsm.h                      |  3 +++
>  xen/xsm/flask/hooks.c                      |  5 +++++
>  4 files changed, 27 insertions(+)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index bcb06bc796..fcc7be0ffb 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -345,6 +345,12 @@ with the following properties:
>      not passed. This configuration requires static allocation (xen,static-mem)
>      and direct mapping (direct-map).
>  
> +- seclabel
> +
> +    A string property specifying an XSM security label to this domain. Effective
> +    only when FLASK is enabled. Domains will be classified “unlabeled” if
For "Effective only when FLASK is enabled" see below.

> +    this property not specified.
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
> index 41d72d0d58..0b0ed6e25d 100644
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
> +    const char *xsm_seclabel = NULL;
>  
>      if ( !dt_device_is_compatible(node, "xen,domain") )
>          return -ENOENT;
> @@ -141,5 +144,13 @@ int __init parse_dom0less_node(struct dt_device_node *node,
>          panic("'llc-colors' found, but LLC coloring is disabled\n");
>  #endif
>  
> +    if ( IS_ENABLED(CONFIG_XSM_FLASK) &&
> +         !dt_property_read_string(node, "seclabel", &xsm_seclabel) )
> +    {
> +        if ( flask_context_to_sid(xsm_seclabel, strlen(xsm_seclabel),
> +                                     &d_cfg->ssidref) )
> +            panic("Invalid security context for domain: %s\n", xsm_seclabel);
> +    }
The preferred way (you can look at e.g. SVE, SCI, LLC) is to stop Xen if a
property was found whose functionality cannot be satisfied.

~Michal


