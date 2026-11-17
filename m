Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCB2606A33D
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 11:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fDEgG5Mt
Received: from list by lists.xenproject.org with outflank-mailman.1492234.1692943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTHkc-0005zP-SJ; Tue, 17 Nov 2026 11:53:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492234.1692943; Tue, 17 Nov 2026 11:53:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTHkc-0005zI-P3; Tue, 17 Nov 2026 11:53:26 +0000
Received: by outflank-mailman (input) for mailman id 1492234;
 Tue, 17 Nov 2026 11:53:25 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xTHkb-0005zC-Hb
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 11:53:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTHka-004HCy-Qg
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 12:53:24 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6afc4022-2eae-0a2a0a5409dd-0a2a45028524-30
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 12:53:24 +0100
Received: from [52.101.46.14]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6afc4032-6ca4-0a2a45020019-34652e0e6009-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 12:53:23 +0100
Received: from PH7P220CA0105.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32d::20)
 by SN7PR12MB7369.namprd12.prod.outlook.com (2603:10b6:806:298::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 11:53:17 +0000
Received: from BY1PEPF00026969.namprd05.prod.outlook.com
 (2603:10b6:510:32d:cafe::1b) by PH7P220CA0105.outlook.office365.com
 (2603:10b6:510:32d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 11:53:17 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF00026969.mail.protection.outlook.com (10.167.244.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 11:53:17 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 05:53:16 -0600
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 17 Nov 2026 05:53:15 -0600
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
 b=HpCP7lRA9shM44NEHh0A7PKesO7dxQdw4ecgU7trpy73Zu0BWPclkG9yhoNvTzxXrrjs4/Mumg5IGVDN93fYCH8aTqyLPEB3o7d+kfMSXqaDyIVpiskFtG0zwt+fpyKOjtY4rY0Ukh6Gx7hn0mtR1ZEB9mTBjDmEVIGuwPcCEdEZzCgaJr9GaAGv+LPI1nVlz6BRWsHK910CSvoAW462sQ7pb16PTBLPGuhPyFGUF3LEuYhJBAX8aKd+HnZChw57wH/1W0SMrEjQNhxvkqlQLLDuo2xKMUo95HJVcdyc3MfwsgV2RJSJjbKQXWE+enk1JRQHfP3QppWbsdeUBO20Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WA/wKhPAvHl3N0cOfaqerOdHIK62tQkvqiNrFpqtZJE=;
 b=vexrpKg4OzBmTrub/AeLIy60WZ0mOfHJ4W8+HByPGjKYQcYjJNttd39EaPIbRUpVjFlV8K7ZGWJNsmkYKcKHrmkRwNwBTaQZv6z4tt/gle7Vq0wcHoQK8i945NM+d8lU7DDh2Pw+8THEnPLOlMs4hmmtft3S0TnLT8CZuFSuS1NCAb3fxJJ5IV+YW1lA55EtKyS9X9S8py6qP6yiagLLBh1796T+ENSTNqs7kveWHllbh6wr3SGj4XxYnxlMgzxRNTwL0DeafsdNAuJvOgYKd8ab7gr60hI1+vC7zu7VUVqQb0T9Wh7dcTm6Sp7pPbBFaoXdyaJ0yPBL/h7uyBuPrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WA/wKhPAvHl3N0cOfaqerOdHIK62tQkvqiNrFpqtZJE=;
 b=fDEgG5Mt1WLhw80wqxGTC8Ssda61IH8Bqskolkgu0J+MN7B2W8pT84GKpGkhhDyXSzvNXhvg6n4ZNQ+oKO5EeXbVqUnTjgvGywBXk7lCjNnMh+g9/1kfdSdal3qFQe93XfKdSE/KpLH5qdYcrHjOm3EUWb1gWk7O/i5Pn3qM5wI=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <81b41fb9-71bc-4e60-a8c0-8990ab0a70fd@amd.com>
Date: Tue, 17 Nov 2026 12:53:09 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: Preserve host GIC #interrupt-cells for Dom0
To: Kuan-Wei Chiu <visitorckw@gmail.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<Volodymyr_Babchuk@epam.com>
References: <20261117073904.2281059-1-visitorckw@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20261117073904.2281059-1-visitorckw@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026969:EE_|SN7PR12MB7369:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f2f668f-1fba-41b9-640c-08df44a15e8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|22082099003|18002099003|261009223027099003|11063799006|56012099006|261028144727099003|261102123227099003|261022115727099003|261021133027099003|261021123027099003|261022105027099003|261026135527099003|261026140227099003|261021130227099003|261026130827099003|261022075727099003|261026121527099003|261021135927099003|261021121427099003|261022113327099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	9fG7Yt3Mrk1LDL9QcCTAOg+Lf3Dg4kBU6P4Vqw81F1p8Wztv6b0L+kzbxqNgYpXzeQ7jNeFnGUk8Mu+RoMmcz9ZAcmlnUP9DubcTzJGlxRjAs3iYseVevLc/dn736LHlFVvswO4D3CMIMrv9HENm54sfkRgZ9K0Uty0+JEhnFB06TfAqhQ0aKvKoOxk+8m5ckVGQLoQLyIVbWCLPcBcER+cnQw0FpvBB1q8OQBYVHeY0ectnteH6nL5fLGA4GvQg4VIMOiE8tbb5dMn9yOxZZHe2xAF4TzVCsxV+iCoS9ZGk1Wz4TNFshCIkiGXWDx647nPb8GgQtxgQxiuG4vvGYvX5Wftkb7ZW7JMIqB3MVdojSX0V/1G24VU9C4sK3718FImSVrZuKAPQrNe0E1Tl8/58yJ4Av5I6ruTJdErf42sXfRqUA9hen8N6nXViyk7ynnH6OMH9pcnrNo515ap8I1Rbj+KvobjqAIj6pY+W+1H9TKjN8pcWonnSaDbwSPH/q4YS+KNX90AcTwYIz5pHlT+iS0wwZOiNm2xdMg4Ws1KZsQJo5WN7/yyqhKh30eBgZi7mV25cYz5uzB1nRHiqEhvkH9eSOdrr9s3PKTB3P3w6juu8xFgzGAi5vKcgj1Q/X1NuU/8RSC5SCpLCLh5OOQefRKPBpdyNfjImkWSJrSfTpo42yz+f9UyVIpdtzXeFPKwP5OgbUIK7fFb6b8cZHg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(22082099003)(18002099003)(261009223027099003)(11063799006)(56012099006)(261028144727099003)(261102123227099003)(261022115727099003)(261021133027099003)(261021123027099003)(261022105027099003)(261026135527099003)(261026140227099003)(261021130227099003)(261026130827099003)(261022075727099003)(261026121527099003)(261021135927099003)(261021121427099003)(261022113327099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8TxePmdJcfHrb1UV6yg+2ZFeY9bFO3yp8XazvSmHkr1CCBTst1KsahLLfAMJfhhmL3x6Hi1QG527k730P4d+7/RhgOZ5DmunsSK2hN0suYT9f2U0U2ZoNzcQIDWkVH4Io54iiTakZz9NlpRa62zc8IPW6lWqicqbisIfQHZHoIK+pUoRaQzgp+etev26/yXVEeZiJZfKJpfxMdif9eO6PDW9m8DZE63/zjX4M7DjtQkCyumFaR8T643xVQymmkioq8G/vsqgXE/bxFAab/5VzO2zhbyGgHM2GSj7rggOn/+bF5/q6vM4rTl0i2ZYTamVkq7DaJOjv/jMeJxmmw0EsUuA+gV5muYDgpILOcTEZ6GVdo2MTeaiQ/Nz1TiloLlIkRrl10xy9CgEVcx7p7MZMrrpkljpyH0EGILvxq3rUPGfDFejZXjBCu3w1dfVlIzh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 11:53:17.5487
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f2f668f-1fba-41b9-640c-08df44a15e8f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026969.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7369
X-purgate-ID: tlsNG-720697/1794916404-F3ABD2AC-81684443/0/0
X-purgate-type: clean
X-purgate-size: 3520
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 17-Nov-26 08:39, Kuan-Wei Chiu wrote:
> Xen copies device interrupt properties from the host device tree to
> Dom0, but hardcodes #interrupt-cells to 3 in make_gic_node() and
> fdt_property_interrupts(). On GICv3 platforms where the host uses 4
> cells, Dom0 parses the copied specifiers as 3 cells each and fails to
> set up device interrupts.
> 
> Propagate #interrupt-cells from the host GIC node in make_gic_node()
> and pad Dom0 interrupt specifiers with trailing zero cells in
> fdt_property_interrupts().
> 
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> ---
> Changes in v2:
> - Add a comment in fdt_property_interrupts() explaining why only the
> hardware domain preserves the host GIC's #interrupt-cells and that
> extra cells beyond 3 are zero-padded.
> 
>  xen/arch/arm/domain_build.c | 37 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 34 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 606e85818e..d5bb895a6e 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -654,12 +654,37 @@ static int __init fdt_property_interrupts(const struct kernel_info *kinfo,
>                                            unsigned int num_irq)
>  {
>      int res;
> +    uint32_t intrcells = ARRAY_SIZE(intr[0]);
> +    void *val;
> +    unsigned int i, stride;
>  
> -    res = fdt_property(kinfo->fdt, "interrupts",
> -                       intr, sizeof(intr[0]) * num_irq);
> +    /*
> +     * Only the hardware domain preserves the host GIC's #interrupt-cells,
> +     * since its device interrupt properties are copied from the host DT;
> +     * domUs always use a 3-cell virtual GIC. Any extra cells beyond the
> +     * 3-cell specifier, such as the GICv3 PPI affinity partition, are
> +     * zero-padded.
> +     */
> +    if ( is_hardware_domain(kinfo->bd.d) )
> +    {
> +        const struct dt_device_node *gic = dt_interrupt_controller;
> +
> +        if ( !dt_property_read_u32(gic, "#interrupt-cells", &intrcells) )
> +            return -FDT_ERR_XEN(ENOENT);
Blank line here.

> +        if ( intrcells < ARRAY_SIZE(intr[0]) )
> +            return -FDT_ERR_XEN(ERANGE);
> +    }
> +
> +    stride = intrcells * sizeof(intr[0][0]);
> +    res = fdt_property_placeholder(kinfo->fdt, "interrupts",
> +                                   stride * num_irq, &val);
>      if ( res )
>          return res;
>  
> +    memset(val, 0, stride * num_irq);
Blank line here.

> +    for ( i = 0; i < num_irq; i++ )
> +        memcpy((uint8_t *)val + i * stride, intr[i], sizeof(intr[0]));
> +
>      res = fdt_property_cell(kinfo->fdt, "interrupt-parent",
>                              kinfo->phandle_intc);
>  
> @@ -1320,6 +1345,7 @@ static int __init make_gic_node(const struct domain *d, void *fdt,
>      int res = 0;
>      const void *addrcells, *sizecells;
>      u32 addrcells_len, sizecells_len;
> +    uint32_t intrcells;
>      const char *name;
>  
>      /*
> @@ -1370,7 +1396,12 @@ static int __init make_gic_node(const struct domain *d, void *fdt,
>              return res;
>      }
>  
> -    res = fdt_property_cell(fdt, "#interrupt-cells", 3);
> +    if ( !dt_property_read_u32(gic, "#interrupt-cells", &intrcells) )
> +        return -FDT_ERR_XEN(ENOENT);
Blank line here.

With that my tag stands. Can be fixed on commit.

~Michal


