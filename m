Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7601FC55ABF
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 13:24:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384739.1627531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wry5P-00083z-7C; Thu, 06 Aug 2026 13:24:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384739.1627531; Thu, 06 Aug 2026 13:24:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wry5P-00083s-3n; Thu, 06 Aug 2026 13:24:39 +0000
Received: by outflank-mailman (input) for mailman id 1384739;
 Thu, 06 Aug 2026 13:24:38 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wry5N-00083k-S5
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 13:24:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wry5M-00D6Wn-VM
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 15:24:36 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a748b0b-5cb7-0a2a0a5109dd-0a2a4506908c-16
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 15:24:36 +0200
Received: from [52.101.53.19]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a748b12-195a-0a2a45060019-346535137015-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 15:24:35 +0200
Received: from BL1PR13CA0166.namprd13.prod.outlook.com (2603:10b6:208:2bd::21)
 by SAWPR12MB999115.namprd12.prod.outlook.com (2603:10b6:806:4e3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 13:24:31 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:208:2bd:cafe::74) by BL1PR13CA0166.outlook.office365.com
 (2603:10b6:208:2bd::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.8 via Frontend Transport; Thu, 6
 Aug 2026 13:24:30 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 13:24:30 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 6 Aug
 2026 08:24:30 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 6 Aug
 2026 08:24:30 -0500
Received: from [172.19.79.34] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 6 Aug 2026 08:24:29 -0500
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
 b=cTMz2uCOe150771s0ea9CpVcK9ABgIvKotVY3DV9CH9zxw/1hPcgqcy/1IygGVZ7Np6iIJtG3wSwczlSy2jSQthXGXC7mAzwhPitABy6gKreDnH9Kn2cBoMsyuA64LeDl0CtWk36TBpVYNBmVaAD58CmHffkxJYcGkJQjvceieVPFej2avl/GjCH3HR5uabJjkpwLbbhpsBL5JoWeCfLLn8cNYjJ60beffeBAvwnCquIZn/q7SOIHu5pks0rC+c3F7GfekPbg0idFjreNcFUcqeL1R4XAthX0iHEv8ft2jUeTaznJh4W/PCh4/bzzdFu8UDGKLkE2wxAfGNsQ1XyCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VqnVCxBV0rWSAz2hpAfkfFUUEiUk19P4xvnLAhsWtzY=;
 b=BmezDUTZ5Hprw6OF+nVrjMp/jNg2dMeVvFru+loo/Ncx7KUyHqOGt1Ol0wacP+66KesyosO4Bq9odgwnMkd7jBRPbhIrWX+TrwaaeOIVGN5SydNqBMED6L4hW6FnM10PzIZII77Bdy+dVnauXcpsmIYemIhI8ZscMBdGs2MrEaCnxadkq7v4LGIdwHFhlcIiflylL6U0D66nFrBlbGuGXnMzZPBvZ0lf6XGEBh+BXApI0UA3CmLjLGtuY+kd7aoD2iQCRCey7cQWUtVI/OZxu3HHwPklka96R+pLHCs38sozd5A0eZ6VOyVGDiaeTYBK5BJdVvypXlEBxwzV3cOhMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqnVCxBV0rWSAz2hpAfkfFUUEiUk19P4xvnLAhsWtzY=;
 b=tkwa01y8Tb/U/5rJ/toka0qQgmrK2n/2ukfcsRg9qaCx00TGir0r0KfavIqcMCB+zyn4YjztJjpJnmnYx3AfTTiRorWBCkRfozSYLiSF3O2eXCPT+LZ+xI/y6W/09t3HsQUeWDffsZ8S7f1PEYt6VqfnFCHRVRKjXLZvSeMFOzY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <a6c55f20-c5cf-45fa-beb8-532fe3b95270@amd.com>
Date: Thu, 6 Aug 2026 09:24:23 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] xen: Fix PV-only build
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Jan Beulich
	<jbeulich@suse.com>
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
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <967208c9-8d51-4380-8cb4-298f5c313d35@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|SAWPR12MB999115:EE_
X-MS-Office365-Filtering-Correlation-Id: 519541e7-654c-4ad3-ec19-08def3be0c45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|7416014|1800799024|376014|36860700016|4143699003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ssmviAh4UlGbLMVR9qrVzGMffOV+F93ogJBOiX2JmxPorOV/wZD2YNcTH6+snAgGYByvpg3c13rL8jGnIlSR7Tt6UKR1ulTAFIjmGyjGChBGpwTsM7TgwfzfM7JB3D2M0B6t42wd5nBFRyU3boD8JKSJWullescDG2oZG5CCrSinnVcNNC9cM5M5D1vkN9ObJYDagXl1rYys/5X1rG+9bYTliJsm4l1ON3XUt7xLinXkI7+Nm+pjkh5SRtOmbl9THGaigJf1W4tsMdh3RIV3a4lYhs2/swUUlxurAtIWKyQPod5vb5bGrY7JtJFOX1BFKNc7LD3YtYOyKg59nNVCZlCPiDHPz/x15OQaXzlC0ddjWjzuBEinjB2oWHILMrcDi7jDqvC6UFK7ZP5ZHbTsrxCyLzI7qLTZKv/ufAaMrUX97Wp1tc6fbpLNBRlRy0q6Xf/cXi3ULLmIgutYkfHAdCcMGbBBn1iVRQ7RsTOwoDD2zLJt+AQ8Kn/ch33R8l1IFbGgjG//IqkkSWHsWaZfm0ZNj8SQS+9DW1aoaXQLF5TH3DNdPueWkXF96TIyul1ZqBQGZMsfVIz0fnGDa5uGOWL6hW5N29N/xLnFOQeJzIkCFxWUFYw0yVTOGOrpDz6dlpIq0umcvLG9pfSE9rtMYokONSkOpPB18/Mol1quDJisR1XtmedbO3o22+qh7aPF0ICXCe4Axwb47B5zb23A2g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(7416014)(1800799024)(376014)(36860700016)(4143699003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IuKYHvvcTRYFO/KZfmFoO/sm6r+TPgmOi/Np8cb7Bhat02kwhhP2Qt63hD/yxQntVyKbkqvfS5i0jrOS2NU72YA6232HMDiJD2G4VvgPZXmODeoqe6KOr1oda/jZRrMu1c6i99o0FfDfeTR9Rm8Ehjx6F5obJzESmtBLlkBOlOqBmxpKbKiiK7exXj8EYDDRpPOE0atZM52ca2+oE/7uZxAt6QpKk5fuqdBUfWxbdP+R1OH0mwlDuiHg3JlkD+eKASC9kmO2zsbhxn7Xzv5qt1CCBzMN/IZkY+Oi5U2PJLajPniUAYHTKSFm+iwsuN4k7DB+IcvinwIzfE+3y6a7GHqz0mgpqz9AJZvOqBevlAab4hgW6eWCcIHC5VxatK96eS9fez8fS5yL31epkGRvfduKVTZIRTMkdyJBIxELh+4kOXdK7rUuc/MJdhTlrO9X
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 13:24:30.7985
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 519541e7-654c-4ad3-ec19-08def3be0c45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR12MB999115
X-purgate-ID: tlsNG-16d1c6/1786022676-F5C0F77B-6412BB99/0/0
X-purgate-type: clean
X-purgate-size: 2949

On 2026-08-06 08:00, Jürgen Groß wrote:
> On 06.08.26 13:31, Jan Beulich wrote:
>> On 06.08.2026 12:55, Juergen Gross wrote:
>>> On 06.08.26 03:52, Jason Andryuk wrote:
>>>> Allow disabling XEN_PVHVM for a PV-only.  A stub in the event channel
>>>> code needs to be fixed first.
>>>>
>>>> Jason Andryuk (2):
>>>>     xen/events: Fix xen_set_upcall_vector stub
>>>>     xen/Kconfig: select XEN_PVHVM
>>>>
>>>>    arch/x86/xen/Kconfig             | 8 +++++---
>>>>    drivers/xen/events/events_base.c | 2 +-
>>>>    2 files changed, 6 insertions(+), 4 deletions(-)
>>>>
>>>
>>> I did a comparison of a kernel built with your patches disabling 
>>> XEN_PVHVM
>>> and my patches with XEN_PVHVM_GUEST disabled.
>>>
>>> The kernel built with my patches is 6 bytes smaller than the one with 
>>> your
>>> patches.
>>
>> Isn't this a sign of something else needing tweaking, somewhere?
> 
> This is a sign that there are probably only very few really HVM specific 
> paths
> (in the sense of: explicitly not marked as irrelevant for PV) in the 
> kernel.
> Yes, I'm sure you can find some more, but I'm really not sure this is 
> relevant
> for more than a handful of users.

I see more reduction:
15029248 - arch/x86/boot/bzImage
15021056 - arch/x86/boot/bzImage.after

~8k

52542480 - vmlinux
52523184 - vmlinux.after

~18k

$ ../linux/scripts/bloat-o-meter vmlinux vmlinux.after
add/remove: 1/136 grow/shrink: 14/48 up/down: 15902/-22430 (-6528)

>>> So I don't see any reason to take your patches, which conflict with 
>>> mine,
>>> especially as my patches have a negative diffstat on source level, too.
>>
>> Hmm, Jason's patches look to move things into a more adequate direction,
>> though. In which case I think a negative diffstat becomes an irrelevant
>> argument?
> 
> Depends on what you are looking for.
> 
> My take from this is that a PV-only kernel with Jason's patches is not 
> really
> adding any value, while my simplification is at least making things simpler
> in terms of code volume and number of Xen related config options.
> 
> Of course it would be possible to have a smaller PV-only kernel, but as 
> I said
> already, there has been no public demand for that in the last years and the
> downsides IMHO far outweigh the potential gain.
> 
> IMO the "adequate direction" regarding Xen specific kernel code is 
> towards PVH
> and not towards more PV specific tweaking. And I'm very sure the kernel
> community outside of the Xen community is agreeing with me here.
I don't need PV-only kernels, so I am fine with not pursuing this patch set.

Mainly I wanted to post this alternative since restoring PV-only is 
possible (and I inadvertently broke it).  Converting CONFIG_XEN_PVHVM to 
CONFIG_XEN looked wrong when it didn't apply to PV.

Pursuing your patches for the reasons you give also makes sense.

Regards,
Jason

