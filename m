Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5D4606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 01:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=UGBfp9Pm
Received: from list by lists.xenproject.org with outflank-mailman.1493503.1693471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTUHT-0004Rg-Vw; Wed, 18 Nov 2026 01:16:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493503.1693471; Wed, 18 Nov 2026 01:16:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTUHT-0004RZ-TB; Wed, 18 Nov 2026 01:16:11 +0000
Received: by outflank-mailman (input) for mailman id 1493503;
 Wed, 18 Nov 2026 01:16:10 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xTUHS-0004RT-Fk
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 01:16:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTUHR-001ds6-PG
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 02:16:09 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6afcfc15-8faa-0a2a0a5109dd-0a2a4507df02-22
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 02:16:09 +0100
Received: from [52.101.57.67]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6afcfc58-b4ea-0a2a45070019-34653943565b-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 02:16:09 +0100
Received: from DS1PR06CA0001.namprd06.prod.outlook.com (2603:10b6:8:458::11)
 by PH7PR12MB5901.namprd12.prod.outlook.com (2603:10b6:510:1d5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 01:16:00 +0000
Received: from CY8PEPF00000056.namprd05.prod.outlook.com
 (2603:10b6:8:458:cafe::af) by DS1PR06CA0001.outlook.office365.com
 (2603:10b6:8:458::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Wed,
 18 Nov 2026 01:16:00 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY8PEPF00000056.mail.protection.outlook.com (10.167.247.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 01:15:59 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 19:15:58 -0600
Received: from [192.168.19.2] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 17 Nov 2026 19:15:58 -0600
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
 b=NZSPWUz+8n21punZ7xx7EYmUTpehWYRUjnZYYg7cr9hCgRYugocMFKv9ISz+B67MdClj3+CvYUZ/14yv44a8W9p63cvyC//HOLjnm613KL5Fx5JsBVFoQXqNr/LMcCsxwZYpACq0dWS7D0AZlfPEyrVvabZ1OHiEycChmw24KK8n9GNKWkG3wRysGw2uLKwJavDNTYhjapENmgJvUA+Y+bBtJRlCSuMmNw5MZE0woa459RPbxFnZesvUZUVFgj7OVLNYf91f+qhcKoLStaq/YL9O59faz62DgzvGALZyRSVy8HSHgl1IIfMj1XXeP3GFHRT3jitnFVcffa5pPPRKWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7tnln+QhO+xZpIzT0Ind+wT57cvYdAS/6n8WIGh/NKc=;
 b=NaBx90s3rSGmRVgEM9Kr/2T+4q67NRlgLRej5niwMINLREDWvQh2RUx30M21bfsfoENDA1VzBIkSvl0aRNwG2OyVYSmBOHmsSPhFN77xpzbezylRU4tyHspMSDSqhHL/cLAZ9TJ/iUubW+rAaaOaefpMhm6H9m9QDeuNBRI6ftnrO4YZDCsYXj0/V4k2+jaz3mHgYYhBnOAUYkka6aSNrdsK0+UxSStIamcz6W1lCvGZ1eJ3jYzu1i+YljXXiSeGHZ4AOxSpiazcbD8IZM2kR8xvp7sgcIfgjzD59Q3B9XNE1hkRkI6RrMMYIWkMUeDtibto38rkQ4iZmpoE/ks43Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7tnln+QhO+xZpIzT0Ind+wT57cvYdAS/6n8WIGh/NKc=;
 b=UGBfp9PmhrJN6y9jLSpptPD+uIurrSBSbsOgGz5EB/fXDqbsxQxwKQYe6nkEhT92PsB7o3OuwHmiBRorQiybjhiHl52tyvy4DstxxVVfLvP/8ZLCqMrkiz8NbGt1Ovg8WtbC+X9Oj2ccIjuLVS6MVj36yRfiS84h0YUALeTnPYM=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <f4fd77a4-bdf2-4d29-bc3b-c8ce314f7385@amd.com>
Date: Tue, 17 Nov 2026 20:15:57 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH 1/4] libacpi: Build TPM2 tables for the TIS interface
To: Jan Beulich <jbeulich@suse.com>
CC: Anthony PERARD <anthony.perard@vates.tech>,
	<xen-devel@lists.xenproject.org>
References: <20261106231526.482418-1-jason.andryuk@amd.com>
 <20261106231526.482418-2-jason.andryuk@amd.com>
 <6213ab52-73ad-46d8-83eb-0ab7161b2a8f@suse.com>
Content-Language: en-US
In-Reply-To: <6213ab52-73ad-46d8-83eb-0ab7161b2a8f@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PEPF00000056:EE_|PH7PR12MB5901:EE_
X-MS-Office365-Filtering-Correlation-Id: 65b05881-f456-41e5-25da-08df45118148
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|23010399003|6133799003|18002099003|261009223027099003|22082099003|261022075727099003|261022105027099003|261021130227099003|261021135927099003|261021133027099003|261102123227099003|261026130827099003|261028144727099003|261026121527099003|261026140227099003|261026135527099003|261022113327099003|261021121427099003|261022115727099003|261021123027099003|56012099006|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	l3MrpIVIShcMzIkQLQvqLCCIf4N89MpHYqaVKjjdv0ARPqTglCwO4zMrU3NqMWmRrOQlVFhpIjISIPr+/nEHyluF9kh1oUYK9WouQUXexLZKkro2Et4vE5LwVe1z1uvQAu8WJQVnGi/98jwACTd07nhrorK+/+WfPqTDxZ9Gq9QTenXrSyG/BymFs5PJCkRlk2MyEZxffVbKvXqYdrpRVwiaBZSJsW2ObO+NkF2qdwnboHo6wlskrgh8YxsQDOZvMKrhL8YJP7vg8jsRilRIBO23q/rY8yJY+bTDhqECXmp4k6RUfAU6B4Z4l6HGtpuV5TlncgXiTOAhotSXf/fzBLhMSRR8wiBKg/uV/nmlIaXIO/qC9jpHikx1rcbow/jMPtiapquXGsixvFjDO8z7fQWcu2G4K88M81bpjIkN+r/+FBqF7acY54B8jzbE+L/JM00D0368t3aUB9Trg24raNcyDWSBKJEKwggaBjxjIUIFw2ZOWkB00qU0bwzI/p3aiGCKAwD7Huhro73MH3y16beZ2vt4uPhAqZQ21INbcewMlIn9kyW9CEfya3y/g6E1uvViZOJ/xs6AUcxr1Y/VLxKgx80vYb0OgkLSdrs2I9XIh+FTIXYxzkpegUKV9ZQiNCMPoxR7mb3ij8mKmF3gLRayCerKa+fTHoKK8xZ7RBvN4ctRrjJCS97CQfBf/xH0LednvpDem6KoerS8+BOKtA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(6133799003)(18002099003)(261009223027099003)(22082099003)(261022075727099003)(261022105027099003)(261021130227099003)(261021135927099003)(261021133027099003)(261102123227099003)(261026130827099003)(261028144727099003)(261026121527099003)(261026140227099003)(261026135527099003)(261022113327099003)(261021121427099003)(261022115727099003)(261021123027099003)(56012099006)(11063799006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9rtKt291F7LBL1gTPAfPLnPxnqCsQJYRIZk6KfTfjqlG61vhOBHQXZBEaJR8MtPHZg2W8wfQULYUNe0z6u/2I1tjrMgeB74yTMhhGbactCEzGMew+k4wsK1vH+aa3jOXqWTANvr8u6jSrxzZnPyNykgU2IgJF47QYx2PQeAXWKEVy2VfiHJjYswGK9KAgC0FN8Cd6l9dwDYcAikGXt1idp/O/mz0gCfKuNnNZqOHw6rj5d/xNcUwHNv1poYLx7FN0ETQSMrVkdLR4l3X9egL2+jlWPVBlQwSTbA+YmGCOG8Ds1T2xwTKowuTpgENN5N4M7zN1lw5FU1QhW0dICTUds2lEBGuqH842OsU3a37wJVkXUgk5GMkSyllGRvhfZUOhvw5fx5ZbVtHTNqE0VYnmQ9fd0kzdogUbxkJNm7/a7YtJ/sjrTgVpx1ly7gKdmHI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 01:15:59.4788
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b05881-f456-41e5-25da-08df45118148
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY8PEPF00000056.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5901
X-purgate-ID: tlsNG-ef75cf/1794964569-36AD8AE4-9963800D/0/0
X-purgate-type: clean
X-purgate-size: 4205
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-16 08:30, Jan Beulich wrote:
> On 07.11.2026 00:15, Jason Andryuk wrote:

>> @@ -444,17 +445,30 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
>>               break;
>>   
>>           case 2:
>> -            /*
>> -             * Check VID stored in bits 37:32 (3rd 16 bit word) of CRB
>> -             * identifier register.  See table 16 of TCG PC client platform
>> -             * TPM profile specification for TPM 2.0.
>> -             */
>> -            if ( config->crb_id[2] == 0 || config->crb_id[2] == 0xffff )
>> -                break;
>> +            if ( config->tpm_interface == ACPI_TPM_INTERFACE_TIS )
> 
> Better use switch() right away?

Well, I don't expect there to be more than these two on x86.

>> +            {
>> +                if ( config->tis_hdr[0] == 0 || config->tis_hdr[0] == 0xffff ||
>> +                     config->tis_hdr[1] == 0 || config->tis_hdr[1] == 0xffff )

I'm going to add a prerequisite patch that moves this probing into 
hvmloader.

> 
>> +                memcpy(ssdt, ssdt_tpm2_tis, sizeof(ssdt_tpm2_tis));
>> +            }
>> +            else
>> +            {
>> +                /*
>> +                 * Check VID stored in bits 37:32 (3rd 16 bit word) of CRB
>> +                 * identifier register.  See table 16 of TCG PC client
>> +                 * platform TPM profile specification for TPM 2.0.
>> +                 */
>> +                if ( config->crb_id[2] == 0 || config->crb_id[2] == 0xffff )
>> +                    break;
>> +
>> +                ssdt = ctxt->mem_ops.alloc(ctxt, sizeof(ssdt_tpm2), 16);
>> +                if (!ssdt) return -1;
> 
> ... the one you re-indent could be corrected as well. Actually, can't
> we consolidate both allocation and ...
> 
>> +                memcpy(ssdt, ssdt_tpm2, sizeof(ssdt_tpm2));
> 
> ... copying paths by way of having another pair of local variables
> (pointer and size)?

Yes, sounds good.

>> @@ -471,8 +485,17 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
>>               tpm2->header.creator_id   = ACPI_CREATOR_ID;
>>               tpm2->header.creator_revision = ACPI_CREATOR_REVISION;
>>               tpm2->platform_class = TPM2_ACPI_CLASS_CLIENT;
>> -            tpm2->control_area_address = TPM_CRB_CTRL_REQ;
>> -            tpm2->start_method = TPM2_START_METHOD_CRB;
>> +            if ( config->tpm_interface == ACPI_TPM_INTERFACE_TIS )
>> +            {
>> +                /* The FIFO interface has no control area. */
>> +                tpm2->control_area_address = 0;
> 
> There is a memset() earlier on, so only the comment looks to be needed
> here.

More local variables streamlines this away.

>> --- /dev/null
>> +++ b/tools/libacpi/ssdt_tpm2_tis.asl
>> @@ -0,0 +1,25 @@
>> +/* SPDX-License-Identifier: LGPL-2.1-only */
>> +/*
>> + * ssdt_tpm2_tis.asl
>> + */
>> +
>> +/* SSDT for TPM 2.0 TIS Interface for Xen with Qemu device model. */
>> +
>> +DefinitionBlock ("SSDT_TPM2_TIS.aml", "SSDT", 2, "Xen", "HVM", 0)
>> +{
>> +    Device (TPM)
>> +    {
>> +        Name (_HID, "MSFT0101" /* TPM 2.0 Security Device */)  // _HID: Hardware ID
>> +        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
>> +        {
>> +            Memory32Fixed (ReadWrite,
>> +                0xFED40000,         // Address Base
>> +                0x00005000,         // Address Length
>> +                )
> 
> I know you're only following what we do elsewhere (i.e. this isn't a
> request for you to change anything), but I wonder how we could make sure
> that such seemingly arbitrary address range allocations won't ever
> conflict. (I assume the base address is dictated by qemu?)

Yes, it is a hardcoded address in QEMU for TPM-TIS.  More generally, 
0xfed4xxxx is standardized by the Trusted Computing Group for TPM TIS on 
x86.

ARM defines assorted GUEST_* values for ram and mmio.  Something like 
that could be done for x86.  Though using them in an .asl file isn't 
friendly.  TPM_REGISTER_BASE is already a define.  That could be placed 
in the comment at least?

Thanks,
Jason

