Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA83C55182
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 21:02:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381811.1625297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqznJ-0000sm-S6; Mon, 03 Aug 2026 21:01:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381811.1625297; Mon, 03 Aug 2026 21:01:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqznJ-0000sf-PQ; Mon, 03 Aug 2026 21:01:57 +0000
Received: by outflank-mailman (input) for mailman id 1381811;
 Mon, 03 Aug 2026 21:01:55 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wqznH-0000sD-Gl
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 21:01:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqznF-001NVQ-Q0
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 23:01:53 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a71019e-2eae-0a2a0a5409dd-0a2a450cb198-44
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 23:01:53 +0200
Received: from [52.101.57.43]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a7101bf-f479-0a2a450c0019-3465392b139c-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 23:01:52 +0200
Received: from CH0PR03CA0205.namprd03.prod.outlook.com (2603:10b6:610:e4::30)
 by SJ0PR12MB8140.namprd12.prod.outlook.com (2603:10b6:a03:4e3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 21:01:44 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:610:e4:cafe::d) by CH0PR03CA0205.outlook.office365.com
 (2603:10b6:610:e4::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Mon, 3
 Aug 2026 21:01:44 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.0 via Frontend Transport; Mon, 3 Aug 2026 21:01:44 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 3 Aug
 2026 16:01:44 -0500
Received: from [172.19.79.34] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 3 Aug 2026 16:01:43 -0500
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
 b=iTyKZXx5jeJeCIi21orKLBttZSXFVh0ZEMjO0I+DB6YmoLYd6LMI8tVdAhZxRvNsv/EGXNeQ0Gj9H11Q+3nRYo5IwgyRqRFPa7GMSwEbcxOHgbCgZbI7mBEA43mUrQHYofkxt+npcB+zezD6Z+bvzO9WiHtpoFVObp5nqCa1oZg5nD8vtdowIy4lAkTslVCBiEElcwQ8iU0Pl1qUns8dfadfyG1JZzHCFsIYC1X1nlFl8GSNhNYBAL6vIyARdC+sfU+EotK03WTPNVZZzrNpC48uf9OYhkRScD4PYN3RIPk33IxiSTwC8GA/LfCK1Pj4jEBEzqF5LV/KFVuTZKaBUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8aPzKaT4Ch3aMYTEO4glCQqrnHCy3HTBrxMY75ZeYh0=;
 b=e7mlNv3pYLMg2wFj7zcCh5jn4eznJPSXZOO8lZrtixXJXfpv9NXrCxoSjhgFJMxCkGoEkhM+D1F1KIBqtS74pbXZeZUb0BGxnuF6O5VYoweDP+vyXZVxiLVLyhsf63NTR+LSJFlXeX9cbD7ZryVCAeGV9uzyseO+ITNO8VH6N1Rth6+YABxqM4BZlsrTu0+BUjdElKwVZLY7yGi79HIKBWOeVXxa4PxWZfxg9mfv27KtiZGJ1pwGXN6/Bswqg/6cQjd3nRL/XST8WPriUsTWApdGU27ZXHZUnC4FWL7zgUXSOnA8QxjujGfOxHF4QPu1dZfuDUYozTV02166hWsKeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8aPzKaT4Ch3aMYTEO4glCQqrnHCy3HTBrxMY75ZeYh0=;
 b=2kEkQtYQXO5+nEB8js2YM3LTGgVD244sIbWyTHVhDnBBl7FGt0eB2tEEZ08xgLufigu0O7lhLo10ej2/VfY/kMFtnj1g9HzqPcokmfyCEpI4HRzm52ymLBVJZv2AhuoOGtvYLDF4txDLsIiWjBldVyLqLLiPhzYuiG7XYa450Jc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <bbc2fb48-d79e-4f00-81b4-0170dd910aaa@amd.com>
Date: Mon, 3 Aug 2026 17:01:43 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/24] XSM: make Argo hooks well-formed ones
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Daniel Smith <dpsmith@apertussolutions.com>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <4bd4e7f7-e005-45b4-a543-98597a9de707@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <4bd4e7f7-e005-45b4-a543-98597a9de707@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|SJ0PR12MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: af729bf2-2f5f-4cdd-3855-08def1a26cb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|4143699003|56012099006|11063799006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	t1fDly2XTT0moDZX478LchSyX7SBgmm3cYknyOLVHAAfgXbCkTnAZfNLtY2gOtxp3wxrTuN7r44Zn9e+Ct+jOWN1df1SkbxUZJZ879k6QP27JT3ZdjUgSQoK5nzSShh1vu7W5Zo+xQnbQ5fpS58R2YAhE+UiMXRVV+tJgEdLonrqaBR9+3nKD65LmLf4k50P1ctmFhIXp28j0dj98cW6hYOtjMAUs+ID6sP32HzEAQNTqQL6utoTZWSoXMMcU2rjP2gJ2xc9lVUQkvI7qh907SVJmqTXCNMMrikF8GSQdlj/CNbms3oWu7js/vgndSblPoqv2R7IQc4YNPjFeVCCGQH9ONw3oGleOpb7adHvPYYbGtkm+voZSg0AIpW26Z5HnLb+ICQ2JhDbZcQOSyKVoyuw7LFYo3xr1j3VHseXwA131g5HttQd2VN6Zm0ufKXQu+J2ZqhtqffO4ZDO6eN3AgVlwrr8RhP9YMGzTfEEBRiDmALX2csFUucFWsLjrDFe4iRG3PSUu+xDH97YOU+ggAlo/Vyt5+CsOtALAduGeRuYijlHS3jgDftAxT9FMyFvbYwzS0gVu0jlmj0DA2oJXuwFEJRi3jJeo1SubPR0Jbu2DKtz/oHsw0sqyZBjMaGGQfHe7OpHI/mGN8Dq2oX7kCkkxT9iQV044rYTPJZo4LMHilNF8JGbs77gCfyeXdE/9df+kQELy0WoFHLaQsitQQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(4143699003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lx8CjabBpQ9+DPM4RDKSkLBF+bih6AFioW/MOTJtFRMkdRCdZFJPYIeldvHZYU/Q6UEHuGTKZXy1hRxUeVkSRFjuH6yPuFKvQQL4FdFMCrBAZ8IiCKl8xF1B8Cy/gsKvPZ6NGJ7/kF9cA6M4NqemhThOStWj9F5OoEDQkCf1jpO1an3yrYhHbyQGrsBYglan2uGijgJzDai9SKxnvfC5KlhnWFmbiVfMpQN9y6qZofYFNFqwvxVbufpYGe8kIFWiAYL23a+PCY7mMTZq5+0mVYlkrxF3574TtW4pMrXRfRlU/l1ExLcnL3kZjVjYDAYQMz5YiMigCBdVrcjdYqhbWQ0nfSZFpVKUQ8s74a/I6X3ptvYpaHUYMRCOu/PVETmKvBhWKyXx8yfXEiNwo3g0MV8zBBs1CMe9dBGCewJFRr42rZWsXQ8/cScmaiWsPfAE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 21:01:44.3467
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af729bf2-2f5f-4cdd-3855-08def1a26cb1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8140
X-purgate-ID: tlsNG-d25034/1785790913-77ED2A5B-A1409A0E/0/0
X-purgate-type: clean
X-purgate-size: 2449

On 2026-07-28 09:22, Jan Beulich wrote:
> For whatever reason they didn't have an xsm_default_t first argument (to
> cope with XSM=n mode), making it impossible to (easily) cover them in
> xsm/hooks.h.
> 
> To be able to retain the const on their function parameters, adjust
> xsm_default_action() accordingly.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h

> @@ -751,27 +751,32 @@ static XSM_INLINE int xsm_dm_op(XSM_DEFA
>   #endif
>   
>   #ifdef CONFIG_ARGO
> -static XSM_INLINE int xsm_argo_enable(const struct domain *d)
> +
> +static XSM_INLINE int xsm_argo_enable(XSM_DEFAULT_ARG const struct domain *d)
>   {
> -    return 0;
> +    XSM_ASSERT_ACTION(XSM_HOOK);
> +    return xsm_default_action(action, current->domain, d);

This one I think should be
     return xsm_default_action(action, d, NULL);

Usually current is passed in for the check, but for domain_create() -> 
argo_init() it is the under-construction domain.
>   }
>   
>   static XSM_INLINE int xsm_argo_register_single_source(
> -    const struct domain *d, const struct domain *t)
> +    XSM_DEFAULT_ARG const struct domain *d, const struct domain *t)
>   {
> -    return 0;
> +    XSM_ASSERT_ACTION(XSM_HOOK);
> +    return xsm_default_action(action, d, t);
>   }
>   
>   static XSM_INLINE int xsm_argo_register_any_source(
> -    const struct domain *d)
> +    XSM_DEFAULT_ARG const struct domain *d)
>   {
> -    return 0;
> +    XSM_ASSERT_ACTION(XSM_HOOK);
> +    return xsm_default_action(action, current->domain, d);

Similarly:
     return xsm_default_action(action, d, NULL);

The single call is:
xsm_argo_register_any_source(currd);

These argo hooks all pass in their arguments explicitly, so I think we 
should do that and not use current.  (The send and register hooks could 
use current, and that could make sense as those map to hypercalls.  But 
it is correct today with the explicit arguments.)

With the changes:
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

>   }
>   
>   static XSM_INLINE int xsm_argo_send(
> -    const struct domain *d, const struct domain *t)
> +    XSM_DEFAULT_ARG const struct domain *d, const struct domain *t)
>   {
> -    return 0;
> +    XSM_ASSERT_ACTION(XSM_HOOK);
> +    return xsm_default_action(action, d, t);
>   }
>   
>   #endif /* CONFIG_ARGO */

