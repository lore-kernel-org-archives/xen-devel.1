Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBF1C982FE
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 14:02:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428905.1651818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x914b-0003aE-HE; Tue, 22 Sep 2026 14:02:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428905.1651818; Tue, 22 Sep 2026 14:02:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x914b-0003a7-EX; Tue, 22 Sep 2026 14:02:17 +0000
Received: by outflank-mailman (input) for mailman id 1428905;
 Tue, 22 Sep 2026 14:02:16 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1x914Z-0003Zx-Rr
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 14:02:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x914Z-00ABCH-8R
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 16:02:15 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab28a64-8faa-0a2a0a5109dd-0a2a4507d846-8
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:02:15 +0200
Received: from [40.107.162.133]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab28a66-b4ea-0a2a45070019-286ba285bc03-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:02:15 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by GV2PR03MB9355.eurprd03.prod.outlook.com (2603:10a6:150:d6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 14:02:13 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 14:02:12 +0000
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
 b=czPMoJtnuk4ko5uXMvwBG5ZvHEiab8N1cEOKaqGMiwDiAoUJNM8+F4i0Ea+yzE+jTfvcmarSQTRbV09pWIA3fLqp6kok65FJHx54JV9C/PmzGzL/0Q3cb3k/E2OS0AL+XRkulN8G8B6IA4eHqva9yIIGC29LVwYcTdeFfQsIjY1nr8H0ac+FFUfhO1c8nPkUw0MC6GFiXctRQWQCkr7mOcm4QGxkH5m6epVa0aKiXbyKS0l1a+S32Dtd+wd/hkt3ZzeDUP99w95gO79SiA2XajxLHByK9io8ZDFh22KCdPdSeOoEgJQ1wJe3XT8FPnAg4ANFCYIh6p82pDcx6sEFdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rbLdUjeDZ7fj3h/kdE7ekuRdj4H7UCSvClOU6Cd5lAg=;
 b=iWtlRdjTG2K5GBZACDVBElDmMVvaVUKhMVGdzqrr6Lg1Xf5/TtH93InE16xqIK5zi7WR4088OHYiiElxIgtpOkGTlGGXJ6EmSHlpY8V430F2lSshnuz5yefaDrvPa9y7bimCaSuvoY4CwwjAXvSh1nzSq088gZ/9nfakktxvdpetlSV9gMg0+Ip6UuyW+NrmAwgRK+tHug5k5ENGC6QSlBkyzrLmwx0qMuX2lWcOvjeGl+Ihr2mOgpmMSAGWacOWF/M5cpuyR368ecDKm22IkpoDOAVCDg7cormDmBEuvYPP014WMNO978w76ZwbG+kAqVAj4w3QzwgxS1JtefowKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbLdUjeDZ7fj3h/kdE7ekuRdj4H7UCSvClOU6Cd5lAg=;
 b=jMy4tr9DYQj4oxaGRXNPY7PSzKrldm5tXdS77ZFZDOp3f2V6mvkGKNUE+NUtt63WSS78hYsXJtobdssNce5ITKerMqX5wSv9cYujdinMO9bUzZR0g3hylOkEjf9cwZvH/R+dlhAFcgqUdOaYzmGJx6Xn7QGxuNqR/6ZGHWqxBd4W/9d22BZGTg6RqqTJbLuWdFsgzIXg09Tcd8Cb9CDFLfLby7VHUpZXBJKvWB5X3uWZ6NU7SsiJmlHN7Uvowg5iySn1PvkYILumlojrL02BsKOKDIARaC4Ip7/qYxvz9oCvuKCsqzYoOsf7UjEO73wLv6pvW0fJU9CkeCCab125fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Date: Tue, 22 Sep 2026 17:02:08 +0300
From: Mykola Kvach <mykola_kvach@epam.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Luca Fancellu <luca.fancellu@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 2/4] xen/arm: its: separate ITS and host LPI quirk
 scopes
Message-ID: <arKJ7LfTUf_ZQBbL@EPUAKYIW02F7>
Mail-Followup-To: "Orzel, Michal" <michal.orzel@amd.com>, 
	Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Luca Fancellu <luca.fancellu@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1779922874.git.mykola_kvach@epam.com>
 <5edcb9ec3e643133d115f009d0d942869ffb6955.1779922874.git.mykola_kvach@epam.com>
 <d66ed4a6-4f1c-4919-8d81-d59b13364434@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d66ed4a6-4f1c-4919-8d81-d59b13364434@amd.com>
X-ClientProxiedBy: WA0P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::20) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|GV2PR03MB9355:EE_
X-MS-Office365-Filtering-Correlation-Id: 631aeb68-88cb-48ea-bb77-08df18b219d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|6133799003|22082099003|18002099003|3023799007|11063799006|10067099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	9MV+tSEbtPSy4WuIzk7wi2RW24pKtq6UTSWUjAQevdOZjJdmwOiVS5SHCuUBZ35rfcnLMqHJaav6Q5aRGz2nCQARjFFd2GgXhYDsh05aLM2zoxB6agwEft8+ZZqkG3RS+zKtVts7UXsfYZhRO1bS50J6/HuqqJsmHaR+nfI92ky/8gelFCVt4IsazvcL0iMINpEdbOPBEogGwV15kex06OlgODla64PaGH0fUskYt0bvIZ+57M0c3c9/wwyfvkFlNrPseeJiBzc/+SBaTypNJFq5BW2AyGe3b5SXBDeWokm2rWY6BXFwDkw655IswCwwvcUuDWxc0+enQ1YuGDxTNPh//RfghBek+RwQxmjmOdN+CJSgfxblhSTEtojSF8US4lA/vC9FgFVVCk/KyS7iaBUliREj+mpKDvv2AZPkbMrD5ZPrpoBlXVG4kvVAQm20imQ9GJDVofa9Sw8+IGAHGrDA4PdC3aLiKnTsTIqqs2SiRv5/SDSMudrVxHqjn92Eff92jhYBg0NdLWedNxErrvUY3NZXaB6qxMNZaa17UMsEw8a1H4l1Nhx64+Y5LQd6NWOTl59DJ9Ag0lkIXeTxzvmqc7zyFtuW7oiuH5MMmlp/CHH6ubqGhyzGT9EDLBowGbSKgPQb4ApON/gtn7g0Kb9MS/Z2Sr2LNx0F3P7Hxlc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(22082099003)(18002099003)(3023799007)(11063799006)(10067099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmZiNjIwb3lhY1hJekNtOE9OTkZBMU1SWG1MV08zYXBWSDVRaXhNdGRyU3l1?=
 =?utf-8?B?cUVjeWd3emFBYjRpclB0WnhqeGo4NHpHbjRDOVprQjNLS3dzWG5xbWY5U2ds?=
 =?utf-8?B?OW5Cb3ZhVFB1S0dJbVpHZUFUa1N5eVZ1Y3poZmdqc2QxeXFSTXRscDN6UVlS?=
 =?utf-8?B?SXJneitJenRTNy9laTdSWlNGZTllaTdVeFI5TUxyUXlXSExvSndsRHNNZUtS?=
 =?utf-8?B?NGxzUTNKQnpVeVNMR3JPYjlDTlZDUjRJNzVEWWZCMFRxcUgyNVpQT1F2QU1E?=
 =?utf-8?B?V29DeGJzQjBEUW1hemJRdXdpT0VRS1YxejR2c0JtYVpqaUZDRjdKdDFucjVY?=
 =?utf-8?B?ZVlhRDJLbGljYWo4TEM3OVgxWURyeDYyOFFhbjY0bXpaQ0hLRVh1ZG9qMnFj?=
 =?utf-8?B?bHhPODR4dnZTaHBaTDZrUWs2a0VwcDJmK1JoYjdWSG5WaXRJdytrQVIyVkVw?=
 =?utf-8?B?TmkzdWVTMGV6VVdPQlNMekpueWUwRlBhbUw0UHVYY2ZOZFMrazBGQTRSRTVW?=
 =?utf-8?B?U0loZHRxeHNXMWcxblNScGxvMDNyUHZCYUxkZkxRSjIxRkJvaHBzSnc5S0Fo?=
 =?utf-8?B?aXlIbEpabEg0Nm02c3RZSG05QUxvS0lTd3UzcW5QWmRIb09rR3Q1WmdPQWov?=
 =?utf-8?B?dCtubXhpL2U0c2JjaFZvUVBOeERwUWRqcUVwS1o0ZUIxQ2hWSkV4a2xodEpS?=
 =?utf-8?B?L0FnQmd1cW01RDRIdml2V0tVMXBXaGhmWTczU1RTbVJDYlY3blhTTUxjMTNT?=
 =?utf-8?B?UjVQNUpTdkUyUGhYVnZzZE5vaERHbzlWM2dhL0hIbGswaUhSbWlVNWRDQTQ1?=
 =?utf-8?B?MXBydUNtMGoySHhDYkdaKzJUYzV1cFRUdlM4eExKam5mMkFveStyakttanN0?=
 =?utf-8?B?WGtzMjRHS3lKUVhFQkNBUGtpNEMwdWUvVHRwc0JDVVc5Y0Nad0p4b1Y4Z2cy?=
 =?utf-8?B?cmZ3MWU4QnFiVG1qbTFOckVOQXpvN1p3b3pZUzVtVjlPWVlVZzRWSDBmd3dZ?=
 =?utf-8?B?dFNCdk5uMVE2Z2dncnU3K0psUEduRnpPZzBURWRuZXJreHZ1S0ZITWh0MGJX?=
 =?utf-8?B?VnpVcVVQMi9PYXZ4SDJoZno5d1hNd0tleU02S0RtakdkazNrUDV4NjNTbmJm?=
 =?utf-8?B?RTN1dnNrdUpUb1REWW44K1NXa2RPSDlHN0xOZEswUDBrVENIMGtHL0VWOERM?=
 =?utf-8?B?Nm01Z2Z5VFdmeGJoTzhncUI2aDArK3JjendNYTFWb2c4cDJzS2VxYlMvRDgx?=
 =?utf-8?B?UmtWTllHL0xtcVRRREtUa1dEUDZCUXo2ZVFXSFM0MW1QNm9OSkx1MjRXMWQy?=
 =?utf-8?B?a1ovdmptcUp2c0NXZmdhelVGVDBBOUpIaVRBYkVOL1F6YWVzTjlEK1JrcUYx?=
 =?utf-8?B?RnhpT2ltckhyUmY3ZUg1eld2K09mNlpZV09lcGJvL0pUcHU3QmdDYUxrWS8v?=
 =?utf-8?B?ZFpSRFJ4c0VWVnZaM3BlbnRDNmhLelVudWIvYzVBZWlNWkV1U0lpMU85cHRI?=
 =?utf-8?B?NWFyemd5ckRXTFl1enRNUUdqNThTbnJDUS9JdHFuTkM4R0JuWWJ4a2lQdU50?=
 =?utf-8?B?TFBZL2tVR0JmeWtQK2RXbXhsdG8ydTNNb2l3Y2psc2N6c1FncUdHOFVHUjNy?=
 =?utf-8?B?TXZLbFJGY3FBWVNDQ3BPa2s0ZTBHekp3Y2wrbERNaXNPc1hlUCtwMEc4TFZ5?=
 =?utf-8?B?djRweTkrWFhIN3MzY0N2WnhsM2ZocjU4VHlVc3dJMnFGZ3pzcHdMRk5NN2lS?=
 =?utf-8?B?NHhuV1V2bFRDWGt4azFndUhjUTlBdFJ0S3dlaDZWMFZGVDEzdDRnMXdaQ28z?=
 =?utf-8?B?bWpTc1RDU1QyaTJYQjR5NTR6OHQ2STdKWi9Ibm5BdXZDTk52VzRWRlBTRHds?=
 =?utf-8?B?dWUyU21jZ0ZKaFdremJIM2JKNU0xcGhsQjk4eHdjQXZ2K3E2T3kwUnJPQTlL?=
 =?utf-8?B?RjNmSVB0aW01VTFvWDBGdEl6eGhUOEpUdUVzU2NNS0RHOUl3YXczbzRsY0xE?=
 =?utf-8?B?dkRNL3ZPM3FyNVJnK2s3QThLNmJkU2VFcVhmWFpYTnJiNW5EU1pGUjRFTG9S?=
 =?utf-8?B?cWZ1M2MvZTlDZTJYT1h1MnRuQ25KcDFYYW4vZGloYVArUlJGM1p5c0pwSlM4?=
 =?utf-8?B?MXZZS25LV0o4S1dWdTZrOWFLaVZIb1pxbmJIM2JCNVJTZWY3SzRZeXJsTXdL?=
 =?utf-8?B?T0wrS21zVHRiMVE0NXI0UzB0Ulp3QStjMDBTQlA0UTBTSVBubytPSDErMWxK?=
 =?utf-8?B?Q2J1TzMwbVFwMlN4blcrWnE5QzhON01mL2FJK1RLMTJjdFhMbElBaEJkWFZP?=
 =?utf-8?B?NUxnWG1kZUNka2puUEl6cVkvQTdScTVJZ3VsSjQvRlNZbk11a2RQQT09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 631aeb68-88cb-48ea-bb77-08df18b219d2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 14:02:12.8524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /BVmgCIa1ZMFo3oRwaMpQdU7jTw55Y5tNMoW1QZy/SqQ9MMW6XNyloroDgqGjcQDjW977ZCvY6TPVuDxuIJofw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB9355
X-purgate-ID: tlsNG-ef75cf/1790085735-A5EC6AE4-D15BAFBB/0/0
X-purgate-type: clean
X-purgate-size: 2876

Hi Michal,

Thanks for the follow-up.

On Fri, Jul 31, 2026 at 10:24:47AM +0200, Orzel, Michal wrote:
> 
> 
> On 28-May-26 02:25, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> > 
> > ITS quirks can impose restrictions on memory accessed by the ITS itself and
> > on shared host LPI/Redistributor state. These scopes are not identical, so
> > a single global ITS quirk state makes the host LPI policy depend implicitly
> > on the quirks seen while initializing host ITSes.
> > 
> > Add per-ITS quirk_flags to struct host_its and keep a separate
> > host_lpi_flags state in the LPI code. The quirk table now records the
> > ITS-private and host LPI scopes explicitly through its_flags and lpi_flags.
> > The R-Car Gen4 quirk applies the same memory-related restrictions to both
> > scopes, preserving the existing behavior without relying on an implicit
> > aggregation step.
> > 
> > This also removes the old assumption that all host ITSes must expose the
> > same quirk state. Host LPI restrictions are accumulated only from quirk
> > entries that explicitly set lpi_flags.
> > 
> > Use per-ITS quirk_flags for GITS_CBASER, GITS_BASER<n> and ITT allocations.
> > Use host_lpi_flags directly in gic-v3-lpi.c for GICR_PROPBASER and
> > GICR_PENDBASER setup. Memory-related quirk bits are named GICV3_QUIRK_MEM_*
> > and are translated by shared gicv3_mem_get_*() helpers.
> > 
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> I already gave R-b for this patch but noticed two issues:
> 
> [...]
> 
> >  
> > -static void gicv3_its_enable_quirks(struct host_its *hw_its)
> > +static void __init gicv3_its_collect_quirks(struct host_its *hw_its)
> The only caller of gicv3_its_collect_quirks() is
> gicv3_its_init_single_its(), which stays non-init until patch 4/4.
> Please annotate the caller here as well.

I plan to replace the first patch, whose release fix is now upstream,
with the initialization-order follow-up discussed with Julien. It will
prepare all ITSes and collect their quirks, initialize host LPI state,
and then activate the ITSes.

I'll put the __init annotations on the ITS preparation and activation
functions, and gicv3_its_init(), in that replacement patch. This will
make the quirk collector's caller init-only before the quirk-scope
changes are introduced.

> 
> [...]
> 
> > @@ -157,6 +164,7 @@ int gicv3_lpi_init_rdist(void __iomem * rdist_base);
> >  /* Initialize the host structures for LPIs and the host ITSes. */
> >  int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits);
> >  int gicv3_its_init(void);
> > +void __init gicv3_lpi_update_host_flags(uint32_t flags);
> Please, do not add __init here for a prototype.

I'll also remove __init from the gicv3_lpi_update_host_flags() prototype
and keep it on the definition.

Best regards,
Mykola

