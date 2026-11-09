Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82636606A31C
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 09:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ZnNd8jDK
Received: from list by lists.xenproject.org with outflank-mailman.1479699.1683610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQLGp-0002xI-TF; Mon, 09 Nov 2026 09:02:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479699.1683610; Mon, 09 Nov 2026 09:02:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQLGp-0002xB-QR; Mon, 09 Nov 2026 09:02:31 +0000
Received: by outflank-mailman (input) for mailman id 1479699;
 Mon, 09 Nov 2026 09:02:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xQLGo-0002wo-S0
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 09:02:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQLGn-00246k-UE
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 10:02:29 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6af18c25-bab6-0a2a0a5309dd-0a2a45099382-0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 10:02:29 +0100
Received: from [52.101.57.3]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6af18c24-be1a-0a2a45090019-346539030c20-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 10:02:29 +0100
Received: from SJ0PR13CA0024.namprd13.prod.outlook.com (2603:10b6:a03:2c0::29)
 by MN2PR12MB4256.namprd12.prod.outlook.com (2603:10b6:208:1d2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Mon, 9 Nov
 2026 09:02:23 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::c) by SJ0PR13CA0024.outlook.office365.com
 (2603:10b6:a03:2c0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.7 via Frontend Transport; Mon, 9
 Nov 2026 09:02:23 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 09:02:22 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 9 Nov
 2026 03:02:22 -0600
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 9 Nov 2026 03:02:21 -0600
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
 b=OgKMXFGx/JIT4CEWE24Q3gCyfiWMiTiCjQYHFslncdWq8qiLBbHNC3nR0m++4F8GIWHhOxOeCeCS1yas4LHDeX5l31NgFM5K9H8JOEVBHmEL8wgnvb+MKtWw+D9IAqqvXFsRJ61RZuvBvOXKreBIh5kl1zfdz10bt8/cBLqY9ZUNp+mYJOpmkqe+Ml9pWDXdnS94OwLaRnZSmzvX9Aq+o/1JIDWkFFUjmXD6LQu29Ltla3VJmeAbl7+Uw/u14Gz8O0+sNjtpTu03QdBi6Eokm1H/EHHTC9GEU4IHEpUb70mTW+8ECAJCxQn+uLI/YxkQrnbwO0DFf5yB2vFtyoIufg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZnKK9Tl1txvir3dlbZMAN4GB5ObsQBqKAVVRwZyQio=;
 b=YjHLBqT4hoF7UDOW1+sfeOl3WFmvP0YBiodl5ATEEN4tdHa2LDKSIIfD9nr+PyHBlW6zro4Ojp7zq5Nl6l6/nRTCE6SWbL5uQuZpLw5Kl4lIVSoOwq/1MA9t7PVay+VSBs+HDPDAkSBNzdcw6C3m/2PmyM06yGM4McPllNwphXrfQfAfp00UmRznBZe/6XxeXCVEbNvZEb+Mhv1wqoOUPxIWtVXDsLrtT1GXfo2/c+7CxjlMjcs+ljYuaUxJ9uumdCPxKAoQgaxUZ+8WEUSBICmIFAq2UT65H0twjk7FeGQYg8NF+Xe4nZMDw5aaB4LwKPY/nl+iAsAFACa3v8+6fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZnKK9Tl1txvir3dlbZMAN4GB5ObsQBqKAVVRwZyQio=;
 b=ZnNd8jDK/FdpsjohrQM9OpYcnTvG/FIiwy0lfnv/eqq5Re35/2bU22HJIuqAb97cbj7d6ZeSrlnZh7cXPm/mfikSR77oOOWhN6HoaC7UOf7YZ3DRVzCD83NARtqDTlbGtUU+ERHvtL3/iREpLsrFAjQdIH42AVJ7MIADnpFw0is=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <9e4f5718-45c2-4940-8d48-be577c0bc169@amd.com>
Date: Mon, 9 Nov 2026 10:02:15 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Preserve host GIC #interrupt-cells for Dom0
To: Kuan-Wei Chiu <visitorckw@gmail.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<Volodymyr_Babchuk@epam.com>, <marscheng@google.com>, <eleanor15x@gmail.com>,
	<jserv@ccns.ncku.edu.tw>
References: <20261105170117.3550534-1-visitorckw@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20261105170117.3550534-1-visitorckw@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|MN2PR12MB4256:EE_
X-MS-Office365-Filtering-Correlation-Id: 57c6e303-210c-4267-b420-08df3e402b0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|261026140227099003|11063799006|261022075727099003|261021130227099003|261022115727099003|261022105027099003|56012099006|261022113327099003|261009223027099003|261021133027099003|261021121427099003|261021135927099003|261021123027099003|261026135527099003|261102123227099003|261026121527099003|261028144727099003|261026130827099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	fR3+k+a7isoahsfIhBmprWHIRANnkSGA95zfma0BU0PBNFZ1LhQ6bzH1i52GAnHYcdC16YQEdAmrA1NOiAW1NIRc1IEJKbkCkbS8YXgPzteJgaDl/qHtEOmeSXWMzGSEG5CsSD5Br1cHxj5ig+3NrUQ0GZNj9eBxTy2T6967UmWgRN2TC88ZGBHZRi4MQqKaIvObO7pSu5ynupze73AXu6naoph1cgb37ydRtYx1e9XOHK+NjjkEwKmbhm8c0VG5Zm3UXB+9yQUOz3heafVuBF+jr1Yx7yZsig5AyuQHovBQoKkmzg8M8CiEXaAuyRpGh2iZDwwpardKXKA8zwCrdJHjyI/0sHBooutDUNdkOdknN2vOacfI20pmz9b8MdM0/XMl11KixB9co7xhHS1tIGorPCzVY+2zl1Pyt8zZmAEVJpbuwgJWGNlov7ay2xXV0Pmbk/CNQymaHqDBYO/cxK3WTayUVRlq8hZaNhvw4uPoneaqcdmqWOeeWrGt4XtVRpkqdoMxoPA/vZ24tsbwD85OTMV6trqjrmzgYRgXmbx7eszZInQMp9UEaobs9UqEvrAwPiSc6xJLu574GOb7NwTG0lkAVQQHRI87srvPabJ+X1zp5F0NR1veyQ6s4eh8VQzMh78C/B806LYMqVzleBTNzxj1+XKxLJk6+TVJPDzvKrxiauj7mCwuIAOKqtaTOCU4cMpL5zpmP8R0CBt65w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(261026140227099003)(11063799006)(261022075727099003)(261021130227099003)(261022115727099003)(261022105027099003)(56012099006)(261022113327099003)(261009223027099003)(261021133027099003)(261021121427099003)(261021135927099003)(261021123027099003)(261026135527099003)(261102123227099003)(261026121527099003)(261028144727099003)(261026130827099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RlvZRBQ/m8iwlGMFLq3xlEzNIPRUWFbozRjw/HDunbZopxo6LxYsy5tSUQ1hDQ7bcK8BvsYb/Trv0zMYw0TlyMQ05IjaH2oD/vLQSKDym+PTbSHshBUztuST9J7nK7fKx68KMyK6O5fOu4SfiG4VaEN+p5jBPslAGKa1/uDXDuJ5RG5TKhgUSKySgs0jmgbQPh793q89WCMYfLCxWEwuN/6Tgx3RrmBBr4PBU4Gz4KHLo0KykY3tBgtxu/1Ir2e+tMzcE7D7PFhkDzwdhWqK+YH9AFuMH1SyPEq4F19BWphA7eqxvirRTcQkggjuMbwWRKCy7qq5VWR91Azae54t8ivGlWJANQXkcCz9fKBErldvv2ukP0hy9eN7tIj+HRBoFuGEw69y/Evzzw9MqoDHRqcydgwPpfvfA3MJVkO+pWOzKQD8U2mim5PZt/le/3cx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 09:02:22.9836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57c6e303-210c-4267-b420-08df3e402b0f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4256
X-purgate-ID: tlsNG-bad1c0/1794214949-BC2F4034-9E1E1DB0/0/0
X-purgate-type: clean
X-purgate-size: 2296
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 05-Nov-26 18:01, Kuan-Wei Chiu wrote:
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
> ---
>  xen/arch/arm/domain_build.c | 30 +++++++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 1ee1f1f6a7..74d2491f9e 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -654,12 +654,30 @@ static int __init fdt_property_interrupts(const struct kernel_info *kinfo,
>                                            unsigned int num_irq)
>  {
>      int res;
> +    uint32_t intrcells = ARRAY_SIZE(intr[0]);
> +    void *val;
> +    unsigned int i, stride;
>  
> -    res = fdt_property(kinfo->fdt, "interrupts",
> -                       intr, sizeof(intr[0]) * num_irq);
> +    if ( is_hardware_domain(kinfo->bd.d) )
> +    {
> +        const struct dt_device_node *gic = dt_interrupt_controller;
> +
> +        if ( !dt_property_read_u32(gic, "#interrupt-cells", &intrcells) )
> +            return -FDT_ERR_XEN(ENOENT);
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
> +    for ( i = 0; i < num_irq; i++ )
> +        memcpy((uint8_t *)val + i * stride, intr[i], sizeof(intr[0]));
Please add a comment explaining why only the hardware domain is special
cased and that any extra cells beyond the 3-cell specifier are zero-padded.

With that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


