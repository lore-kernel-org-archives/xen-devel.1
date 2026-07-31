Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F4EC5516D
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2026 08:34:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1378877.1623902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpihI-00036r-55; Fri, 31 Jul 2026 08:34:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1378877.1623902; Fri, 31 Jul 2026 08:34:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpihI-00036k-29; Fri, 31 Jul 2026 08:34:28 +0000
Received: by outflank-mailman (input) for mailman id 1378877;
 Fri, 31 Jul 2026 08:34:26 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wpihG-00036e-Ni
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 08:34:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpihF-008ZZa-6h
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 10:34:25 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a6c5ded-2eae-0a2a0a5409dd-0a2a45038138-44
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 10:34:19 +0200
Received: from [40.93.195.54]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a6c5e0a-fae8-0a2a45030019-285dc3367fa4-3
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 10:34:19 +0200
Received: from SJ0PR03CA0268.namprd03.prod.outlook.com (2603:10b6:a03:3a0::33)
 by MN0PR12MB6002.namprd12.prod.outlook.com (2603:10b6:208:37e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 08:34:14 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::5f) by SJ0PR03CA0268.outlook.office365.com
 (2603:10b6:a03:3a0::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.15 via Frontend Transport; Fri,
 31 Jul 2026 08:34:14 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 08:34:14 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 03:34:13 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 01:34:13 -0700
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 31 Jul 2026 03:34:12 -0500
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
 b=wTm1c+8l9wYZdUd0jNHodiw8vSW5xsqbv/vMtL5iemCo9kGRbFIhpAK+4bj1lCSYiZy7dmOzkYgkw1e042nZcmuDXuBUMrHfOVBDZZrMRA/AbjOxCuxGcSrUGbYY1rbSZX/YxJ5jqjms9BlQqsuEZGWE3rXl/MB1Ag3IYl2rEjaVIn0poI25/gGU8d+I/m/acITubRJueFa8hhlhiR5KaBxW61m4JP9bsn4z9CKvBXtRW5I0YKmrxe2/Hkd/eYE5G+4z346uPCiyC56n4CTTMYxe/Z2xeMFnwJV1Nq6SqmhUJ4FuLbjE4htM7XepFRzMDowjREPssBRNF8Yr+GZjLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QY6AoxBS5FCzgF+JXiAgmQfN4z632/ifD20MJWsvLlI=;
 b=iLLxXB6hzY8uaUCeC/wyevrzqHA8uAz8N94Qm70jJ54ico4b+6tsToQFs67ybVzfDS+c3NQnX05u3QrDsv0xA+VUCG0MQvPuvuaucOK0v9qFxapBBUI37ttUA4RT0VYO0rTRLN7+ViRnLCzCrF89wDlhu7Z9/L/SWVKcTfxoSjaR/ARxlAyEQalWisLTXdJWl+xLWEJM08/EYZlOnBmqd8oGwcWg3sFt5HNuZSPKASwqbO2Hc5/qwCMf1U1VasaECCs5HPSpg3dJTgrRn+hZdEYWreWfLeQThL4S8a9UgZxwekB9Ii/YvWJrx1Tp7Zb4iKJ60I6pkVi53jOoLxV6sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QY6AoxBS5FCzgF+JXiAgmQfN4z632/ifD20MJWsvLlI=;
 b=B6haMUAhmaG3EWFBFsYpRwtVFUITrdxeB5ASrnARhT6cL8z/hdrjU5Om90BRUfEWbcibsly5iTpMdopj1Zia1nGhI48Sf+484a7otK4+6VQN4PDbXRrGu0hIdv8aBlEcO3lxJHg4xi/zFYq1oggh+t4E9YbiXtNGlTvg3o7JHsI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <22e10198-10d4-4343-9286-989d994b021f@amd.com>
Date: Fri, 31 Jul 2026 10:34:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] xen/arm: its: refactor ITS quirk matching
To: Mykola Kvach <xakep.amatop@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Luca Fancellu <luca.fancellu@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <cover.1779922874.git.mykola_kvach@epam.com>
 <df3219d050b32a406b3eb787c55a42785aa25379.1779922874.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <df3219d050b32a406b3eb787c55a42785aa25379.1779922874.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|MN0PR12MB6002:EE_
X-MS-Office365-Filtering-Correlation-Id: 1636a5ea-cdb2-4fcf-c70c-08deeede80b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|56012099006|11063799006|4143699003|6133799003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	SqF96A3L2of7DPpHP3vGjxJFg5NWHJZY3WzbGsJtBdk6peWrw7dnEjpsrTrFEsb7pdDaIJ4L/+Jj4Egiu6+0INKeD87O4U5O6EEUanRijRfF8XuFe7rZEmiLTzkvFidev1Hdf8F84OCdLGjQVLq4w+ksZxRXneHCFU8qmB2hr3RjeDOs5FMYajaQXZEwEUwigrCIVGTYzx/sJ27E4jmqaxJlyENPNkP/cw3f7+yp5Rs6WhfqszC1pMEZYio0M7pwdOO4cblCmZe7aFQL3lRHJnmXsrIHnGbMLCf3c0laCW79dSI4FbI1IxOBv0JPzsJohbU3KeQNcyUCLN5OZXvUO0b/1YCgSOH6zhFlGSaFtwMzSNSjo2HOu3bPSyVqkno+n/dfFqQKRgFuQacV9Nqzq0elw549DODLtXPWq+jeeu3Yy7bJK1JMfivX+x+0GvfucvJUJ5iZ0UAKB6Q9H+mK0FvazVK/pYjMW/Nzeckx2hQpRxaTwEmLewG5LnqbOi7AnceaKn8jRFiw1DmchUexY5V+xkt4W083zWv8z0K9q65hLSCrgYhVrFwxOuO6x8i5o4H1G4RpcPy5grA0WZjk2zorSLwaZXAO5SDEp9pjtGXRmSpBxsFRfWlkdXxh5noWxAQfyK4uFXVAzDkOib22zUczCQycaadywF1ezJ/YI4FOl+zkBDf/2MJep00NAk9VjcM7bkIHl1Lm4i5HL/oMzw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(56012099006)(11063799006)(4143699003)(6133799003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4vbZpg9WToCH7RF2U8wGJ5rqHwxIil+ZmlNPJnzwlBkbJEzIFxD6Nb+wlGxD2QtNSr3rIuU9AmjVwgU1hbhrDT9jMRQ3IIq3gag8S7pr56wAWRXPYx9gB1XKwmb/vnvINDRQ05fW87JwwaN6+TfNE1ACA55HqER/HY9cHNljCW7gb+mB6dVw2JNIfMHtyBww/xIE8QTxV0m+metRy3fwj8oEz4nAavahG1Zyechb40h7Q+u67OpyS8kzSVeCLg9a2l/Sg7gzok7pnK6FhajXBQctvPAZg7hflGujAaCApr40x2ioU5EPLVyBXqu+1FuG/XhVya/1F4m56sY/hsctmdH37Jgy0ZITGyQbnt58+8nydme22Sa5662B4H4ocS8mDE9wD/vSqZ1UwSGHK+cws4FSLMHQxFLhacxv1D3AAibOGwjVeeJNaH3827L4wgrj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 08:34:14.1713
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1636a5ea-cdb2-4fcf-c70c-08deeede80b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6002
X-purgate-ID: tlsNG-33051d/1785486859-6C6DE4E9-20D5AB5A/0/0
X-purgate-type: clean
X-purgate-size: 5861



On 28-May-26 02:25, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> ITS quirks are currently matched only by IIDR and mask fields stored in
> each table entry. That is too coarse for integrations where the same GIC
> IP block can appear in several platforms but the workaround is only valid
> for a subset of boards.
> 
> Replace the fixed IIDR fields with a generic match(hw_its, data) callback
> and an opaque data pointer. Add an IIDR matcher as a reusable building
> block and use it from the R-Car Gen4 matcher after checking the Renesas
> machine compatibles. The R-Car Gen4 platform refinement is DT-only;
> ACPI-discovered ITSes do not match it.
> 
> Keep first-match semantics explicit. Assert that non-sentinel entries
> provide a matcher and that IIDR matching receives match data, but keep
> runtime guards so a malformed table entry does not become a NULL function
> call or NULL data dereference in non-debug builds. The matched entry still
> supplies separate ITS and LPI flags; this patch only changes how the entry
> is selected.
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in v2:
> - Replace v1's optional platform callback plus fixed IIDR/mask fields with
>   a single generic match(hw_its, data) selector.
> - Add a reusable IIDR matcher and use it after the R-Car Gen4
>   machine-compatible checks.
> - Document that the R-Car Gen4 quirk remains DT-only.
> - Keep the split ITS and host LPI quirk scopes when applying the matched
>   entry.
> - Document first-match ordering in the lookup path and guard against
>   entries without a match callback or IIDR match data.
> ---
>  xen/arch/arm/gic-v3-its.c | 67 +++++++++++++++++++++++++++++++--------
>  1 file changed, 53 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> index dc48a84789..e055914763 100644
> --- a/xen/arch/arm/gic-v3-its.c
> +++ b/xen/arch/arm/gic-v3-its.c
> @@ -53,8 +53,8 @@ struct its_device {
>  
>  struct its_quirk {
>      const char *desc;
> -    uint32_t iidr;
> -    uint32_t mask;
> +    bool (*match)(const struct host_its *hw_its, const void *data);
> +    const void *data;
>      uint32_t its_flags;
>      /*
>       * lpi_flags are ORed into the global host LPI policy and must only
> @@ -64,11 +64,48 @@ struct its_quirk {
>      uint32_t lpi_flags;
>  };
>  
> +struct its_quirk_match_iidr {
> +    uint32_t iidr;
> +    uint32_t mask;
> +};
> +
> +static bool __init gicv3_its_match_iidr(const struct host_its *hw_its,
> +                                        const void *data)
> +{
> +    const struct its_quirk_match_iidr *match;
> +    uint32_t iidr;
> +
> +    ASSERT(data);
> +
> +    match = data;
> +    iidr = readl_relaxed(hw_its->its_base + GITS_IIDR);
> +
> +    return (iidr & match->mask) == match->iidr;
The commit message says you keep a runtime guard so malformed table data
does not become a NULL data dereference in non-debug builds, but there is
no such guard - ASSERT() compiles out and match->mask is then read from
NULL.

> +}
> +
> +static bool __init gicv3_its_match_quirk_gen4(const struct host_its *hw_its,
> +                                              const void *data)
> +{
> +    if ( !hw_its->dt_node )
> +        return false;
> +
> +    if ( !dt_machine_is_compatible("renesas,r8a779f0") &&
> +         !dt_machine_is_compatible("renesas,r8a779g0") )
Given that IIDR 0x0201743b is not Renesas-specific as you mention in the cover
letter, this is a behavior changed and should be mentioned in the commit msg
(cover letter is not in git).

> +        return false;
> +
> +    return gicv3_its_match_iidr(hw_its, data);
> +}
> +
> +static const struct its_quirk_match_iidr rcar_gen4_iidr = {
__initconst

> +    .iidr = 0x0201743b,
> +    .mask = 0xffffffffU,
> +};
> +
>  static const struct its_quirk its_quirks[] = {
__initconstrel

>      {
> -        .desc	= "R-Car Gen4",
> -        .iidr	= 0x0201743b,
> -        .mask	= 0xffffffffU,
> +        .desc = "R-Car Gen4",
> +        .match = gicv3_its_match_quirk_gen4,
> +        .data = &rcar_gen4_iidr,
>          .its_flags = GICV3_QUIRK_MEM_NC_NS | GICV3_QUIRK_MEM_32BIT_ADDR,
>          .lpi_flags = GICV3_QUIRK_MEM_NC_NS | GICV3_QUIRK_MEM_32BIT_ADDR,
>      },
> @@ -77,18 +114,21 @@ static const struct its_quirk its_quirks[] = {
>      }
>  };
>  
> -static const struct its_quirk *__init gicv3_its_find_quirk(uint32_t iidr)
> +static const struct its_quirk *__init gicv3_its_find_quirk(
> +    const struct host_its *hw_its)
>  {
> -    const struct its_quirk *quirks = its_quirks;
> +    const struct its_quirk *quirk;
>  
>      /*
> -     * The first matching quirk wins. More specific quirks must be listed
> -     * before broader IIDR-only entries.
> +     * The first matching quirk wins. Entries that match a specific platform
> +     * must be listed before broader IIDR-only entries.
>       */
> -    for ( ; quirks->desc; quirks++ )
> +    for ( quirk = its_quirks; quirk->desc; quirk++ )
>      {
> -        if ( quirks->iidr == (quirks->mask & iidr) )
> -            return quirks;
> +        ASSERT(quirk->match);
> +
> +        if ( quirk->match && quirk->match(hw_its, quirk->data) )
> +            return quirk;
>      }
>  
>      return NULL;
> @@ -96,8 +136,7 @@ static const struct its_quirk *__init gicv3_its_find_quirk(uint32_t iidr)
>  
>  static void __init gicv3_its_collect_quirks(struct host_its *hw_its)
>  {
> -    uint32_t iidr = readl_relaxed(hw_its->its_base + GITS_IIDR);
> -    const struct its_quirk *quirk = gicv3_its_find_quirk(iidr);
> +    const struct its_quirk *quirk = gicv3_its_find_quirk(hw_its);
>  
>      if ( quirk )
>      {

~Michal


