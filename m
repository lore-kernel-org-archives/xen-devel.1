Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6627C79F99
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 17:11:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412305.1642835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3zLK-0004ba-Uu; Tue, 08 Sep 2026 17:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412305.1642835; Tue, 08 Sep 2026 17:10:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3zLK-0004bT-RN; Tue, 08 Sep 2026 17:10:46 +0000
Received: by outflank-mailman (input) for mailman id 1412305;
 Tue, 08 Sep 2026 17:10:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x3zLJ-0004bN-Px
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 17:10:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3zLJ-00CWeZ-5K
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 19:10:45 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa04178-bab6-0a2a0a5309dd-0a2a450b977a-22
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 19:10:45 +0200
Received: from [40.93.194.30]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa04193-b7e8-0a2a450b0019-285dc21e5a1b-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 19:10:44 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA3PR03MB7236.namprd03.prod.outlook.com (2603:10b6:806:2f8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 8 Sep
 2026 17:10:39 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 17:10:29 +0000
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
 b=AxT3Wl+0zhV8K/yQcQOaUQKI/Nnpdy8uRq9GZZWwz8tkM1MYOmvLW5AWHbH4WpM8HxIWoLefIuVvq6cckA86rceMZHmnpqMeelghZhBcT8rikXybIRt4t6i1+dgJHStYeAveiVxrzZm5dW762ETcQ6w2Q/hzVe6PFtGce5DL0zyQmfVyKvanwp/BeyyOAh53uMzJDHc64gAKiL+R9TRAqfqtu7bP7qgA2zkLl83HqgbR7g2PHhxDlCaFpktPqv8NQfXJOQnLI6RqXBLUYEzK7p/7mfCerEWASkKkz6XDCgBylLjPuIOMRT8UBhirfcta9vh2wH/ICSpC+9hjIeR1+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cr7WMKYcq5gf4TpySz35NF7OfL/SUKkozW4TLNv3w+U=;
 b=jGtBZKNYL+XYDlN+99mTFzm+ELjK/tj6Ap7ynJSYUUGIyTWLi7T5J5HwkUw7cgzY7fB9CHHwrpRUiIDWn55QbHGNVMA1V4VLwYs9UipRCCLXWkPel4x4Uv8vWO5lm1mMLwsPtIajys5Tdlt18UY8/ktmZMHOYUWKkTFS2sHGNCVINrvcgdyq22ybLKuiYoJdQ6Bi+rgCq8GIH0Q5WAJfGd+wGT8MEu+HrMF6J07Dm9cxz0qpYZtZ9+fUwqLz867QOddLsz/vHvI9/RqH+QcMbkWiMlp9Ds5je9I1bJQjHhRYmxrRXuXRJqteTtSKJFV9lbgrgv0QnZulnXTgzhd4tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cr7WMKYcq5gf4TpySz35NF7OfL/SUKkozW4TLNv3w+U=;
 b=WwXYtqhh+O1WNlmNbgv60P6MOERv0OHTinPaz2Z+GIO78r/sDW5VnR3C4EIXlb20i4NbvNzGfgD/ZxLJ9p6NOE8wJODxALPt7qPgm6QZIGktTnFBDjfLF+fqiH+M+h52/LqR2VUqIu7pte4+yw4jYXYMLAfEYO5veOXyZlyQOv0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0ad272a0-8afa-40fd-a7cd-fc953e1b992f@citrix.com>
Date: Tue, 8 Sep 2026 18:10:26 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] x86/ucode: Work around Granite Rapids erraturm GNR98
To: Jan Beulich <jbeulich@suse.com>
References: <20260907213231.3159241-1-andrew.cooper3@citrix.com>
 <a11ec239-460b-4509-beee-4f65063ef336@suse.com>
 <6a54806f-061b-4b76-b42d-6fa5b54581e4@citrix.com>
 <70dd9e38-bc54-4532-b310-cb9fb3d3f2ce@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <70dd9e38-bc54-4532-b310-cb9fb3d3f2ce@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0366.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA3PR03MB7236:EE_
X-MS-Office365-Filtering-Correlation-Id: 27dff21c-a92c-4795-3dd4-08df0dcc15af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|6133799003|10067099003|4143699003|22082099003|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	yYuMk08sIx7idsw+yPpC/5CNNVuEvu1oHu/4HofAA3Egbhyg7FZJx32idOhXXiaySBYIYMjjNGqxyHShlzrgUxHB6IpDjKOwSf9BiJaoEpy9+KIWhe+62qSbnVFFeS/ShWL5puN6fZdUpIPzaTL8qCH7bz3eG64leUBZ7vrSrd0w2SCC7G5WAejJJs1KLE/DP/ksr1XLEf9pwBJ8s99aKSWcc+L4c3GP8k9xKtW6uvsbLc06WAOzkOBWNusEvOdOrJ0mJ7QW7s0VNOxEK90Z0D9yA4kaKCPN/RiRet8UP/gZ38kgidlE/TEsyce1GyTbzf/xJXU8clveKx1wSxisHQbuNlI8yA9IOQUWFEh9bFeAhwqULbOnY++8cnmxVzyjR3RfBOrKB1uxWcQPvPpHCY++BL27v7HuiSc4PNYYCBO6baBwf+aViZkR36Vp1eJHMUBtHt8pMMFA5fbl2p5/vthde1xZjhWzSKppWukDaWIfBoGBZZBGcYYMiuXfAX6j08g38waTZY0AJys59rIQDUuFW4ztUBjkxu4XWCHaR7/lbZ0hEofN3glO8fjO+glAoe+EJyGFWpUgds9JecbeSKCh01yBpp4OZ3Pl62l1rhnyAiC4Vzch3fL2v5XeVuJD85T4nsBIhM3A5yIdESVY5RgBkDWy7IWITD2C7DtT6tQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(10067099003)(4143699003)(22082099003)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEV4MmVQc2ZjQXRtRjJLMnZ4VFgvMVV6a2Qwc2FLWlBXNDhxUllKWlhVdWVH?=
 =?utf-8?B?R2dYeVRaRWVPZ2tNUlpLUG9rN3RscURnMjkzSEtjd2dPUXFsZUJJRExOZEFt?=
 =?utf-8?B?aTJxRmxJT0tHY1g2VkNZQWRvbStiaWNnUldCbHZRSUxQQVljVk9FTGYwNzNY?=
 =?utf-8?B?ZUtYWjF0MVBPVlIyMlV3OHJBekdyVGRMcUhEajVKVXJoTnVHNXRGMWxETVpn?=
 =?utf-8?B?NlBsek9QMHZtWkVMU1huK3N6SDd5bG5tSmZvZ0dPeDhUZlNsSlcvY2JKZkQ4?=
 =?utf-8?B?dXpvSDRReWlteWk1NXFJemJLVldrWUs5dWJTeEsvaXk3N3JnQlRjcW1jcUpE?=
 =?utf-8?B?dm9XL3pLLzE2V2F1RDNhT1U0aGJpMmhqdnI3U0o4bnFpeVYvQUM2SHZjSmpw?=
 =?utf-8?B?blBQTXgvVVp6Y2lrUWRmQU9tSnQ5bjlCQW9zODFBOU9oUjVZSXdLMll6U2ho?=
 =?utf-8?B?cFJ3ZXpHRGJxQjRaVm1ZSEwwWHBiMjIyak5jREU4eXBRbmZBZlh6TThxY1cv?=
 =?utf-8?B?YXQyZzB6eTlGK0h1NTZoeUc0akI2dklIdDU3d21kb3ZsaFhDUU5uV0JUc0dK?=
 =?utf-8?B?eklTUzZwTEpHbnFQZ0JGMDI3eUdReE83Nm82MXpxOThmZXo4Y0h0Q3BGSnF1?=
 =?utf-8?B?bzVpMnNEQVlmbGoweVQwRGw2N2wyaUE4RzQ3NnQxNldJYUJNTU40bVcyVnF2?=
 =?utf-8?B?Q2JyYXQzZ21VeXZjNzBmeS9SRTVNOHBMazdEY2FQdFEyY0JBRGtiZVJvSkRx?=
 =?utf-8?B?VWdoL05vekFyazJRSkdRNGt6bkkvUHJOV3dqaTdPV3R5MDFuTTBaSG9TVk9K?=
 =?utf-8?B?SnFrZ2JteFkyMytQMm9hRE84NU9oMXA3QXJuSkl0RVh4RFowTEk2L0ZhR0J0?=
 =?utf-8?B?Tjlja2l4TVZTY0s1bC81UWhvYjVXZ3FoOGVYMy9rT2U3TGpsTVdvQXRvb1BG?=
 =?utf-8?B?WkpMZjRFS2NjK2ZrQzRxTHBIWEgycndiYXMvemtoYUlmTnFjbHhhZGlOUjdO?=
 =?utf-8?B?aEpkL2txUmoxcCsxeXdBVkRCMVJHWkZROEtQWmNUZnpzM0ZxT0MwRkdDWG5E?=
 =?utf-8?B?cmJ6c3hCelh1ZjRLUjZMNzdjNHdTK0ZINWNCU2R4WUlyMHlJT0hDVGhDV1Yv?=
 =?utf-8?B?djVRbU56T2ZyWmQzVmhIQ1JsMDdRQWhleVI3U1ludk5odDkydkhjRDJkV0JV?=
 =?utf-8?B?VHBRTVhWZmwvU2l1amo4aUJTWVArczNHcGYra3F1aVhEZ252c3dxRVdkVHU5?=
 =?utf-8?B?bE5BZWU3TkRLdzhNYVNxYXFSekpEdG5RQVM5bDJRMzJ0NWFTbXAvUGljYVUw?=
 =?utf-8?B?V3ZWMmMxd1d1OU54Z3dwTzMyYW5HdG1rTm5tcEZKQ1VlMCsreFArSjdJWDJQ?=
 =?utf-8?B?Qko0UG9CbER5WmUwTDhOOTdUOTVBd0wvbFNxaW96M3RySWdLZTd4VTFFd2NS?=
 =?utf-8?B?NVlJYUNIL0hLbmY3c2x2VUR6N0F1cWRCYmVEWktZV1g4QktXV1ZFM3d6TmRL?=
 =?utf-8?B?c1U0RHRFU2F6OWdhM3BTd3NYMElaZ2Z1K0RJaSs3WGZDQ0wwTjFyc09aNExX?=
 =?utf-8?B?bkYvUlB0OW5FdUF3Q3J4N3lmdGQzUmE0MHVabzJJRnIybWhkcjd1Q1N0UFdt?=
 =?utf-8?B?dGxObkdlVGJxeUVGMFd6a0FlTStwSVl4TzFvbHJmMHdacUo0bmVvaldnMHAx?=
 =?utf-8?B?cXFBMFRtSW8rUXF3MUY3UUpWT0xneVdMRzlVVFF3TDljVTAzdmdkU01MYzFJ?=
 =?utf-8?B?YzJ2NjBxcFdpbzNOT3NzenB3SXJsREpyQUgzMGN6bTliUGhOc0llSUdueGJi?=
 =?utf-8?B?UFRoelZ6UjNSRWhhQTRNVEdzTTAyenJtcXBwRUtCUG5HVU9UNWVUdFRMV0tj?=
 =?utf-8?B?REc1eHlXek9tQkNkV3NVZTRVV1hiVlVEWWF3T3pSUEpHeThYd2ExWkFObXpR?=
 =?utf-8?B?YlhWdlVvZUlabGdBMng2MFd6T0ZmRWpaWTZjaUYxbGFUU1BFU29WdmRZVHpm?=
 =?utf-8?B?eFFLUTU0QzQ4VVQ3R1hEbXo0TlVMWEZvM043UXpTRDZIeEUxeHZQU2loc3Yy?=
 =?utf-8?B?LzF5TGNsNFVkWE9LMGt5Ynpsa0tJYTF2Z2k4cTY4bTVWeTl4U1ZMSU5uYk9C?=
 =?utf-8?B?amtsbE9ydFF3RzZtWHRaV21obncwSWZ3aVNzUzFrcXFZeFQvVnB1NzE1TGo3?=
 =?utf-8?B?L1FCRnRrY0diR0J0MndxeGMzS2xkejQveWE1ZjZpYzRITG9EYjBHQmRkYlNG?=
 =?utf-8?B?dUFKVTJVc0ZhTlBuL2VKUzBJd2R3QmRxR1ZjdnhWRVJlaTM4V3dIdkovSlRa?=
 =?utf-8?B?YWtQR3A2ZEhUNy92Y2J6T1czLys4YzY2UmNDQUdKWHlsSU5oMUVuUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27dff21c-a92c-4795-3dd4-08df0dcc15af
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 17:10:29.9033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ivE/+x1TNmJM/7skmcTxoYkrTOGBWEA5jaQf2gqs7A/cyGArAjExaduBqr4AKwVnuXx50qnjAcNswt+MwBRa5U5GA9IL7hNn26Zi+mG0cpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7236
X-purgate-ID: tlsNG-42698a/1788887445-18ECE9EA-981B688A/0/0
X-purgate-type: clean
X-purgate-size: 3240

On 08/09/2026 11:55 am, Jan Beulich wrote:
> On 08.09.2026 12:08, Andrew Cooper wrote:
>> On 08/09/2026 7:26 am, Jan Beulich wrote:
>>> On 07.09.2026 23:32, Andrew Cooper wrote:
>>>> @@ -273,6 +274,44 @@ static bool microcode_fits_cpu(const struct microcode_patch *mc)
>>>>      return false;
>>>>  }
>>>>  
>>>> +static bool microcode_safe_to_load(const struct microcode_patch *mc)
>>>> +{
>>>> +    struct cpu_signature *cpu_sig = &this_cpu(cpu_sig);
>>>> +
>>>> +    /*
>>>> +     * Treat pre-production as always safe - anyone using pre-production
>>>> +     * microcode knows what they are doing, and can keep any resulting pieces.
>>>> +     */
>>>> +    if ( (int)cpu_sig->rev < 0 || mc->rev < 0 )
>>>> +        return true;
>>>> +
>>>> +    /*
>>>> +     * GNR98 states that Granite Rapids systems hang when loading new ucode on
>>>> +     * sufficiently old firmware.  GNR101 retroactively declares that one
>>>> +     * ucode had incorrect min_rev fields, in light of discovering GNR98.
>>> We still have no min_rev field, so imo a reference to it wants some
>>> clarification.
>> No, I don't think so.  The fact Xen has no min_rev field (yet) has no
>> baring on the wording of GNR101.
> The wording there is "Minimum Runtime Microcode Update Revision". As long
> as we don't have a field of the name, how can such a comment be unambiguous?

Fine, I'll say "minimum revision field", but the whole name is (and
always has been) silly.

>
>>>> +     * Both are incomplete statements of the problem.
>>>> +     *
>>>> +     * At the time of writing (August 2026), the believed safe sequence is:
>>>> +     *   0x01000370 -> [0x01000380...0x010003f3] -> 0x01000405 -> any later
>>>> +     *
>>>> +     * Disallow known-unsafe loads while permitting believed-safe loads.  For
>>>> +     * GNR, this allows multi-hop loading to get up to the latest.
>>>> +     */
>>>> +    if ( boot_cpu_data.vfm == INTEL_GRANITERAPIDS_X &&
>>>> +         boot_cpu_data.stepping == 1 && (cpu_sig->pf & 0x95) &&
>>>> +         ((cpu_sig->rev < 0x01000380 && mc->rev >= 0x01000405) ||
>>> This is odd: The lhs of && uses the lower bound of the inner permitted
>>> range, while the rhs of the && doesn't use the upper one. If it's intended
>>> that way, I think this also needs clarifying in the comment. Otherwise imo
>>> lhs and rhs better would be consistent in this regard.
>> It is intentional.  Furthermore, it is the only coherent way of
>> expressing the sequence as given.
>>
>> I'm not writing a comment explaining why it's a good idea to use the
>> same boundary numerals between the comment and the code.  It goes
>> without saying.
> But that's the problem - code and comment are not (obviously) in sync.
>
>> I'm also not interested about pureness concerns about inner vs outer
>> bounds.  I can't see a change here that won't make it worse.
> So why are
>
>          ((cpu_sig->rev <= 0x01000370 && mc->rev >= 0x01000405) ||
>
> and
>
>          ((cpu_sig->rev < 0x01000380 && mc->rev > 0x010003f3) ||
>
> both worse?

Because they are both buggy.  They fail to exclude some unsafe cases.

If it's not obvious, I do know more than I can say publicly.

~Andrew

