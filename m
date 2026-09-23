Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6EEC982EA
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 08:44:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429874.1652492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9IZp-0006Ch-9b; Wed, 23 Sep 2026 08:43:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429874.1652492; Wed, 23 Sep 2026 08:43:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9IZp-0006Ca-6m; Wed, 23 Sep 2026 08:43:41 +0000
Received: by outflank-mailman (input) for mailman id 1429874;
 Wed, 23 Sep 2026 08:43:40 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1x9IZn-0006CU-Tc
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 08:43:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9IZm-00CQl5-Pq
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 10:43:38 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab39139-2eae-0a2a0a5409dd-0a2a4508abd6-12
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 10:43:38 +0200
Received: from [40.107.159.91]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab3913a-f659-0a2a45080019-286b9f5bd213-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 10:43:38 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AM7PR03MB6279.eurprd03.prod.outlook.com (2603:10a6:20b:133::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 08:43:35 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 08:43:35 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UHlOvASWQf/r+mYyjBc9XNX23NQzvBDsVBdd0GyVfVwhpQoSwuA7jdNWOMv+y4HRbsgs3G6sa39m3/Zn/HqHyO09FKDx/SC5vbnTHGkA9WPy7n+PZzgLx/y9503sk3GIKPObjRuYzTO4QIePYpeeFWcnpur+P7Aj5JOoZQG57ChtgTRW0sX+loGD7PH0/NDoEPZ6sAwmNBCAjOIr5cXz6mKgFFAXQSjqAUv3xw+vWHTjaizqiEX/PEemN6SA+hjPFja8oXJ41x1jIg8YHb4QVeSPHlbJ7Wtsz8UApykfvhBmvwyGxxzi0vJ3aDeZq3WFcZQJMjAowHVnXZZ9A9vPEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n64lJMbCAgVr7AruNYNLVvzSp1ZgFlsjaz/G2tQ6xVk=;
 b=Hxk2otKgTElviO4vIyNToxxp/xGV4L7pn9gxDh3wXjFZFu2L/3UnB04Zf4wwNljrTCyc5dZfmU77NqnIrNSlZN1pPfufbONvUbHJcbwUh4nGKNdTBn8x4IooCaKK7cLHTTyJXDJ7pJQaMjO95Dc99K77kQzU4wdQ6N6OwsshLX+9o1FnkThmhHTBrwlrE3hH3En5lUolvXOvFKk2iHVYT1MqybUlg5l/m/o/CjZdPO4TA340DTxFFtEWExOSTMFmYbrOXazVXTS7GhJjVvGB4thvyALO7g5IjlmmTgBLS8OLLY43gguT+DOY7Jy5KMPdd8YW4/PG7l4yDkE2n3T4pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n64lJMbCAgVr7AruNYNLVvzSp1ZgFlsjaz/G2tQ6xVk=;
 b=XFgPPQIIWPQq96Y+Y5UuTw5u+sn+8Pfd132G0e+XUPZEliq6iMWoBIYZTfM5Pdqa18LWvT8cbODHKmfvDEyQ7VlXPDGWQcbCsoeJfDzIZVrBN8xJ+IMShBRavXiWz3q3WP4kF51Q1a7f6fqDF6gNczxYvQ/AGYytkNeul6SsrPVFM2uwK7PWuPzKvFOx6Czk+rrGGl1rsKAMVn0u0euSq5zA54nSxX3XSQdT+494n96IJRjR0PLgwL3bgqnYf70COWtUAeH3sADYWyALkgRHEDJqFVdcjzdHD9eX+rak8H5fMOW6pvREtbvRmlrVYGvibPLRaa3r24scr6iVB2tQgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Date: Wed, 23 Sep 2026 11:43:31 +0300
From: Mykola Kvach <mykola_kvach@epam.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 1/4] xen/arm: make is_espi() a pure range predicate
Message-ID: <arOQ03lG3MNwGGEa@EPUAKYIW02F7>
Mail-Followup-To: "Orzel, Michal" <michal.orzel@amd.com>, 
	xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1790056623.git.mykola_kvach@epam.com>
 <802ae2dd44556a292d98f1d52d3c88ce4fa5034b.1790056623.git.mykola_kvach@epam.com>
 <52255065-80db-4dae-8406-b1f75614ef9a@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <52255065-80db-4dae-8406-b1f75614ef9a@amd.com>
X-ClientProxiedBy: WA2PEPF000008BF.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::699) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|AM7PR03MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c9da111-e4a2-4c49-c169-08df194ec165
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|56012099006|11063799006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	gzre40hNQPUASRVmoVOvgxBU05r+Yk2MYR6bu1MESkRwNpjsobpT0HYxDV1vdNUl2QNErJC0k+dMzxI0nXhJfmKvw3l40/zfFjQVzL7Q5N60jKzR1ZbAcSzKtL2NJLqVguTpm+wbMybbPH5aZGWwchNpE72AxhVIqlgc2gYjsdF6ZrcnoVii7AJyWw0w4+/tdOgWck4V0DyeSab1dRJ07KIXX0nYg9Cf/RygIfbuLJT0EIzYYkKzA7vtDBsP26OtiptWS/CUSnSiiWp1zif1UgEqe/YxB5GvBHsXPwSRF4WHbwEmc54tXQUDP6QlMqI3/X3yy2sfyFuP52Otg37hG7PmknuPhulVbwOKhC/GICk4kHz8xiLX1U1nByd03IGEA6veumtnosGDMlO9B49TGpnPIs3qHE4cGe6p8BwR0ePt0k9U8ddSb9CX6ofTfW8z/MEDcjeWAKQE+T+H7AvMDm4i+odq85kMyW0CSG2aRjCtzLaMccL254Zdi56RrmI6IhkHoeAqNq4o9EXTw6UUWXOzNhJqAL4vtRQ3MyghVhDvVmuBiI5nTe1ZMj4osRNuwT9qOyQEjAcu0wUOzhGw3lAgqCIp3q5ODiLdzupHLo43dYT+YWVeTSBGmSKi6n4V6ehXC6pnGdTOiPBNW22L+2F57bTslFjEd/kEHqzZU30=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFZhNHZoMEltRHpCZDVtWStXeXFxZjJDYTJ1RkxFSE9saUVnRldaWlhmWVdN?=
 =?utf-8?B?V0Y5eWkwM1l6eFFLTkhxMFYzanlJMFJlOURpR3g1R0w1ckIvQXFDcnJiOXRL?=
 =?utf-8?B?MnVvdjg2UFQwaE1HbVg5MHE2Mis1dUZJOW45Q09xcVR3dFFYMWpOYWZBQUFa?=
 =?utf-8?B?YzAvRWtueno0MDZDcDU1R0Z5S1Y3UUVjTkEvNnRWVkxicldWYmJXYmtXVHN4?=
 =?utf-8?B?NG9sQmdHcWtjTG5LaEluSDBsVmkveFZIdGxoUVhTS0FuOGFOMUtmblRSeXFm?=
 =?utf-8?B?cTROelVNUHJYTXM0SU9kdkNOSWlBYzU1ZkVrWm1DdlExS3FReDZkczN0YnNs?=
 =?utf-8?B?b09DelUyTnlqUnVxWC93bXJYNFNlaElCQ0RwVDBMQ0pmRDdnQ2dFOFdrb1Rm?=
 =?utf-8?B?Nm9mNHN6dUxsR0FsRXpEZ3laSENqcmJsSUo0NDNxSzREV1RraWQ2YklnYnhi?=
 =?utf-8?B?NHhuVEJWZXJyNVh1WTRzVytkKzVMZ0gvOFRQRDNNd1lLMXVXYXdYWjV4OTlk?=
 =?utf-8?B?MnlKaDRSZHVMOG9ta1pDWC9wK3l0bXIyM2lQRXMrcWZ3TGQ1dUpHMDZoS2RS?=
 =?utf-8?B?cGxPQXgzQnY3cWovalRPajNSWTdtcnBnVDVzNjlWbVJYeFA2MVdhUTJ0TEZB?=
 =?utf-8?B?S2FZTGRrbkYvVzNrelVKa2xCbVNWWWVhdFVBSC9wVWhFVGV4OXFYN2tIL3hk?=
 =?utf-8?B?TnFTeGd4YmhkRlNmaUFtajNnZXFHV3h4dzJNWlZoMk5ESW85eC81Y3N5QTM2?=
 =?utf-8?B?UmJobEdGNjE4ODgwQVRCNEFHRTcyMDVWTlI1ZkZJeTJhTXJyMHZRNFh5ekNa?=
 =?utf-8?B?Q2pocExKc0lHK2YzYUhjNXNrdFFjZTFqckwzeUl4TUhqOUhCWVc2aWdMN1oy?=
 =?utf-8?B?MlFxMHdSTEdPOVlMWFJlZVFTOXVXQUQ4V1FUbHRXUWFYc1diM1MrMm1KSlln?=
 =?utf-8?B?eng3SlBvU0RkSmo2SDZIVVp1bmIyb0hpTC94a1RCdWJHeGtOcEhoVDV6aXQ1?=
 =?utf-8?B?djZIek1pNjk2YWdSeGJoWGZPL1VFYnRFQVptVWNMQ2tPbE5TTmhKL1JUblNT?=
 =?utf-8?B?OUZzWWZQNUhIRUZ5QVV2VnYyTjdZTUEvTWVIU0lFR0tNZkJ6OUVuYTlmQ1B6?=
 =?utf-8?B?eThYMTZIM0NLMG5OUTgrelBjS3pYeFBBWVZDbGxaOFM0YW9vdTVCL2I5N0xU?=
 =?utf-8?B?cmY5RjZQM3QrcXk0R1k1NmQvRTl2dFJScmVvV3c5MHdzbUZaNDQ3bGhSRnAz?=
 =?utf-8?B?MkpGYTVGV0ppR0ZvRkRlQWdjanlEdGVDUFlRZmI2WUh5VWNjMkE3MXg0a3dx?=
 =?utf-8?B?ZW1sZjZ4NCtXYUNOODlFd2h3Skszc004NjA4Nk5LWDE0TndHUCtmUUZ4NDZL?=
 =?utf-8?B?ZWVDdE5Dd2E3SkxZc0tScnNRd3ZVSHNRZFJmcXl6MGQ5a1FrRXArYVdqS053?=
 =?utf-8?B?eG01eFprcDFQemxQMGpRK2ZLS2ZOaUgwb2dBMVpueDBiUi9BcTlhdzI3ZzJm?=
 =?utf-8?B?L2VMOXo5ZzE1c0FtM2owR2cvVjlYVUR2MXp5RHVlVlUwVnFabjZPalFDNEdC?=
 =?utf-8?B?V0FtRjFOR1ZLaDZhcm1uUUtPOExFWVJwZmZRS2VVbG11dldGNHJWandhZ0lU?=
 =?utf-8?B?OVpQZ251b1lnRzhER0E0eGM4Q240bTdkczZSMk1YYzVxellod0QwaWgvTmcr?=
 =?utf-8?B?enRmQ3lQZjJzTXk1NGdURG1FMUNiQzg0MDRTUjBHOXVSMVpyb0ltTEUwSVkw?=
 =?utf-8?B?SzNxMnVZeHVPZTcwNnpBWjlzWXZrU2o1K1hQN1BOaTlxdHAxMjBlOVF4NXhX?=
 =?utf-8?B?K1FzRkdvV3FyeHg1Y09ZY3U1M2JRSXZWcHFDNU5IVS9jbGs4YXA0TXBLT3hB?=
 =?utf-8?B?MkkzSnNyVmV1Z09HZEI5NE5PT2ZIMWZ6WmRpNk5IQzRZZGtwb01zckhYVSsy?=
 =?utf-8?B?Vm85VHFQUkpZbHg2WmM4c01BR1k2cVY1WHVyYjQvWmJRM0thMVEwejRwT0J0?=
 =?utf-8?B?VDZxaUNUWnJEVUppUm5LYjI3cFpUcCtkaWtkVC9hbWdUMW1IcmJyN2U0THRU?=
 =?utf-8?B?Z3lxWDM1RlRqcUZMbzVhdmdIQTZYSGpYZ1BjSEFqZXAzTGM0ekxTRDByNE1m?=
 =?utf-8?B?Z21qWmxVcFE5blI2MFEySFZUNGlDaDhEUC9iZ0xmQXNNY3AvdzIvNy9kbkFh?=
 =?utf-8?B?MVlWK1h1SytzaGM3Y3RuSzNpNlNaNWJabkRkY3VEMmpXcGdXL1IwekFicnlo?=
 =?utf-8?B?UGtqSERrQnQxaiszV2dKVXNjOU1HQkhpU1RydHkyOXNjNklqY0g3ZWwxZk51?=
 =?utf-8?B?VTErMzYyVmY0VkFIWUh3OVkzc3FJVEIveFNaVy9hNGFUNTFWZVJIQT09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c9da111-e4a2-4c49-c169-08df194ec165
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 08:43:35.4563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MzfDjK47x4kzsC+5OtihB/fYlL+oSt3Bkg7F+lxsHLiJN0+CgQ40NmFkBIamrGUrJ3KFrIFVKFiATvQ1tpjfwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6279
X-purgate-ID: tlsNG-c1860d/1790153018-CE94287B-CA610B2B/0/0
X-purgate-type: clean
X-purgate-size: 5224

Hi Michal,

Thank you for the review.

On Tue, Sep 22, 2026 at 01:19:57PM +0200, Orzel, Michal wrote:
> 
> 
> On 22-Sep-26 08:39, Mykola Kvach wrote:
> > is_espi() currently changes its result according to CONFIG_GICV3_ESPI.
> > Without eSPI support, it returns false, and its assertion fails if
> > an eSPI INTID is passed. Callers therefore use it both to identify
> > eSPIs and to exclude eSPI handling when support is disabled.
> > 
> > Make is_espi() report only whether an INTID is in the architectural
> > eSPI range. Check for eSPI support at the call sites.
> > 
> > Use BUG_ON() if the GIC reports an eSPI without compiled-in support,
> > matching the handling of unsupported LPIs. Return NULL from
> > spi_to_pending() for an eSPI when support is disabled, using an
> > espi_to_pending() stub.
> > 
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in v4:
> > - Clarify the existing is_espi() behavior in the commit message.
> > - Drop the unrelated blank-line removal in vgic.c.
> > - Use BUG_ON() if the GIC reports an eSPI without eSPI support.
> > - Drop the redundant CONFIG_GICV3_ESPI check in IRQ dispatch.
> > - Return NULL for virtual eSPI lookup when eSPI support is disabled.
> > 
> > Changes in v3:
> > - New preparatory cleanup requested during review.
> > ---
> >  xen/arch/arm/gic.c             |  2 ++
> >  xen/arch/arm/include/asm/irq.h | 11 -----------
> >  xen/arch/arm/vgic.c            | 30 ++++++++++++++++--------------
> >  3 files changed, 18 insertions(+), 25 deletions(-)
> > 
> > diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> > index 078049e741..3a7f972826 100644
> > --- a/xen/arch/arm/gic.c
> > +++ b/xen/arch/arm/gic.c
> > @@ -348,6 +348,8 @@ void gic_interrupt(struct cpu_user_regs *regs, int is_fiq)
> >          /* Reading IRQ will ACK it */
> >          irq = gic_hw_ops->read_irq();
> >  
> > +        BUG_ON(!IS_ENABLED(CONFIG_GICV3_ESPI) && is_espi(irq));
> Usually BUG() should come with a comment explaining why we cannot continue. Here
> it's that without config enabled, there's no descriptor and no pending_irq
> storage for it. Please add a comment.

Ack.

> 
> > +
> >          if ( likely(irq >= GIC_SGI_STATIC_MAX && irq < 1020) || is_espi(irq) )
> >          {
> >              isb();
> > diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.h
> > index 09788dbfeb..c29f3d04a3 100644
> > --- a/xen/arch/arm/include/asm/irq.h
> > +++ b/xen/arch/arm/include/asm/irq.h
> > @@ -66,18 +66,7 @@ static inline bool is_lpi(unsigned int irq)
> >  
> >  static inline bool is_espi(unsigned int irq)
> >  {
> > -#ifdef CONFIG_GICV3_ESPI
> >      return irq >= ESPI_BASE_INTID && irq <= ESPI_MAX_INTID;
> > -#else
> > -    /*
> > -     * The function should not be called for eSPIs when CONFIG_GICV3_ESPI is
> > -     * disabled. Returning false allows the compiler to optimize the code
> > -     * when the config is disabled, while the assert ensures that out-of-range
> > -     * array resources are not accessed.
> > -     */
> > -    ASSERT(!(irq >= ESPI_BASE_INTID && irq <= ESPI_MAX_INTID));
> > -    return false;
> > -#endif
> >  }
> >  
> >  static inline unsigned int espi_intid_to_idx(unsigned int intid)
> > diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> > index e5aca17dcb..e04678f134 100644
> > --- a/xen/arch/arm/vgic.c
> > +++ b/xen/arch/arm/vgic.c
> > @@ -62,6 +62,13 @@ static inline struct vgic_irq_rank *vgic_get_espi_rank(struct vcpu *v,
> >      return &v->domain->arch.vgic.ext_shared_irqs[EXT_RANK_NUM2IDX(rank)];
> >  }
> >  
> > +static struct pending_irq *espi_to_pending(struct domain *d, unsigned int irq)
> Constify d, please.
> Also, use static inline like the surrounding helpers.

Ack.

> 
> > +{
> > +    unsigned int idx = espi_intid_to_idx(irq) + d->arch.vgic.nr_spis;
> > +
> > +    return &d->arch.vgic.pending_irqs[idx];
> > +}
> > +
> >  #else
> >  static inline bool is_valid_espi_rank(struct domain *d, unsigned int rank)
> >  {
> > @@ -78,6 +85,11 @@ static inline struct vgic_irq_rank *vgic_get_espi_rank(struct vcpu *v,
> >      ASSERT_UNREACHABLE();
> >      return NULL;
> >  }
> > +
> > +static struct pending_irq *espi_to_pending(struct domain *d, unsigned int irq)
> > +{
> Add ASSERT_UNREACHABLE() here like for vgic_get_espi_rank().

Ack.

> 
> > +    return NULL;
> > +}
> >  #endif
> >  
> >  static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
> > @@ -696,8 +708,8 @@ bool vgic_to_sgi(struct vcpu *v, register_t sgir, enum gic_sgi_mode irqmode,
> >  /*
> >   * Returns the pointer to the struct pending_irq belonging to the given
> >   * interrupt.
> > - * This can return NULL if called for an LPI which has been unmapped
> > - * meanwhile.
> > + * This can return NULL for an eSPI when support is disabled, or for an
> > + * LPI which has been unmapped meanwhile.
> This puts LPI and eSPIs on exactly the same level which is not correct. While
> unmapped LPI can happen, eSPI with support disabled must not. Leave the LPI
> comment as is and clarify eSPI in one sentence.

Ack.

Best regards,
Mykola

