Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB4DCA600D
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 17:57:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443631.1660821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEsMW-0004xy-ON; Thu, 08 Oct 2026 17:57:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443631.1660821; Thu, 08 Oct 2026 17:57:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEsMW-0004xq-Jb; Thu, 08 Oct 2026 17:57:00 +0000
Received: by outflank-mailman (input) for mailman id 1443631;
 Thu, 08 Oct 2026 17:56:59 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xEsMV-0004xk-F4
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 17:56:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEsMU-00GnBA-Oh
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 19:56:58 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ac7d94e-8faa-0a2a0a5109dd-0a2a450cdbf4-40
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 19:56:58 +0200
Received: from [40.107.208.55]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ac7d968-f479-0a2a450c0019-286bd0371424-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 19:56:57 +0200
Received: from BN0PR04CA0022.namprd04.prod.outlook.com (2603:10b6:408:ee::27)
 by BL1PR12MB5730.namprd12.prod.outlook.com (2603:10b6:208:385::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.25; Thu, 8 Oct
 2026 17:56:51 +0000
Received: from BN7PEPF00000097.namprd03.prod.outlook.com
 (2603:10b6:408:ee:cafe::5f) by BN0PR04CA0022.outlook.office365.com
 (2603:10b6:408:ee::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Thu, 8
 Oct 2026 17:56:51 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN7PEPF00000097.mail.protection.outlook.com (10.167.245.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Thu, 8 Oct 2026 17:56:50 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 8 Oct
 2026 12:56:44 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 8 Oct
 2026 12:56:44 -0500
Received: from [192.168.19.2] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 8 Oct 2026 12:56:43 -0500
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
 b=hdZamWPNDMxGv3RAFDxJWnboJXPf/UvhDos0hd24Zp+5UzHOhhFfixuqcw4uEJmO6a6PE5yR/aGQ7CXzUTI+P398/ju1Eudag8mj0yqpLy51e7daLKpXDjPhNmetz5vslyR72vNYnvj3nqbJC3TzQ5f9TA9X/XpRpDGW+4Ntdgh0FvQqDbrw4gpRJQKT+0jjm2jt9SZ4hbH/WbR/w3T9G+3j5bCbYUqBVHChRYSYqXMQUngDfvk+V+zz0Au3IRvKB0ZHMcKEf6t1HcSTEgmPPeXtm/ntLyGWbGHUHRTA0dT4ym7efhzQ54sfQcyPWGu5QqoW1sTN44BSV39hreV40Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hcmfXU9nzokEMDfUM6eAdhEGwO0cEiWL+9WL0YUnHfk=;
 b=U7GrIVDT4xd3aIuvIradavOPhOi83NSFXQUGtrYzlg2CjQcAuqHvMjw+V+PsMN275jkcOvgcGykCdtYvh/wwseMlNO4KunQu8chluy5cxl3USPS8FqOQAPuUlutRlAYBVIPqy6Gfhnvjw+eX3O/a4Qzx3ryOpKQ8vhQgkGOOHXZGnnnAhU3E/pcm2aKh6vDe0D4V2y40Wf0iPGh8ji+nnVBurVwEC4ojzocbX8xPnlwCHM7T79s0BkQQUL/wKrQ4d/QLEkgdTad5rIs2CRSCl1cfhKYPcMwds4zNPUivbMh0diExFVmSTYsE7a3qkNOcD7GF+/nJ4oxw+8WGWHNp8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcmfXU9nzokEMDfUM6eAdhEGwO0cEiWL+9WL0YUnHfk=;
 b=mkGhRDWJj85xlE4Gnv31OGQFWl/tBnpgLB9jwf791bFVEOWXiL2tFilULUqfbwFxpFTSyifmnMWGlA1/rL4QB95x7CAErC6GdMLfc8JN8RtRhy6rqxAw2mQD0y5yCiZyrMiwGGJP5UpzPTYvOqW0Is1aadrmcSOhO1FZ6mNiaVY=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <6830b928-aada-4b5e-a62e-8083d13cb074@amd.com>
Date: Thu, 8 Oct 2026 13:56:41 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH LINUX] x86/PVH: don't truncate initrd address/size
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Juergen Gross <jgross@suse.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>
References: <9698d810-6664-4a9d-a847-18ad124261e0@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <9698d810-6664-4a9d-a847-18ad124261e0@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF00000097:EE_|BL1PR12MB5730:EE_
X-MS-Office365-Filtering-Correlation-Id: c595d7f3-a23c-49c3-58b9-08df256587ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|376014|1800799024|56012099006|18002099003|22082099003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	zFggqChIC/0M1C3y1OHlaQzRaOpuE9lElHCdzfo0g1A/UdQcqYad/SnqvQ2vCKjcxYHlEgmWBm1AM81HGEQgMqVQpNx9dlb13EIKynb4AhfIiC+8ULntSio+HlQWtW34SQL1cD3tOyX2ogjR067XDiErahykc3ME8Tk4AQLkjA/CChSPNI2whrxoSEWRPCbsoyw9ohYW2HeBMp5HhCSw1IROtUqNouq7wD1WahpxBipLRpM60ewOYqIFpw5WedOR1hr1YFsDw6cZ9eiFmZqOJggv7X+9TOR7IkN+55Z/VWOABGal1UBdmtzdu5SfCFl/ZUUy/V8yUN+Xgo4McF/WjSQFXGbzwuuJhxO5628t/6sRRboOFCcgE9naYJxTli9hrFrjntJ9c/S8G3rFhmRWBmacRnL6RF1bwARAwvBKSo6NyX3OTRV5LH4riq1id8HBqPOgwfSOTV3PxsvieJTOW6JBcXGX9kwF1rgu5vrQs/Qwf9IGglX+GCx/x+6nHkiFbFlPGGT2lcBIdOmfzUS3A5/UAoyeECqkuvjYWEvigNZBm/yR0kF80OBcQ3wmR/SrFXGcsg//Peyt1jCJP7uGrRzByC2SoaE2hp3dEskzUO61qHrSoYXyJs0fACqNmbFDON6OiQ10wZV3R5r+uyBb2a22pmib8xCaOyNVhXligQnnkDHVPMdttlO32WOUXHguJq9YXn2w2fuMeCNeK85x1w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(376014)(1800799024)(56012099006)(18002099003)(22082099003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5yd6da8pZBLmP4g4R/xfk82cZlRaP+2n6EIkLWmyfYqk/fITHwdfL8cTqULgvh6bzOQGf03KrL4T2GqeSlXHZfzX71Yhdc6+WWezi9QLe7JRs3CQS3ZM8MI6puagH7nSCtH37fRa+AW1SbY8cYEuLIBp7p4YbTCIN8i3QWDsLfjpYLU+DbK+DIqs6pwTS0IdLP+OTbhKQNwwbSV7zpaUhyU2vnj/lRYV6LOIRtQLKPdmpVS/lF5c0Tfp88dMRcWASIlzoingJ4W4drmFErmD44XJ6KWH4WTqljdwmm+xTyH/4SAb5oMaifJAOuLUfLERNZIv6tPxzkpTMrBhF47W+XVww8Re4fzMGLzkYpxX/rq6frwselaSB1CXaqIDxvEMHmLuPqVjlzf/SSAEVVvEC551x46FHO2tnSorJKoC2dCYq8BPlRbBfhUVvWvt1+J2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 17:56:50.9829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c595d7f3-a23c-49c3-58b9-08df256587ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF00000097.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5730
X-purgate-ID: tlsNG-d25034/1791482218-036D6A5B-DE0CF2DA/10/78276251493
X-purgate-type: spam
X-purgate-size: 388

On 2026-10-08 05:48, Jan Beulich wrote:
> Consuming merely the lower halves of the provided values isn't very
> useful. (While generally loaders try to place it below 4G, especially
> when it's huge it may not fit there.)
> 
> Fixes: 7243b93345f7 ("xen/pvh: Bootstrap PVH guest")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

