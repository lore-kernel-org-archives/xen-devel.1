Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29814606A32C
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 00:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=hPh8h1Pd
Received: from list by lists.xenproject.org with outflank-mailman.1495339.1694317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTpvW-0000Px-Ji; Thu, 19 Nov 2026 00:22:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1495339.1694317; Thu, 19 Nov 2026 00:22:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTpvW-0000Pq-G5; Thu, 19 Nov 2026 00:22:58 +0000
Received: by outflank-mailman (input) for mailman id 1495339;
 Thu, 19 Nov 2026 00:22:56 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xTpvU-0000Pj-8I
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 00:22:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTpvT-003w0A-DJ
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 01:22:55 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6afe4105-e002-0a2a0a5209dd-0a2a4504b1c0-34
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 01:22:55 +0100
Received: from [52.101.48.36]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6afe415c-b57f-0a2a45040019-346530249c76-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 01:22:54 +0100
Received: from CH2PR03CA0016.namprd03.prod.outlook.com (2603:10b6:610:59::26)
 by SA5PPFB29794CA1.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8dd) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 00:22:47 +0000
Received: from DS8PEPF000000DE.namprd05.prod.outlook.com
 (2603:10b6:610:59:cafe::84) by CH2PR03CA0016.outlook.office365.com
 (2603:10b6:610:59::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Thu,
 19 Nov 2026 00:22:47 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS8PEPF000000DE.mail.protection.outlook.com (10.167.23.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 19 Nov 2026 00:22:46 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 18:22:46 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 18:22:46 -0600
Received: from [192.168.19.2] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 18:22:45 -0600
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
 b=o8ixKNk5J2CSYCxtEXlak3MZqudcbNtm+ohDsWqW9lCne4HBzB45FLfn2tj+KbzF6z+3NExQ12jGkEnC3hnG2bOyUkRs6zPr2HFjKFHh+XKU/az0FHtFNe63JKuE57UioZBLZY0FwS445iOKJrjh5WI1vHx+OkS0CCY3kkpCSkrc81gk+ClbmhiKCHhdkHwKvWuofEdPO/e2yZjjhIpA7fhFhV6p4ZaZAe0FxkSgsmJI5H/u2e1rGkGJlCs5CCIsQ1hZy6gil5l4Q5otxw3m5dsAQdIFJGwt2vs+lkrvuUUEwnuxQar0LqnZcNUcmcOTzVXlFPTXP8euHl+yNMGnEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K60405PsVnpFO5oZvPCRUFrgBeQMbHQfmkyDAIKnsRo=;
 b=eaHOX6yKTOytEGnjt19IP7tfNMjgbhQTaTHdGJLnuHZaUgaxo/rjEFOh/kWyf+JaQAuLF11MxFP+cGsbTPpNl7ORTQM+m8XvhKrR0GoFFmiCqzAcWxkGqWi6n+OXSeqKhIZL2xnJ0JkvsaVNds6vwaZQHvAkXItgHQtYmrNiSFkmrWAlsgmQHq4ksaJbBxYP+gq0QldpXQR2NCffSwQRgyTfLRWKiuc5ntlQm/HezeK+/sAtcNaj40hirNoZDkRYWNJR6vmWlz4DTcqyhr5+dYlfMe1ngze5tY5H+z6quDIHSRG9xpZQfOsRKvWAXFLh907tL1zO075nlqJ6PMAzFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K60405PsVnpFO5oZvPCRUFrgBeQMbHQfmkyDAIKnsRo=;
 b=hPh8h1PdwrdZPRFa9UnFbt5TliC7ZY1/tI2cFxIlJvDr/tiyUFFMHT6SmZaGQ8xp01FTi6xAygK+KjORBqxiwCqeCtJWVX0UfaK/XBeFteorOqcSGY6oQ2PVCaoBpRpAYel2hrYnPRBZNzE7GmXZ1zxdtVBcSyE0Rdihaj78NtA=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <76b41d7c-5f96-40ef-894a-1aacf59873f9@amd.com>
Date: Wed, 18 Nov 2026 19:22:27 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/efi: Handle efi_memmap with Xen relocating itself
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, Teddy Astie
	<teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>
References: <20261118005021.2809-1-jason.andryuk@amd.com>
 <636449ed-4444-4d9b-b592-c53686178516@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <636449ed-4444-4d9b-b592-c53686178516@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS8PEPF000000DE:EE_|SA5PPFB29794CA1:EE_
X-MS-Office365-Filtering-Correlation-Id: c70f021a-7ca2-4680-551c-08df45d33cb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700016|23010399003|82310400026|56012099006|261022105027099003|261021121427099003|261022113327099003|4143699003|11063799006|10067099003|261026140227099003|261021123027099003|261026121527099003|261022075727099003|261026130827099003|261026135527099003|261021135927099003|261022115727099003|261028144727099003|261021130227099003|261102123227099003|261021133027099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	kNdegZpFtManN3W1DYKv6uKsPoApdYnA32wqXVrwh1uRm4qW3COW16rDrSWYy1aqdqf3rD4Cp2NTAqGV7TpqLlXfHwhGWP9/Xm5CcVZCWHS52ezmifEfZL/zyB0P5+73caR7gPoPoREzkaAp8BFQjZKGXeDtGsGKKHPELFxF42ZmbKAJ2KDh8aEn6vRIC2/BmHcQ4OwtlNVEaviQGJmgstLpyP5hFvBrXJlds4/quclymRwdoVEkhYu1s0jb230Anylf7r+t8+oCanA9080G08wrm5BBzfkv4BB6v8mE2wSnJy3GZLnHktqb85pHSYZmghqhR93gQ0S0svFYE6hWYEWcKetHSFrWmt9FI/QpmLH0wN0guUXnmm8XQYoby1491u+Evomqa1SxO108PuICHDzEpOAddRKgQ6Fg6p65OqblVS89s9E0LyzdIqiwiSpN1bqhffe3WqSzM4oIHfFJrJKO9AXPIiYY+oP0fAr0bMhYVTLb6Gs3g4fX3F68z9JDrhpeEdVHWTjOv0GIcb4pK6NH+O6noYt1Z1ex52BY6A02ADILKvznEYrJwxB18WIeZDGkAb3o3287zZhzoi4iQpyIfC1MmS5gjDXVbwCoXDoSj4f0sLpC+wNNKtwtdyhH7x1M64NOFs/7B88zojWFLro/kXOGGb7LCzT56yF81rp377HoN+8Yd3B2ZkCAH4/Lx8Nx6Sk7ipIO5K8zLisG1w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700016)(23010399003)(82310400026)(56012099006)(261022105027099003)(261021121427099003)(261022113327099003)(4143699003)(11063799006)(10067099003)(261026140227099003)(261021123027099003)(261026121527099003)(261022075727099003)(261026130827099003)(261026135527099003)(261021135927099003)(261022115727099003)(261028144727099003)(261021130227099003)(261102123227099003)(261021133027099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8DbVCLBA6aoZvr4WdvW+62OslaCVBriuaLCZg3b6x5mqSVp8WbBKceHwcdLU1QpSy6f2pgevLwAASQ+s1dGq/fWl/zLhr8mM4BTi16r2CoiNjGu4BvHA9+QRm/2nxoygaJyal8NtTypQLosg3SvgWy8WwwpywAsZ3G58Q86PkgcMoQhbBQMUnNfFDNSDjFTLirkzsj5grUM2e8RBVYwuE3RO6NHgX+UHzdmpvOmlMmuDeimc+2vqGzc7q2WBa/OtM0zMEuNXK0jhmcqa1JLljJutWO/u4u9UTSo5tJvDrVgYueiCpCoYETIK9rdNkFFSEe5QMEEuA7AP1zTLwyevoGU2hUllqBJiBFrDe5YH52lvS5+AnhnBuqhTk1SE9JXrirSiPri8Ag9WvDjrjfWG2APTLT1H5NVAoSW6OOYzS0eyjh06ZnhIRRd1AB5ROEz5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 00:22:46.7736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c70f021a-7ca2-4680-551c-08df45d33cb1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS8PEPF000000DE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFB29794CA1
X-purgate-ID: tlsNG-ebf023/1795047775-C14D3B50-57F89E81/0/0
X-purgate-type: clean
X-purgate-size: 3642
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-18 03:14, Jan Beulich wrote:
> On 18.11.2026 01:50, Jason Andryuk wrote:
>> With Xen booting via Multiboot2/GRUB on an EFI platform, and modified to
>> use MULTIBOOT2_LOAD_PREFERENCE_LOW, Xen relocates itself with
>> move_xen().
>>
>> However a PVH dom0 shows:
>> kernel: Failed to lookup header 0x77ffd000 in Xen memory map: error -3
>> kernel: ACPI=0x77ffd000
>>
>> ... for all the Xen efi memory map lookups.  Dumping the memory map at
>> runtime showed it was scrubbed.  Because Xen relocated itself, the
>> original physical address referenced through a directmap address goes
>> stale.
>>
>> Add efi_arch_mmap_buffer_virt() to convert from the initial value to an
>> appropriate runtime value.  ARM uses Boot Services AllocatePool(), so it
>> must continue to use DIRECTMAP_VIRT_START.
>>
>> For x86, we use an offset into the loaded Xen binary at the time of the
>> call and add the to XEN_VIRT_START.  ebmalloc() allocates from the Xen
>> image memory, so it moves during relocation.  xen_phys_start is set for
>> xen.efi in efi_exit_boot(), but not for xen.gz, so it cannot be used.
>>
>> Add a generic helper using `lea __image_base__(%rip)` to get the current
>> load address, and use that to calculate the offset into the Xen image.
>> That offset is also valid from XEN_VIRT_START.  Ensure the value passed
>> in is within the image.  Use the generic helper to implement
>> efi_arch_mmap_buffer_virt().
>>
>> Fixes: c5b9805bc1f7 ("efi: create new early memory allocator")
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>> I think it could be seen without MULTIBOOT2_LOAD_PREFERENCE_LOW if xen
>> chose to relocate itself.  But since grub usually loads xen high, it
>> doesn't relocate itself.
>>
>> _end is already calculated as a rip-relative address by the compiler.  I
>> still added an inline asm to ensure a rip-relative value is used.  i.e.
>> I don't see why the compiler couldn't insert the absolute value, if it
>> chose to.
> 
> It can't, as then it would violate the -fpic that we pass to it. IOW it's
> really the other way around: In asm()-s we need to be careful not to
> violate compiler options in effect.

Right.  Thank you.

>> --- a/xen/arch/x86/efi/efi-boot.h
>> +++ b/xen/arch/x86/efi/efi-boot.h
>> @@ -219,11 +219,35 @@ static void __init efi_arch_process_memory_map(EFI_SYSTEM_TABLE *SystemTable,
>>   
>>   }
>>   
>> +/*
>> + * Convert a runtime 1:1 physical address within the
>> + * Xen image to a Xen virtual address.
>> + */
>> +static void *__init efi_arch_image_phys_to_virt(void *ptr)
>> +{
>> +    unsigned long load_base;
>> +    unsigned long load_end;
>> +
>> +    /* RIP-relative address is the current Xen load address. */
>> +    asm ( "lea __image_base__(%%rip), %0" : "=r" (load_base) );
>> +    asm ( "lea _end(%%rip), %0" : "=r" (load_end) );
>> +
>> +    ASSERT(ptr >= (void *)load_base);
> 
> Hmm, is __image_base__ really the right anchor? move_xen()'s memcpy()
> only covers [_start,_end).
Yes, you are correct and _start is a better limit.

With your comment above about -fpic, _start and _end will be 
RIP-relative.  We can avoid the inline asm and do:

static void *__init efi_arch_image_phys_to_virt(void *ptr)
{
     unsigned long phys_start = (unsigned long)_start;
     unsigned long virt_start = XEN_VIRT_START + XEN_IMG_OFFSET;

     ASSERT(ptr >= (void *)_start);
     ASSERT(ptr <  (void *)_end);

     return ptr - phys_start + virt_start;
}

Avoiding the inline asm is nice, but retaining the inline asm make it 
explicit.  Thoughts?

Regards,
Jason

