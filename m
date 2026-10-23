Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25351606A32D
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 10:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=104zltc9
Received: from list by lists.xenproject.org with outflank-mailman.1459119.1671202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKCt2-0004AE-Gg; Fri, 23 Oct 2026 10:52:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1459119.1671202; Fri, 23 Oct 2026 10:52:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKCt2-0004A7-Dl; Fri, 23 Oct 2026 10:52:36 +0000
Received: by outflank-mailman (input) for mailman id 1459119;
 Fri, 23 Oct 2026 10:52:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xKCt0-00048O-T6
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 10:52:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xKCt0-005KPL-9p
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 12:52:34 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6adb3c6a-bab6-0a2a0a5309dd-0a2a45069462-26
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 12:52:33 +0200
Received: from [52.101.46.51]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6adb3c70-195a-0a2a45060019-34652e3371f3-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 12:52:33 +0200
Received: from CH2PR14CA0024.namprd14.prod.outlook.com (2603:10b6:610:60::34)
 by SJ2PR12MB8718.namprd12.prod.outlook.com (2603:10b6:a03:540::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Fri, 23 Oct
 2026 10:52:28 +0000
Received: from CH3PEPF0000000A.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::34) by CH2PR14CA0024.outlook.office365.com
 (2603:10b6:610:60::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Fri,
 23 Oct 2026 10:52:28 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF0000000A.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 10:52:28 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 23 Oct
 2026 05:52:27 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 23 Oct 2026 05:52:26 -0500
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
 b=wLtp25724RDupFnBEsAKypbrjEA/pXhoVRUlHD3pUJBkRSF118uY689/3cLJtO/TRjICOqVsuNCUKVWjd5SuUx6jlDdP1IIJlRfKg2Hnx2QUy4Es1EdKixO6MjqirLqroQMq1eZZ/0JXLQU6WisxVHBUS+B5G29Qsbgw5YXGR5/JAj5+wEJMbxjVRi5NaJQd7WwmkEzx7B1TGWivHt6QjCAdi1Cb0GMingorNMGpol6lNN6KkgBL5Z2XiIhSDLpql0f6TaJeoWVIbTaKzLVIHJ5ZJhCb9A0eo/OzZZdkUjwqM5szABYZ55umMvJXM7G5TiZAWq5KUS+fnavJJjkS4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qcl2BdQpoSnalRbRZ10lzxEsEcEU0/DYvXRdD0A2BB4=;
 b=Joxi2wKegYdC5Swi+zj2WqxBtPy2SCPZfjMBRFLcH7/mo7p3belQuUam7O4LEOTAvKUWUrDxbbtwaplaJ30cXzqakVGzuXRbDckLH5c7RmtfnScx/4stYVoJ2qV4OPrjZkCcInWclFBs9klw8+38QbZ4twvIaW4X1NsF1zpoAiTG84rKJTmYVtp3eKjQwJKR2yF4Q7FzDkXkNQZYYtxFAzt+lDFIrUh/ZD4klddw9lw9Judag8JLk1euMpmoaRwXvD+GLlF7LnBKVwzR+wbC4amZLpEXKTKRBAqAz4W5u5ASTlejXyjdcOpy+UWikCIQ+8UBCx/LyYzfHaKmbKDhmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qcl2BdQpoSnalRbRZ10lzxEsEcEU0/DYvXRdD0A2BB4=;
 b=104zltc9pQetc9ew9yIV53KnobZSKENVpXw5ZVCLFJX09VGXeLH8hgCSVKUKns/9vk8BT+uSp1jI8wBzrn7D+5TPRcDql0+fncvl9926NVExa04PhGarqQmkOKrsvaIvmnvVwBiEP3kwTXnDcBWF/IV56aHe7M/Li8K49A3Twf4=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <16371f23-f892-4a4a-a612-d3cca0247f9c@amd.com>
Date: Fri, 23 Oct 2026 12:52:21 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] xen/arm: its: handle dma-noncoherent on GIC and
 ITS nodes
To: Mykola Kvach <mykola_kvach@epam.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1790707009.git.mykola_kvach@epam.com>
 <fb0674bdf222312b6ed04f3b6ab1a0cf58f05718.1790707009.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <fb0674bdf222312b6ed04f3b6ab1a0cf58f05718.1790707009.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000A:EE_|SJ2PR12MB8718:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a7cc58d-adb4-4f37-70d6-08df30f3bb09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|23010399003|56012099006|4143699003|11063799006|261009223027099003|261021121427099003|10067099003|22082099003|18002099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	uOfp+Pz2UfihNYMnQjNSwRUOZ0cgVWd84K1zhfTtEHQcgYe68vjkhhbMKqK5ND9vu/c3XS8jevnFwVC090WEBwGiHe8lhgFXHKatG1UkDGWleA9TdpRX3zU3uHV2WJ+IQ5XqGV2UmNGeTPZWYli4SZ9qOUxDHBzTEQJDpLu9NtuXP3elzvg5FiL4vYsR6aXUObJSJOqY9UmFARoqzBSXK3jakDB9desyZdVMIv3bGitdiMSa0oWgqwDxe1DhdPQoULAzFAzH/bapIHVYjj/lh5EFn8r/kSIWneYE4yls5hEogyHZaG0l61nOjaPwRpkyTyp62Izwvawd6BbLFf3pPdIgUz//G3mwECrt+Sv0gyqix1jl3QFoxRdy0qGX0yEuYomDGT9ZE4jWMs2/vf50Vm6U4g0OqwDuF4W24SqDdyavcQhEXL4jCviCsHi3EEx1so1thAQwgt78ZqOUEtvTNtzvR8IGliv9ksKupCC9rjGPYPLGEMWgUOB1t9DrB6i0nDvv538cR6F0Jcn/pNjpzZrXxD75qip3OvJdGDKPfP/zTeAlrm1dLFlh7N+H3/GWI2jsTTuC7jVOl2I3WkneKH8HdAxQoVuTJfZEjO1/CDlKSUk6so2QhPbjBpbCwnbjIcIhqBXY6U1yuPN1D56fwYW2Umo7htkE6LjtS+CKbUy8sr/L0mCeeo5Eyamn/5NrzIyJzx8eT7czB6cOD6Bwgw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(23010399003)(56012099006)(4143699003)(11063799006)(261009223027099003)(261021121427099003)(10067099003)(22082099003)(18002099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	e2yr/CAtF+iKH7owF8HiMowQgseDlibp/H0ECgIiMCHoZO6bgh2h4FELDAnpPxmouRairia5gKDZquBoJHY+Kr3eINkq0GRPMDJ8KI+vCDsZAQDYcb2qm/IwILMvYOPzsnNHxHv8w8yNkNXFwM3jG/I490NY1knz4WjzP/aCfScQMsIKfYOZx9PiwrCmABwaSkZYwKDrNXX66kvLi1Ukq4GU6jay0rpE1/3LR3MxolGhdTiyDHPefZmadeEweXFIouqCOtGx6epZQPkCtMeAJi8YV6ycmZbVcrT8/E5UKAqLAmyb2kaJ6JQ24wVTih2H8OUJoD43JXXprZR7cr08V1LGwv25f53I389JYObCMgvH+4SKs5XFZ1yflF7baDMZ1Ok/86ovYC6e9qP6fNi1ucn3hgCywuZ/A68BJN09rGKVii1tfGjYPZZUj6sDCB5D
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 10:52:28.2640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a7cc58d-adb4-4f37-70d6-08df30f3bb09
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8718
X-purgate-ID: tlsNG-16d1c6/1792752753-F7CCD77B-9ECFC86F/0/0
X-purgate-type: clean
X-purgate-size: 1193
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 29-Sep-26 21:02, Mykola Kvach wrote:
> The DT dma-noncoherent property describes the bus coherency of the
> device represented by the node. On an ITS subnode, that is memory
> accessed by that ITS. Add GICV3_QUIRK_MEM_NC_NS to the corresponding
> host_its and use it when programming GITS_CBASER and GITS_BASER<n>.
> 
> On the top-level GIC node, the property describes the Redistributor side
> of the LPI path. Collect it in gicv3_lpi_init_host_lpis() and apply it
> only to the host LPI policy used when allocating the property and
> pending tables and when programming GICR_PROPBASER and GICR_PENDBASER.
> Mark the function init-only because firmware attributes are collected
> only during boot.
> 
> Do not inherit the property between parent and child nodes: ITS-node
> non-coherency does not change the global host LPI policy, and GIC-node
> non-coherency does not change per-ITS quirk_flags.
> 
> ACPI is unchanged; this patch only consumes the DT dma-noncoherent
> property.
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


