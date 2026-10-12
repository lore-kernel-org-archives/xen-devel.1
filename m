Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDFECA9ED0
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 08:49:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446009.1661920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBiZ-0003OU-94; Mon, 12 Oct 2026 08:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446009.1661920; Mon, 12 Oct 2026 08:49:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBiZ-0003ON-5p; Mon, 12 Oct 2026 08:49:11 +0000
Received: by outflank-mailman (input) for mailman id 1446009;
 Mon, 12 Oct 2026 08:49:09 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xGBiX-0003OE-NH
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 08:49:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGBiW-00EfJt-Gn
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 10:49:08 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6acc9f00-8faa-0a2a0a5109dd-0a2a450995a8-16
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:49:07 +0200
Received: from [52.101.85.66]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6acc9f02-be1a-0a2a45090019-346555420c39-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:49:07 +0200
Received: from BLAPR03CA0039.namprd03.prod.outlook.com (2603:10b6:208:32d::14)
 by LV5PR12MB9780.namprd12.prod.outlook.com (2603:10b6:408:304::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 08:49:02 +0000
Received: from IA0PEPF0000003B.namprd03.prod.outlook.com
 (2603:10b6:208:32d:cafe::1c) by BLAPR03CA0039.outlook.office365.com
 (2603:10b6:208:32d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.19 via Frontend Transport; Mon,
 12 Oct 2026 08:49:02 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 IA0PEPF0000003B.mail.protection.outlook.com (10.167.249.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 08:49:02 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 12 Oct
 2026 03:48:56 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 12 Oct
 2026 03:48:56 -0500
Received: from [10.27.77.50] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 12 Oct 2026 03:48:53 -0500
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
 b=CWUZcZVp0sMQtzGGn+2cmzYOyhmv4pVWKH52gmWgpzwq3Dcn2q73kgzYsaWByE7KI1Rkr2YcNHp9T51MeyWTYh0x8Er+3yKfVZ9c1b/8DaKi1CmhA9/SMORuE1PVf5kKbsYgBtwaoKdv65r8E3Kmsww2CzFe+mm7+HwYUhC0+ktbVySG22vvvLZIBihA9o2rHVbp4V+XbI/kV6f8LAzIf9qTLjRm5lAwJfmn7qnN0aq0jj0loxXq71BxoR7DEi6oJrFRKTDIgyb/PKTImLFN/GnZakzeitPl53ZLolMVolXe8MdaXWRlUNv4PUOWMPaQKQzUc+wCHbeXwivfnODZmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oCR1mn7eIpteDAuy0Pd6JjVVXFIuKedDakhSMcIovI8=;
 b=KsXYyiNcB4OABuYLiHvpegVluhJBka6L8at3rYdfD9nLLNpvUtO3vhwh4XwHoI7Sge1gmK7L4B8OhQUR4u1fhyHmi2UwirRROcYCxPUMiAdG2SLdbh3Tl8d7gGBEEDdemMEkZqVoM2kpOSGjlH29q/U7KpS5ztEIOciql/j1igYUTdwO195YDw/jEgCl26Yf9XRyEqfWDDZwp9+pvGcHhssnWQf2FIgF3wRkuoDgY2VRGz/RYeuySdK41uuKwe5qCNfP4ygZWh7Djw24fdh3ZpEVMfcM/cVIkpEyu4So7gRaBNY+Xu3+N8288edzQIdgf3YKWCEjtSyTPu/mmGbmRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCR1mn7eIpteDAuy0Pd6JjVVXFIuKedDakhSMcIovI8=;
 b=yLzQVDTSW9GP3+xQNozWWRTLdmkS9I0X71s3P7wiGz2VfkRb0jo5A2134B2rscbPUF3AALzGZvVjQ/VdXuRpAFrthyfz/Zafj7Zf61HTb4aJqGhwOApEQFzaxrT9O1XklceF6Cav5DGccDH/91D1ghRqypuJmmsRDpmKI1iVrd4=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <482b2414-affc-4f43-bdbb-8a7a012d542d@amd.com>
Date: Mon, 12 Oct 2026 10:48:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Sanity test specified domain's memory for being
 a multiple of a page size
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>
References: <20261007124813.177940-1-michal.orzel@amd.com>
 <DLYNCSBJ3FOE.IQ4BMB5FFYGL@amd.com>
 <45cb2679-c79e-4d67-abaf-a4fe8e5ddc51@amd.com>
 <DLYO8NTSYU10.23RIZURXYV9ME@amd.com>
 <9600e1ea-d85c-4c59-abf9-bb90b1e8cd72@amd.com>
 <DM05YCBPLKR8.4ISDKVT1L933@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <DM05YCBPLKR8.4ISDKVT1L933@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF0000003B:EE_|LV5PR12MB9780:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d615455-b1a6-4a7e-bfd0-08df283daa20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|376014|82310400026|10067099003|261009223027099003|11063799006|4143699003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	VIzeSloXBnTcEYa8ulfV6NCH8gFz/NW+Igx58j1/Aw2H20+sIjk4Pt+fbxJBw/Po7GPbi2T9YhAUTZinzfIN45xOs4kYPFuYaHi2rWAfUXrBRjocx2Z5RcsPAyUCS4WxucfsfLVroVKT5IM35PTdybeiGuNBWwhim4HQ+VDG07E+B2TA5bfo4nasY7qEBReE58ItbMgslPrL69cxMzE9j31vdZNu6iInSkS8FqkyJUocK8XRbDt1mQ2yvicnJJS77gbw2B2DlHZqVFBbWF11ucqk2n96hopCqFgKYqDcgmvdgW++/l/5vKA5ouDv5wt1KlQ07N0z0aAAGqKqsJE6A/ZdMPSScswM6YpI6XO7arWJrP9gcYuF51Q/FcO/dUqcrRSM9ljRrpYeP0sFXRbA8gnQVT6RaZC3H9VbB6CkZ9rfELchcAiJ4BO6LfKo5SKlVl393SWJVqKmsF2oe5cbUcGWCmY97Z6fJqLwRZfD8MuaM4cVe0X7OiNq56hT2YjFtrWKwE5tO2b6vnzE3pJ0lAc+4D1AV43mVHPMqSPAFMOGqcPZiW5TS8JGRuabt/sp21dfE9+vl0/WThz8Q10x4uRw07fFl+AKKGHApnuDhxFaV0vVDAc0r8TIJbTvt9vNQk37Lo49LKjRpadAXJ8//oVOONvWCF5PoMpjj4FhsNnP0VeLjbK1Ytph+TYxNrkoM+RWA6ZTXxnSD7jsywMfIw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(376014)(82310400026)(10067099003)(261009223027099003)(11063799006)(4143699003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vsFy8deMAoK0AsFubMBDifhKHd2JsIRM/qJQI+A53GgiTx0CMuXHVpm/VTm55pOPDjFXgWshwRcwTctmFOGayflKoRgY8He1feroQ2t+oM4Y/oUAMy6I9awmYTABuFHolTXxAcwrFD1vUswXsvb/5EfjQROBeFgrvyMJ1zu98YhJbd3mngosYnIu61QZvAuNipY6dlYDZvSdCHyMCfq1W/56uKbfW8yLZZzDU8HEbR99NVUgkOwvbwshzC2cl5cAwa8fCI4dKHOHxW/1wJ2WLgFt2LtnecMgE3ktTQu5/wtOLOZIDFMdtGmz3kKUE1hgIRy+Io1glIFIE3EfRSHpkQn2r/kDzJ2HqeadfjJ4+wGAIB7Dr15xLnmH8IDuBkkMT0BGavYGIWbkZO2Zr5nHLEZXQu9Cm3dvgcYwKNtwLmFi9ZxMQoECQvNMuGncTKP9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 08:49:02.1843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d615455-b1a6-4a7e-bfd0-08df283daa20
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	IA0PEPF0000003B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9780
X-purgate-ID: tlsNG-bad1c0/1791794947-BC6CA034-A96C8BE6/0/0
X-purgate-type: clean
X-purgate-size: 3848



On 09-Oct-26 10:27, Alejandro Vallejo wrote:
> On Wed Oct 7, 2026 at 4:31 PM CEST, Orzel, Michal wrote:
>>
>>
>> On 07-Oct-26 16:21, Alejandro Vallejo wrote:
>>> On Wed Oct 7, 2026 at 4:11 PM CEST, Orzel, Michal wrote:
>>>>
>>>>
>>>> On 07-Oct-26 15:40, Alejandro Vallejo wrote:
>>>>> On Wed Oct 7, 2026 at 2:48 PM CEST, Michal Orzel wrote:
>>>>>> We require memory to allocate for a domain as RAM to be a multiple of a
>>>>>> page size. However, we neither document this nor sanity test. Specifying
>>>>>> memory size that does not conform to this requirement fails the domain
>>>>>> memory allocation in the non-obvious way that is difficult to parse for
>>>>>> the user (printing over-allocation messages followed by the panic that Xen
>>>>>> could not allocate the requested amount of memory).
>>>>>>
>>>>>> While there, fix indentation from tabs to spaces for "memory" parameter in
>>>>>> booting.txt.
>>>>>>
>>>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>>>> ---
>>>>>>  docs/misc/arm/device-tree/booting.txt   | 4 ++--
>>>>>>  docs/misc/xen-command-line.pandoc       | 5 +++--
>>>>>>  xen/arch/arm/domain_build.c             | 6 ++++++
>>>>>>  xen/common/device-tree/dom0less-build.c | 7 +++++++
>>>>>>  4 files changed, 18 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
>>>>>> index bcb06bc796bf..7dfac2062a37 100644
>>>>>> --- a/docs/misc/arm/device-tree/booting.txt
>>>>>> +++ b/docs/misc/arm/device-tree/booting.txt
>>>>>> @@ -155,8 +155,8 @@ with the following properties:
>>>>>>  
>>>>>>  - memory
>>>>>>  
>>>>>> -	A 64-bit integer specifying the amount of kilobytes of RAM to
>>>>>> -    allocate to the guest.
>>>>>> +    A 64-bit integer specifying the amount of kilobytes of RAM to
>>>>>> +    allocate to the guest. Must be a multiple of 4KB (the page size).
>>>>>
>>>>> nit: s/KB/KiB
>>>> Is it? I don't think it matters at all seeing the number of occurrences in the code.
>>>>
>>>>>
>>>>> But page size isn't always 4KiB on all ports. PowerPC has 64KiB pages.
>>>>> IMO, 4KB shouldn't be here or elsewhere in documentation.
>>>> This is Arm doc and on Arm we only support 4KB at the moment. User should not
>>>> need to dig into the code to check what is the page size. It's better imo to
>>>> give this information right away and change in the future when we add support
>>>> for 16 and 64KB pages on Arm.
>>>
>>> This is already the only reference the other ports have for dom0less.
>>> The document shouldn't be here since the movement of dom0less to common
>>> code, but the side effect of it is that this no longer an arm-only reference.
>>>
>>> I won't be annoying about moving the doc on this patch because that's a
>>> separate matter, but not adding more easily avoidable debt seems
>>> warranted.
>> I don't quite understand your reasoning. If you worry about dom0less != Arm,
>> then on that basis HAS_DOM0LESS is selected only for Arm and RISCV where
>> PAGE_SIZE is 4KB. I don't think I'm introducing any doubt here. I can remove the
>> 4KB mentioning from the docs if you really insist but at least for me it's
>> clearer for the user to know right away what's the requirement for the size.
> 
> It's a small adjustment to make the documentation truly generic. And
> prevents the pgsz == 4KiB assumption from spreading further. Many docs
> are spawned from copying other docs.
> 
> If you're so strongly against, that's fine; it's not incorrect today.
> I still think the 4K should be gone, but if don't want to block the
> patch on such silly things.
Fine, I'll remove 4KB mentioning from the docs.

> 
>   Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Thanks. I'll handle the changes on commit.

~Michal


