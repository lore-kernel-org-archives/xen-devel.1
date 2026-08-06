Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E86C55ABF
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 13:59:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384813.1627584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrycQ-0001ws-Qa; Thu, 06 Aug 2026 13:58:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384813.1627584; Thu, 06 Aug 2026 13:58:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrycQ-0001wl-Ni; Thu, 06 Aug 2026 13:58:46 +0000
Received: by outflank-mailman (input) for mailman id 1384813;
 Thu, 06 Aug 2026 13:58:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wrycP-0001wf-90
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 13:58:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrycO-004Qcb-8j
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 15:58:44 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a749302-bab6-0a2a0a5309dd-0a2a450cd4ce-34
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 15:58:43 +0200
Received: from [52.101.48.35]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a749310-f479-0a2a450c0019-346530230f97-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 15:58:43 +0200
Received: from BN9PR03CA0424.namprd03.prod.outlook.com (2603:10b6:408:113::9)
 by SJ2PR12MB8881.namprd12.prod.outlook.com (2603:10b6:a03:546::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 13:58:35 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:408:113:cafe::11) by BN9PR03CA0424.outlook.office365.com
 (2603:10b6:408:113::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.21 via Frontend Transport; Thu, 6
 Aug 2026 13:58:35 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 13:58:35 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 6 Aug
 2026 08:58:34 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 6 Aug
 2026 08:58:34 -0500
Received: from [172.19.79.34] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 6 Aug 2026 08:58:33 -0500
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
 b=QNyqNc4cNXJqFGmKKpucAn7dxtzWQR8l6bC4Y3MPmh0hmf7bcYwKK667TyeY/j7z/ZdICMnkFKUFhpo6om4DDdiCZ0nHatHfzNVaD03tU5ZqEIlRY9JZWUX1zSLIIxZvPKvAkuFvu4LQpzkG62hy99hNu8m+FIB/a9VdCpuQwDBBgO2enaaU/HilQE6XkY06pzPEN0XUofCNIRVqLc7btYW3LKo+24LgUGl+YoTvT3m/MhVor4JlwqPG8tYag7M/xuH8p6bx4ioWxWI64ruYLkPnJ0TjDHP3QkxyTGQkv4xWnzbwD9VU4DU9dkA5sXnFolFtC6xGkIuzxqmZI819Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ps0ZJGdu/nNFySK1kD7HgjTQDo++3/DWtEi+//fDIvA=;
 b=y45vNvRTpJTLmAyxbxs1GOR64tC3WT1RCLBufVbf9Z2ZZJ5BkOaq95vfF5bztfDuuR1oqigzQ+R1vkA6HCORlsnv2rVSZ0MxgvROqJpaI/JY+veZa0E7TUgz3RIQJp55IjDynhHP4EqtGHtbwaY2w+5pQvUH42tArG1GrI0Q1wZoEBW8vFZLZYIMcPGDb3s3vuI+OE80H+IVVWg1O7tpl+K/QaH7zsHo+6XRyIZino2X7IiChn9hrqdPouBzfIe/prFMMqZTbaRi5vUtAGyEyEA2ff/u5DxPA04sDEZeE+SG0h0Tpoh3JLwy+Mp1WGYZe1HnTBROVwU4GgtpKY8zrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ps0ZJGdu/nNFySK1kD7HgjTQDo++3/DWtEi+//fDIvA=;
 b=Upl9+7iGl29zwCjUP5s0SPMrBRyKu4T/wFl8XgW6K+USwxpWSmQ91M19G6Nru8l6rsddT/KAVcJnFAHr9UYS3tNxgF+5/+J3GuWDOKDjJqLt8A93WjZ509l3MubTI8SrnNvY+0Bj1fG0eUCtylzSUKEZrsqY/bXkHN8NEKArrXA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <9f2588a1-b585-47dc-b825-993c31ab3fd6@amd.com>
Date: Thu, 6 Aug 2026 09:58:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] xen: Fix PV-only build
To: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>
References: <20260806015233.202486-1-jason.andryuk@amd.com>
 <083db883-558a-4000-b404-bf170c8309ee@suse.com>
 <62b5117f-928d-4908-9217-cc16d9cf15f9@suse.com>
 <967208c9-8d51-4380-8cb4-298f5c313d35@suse.com>
 <a6c55f20-c5cf-45fa-beb8-532fe3b95270@amd.com>
 <3206813c-33fc-476f-a553-4d3f319459aa@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <3206813c-33fc-476f-a553-4d3f319459aa@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|SJ2PR12MB8881:EE_
X-MS-Office365-Filtering-Correlation-Id: f3c6461b-1d28-43cc-22d0-08def3c2cebb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|82310400026|376014|23010399003|1800799024|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1CP4srme/UHBIZGwwigWh27iMkxSgnH8KnZR+Z6lRwdzyEmO3jDsL7g11H20DH0zJsmSrYWXu87oRXUtKsqf0dLK2KR4gMaxOCUyR59I6RiZKVfIcnaPouPCIfx+dVY5w+qyO2mNmpXKQ2UVJys+szvD82NptQxc05IhBzjErmRQqCUsU2zDe5yekVHNIu0S/QWpiPV/eOA0sZwC16Jb3RZ60EShNLZLsqCWcV+i3mhw5NBYkU/c9lKl5Xf6yAcovk4kughjseetQK7qNZC42xNLWr5rf1iPsmKYrMC2qGrpKEOZ9iOV7JzLJm7+/+OFlyDTa8+OeJfljZMdUzyhxVqo1is2D/sZC108QL1/zqqn/3b/zLPpf0nMXAsTB4khuGGh8TaE2zTdXlUO9hdrONtg+789oTPnXO67opkquXHqcI/HmUZ18Z94p4Ukmh1ivtGHope3p4qD8+8C/XxCHx4KkrPIuxDxumNpr/5IqWZ8afzjjuL0jm+BkF+nfVuhQXfOHA7HF99hHTkh6X9QqnPFmiTdhx4GkITiUTG6hIfkEJKr4BsNsI3RJNZ9rDB/JM7dicyuuEO6UGdPCGJFKrhFH92AiTKbbrFp3vH0SxsgnLbe2A6xmxxyC6vINFIftzGRFC0cIlXOaE7L59YoU5/94uRAb/xYi4AY5UHLp9Od+JMYTUK7JHasP+9AO3AQ
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	k1G1CMbkAWeDRKUcpL9U6a5ZkMlBqQ0lfIdWEzQs9SEm4hCMYmfZRAbhdBN5Pl8WilMkQ6vJKypVT69PSFkwm4Deex68hAFC2yALUMJ5HAZQdKZd5WrbSSUb1QsIrFeOMHcHbOKoGJoHAaRZ2oFdHf+8B20MzpP1Tl7EEP5VCxm5u1eNSQ62JfIQeSQaiRYIW5NAKAYZJ1rHFdgprnkNvVmoLI3g9QlKVtIRsjV2wfNKIeQB/+nevp+IuP51sIeJMA+UplboLDt4dytCv0vPoVLKhRraMEUXFegGXKT5yhs6KkqH6guTrjP99MdQUIfm7isrpITGGdolc+jdKHHMbrVB/lMkNUwUcuhjOcpOD8IgLHdZZs6ZZkF9hsT22EOvswAFal71mTlsZitArm6k7VfKBZsBkbGU46pvPVqUHG0KowWrKJJuH0+29JKLEuQS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 13:58:35.0349
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c6461b-1d28-43cc-22d0-08def3c2cebb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8881
X-purgate-ID: tlsNG-d25034/1786024723-77ED2A5B-765E4CD0/0/0
X-purgate-type: clean
X-purgate-size: 2175

On 2026-08-06 09:31, Juergen Gross wrote:
> On 06.08.26 15:24, Jason Andryuk wrote:
>> On 2026-08-06 08:00, Jürgen Groß wrote:
>>> On 06.08.26 13:31, Jan Beulich wrote:
>>>> On 06.08.2026 12:55, Juergen Gross wrote:
>>>>> On 06.08.26 03:52, Jason Andryuk wrote:
>>>>>> Allow disabling XEN_PVHVM for a PV-only.  A stub in the event channel
>>>>>> code needs to be fixed first.
>>>>>>
>>>>>> Jason Andryuk (2):
>>>>>>     xen/events: Fix xen_set_upcall_vector stub
>>>>>>     xen/Kconfig: select XEN_PVHVM
>>>>>>
>>>>>>    arch/x86/xen/Kconfig             | 8 +++++---
>>>>>>    drivers/xen/events/events_base.c | 2 +-
>>>>>>    2 files changed, 6 insertions(+), 4 deletions(-)
>>>>>>
>>>>>
>>>>> I did a comparison of a kernel built with your patches disabling 
>>>>> XEN_PVHVM
>>>>> and my patches with XEN_PVHVM_GUEST disabled.
>>>>>
>>>>> The kernel built with my patches is 6 bytes smaller than the one 
>>>>> with your
>>>>> patches.
>>>>
>>>> Isn't this a sign of something else needing tweaking, somewhere?
>>>
>>> This is a sign that there are probably only very few really HVM 
>>> specific paths
>>> (in the sense of: explicitly not marked as irrelevant for PV) in the 
>>> kernel.
>>> Yes, I'm sure you can find some more, but I'm really not sure this is 
>>> relevant
>>> for more than a handful of users.
>>
>> I see more reduction:
>> 15029248 - arch/x86/boot/bzImage
>> 15021056 - arch/x86/boot/bzImage.after
>>
>> ~8k
>>
>> 52542480 - vmlinux
>> 52523184 - vmlinux.after
>>
>> ~18k
>>
>> $ ../linux/scripts/bloat-o-meter vmlinux vmlinux.after
>> add/remove: 1/136 grow/shrink: 14/48 up/down: 15902/-22430 (-6528)
> 
> Did you disable CONFIG_XEN_PVHVM_GUEST in the before kernel, too?

Yes

$ grep PVHVM config-before config-after config-pvh-before:CONFIG_XEN_PVHVM=y
config-pvh-before:CONFIG_XEN_PVHVM_SMP=y
config-pvh-before:# CONFIG_XEN_PVHVM_GUEST is not set
config-pvh-after:# CONFIG_XEN_PVHVM_GUEST is not set

These three options change:
$ diff -u config-before config-after
-CONFIG_XEN_PVHVM=y
-CONFIG_XEN_PVHVM_SMP=y
-CONFIG_XEN_AUTO_XLATE=y

Regards,
Jason

