Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F271606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 09:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=mbLns+HE
Received: from list by lists.xenproject.org with outflank-mailman.1459009.1671059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKBY0-0001GP-Cp; Fri, 23 Oct 2026 09:26:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1459009.1671059; Fri, 23 Oct 2026 09:26:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKBY0-0001GI-92; Fri, 23 Oct 2026 09:26:48 +0000
Received: by outflank-mailman (input) for mailman id 1459009;
 Fri, 23 Oct 2026 09:26:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xKBXz-0001GB-1C
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 09:26:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xKBXx-00C7B4-SC
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 11:26:46 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6adb2845-2eae-0a2a0a5409dd-0a2a450cb25c-44
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 11:26:45 +0200
Received: from [40.93.201.53]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6adb2853-f479-0a2a450c0019-285dc9354111-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 11:26:44 +0200
Received: from SJ0PR05CA0111.namprd05.prod.outlook.com (2603:10b6:a03:334::26)
 by SJ0PR12MB6927.namprd12.prod.outlook.com (2603:10b6:a03:483::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 09:26:38 +0000
Received: from SJ1PEPF000037A1.namprd04.prod.outlook.com
 (2603:10b6:a03:334:cafe::6d) by SJ0PR05CA0111.outlook.office365.com
 (2603:10b6:a03:334::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.3 via Frontend Transport; Fri, 23
 Oct 2026 09:26:38 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000037A1.mail.protection.outlook.com (10.167.244.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 09:26:38 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 23 Oct
 2026 04:26:37 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 23 Oct 2026 04:26:35 -0500
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
 b=GMV0OLvgs3+1StzNMrRLuavMqh9rQyyaZZUh5aMouFfJvmCNaiZoUNukXfU/iGyfkIRocQ3WdoZ/FirLr/4cwVPI4C2DbcJcE9QQUxj3onoQSV3Zmqs3g3mp+c0mpFbrP3ldg0eOGP24MeNENkgJYNdVcQTWtSz1xEVe0ArtTDR3sBIT7GuhwnC1XLVfM9BsgcSepVY/qmtP6CwP2KbHQb3kujRu2UPTOF812FJsGDJaMoMJNHduk3PlF7DjQdPyrPDrcXbrDiQxjuC4CxV1afI+sCFSxxpwtYN5RA2CzjuzRmx54H0IEoq/CO3Tngirj/XPaH+dRBz3/1gZqOjpqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJ+d/CHcr9ey5774wLha6b+iwnhehERCqPKf1kXEU9Y=;
 b=goAYM8UeywbuolFf0uBRHTw4Fd5nInOl/IO68Hf4oa8VIsmqQWj4sG1NTdfGzoO7hMPscVyoU1IIig4MsDA+d3Vc4qhcmUCCipSR//gdIZpAf9pr2NdsKyEZ2A8iLD6FnArjYBAKAVNZYycW031u0/7+9pAc3XdUOWuDB8oC6j+QOzv01bMnoneeJbS4Jb+lQgCUxx0DGPTBaKkokq1z2U9YQduCcfcphLb67t4NGUS2asNcoxpg+1uS3H2xOyWD+7W6ZXKhwrKCvcCGuEXcdXFPOGa+BmhiBMW4QbC86m4+Dfq+x77nZe54zLpfPtPrLGnkB7vY9dQ6RkHRiADRYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJ+d/CHcr9ey5774wLha6b+iwnhehERCqPKf1kXEU9Y=;
 b=mbLns+HE+9a2w87XkdvmlmXD2Ot3bdEGrqdzLg6+uLnWSmchWyvpt2Xc7qCcRRMga81a0QbnFcJmUT+KrOqYRKdKPVkWvBCNZtHUQ8a2YdV7Nu8Ghzbi5E6p+JLEtlqBjIp68bEv1MRRIoQ4GMoyNC+EHD6/HDztAiezNznZ2ZM=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <b6c61c65-e29a-4bc3-a4e4-0ab1964a5e0d@amd.com>
Date: Fri, 23 Oct 2026 11:26:35 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen/arm: smmuv3: Add support for removing devices
To: Mykyta Poturai <Mykyta_Poturai@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Rahul Singh <rahul.singh@arm.com>
References: <5bf81a2b31f182d1339e89fb65e445bc20b1a865.1792400044.git.mykyta_poturai@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <5bf81a2b31f182d1339e89fb65e445bc20b1a865.1792400044.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A1:EE_|SJ0PR12MB6927:EE_
X-MS-Office365-Filtering-Correlation-Id: 76dae0f3-c092-4247-cd30-08df30e7bd9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|11063799006|56012099006|261022075727099003|261022105027099003|261021121427099003|261021123027099003|261009223027099003|260925022911599003|260925021911599003|260925021311599003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	m0R+LZ1nXQKN20ifRFCS5aSz94lmWt8hM8UMnRxRZqiwtBCGoPBFZ2U8fNg4RtpQbniovHdd/AcMy6O4BaKGxeu9xpFZMc+om2xo8Dzd5TapZwXJC2Qv03wxGlgkmW3siBUFset6Ap5cnSXz3QNR4wUHaqistwb7M/TqmAQDCWItT1RGNMsuUXz3T5jDqrrlpquSx+WZ2B8lhPhWKq5FqjTD9HfYX3mZBP8Jq9sswGBmNM48kTW1MVRSHF2gfJaErVZLPtCFs2KVIXgPk8SWdpWBrkte2FC6My/8MRvY/Xof9txyr9r50Fb3GELsyNSLI07vEhnvZ1ncIizdRsLqjPVBVFKD848kofrhTK8rYK0upSP1MDlUXj+e/pm5lpBwdQ68SVQ3Ey5FtQqBU1EbLZ9jp5XeGDuzAAWkIGI2Msvgm2xNjX1bZ9M2xctn3S2AlaTpznXQwbRcmnbU/1P0sjHY4j4Pv39b5tLbvN5rW/vMnVNI5MIyYuwEy47gJ5dXCFwKtDf1w4/7nFykRt04V/uqldWCND5s7j+IdxnFT90fCTOvNay7rNl0xgfJW3HW0INtOSSEBxZmGeuT8neGIPblPtGIkgAiBXmLqM2LLxdnQFnQzAZlJu9GomOaJmlDoq6VZ4/6HVja6AWjNgCNpg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(11063799006)(56012099006)(261022075727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261009223027099003)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zUEmGwsVoHg4MbNNLWbT41hr7euzdTSc2CneR8pLkLU00YMkrIqMawjC4OyEu9PA7FV9WKqMlr06Za6yHdUyU9CFylhh0E5lQABFKTgVNE0J8zWpDAwS6cZMnv+dmJjGP9H9laW0SGj8T0WJNGCgUvSEIjT8sNahMUN5nTNogydF2t0f6wnD7//UHKEXahF8+aQKEOT5peOGLFqg5tP91Hc+7LqZgVQKlXnbpvUtXzgogJN6euwHu7lWFC0sAS1uh80fqer+rmUMpTaCzSiiaPPSdDLYQeM0nhSkKBsaWuTKmfEiKC6UWnzlZuHybnaa4/DQa7eoYmNRF2vdd7DvOw7+4daU3u6WAdQKw+B2Ij1Hs9yrCx1uJxDP/c9GUWtUYhJUrp+2/0vcoJxWePJhrlr5ZGVx/dbiDOELIIcrd8P6OHzZFUIkqoS3CyW2EqMt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 09:26:38.5630
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76dae0f3-c092-4247-cd30-08df30e7bd9f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6927
X-purgate-ID: tlsNG-d25034/1792747605-008CDA5B-FCEF4C82/0/0
X-purgate-type: clean
X-purgate-size: 4361
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 19-Oct-26 10:59, Mykyta Poturai wrote:
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
> V4->V5:
> * drop dead domain lookup on the DT path
> * remove assert on  arm_smmu_deassign_dev error
> * drop redundant IS_ENABLED(CONFIG_HAS_PCI)
> * fix indentation
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
>  xen/drivers/passthrough/arm/smmu-v3.c    | 72 +++++++++++++++++++++++-
>  xen/drivers/passthrough/arm/smmu.c       |  4 +-
>  xen/include/xen/device_tree.h            |  5 +-
>  4 files changed, 77 insertions(+), 6 deletions(-)
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
> index bf153227db..e1af615985 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -1493,6 +1493,75 @@ static int arm_smmu_assign_dev(struct domain *d, u8 devfn, struct device *dev,
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
> +	}
> +
> +	if ( d )
> +	{
> +		/*
> +		 * For DT devices, iommu_remove_dt_device() returns -EBUSY if the
> +		 * device is still assigned, so d is always NULL on the DT path.
> +		 */
> +		ASSERT(dev_is_pci(dev));
> +
> +		if ( arm_smmu_deassign_dev(d, devfn, dev) )
> +			dev_err(dev, "Removing anyway\n");
> +	}
On a DT path d is always NULL. On a PCI path d is always non-NULL. So this
entire block and ...

> +
> +	arm_smmu_disable_pasid(master);
... this call can be moved to dev_is_pci branch.

> +
> +	dev_info(dev, "Removed master device (SMMUv3 %s StreamIds %u)\n",
> +		 dev_name(fwspec->iommu_dev), fwspec->num_ids);
> +
> +	xfree(master);
> +	dev_iommu_priv_set(dev, NULL);
No need to call this for PCI device.

With the remarks fixed:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


