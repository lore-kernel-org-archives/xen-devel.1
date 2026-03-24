Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BCBF54ADB
	for <xen-devel@archiver.kernel.org>; Tue, 24 Mar 2026 17:10:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1261187.1554290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w55Gu-0002xv-Ty; Tue, 24 Mar 2026 17:10:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261187.1554290; Tue, 24 Mar 2026 17:10:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w55Gu-0002xo-QM; Tue, 24 Mar 2026 17:10:28 +0000
Received: by outflank-mailman (input) for mailman id 1261187;
 Tue, 24 Mar 2026 17:10:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Stewart.Hildebrand@amd.com>) id 1w55Gt-0002xi-F1
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 17:10:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w55Gr-009oRH-5W
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 18:10:26 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69c2c573-e002-0a2a0a5209dd-0a2a4504829e-14
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 18:10:26 +0100
Received: from [40.93.201.43]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69c2c580-c823-0a2a45040019-285dc92b0a99-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 18:10:25 +0100
Received: from PH2PEPF00003854.namprd17.prod.outlook.com (2603:10b6:518:1::74)
 by DS7PR12MB8323.namprd12.prod.outlook.com (2603:10b6:8:da::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Tue, 24 Mar 2026 17:10:20 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2a01:111:f403:f912::4) by PH2PEPF00003854.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend
 Transport; Tue, 24 Mar 2026 17:10:20 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 17:10:19 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 24 Mar
 2026 12:10:19 -0500
Received: from [172.24.66.250] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 24 Mar 2026 12:10:18 -0500
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
 b=JL4Gs6tjlx1h81wcV9aSS4C5ubNfVesAtrYhNMLaxP8UmHsFaY0938VFby1Qx2U6Ak9DUL6YaitaT9HqplKmWWe4cLf4pBk849oTQIJNOnqlUxLVMzlUpGdm/fi89NGUpa9V+ZaWXtDgywmIlqrS5kx4HLzhlCerYYdXiXonaPeOOkSrXBb9iqBUMUWCJQPtxW/fRok122pxTVq4WeCIcbFOK0L27Y1pgSMEY68WdUFdPH3vUf4ERrnC4OqpNhGukDnz3Obl4rfQ3p/gbZlenRVR8NB0AtB+VqmUDMnzgZ7H2jLAE8jb7p48aqX6yiUJB+1JhN724iMZDCd27GGpug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0Ycnt3TcU5xZ6fDy6W+2rUveknrflnOUoPUpGf64OQ=;
 b=BuuhzFfAMEWg/hsKN4Hd6NLVciLsEIXXl0/nXO3h9fuKnYNs8gUrzSb0wjoagc0SlJK7H7RIGXweahwwKHVg6OdAwcw+Pnw5WW/1//3mGiLng5rq0NdLUKJaT9HHa+2/sXWPcqXQU/Z+lHsj9PvHW6/Rsc9u2OPMNHfz3/ctBixDuq5GR8Nl/ZIywyYb2lm5jCLWJm9ebz9wVYlvW3sn/PH9wpe5/miz1f/KIXD9+xtPYvUXAJvWLCu9Mh4eKg4jzlKF/6FlOlIpbzQTCz3JT/7KyzxRTM5D41vp0Rpsgm29/d02fm4zo5I+3ec/M9EkQBn1vVKTzlPfhV/3zx+oJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0Ycnt3TcU5xZ6fDy6W+2rUveknrflnOUoPUpGf64OQ=;
 b=tPh6BNfcfJcmIR7RPcoFz96Z1H8kSK5IFvO0dtrmIJTnFL85+RnZI8nd3HATQFFJd9WHiB1uwsgD4TjIjvAKdwYTXqEa8NeoO5GLzFDOQQZzegvjfNxEROSwKY8gvbp3y3J0vGmxVkjA9DTUNlke+maLW+PbJyDM8e/QZyTwu/M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <435e3eb6-76c8-4ac3-8838-ccb7174a13e7@amd.com>
Date: Tue, 24 Mar 2026 13:10:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arinc653: clear entire .dom_handle[] for Dom0 slots
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Nathan Studer <nathan.studer@dornerworks.com>, Stewart Hildebrand
	<stewart@stew.dk>
References: <3cde1263-d5fd-4bb0-a0ce-c5bf5d735a20@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <3cde1263-d5fd-4bb0-a0ce-c5bf5d735a20@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|DS7PR12MB8323:EE_
X-MS-Office365-Filtering-Correlation-Id: ba85878c-e2a0-42cf-ff57-08de89c83a65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|56012099003|22082099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	kkFZF36j7fWZOVpfhdCk9xdA6s0FJACBaivWvf5UtziKMuh5MWDlO65MKpeWctVW3vED2M0mbW3Uyowu33U2b1L/lU0T+FIzQQVFg24tLzHb+Wg0Zf63KeUWH+OGfc93m9CHg6pB+TpQeBLyUFe2Wcy58psx19eiBO2ls3CmCoiquLVJAU4ENFMy9NvVPjwkbjDToDJdwXcuB+jzXU5JvYJcHizwFQuThMrn1dO8D/QtSqZB3RYjjN0pXdxk4lKCAcmkbIJ4+Pkf05In/0a0KTSC6ordkvVibVWrCYYQUoNbw3QiqhFBa49S5X6Uifw7EPseonKiQniR4DTgfpnUUc7PekSOqIB1fj5g2X2DPqb/AiI44Bh8zBO0zSEEGR3XdxBwlhWlXMWef/BSG5PBPJnKC1jTWiM4mTUAMjyn4GAsb1TY4UUciWKuB8mcVwipwtA6RjNHBnex6oMq1sNbVwtup7R+4sfByplDFpesd7YaoL29c9tWFOX9MO/C6zTDtRT4wMRsPygj2BSeQROXgutD+0ktpOnL9u9ywcMwEMo2ijUZKJ40XWkmJFDaob2K1vBrCJaq1/gi/tiEgYFM7QGwDi/Kyqe/Zl1OMJabmC6gogGbYd74E5SNFPcQQMjLa3upkPy8Vhd2XpSxVI7WYViPamjBh339frJflvlFTmMiXrvhIh2zSInf8r9GcZuQAfUX9mPbSLFXCBNHsZfppDzpXMR8r2AKlnai7wZO+vs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(56012099003)(22082099003)(18002099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Sj3vzLTcAaNVtDjMFTjiLo0wsmjlYT/NIUdT0nDpvOKRXYrQg91P18XR0LNuzslqcSmXd0Bw+auk+yZ3ZQhmrkLPpqURS3CSW3430Kl3u8XtwBWmXG3z4BQ++00FAvs3V0B3E5KKOmlV+Zhixx38cLhx/UR1u5ctnd41sKODaqLsExOULH2+1Tsrym75u0784VGSdyFRkbGgu5oFwyFHLUCbmdfjmCd3pf3B9txzxpfAegY1AOVcdMCaSkgnN2zf7scDwlzX9BBTrHR11VhxJfCY8eth9M/D1n1g6vcHdc2coHpx52FnQIzqBIlgYl2Snuvcceep2mH9oAgaV3WwRC2UuO7T1ymddp1/qlHnX+uzo5tRpDpTtzzIIDvD00VhKnmtF6EznsuiwBbbTjED3ar3EXq1vS3j28+gXk3fCYwZ7NZZ1gL0YwDKrT4D3+gz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 17:10:19.8434
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba85878c-e2a0-42cf-ff57-08de89c83a65
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8323
X-purgate-ID: tlsNG-ebf023/1774372226-BB29A9D1-B93C5712/0/0
X-purgate-type: clean
X-purgate-size: 2569

On 3/24/26 11:54, Jan Beulich wrote:
> When that code still lived in a653sched_init(), it was redundant with the
> earlier memset() / xzalloc(). Once moved, the full structure field needs
> setting, as dom_handle_cmp() uses memcmp().

The whole a653sched_priv_t *sched_priv is still allocated in a653sched_init()
with xzalloc(), so it's still redundant post-move. With that said, the code is
only setting the first element (of an already-zeroed array), which is suspicious
and misleading. What we really should be doing here is copy unit->domain->handle
to sched_priv->schedule[entry].dom_handle.

> Fixes: 9f0c658baedc ("arinc: add cpu-pool support to scheduler")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> There being no "else" to the if(), what about other Dom0 vCPU-s?

The condition is checking minor frame entries (i.e. available slots in the
schedule). Once those are exhausted, Dom0 units beyond
ARINC653_MAX_DOMAINS_PER_SCHEDULE would never be scheduled. Currently the
scheduler only supports scheduling a single unit at a time, so this way of
adding units to the schedule would result in Dom0 vCPUs being scheduled
sequentially, which is incredibly inefficient and unlikely to be what anyone
would actually want, but I don't think there are other possibilities given the
current lack of multicore support.

There was an effort some time ago to introduce multicore scheduling, see [1].
I'd be happy to review if somebody wants to pick that up again.

[1] https://lore.kernel.org/xen-devel/20200916181854.75563-1-jeff.kubascik@dornerworks.com/T/#t

> And why
> is it that domain ID 0 is special here, rather than the hardware and/or
> control domain(s)? (Likely the latter as that's what would invoke
> XEN_SYSCTL_SCHEDOP_putinfo, and hence needs to be able to run without
> that having been issued first.)

This likely should be updated to is_control_domain(unit->domain).

> 
> --- a/xen/common/sched/arinc653.c
> +++ b/xen/common/sched/arinc653.c
> @@ -420,7 +420,8 @@ a653sched_alloc_udata(const struct sched
>  
>          if ( entry < ARINC653_MAX_DOMAINS_PER_SCHEDULE )
>          {
> -            sched_priv->schedule[entry].dom_handle[0] = '\0';
> +            memset(sched_priv->schedule[entry].dom_handle, '\0',
> +                   sizeof(sched_priv->schedule[entry].dom_handle));
>              sched_priv->schedule[entry].unit_id = unit->unit_id;
>              sched_priv->schedule[entry].runtime = DEFAULT_TIMESLICE;
>              sched_priv->schedule[entry].unit = unit;
> 


