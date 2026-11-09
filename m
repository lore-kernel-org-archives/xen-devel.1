Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD367606A31C
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 17:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=Y6j/Q42h
Received: from list by lists.xenproject.org with outflank-mailman.1480326.1684288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQTNB-0006ao-OJ; Mon, 09 Nov 2026 17:41:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480326.1684288; Mon, 09 Nov 2026 17:41:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQTNB-0006ah-LG; Mon, 09 Nov 2026 17:41:37 +0000
Received: by outflank-mailman (input) for mailman id 1480326;
 Mon, 09 Nov 2026 17:41:36 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xQTN9-0006Zz-Uc
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 17:41:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQTN9-008CCW-4Q
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 18:41:35 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af205cf-8faa-0a2a0a5109dd-0a2a4507e88c-0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 18:41:35 +0100
Received: from [40.93.196.8]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af205cd-b4ea-0a2a45070019-285dc4086f3b-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 18:41:34 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA1PR03MB6466.namprd03.prod.outlook.com (2603:10b6:806:1c1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 17:41:31 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 17:41:31 +0000
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
 b=QKwNBlaQBC2Pi2tA7NdIkMGnnzRRyzAloxuW3YGohd4WBohcGuZRVEVLodONJBAD+nlMHQ/1igCuLjKBUdh4vra6AIHYpO0vW/VXd3DG994vNygD+qzxUMaC/wqOQ0A83IOgFt77rpSDAhUQ+DuUBlOP64tTw4fXWMP63rAHY02EwOh2KjLCWOBqIMrgwi2dVp50oLxqtj2H9+mL+15VxsuMJe+HvnBm5NPue+yyDre+ItGgkPBrvawuXlFoc2jVEWCiKxxY1KxAC2td7Bhn5XrOvGtppC9nTyKvvkmTqVH/+wTPnPdOOpuTyfcKM0F6HgcSFdyEq9vfBfhuEkHd2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PwCI3OlFqKRN0yjz7cRP5YurQqT2tlEMLnrulWg4NY4=;
 b=bVDXXtJcO95VWkWv7nL0ErDmR3zTHZzOaDNLczd6Hl72aqWZWpmdX/yGI6SjMai/+6HdrhXjZRcQUA/DkfGwkStHezzByDMSzpgf6ENkY8zxQaBHKfLl0RGOmL2OABf1xvqPsELkD8E6iJzwc/hiSpi5Tw6v4HJmtFhpok0whR/ySNFjXn/7u7j7/wV4JOaMVtAaoL7JdfA2yDT9Cm5oax13qfPQgPsmhoyMYjLWZV1F2zSNuSuVC9dJEV25P3Tv6u2xYVP7BYO5wTT2tvwcEOaOnhglUhuaplBIF6Kv03P7h97LOI06zVVsS1zJrkRPf3igM51Nw/Jlu8lEJoSc2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PwCI3OlFqKRN0yjz7cRP5YurQqT2tlEMLnrulWg4NY4=;
 b=Y6j/Q42hx8BNXMHwF9GEnmBQKDDCTlYIfk4rczK9ytThZ1GDGJXisHw3qlFCbiREWXYqIzCATFbutwclZ1ogyuJrTT6PEtdUqN14zQ4QzDD1QrG0KdNxZkKBoRF3nh4FuM/+tIiirmQdk6FyDCuDTtffqg+guCD99N6ETSshkUI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ba6859a8-8fb5-44d5-9189-b19d606c4216@citrix.com>
Date: Mon, 9 Nov 2026 17:41:27 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com,
 roger@xenproject.org, teddy.astie@vates.tech, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 2/5] x86: extend mod_l*_entry() to optionally return
 the old PTE value
To: chunjie.zhu@citrix.com, kevin.lampis@citrix.com
References: <20261016164815.3109065-3-kevin.lampis@citrix.com>
 <20261020023400.295707-1-chunjie.zhu@citrix.com>
 <4f585dab-4e55-4223-bddb-65d145382612@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4f585dab-4e55-4223-bddb-65d145382612@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P189CA0007.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA1PR03MB6466:EE_
X-MS-Office365-Filtering-Correlation-Id: 8111938e-5cff-455d-b487-08df3e88b0a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|10067099003|3023799007|4143699003|11063799006|5023799004|261009223027099003|261026121527099003|261028144727099003|261102123227099003|56012099006|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261026140227099003|260925021911599003|260925021311599003|260925022911599003;
X-Microsoft-Antispam-Message-Info:
	REcZl2f3xO1nB1P0EEW+earBZrD12y7mh6VYAzVZy0fTzQ/pxiWLEx/MRP/Qg/ahKslffrp3CWQ+g02tNQmWix4YMbIpw45jrNmTG+rp6xUgATSN2zP8jE32DXpZ/ojp5gt2mUPy3ylmF3ShY8lbk3G+K/S/Z6GvDwmmaUQOS7q7n6G94bYVNOD49Gfs2Zyh+lyEjw+w8kGlvYiWZETCmvcKP0GP+kioSb8CiC3WRRvBrNjapMLbX7qknMugJweSNEg1scUFHSSOr1bKoTdfAh7gCBQQBA593fjSErNCisCj1Pkg0LEqP/EnDIaM16i4B5kQfLRKOaZlkrMNbp1tp9PLGBIZ1P9sc4mLPlk9WPe7oy4DboXMT+ZwjO+pZg4+wELJdvGfJ81mRjrPf/P/57ngT3+faOez6CZCVJcaEQHUIAPsxO4G6fpeN6ZDvGQcYioMUF0GPkowhoR2XquvWDFxbMFdRITcCG4PY16LgCnBUiGi7c3OzWoef4INe+Kg5isDJ9zIS0J6C3Jf6KwSnf8N2skKH10XxciCBWjg98hz9zhbvUobg4CUmdHrYRiiX0/Se2HU8IOr41hofMjupdvhALGD2zhmZH6OSG7xYKtJGjrJo45JCVf6yJUD/YqgPbidGmVHJhwgLtnZuilDugKAqwIWwNlbuKLTxuV2pHM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(10067099003)(3023799007)(4143699003)(11063799006)(5023799004)(261009223027099003)(261026121527099003)(261028144727099003)(261102123227099003)(56012099006)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261026140227099003)(260925021911599003)(260925021311599003)(260925022911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1ZVOWJaNkFkNllya2pza2hRdjVxTFgrMW9uSFRqMVJ4dUgyTDE4czNlUEV0?=
 =?utf-8?B?Y25KSzdaZFIzYmRXS1FDMzFTYm51YzREZmJ4QWhzbG1KeGJnWDFEZVlVeUVI?=
 =?utf-8?B?NkNycjZmYUdjMiszQ09XVkhkeDRHa0FzTHA5bTljNnBIV0NxK29NRWtMT0Vm?=
 =?utf-8?B?aUhaVThWcnhGdEJRRkR4VjQwc0NGdnhLU3BHS2JRRjRQY1pLRVlzdVU5aksr?=
 =?utf-8?B?d1NsVFJNZmJMZHNyRUZFMFl0ejdpZU1neGk1bjZGTW90b1hhcU9UMXUydmxz?=
 =?utf-8?B?QzZLM3ZrdGNvSVR6NGY5V2k5ZTYzVmo4R1Y4TG9QVDNuRFh6S0UxbGRxdjB5?=
 =?utf-8?B?VUNyNG9pYnBVV3V0T1IxdGtIeS9yTm1NMldOb0RPUXhiY1BXWHdGTmVPRDJQ?=
 =?utf-8?B?S1dnUURkYUxoNmpwSHVWb3I1akM2VXVYSDdGT0E3am9iV1NlaXJUcHNVaUc0?=
 =?utf-8?B?enprYWlqQk5OdGFBcURnOENmV1Z5OHFYV2hmbE1aYjk4cmk0WXZwd3hkMy9x?=
 =?utf-8?B?ZE94UFBDa3NtUW9XMzY2WWN6MXNETjBIb202am0zTlJ6NEdyMzl5R0x1cm5v?=
 =?utf-8?B?RVdOZUkxZjVvNDd1OERiUXRyQ0RoaFRyK3RiTW5kN1AzY1NmZ3hOYTNKanZB?=
 =?utf-8?B?SFhTRXpyRGUrZXQycFpsaEZybXc2OElXTjFFamFYWmQ5NzBIdUcxbFRzVmNx?=
 =?utf-8?B?SU5GMW1rWC9qRVJRSlBENjh1dWxLZnFUOWwxNWlRcjRsQW82ZjZnNjROV3NW?=
 =?utf-8?B?NDB2dWluOFhoclZTTHliK3c5Um5PQzBscU03aGxnR1IxUWxyRTRYZG4vdFhZ?=
 =?utf-8?B?QWZTUjdXeEhMZEhvVkY5U1V3MXhZVjVaNFFMSkhvclRGUE5GZ2NudjY5MTVY?=
 =?utf-8?B?M1FsVmVlVGY4R09iVDk2VmhWek02RjczQ0JJMlBBR2xob0VQQVNTZWxoZHV6?=
 =?utf-8?B?ZW1QVXBkNEhuY0RFZzFSR3MvQTYzYmNMUHlPWFlMRWVYSlUzektaSGVObFE4?=
 =?utf-8?B?TzBNbnR6YmJOWE1WMXJQcnZSSnY4TUxiYldHbEtRSFB6QWdHTGxjdnBGbW9J?=
 =?utf-8?B?UmhWcElsdDJBRzhDUVMyOTZYRWhwN3JrQy9jUE9PWGpoK1g4Yy9IMEx1cENN?=
 =?utf-8?B?STNIWGNrV2g3akZkTnRkYzI5eEtyVHJ1bUJLbmZoVnNrWkt1RllZNDZwVzV1?=
 =?utf-8?B?ZlNsVmNsZllKZzBIYWp1REpVbHhYaklYOWxLWEpVMkdhRGVIam5nVjdhbWRW?=
 =?utf-8?B?TFl2T0NiK1lxZEZwd2JaRFJ6QmErQmtYTE14ZHo4Zk9IU3B6cWlPUjIxZEJL?=
 =?utf-8?B?MkR5c3dqdHhZUGQrSHgzMTFlOU9KdnVjbFNpTXpzdjR2akJBbS9ZU1lZZDZq?=
 =?utf-8?B?VEVuRXhhK2xSZlVqYnNDblRHUXhOQytYR09GdTN5dXAxbitzc2dGRWpCTm1F?=
 =?utf-8?B?YnFmOFBJWUxkbWI3UWExdGcwNG9JK25aZlh6QitrdWx5UmJwRWU2TWxGUzN5?=
 =?utf-8?B?cnFkd0RmUVlQQXhucWdoYlVZOXBCTDFqRXlxc3ArZGtDSHlZdW8xRVVvdlcv?=
 =?utf-8?B?WCtOd1BKdldKUG9tdTEraVZCaGM5d1hzZkdWOUU0dys1cWdXQytJRzkwQjhI?=
 =?utf-8?B?RjdiUWk5MGkxWlhXMDdmZzVDdDhFaTJXSmMrOWQ5UHRHRXVmMjRyMDZCR2Q0?=
 =?utf-8?B?L1FQZ1V6Tk4yK1NLOVF0OVFPRGVFWENLc0gxYjdaNnE5bVAzTm9WbW9PL2dm?=
 =?utf-8?B?VkhrbVdaeDVETFhTRitqL2xvaytRd2NOVExaaFFlS2txblRHSkVMUCtORTJT?=
 =?utf-8?B?empVaWpkMlFzQTUxMjlFWTJnZG5kWUZZVUM2UHZnYWd3WVdzZ25TNk9MeU50?=
 =?utf-8?B?YU91aE9sdW52N3A4d0ZvRXFSdzZ2NHBFZW42L1Qwb1plaEJOdSt4UlZ1aEs2?=
 =?utf-8?B?c1MvZmx5VFN5ZlNYRnorRzNhN3d1Q2cwL2JXYW9uNmRZVE05QWoyTzI2S3dT?=
 =?utf-8?B?N3g5MXNDb2lDWDR1SUMyZEswL1lXckdUOUZleHV1T0VXMXZMVjRzcWo2SUhi?=
 =?utf-8?B?OWxCc2tvdm1pRTAvNmtUMUx4NnNaY1pTWForWDRuV2JwYkxXcUxML0plMThi?=
 =?utf-8?B?K3J5ZWU2L3htVzNERm4vdHVlemFqVXd1R01NRmJOSHFGUmpubUYwUzJPUHZo?=
 =?utf-8?B?a25uRisvV3g0dHc2YXBEbERMKzNabUlTOXA0dGRoN1haNTF2QVd4MEpYRmRt?=
 =?utf-8?B?QkJxS3k4bmp0L3Bnb0F0NDg4WkVsRVYxR2NSNXhWdzI4R3B0WENPV0E0dDQ0?=
 =?utf-8?B?amdHSUlENjRJNGxhSFVOSlRQK0xOenNpM1JZTjA5am1hczBqK0k3dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8111938e-5cff-455d-b487-08df3e88b0a1
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 17:41:31.0503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7yA0H9GQ7DyTPGYNAyThNmElQR1gAuiiFQQK1AWZFiRRVQ35W0LuzPdionDNSQTw6pIw7vQ2UH4IshM2YSee0+l0FUd8ABNgJN923IRIrBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6466
X-purgate-ID: tlsNG-ef75cf/1794246095-A56C2AE4-38DA5F3A/0/0
X-purgate-type: clean
X-purgate-size: 5250
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 09/11/2026 4:13 pm, Andrew Cooper wrote:
> On 20/10/2026 3:34 am, chunjie.zhu@citrix.com wrote:
>> On Fri, Oct 16, 2026 at 05:48:12 PM, Kevin Lampis <kevin.lampis@citrix.com> wrote:
>>
>>> Calling mod_l*_entry() with a valid ol*e_out pointer will do atomic
>>> CMPXCHG to set the new pte value and return the old pte value through
>>> the ol*e_out pointer. If the ol*e_out pointer is NULL then old behavior
>>> is preserved.
>>>
>>> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
>>> ---
>>> Changes in v4:
>>> - Refactor how UPDATE_ENTRY is used
>>> - Update commit message to specify CMPXCHG instead of xchg
>>>
>>> Changes in v3:
>>> - Add swap to mod_l{2,3,4}_entry()
>>>
>>> Changes in v2:
>>> - UPDATE_ENTRY now returns the old pte value instead of using an out
>>>   pointer
>>> ---
>>>  xen/arch/x86/mm.c | 106 ++++++++++++++++++++++++++++++++++++----------
>>>  1 file changed, 84 insertions(+), 22 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
>>> index e42cd33c0d09..609c8595a487 100644
>>> --- a/xen/arch/x86/mm.c
>>> +++ b/xen/arch/x86/mm.c
>>> @@ -2193,7 +2193,8 @@ static void l3t_unlock(struct page_info *page)
>>>  /* Update the L1 entry at pl1e to new value nl1e. */
>>>  static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
>>>                          mfn_t gl1mfn, unsigned int update_flags,
>>> -                        struct vcpu *pt_vcpu, struct domain *pg_dom)
>>> +                        struct vcpu *pt_vcpu, struct domain *pg_dom,
>>> +                        l1_pgentry_t *ol1e_out)
>>>  {
>>>      l1_pgentry_t ol1e = l1e_read(pl1e);
>>>      struct domain *pt_dom = pt_vcpu->domain;
>>> @@ -2254,7 +2255,11 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
>>>          /* Fast path for sufficiently-similar mappings. */
>>>          if ( !l1e_has_changed(ol1e, nl1e, ~FASTPATH_FLAG_WHITELIST) )
>>>          {
>>> -            UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
>>> +            intpte_t old = UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu,
>>> +                                        update_flags);
>>> +            if ( ol1e_out )
>>> +                *ol1e_out = l1e_from_intpte(old);
>>> +
>> Same "intpte_t old = UPDATE_ENTRY(); if ( olNe_out ) ..." code block is now
>> repeated three times in each of mod_l{1,2,3,4}_entry().
>>
>> Alternatively, a single local variable per function, assigned at each call
>> site and copied out once at the end. Does this avoid the duplication?
> This is a bit repetitive, but there's no easy way to merge all 3
> UPDATE_ENTRY() in each function.
>
> Given this:
>
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index a1b7770db0f8..99d4d87e177b 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -2408,7 +2408,6 @@ static int mod_l4_entry(l4_pgentry_t *pl4e,
>  {
>      struct domain *d = vcpu->domain;
>      l4_pgentry_t ol4e;
> -    int rc = 0;
>  
>      if ( unlikely(!is_guest_l4_slot(d, pgentry_ptr_to_slot(pl4e))) )
>      {
> @@ -2421,6 +2420,8 @@ static int mod_l4_entry(l4_pgentry_t *pl4e,
>  
>      if ( l4e_get_flags(nl4e) & _PAGE_PRESENT )
>      {
> +        int rc;
> +
>          if ( unlikely(l4e_get_flags(nl4e) & L4_DISALLOW_MASK) )
>          {
>              gdprintk(XENLOG_WARNING, "Bad L4 flags %x\n",
> @@ -2440,17 +2441,14 @@ static int mod_l4_entry(l4_pgentry_t *pl4e,
>          rc = get_page_from_l4e(nl4e, mfn, d, 0);
>          if ( unlikely(rc < 0) )
>              return rc;
> -        rc = 0;
> -
> -        UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, update_flags);
>      }
>      else if ( pv_l1tf_check_l4e(d, nl4e) )
>          return -ERESTART;
> -    else
> -        UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, update_flags);
> +
> +    UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, update_flags);
>  
>      put_page_from_l4e(ol4e, mfn, PTF_defer);
> -    return rc;
> +    return 0;
>  }
>  #endif /* CONFIG_PV */
>
>
> we can at least turn 3 into 2, which bloat-o-meter says removes an
> alarming amount of code:
>
>     add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-165 (-165)
>     Function                                     old     new   delta
>     mod_l4_entry.cold                             39      31      -8
>     mod_l4_entry                                 917     760    -157
>
>
> That in turn means this patch only doubles up.
>
> I'm pretty certain that the get_page_from_l?e() calls can't return a
> positive number on these paths.  The one case I've found returning a
> positive number is in iommu_legacy_{un,}map() but we don't pass
> IOMMUF_preempt in and only operate on single pages.

In the Gitlab run, I put in ASSERT()s to this effect, and nothing
exploded during real testing.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/3046070649

Anyway, I think an intermediate patch rearranging each of mod_l?_entry()
in the above way will be a good move.

~Andrew

