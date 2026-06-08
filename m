Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE70CD6E79
	for <xen-devel@archiver.kernel.org>; Mon,  8 Jun 2026 23:28:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1332141.1594788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWjNm-0003yp-N0; Mon, 08 Jun 2026 23:27:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332141.1594788; Mon, 08 Jun 2026 23:27:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWjNm-0003yi-Jy; Mon, 08 Jun 2026 23:27:50 +0000
Received: by outflank-mailman (input) for mailman id 1332141;
 Mon, 08 Jun 2026 23:27:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wWjNl-0003yc-2F
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 23:27:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWjNk-003p0F-01
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 01:27:48 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a274f99-bab6-0a2a0a5309dd-0a2a4502cd40-24
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 01:27:47 +0200
Received: from [40.107.209.20]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a274ff1-af86-0a2a45020019-286bd1141af3-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 01:27:47 +0200
Received: from BN1PR14CA0016.namprd14.prod.outlook.com (2603:10b6:408:e3::21)
 by CY8PR12MB8242.namprd12.prod.outlook.com (2603:10b6:930:77::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 23:22:26 +0000
Received: from BN2PEPF000044AA.namprd04.prod.outlook.com
 (2603:10b6:408:e3:cafe::13) by BN1PR14CA0016.outlook.office365.com
 (2603:10b6:408:e3::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Mon, 8
 Jun 2026 23:22:25 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000044AA.mail.protection.outlook.com (10.167.243.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Mon, 8 Jun 2026 23:22:25 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 8 Jun
 2026 18:22:25 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 8 Jun
 2026 18:22:25 -0500
Received: from [172.17.22.200] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 8 Jun 2026 18:22:24 -0500
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
 b=utCD8fr4Cum6qwed9M31uV1xt8NXQH/fel0b8nnkjmr7N+cPPVqp2xBv7WiQ7KUDGoqiup1l3QlPebNT1JTZgsDx/XWjOfx1WJTEIr2zR6DHkHdWuyRgdxeaKaCX78U5F1Y89dsNmg8DLNvT70TeYlZz8aesr0fRM7amVneMDbtXA2hosl7yTLh7fFlCRd7nVbz5EyvJ17MFU85jB1fohTGo0JhBwKmaNlrzWQxC0l4mscxL0L3wufjYG/F2VyQksicgQ+KSwLdaW3PVkX1BA47sXifqIa8hfkrvHmT179Ck1BFpGqsI0YTwqH/lfn6O2T5SSZUR9bzy3CtR8WhtZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/LcxsuNzH4hTbvnUOO6jZWxYx9imrDqFjuTPoMu0oo=;
 b=GgF8vh/1FFVhxxXq5hzN00/piogJk1MifkN6YDNdOUrT1veC9wwtMkioDe+r9k5X/5MTZ+P+HCGHkvTad5oHIs1Y4p2GmgMKOvjLJfEVNgV/Ne2dR78E2VRjaszFY2t0wLBbfTPaWNIlFQX8RNORyP9HQVt2SjshNi8TuLIkoC73kCmv5DzRa2LukAYU+r0XaROBc1ghcO4yzMM0D0w1C6WInnZLrcOkbaFS/DIIRAkutr/HOjhF32GjnP77hw0tCdg9gufAcGbOi1JRRupjV3rlYYOOd21SiObM0Nxq6VZt0+9SNoQ1jGEP1DoGWvItU0iYZAwmm6ZRF1T5oueN6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/LcxsuNzH4hTbvnUOO6jZWxYx9imrDqFjuTPoMu0oo=;
 b=1hp/nM3ibCsmd4cPwA3BHRQ/91eUhZMJtYl4F+QAdU49iHnXAiK4bLxE5VaBUv0uL3yIc+n0PwujtI2cYVZeYwksv2OVuT/2cdWnvAY+bSmlfIVsSalApup+h0frO25qpwKPWv3wmr/1CuopjkKS6yHNZHYZWc90hOlmDBns0y8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <c51ecc59-7252-4d1f-a192-717ae55dacd5@amd.com>
Date: Mon, 8 Jun 2026 19:16:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] argo: lower level of noisy connection-refused log
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>, <dmukhin@ford.com>,
	<xen-devel@lists.xenproject.org>
CC: <andrew.cooper3@citrix.com>, <anthony.perard@vates.tech>,
	<jbeulich@suse.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<roger.pau@citrix.com>, <sstabellini@kernel.org>,
	<christopher.w.clark@gmail.com>, Mykola Kvach <mykola_kvach@epam.com>
References: <20260526215823.1452619-1-dmukhin@ford.com>
 <20260526215823.1452619-2-dmukhin@ford.com>
 <ae19de19-aef5-47af-833d-87a46efb9afc@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <ae19de19-aef5-47af-833d-87a46efb9afc@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AA:EE_|CY8PR12MB8242:EE_
X-MS-Office365-Filtering-Correlation-Id: 18bb9469-04ea-4c1a-6a81-08dec5b4ccfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|36860700016|7416014|376014|82310400026|18002099003|22082099003|6133799003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
 Xw1NRWjP6lVNC5Wv4PyGk43rbRGw+1RpIB1XtGfn/+ZoWdSPivBMRz7nNd1obwnncufw55oSSHnWwBdUwbU77FPBftCokutTt+aw1pcksjYGm18rV5I5t3zHPL1xaiU9bAH+2Tmse2mbJkNYrTiKwLcEgs1Kcclzx0I+5QhBO5oIAqBkorfqb7nygTBsaQZhsZyvKUF8PTBF8mM5lztRfS1zOu+1VK3e277bj/EzOA1aBjSQ0Yo3urA81ogdxs9Y6TpBQ4Gz/J2B4p1tZoldshlNZtEPnVEbC21ZIuCHTk+4b3bfYQPs6KOxcJtbV7m92zHOzwW3iB0ax4e5KIsfsmHkOQSFwYOCVFzkVnqUYMEvMZVuBiz52F2Q2f7dpzhAQNKQC4kJ33Dw8i/9u4J1VfsjqGsAbG7Y+4508JiKHeBxFR9xRjeJZbfQOpkRkZ/rQqMNbTNYfqznqmYTveGtIyarbksaLg6+dx+cvA4ZEO3doPBUXT1y20NCG0n6hOAF1QIwdxpOcXF8/4ZYn0SZ7O1BP1XTCcIxkIit+rgtPQWYDcsoONM3aPnipKybwKisSG0RmnVwtEjErbuWudBSahzpU+unsb9+hh7LOkQ2TeacRPHnxC+zra2VB/SmH5hrkzthM4ZS70Zlh5+IXeBBlQWm1GflCXl6RiFIHfImZdkv39OVkurbYbcF2v+w4nOJ08cSLgt4yBbdvvImCORcORqauTIFsLHnEADi65LI/XM=
X-Forefront-Antispam-Report:
 CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(7416014)(376014)(82310400026)(18002099003)(22082099003)(6133799003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 VLUDVvkfdRjGYgbbOQon8U/Q+W1DkK3H/D8gdzxCLecYOUV3ybPcfwyIJNC64mgBQtSyRrwP0JOyh8YBilkapuocyZRYdA26IO8jPN0gimTzUvcQilK/dIiDykXj1luHOpgMqbpJH06BUkkbVlRQanVbMkXBt0hRvRl+sA+9lg3W4voiliZqD/VDHulxuOBDokY1+rzDTnjuhhDG7Cc3cjNG+30u8ohv29uZDv5ctp9xMYUQUNxqxrmdmIGp9TuiAIHa0bT7j5AQWndiC9JZcYxSRpxtjw1j0e9pDY0OF18b3qFaQ5cSpOYsQ1/NlcryYx3PJZvcqS41f/jGrFRCVIlgVVQd7kloQAsDBuPgEwSc5jrStdtkh2V0hHX8Mc6QfV/Li4ZLkdWCoJbCPoFiPSv1pOjLoTBZxng+Bt70KXLOyyCjHvig7cQzDWY9to4E
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 23:22:25.6643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18bb9469-04ea-4c1a-6a81-08dec5b4ccfc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
 BN2PEPF000044AA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8242
X-purgate-ID: tlsNG-720697/1780961267-83961161-6EB3DCB5/0/0
X-purgate-type: clean
X-purgate-size: 2519

On 2026-06-08 15:54, Daniel P. Smith wrote:
> 
> 
> On 5/26/26 5:58 PM, dmukhin@ford.com wrote:
>> From: Denis Mukhin <dmukhin@ford.com>
>>
>> Switch the log line to argo_dprintk() so it is enabled only in debug
>> environments, as it can spam the logs when a dom0 service using the Argo
>> hypercall tries to communicate with a domain that is still starting up.
>>
>> Note that this also lowers the log level to debug when the argo_dprintk()
>> facility is enabled.
>>
>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>> Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>
>> ---
>> Changes since v2:
>> - updated commit message
>> ---
>>   xen/common/argo.c | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/common/argo.c b/xen/common/argo.c
>> index 28626e00a8cb..98a3db7fd070 100644
>> --- a/xen/common/argo.c
>> +++ b/xen/common/argo.c
>> @@ -2034,10 +2034,9 @@ sendv(struct domain *src_d, xen_argo_addr_t 
>> *src_addr,
>>                                           src_id.domain_id);
>>       if ( !ring_info )
>>       {
>> -        gprintk(XENLOG_ERR,
>> -                "argo: vm%u connection refused, src (vm%u:%x) dst 
>> (vm%u:%x)\n",
>> -                current->domain->domain_id, src_id.domain_id, 
>> src_id.aport,
>> -                dst_addr->domain_id, dst_addr->aport);
>> +        argo_dprintk("vm%u connection refused, src (vm%u:%x) dst 
>> (vm%u:%x)\n",
>> +                     current->domain->domain_id, src_id.domain_id, 
>> src_id.aport,
>> +                     dst_addr->domain_id, dst_addr->aport);
>>           ret = -ECONNREFUSED;
>>       }
> 
> My apologies but this is not the wisest approach, hitting this is a real 
> error and shouldn't be getting silenced.

-ECONNREFUSED is still returned, and that is the important part, I think?

While gprintk(), it is trivially guest triggerable, so I think it wants 
to be a debug message like this change made it.  As a comparison, errors 
in event_channel.c are gdprintk().

If you are seeing a lot of
> these messages, I would suggest asking yourself why. Without further 
> context on how you are using it, one suggesting is perhaps your 
> connection model might need to be revisited.

There isn't a way to know if a port is available without polling?

Regards,
Jason

