Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C40C79F9E
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 08:41:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410673.1641469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3Uuf-0002RV-0Y; Mon, 07 Sep 2026 08:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410673.1641469; Mon, 07 Sep 2026 08:41:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3Uue-0002RO-To; Mon, 07 Sep 2026 08:41:12 +0000
Received: by outflank-mailman (input) for mailman id 1410673;
 Mon, 07 Sep 2026 08:41:12 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1x3Uud-0002RG-Vm
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 08:41:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3Uuc-00CAzs-LN
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 10:41:10 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a9e78a4-e002-0a2a0a5209dd-0a2a45068bbe-8
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 10:41:10 +0200
Received: from [52.101.46.51]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a9e78a4-195a-0a2a45060019-34652e3352da-3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 10:41:10 +0200
Received: from SJ0PR05CA0150.namprd05.prod.outlook.com (2603:10b6:a03:33d::35)
 by CYXPR12MB9277.namprd12.prod.outlook.com (2603:10b6:930:d8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 08:41:01 +0000
Received: from MWH0EPF000A6732.namprd04.prod.outlook.com
 (2603:10b6:a03:33d:cafe::a1) by SJ0PR05CA0150.outlook.office365.com
 (2603:10b6:a03:33d::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.6 via Frontend Transport; Mon, 7
 Sep 2026 08:41:01 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6732.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 08:41:01 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 7 Sep
 2026 03:41:00 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 7 Sep
 2026 03:41:00 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Mon, 7 Sep 2026 03:40:59 -0500
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
 b=EUd2HDnD1uOEDYX48Xc+iJhXXvWyc31ksSIQ53SOsvPLdtwVpTJSNH17Qu3fggSmJznUbQBiw6bU7HtES5w+Pj+kCMdt8xcfQ9gEJY7yuQSKk/mrfZFcVABzgpll6YZUeF1ygtIeQjA9eUTu43ctq0yeBm+j3vB3x84Volw3zEt183xjkC18uljmqFlUx9Wg2cwmOOa8uUjp0h8yeQ68Oajq7Vessg8Ll5ihVk00uhaNcu/bUb+7Nb+2JFBnPv1X9W81l3hqQQIGcBizgGquxriIdkvNdn15+ERne4LA0kSEo3o6S9Ofx7ydti6BdIXdLvjtw/NfWOMZ0TtnIH14WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rcyr3XZVhs0K1/6bEO+VbaLgOLMUp13wtOdx6oM/dc=;
 b=AWXM18w9PLRlcOJAXUEUWrvo4F4KRf/7kTR686Gv9wWyOxyRcAlHoJB5Jrx988uebn4GYRv8FRR7Pd6d2Tj5Ir/4TpXYC45qw7CS3MdajJhnyufFcwBwkr+9poDudCN89l6Uzt8bnsYA90dWkMNBNHTUW6C/cz0VVQ4lHuppL21C17gj4ZI1E/571QP11EOHc0mhrGsJ38eBsKDEbDp16JTpVrMEuenAcZ8WwlwRFI6YmpphoM9FdnNurxRsH5vlRSy9xY3oBDjm1Ng2T+0ojpKYKdj+aNOWbgnLgrz6tppMw1mhhd+8bDLTAG9c4DNFgIJqp/Ad1EUrup0LL0kPwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rcyr3XZVhs0K1/6bEO+VbaLgOLMUp13wtOdx6oM/dc=;
 b=rXLNncuGsH1q4J6jjCF2QIcEDxmyHxs2EIJsi3cxmiNs/xQW4NOH645MD8kotxjAiMbaVyxa72OVcimkmYkBvcfr8jhLLj3acozfRhyXDlmLJpXuqB2xRAkeoXP4sEigghmamWITxvj7nIYeQNIe7CSHyfw2/sK1qsTwGWlaYcI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <4c8bc3eb-44a3-4c27-aa15-8dfa80faf5e4@amd.com>
Date: Mon, 7 Sep 2026 10:40:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/arm: smmuv3: Add support for removing devices
To: Mykyta Poturai <Mykyta_Poturai@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Rahul Singh <rahul.singh@arm.com>,
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
References: <56e7734d60ad8cca4279a71b4beb21ca51250386.1787303836.git.mykyta_poturai@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <56e7734d60ad8cca4279a71b4beb21ca51250386.1787303836.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6732:EE_|CYXPR12MB9277:EE_
X-MS-Office365-Filtering-Correlation-Id: 23bf5be2-8f84-4dd8-34ab-08df0cbbbf33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|10067099003|6133799003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	ROIclYKy5gdV7/a5f4gYYGZ4oe2odKpeOip7ETZmEaQPzc3VthSFGhtULWE8fRkrlR7r3EWMpEJntMWYdWWdC9MmqVsUHMVb3rjEH8hW2NTvhU7oiO6MwmwvsTW+dpojpSQD/V/JaNSGPr7toRkWJxUZz5i+sMWkPksmpPoBTOsG6zp4wziZekmoP2LHjnz6IFJHaYw5gETxS0y2YC+3Cl89TscD6QGko2WXVdY1aKQF7fysFHMfVsXUYS7SWdnmX0qOSEsLLdcjMuk9aA/iMkVbfWZpW68GVWZUdJqnlTrkdNG87fyiADXou+80Jto+IdF6hR++L8EkmtyTwoKbnye4mCQCon1JW6wpXGkCD70YpQ85hJCtMN/Whg/OSqg/smoEegZzJQFsMYSk4LsdDSkMr2FhcwU32zVIlU7pBdqcqah7AkzNRjhLbDoYo5+o2uqhUJ4lpKvRNmDv9bVbtq7bSao313MG+OCpQ5YHq+G2X5tVt1URvEnzxjlqBlkdmTPMNYPn9d/npXiBJzfHRLOq4659fnBPOOy9ZC5/twGJGZVQL1C57VzTHK8GcKio+wgnQ8LqueteedsRDAqMqcQaxqQu8yH8KwT11+nxTvnkioAYCAHmxfkm5mC9n5HsntOgXJAvTB1cfvKoCQu4HQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(10067099003)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ryqblx9Bccay9Lpphsi0m/d6dPI0bqvGpi1vaOLHvt4lqUiQvYA7F+gBUz0/zX/VAqJuH6crmvQ9Yh3EdQahJtLYD9I1JL7s9qRkwMSihxMEF0M3npDoZcHdRygz5YC7Dz82yhEQ445jFxYeBA+h8g8yBItXAlyOQpTQNZjUey1SXSt2FoMhz85I/mWQk3atYW/cPs1kMcNueu17bT31qoLIWwYHpOt55oLD05tNfRm9P4sKty3Zo7aSTTe3d0FlT4nUOhDeMvSMxLE1NbBUBENqaX7hxv7YVRJWVq66Vf2dgE8qhXP/TN/d1d2pm+FQFATKXzE6AOu5GCbJjZIA3lTEAmVol/Vbc4Mj8FdSXdTfdrwiaeGDeZFob+QgaDn5BJo7rfIjG+sRAvaCgmvYo2W43JnkBxxfWk4wkvgodv5YQ1faptbUhJ8YJC9LuPiU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 08:41:01.5279
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23bf5be2-8f84-4dd8-34ab-08df0cbbbf33
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6732.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9277
X-purgate-ID: tlsNG-16d1c6/1788770470-F4A0477B-CF78D7D1/0/0
X-purgate-type: clean
X-purgate-size: 4668



On 25-Aug-26 09:39, Mykyta Poturai wrote:
> Allow for removing devices from SMMUv3. arm_smmu_deassign_dev handles
> most of the work by disabling ATS and zeroing STEs. Additionally, unset
> the dt_device_is_protected flag and free no longer needed smmu_master.
> Free iommu_fwspec for PCI devices only, for DT devices it is handled by
> generic IOMMU layer.
> 
> Rework dt_device_set_protected to accept a boolean parameter, update
> callsites.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
> 
> Tested on QEMU with SRIOV series[1] by repeatedly enabling/disabling
> VFs.
> 
> [1]: https://patchew.org/Xen/cover.1772806036.git.mykyta._5Fpoturai@epam.com/
> 
> V3->V4:
> * s/u8/uint8_t/
> * assert pcidevs_locked
> * assert deassignment is only reachable by PCI
> * fix build error with HAS_PCI=n
> 
> V2->V3:
> * free fwspec for pci devices
> * remove testing note from commit message
> 
> V1->V2:
> * check for phantom functions
> * simplify pci/dt device split
> * improve error handling
> * don't try to free master for unprotected devices
> * rework dt_device_set_protected
> ---
>  xen/drivers/passthrough/arm/ipmmu-vmsa.c |  2 +-
>  xen/drivers/passthrough/arm/smmu-v3.c    | 77 +++++++++++++++++++++++-
>  xen/drivers/passthrough/arm/smmu.c       |  4 +-
>  xen/include/xen/device_tree.h            |  5 +-
>  4 files changed, 82 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> index fa9ab9cb13..0648f9b407 100644
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -1367,7 +1367,7 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
>          }
>  
>          /* Let Xen know that the master device is protected by an IOMMU. */
> -        dt_device_set_protected(dev_to_dt(dev));
> +        dt_device_set_protected(dev_to_dt(dev), true);
>      }
>  #ifdef CONFIG_HAS_PCI
>      if ( dev_is_pci(dev) )
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index bf153227db..3578f36259 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -1493,6 +1493,80 @@ static int arm_smmu_assign_dev(struct domain *d, u8 devfn, struct device *dev,
>  static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn,
>  				 struct device *dev);
>  
> +static int arm_smmu_remove_device(uint8_t devfn, struct device *dev)
> +{
> +	struct arm_smmu_master *master;
> +	struct iommu_fwspec *fwspec;
> +	struct domain *d = NULL;
> +
> +	fwspec = dev_iommu_fwspec_get(dev);
> +	if ( !fwspec )
> +		return -ENODEV;
> +
> +	master = dev_iommu_priv_get(dev);
> +	if ( !master )
> +		return -ENODEV;
> +
> +#ifdef CONFIG_HAS_PCI
> +	if ( dev_is_pci(dev) )
> +	{
> +		struct pci_dev *pdev = dev_to_pci(dev);
> +
> +		/* Ignore calls for phantom functions */
> +		if ( devfn != pdev->devfn )
> +			return 0;
> +
> +		ASSERT(pcidevs_locked());
> +
> +		d = pdev->domain;
> +	}
> +	else
> +#endif
> +	{
> +		if ( !dt_device_is_protected(dev_to_dt(dev)) )
> +		{
> +			dev_err(dev, "Not added to SMMUv3\n");
> +			return -ENODEV;
> +		}
> +
> +		dt_device_set_protected(dev_to_dt(dev), false);
> +		if ( master->domain && master->domain->d )
> +			d = master->domain->d;
Given the comment below and `ASSERT(dev_is_pci(dev))`, `d` can never be != NULL
in DT case, so these two lines can be dropped.

> +	}
> +
> +	if ( d )
> +	{
> +		int ret;
> +
> +		/*
> +		 * For DT devices, iommu_remove_dt_device() returns -EBUSY if the
> +		 * device is still assigned, so d is always NULL on the DT path.
> +		 */
> +		ASSERT(dev_is_pci(dev));
> +
> +		ret = arm_smmu_deassign_dev(d, devfn, dev);
> +		/* This should never fail because we already checked the domain */
> +		ASSERT(!ret);
You checked the domain but the assignment takes place before
`arm_smmu_attach_dev()` can fail in .assign_device, so I think it's still
possible and the ASSERT should be dropped.

> +	}
> +
> +	arm_smmu_disable_pasid(master);
> +
> +	dev_info(dev, "Removed master device (SMMUv3 %s StreamIds %u)\n",
> +		 dev_name(fwspec->iommu_dev), fwspec->num_ids);
> +
> +	xfree(master);
> +	dev_iommu_priv_set(dev, NULL);
> +
> +	/*
> +	 * For DT devices the fwspec is freed by iommu subsystem, but for PCI
> +	 * devices we need to free it here
> +	 */
> +	if ( IS_ENABLED(CONFIG_HAS_PCI) && dev_is_pci(dev) )
No need for IS_ENABLED here.

> +	    iommu_fwspec_free(dev);
Spaces but should be tabs.

~Michal


