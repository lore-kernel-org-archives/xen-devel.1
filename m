Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED63C4452A
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 14:07:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366590.1616524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlodz-0002pH-QK; Mon, 20 Jul 2026 14:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366590.1616524; Mon, 20 Jul 2026 14:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlodz-0002pA-Mf; Mon, 20 Jul 2026 14:06:55 +0000
Received: by outflank-mailman (input) for mailman id 1366590;
 Mon, 20 Jul 2026 14:06:53 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wlodx-0002p4-LJ
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 14:06:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlodw-00G4nl-Li
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:06:52 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a5e2b7c-bab6-0a2a0a5309dd-0a2a450acc86-0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 16:06:52 +0200
Received: from [52.101.193.54]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a5e2b7b-f2d2-0a2a450a0019-3465c1363db3-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 16:06:52 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by DS1PR03MB7847.namprd03.prod.outlook.com (2603:10b6:8:21d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 14:06:48 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 14:06:47 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UjBheRBQWRr2ENxGXHKVkHQGxZhwSH/rru9r5nlL0hM6c4sH24cKebgE6y8CPj4vcB8ksK1UWmbpbPaEP0SxNxstioKRO7a8PxkFI2+K6ZJuuJpNtozho3umQv0JxHCrMN9ErO0028p6YvSRWs3otVjROJCH5eHOjPLgsF12hkXVM9p5Q8aWAgiqxUsuU2gRiG9c2SriVGcvl25WgT5SFxf1T7dvJ6j5cCHQKynJjN2Y45446rmGjgaPmikkSPRTdXxHzXg+jDxnDiGytsZ5Okz/VnodFi4QMsIhB/WORz1nf9Ep7RMNs4uaGqq583tSfeOKIEcOgHmY2YFmpUGM6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tp6L4tmt1iid4QiCvAQWZ2p+HUgl846YV/8U1OK0ko0=;
 b=EZgsnbriYvqYb8tNw8JPYNxJYYI/2fglxDTei52namg/9DSZSNgzG3XSLjWax8AOR0gu7NqX980Q9fAgHCuR0IpftH8FbT1xqiXjDLxmvc/mi0v2TELGLimD0VOqANnwkJeU/aUbblqe9HtDqiRLsRkaqwyYsZoqoaDXh7Mw/Xf6b+/6mfBY5Fxn9NjvsUXmt+/I37oXtrOOMYW8dpowHNSB/ym3DIb3QZyVotEMYHuvMSibMh35Hox4cdG+HycjC3mu4c/M5YDZAEydh5nBY70u0eTpm00wllnBbvqeah4/nQOy9VlfBQ10diBBXB//r9oRMZ7wA8cNI1YUNTpK1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tp6L4tmt1iid4QiCvAQWZ2p+HUgl846YV/8U1OK0ko0=;
 b=DO0bP95ztzIeMcsFCsA+6tkORfE0jgeXf3HiM45GFZpW14F4d4ZBKuvKKRl+W4mgOHb/sp+jtPZqE5aC7IPAeSrybXoifWO9s8zqQewcwWYuELUze8lWv03b62QzmRMgTF5Kr6RnF7oNEskSsZ5Ql1kjiAh/Q4OJsZCFuDjBogQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <80591621-8af0-4f80-a187-e6cfbc19ca0d@citrix.com>
Date: Mon, 20 Jul 2026 15:06:44 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86emul: drop dead conditional from decode
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <fb374bfb-73a5-47dc-8227-c0c172620f19@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <fb374bfb-73a5-47dc-8227-c0c172620f19@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0131.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::10) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|DS1PR03MB7847:EE_
X-MS-Office365-Filtering-Correlation-Id: ab3f0959-1c56-4d78-a1f9-08dee6682326
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	67o1zHhBKPnC7Qq+NuDRnvOyGVUrtO3//suU1cGen/fsWOQD/qho0BZlPrDc5YGVaojpcNhiQM7wwZMun5ka5Db25zYqCTReeSOXTr9PixUFzGa03qHyrrC8LGxf46g4gLViM/Cd7SCFQo2tpGvdrwswjRaTLbFVe+Dce6B+RxvyUXepVJbPaUrpb5DzabZ+yMFHgdWeCYAUYnO3g13Kf6AyiV0nd+JspfkvuA4vWDDjRkeqzgVZAVxqb+V4vmGIWCaZlYshlDCASjBwu39UrcOMuz+3QcNFyntsVbLKU2c+gs9RuGEsODWgotPWGQEtLIYHt291/BskSwXl3XeXaLkKIgWQ6eiXObhHlIhtHxQ0D9mZ+VYz1NbJfSxfett4fTdfxKJIQLYJPkJWvY+uC7Ga67d7VhKJRenStxsQifjvIR1RVtPD7PJaG4b4IATJm/BlW9I96apAxFmStYhFDNMc82qgIR1HQzDmYHWRTvso/xCI0/BPcC2ttuZOA+TRNQcUFYCaTwmR/qvcEn2+TkgY7wXt9BAQzIffk7rrddWw0DYfEf5vksHlZ0inSr1lxAZivY980NXBH7KgeWlCZhdQmff5GvYS9mOSej+JFNR6++WQgxJJUjJ5+rAtVyNz5gaMFw/snDcMZ/gCuX/AITPEAoIGL2Ckra7rztKwSjo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0R6VXh3NmR3dk1yY1BMY0hXY0Ric2RvL3JZTCsrNktFMlJxbmNQUDY3aFVB?=
 =?utf-8?B?bDZTR21mR293ZWhQMjc1S21PZFZUbnZvbTRJTWNsbC96OU1KN0hUUStxZ1pX?=
 =?utf-8?B?ZzROSUVyaTVZdGdOOEU1SUJvaTZ3Mm16ZnhsQ1BiRDYyY3c1SGVweDNjQWov?=
 =?utf-8?B?TXNJR05qbGJGVFA2OWVMT3hUd29PM1U5Y2gzY2twUko3TGw1d1VsOXovc3dv?=
 =?utf-8?B?R1UrcEd6S2o3ZWZ3Wk56QVl0QVJ3Z3ZWUW90bEQvVTVMN0FWUU4yUUROcVRR?=
 =?utf-8?B?Y25xL0RYeC9kWFZGdStKeE91WEJpQWc1Z0dndmJmbnV1WGhuUmV5VVFMei8w?=
 =?utf-8?B?eENMMGNpYmFVYTU2Qmo0YlQyeEtNaEVub0MwYXRGM3FaU1g5d1VvVUtDM09V?=
 =?utf-8?B?cTM3a0lJSDFVS0J5M0c3TUh6QTNVVURpWnJrWjBsd3F6UVhCRW5qWWZrWHFu?=
 =?utf-8?B?VGdoSjhKdkwxNGQ0M0crYVdVSGViQ3ZLbEtkKzMyaFFTOVdQUVpJL3lUYjZl?=
 =?utf-8?B?YlIxK1JHR2xrRnNOL1hSaWFvOHVWbm9jRTB6Zld6dytLaENZbFNWMkd3aFNW?=
 =?utf-8?B?MmlDcVlKdnYwNzRwb3R4RmZZUlltdHZWQlNYVWJWRC9Yb0ttOWd2OHdkR1dW?=
 =?utf-8?B?TSttanJxbHJJQXo4STRQNU9GZFJ4TVBlbTVUSm16cTlQdmNwdUREQlh0c2dJ?=
 =?utf-8?B?WVlqNWlnajNkdko1eUM2cXY3aWJwSFRud1A2SXk1UkxWV3ErbHozVCtON2sy?=
 =?utf-8?B?UkpEMC93aWtuSk1ReDl2b0hmczZqalRIa1NGajJ0UjFnRzNqbU4vcmw4cFU1?=
 =?utf-8?B?am5IcXdUTDVvZEhVaUxXcjBoWmlWTnR5bDhNRGh0WHhGQ3ptUDZYNVBDSkpp?=
 =?utf-8?B?emdMRHdXK0NHYlBvVGhEd3AxZFdGVDVyR0F1Vk96MUtUeUxQNldKZ0JweFNq?=
 =?utf-8?B?bzBFSGlJL0JSaHJQa2pBRExJa1hRN3ZHVkdwZVpkRTdtM1lJUXcxTnpVWGFQ?=
 =?utf-8?B?UzkzeTRSbURMaXdraHVtYk9STFBIdkNrODFiOGxRQkpPMjRSZHhwS0FFb0JB?=
 =?utf-8?B?MEppbTlPSmpjMzc3M0M2ZjhMc2Ntb0ZHYnhVa1g1cnBsOHdLTC9hWDJPamU4?=
 =?utf-8?B?MEtWSVN2QlFVNEhMcTU2ZnZTVUVSVk1zN00xYTRubXpJeUROazgxN2F2ckZu?=
 =?utf-8?B?eHZKSWxSWWhIcnV0QitmWHZibDNoQ0tVR1dORlR4ZnNQdVduV3FFelVxUVVi?=
 =?utf-8?B?ODRCR2FvUkdGUG83L3MzY045cEkwQ2ZUSDEzeGZXTVFGYmNHN2VCd3lVaW42?=
 =?utf-8?B?SzNFWS9SVzUyd3l0OGdCeGtsTVpoS3JrUHBjQldFUk5TWnZDYzRUUGtSalBI?=
 =?utf-8?B?dFVQN0RwOFI0dVUyc01yQ3VVaklpUWRzTzhEL3EwaHgrMnNxS3dGNXBXMDZa?=
 =?utf-8?B?dTNQMGtJcVRNSDRqZTR6cDdEWStxeDBwVjRIYnRWR3BsUlFiL2RPeDBGenZk?=
 =?utf-8?B?ZS9xVHNuT2Jid2EwbGxLYTJkWkwrNXQrY2lMdmRpWXlCT1lGTHpqd3ZlNnNw?=
 =?utf-8?B?SkdGZmQrcG41S3p6SHZrMWVLdnY0eXM5Z21PTUtFell6Tm9QQnVNaER2eHVR?=
 =?utf-8?B?V1g5OHZWV1Q1bnpVQ2NqWldCTEQyMEZhNi8zUFVHOGgrdEJPTDduam81YTNy?=
 =?utf-8?B?UXpqSkFzd0VGTjJlMzZ4dENpYW1kWDdmOExRL3RESWQzOWxtQzBsdEgycHp6?=
 =?utf-8?B?Q2xQUDhFYSswTUVyUVhMbjREMnVOckdETUZGMlAzUGdrSGlBcjNUbUhNNjAx?=
 =?utf-8?B?MWc5MVNNYVo1cUI0dWhzUVd0dlJhdUw1YngzbnNrUG5iRHpnbGJQMUMrYTh4?=
 =?utf-8?B?R0NBZHdIV2dBYTJQMXY1Q3FjdCsyL2FmdjVvb1diRy8wM3BkaE1KVWdCSEpj?=
 =?utf-8?B?OHpVVjZ6N2NQSzlzdVd4Q0pRNzBEeXlWcnEva0owcmJJalhPV05BZVJNVkxS?=
 =?utf-8?B?WkdBTmtTZ05meVVpRFAwdTNqTUJQMXhqWld1VDNqOGRxekk1QWFUQVpaL1M0?=
 =?utf-8?B?bGRyNm5HeXhHbEpNcXJySFpxblZnM0U2QkZxVzNUZDgvVFMyNnBjQWd5b3Iw?=
 =?utf-8?B?RGRNejdIS0c5K0ZMT3dQUTFlZUMvMi9OWURNbEVYWjBYSC92LzJ3RzRkbHlH?=
 =?utf-8?B?RGZ3aXlRekhzbWVKeHU4V0hqT1VWTkM1MUFqV28vMDJzbTRZdWVZdVMwTWxI?=
 =?utf-8?B?M0FESDdWRENnMEx2aGtQWUZKeEp1L09lWERvSTZVTm5sK3VUSmJxZjVWWG5M?=
 =?utf-8?B?NjNiMDk0WWJlOVFSbXBkbHhpNDVoQmE4ZEtBU1puMCtnUlpuS3VMajhwS0sx?=
 =?utf-8?Q?bT8Js8XebR9XeqOU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab3f0959-1c56-4d78-a1f9-08dee6682326
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 14:06:47.4870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ybP56D9GpjbqVrSayrJJyG8XKcI0lepk2/WW17PG2lFyB9dq185YrmU4b51EhYtdS5HcKgru2kZG//0wkDRzLM8BrRCRknMta2BXY9ljyJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR03MB7847
X-purgate-ID: tlsNG-4011c0/1784556412-5A9D9CFC-166F70ED/0/0
X-purgate-type: clean
X-purgate-size: 528

On 30/06/2026 2:29 pm, Jan Beulich wrote:
> We know that opcode_table[0x0f] is 0, there's no need to check that. Up
> until ab082ffa87d5 ("x86emul: generate and make use of a canonical opcode
> representation") or maybe already c4e7a67e3a10 ("x86emul: drop
> SrcInvalid") this may have been justified, but it no longer is.
>
> This eliminates a Misra C:2012 rule 2.2 ("There shall be no dead code")
> violation.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

