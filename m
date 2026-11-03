Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EA4606A31B
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 17:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=wmUrx5eF
Received: from list by lists.xenproject.org with outflank-mailman.1470319.1679048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOI8C-00040r-DK; Tue, 03 Nov 2026 17:17:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470319.1679048; Tue, 03 Nov 2026 17:17:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOI8C-00040i-9t; Tue, 03 Nov 2026 17:17:08 +0000
Received: by outflank-mailman (input) for mailman id 1470319;
 Tue, 03 Nov 2026 17:17:07 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOI8B-00040V-BM
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 17:17:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOI8A-007bvD-GZ
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 18:17:06 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aea170c-2eae-0a2a0a5409dd-0a2a4504c062-10
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:17:06 +0100
Received: from [40.107.209.51]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aea170f-b57f-0a2a45040019-286bd133a493-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:17:04 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB989098.namprd03.prod.outlook.com (2603:10b6:510:3ae::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 17:17:01 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 17:17:01 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SignCqO6tZU/6/cqpCRTB3OTqND216VOQvIsA/xwRAOllAYFnDcr1gFcbc2PJ58af+SrnkK9daA08DNPTuf6GH5J2MwLMPUOaAjoOyE0AbmCyA5MIUYWV1i+cssh7PiJohKM+8rEzJ78NMrnTuiZjlHCM0aIYYSYT7AGb0ttMtfH8xkAtxMurj6oTg7tHqT58Y5KBnFkTsMAtizBomikZSE8tDUU5CnZ0Ob13qqwNHd+kD97TB/dLli8D2dFMR1CwNoX2/xcOWd5hlKKIAXvQz52+Sl2wKEyzFt1hRVpso1LAkxqGbSqAtPqunpMi/YEYRmNkzTVA0lAZea9NQa+Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqJ3kP4BOJDd7ObQ0VHoZOSWEIMtsMy6lNAbJLw2ftE=;
 b=bbpZsdP0hOc3Yu9rAeOZP7QbAZVsJfIhehRAlYmeBEgDqKut732s5dIC4f/GPc6o6cRr4ayuir53cniCaLN7G+ogn0RS5fWAkeWHSHVorfr+YgOGvW+1S4Ui8fHVGGsQ2uOct2ImsloqwJ4SKfUvwYjzguKaha4fCfW4Z0NotZfEvclidW8W81kejesyuJpvPSCx0Ml/MlDAuCI11ahdf/HwF0IdRp2Sa2HKbJuQJutHtlIZ9VLl4B4tVtjU+1+ricaJZVTczPB9uJHxGtHxyhSEqik4xXIqYIFcREcLxjjCwP+IMuWgtknZgK0GBITn/uKGuJh+WvMAMjPvYNTZDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TqJ3kP4BOJDd7ObQ0VHoZOSWEIMtsMy6lNAbJLw2ftE=;
 b=wmUrx5eFeeWlX8YvJxzINekDYGhoti91mHbLNMqrUAX2H3WuW8wJhI5jZBEpvOWk9fxgZzEUoifsbb9hy9HqmSLXmxz6ZIULDcPMQY45CxvrzHTpJmU3AwyATu2Hf6MxRopGytq9z4zTAuZ04tpYrF+JuWWXkXr639KHSmrF6Bs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <dcb8ea95-5a6f-4eb4-812b-406711b127fd@citrix.com>
Date: Tue, 3 Nov 2026 17:16:57 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 5/6] xen/gnttab: Fold error handling in _cache_flush()
To: Jan Beulich <jbeulich@suse.com>
References: <20261103152928.2142176-1-andrew.cooper3@citrix.com>
 <20261103152928.2142176-6-andrew.cooper3@citrix.com>
 <9a163ab4-a8ab-47a9-8e67-c283d3ca94ab@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9a163ab4-a8ab-47a9-8e67-c283d3ca94ab@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0016.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB989098:EE_
X-MS-Office365-Filtering-Correlation-Id: ce8ec025-b634-4745-fe75-08df39ce463c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|4143699003|11063799006|56012099006|261021121427099003|261102123227099003|261022105027099003|261026140227099003|261028144727099003|261026121527099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Kh1AM/cIQrzMZIdymzt1DfMLh27av7cCQd7s7wVqHw4Oj+/UoRIGCeGnW/d9+Omu1fTuDXxt5DQxJVB/9fP/EcI47zyv/CIaBGNAVCm6JyZzmUXeZpW+bXesuFDZaS2Kms/gCfG9IfZh5D3FpJEivdYK3G4z8bb2yKfV+o03f+Lux8qyUpB0B36MDFuZ/bipofGehkhamc0rasqDogedZSnhlHx6wM79cfP+mx5icgYlqRweJuLlVXDgTtoWV+KppMXqNPQKeBrl6EOMRCbHJu5dgRhq695ZcbTeo/QxEoqyBg0ANQYX4MOq7mohUMWy0LdEaprrOVPL517JJT4llYUhlm3A/7uTzWBQbmKQ+OncT0cySdvM2Qu6k5vAnxpg1aP7U6UQj8GeYZH5b4BpegbTvyma/DWDonDCTUL55nAjDLzE9w933wH/RR5jL2XjpY+pa4Ea1dbl9JzGq4WwS6prB4/QEzogA1wjmPY/n6ovWsFhEB2CnnUaYDehPueutKcbJi8OL61IK/lK4A9hk3NYTG0DvaQ+Swk/UKIUy/LEJTIMlCn9z4/6VIwlDZs1R6iWIqV+Oq+6kmxdCJKEycmIapibNBIqlRdiCTNx1ZB6Fct2dGLVF6vIh7QaAKTF5H9WLwlENhW2KfRkMH0ztJJKeRotwea71OwGrs4FWy8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(261021121427099003)(261102123227099003)(261022105027099003)(261026140227099003)(261028144727099003)(261026121527099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RER4WFcvQkF3ZDVJZk5KM1g3WDluOHh6VDdCRW0yTlpYWHdKRXMrdDZXZTJO?=
 =?utf-8?B?WG0zUnNSbkwzSjZXWXhya2lCWXhGUXhqUjRrMFRlbnVNRXoySHp6dVNPNHdW?=
 =?utf-8?B?OXE5MzI1V2lUVE5JbmxJY0l1bzV0V05nZ2VCbDNJelVjdVBXSUIzZTd4UXZ4?=
 =?utf-8?B?b1BJejEwaXA4dkpHWEFJVnJmSDJVMTBXWllHTnM1NU5yQ3dJWGx2Z2tVc2cr?=
 =?utf-8?B?OGZrV3hNYlhPU3F5NWk1MVZLaE11SjJ2alZFZ3hQcXl2cFF1T0NmdkNJUU5J?=
 =?utf-8?B?K0EzalhaVm9kTWxWblBWRDErUy8wOXpPa2NIeWNEaThVaTJJVSt2TTBtRHZi?=
 =?utf-8?B?OEVEMHdzcHNUbXNCVkJaT0orVDJtZ2NYT2RHRmJXQjkvQVpuOU84ZHZoK3dS?=
 =?utf-8?B?NHlnTm1WdVJiWU1FM01VNUQzbVhUMWZNTFgwc1B5QTN3aHRnRFc4S3lCZ1VK?=
 =?utf-8?B?aWIyT0lIUHkxdHhZQk1YNXE2eFhQSDkyR0UzSERmNkU3b0taZjNwclFiazBC?=
 =?utf-8?B?M055NnB1ek9hMENjaTA0emp2c1lzcDZwaGltK29jSldJSWhvb0dZNER0bmFi?=
 =?utf-8?B?ZStmdnQ0dlMzZDAySFRFMlhtMkVsc3pDY21ST3FFcGw4cXpPMDRoRlQwZWJt?=
 =?utf-8?B?NVlrTHROSW9NVjhRTzFtUU9DaVJVTHVEdzFuUDZHQ0FJNXNSLzBmVU1ib0JV?=
 =?utf-8?B?MCtPdWMydlg3bnBuck9qK1dmY3NpN2VSSlpvUUJCQWlRa05UanZLRVZmbG0x?=
 =?utf-8?B?L0YxQUtBdEwyL2Q5T09ncnNYaDZHMzkyM2x3S01QZXFDS2RaRyttRnFBNlRZ?=
 =?utf-8?B?TXFmQVRaTTIxVVZERXQwUmxSUGN0NGFPczFoUzVvU2E2TlhnRk9LaTdHS2c5?=
 =?utf-8?B?ZE1UN3RzZTFyajIzWGVjYytNbitIOVMzdzI4dHlpWFM1QjZnU25mUTZFeXZG?=
 =?utf-8?B?dis5NjZ1bjNqSjcrYVBqRFNqZGZvUkNXdGRQVUdBZldtWE9VcVl1QmZXb0lJ?=
 =?utf-8?B?VUg1YTBkWi9DcWRuck40Rk9sV1M1Q2JrWnJFQ2ViWGxNbE5JN1hZZEtNWk04?=
 =?utf-8?B?d1dsTlJjKzQ3Y2M1UDBFcVQ0bldBclR5K1Jjejl3VDIwYytaUGgwMHFXMUZn?=
 =?utf-8?B?K3cxQTgrNGtNMG84SCtNRUt2dkZrcm16eE1ZdTQyYTgwL2tuVVNPdFZUU0Vl?=
 =?utf-8?B?MngrRm9mRlU0b0xicHhTZ1pYc1BvZXd2WVRNOGJoSWI1d3BxNEpValBRWTBF?=
 =?utf-8?B?L3F6NHFCQ0lneE5kTlgyZWZXVzhWUlZndmpocUh1aEN0VXdpOE1CR2s1NXM1?=
 =?utf-8?B?R1YyenI4VzZQYkNBWlk3TWRjOFpvUGZGT05vd0V4WkxiSW01Y3lUVFdmYWxq?=
 =?utf-8?B?dENwcmdBNEVyT2xUTWYzTWtKakZzZXlOS0Jud3NTUVFhYldFa2pHdWRaNlVl?=
 =?utf-8?B?eWFhMTJqclBka1pld0JTVDc0ZlRHRXBiNVF0RTR1a3RaMU40YlFhZUNIZjFQ?=
 =?utf-8?B?Yi9SZHZiY044OWhWVEhRMTNuZXhYU1VkMWN4M3lDNjJuWDFWWnVpelhpWnB1?=
 =?utf-8?B?OFQyK2pXdVFnZ1QzZlQ2STNSbzdNM01OKzhrc0EySGZLL2FTdVc3NTFqMy83?=
 =?utf-8?B?NS9FZW51aGhCTHh2MXJZOTI5Y2EzRnZKTzlRYjRyOWR1N2t1MTFiN29HRTVB?=
 =?utf-8?B?SmtXWWFKaTlVQkJVTEhtRzkrQUEvQ3RqZGF1aGFwRFNUcmNPSjZ3Y0R3YkFR?=
 =?utf-8?B?aE5oV1lBNDc3T3ZjOFhHOTluOXdMbzVLUHNhRGc5MGRxU0tLYm9YRVpucmha?=
 =?utf-8?B?NUFCRkZGNkRaUzF1NlNKT3NTb2xHRlRCdndxOHplL0E4SUlienkrZjNOczZB?=
 =?utf-8?B?eCt4Q3J5V05PMmhGWnJDMW1KdU51S0hLOUd6Y1NWN0Vyc0FvN3JvV3VoUjlH?=
 =?utf-8?B?VVRuYmxJMFZKdEhnVHZuQmdKaDlacGtmT1h2cVpIVWpsMU44SFZTei9GWDVV?=
 =?utf-8?B?b1RNcjR3WnFmSmpVbW55VVR6bWJWdHJCTEM5c1ZjdWdaNFMxVUxxNUpkTmti?=
 =?utf-8?B?QVU3RDBlNE1CeHRnNDV2Qlk1dkhnU0l0ek5xMDFVZDBTK29TV0FmM0ZsandM?=
 =?utf-8?B?M0RSVWZkTVNXcENXOURBYWtZQXZneU5Udm0zdWl1ZC9VVEF2UFFmNGxhWUVw?=
 =?utf-8?B?dkJuWG5Yb0JpOVhDV1grV29Oa3BFeFpLT2k5V0ZpWWtxVm5sK1I0RXFNbGNv?=
 =?utf-8?B?dnVQb3pUeVdveDFTOFpWN3NSVy9zdHBtd040Uko5L1ZFRVlaS0hSWCtBaXhh?=
 =?utf-8?B?ejc1bzBzblpVa0NZQkJkQll4RFJQMWJoNWovSmttVlg0dmVXVmpXdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce8ec025-b634-4745-fe75-08df39ce463c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 17:17:01.5166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KRmu4Lp5QNx2qDR9LxYXT4eSefCsf2+mHuM3tsr40MPqBDvfgKSh//5T9+7JvOFsQ9WkfbS6vdVQ1fblvJ/mXaJW5UA/bq9Jaf6tVtGf9Co=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB989098
X-purgate-ID: tlsNG-ebf023/1793726224-C1AD0B50-E3B5FF35/10/78276251493
X-purgate-type: spam
X-purgate-size: 1145
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 03/11/2026 5:00 pm, Jan Beulich wrote:
> On 03.11.2026 16:29, Andrew Cooper wrote:
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
>> @@ -3683,13 +3682,15 @@ static int _cache_flush(gnttab_cache_flush_t *cflush, grant_ref_t *cur_ref)
>>      else
>>          ret = 0;
>>  
>> +    unmap_domain_page(v);
>> +
>>      if ( d != owner )
>>      {
>>          active_entry_release(act);
> I was first meaning to complain about the unnecessary new lock nesting here,
> but the earlier map_domain_page() also is issued with the active entry lock
> held. You move things to a more consistent pattern this way, which is good.
> Yet at the same time avoiding that nesting might also be a good idea.
> Something for a later change, I guess.

I don't see how you'd manage that.

We do have the proposed MFN in our hands, but until we've confirmed
there's a valid map for it, it's an arbitrary piece of memory belonging
to an arbitrary other domain.

With an ASI hat on, we absolutely mustn't speculatively map it.

~Andrew

