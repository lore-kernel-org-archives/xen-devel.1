Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6313AC5DF7D
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 09:50:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393861.1632674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwGSA-0001JW-0a; Tue, 18 Aug 2026 09:49:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393861.1632674; Tue, 18 Aug 2026 09:49:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwGS9-0001JP-U4; Tue, 18 Aug 2026 09:49:53 +0000
Received: by outflank-mailman (input) for mailman id 1393861;
 Tue, 18 Aug 2026 09:49:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wwGS8-0001JJ-38
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 09:49:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwGS6-006Jsg-RV
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 11:49:50 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a842ab7-bab6-0a2a0a5309dd-0a2a4505e55c-18
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 11:49:50 +0200
Received: from [40.107.130.129]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a842abe-4cb1-0a2a45050019-286b8281889a-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 11:49:50 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AMBPR03MB11696.eurprd03.prod.outlook.com (2603:10a6:20b:761::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 09:49:49 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0315.012; Tue, 18 Aug 2026
 09:49:49 +0000
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
 b=XHvy+/JEWku+UxkdzqY7knZjTtXLQrRNqbBdj1qe+bQQnRvD+B4lnxpSuTbg4usM8J9P1pYjqS/gpaphm667gGgEjnCnrKkWsQzijg9zWNXod/PJnx0HS35bPm/gTleV+0oSxD+Opa0fkj5zNATsSfWhwACkA4zK8kcXNTqdvfq/VbJRPPE6akcxxzkwX6LL5IsSxx/STCymZZpwGlBq87cnci7pOTrr+Fnj/VwWPwFzfOh8VHnF4Q7hh+s9nZSqVZnui/1GJpyVtnn4gnTNKeaqHRWAqqFQZL/dwS+6Ix1XDA+oSnql4aK5zS/acYiyATetbvBYJGNJ9evxGCC1vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qR6YoKQ0aQCP3DAgWuPuHk0fup3mTEUzB8mdM04Qew=;
 b=JEmLJQcS8CsnlmpuyaTgSn3vbJmUnxG/M5EHd+82jYjzOKJ62KMnvK+afZouYRMUqZiqn4nH76Zk4u0EwAXmF7OIewxXpXpnotEyW+G6eo0vQf7RlPd629MSdbSoXE/AcDSmCEa6srJDj5Gbxi5UEZ27tHpkgTw+jwV2Xx1Ap5j+pgmkUSF/jb7pK4wlxuvMKgTIRHmidRl/A4JCtGPJsc8I1t1ggHfjXK5P92ShQe/tNp5x11IRZzdNTnZOvdjX6yvVy1iXAi/d+TwLOdI+DDvhOzP9m9l36AeFhpPfJYGWq1h3YjU+kHcxQjJy3ymNbAlTPQbhGZy6BVIxn90UBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qR6YoKQ0aQCP3DAgWuPuHk0fup3mTEUzB8mdM04Qew=;
 b=dKAE6bVzsuV6ZG3MwjrW/aWrDtVcKfKYn5vNnwhByO8rmUpvnGpVE7MLF0GNIHZJpaaGRX36KFPRFKLwpTYbzwp+5nIkEIZCEjCLWROyfb3GlcBF9MW2fHdcnjvmEmBnbOt6Al1ifnM4WSg2oRAAVOjMXDZWjjWa2mAXDOzUunzp65RtLibfrzjr6/sGrzD4y8W8NN+QG1MdNlhYnjMI6jkIxKZk5CzVEom1aytSWdoNm88/jsSVugV09koXokUL3skzzGbAbRd538x7kcQ3jsumqMQ/g+/m9iHKSSgSpzLzNSJcwM8a24FNdbyUaGB70VqhZ6gwzIihwbD8ALm63g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Date: Tue, 18 Aug 2026 12:49:45 +0300
From: Mykola Kvach <mykola_kvach@epam.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Jan Beulich <jbeulich@suse.com>, Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>, 
	Jens Wiklander <jenswi@kernel.org>
Subject: Re: [PATCH v2 3/3] xen/arm: handle irq_set_type() failures
Message-ID: <zttrpp5cd76mqlghcgrlvjbjnnw7g54cxowyaonwsdpvrbjcew@5ipae2upbvoh>
Mail-Followup-To: Andrew Cooper <andrew.cooper3@citrix.com>, 
	xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>, Jens Wiklander <jenswi@kernel.org>
References: <cover.1786385827.git.mykola_kvach@epam.com>
 <d4087afce93cd4bb1779507393ac74c5dd5baea3.1786385827.git.mykola_kvach@epam.com>
 <7b2d0e8f-5c6c-4002-a123-d96c90030e54@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b2d0e8f-5c6c-4002-a123-d96c90030e54@citrix.com>
X-ClientProxiedBy: WA0P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::11) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|AMBPR03MB11696:EE_
X-MS-Office365-Filtering-Correlation-Id: 80d894a8-5305-4202-6c8b-08defd0e0b46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|18002099003|22082099003|56012099006|6133799003|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	nb/kj7XwlZXr5CnIzp9Nln90DWmV6EADIN2Q7w8rBLJUsil15GQQ3sz2hZ4I+OpsWAUQ2wT3qerohgkdyUmE+jddt1MmRngmUtvdlZxevmu92UdEhGMhLb9ATbGJj36NNcdLAYuzGLxWF8yI9aQ8cuEMx8yRYr/BaOeT7NHo7162VW2QLfrbxANNWpL1g66wUBOVk1c9H6Y0kweLAhgWD6uy3JJyoBOmRET+zDR4c+rz/1awBx0WNYc3Ddgfwz2AOiJ7SwQ8dy8QBQ05AGZThbJSL6JblbDl4IE9giTCTM0ANLXZcmR4XUzX5LsIXgiX/mok86hgdZex5XisrHRXnrFAbF37HIme+Ag6CEKl8CQLwI2Qt0uDaDkcCcuCL9kISXyl73ISt23sdSI7XdWhYfnFrdsIrhMeI+uv3znwq8hdfc+5iAC7k5lW3AOxfcNJ66+cUDWVW1QFPjAVwPzZWlQ99f2dZNg57mbU6MQ07hApLiHxFQtpyYFkhQePEuKUNK6acBewBnhO/HCGR6lPPMoc8dbOfgkbXoa1MrUyKLf6puR52X3g2uAMmMNkncB76JKTgy2AB/WyNG/II3i4b6U8le3TGJhW32V6YtC4o9LIYcR0M/oINMextrf4IFW4+HfYCB+eR66paDrgXOYeZ6HMKhjom+E1uAPWlDFNRDU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(18002099003)(22082099003)(56012099006)(6133799003)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGRYekRGSkhjY2kzYzB5ZmtpNEorSTRqT2g3L3JxWGlPRTV3a0R5Q2JQcjIz?=
 =?utf-8?B?aWJNeTU3eVpkQVhsSkNTelQrajlWVy95dGNMTzlHM3lHT2Q1SFhLcWJHLzds?=
 =?utf-8?B?WHFzWUVjYkYvYktvZzJPQnhRVVA1bWlDc2I2aXd2Z3pLUXllN1lOUzNFTHQy?=
 =?utf-8?B?MW84dWtodUdGNGFxVHRoTVVkL296OHNWcFlFL0lxQVhrWVhLWElhQWxaZW03?=
 =?utf-8?B?RnJ1WnBjcGJhOVBieGJoazNQd3hNQklKQTZyUVRqOTR5MUN1alRBVjF3OXFU?=
 =?utf-8?B?bktSZ0dhb2QyNFYxdkc3aDVRNGx2dG9mSFVlV0RnSUw4OUNiME9pSkNSRk10?=
 =?utf-8?B?Qld2NXQ5MTJZeDlrQVk1d0kvbGN4aFRPSlpWWjZmUzNkOG9ZQ21XbDh0eS9E?=
 =?utf-8?B?SW9IQVkrcjFuR2lZZlN6UDNXTWlsVjZsbkFPaXplQUtIbHQxeXJCZWptT3Uw?=
 =?utf-8?B?aVcxN0xCL1BZT216aUcrQXJVbzBBRnR2OGtjQnlKNWtCUCtvQlRaTGVBTU52?=
 =?utf-8?B?UFBRUVV5TFR1QURRaGtWaVRmV0lqR0syOVI3YURJMjBaMUFwYUVGMVRlRzlx?=
 =?utf-8?B?VUI3eGc1U0ozbzBqRHQwbkJmV2l0ZkExbnV3Y2EzUkdnbyt5VlBJSXlVYlFn?=
 =?utf-8?B?eEtoaFNuS1hGS3VxT2o0Z2VRZFVwUkoyRmQ3aWtVNFgrUW10R1I2YlA5Rlk0?=
 =?utf-8?B?QThBNHJCK1JKeVNsZDhGajZQT0FuQU5MSmx1R3hLRWZnLzVkbXJjbUM4TXAy?=
 =?utf-8?B?WFpQNWEzUEpWbmFuSHlBcXFrWkVxNkNUNlUwRzY3UEdHRGp5QWVWTWhOVUhs?=
 =?utf-8?B?bTR6RzRmY09ENWR6TUo4UDBQTjlvMC9nWFMzZXdxRXE2bWVPN1V5cHJyUGZw?=
 =?utf-8?B?WGZQMFJnNzNqYWRUeW5SeGpYWTE0L1RaOVhHZGFCcFlnM0R4V3NxbnowZWs1?=
 =?utf-8?B?YURaR01JT0FHTWhJc1pPNVV3eXg4ZStYakNybG5RKzBkVERIWEg5bnVDQVda?=
 =?utf-8?B?T2QrekozRktrRUQxNUNYRVNVc1dXSHdxRGlQSG8wQm1ZNWppY21iWEhZRk8v?=
 =?utf-8?B?bnNtMk1RbTRIVjZ6VEVsaFNmYVptSUVHNnB5Ri9ZcldVODBmbVlFMzR1cTNG?=
 =?utf-8?B?VFZoNDdtWDV5cHJMT1pXbWt2ajYrQ25RaUNoOHZ2V044WWlMV0l6azJEVVhk?=
 =?utf-8?B?cFRxenl5TFhLcTQ0T3k5cnp0U0ZZRmJtWUhCUkxHS3FNUmQwcmlaejZoWVNH?=
 =?utf-8?B?c1p3RHV0TTBSNit6OGtFOGRJVUQvTnJxcFp6d2ZVZlhiUC84NG9iV0NubEZu?=
 =?utf-8?B?QWVWSTB4QUt6aXcxUUdpZTlCRmliVFQyb2o2dTFpK3pZc2NOek5mbm54TGsr?=
 =?utf-8?B?cFYxa3BzYTFlb0dIWHpIQmVZQnZQWTd2LzRSTVlYdlVQNW9BdkMvejg2ZDI5?=
 =?utf-8?B?Znc0dGZpR0dYdjhlODhqZTc5YXJDbGgreWZnZndyOVhOZ0Ewb0VpdzlUL0dO?=
 =?utf-8?B?SVVHY0kvYjArZUxGNGJxVVJiVWpwWU84MVpDOWtVQVdSUjRRV2ovQ1dISzNZ?=
 =?utf-8?B?Mk0zTUx1U1FVaUEzd2kybUUrMXd1bHg5V3ZWWEliV05FZTNKdXc2R3RjZ3ZW?=
 =?utf-8?B?RTIzR3kvV2dFbHg4Rjc2UWpjV1dldE00b290cVlFK0IvWmFGczNHc2pqNG12?=
 =?utf-8?B?eW5KbmM2cWl4N0JicTQwSjAyODZIV3didUpReUp1V1h5Q2NpczZjVUNiTzZ2?=
 =?utf-8?B?QnQxclAzR2hveCtSL1VHZC9IZEkxQkhYc005NEt6ai9pQ1pXbHFpWkd2Qmt1?=
 =?utf-8?B?VmM3M0orVUxtaFdjTXhBVHJRcEdoYXlvZ3drbGlDcVNOeGp5bkMyRVN3SFJo?=
 =?utf-8?B?TWVvY2RDL3FiY3RNRjJKUVdrblE0YVFYSzFtTGRjc3pEZDVsc3dhcERSNmRh?=
 =?utf-8?B?OC9PWTlSOUVIU2Z0aUxWZURkWHVQaTRldXZ0UC9XNlBQcVkzOWpLamVYZXdB?=
 =?utf-8?B?OTBraWZOdEcxd0d4MmN6MFFvQTJMelVLclBEMkNWN1pwVXBsbEFNaFhyOUE5?=
 =?utf-8?B?Mi9WSnIvY2RCTVNJYUVMY09LcXZ2MUdwZ09GVElBNWl1TUEzN2FOK1RBUlZ0?=
 =?utf-8?B?WVdmOEsyQTlOYkZ2dElSUTFPNnIyTW5ZVWpHYkpsakRUcHkvdnpxSVVMVUVa?=
 =?utf-8?B?OWN0VVZVT21QQ3o1TkViL0NPczV2WGl5UEhwaFNvd2VlRHh0VUFja0tQUUI4?=
 =?utf-8?B?Nk1ZdVVQNmlEekJOYUxmRk1OU05PNUE3eFA3b0FJZ1N0Wm1Xc3FldnA4VFJt?=
 =?utf-8?B?TzQ4cUFzbzJDbzdqYXRxWXdlKzlXUDdlL3UrVnBwUjJ5Z0d0N0VMdz09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d894a8-5305-4202-6c8b-08defd0e0b46
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 09:49:49.5064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RshWmSYehw8QHq80l72CpZ00UUMrEOo2vIXgjVDeqRCziQDKlwsE3i+5fDsmkZMyLp2nySH155C5T6Yvur4lkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR03MB11696
X-purgate-ID: tlsNG-c201ff/1787046590-714AC2A1-B33A7B97/0/0
X-purgate-type: clean
X-purgate-size: 2783

Hi Andrew,

Thank you for the review.

On Tue, Aug 11, 2026 at 02:01:17PM +0100, Andrew Cooper wrote:
> On 10/08/2026 7:38 pm, Mykola Kvach wrote:
> > Several Arm firmware initialization paths discard irq_set_type()'s return
> > value, violating MISRA C Rule 17.7. If trigger configuration fails,
> > initialization continues with an IRQ that was not configured as requested.
> >
> > Check the return value in the GTDT, MADT, SPCR, and FF-A paths. Store
> > timer INTIDs only after successful trigger configuration, make GTDT
> > parsing failure fatal, and stop UART or notification setup when trigger
> > configuration fails.
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in v2:
> > - new patch.
> > ---
> >  xen/arch/arm/gic-v2.c        |  8 ++++++--
> >  xen/arch/arm/gic-v3.c        |  8 ++++++--
> >  xen/arch/arm/tee/ffa_notif.c | 11 ++++++++++-
> >  xen/arch/arm/time.c          | 18 ++++++++++++++----
> >  xen/drivers/char/ns16550.c   |  5 ++++-
> >  xen/drivers/char/pl011.c     |  4 +++-
> >  6 files changed, 43 insertions(+), 11 deletions(-)
> >
> > diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> > index 43a379fdda..b8dcbb0bb4 100644
> > --- a/xen/arch/arm/gic-v2.c
> > +++ b/xen/arch/arm/gic-v2.c
> > @@ -1157,6 +1157,7 @@ gic_acpi_parse_madt_cpu(struct acpi_subtable_header *header,
> >                          const unsigned long end)
> >  {
> >      static int cpu_base_assigned = 0;
> > +    int rc;
> >      struct acpi_madt_generic_interrupt *processor =
> >                 container_of(header, struct acpi_madt_generic_interrupt, header);
> >  
> > @@ -1173,9 +1174,12 @@ gic_acpi_parse_madt_cpu(struct acpi_subtable_header *header,
> >          gicv2_info.maintenance_irq = processor->vgic_interrupt;
> >  
> >          if ( processor->flags & ACPI_MADT_VGIC_IRQ_MODE )
> > -            irq_set_type(gicv2_info.maintenance_irq, IRQ_TYPE_EDGE_BOTH);
> > +            rc = irq_set_type(gicv2_info.maintenance_irq, IRQ_TYPE_EDGE_BOTH);
> >          else
> > -            irq_set_type(gicv2_info.maintenance_irq, IRQ_TYPE_LEVEL_MASK);
> > +            rc = irq_set_type(gicv2_info.maintenance_irq, IRQ_TYPE_LEVEL_MASK);
> 
> I know it was pre-existing, but this is an overly verbose way of writing:
> 
> rc = irq_set_type(gicv2_info.maintenance_irq,
>           (processor->flags & ACPI_MADT_VGIC_IRQ_MODE)
>           ? IRQ_TYPE_EDGE_BOTH
>           : IRQ_TYPE_LEVEL_MASK);
> 
> I expect the optimiser can transform behind the scenes, but it's better
> to make the C simpler for humans too.

Agreed. I'll use a single irq_set_type() call with a conditional
trigger type in both the GICv2 and GICv3 MADT paths.

Best regards,
Mykola

