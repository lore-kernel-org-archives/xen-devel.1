Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09BEF53D9B
	for <xen-devel@archiver.kernel.org>; Mon, 16 Mar 2026 21:04:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1255788.1550608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2F67-0002Jd-3S; Mon, 16 Mar 2026 21:03:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1255788.1550608; Mon, 16 Mar 2026 21:03:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2F66-0002JW-Uu; Mon, 16 Mar 2026 21:03:34 +0000
Received: by outflank-mailman (input) for mailman id 1255788;
 Mon, 16 Mar 2026 21:03:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3wxl=BQ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1w2F65-0002JQ-Nq
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2026 21:03:33 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93dd78a8-217b-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Mar 2026 22:03:28 +0100 (CET)
Received: from BL1PR13CA0026.namprd13.prod.outlook.com (2603:10b6:208:256::31)
 by PH7PR12MB5831.namprd12.prod.outlook.com (2603:10b6:510:1d6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.14; Mon, 16 Mar
 2026 21:03:23 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:208:256:cafe::eb) by BL1PR13CA0026.outlook.office365.com
 (2603:10b6:208:256::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Mon,
 16 Mar 2026 21:03:10 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 21:03:23 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 16 Mar
 2026 16:03:23 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 16 Mar
 2026 16:03:22 -0500
Received: from [172.24.66.250] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 16 Mar 2026 16:03:22 -0500
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
X-Inumbo-ID: 93dd78a8-217b-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NOAc80PM1Yj+l4g4sE7WkZexS9RlTzhgokyCtFRYewg7B8MwHsNL+Q4Sl6WnMZJ3PDUqHfvmbK8J54TKDggS8ZWT2nN/aYDQRqsymwLCbNB376Hl/aP+ggzJxJzctN2yIos3/FqZbUEf3yuGW4fP+URRdhYkGSwwaAM0ZjTgbpqc+neR9S30freoR+WYGKyXjiE4E1mUSp1EjI08MhAhpkeOB3efvkjIshxfTK2vQgCAYDnuLmTUWYAZTS5/AIzJfHB6M423/9AByGnUIAHiEjTq0VCDzOAyT9CBwQ8J+PO7FDU/BMLGjSUMz6XocImOcMGIK77J2cwOEbeEeinfYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2VJ2/ZaIa1tp7HHB3+IanEReRu7K+Mb6xw3f4L1LBWw=;
 b=hfSl9zgcnNyY7vmQ4gsO8udU3Wg1lcphwQ8wNJ/ee25Q8EoylW0u+/JFaR2E109vBVrgZspl+37cn7LACLhI7XDz607+eNnOHd7jwQNEQ8YspWGea5LSv+mjPE8GboDDhr5raxZT3onP5qB/6QFvKqfd77etSpSnBhuHrO7FkMdU93nvW19HIQBB0n6nwidZupyYnPO5nFPWC7hsUVDTREbPJxe72Sq/FKBajSfbvdMge9d9fYM9HlNg1j11Jlps7pTNJl76obi64C5wujXX7VflZuY6DaUyjZW/iiKpiQdF6OB2dJT8NV5GhurnD7nc+XMn1BZ22cSdwbsNz+uWlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2VJ2/ZaIa1tp7HHB3+IanEReRu7K+Mb6xw3f4L1LBWw=;
 b=2ZJK+GYwPhGZu0Eqhc3T4Bgg8fYTUf/gulXZqKCzpPXdj8uklbD8/TRxHnhQ2wGm5xyEZYmEFIayJw+BxtOlxgIXBCpVtbNpnP8wi+fEbYvitYgqvKHECPkpf2zX7ETTG2ocwug6J7DPBJJkFup0fmTbHTsy25JA4RANKHIR13s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <1fbb8e3d-f43d-4ffc-87a3-d363b46baeb0@amd.com>
Date: Mon, 16 Mar 2026 17:03:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] vpci: rename and export vpci_modify_bars
To: Mykyta Poturai <Mykyta_Poturai@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>
References: <cover.1772806036.git.mykyta_poturai@epam.com>
 <f4d48063a4091cf851eab7ad9bf53364df8d1568.1772806036.git.mykyta_poturai@epam.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <f4d48063a4091cf851eab7ad9bf53364df8d1568.1772806036.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|PH7PR12MB5831:EE_
X-MS-Office365-Filtering-Correlation-Id: 907a410b-2bc0-49fe-3db3-08de839f75de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fJYKwP2NYdt12bK/BH1zpGO1NizLQoRjjTAES4qFSZ9aoBRjeYR5+etPkTwrlC218YsEMy1U/POfreH+PCiCGURDgQ0GWlBPxbAsP+ZGS0PMRvCf6dSqNvAMTvdOgmNHvY61vJkyiU3rExx+6nmLU/+zvlYXWcoDvN5Db7SP8ixs0uHocWiCt4DKLkFLpAeJn0D5tG12UTA6QT9I5TrAW5bjwHyBCYnqX2MdPKoYPocuIVhMPfkySLTpDw0gejIr3M6DUPWwmRmrTmWiJY7B1kHim5yVWCvw7GElPgc+fUGlIpaOKqnVxuqDA0A/iQ27EGLLbudxSkEBNIzcXgKljJc3gM+ADkMkWRTYH/YA7N2sOhctQSeGhMhNvUozUHP96D7TdvR6+yunUsTm1Sz/MfcEkyAylHJwIhf8KTcbarE2JZpFgfs2zHrrQdL80dYU+OmAgAxM9LGDxdnf2Vu5/Y7h9IvVxZuS+6XP9BjGTTh9Cum0Xu/pphQtBDeun7kuZIMatkWzrvYazhItTBCPLi/WNkIzWd+SvA5pZuWYvRPBLMLcU41CIlL2PJCLLs2ABVNjKRKnf2Cj2+O7E8DsT86FpAkWtx8mMbHQnv45JRbnFG2ypdMS6OENq+ZtgGoHO+9AoKmGZA9NXypB58ExmFrw5JDAyM4lGCxVX9wrASYrtce1X/Hu3pU+V6aFuptAHrMrrY6pU7rq26knyHwA+HCwKjNnvOBMLiTEicea/uK0kORg+p6yBjTFKd8dJ6YBbYmhdOq43GshqQshb9pujA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ApjKdoPdd6JU8cHsdxGbqPP2KyZkGGcsvLS86SvW0KfOAHn+58v4OZb3tE6BZtP5B2KvWys2Blk2mmn2vfTj2qTpk9XAbXjBFY5SFdSc/3e3/QFfwx8kV9+UB10ka3DCrjcLvVJQKy4AeP9wK4cNz4PwQqx1VoxGh5bZlDeuqyvlNGVOoN6ysnDjO5Gb4X/lDhWiTU7pUdDQNjuw++N9peoqLjm9rMF+aq7PDbkTFPQ7/pV88cCswFIIlIMlUrfurvslDA49aZj8LD1t6toXgGD9v9p8/bmEMdh6QZCJTgH9xFvLv5HRKRqNk3Omtdxc85DN4QLsbFPe2fJ2xkqyNRGantDzgFTW4L8p3BvbvwoQSOURk1+Gb0sx5GwzUwXFbnp9p/t35h8BPx4n63iVo6go8Ou/fAa9jhQS4xLggbX/RjuJz8Qv9Zpfuqnao2ZN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 21:03:23.3215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 907a410b-2bc0-49fe-3db3-08de839f75de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5831

On 3/9/26 07:08, Mykyta Poturai wrote:
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index d6310104ea..a98ddbb32e 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -295,6 +295,9 @@ bool vpci_ecam_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
>  bool vpci_ecam_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
>                      unsigned long *data);
>  
> +/* Map/unmap the BARs of a vPCI device. */
> +int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only);

This prototype should be moved to private.h

> +
>  #endif /* __XEN__ */
>  
>  #else /* !CONFIG_HAS_VPCI */


