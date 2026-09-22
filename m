Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 895B1C982FE
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 05:12:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428100.1650790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8snD-0005Ly-5v; Tue, 22 Sep 2026 05:11:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428100.1650790; Tue, 22 Sep 2026 05:11:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8snD-0005Lr-1o; Tue, 22 Sep 2026 05:11:47 +0000
Received: by outflank-mailman (input) for mailman id 1428100;
 Tue, 22 Sep 2026 05:11:46 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1x8snC-0005Ll-58
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 05:11:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8snB-008U41-Eg
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 07:11:45 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab20e0c-e002-0a2a0a5209dd-0a2a4506a232-18
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 07:11:45 +0200
Received: from [52.101.65.105]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab20e10-195a-0a2a45060019-3465416938c5-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 07:11:45 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by GV2PR03MB11789.eurprd03.prod.outlook.com (2603:10a6:150:36f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 05:11:41 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 05:11:40 +0000
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
 b=xRKFM+zIqEPS2Pr/L9Rr3+LP7fF9dY4J4BcaQzhKy6cs5TOGkFH8OSQmHs2OlWUucbPVLbEMGyToxaJQU08bCxiaZZ6BaXRDqnaFM2jkPvlxTa4JEGTJEkJGfyfuJj2jtisW2wWUaZAs8CHIHSL9y2p1siH1XR1MCr4cbdP1i03/2i4kvDhXiaT3NVZTrCo44ut3qeWSMGuN3ab/i6PhoiDCLvhdhqv/XwZD+OtBZdTGJM//zWM3YS54AD0es3HCAdg9FvzSj/VcUmHkCv/NK4CcsQ6Tqx0x4dweVLSHanYnRut99lCL1UW3lYAYOMEgQiaTrFPARC7dbI4gTga5Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VPCuvSRLUYD57vrjBunyS6HWGCVwnF9nbgRZK71kh2g=;
 b=lHEcjqSKj/gpaYOkkClmbYE4P1ytQEEnw+II0uvWioHsfSrmKSgn4NsZn00UhJ1+li7/MEDsGsfHeMUANHELa8RTEbELf2LDwXPGGDWfnQhNk4KZgxdNrIs+Z4uD2Y2lxMhYm8MtmbS9d2UJ1eNPA/+UmNYIoj/h/671eiHP1G5C8knoZ7tEOGeKWwN3zILZg7wlolCVTne3RLGbQj3w/hHvKD1xUfrOu3lZPpCamMoWS5iNa4a/VRIOyGlmldxaRAzYLQ271R8UIM5gWmGzK7SFdUKgFIqZsL0BvywWDEa7qlDFDYp4HkE6L2f/kLnV+2KD+lxMqyGk8spiXLhRGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VPCuvSRLUYD57vrjBunyS6HWGCVwnF9nbgRZK71kh2g=;
 b=EHpOEOG9ZuV6GWheRDZk8Hn4IhKboE2AIQ/znyAUr0Oi1kM1AnIgjLpRJtcY/LAv/j4xGssv8B6ktC5EqdBIbuIv1RnxS2Tdd4v+Q9aO8zPqnDppt0GdF56o4nsLUeEV8kMjTe2ZKjDY+cVrwdeAZxkvgVQajU6gz0isAT3NtDt2ZLBJopA3CDRFvIUoE8wQaQt+12DyzXxLjMLSnaiJo9p8Qeq0ui308F6x0oub5n/CY4KeK4tbUREFuA2PNEMGbFFmPFXP43G214GzfmbvLVcxK5Hr+BWqyWtXUWvlD+9vavm1M7UfFBjddm5AqNpiluZ6zB6IC4U0/GtX+i+HEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Date: Tue, 22 Sep 2026 08:11:36 +0300
From: Mykola Kvach <mykola_kvach@epam.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v3 2/4] xen/arm: validate IRQs before descriptor lookup
Message-ID: <arINkOK7dLgCMHLe@EPUAKYIW02F7>
Mail-Followup-To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>
References: <cover.1787050437.git.mykola_kvach@epam.com>
 <355ff5a0aab671894a527ccb7b5999db6b168de3.1787050437.git.mykola_kvach@epam.com>
 <87fr03xcr1.fsf@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87fr03xcr1.fsf@epam.com>
X-ClientProxiedBy: WA2PEPF000008BE.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::691) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|GV2PR03MB11789:EE_
X-MS-Office365-Filtering-Correlation-Id: 03ddb63f-bcca-49c3-8b89-08df1867fc79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	VTZ/AY800Z6fFVDfTrEqw0LEta+WnysYhj9QxelRU02gv3kP6uZZP0VtLQWSUo9mWXVN7WtwYHdwSaH5IZqyF3lUCIFbR0uH7ysMhfdPrGzjphvs1kSuw/BSlvZTiejWH114ZMP5W/1F1x2/FuMdw+8+rUBe4sgFGvcpg6z1WT9M7J7rH7nkNsqgVsPBiAjSzvVJYmZr+hJI5irgPeQUFt/r7YHBcKneKHABM8XW7arC/29thvGr19wkeO4yrbtNXkxIzAjhT09asNUVxwgQ02DxUZsacBIUOsbSm6qMRySTZ3mL0H8ltveTCbaNQjOa7USZbVv8t17yheOMk8kSXZtaBSlChllwGIPQRgqpoi/dMWaAGg0DnylyvuIIYFaKNcOCHObLKdB6XxmW00dXGr+wO5Tk+LA2pEyUhtqJc8T63EAROvdjzuzYEFABo7GPX92m3kSg26m1Iu6GV8d2Es0omABrZ30e+EYVxifak6xOAR5cVmsYJUnP9slIWGzn/yjUZlrT3L3QN2BuGpNRu77/BjQAYB9FxzYgOq0G2mDGtfQzEKbDM57iE6QsE2QBL5MdKDC4NzzFWd8oCqJEAh4fcKn8xS5k8ccElTpitXWS3H3AcexsCEuBJQ+C7b6mFHaBWuBZFCjsVs+NBxXCo23cWx58KestgkLvzfLTcUc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzQrajdqY0VtWnlQSXBadk5MSzkrcUFKZHQvLzlQNXd4QnAwMU5Vb3pub1pU?=
 =?utf-8?B?QzN0eU5Gcm5mc3lySWVJSFNGMXd6dlIwZHoxRGN1R3NpZk1zdHFmSFhzc055?=
 =?utf-8?B?amg3WGJaa0xJOGk0czNZN3BYMzRtdGVXdmZYUklWdnFudUJaeDhKZTI4NDUy?=
 =?utf-8?B?VUNiWGpPM2lPdXZlZWZJOU4xY0RrVFFLMjMxWkE3ZjRCUmhnOXhTb0FXWFps?=
 =?utf-8?B?UzBZbXBhdVYweDJiQW5QQWxDSitJcS9jbk9pQVVUZjhmYjBvNkgrLy9ObXFo?=
 =?utf-8?B?MGVlVHdOcFRXYjJkQ2pYYjBsRE1FeVlCcGxmQ0p5WWhRR0dKTGRFOGpDVHk5?=
 =?utf-8?B?VzYvUVZzZVRQV2x0R0QyNElOK1ZBdU1pZXBqTC9WbDZCVng1N2pOODZMOGNv?=
 =?utf-8?B?aGI5c1FHVUF3bk5Ldk4zSXpEZWgyMHEyVXB5RW4zZkxBYTZQcWFlOE9oNTBM?=
 =?utf-8?B?UUdaU3RwSnNYSWdYcmpZMXgvWENFa01KMW1jb1VwMGpWdUFjUU1xbUw2LzBv?=
 =?utf-8?B?NnRWNlZwZzYrYUMxa01PYkV4OXVETituMzRnNTRTRmpSdVZqMzJManhYSlNn?=
 =?utf-8?B?a2g1Y2NVdXRlczNtQW4rc0VvbXBSVXhCWXUxODd3eHRSTHFLcDJheXdJeThj?=
 =?utf-8?B?WUZMTEFrSGZhMUFxMjY1Ym1NRG05aE9kS3hXSEZZK3NTUG5qcDMxb0U1NHZU?=
 =?utf-8?B?REhlaDBpdU1PNmZXRXhlM2hjbmU2QmVJTDNYeDNIRkJEdThXc3R6N25OdkJK?=
 =?utf-8?B?ME44dENnTUZLNnIyYjhsRm9tdHNNWE9hQ0lMSi9FOXFGUmhGQVRQVzJxV2VO?=
 =?utf-8?B?UERvaVNTOTk3YVNvalg1a2RHa242MmU2Q0dFWGtxQXBKbURBOWwrdy8xZmY0?=
 =?utf-8?B?bTBwTmlTNDI3ZTdiejNvR2pFck50dWpIczErUkgxZ1hNczhRQXNrelVkRUdN?=
 =?utf-8?B?YkNnNUNFQkZZSk9rbXdLS3JiTUg2V3YrMUY4UUVkcGpVUE5xOTJZUXFLZmtY?=
 =?utf-8?B?WTFEZ1RWcWdSZ0ZhRHpQVmp0UmtFZW0vR0ZFM0hkeEpKZmxoNVg2dHVJNGZr?=
 =?utf-8?B?blZHWmsvT2h1ZUpxemM4TGwwQTlCZUluVVRCOGU3WEJ2eUNxb2E3ek9NUmda?=
 =?utf-8?B?T0g4eEFmNHhuS0ovbDVIYVhycE9YczRqNFZ5WFlMLzlSMWhBVHpzWmhhTCtR?=
 =?utf-8?B?aDIzSDJhTTVyY3R4V082dktUNlQ2aXBTZzFDMERsS00xdEtNOEhOeTk3Y3JV?=
 =?utf-8?B?azJwMUxuYldEMTNQMjBwTWh4eElhb01oVFlSS21wZDNBTFV0WXVPa1NaU2JS?=
 =?utf-8?B?ZXBFbGNtTDljcjNNVVhuUDhmU0RwUXowOVFtZDBrUUtOeUhIdEg4VU5RYVFK?=
 =?utf-8?B?ZVJmQTV2ZU9nVlgwNWRESm4xTGNzYXVHQXQ3b0dPa3hwUlU3SEJzS0x4RjQz?=
 =?utf-8?B?VVhnKzVuWXlqaTNaTkhheVVFSlhJdGVJNXVZdktWa0hHc1RuWGVBYlNCTWFO?=
 =?utf-8?B?MHcwcUR1NDdTcncyOEgxbnRXMS85QytMYUZIU1BkME8zaS9CQkQxQWdmNm9h?=
 =?utf-8?B?d21zcVl2c0RkYlBFdGxUNmFCOGhuaVpQT1hLWXJta0tIMGdHNGk5SnVXeEpv?=
 =?utf-8?B?aVRleHkrakZEbGlDNkZySUpidS9PbUpzZ1k3dmVXa0JFWThYZGh5K3NmSVZ3?=
 =?utf-8?B?dmJubks1bGI0aHdzYTF6aEJwaTlaS0E4Q2JwVWQrL25UZkpWb1l5a0lIZVd0?=
 =?utf-8?B?Q3Q3eTJiTExtNWtsMCtaTHFNU1BDYUwra3U5SGJCVnpsWmlya3pFQXFXaG9Z?=
 =?utf-8?B?Vms5aW8rSDdqckw5YjUwVzF4aVNtOExnTDFkOFY2ck0vZUxVc0VqM25ZSE1n?=
 =?utf-8?B?L1pjdTBFckMrdlRkd0hEUVRXNDMvbkJ3OTJrcGczK3l4aDhSRGxrYTl6QXpq?=
 =?utf-8?B?a3g1MXVJWWhPSHZHTEpkVmZkeVVLWGkxMVFDZHRwODc3UWZxd0EwRW5ZYVpC?=
 =?utf-8?B?dUZoRkhRSlY5ellJVlN2emg2ZUN6cGphU2Q0NEtsVFlQNU8vdS9CQWpaT3c0?=
 =?utf-8?B?NG8yYkV2aFZiK3k0VEZGaUZabFAvWUNISW5vaUx6aDZlajJHM3c1bE9BUUsr?=
 =?utf-8?B?MlNoOFQwYno0eFgzcFFRdXVIWlpEVjhXTFZGeTgwTjhnZnAvdzZUZ1RqWHQ0?=
 =?utf-8?B?amxGczlvK2YxK2NqSVV3RkROdlRxTGc2bXZYRFF4SVZZZmRiVURnOE1DOWVC?=
 =?utf-8?B?cDBxeVREbGsweCt2Z0hMTmdaRWhYM1RQYUNuU3V2UzcrTUZON2JubE00V21r?=
 =?utf-8?B?QlVGSmdwRGJlNktxYjlMbTlmUHhZM3gxNFU3eDdSQXdlZWZrRndnZz09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ddb63f-bcca-49c3-8b89-08df1867fc79
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 05:11:40.8717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4nZZtsIN4wWPEORBs5PS6Z2YsA/huaxFFD4eGOgt2W3+PTCOVR+OH70WGLLZo/kZmM1WGCHCzO0v4sMYrmWOvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB11789
X-purgate-ID: tlsNG-16d1c6/1790053905-F687577B-0A75B97E/0/0
X-purgate-type: clean
X-purgate-size: 2764

On Tue, Aug 25, 2026 at 03:30:43AM +0300, Volodymyr Babchuk wrote:
> Hi,
> 
> Mykola Kvach <mykola_kvach@epam.com> writes:
> 
> > GICv3 eSPI support makes nr_irqs span the architectural INTID namespace
> > through ESPI_MAX_INTID, but descriptor storage is sparse. local_irq_desc[]
> > and irq_desc[] cover INTIDs below NR_IRQS, while espi_desc[] covers eSPIs.
> > INTIDs 1024 through 4095 have no backing descriptors.
> >
> > Validation based only on nr_irqs accepts an INTID in this gap.
> > __irq_to_desc() then indexes beyond irq_desc[], and callers may lock or
> > update unrelated Xen memory.
> >
> > Reject INTIDs that the GIC reports as unimplemented in setup_irq() before
> > looking up a descriptor. irq_set_spi_type() can run before the implemented
> > GIC line counts are available, so validate descriptor-backed ranges there
> > before looking up a descriptor.
> >
> > Assert the regular descriptor bound in __irq_to_desc() so direct callers
> > cannot silently index the sparse gap in debug builds.
> >
> > Fixes: 98f7060b9ed5 ("xen/arm/irq: add handling for IRQs in the eSPI range")
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in v3:
> > - Add the requested bound assertion and retain the SPI-only comment.
> >
> > Changes in v2:
> > - Validate descriptor-backed ranges in irq_set_spi_type().
> > - Validate implemented GIC lines in setup_irq().
> > - Preserve is_espi() validation with CONFIG_GICV3_ESPI disabled.
> > ---
> >  xen/arch/arm/irq.c | 26 ++++++++++++++++++++++----
> >  1 file changed, 22 insertions(+), 4 deletions(-)
> >
> > diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> > index 73e58a5108..bf14180f97 100644
> > --- a/xen/arch/arm/irq.c
> > +++ b/xen/arch/arm/irq.c
> > @@ -23,6 +23,12 @@ const unsigned int nr_irqs = IS_ENABLED(CONFIG_GICV3_ESPI) ?
> >                                          (ESPI_MAX_INTID + 1) :
> >                                          NR_IRQS;
> >  
> > +static bool irq_has_desc(unsigned int irq)
> 
> You are using this function only in one place, where you are actually
> testing for SPI. So, maybe introduce irq_is_spi() helper instead? And
> use it below?

I will keep irq_has_desc() and use it in __irq_to_desc() too,
as Michal suggested. This will keep the range checks in sync.

> 
> > +{
> > +    return irq < NR_IRQS ||
> > +           (IS_ENABLED(CONFIG_GICV3_ESPI) && is_espi(irq));
> > +}
> > +
> >  static unsigned int local_irqs_type[NR_LOCAL_IRQS];
> >  static DEFINE_SPINLOCK(local_irqs_type_lock);
> >  
> > @@ -76,7 +82,6 @@ static int __init init_espi_data(void)
> >      return 0;
> >  }
> >  #else
> > -
> 
> Please, no unnecessary changes

Ack.

Best regards,
Mykola

