Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC93C5DF6D
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 08:11:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394840.1633469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwbOA-0002H1-45; Wed, 19 Aug 2026 08:11:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394840.1633469; Wed, 19 Aug 2026 08:11:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwbO9-0002Gu-VE; Wed, 19 Aug 2026 08:11:09 +0000
Received: by outflank-mailman (input) for mailman id 1394840;
 Wed, 19 Aug 2026 08:11:08 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wwbO8-0002Go-I3
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 08:11:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwbO7-00Fhfi-V8
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 10:11:07 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a85651b-2eae-0a2a0a5409dd-0a2a450c8930-2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 10:11:07 +0200
Received: from [52.101.61.14]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a85650a-f479-0a2a450c0019-34653d0e4699-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 10:10:52 +0200
Received: from CH2PR08CA0029.namprd08.prod.outlook.com (2603:10b6:610:5a::39)
 by LV8PR12MB9690.namprd12.prod.outlook.com (2603:10b6:408:296::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 08:09:25 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::68) by CH2PR08CA0029.outlook.office365.com
 (2603:10b6:610:5a::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Wed,
 19 Aug 2026 08:09:25 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Wed, 19 Aug 2026 08:09:24 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 19 Aug
 2026 03:09:24 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Wed, 19 Aug 2026 03:09:23 -0500
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
 b=a0W0FQN3znL9XDgjauVQBtrY7/wfswEeprm2/u/psJUIDVf7O3VDQY80PtL7gMTtFSwwGirMvAgQoD+Wq/NicjRn2glRSPThgmnIaZGLlYwt5kIajNrGrpyYg6fGhDcYvf3dMF+ukqI01Pub3uhFHirLTL9ddcK3tZpUprhtgMegdFPLgOouJvO7hsBeEQmWDdLA2XPOxzDWGwZeTxX89TuxbVjwF9KsYVS9R8b6itQFX0RqdzfvR5ZIP6MZ3tnyMVdgD1y/mB3wtfP8+OHOPRI8BxSh8cS7bSg4VHw9z74/sVeWdFSD4XFUxCpDTpYKekbSUwrQEax+8o7s9DsGCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ElBOtEt8QuWxXRD7KgiNEGsI3yTM46XD66HgmSF/09s=;
 b=HEIxouBnvG/RlC/GpvXWW44XpDVVZk/BegKrecKxSGjxhDw1vLe1piq2CmFovY4e+sZkYMDqYdrA5mbHXgEkLbgVQWivG4quVvcr37coVy86eTfEiDwtNBsZFMtxw6ol23qrWYAMA3Gup0b4uJQhDMQ7jMq+8BJqeYOFQttFlaAldPsc9PjXMt7Y+h7XQmxA/YVrslMBlg4CZRntGdh7FBIxo6hjTSn91tm8tXT2kuC7AK0Tqv21O9jPOafhQBHcD9z58lv8A9yXwCzHEiof1pwc6A/9J4w6tLkeOVCQFt2E8DFfpm6wvK2EVe2tREZ6+fxqxfcs29ruz+6nK/0BAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ElBOtEt8QuWxXRD7KgiNEGsI3yTM46XD66HgmSF/09s=;
 b=YFKRUtho8/5FzdZuMIUltPQH6ZV47urXkCPWobgYJAAY52AwGs+hvGE4MKcLsBSJsd2JG2L8lLlr1lNWJ398T+MzutaLA9o+wUPqM9EScdyw1UzZN9IG/yXMRrZkmvo9c70t6AHjU4ThMLnn8mauN39OVH1glufxNiObLrYLddM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <3db3822e-5f40-462f-9f44-aab17806b656@amd.com>
Date: Wed, 19 Aug 2026 10:09:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: ffa: Harden SEND2 against invented loads
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Jens Wiklander
	<jenswi@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>
References: <1b483ce633bfa7d304cb78458ce029370691f00c.1787055320.git.bertrand.marquis@arm.com>
 <bb5a2a10-39ae-429f-a414-631b89d0bc89@amd.com>
 <59299B15-47CD-46AA-890F-E8991F41C01B@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <59299B15-47CD-46AA-890F-E8991F41C01B@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|LV8PR12MB9690:EE_
X-MS-Office365-Filtering-Correlation-Id: 401c78eb-7cf5-4ca9-3ad4-08defdc92edc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|1800799024|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mkGCefHF8ugKh0DzX3/9rT0eM9/HHzHHqTBzHqy5O6gBLgwcnna9g4ovDpM1oZNHysd1H65u+PTtVFQb8bpqOUDE9Ls9/RNt0GW9N9KkfHiQSu/tAHh2DVGkX9yXPNnRdhS+WqR6Yc/FnURy4Vmh2e24Kd440mDS2DYKlK+39EHiqGZhs/vzsAup9a/gBl2btChNiuXzkjLFwvBWm0gEQsMQPJTAev8Io6Vo5GZ/MYVD/86bJZfnAlJUy6DpOw07W3RJU7KImNaJaGozbz8K9T8xwmhsDLMkKVlzLt6vZ6U/sU1KAWfEFupT4Sz0WbaCS94pDIAq12m7ehthd5jIMNuqPmc9F78HRC93zrHxypXwSb/rVL0g9rni/5112OQU6gJCHDnqi6+H0DKhnS3/WVrIUGHUr2k8enu8T6jTdyYsX/YUYe/k5M8HEnQroTBpHY/j+Qzzf7ksBy1ZeIHt3ZNbH5ddntw8/JQzH/NcZw+b+mDT377VDAsBzgIDzBePjhQOAAT6M8CRlCyLwbFZ9qvW9q3vt5T6ILyCdNynjGTa7ayLaFdNIj1gD5flY4VggffGgXbzceqQ72GjWPQ9qaSbsa+5Ve+BiZZ5mLesgyBzFzF86PKRMkksKZHv4/xUz7Lamod4Ogi7rzzwSNb0e3fxlCZt91pE4qLTggmCGKHpPwt6wZTiBEInk+Y9guhXXFlaxzpM7lEVraAdUUK/6A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(1800799024)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UhZzvc8kdWDHcMLkRYPr3zPpcIkEXklei22LShKPLx1PIwVtBM5euT3skwM219fx6M8bdaEDEvvgtUSoFwNNT8okLWt6PFWiynhg8CDNWrYLtcj3WEVLp0J91M9goN+Vv/U2QoRV5UtBJWSjttr4pbs7j7j7woR1zBhWz56rV70/yNTylIyXXrFA1WOYqqOfSGcJwR8FJmnvRBgzwusisBhJU4KhvNOg2zYUNFi3NZyd3ZLF0ca3+Zhb2UFHNojBSAm0ZKmG68rKxESdBt3EvgjWXumR6mtBLYlYORW7OxR8HTe82uWJD39jGQTk+9IvfbwyoPDMqw2lUDDN/eFi97Aebg3PauFyioeDGwx17Gs7h7A28r/rJe7pgpoMX/1TyYrxZvNx0rXBr9RZ3uf8CqbZI/BkezzpBKGLcIVmR86KooWc0SP7wsc7claI8j5F
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 08:09:24.9261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 401c78eb-7cf5-4ca9-3ad4-08defdc92edc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9690
X-purgate-ID: tlsNG-d25034/1787127052-014C7A5B-F3FBD798/0/0
X-purgate-type: clean
X-purgate-size: 2614



On 19-Aug-26 10:01, Bertrand Marquis wrote:
> Hi Michal,
> 
>> On 19 Aug 2026, at 09:47, Orzel, Michal <Michal.Orzel@amd.com> wrote:
>>
>>
>>
>> On 18-Aug-26 14:16, Bertrand Marquis wrote:
>>> Research into compiler-invented loads has flagged FFA_MSG_SEND2 as a
>>> possible vulnerability.
>>>
>>> ffa_handle_msg_send2() copies the message header from the guest-writable
>>> TX buffer before validating and using its fields. A plain structure copy
>>> does not prevent the compiler from re-deriving later field accesses from
>>> the live TX mapping.
>>>
>>> For VM-to-VM messages, msg_offset and msg_size are validated against the
>>> source and destination buffers, then used to copy the payload. If a
>>> sibling vCPU changes the header and the compiler reloads either field,
>>> the checked and used values can differ. This can cause an out-of-bounds
>>> read from the sender's TX buffer or an out-of-bounds write into the
>>> receiver's RX buffer.
>>>
>>> The cross-VM path is gated by CONFIG_FFA_VM_TO_VM, which is disabled by
>>> default. The audit ranks the likelihood of such a reload as low, but the
>>> C semantics do not guarantee that later accesses use the stack copy.
>>>
>>> Add a compiler barrier immediately after copying the header so that
>>> validation and use consume the same snapshot.
>>>
>>> Link: https://github.com/xoreaxeaxeax/schrodingers-toctou/blob/main/observer-effect/audits/audit-xen-tee-mediator-RELEASE-4.21.1.md#tm-2--ff-a-txrx-buffers-ffa_shmc-ffa_msgc
>>> Fixes: 98af565b1e61 ("xen/arm: ffa: Add indirect message between VM")
>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>> ---
>>> xen/arch/arm/tee/ffa_msg.c | 5 +++++
>>> 1 file changed, 5 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
>>> index 1eadc62870f2..39f561c8237f 100644
>>> --- a/xen/arch/arm/tee/ffa_msg.c
>>> +++ b/xen/arch/arm/tee/ffa_msg.c
>>> @@ -257,6 +257,11 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs)
>>>
>>>     /* create a copy of the message header */
>>>     memcpy(&src_msg, tx_buf, sizeof(src_msg));
>>> +    /*
>>> +     * Make sure that "tx_buf" which is shared with the guest isn't accessed
>>> +     * again after this point.
>> This is a bit misleading because it *is* accessed in ffa_msg_send2_vm. The
>> comment should say what you wrote as the last paragraph in the commit msg.
> 
> Yes, this should be something around:
> Ensure validation and use of the message header use the same snapshot.
> 
> Do you agree ?
Yes. I'll fix on commit.

~Michal


