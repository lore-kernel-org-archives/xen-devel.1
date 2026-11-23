Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA40606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2026 07:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kh5ImBnk
Received: from list by lists.xenproject.org with outflank-mailman.1500236.1696470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVOX6-0003Is-4k; Mon, 23 Nov 2026 07:32:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500236.1696470; Mon, 23 Nov 2026 07:32:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVOX6-0003IV-22; Mon, 23 Nov 2026 07:32:12 +0000
Received: by outflank-mailman (input) for mailman id 1500236;
 Mon, 23 Nov 2026 07:32:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xVOX4-0003IN-JO
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 07:32:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVOX3-00Cpdi-4S
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 08:32:09 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6b03ebf4-bab6-0a2a0a5309dd-0a2a4507e5f2-10
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 08:32:08 +0100
Received: from [52.101.48.37]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6b03ebf5-b4ea-0a2a45070019-346530251fd3-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 08:32:07 +0100
Received: from DS1PR03CA0006.namprd03.prod.outlook.com (2603:10b6:8:450::17)
 by SA1PR12MB7198.namprd12.prod.outlook.com (2603:10b6:806:2bf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Mon, 23 Nov
 2026 07:32:01 +0000
Received: from DS2PEPF0000710A.namprd05.prod.outlook.com
 (2603:10b6:8:450:cafe::1f) by DS1PR03CA0006.outlook.office365.com
 (2603:10b6:8:450::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 07:32:01 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS2PEPF0000710A.mail.protection.outlook.com (10.167.23.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 07:32:00 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 01:32:00 -0600
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 23 Nov 2026 01:31:59 -0600
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
 b=s/lcnuLGilnhVaRz96Ph1CE2OucrQ7jRqs7kkN+6ujr/bwp3/LHex2Qwauzp2x7UdRTsMhkybu+4/P+8JMwNWpzpo4SMZUeO69/i3c6LMkm2hdrlHOS0YqzaPTfE6VerH6lE+dGhMj+1SvVQngLVgmVjpkEeD41xPd2pkMtG03LW0TV8KUtUfL/aRmTgzlerWELRCDY6NJv0nWeneekgmQaAur85ga1cVa5C8ggknj3BXylze164jLrOXgSR35RanXwPSYRsLoUc+Furf6EJWMgjxFTEbBUMM+l0UVCcTykwiQoC7sQUkoGcWBtnbaSEEVBrJc0q5gTHCSsSrOQygw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NL1QXmSLIAEVW2tLzQRqDhuKJ1LBwy2M1jPZsf/RZcc=;
 b=BVON+em2a9Dwd4gNkiq3MXkoPo6Hx2LP2/CAdTMnahxUOEs0DATBrKxwZv3YrrstrTyUQ0x8cjSsPoei33Ufj73tIANBbqBE9ugval9esZcd04nJMUJz37ohtD28cDFafCLau/cP/KG0o0emyr4kX6KXlt7PhcMZYcVhuOLHgvijb1h2DnnGgi+9PtsZ4G0WVeU2txreAnd3OkD9PdPIqHVN+wfeANHw7B4WKVBhbfoEtRnE1r4owxnnqVKuy2Au+Cc93wwN8Ph0qv47fnLYL2LIS3h84QW+enK3R8sC1w0Q5RDXQ3bKhPZgVBWYBnvaNvgRFTA/LRpW2LRjWvACJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NL1QXmSLIAEVW2tLzQRqDhuKJ1LBwy2M1jPZsf/RZcc=;
 b=kh5ImBnkKAswEg0iQ6EWBHIKeAF1YqlMhd6UH3wWiaLH8cjzOi7CxCPaAFR2CsqGcAvMUsiy992PBjglS83rB33SBedVy/VmFIFiZdKiCiaudPrSQKRSzmX2gICkdmHA9UM2GCBqQe/Agd9/sCoekjxJamwPunFY1lwSlDk0upg=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <5d8f6085-3398-47d8-8eee-36e11e73cd56@amd.com>
Date: Mon, 23 Nov 2026 08:31:57 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: vITS: check the target vCPU in INVALL
To: Mykola Kvach <Mykola_Kvach@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <20261120193710.368311-1-mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20261120193710.368311-1-mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000710A:EE_|SA1PR12MB7198:EE_
X-MS-Office365-Filtering-Correlation-Id: 08ae5b94-d3b4-4a95-82d7-08df4933dcfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|376014|1800799024|36860700016|18002099003|22082099003|11063799006|261026121527099003|56012099006|261022105027099003|261026140227099003|261009223027099003|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	U7ZEqrkHp0nqVn8sQFgDvDwqjYaw7K76VI8bzKVMKFSn9wpU/RBK7EUfrCkcr9hIqdrbBy5vNsszXlCyECwHoTeCS6sGIlb6CbXc4b9QNpyO2eazxqqlDAsjdSwNN3tsRSqLveNmXbcViaOLoPSun8MChNaqkz5UtVlP6fnVzo3fr42hke8qEPNdxk6oyVt1bFZYIrC09A9BdJgS+KxxqC+Bcbfb7cnnTJGcyt0pOE8/KrYH7+qTL7saXj5HfAQVych2x8l1pjAXhO3OUCcTSgVkAoNXR5wSPaMAOrNGd5J8W4QI3UR/jErYkiIzS5rAqLLI8WMfnJuktkgwLDoD84GcUK0oTrjsH+JVRGDRFKQvhm6NrUytuSulGf8gsPhne9iN51TCRi5RofcicmYRkBhI16Yfz+X6Ipp52ymqFpn17goG869MFsz92k/kvlS3q5yJOZXllMUoQFZKQyMWI5s+ucJDoLdGFOvs/zDEZuj2Y+Qc/Fl8nGKnwh5sRmzx7asMiQ1TDImTx+RhesuUI219+WgrPgntNbc2KCxkxR2UmkicYYMFAXOt9xg1PlG/mSsHo/vZgNsTjvy48/cU9IZu5pEck0X/Wy6CMmFfENmM95cXRyl6DXpTD+qThYJIpzCfRIY3LqQyV3w5N6O4VNZ7xdt+14sQx2HfW/5mJI0rrJf0H9qTBw7XJ1keZyAH+nox1vjAmcAei2SK+YZmFw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(1800799024)(36860700016)(18002099003)(22082099003)(11063799006)(261026121527099003)(56012099006)(261022105027099003)(261026140227099003)(261009223027099003)(261028144727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eTnzedaD0kEEzfkdpWwkGCz2Fwumwi2kj7nkUlGLSJcp/wXi/umnPlxmrxvbOjAJflZaYdy8hrgl62sJHg+2Io/0G0C4fdMtPy8CEIXeC8NhFyHUwyITJHjnS2To801zfZcDA7o/O2Srg9skc4w5Nzq8U3afzvJv22b5KNMKOtI1k7BCkJq7oP7SPGDqvzhcWvqcyK6liOSEOpQDGWoD9fodgYk/b8Nhx/xjRvIPVEFvcng4wuAoofPc7aWGXH0osj23u+IsvnZ3hoJ4CHrBEtrVMJfVhQGk4/uEpWSLLzvgFxocXUGfs7D2ldwrG7nQ2mxxe6ktS+wzlUE+2bfA7mo9PNPK7Hg24cRzEGBsGfTKcp5dkp+ZhAXboy6EIkSwsgZWrUhVzYRX7I1PrasrZe9PJTPsyMvGmaWNCiZJ34DQVpmzQZwZ/P8sgisnYjIi
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 07:32:00.8666
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ae5b94-d3b4-4a95-82d7-08df4933dcfa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000710A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7198
X-purgate-ID: tlsNG-ef75cf/1795419127-36CDFAE4-58EF8F6A/0/0
X-purgate-type: clean
X-purgate-size: 528
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 20-Nov-26 20:37, Mykola Kvach wrote:
> get_vcpu_from_collection() can return NULL if the collection entry
> cannot be read or does not identify a vCPU. its_handle_invall() then
> dereferences NULL when taking the vCPU's vGIC lock, crashing the
> hypervisor.
> 
> Return -ENOENT to the vITS command dispatcher when the lookup fails.
> 
> Fixes: e975cca32bde ("ARM: vITS: handle INVALL command")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


