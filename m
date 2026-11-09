Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E43607357C
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 07:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=oK7Lu21Q
Received: from list by lists.xenproject.org with outflank-mailman.1479620.1683544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQJuI-0000jD-3O; Mon, 09 Nov 2026 07:35:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479620.1683544; Mon, 09 Nov 2026 07:35:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQJuH-0000j5-V6; Mon, 09 Nov 2026 07:35:09 +0000
Received: by outflank-mailman (input) for mailman id 1479620;
 Mon, 09 Nov 2026 07:35:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xQJuG-0000iy-4s
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 07:35:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQJuE-002rQj-JK
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 08:35:06 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6af177a6-e002-0a2a0a5209dd-0a2a4508c002-22
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 08:35:06 +0100
Received: from [52.101.48.5]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6af177a8-f659-0a2a45080019-346530058338-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 08:35:06 +0100
Received: from BN9PR03CA0559.namprd03.prod.outlook.com (2603:10b6:408:138::24)
 by PH0PR12MB7012.namprd12.prod.outlook.com (2603:10b6:510:21c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 07:34:57 +0000
Received: from BL2PEPF000352D9.namprd02.prod.outlook.com
 (2603:10b6:408:138:cafe::42) by BN9PR03CA0559.outlook.office365.com
 (2603:10b6:408:138::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 9
 Nov 2026 07:34:57 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL2PEPF000352D9.mail.protection.outlook.com (10.167.254.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 07:34:57 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 9 Nov
 2026 01:34:56 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 9 Nov
 2026 01:34:56 -0600
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 9 Nov 2026 01:34:55 -0600
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
 b=GcaSfFmVu69dmr1r1OQBVEY7ebjl/atZqQ4F7hG7ZzlC2iSTstLDGqoSGjbwNeHav448UwVk0EMEbUWHVNDSM6hJtRacW4KULHzD1MG4yuAIY14UAIjEz48+Bqqt06ZDnrfbNYKJ1x4K37iaOXtQLTtjqCXMrz/MNQw18CC2pIItmrjZYowcuEGx+IoLdRZ4pVzsRPGk7OnhlyzXkxTS1Yx6DA9t9hBVkAftzOmFR8gbA1uhS/hYL93Ztood/SWHj4BAh5rf90njPL7R2a4JYFKFSdctoJXaPUGIDP62kV7nxn5eCovhWIyN8elGHPLxvW5DWnSMvesiaMHphNC2zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PsfowvyyPcPPxczp+yUm3mw/LEg9/zzxe532S6UERoM=;
 b=MtPDY2LwIZTpImjmBmnhvX+b5lK7GBxvmAbx1L+svfbBQxJiNMhlEHUACX8Xsrt5X6//fjbYocd+FBEssgO3F/S+tKYSgTOeHW+cdm1adlVCacs6+QVKix7iEHlxILKnbr7fRbWI8i39Hn7tD+9vYGrRrXRskgUZ6YFerG8P62bqg56PwtnGEyFuLYUejpANNE9eCqOdwMgijsJmD0AnBPOS/wkqluDvG3/ScKjUMF+NdJO0J7f2jWnKtFkBzZ8yCt6VqcgiSlK55DB8nlZnJs7txH99boZMB5Qs1p5ylWSLpm7YAeWnolEXk9ivsbPqgKmFmBx4V4nNHCUUYEnDRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PsfowvyyPcPPxczp+yUm3mw/LEg9/zzxe532S6UERoM=;
 b=oK7Lu21QzySsntAOXJxQE+5O4cCejXCU/uO9VVmva6VzmXIOcCkMGOhFb+lq+XTx4NHOfWMVCxfyBSCxSoD1gWoqyGRwEF6lklYXSj4n/k4M3+5o5o96jCr9byJXTOylEG3+33zynK0ou72ttuisKdc+2d15hL2zBsYX8fJp/CM=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <0f39082f-2433-4a2c-89c5-fec0828e3eed@amd.com>
Date: Mon, 9 Nov 2026 08:34:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/dt: Skip non-RAM reserved-memory regions in
 make_memory_node()
To: Kuan-Wei Chiu <visitorckw@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>, <bertrand.marquis@arm.com>, <marscheng@google.com>,
	<jserv@ccns.ncku.edu.tw>, <eleanor15x@gmail.com>
References: <20261028211737.17629-1-visitorckw@gmail.com>
 <10bc93f8-5ac4-4804-864e-d83a5fbf7108@amd.com> <auyzbMaKb2_Oul4V@google.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <auyzbMaKb2_Oul4V@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL2PEPF000352D9:EE_|PH0PR12MB7012:EE_
X-MS-Office365-Filtering-Correlation-Id: d3374274-066f-4550-b58c-08df3e33f42f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|11063799006|4143699003|56012099006|261021121427099003|261022105027099003|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	PFvL1fooKQBk5SYH8cMuJNXoKS+GfT4/lGH+WUjtHqk8OtFzWi6n6IhwDWEsIs7DG3iECRe5c+EhuSZrx5xqG87BqGumst3fGdYXTnQ4CfNyGTO+mnMay0/67W/IE4t7oltXBQZfX7lqOBzJRz0s8r6BKRAoIUm29T1Yz7sF4AgOCI/S5a69Gi+Z2wQQS4unKUV30CMQMdiXr6A41hwyNhqNemmneCy72R7ibx3fFCOjMY+I9ezMuGwG8rZZ0L+9T+vSjnfNZDB3JYpOWL+FvIl5uc1aeaNpmcKmlBWJ5rP1Y1wJoJF7uEVuM1rp6Soe5RtOXU3cAh413cbCFOgoZEUScOuHlercJ3hYdwdQZRzO+rrSggHib8HwbsGIhNAZ6AjATuvOQ5wUSNPPoKblnHpk3VvCNLHhBIbDIC0sBYDlHOU8GU/yvx3ovgSErefNQCak53HKV0htU8RNFNwV5Dn0JyurlaOVfqi0IHsbqIqBDyD8kZVTdVH/cyJMCkaZeSbmiIvKEHKk5HXOwHOmaVfuyupjXi4gvTLevt7Fh93d7D7fpSCBHFft/goe+/P6uDwtfeTzqfIxyShmqTBH+urhdu4QrYzRbE3DrZFHXo5pYHdoePaODJF6HEkP/fVk5RNE1WR2s8qJuJMeRMZZOLjSdRJ0mOKhmHQUDsWTFbXxROzim9hoqS/YMNxr23o8t6pJTxVO/oBbGiAlsbdD+w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(11063799006)(4143699003)(56012099006)(261021121427099003)(261022105027099003)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DJQSQjx6DEEtdEk8pNdJ9ZXMk7m8ss1hOq99hP3TMSX8WlxJYT2pdQxQwkk93HyxfnNvxenR7bXhvLOhVd7JZ9jDpbfdgfc01tMOKF2dHWDQ/7TH9sUICtpHTR4NQGC9NZiDOCSchfr+h19+em0zBnNPLSYIgayRtMahtDahMGBg4gs4RktUx1pe1moMwIle58e1olBcfvI9TAibAG43qh85pnCZLEZVz0dOuWd/uHz1uRhOrpQ8K0ni6dieO0ZMP/uNjpTRgb08Q28LyoPYnYg0xz9j0BkKEyGTggMJwOqnjRbCKWznqtRqjS+USOMPUWOKDAyIbuW6ZWNI393HQty8apJcrq8tPcO38Up7C/+IDo/Wmks/bdqUyz69GnGkUty8JXkr+HTXuNdJv6lPf0jvydh71S4oDQpiyklenAIsZF07uzj/SiL+8NRYuO3F
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 07:34:57.0490
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3374274-066f-4550-b58c-08df3e33f42f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL2PEPF000352D9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7012
X-purgate-ID: tlsNG-c1860d/1794209706-CEB4187B-F6E888C3/0/0
X-purgate-type: clean
X-purgate-size: 1479
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 05-Nov-26 17:48, Kuan-Wei Chiu wrote:
> Hi Michal,
> 
> On Mon, Nov 02, 2026 at 02:02:20PM +0100, Orzel, Michal wrote:
>>
>>
>> On 28-Oct-26 22:17, Kuan-Wei Chiu wrote:
>>> Xen creates a second /memory node for Dom0 from
>>> bootinfo_get_reserved_mem() without checking whether those regions
>>> belong to host RAM. However, /reserved-memory can also describe
>>> on-chip SRAM or firmware regions outside system RAM. Listing them in a
>>> /memory node causes Dom0 to register non-RAM addresses as system RAM,
>>> conflicting with device MMIO mappings.
>> It's worth adding a reference to Linux binding for nvmem-rmem as an example (the
>> only one so far?) of /reserved-memory describing non RAM. Please also mention
>> Linux comment at early_init_dt_reserve_memory().
> 
> Ack.
> 
>>
>>>
>>> Skip reserved-memory banks outside the host RAM banks reported by
>>> bootinfo_get_mem() in make_memory_node().
>> Have you considered EFI boot? There we don't use /memory and bootinfo_get_mem()
>> contains usable memory. IOW I think it does not contain reserved memory. In such
>> scenario, we would skip the reserved regions because they are not described in
>> memory membank. So it would be a regression in behavior.
>>
> 
> I'm not quite familiar with EFI, so I indeed didn't consider the EFI
> boot scenario in the first place. I think I should skip the
> is_in_host_ram() check when efi_enabled(EFI_BOOT)?'
Yes, please do so.

~Michal


