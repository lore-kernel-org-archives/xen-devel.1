Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D86C5B572
	for <xen-devel@archiver.kernel.org>; Sat, 15 Aug 2026 01:13:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1391558.1631287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wv2xR-0003mk-Kp; Sat, 15 Aug 2026 01:13:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1391558.1631287; Sat, 15 Aug 2026 01:13:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wv2xR-0003mV-Fb; Sat, 15 Aug 2026 01:13:09 +0000
Received: by outflank-mailman (input) for mailman id 1391558;
 Sat, 15 Aug 2026 01:13:07 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wv2xP-0003mP-3s
 for xen-devel@lists.xenproject.org; Sat, 15 Aug 2026 01:13:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wv2xO-0043rO-Gw
 for xen-devel@lists.xenproject.org; Sat, 15 Aug 2026 03:13:06 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a7fbd1a-bab6-0a2a0a5309dd-0a2a450ac54c-2
 for <xen-devel@lists.xenproject.org>; Sat, 15 Aug 2026 03:13:06 +0200
Received: from [40.107.209.11]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a7fbd1e-f2d2-0a2a450a0019-286bd10b1fd3-4
 for <xen-devel@lists.xenproject.org>; Sat, 15 Aug 2026 03:13:04 +0200
Received: from CH5PR05CA0020.namprd05.prod.outlook.com (2603:10b6:610:1f0::13)
 by DS0PR12MB8245.namprd12.prod.outlook.com (2603:10b6:8:f2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Sat, 15 Aug
 2026 01:12:58 +0000
Received: from CH3PEPF0000000A.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::96) by CH5PR05CA0020.outlook.office365.com
 (2603:10b6:610:1f0::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.6 via Frontend Transport; Sat, 15
 Aug 2026 01:12:58 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF0000000A.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Sat, 15 Aug 2026 01:12:58 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 14 Aug
 2026 20:12:58 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 14 Aug
 2026 20:12:58 -0500
Received: from [172.20.244.139] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Fri, 14 Aug 2026 20:12:56 -0500
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
 b=FdMlHHQdYy3OaTXVlMtl4RXnWaPP250VmbGuzjQ0JMtYWu9SggbQf+T5HCYtyHfL3PkCQTLBtdyNHAADBl+oobqUo8gkti4vP3JMk8UBTSPVg1IYcO3ZouCmys+C6SMT+D5wrdB4O5rAERj+p7DujD6hQOEngxVnhmzkEG9TKzszG9pLQf5ppgXwW67OA/PPCRfpbb0zeov9sVrSBT4zJPsqftYBQNYxA7h+SP7f2QkfaLMGejfOMmly9R6djYtvUQqx0ckbFKEydzWL7nNfjvMYMOSv2rvI9WuxnYJuYgE3WObPJxIseLjO4Yavq33VuCRVlawPJbabMFLIEQBvrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+kegObjj3WTG9wSOOgkd8oQrCwJzZV6VEpn0ATfgCM=;
 b=VPpj5/PZXrwJiWjMQ/B1D+7IjDxQeZpdPIZk5nVVz8DVCrNKFIQxai79CpTRn/0f0B6HTFJbwqfygDyoZNFPjjldJeP2ZasFGFPva0JFNeRivJUQMTsXK+5iPLEhg2jQTeAIJDTgerhnkTaEP1YZsJMl70UqRbhRRLqLmpL9TJUKKX7p9t7X0lltBeDV6E2k/WHUG5WXi6IDBJ/N+ikmT1S+pn2aRsVpbm1ccs4FtlRLzZPsPO2XNphoCu45/0rDArkLt8CALV2vQDUV63C1QiDQjVqgzg89CaJejZthfDDglnGAgp3gFZhj3jNFShVZJzZYFlujG4i3yXHHRIC87A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+kegObjj3WTG9wSOOgkd8oQrCwJzZV6VEpn0ATfgCM=;
 b=xoh/RXenN6qULyc3S8NiwLGPFJprwmv/gGC5GUIvQFI8d/GcIUbSsH2RflNzNLmXC4Z0fQdMAwbRtSejRutTaxwRadvCJnIev6VQdSbB++KaAb9ShGUAgEEOi21hQqw3zSPOpx4Xf1DDYLcNIiZPW9QZgl+8b4uUuhjrvMGA/NA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <9e940641-ce6b-4e8b-b731-34e87f824d9b@amd.com>
Date: Fri, 14 Aug 2026 21:12:55 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/24] XSM: make Argo hooks well-formed ones
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich
	<jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <4bd4e7f7-e005-45b4-a543-98597a9de707@suse.com>
 <6991badc-dcc4-44b9-a048-29eb67c46d2e@apertussolutions.com>
 <7762513c-0d3a-465a-abd9-73e3ba586556@suse.com>
 <29546ca9-1875-4c20-b42b-39c886f3d41c@amd.com>
 <684d46e1-4f10-4034-93c1-d0bbb495e5ab@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <684d46e1-4f10-4034-93c1-d0bbb495e5ab@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000A:EE_|DS0PR12MB8245:EE_
X-MS-Office365-Filtering-Correlation-Id: f6c4f26e-ec79-414d-8e12-08defa6a5828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|23010399003|82310400026|4143699003|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tvKEQ/7jxg182tDQASUXUi5dj1yR3U8QZwPJz0nDdiZhpW+0IsV+o+ZKbYQWtgp7h5QyHScVNsMB7ldhBxJV9+pac5deH6e9dh7vdlJacQcRwItcjjGOqiEFcvRUI1LoYc7AOU2DcTakkmztLf41emXeqeehaiilkv1UzVyRi532WhEBzh/I2fBOVxIH2WwNKtunVQuMszWXpROxWkRdYeWN2HvZ6dOoL1QEu4YInbIwKzLh+ofAWx2HajDqXVt1QpSL1FRJNUVncv3cp1Nynk6hkp/9kLNawEBH74YBm8M55p/TItTM3UVmGw5UJKm+YCSs/GcKTZ/V+pj1bnBtPZkF53qWFrraV0zixCAWltQESTC9Ai3ZYWczx/Z+ekS0Uizuc2NzSxiQtEoGMHLcU1a9bIG6fPk/T/zPbtab5dwqa/OiQBs242sMTQmhwcPpe4dZjug0UfNb5OSr+z98jOdVsF+S1PwHf6ZgNg/OeUsmuSYmlMCgbYMkVXO6QoD4A4H2KBHIMKCpCpl4YA5JGA1MO2O6qjwTEVsFEBYTT1NEg05XpdNj6CHOhznLzQV7EzLfSUnDSHylHyc1QqlWZmxP6rWcZapgPuK3T7ujN7wXx0/uj3uBafnlOag5NiftN0+hPL5Bw/CQ1s0DM49B13T09NEbxehjIQP1x19NZaAZAS2NIveRg20NQZ2HiUr4h8eYzRKv7xB+7qtH8BTxMg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(23010399003)(82310400026)(4143699003)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JrNFdewOGFhOd+AEUTfdZxsF2EWniiahPlW63OSgS83wYxb9/EEJU0nhFe3+fzjIoA1AOP1OwnuTJfN/NrPRifN2lPwPPkqETSjBXqwCj/S3kjo+YPhpuIE3jxs0Qlxrs9pNMEGaDsLZ3dsO93dosGJRxRrSJ00Y53IekCYLbCBG386vLJ8i6BQ6pCUFwz7N90JpQ079miopClQUWUi74x53joFIjNwWBTthi+Gxf4Bt2qdzN2ClsTeqG6s+niyPVtctkG6BX746wgJgx0nxCeO2HDeVQ0TZ0ntchv8dtZhCiVvEgQs4xlhBJ/fUUUIpc3loea88Mwe16nbeduPZnO7+YMx1AueMdAe3S8+/2/ILcE8rbGG2gdw3jjoDoJa4Yn/ZWFfEMITqDT8ArqOnsvKHndZOGHC/89ERoPfX9GK5zwyBiZrrKlTqHPtfjlHN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2026 01:12:58.5169
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c4f26e-ec79-414d-8e12-08defa6a5828
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8245
X-purgate-ID: tlsNG-4011c0/1786756384-599C1CFC-0CA981B8/0/0
X-purgate-type: clean
X-purgate-size: 3031

On 2026-08-13 08:09, Daniel P. Smith wrote:
> On 8/6/26 10:09 AM, Jason Andryuk wrote:
>> On 2026-08-06 03:16, Jan Beulich wrote:
>>> On 06.08.2026 01:02, Daniel P. Smith wrote:
>>>> On 7/28/26 9:22 AM, Jan Beulich wrote:
>>>>> @@ -2307,7 +2308,7 @@ argo_init(struct domain *d)
>>>>>    {
>>>>>        struct argo_domain *argo;
>>>>> -    if ( !opt_argo || xsm_argo_enable(d) )
>>>>> +    if ( !opt_argo || xsm_argo_enable(XSM_HOOK, d) )
>>>>
>>>> This question came up on another thread, so thought I might point it 
>>>> out
>>>> that when FLASK is in use this can return a nubmer of error codes 
>>>> beyond
>>>> an access deny. While I know it's the existing behavior, but if the
>>>> error code is anything other than -EPERM, then it's not that the policy
>>>> denied the access but something cause a fault in the security 
>>>> server. In
>>>> that case the domain is still being allowed to construct with the
>>>> assumption that it was a policy deny. At a minimum should the error 
>>>> code
>>>> at least get reported, and perhaps it should be passed up to domain
>>>> construction to allowing it to make an informed decision on 
>>>> construction?
>>>
>>> Sounds plausible, but definitely wants doing in a separate patch.
>>
>> I think this is a mis-use of xsm_argo_enable().  As I wrote in [1], 
>> this isn't an access decision, but an ~optimization to skip 
>> initializing argo data structures when a domain is not allowed to use 
>> argo.
>>
> 
> I would have to respectfully disagree. The operation is to initialize 
> the domain for argo usage and the access check says do not allow 
> initialization if the domain does not have the privilege. This basic 
> defense in depth, do not initialize for some thing you should not have 
> access to, and thus not just relying on the later checks.

I was thinking of it as robustness.  If you always initialize argo, then 
you don't have to check ->argo for NULL for each domain.  Though, if you 
want to selectively allow argo for individual domains, you have to check 
something anyway.

>> With Flask, this prints an AVC denial during domain construction when 
>> the domain doesn't have argo enabled.  That is misleading as it isn't 
>> the domain's action causing the access.  In OpenXT, I wrote a patch to 
>> add a noaudit variant to hide the denial.  I didn't upstream it 
>> because I didn't really like it.
>>
> 
> The customer has ran OpenXT through the code evaluation models that they 
> have access to and your patch was flagged. Not for being technically 
> incorrect, but raised policy questions on whether is was desirable to 
> silence the event.
Again, xsm_argo_enable(d) is used for two purposes:
  - Access to the argo_op hypercall: current == d
  - This argo_init(d) call: current != d

Domain create always goes through argo_init().  current triggers the 
denial, but it is logged against d.  This is misleading as d did not 
perform any operation.

Regards,
Jason

