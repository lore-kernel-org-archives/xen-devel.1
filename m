Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD15606A326
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 23:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=pYWe+gik
Received: from list by lists.xenproject.org with outflank-mailman.1475828.1682333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP6b5-0005Y8-3W; Thu, 05 Nov 2026 23:10:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1475828.1682333; Thu, 05 Nov 2026 23:10:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP6b5-0005Y1-0P; Thu, 05 Nov 2026 23:10:19 +0000
Received: by outflank-mailman (input) for mailman id 1475828;
 Thu, 05 Nov 2026 23:10:18 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xP6b3-0005Go-Mb
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 23:10:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xP6b3-00HQwO-3X
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 00:10:17 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6aed0c92-bab6-0a2a0a5309dd-0a2a450bab5a-12
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 00:10:16 +0100
Received: from [40.93.195.2]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6aed0cd6-b7e8-0a2a450b0019-285dc302565b-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 00:10:16 +0100
Received: from BN9PR03CA0291.namprd03.prod.outlook.com (2603:10b6:408:f5::26)
 by SA0PR12MB4351.namprd12.prod.outlook.com (2603:10b6:806:71::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 23:10:11 +0000
Received: from BN2PEPF0000A993.namprd04.prod.outlook.com
 (2603:10b6:408:f5:cafe::5e) by BN9PR03CA0291.outlook.office365.com
 (2603:10b6:408:f5::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 23:10:11 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000A993.mail.protection.outlook.com (10.167.248.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Thu, 5 Nov 2026 23:10:11 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 5 Nov
 2026 17:10:11 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 5 Nov
 2026 17:10:10 -0600
Received: from [192.168.19.2] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 5 Nov 2026 17:10:10 -0600
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
 b=M8lwdeVne1ytgK12/an8SM1LpQPdZfbHOKG1bsuXHCl9BZZdLLz6DndWxIVS35y8BcqhDXymtTZ+4xvIGyWa/2luwgOvvMJMZitN2esU2+4vnis/Lb03Z8ZoedwPrvd2g4GFVqhgjnf6sYxNklBw0Nhc2Bh04zkoaySaU5q61n+jetMBv7/sHgvQvqEXezypKf0+aZPhDMI7stVgo+xNJZDLf5+KBeY9Hd/CcT4lE5i9X5nfQ9JscRDDdTN5An3xw+ochkq9i4snnmY6G1R8gUU9yEC3d0+Dw0QydIusLQ0d06j9sbVtfgd/Cr2TTZ+8hU/v8XIW+J1e46X4vknLRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BpV/afrcWR9sqTsx/NOCi/47YkrQc3asyulnlcV5SmY=;
 b=vRpw77Z9huQymHFoMm/H07SH03ZDJoK2EmWyGPeP+NDi8f238hVa0q+AgwBSlW+Bs6UEuoMqe/vjxHCISJiZM5D/+A4WYSo9QplCDaUv//0NtsDNO4r7BP3I4T28Kab1weEPo7e6zpG3fRORdMWd6r+nrexJuBVgvQQhZxB7qJGE1rJfexi8x5neij9ncjsHrDFNCkE1Y0HjAVCwrXvD679D2+iEkwjpV2XnRtnAY7YUcuQbN1JS2k+JKdPF8Vxa6U3p3bm7kqc+NEvFHt9shH+sFuYYD5Y7gbFOXIAKhDvhc5WJx1ndSDzCBLeuyXxWHYE2hMQvaU4L6WlVQigD3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ford.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BpV/afrcWR9sqTsx/NOCi/47YkrQc3asyulnlcV5SmY=;
 b=pYWe+gikQ1/QSksTSQnUEHVggTyz/+Gqm3xop2TDwaWI7QYCQ9zgbAnL6LWRqH7SWNBNnUAm7KzHCV0LpoPL/p5W5gJxQr8JCmrSizRTQr1L/OXpLk4CCmVrkcVh7HdrCVFK5MFSzTTapJLKOyAtjYave1s7XoTeztzDMoK3pSM=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <54e0b42a-845c-44c3-acde-6a965f5494d6@amd.com>
Date: Thu, 5 Nov 2026 18:10:10 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/28] x86/hvm: avic: add domain state initialization
To: <dmukhin@ford.com>, <xen-devel@lists.xenproject.org>
CC: <andrew.cooper3@citrix.com>, <jbeulich@suse.com>, <roger@xenproject.org>,
	<teddy.astie@vates.tech>, <dmukhin@xen.org>
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-5-dmukhin@ford.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20261105013347.719392-5-dmukhin@ford.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A993:EE_|SA0PR12MB4351:EE_
X-MS-Office365-Filtering-Correlation-Id: 21d10255-dad8-4f0c-0aa1-08df3b91f154
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|11063799006|4143699003|56012099006|261022105027099003|261021121427099003|261026121527099003|261028144727099003|261026140227099003|261102123227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	0i3szJOd9z/rLfEu8UgheGR5bmba5MsG9hFr4FuAoXFViEZg+f5DWKrrqkUfWaXXkuS0y8Uss46ELY+fws3P4vvk4jBgyKpm8Ly42l1VCCjmwnVmSOxpjjvrBiNYIrm4MT4sdV3nkPop0Be4AEA8mlMwM3pzPOx5RBYPL2SpTnjiyyOeb+0qXRQIey+r0JvNanxem8rlOUIdBoe13QfquA+aV82ZhMii2APsZmmozUmli7H+aKuUFs4WFHLqchXpq0d40KO3EfskzmxqbpYbEEVJdLCw/h2bwy6LD8parUm8S4JBBJ6sJD9xm2V2/KwraFXppq2G/aoumOGFW4ryC8XWBAsQBmaPPVjTHSP8EhhAkukSiowvevfuk6LU7EGY2DsPkm40sUyVT0hB852xbyOvJ+EDdDcAOyZMrEdmarDBQ0j/F9qvPG7sAeqDqRvF0NX8mWocglK+LPL+HO/IDIuRdKLcNF4ohC7k3ZTtdS6Rh667WGFL4luJ5GbXrPdjBVmL1ysnakoNnYreQ//aE+eqxtXgQ6G7jtkapmcIbUF6xGYCW3iLdQpc0EW+i4mYfp7GTXUWFklsZsH96+j6RAcMi8zoECLnUtSp9lXHgBGbF2gif7meoHNMqpPFvumdsNimyLZVIqsTRnzAgZUzuDxw72cimTjMOzZdjXgVrFG0KXMKtIyaGsO3lB4iYmCdj2J0+fKDAMpy9hx7yyD35A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(11063799006)(4143699003)(56012099006)(261022105027099003)(261021121427099003)(261026121527099003)(261028144727099003)(261026140227099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FWnu7WqR9NOzLAnbAo4f8bSgIMDRrRp1QPuFzE2weMWZfq+9JdhNj4KeJ8fQxId/CBcKy/Zz3MIObm/TA+3Y1Y2/vYyCNeE/3AnXs+WG3Ot/bkcvFkP6Vp3upp0rqKoRju4GhOVUi/bhf8y+XLSEgUycdWL6jM5y3hGUyj+PZW7L34NoM1ZEFxF31vesDiXQ0Gp7JdU/xSlZeMH0PfMaq98ar/urgjHEI0z+t3EAxzzFfQkFhdSK6x2gY4a4VTl4ihuaQTm5BC2rtI4QRANzArz+hfrFze8lUiY1HnsLBPPibNEMT9pfUOjG5cchl2VPrzA7RFcRYtN8Vl4OAYqCejVGrQdVIsHSMAAPTDRz3nm9Z7Yzl5tNN+zM9hhGFs4d7K6y44eHDupZthd/FA90RCtJ3KqR5r5lF1NDxs7pi9wbH+35yGBgRgXX/R40jUGu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 23:10:11.4576
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21d10255-dad8-4f0c-0aa1-08df3b91f154
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A993.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4351
X-purgate-ID: tlsNG-42698a/1793920216-ABED69EA-F2D7AE58/0/0
X-purgate-type: clean
X-purgate-size: 1005
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-04 20:33, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Establish per-domain SVM AVIC backing page mapping and SPA mappings
> for APIC physical/logical ID tables. Use MEMF_no_refcount mappings
> similarly to Intel's VMX APICv setup.
> 
> Gate per-domain AVIC state initialization behind 'svm_avic=' command
> line option.

AIUI, "-" is preferred, so 'svm-avic='.

> +
> +/*
> + * Enable guest accesses to APIC_DEFAULT_PHYS_BASE.
> + *
> + * AVIC walks the nested page table to check access permissions, but
> + * ignores the SPA from the leaf entry and instead uses the address in
> + * VMCB.avic_backing_page.
> + *
> + * Install a mapping so APIC accesses don't trap to Xen while xAPIC is
> + * accelerated.

Maybe:
"""
Install a mapping to the shared avic_acpi_access_page.  This populates 
the nested page tables, so APIC accesses don't trap into Xen.
"""

With those two changes:

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>


