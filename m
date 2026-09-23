Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8F4C982EA
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 06:59:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429749.1652431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9GwK-0005a4-7q; Wed, 23 Sep 2026 06:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429749.1652431; Wed, 23 Sep 2026 06:58:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9GwK-0005Zx-50; Wed, 23 Sep 2026 06:58:48 +0000
Received: by outflank-mailman (input) for mailman id 1429749;
 Wed, 23 Sep 2026 06:58:46 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1x9GwI-0005Zr-Gs
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 06:58:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9GwH-006eLw-Ky
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 08:58:45 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab378a3-8faa-0a2a0a5109dd-0a2a4508bd5c-14
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 08:58:45 +0200
Received: from [40.107.130.90]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab378a5-f659-0a2a45080019-286b825ac444-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 08:58:45 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AMDPR03MB911541.eurprd03.prod.outlook.com (2603:10a6:20b:70c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 06:58:43 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 06:58:43 +0000
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
 b=bZefkbVlstGM91EMjpwTnga6lpAqcQL2/9iODUcYN+pUioO46La9fCU3QggmKWekLlHHRts6B4B+1knFUsZqZUPbYBCXUszn+aOdGwCEETjE648Jzw9L0Aww3HoX7Ll4XNyOLZ0gjwJY/8YjobLIF7bby7RpYY0QqME6CDdXGxBZRwaMXUGJOI7ouIfHEA5nqych/FzfGnbJ0avQrXkl78x3T1p0j882ighU+Fu9TavUe62bzuzMBdhXILpxH+pue/C+dUZpbXDTXR4r9sTY1Sqb6INtnJyLYsTH8rMglxJNyPzrqZOXG6GNhGWuXAMtszFXdcTHNRLmpz/nN1n2/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pKssA4GK1hBRRYvO/ImT7sgyAtEYimnCFouoTrbpv/U=;
 b=XGRbTd73Etu7oJr9q0B2NbBixczJ//WxAGeJ0bpfby4A2UhvZfWfLKku1Zg+MhQhaUtKUEetCSuK4WpCpqcYnzMvFELL0wJeojP/faTfdM+RBiQM6t7IHkdQDNjrrRmh9ut3dKDDetWjL63iMkwRKkNcyz4rQnzH5GT9YG1JfYgsy07LLKlneAxqhVFB1gN5QtIx2sPCNOrSGm/MfLHtdbiMZHvVpF6WhdKs5iz7Y2pKweWljMNhoeUOVcuZaKmdgyroDXWclNlzsXUSd97BFwXFykobgud2EcDVvvuZJOIkKQcGED1AUyMw1EPF4vUP2MyckK0/gRniza5plQ3k4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKssA4GK1hBRRYvO/ImT7sgyAtEYimnCFouoTrbpv/U=;
 b=rOWDcYLnPglyoNK3W+IgUlkf1a1YxKbnnXec0mYmrUGq7lu1iR+XeCvzHv+EjEojakDecaaoJUgtMD8y0460kTw6pE6JDthSM5Yi4RxsITM/E6kXhjncNUdzbavjoOP44sIrkijcvSToELRoTxjTY/ID1nm4sBerOF9/WyQc1l6uoKNHxgx0A3v/4u2vdJSKZQNJy3KN/DV12EEAEycAw56BpQNsyF3R3z60RzGxYZSV3aXkmFOD+k/+ZpLN2GRm2ZyDCG0V3Feovf9y6A73KIZbFQxTyVjqWT7y+2WkkZKrC5YI3nLjAAtkQH6A9jti5omvmOZBLxYfzNNdmYE4Ww==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Date: Wed, 23 Sep 2026 09:58:39 +0300
From: Mykola Kvach <mykola_kvach@epam.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4] xen/arm: derive GIC CPU interface ID fields from the
 vGIC
Message-ID: <arNy5vYOl7-01AIQ@EPUAKYIW02F7>
Mail-Followup-To: "Orzel, Michal" <michal.orzel@amd.com>, 
	xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1101ee75414ec2e6bec05d34118c4fa7f8b60bcf.1790060180.git.mykola_kvach@epam.com>
 <600256d1-a038-4ceb-a1df-a8d86dfee130@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <600256d1-a038-4ceb-a1df-a8d86dfee130@amd.com>
X-ClientProxiedBy: WA2P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::16) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|AMDPR03MB911541:EE_
X-MS-Office365-Filtering-Correlation-Id: 51392a0b-28a2-4f61-9e5d-08df19401b28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|4143699003|6133799003|10067099003|56012099006|11063799006|5023799004|18002099003|22082099003|4133799003;
X-Microsoft-Antispam-Message-Info:
	zycc+yu+wTL5PXQ5iIkhI9hZHdM26oHEjrsCiJ7K1E1YsEm+o/HSvdwU+3jBvc5YvKU+/y2OaXrUSM8PSuxm7yETJ/YLDuKfwChi3byLJdBBMxuxmUDG8OiyTPzULydkdA5iRb3AMAI6bgYQX56Yt/jDFJQzRZ7R3UencOR5ftYahTuWLfiJWvCbQSx2PBrjri2eL62I0zlwLSR3UA3FRLXK1revHL8DWk/YVajuqQFfKie+Gh3iUY+VetzPS7P9urRaFu+epjH+v5JVpup/bvOUZKdzdUSU19q3ag82BAqdZl6SFxDuH5MCd71ZOh0a7IBqIxelivKJ2Ysia3sJzUb4VmKEwGp2kOgvOu8PREq01bLcQveuZNQ8j5bbpHkIJ22AQeepIa0dMx3uv89HIpIGrYpLB7f/MREbgAq1dqIfWnZKJVXJHEiyT8+MCr+A8RrRYMTbwJbCmaqJ33B05LlBKhXr895Sf0izMzdfGUV8VUqxBTPKghM1baQoBH/VxoFLA22fDsw7JrMEW58cyiSdPy4oi2kVLB9xStzec1pijyYJS18yjO3LqABC51tHTi2CJARHYYnmyT2EyXi5SYL11pQaWsvChM3VJ/AqWVkVNysDqfbu/iynRWoBLXOa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(6133799003)(10067099003)(56012099006)(11063799006)(5023799004)(18002099003)(22082099003)(4133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?di82TytaTUFIckMrZ2ZxOUZ4blRNNFRhc21RTHJwMmhrUTQ3UnVtTk5oS1Fi?=
 =?utf-8?B?RDNucE9iMmxYeUEvQThmajNUeWFBS1ZGRENhSEowRmNXV1pGYURuNDNLUFNp?=
 =?utf-8?B?TmNzT0hTMDdJcE85Mm5HMGZmd0gxa01FYzNpQnprQ0tmVDdjNFM2QnMreENU?=
 =?utf-8?B?SzhjWDJQZGhjcUt6dXYxNWRGZUhpbEE3N1lMbUNYNjlZell5UHhDcnRFbEJi?=
 =?utf-8?B?WTVJY0Z3TE9aMU16MVl2UlhKQmZvcnlVbkdjRU1pK3pQbDdaekY4WlZTd25U?=
 =?utf-8?B?MmJEQVBkY2pIV3hZbUxKSml4Q1d0RlBRMkFFb09QWUxLL2dUYXFyQmNLa05r?=
 =?utf-8?B?aDQ1Qnowc0YyYkUvK3ZiQUEzVDVRTmNmOHh0Z0pKTVNTUmJVZlMxNm5rcS9B?=
 =?utf-8?B?eVIyeGRqNkhnbXpGOS9LVG1lbE5jNkxQaVBlR2F4RmM5Y0JCQk1XK0pNVVZH?=
 =?utf-8?B?V2EwaXphQlJFWjhsQU4wbDhnb2FxUlluZWNnK1NhcXFNemZKWk4wYlp5b0lC?=
 =?utf-8?B?L3JvYUxMcXQwcDdNUmtzMlp3SVo2NGhpTWNnQ3lGWDFhUDF3Z1orUnBVT21r?=
 =?utf-8?B?V3g1MHBBOHZFaTYyT1UrSjVvOHZjQW5lWlQxNWZRVVkwMTVFMDIrbFMrdzN5?=
 =?utf-8?B?M3RLTVRBaDVoSml6Z2ZrdEsvNC9rdEFVZ0dZaVdaQWJYQ1AwdkVvNE0zbTFv?=
 =?utf-8?B?S2RDNUdNWmNXNnd3a1crZDBaR2dWQldhV0dEVkFkejhZOStpQlVCZXVTZU9E?=
 =?utf-8?B?K25iaVBwT2IxMS9vWnkwdUtmcERiQ2djYUdDb1hJRmdwL0RBTDhLVnlxYy9s?=
 =?utf-8?B?SlVvajZISm02akVER0ROQWsrRjdYR3ZxSFZCK2p3MnM3VTVnTHc5ZHhTNjhp?=
 =?utf-8?B?aVRiTWxsaVRNU0psYys3Y3JZSDNtRXozT1dGaG5lSGpKdEdxTnBxMzJ4KzAr?=
 =?utf-8?B?cjZTL0RUdENSbFlIU1RJREs0ZCt2Z3M3OXZzQkJqWDRneWMyNkRIbDNRWmta?=
 =?utf-8?B?TXFqenZ4aFRGV0pCaTViMkcrR3BoUXltQXF5cDBQakFDRWZaTFBjbTFBcitu?=
 =?utf-8?B?Wmc5UDJzRnBEczVlZUMwVWFjRFJhZkhISEVwcWhVS0dva01WemNNSzNlZlRt?=
 =?utf-8?B?VFZheHpTWDVTdjIxNUszUkdlUmJKQUE3bVR3TC8zTDVzamoxelhwWVRGN04z?=
 =?utf-8?B?T2E2ampxRDVmVmlkUUpJOWIzTHMrVUc2NVVDRVdkUWo4bHlkNk11dzZwckVC?=
 =?utf-8?B?V0FCNFZtRWZiekJSZWtrWituZktRTFhTUThFR1BoSVVPbEdncUtRNWc1akJl?=
 =?utf-8?B?UWNqZUNXSXlPRVFmcnI0QlZUQlNyWTRsYmtmWHBVYTFxVlFBQmpBNG05NitP?=
 =?utf-8?B?Yi8xNlBXU0g0Q1RZWXFPZlMrRFVhWG5xWTRZeUN1QzhKWlQ4WXpNNDZpUG1B?=
 =?utf-8?B?d2wyR1I3UzYrenFsZUxFOW93LytvSnY0NGtydEZzWm8rYjhuZWFGeCthTjVC?=
 =?utf-8?B?bUZjeTJ5TnRHVGZUSndkL2RpVWQ3M0tGZzB6YWFXOGptREsyMS9uQ3Y0cHpX?=
 =?utf-8?B?T3JqNitQVTZjTkJpYTdnL3NoWGszdHo4RHRRckwwUWVYRm5hc3RHYVg5SlRu?=
 =?utf-8?B?THdpRDdFemdtNGpEUGRnd2pPdm03UTRBTTdrZFlhWDd4RW54RXJKTW5WK2gy?=
 =?utf-8?B?MzVuSmRmS3RMYVhCanFpcE1sMDhGMTh1a3lUZTRtVFhUNm1HQjFrcUk2RWUw?=
 =?utf-8?B?SzJWOWxmbUNPU2ZHbXZjd3VxcUN3TmR6VUlJMHZVNk9jWnQ5eERxM2dZbXNv?=
 =?utf-8?B?QjJ4WXFINThyaUoyYnBqbHRMWjYyV0tBUnpRYUIxT2phOUxqQXdQZCt4NkNn?=
 =?utf-8?B?L1RWbXR6RXhpNGkzS1RjODhDNjlpamxaTWNuMC9vU3d0VHB4b3dSdXVNT0Iz?=
 =?utf-8?B?ck5wV2JLY0ZZYlI2UWVleFBmcmZITHNTalJWT2FScDVzQnN3UUYxWC82U1lz?=
 =?utf-8?B?YlZQMDg4Z2NhTzNVWUNwREhKQjJtTUtPckxESHVPRUFIQnFvVjdTTVhGd0dt?=
 =?utf-8?B?ampjekE2UDd0R2ZPRGxpdmNTcWxEc0g1RCtQaHVZeXVtVWd4ZkMwcDVORkk2?=
 =?utf-8?B?aHlrVEdQcnllQmF1Zmpsc1RIYzVVTXFORWdYcGNUOXNaSERxZFlvZWJtaXdj?=
 =?utf-8?B?a1lsOEtnQjlXQnFQcUEwSTB0TmdWQXhnMlRvTGs0VmVDeHN0UnhMS3hrcndE?=
 =?utf-8?B?UlEvM2ZjWXcrVkxCS2dINjZ2Tkk2MHVJc01sSjRiQnRPUnBwNVB5a0oxMlpW?=
 =?utf-8?B?TS9FRWJJemhZcDB5QktRSVJNZ3BmcUdBSmZyS2pLcjBmMU5SbnJjdz09?=
Content-Transfer-Encoding: 7bit
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51392a0b-28a2-4f61-9e5d-08df19401b28
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 06:58:43.5796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +NKfLm2vGTLf0RJcAwBBQBL6VSW8uP06RWz5/4ne5QY7okfO4Dzn6DvN3ipPx+NPqEAW2ztA6FLO92xtoqljXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR03MB911541
X-purgate-ID: tlsNG-c1860d/1790146725-CCB7187B-6E3BA996/0/0
X-purgate-type: clean
X-purgate-size: 8048

Hi Michal,

Thanks again for reviewing the new version.

On Tue, Sep 22, 2026 at 12:40:45PM +0200, Orzel, Michal wrote:
> 
> 
> On 22-Sep-26 09:21, Mykola Kvach wrote:
> > Xen exposes ID_AA64PFR0_EL1.GIC and ID_PFR1.GIC from domain_cpuinfo,
> > which is initialized from the sanitized host CPU feature state. This
> > does not necessarily match the virtual interrupt controller configured
> > for a domain.
> > 
> > A vGICv2 domain can therefore observe a nonzero GIC field when the host
> > supports the GIC system register interface, even though Xen disables that
> > interface for the domain. On a GICv4.1-capable host, a vGICv3 domain can
> > observe encoding 0b0011, although Xen exposes only its vGICv3 model.
> > 
> > Derive the fields from the domain's vGIC version instead. Expose 0b0000
> > for vGICv2 and 0b0001 for vGICv3. This covers ID_AA64PFR0_EL1 and the
> > ID_PFR1_EL1 alias in AArch64 state, as well as ID_PFR1 accessed through
> > CP15 in AArch32 state. Leave the alias unchanged when AArch32 is
> > unavailable.
> > 
> > Fixes: 07b9acea116e ("xen/arm: Add handler for ID registers on arm64")
> > Fixes: 8f81064a07c6 ("xen/arm: Add handler for cp15 ID registers")
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in v4:
> > - Explain why ID_PFR1_EL1 is left unchanged without AArch32 EL0 support.
> > - Move all ID_PFR1_*_SHIFT definitions to the common asm/sysregs.h and
> >   remove the unused cpregs.h includes from the ARM64 files.
> > - Return explicit unsigned GIC field values to avoid MISRA C Rule 10.3.
> > 
> > Changes in v3:
> > - Add direct dependencies for the shared ID register helpers.
> > - Move ID_PFR1_GIC_SHIFT to the common CP15 register header.
> > - Apply cosmetic fixes from review.
> > 
> > Changes in v2:
> > - Share the GIC ID field helpers between the AArch64 and AArch32 paths.
> > - Parenthesize the individual ASSERT conditions.
> > - Preserve ID_PFR1_EL1.GIC when AArch32 is unavailable.
> > - Target master instead of the 4.22 release.
> > 
> > v1: https://patchew.org/Xen/ba4f779d68c54efc80c4a566dca38ac2e6f9a073.1783675708.git.mykola._5Fkvach@epam.com/
> > ---
> >  xen/arch/arm/arm64/vsysreg.c             | 21 ++++++++++++++++++-
> >  xen/arch/arm/include/asm/arm64/sysregs.h |  9 --------
> >  xen/arch/arm/include/asm/sysregs.h       |  9 ++++++++
> >  xen/arch/arm/include/asm/vreg.h          | 26 ++++++++++++++++++++++++
> >  xen/arch/arm/vcpreg.c                    | 12 ++++++++++-
> >  5 files changed, 66 insertions(+), 11 deletions(-)
> > 
> > diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> > index 66f4f23bb3..2912445301 100644
> > --- a/xen/arch/arm/arm64/vsysreg.c
> > +++ b/xen/arch/arm/arm64/vsysreg.c
> > @@ -299,7 +299,22 @@ void do_sysreg(struct cpu_user_regs *regs,
> >       * to identify the processor features
> >       */
> >      GENERATE_TID3_INFO(ID_PFR0_EL1, pfr32, 0)
> > -    GENERATE_TID3_INFO(ID_PFR1_EL1, pfr32, 1)
> > +    case HSR_SYSREG_ID_PFR1_EL1:
> > +    {
> > +        register_t guest_reg_value = domain_cpuinfo.pfr32.bits[1];
> > +
> > +        /*
> > +         * Preserve the sanitized ID_PFR1_EL1 value when AArch32 EL0
> > +         * is not supported, as for the other AArch32 ID registers.
> > +         */
> > +        if ( cpu_feature64_has_el0_32(&domain_cpuinfo) )
> > +            guest_reg_value = id_reg_set_gic_field(guest_reg_value,
> > +                                                   ID_PFR1_GIC_SHIFT,
> > +                                                   v->domain);
> > +
> > +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
> > +                                  guest_reg_value);
> > +    }
> >      GENERATE_TID3_INFO(ID_PFR2_EL1, pfr32, 2)
> >  
> >      case HSR_SYSREG_ID_DFR0_EL1:
> > @@ -362,6 +377,10 @@ void do_sysreg(struct cpu_user_regs *regs,
> >              guest_reg_value |= (sysval << ID_AA64PFR0_SVE_SHIFT) & mask;
> >          }
> >  
> > +        guest_reg_value = id_reg_set_gic_field(guest_reg_value,
> > +                                               ID_AA64PFR0_GIC_SHIFT,
> > +                                               v->domain);
> > +
> >          return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
> >                                    guest_reg_value);
> >      }
> > diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
> > index f3c11d871e..f6ece8f972 100644
> > --- a/xen/arch/arm/include/asm/arm64/sysregs.h
> > +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
> > @@ -438,15 +438,6 @@
> >  #define MVFR1_FPDNAN_SHIFT           4
> >  #define MVFR1_FPFTZ_SHIFT            0
> >  
> > -#define ID_PFR1_GIC_SHIFT            28
> > -#define ID_PFR1_VIRT_FRAC_SHIFT      24
> > -#define ID_PFR1_SEC_FRAC_SHIFT       20
> > -#define ID_PFR1_GENTIMER_SHIFT       16
> > -#define ID_PFR1_VIRTUALIZATION_SHIFT 12
> > -#define ID_PFR1_MPROGMOD_SHIFT       8
> > -#define ID_PFR1_SECURITY_SHIFT       4
> > -#define ID_PFR1_PROGMOD_SHIFT        0
> > -
> >  #define MVFR2_FPMISC_SHIFT           4
> >  #define MVFR2_SIMDMISC_SHIFT         0
> >  
> > diff --git a/xen/arch/arm/include/asm/sysregs.h b/xen/arch/arm/include/asm/sysregs.h
> > index f6af987ef5..8dcf82a694 100644
> > --- a/xen/arch/arm/include/asm/sysregs.h
> > +++ b/xen/arch/arm/include/asm/sysregs.h
> > @@ -9,6 +9,15 @@
> >  # error "unknown ARM variant"
> >  #endif
> >  
> > +#define ID_PFR1_GIC_SHIFT            28
> > +#define ID_PFR1_VIRT_FRAC_SHIFT      24
> > +#define ID_PFR1_SEC_FRAC_SHIFT       20
> > +#define ID_PFR1_GENTIMER_SHIFT       16
> > +#define ID_PFR1_VIRTUALIZATION_SHIFT 12
> > +#define ID_PFR1_MPROGMOD_SHIFT       8
> > +#define ID_PFR1_SECURITY_SHIFT       4
> > +#define ID_PFR1_PROGMOD_SHIFT        0
> > +
> >  #ifndef __ASSEMBLER__
> >  
> >  #include <asm/alternative.h>
> > diff --git a/xen/arch/arm/include/asm/vreg.h b/xen/arch/arm/include/asm/vreg.h
> > index 387ce76e7e..96de1c4916 100644
> > --- a/xen/arch/arm/include/asm/vreg.h
> > +++ b/xen/arch/arm/include/asm/vreg.h
> > @@ -4,11 +4,37 @@
> >  #ifndef __ASM_ARM_VREG__
> >  #define __ASM_ARM_VREG__
> >  
> > +#include <xen/bitops.h>
> > +#include <xen/bug.h>
> > +#include <xen/sched.h>
> > +
> > +#include <asm/gic.h>
> > +
> >  typedef bool (*vreg_reg64_fn_t)(struct cpu_user_regs *regs, uint64_t *r,
> >                                     bool read);
> >  typedef bool (*vreg_reg_fn_t)(struct cpu_user_regs *regs, register_t *r,
> >                                     bool read);
> >  
> > +#define ID_REG_GIC_WIDTH 4
> > +
> > +static inline unsigned int vgic_id_gic_field(const struct domain *d)
> > +{
> > +    ASSERT((d->arch.vgic.version == GIC_V2) ||
> > +           (d->arch.vgic.version == GIC_V3));
> > +
> > +    return d->arch.vgic.version == GIC_V3 ? 1U : 0U;
> > +}
> > +
> > +static inline register_t id_reg_set_gic_field(register_t val,
> > +                                              unsigned int shift,
> > +                                              const struct domain *d)
> > +{
> > +    register_t mask = GENMASK(shift + ID_REG_GIC_WIDTH - 1, shift);
> > +
> > +    return (val & ~mask) |
> > +            ((register_t)vgic_id_gic_field(d) << shift);
> No need for split. It would fit 80 chars.

Ack.

> 
> > +}
> This is a header included by a few source files, so the less we expose the
> better. Please combine vgic_id_gic_field() into id_reg_set_gic_field() given its
> simplicity and the fact that it is only used in the latter. Also, your new
> helpers use a vgic.h namespace (this header uses vreg_ prefix). I think it makes
> sense to s/id_reg_set_gic_field/vreg_id_reg_set_gic_field/ and
> s/ID_REG_GIC_WIDTH/VREG_ID_REG_GIC_WIDTH/.

Thanks, will be addressed in v5.

> 
> With that changed:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Best regards,
Mykola

