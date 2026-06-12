Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136F7CD98CE
	for <xen-devel@archiver.kernel.org>; Fri, 12 Jun 2026 07:44:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1336379.1598154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXwZC-0001kK-5u; Fri, 12 Jun 2026 07:44:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336379.1598154; Fri, 12 Jun 2026 07:44:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXwZC-0001kD-1o; Fri, 12 Jun 2026 07:44:38 +0000
Received: by outflank-mailman (input) for mailman id 1336379;
 Fri, 12 Jun 2026 07:44:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wXwZA-0001k7-9o
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 07:44:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXwZ9-009GUr-MX
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 09:44:35 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a2bb8e2-e002-0a2a0a5209dd-0a2a4501c0b6-2
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 09:44:35 +0200
Received: from [40.93.196.48]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a2bb8e1-c1f2-0a2a45010019-285dc430e613-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 09:44:35 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BLAPR03MB5570.namprd03.prod.outlook.com (2603:10b6:208:29d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Fri, 12 Jun
 2026 07:44:32 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0113.014; Fri, 12 Jun 2026
 07:44:32 +0000
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
 b=JA76dbQ79mY/yJA6ycckWAt6saxhb7b9IqTOvi9+321UZG5gG1HUoRqDaEmUFqAisusBw7th+275+RWSV4A7I4cpY51Me6CQ2ycNMlclNaUeCipiPmspyK2oXbXZAwgDWV5sro66+Muxeo9Y1JJwAFUtHKdogBDIeVDlBwm10dff2SZJYRnN3vN9xO7vCVVzw0hH9lBMOySm3Wf5Sedh5ovtDiLA8kycF2pvQH44/FQfT1sjNOG2/wJWonE0pIIJp23jttDAXQnhAEXbA9MChC9pdq6AwqH3KXVYC7zywDsvYKRgdxXw6m0V0aOdyUyP03htkwZMqOApCf7sh3VPAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMHCHFothwqvXToNggJKNvceNejLS4zazL1dXsDL2I4=;
 b=p34Afm+F+cTlR3EXYSKq03u6h/R8EE+RZoFv1JZJ7tZyuHqkfyfMvCfHevceEXwIKWrzJhtXtEzepPMst4Soe+cmzZ+5X+w6ve9HWo6dKqb2um+GvOBdR/E7AkbbCKc8wtQgL84UEGYdwMlomTjiq06NTl+Uv29KgbxUCHf2Ie8CVrQ+cgrSHyII9Xpze/bSHtup/405EhgMwLu4yXLLVpu6eYRB5LKl7qGB/y+xTPRBuH+JLAZPoGkNcVGSC+/8KWp9BqnYl7gkG5p/XjVX/IzJctZNJZN0+QuKba9Y+5JcIGEeWdbjvunojzgNO1pdoOe7/Z+Z8I2gsainhTEhTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cMHCHFothwqvXToNggJKNvceNejLS4zazL1dXsDL2I4=;
 b=emPi52V6pRa/Hx1I78nBgM/Qv46lXXjNfwWlpHKiVjfrv2eKTx5JDI0e/QHlTirbR7ifFvrCEUITN1iLfwVssdlFoO+L2Y7xzN7QqdQv0ZygbBwRkopCW4ZY2cQoqy2CoR8snj9wllJQ4VtPXgI3Vhvw9r/+z+wzFHNPlKmPZzs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 12 Jun 2026 09:44:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.22 v2] xen/x86: Change stub page allocation/free
Message-ID: <aiu42_rcIxZTvbXy@macbook.local>
References: <20260611142154.64525-1-roger.pau@citrix.com>
 <0a2e670e-432b-4297-8166-42a1bace6659@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0a2e670e-432b-4297-8166-42a1bace6659@suse.com>
X-ClientProxiedBy: MR1P264CA0039.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::31) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BLAPR03MB5570:EE_
X-MS-Office365-Filtering-Correlation-Id: 33f184d9-4de5-42c7-6d31-08dec85670c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	veR+LN94D87kO+bVmIVLimZ/2lEC3Ddg8NCx4PHycJAsGw9kaajinSn3SdP6OGb5ZEFID5TbxHRqzg9cROElxmfwZzWQe2jbA4K1wa1ILtrYOxkwdwFOaEIY+9yPb08yww/CUwTeVLz7eWHZKQRVz2OTG6pM+g+KYOjGPN3y6KnDGFDy/r3n3drH5hTmiSpZY6QVmoGzwUSPjowq+iUWtZZwrWHwk2H99bg7KXIzHNkkQI07Nb/6z39n0CXucRTEzlNJvWvwju1+Mypm41+BYjnONSBTld70JNwrqoCDV41AiI1BjG0D+37hAB7EIjY11ck2iYCc39lkHFm3ttpW8u2FqAboImsyt5b20crmk5XZJwZHMbsrv7+eZjU6Ky4TqrXn6BikoDJSNhlSjlpicWhlcX23OWyExmW69f5W6VsQRS61GynK5tr8awWRV4IwDnpt+S4Ktw/5sG6T/VvjW4eD5WV+g5O5FCPoXwI+ilODcmC+QMvAHO4nqLuED0nQx0tdFqcwHhNV3BwNip8CXy9WTBDsCcQv8a7vRKiPKB7G/2BzJLELpnRuzQN9RjXQ/FVh8xYG8i59d1fTfx8WBeKeWUJ0banFgjKdAo3dp/0WhOSPcrUKnGid8ADSS4JZkZ0T3gODsi2D6B089dY9VlNOIU3Zaj8DWgiikg9HJKjhyhI0d7vGis0wN7Yz229H
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGVDRHJWR3F2cjVjZEcwQW1KQWxHSHMxMU9IOHMzTnRJVm8ycVRrUHpkbUdj?=
 =?utf-8?B?aXhtV2NnRUpGSmRHTXRyVzRjUG1iMmlSZTRzNDB5Nk5xQ1BzUGlGUkM4ZzRs?=
 =?utf-8?B?amhweGp5bmx1bHZmRXppL2lvbHJyUWVuSzE2N29jVUtEenM3WGlRNUV5VUFx?=
 =?utf-8?B?UnU0VW1qbFdUeERyVmlRL29hZHd4VjE5UjgreWJURVE0cFNsZXlNdEh2NGh6?=
 =?utf-8?B?cEUrSHRFUng4aEhQZVB2M2RMRHJ5eUYzc3kvR2Q5Zmkxc0tSdGdCRlp5c1VL?=
 =?utf-8?B?S05Ea2xONENxbW5EbTZyZkZoN1d3SWp0akEvWWtjK3VSWVJqZFE3WmJRNmFE?=
 =?utf-8?B?VGZnZmZmeFBqaHhOUHJqMHQwVTZ0Q1BnRkRJYXpDbnZ3TXVJZXhreWNJZGNv?=
 =?utf-8?B?ZG81ckhBcXBONTcrK3BKRngxQ0xlc0NYdW9kMTNwSlVwZUNzYXA4cGZOZmV1?=
 =?utf-8?B?WTVicVV1MHdIbk1vSkJHYUhNWVN4T281YmorcWE0R1p2NUZaOWFyZVQxVkdC?=
 =?utf-8?B?SEZsTzUxWklOK0RtTXVIRDZQNVF4cWFrNk1xU0t0WDRBWTZTb3FVMXhQVlJl?=
 =?utf-8?B?ZXFleTEyWDZqdSsvQnBobUpSbmJ1eXRMZFczVUEzQXZQZ2U1N3pkUmswWkwy?=
 =?utf-8?B?TmFPT2dYVWtPMGVvUFVRQU15WTRrb2RjSHJrU0JUZml4VE82YmlKeDlaZDVX?=
 =?utf-8?B?THFLN2ZBWXFHY1dOcXFyVld1ZkZpMzlqclFSUG1saklmL0ZtTWlRREdIc3h6?=
 =?utf-8?B?NFJYS3N0N2ErcTQxTGFpWG56TlpsZVJiZ0lkZHpFZHcwRndhRXRIeXBqQmhB?=
 =?utf-8?B?VnAzSVBPcXFZelh0RHBKNGFrYXNCVEx1VEpQT3B1QVBSdENLQ0hJeENKdE42?=
 =?utf-8?B?RFpsTzRNcTBpMTFUczlWZEJJNGh6RmxSMmxMSzM2a3IxN2I4VUozT25JVnNk?=
 =?utf-8?B?L2VoTnd6WEVPM2FkYmJjQ0dzcjlwVTNEaUJlbWpScXdVMlo2TjBnRGxoU0Fx?=
 =?utf-8?B?UDZxcVBhQmtKdXhQVXIwcmtmZ3ltaWY0VG9aZXg4YmVRTjlFVC94STlKaWJ2?=
 =?utf-8?B?aGtqWCtuWkUxejBFd2VQV0V0Ym1uYzN6c3dGaDl6dllNSEFSTFZoTC9oOXJK?=
 =?utf-8?B?THlwNURMYUVrU0tUVk1YWWQ3blNGbllhd003UXBUU2RNcmtNejNEOUh2cjll?=
 =?utf-8?B?Z3RLaHRwZzFFZmJ1Ui93cG9mY00zWGVaRXducnpJN0Q2RFhPNUpaK2U4ekRZ?=
 =?utf-8?B?a1ZzMFBKMWJ4VTYvcmdVQlVnOFlmL2dwYUNrS3BlOG82RmlMZFUzeUlIY2tp?=
 =?utf-8?B?YUdEeUtUaGRIWjZYcmJiWTMzWTRlUk4wUUVnOEkydWRXNHNUWlJROHFuR2tI?=
 =?utf-8?B?RlJQeTc2S1pRbmRObGNZOU1jTVpXS2o2OUlBS0thWEUvUVIxQWZ3bUkyU0N3?=
 =?utf-8?B?Y3hoUmQwVGozOU1GRWdjaXR1b2xUL3M3NUdWaUpwK0tSL2tDbE1FODBXWjVT?=
 =?utf-8?B?YmsyaEFzV0lmall0WkpzVnYxczA3WDI2T0NuRVEwUkJFdGZ4YkxhKzhkZzNW?=
 =?utf-8?B?UnFLZnlZVHBkOWhiaGg1Q3NHeE5GU2VqanI0bko1Z1hvS3NqQi8yNXlQQ3Ar?=
 =?utf-8?B?eDNMaGFoV3VjUU5mSHF2c01xM3EvR045V29mUzI0clpxOU5KckxuUGxTblRC?=
 =?utf-8?B?RHl0Y01FdzVCWEhqU24zWS9rSE05VzBVc1liWkJMSk5SMlFHL1ZOZEhmTVFP?=
 =?utf-8?B?bVlQVlhWTmdsd0M2cTRBMmJYSHVUcU9BaVBrZTN1ZldDN09aQ1g3Nng4U0Zt?=
 =?utf-8?B?SlIxSTJLN1NhMDE5eVNzWTkxRUFTK3JXOXZMakJhdTlOYUduUXltSEMrSEZj?=
 =?utf-8?B?UVhaLzFJc0dLOXg3U3NKZmpjcEJyWFZNbTVxd0FkRlNsTGRzczI2bldjWStD?=
 =?utf-8?B?bHFFNjQzMmNmdmJZaTl3K3M3MTlwcFZhZkNKdlNQaW05OFFWWXlsZnJUVXhU?=
 =?utf-8?B?YjdIWVZ1L3htbUcxajcrMVlaMmtJY2NZMDN4azRFS0FxR1NZM0p3UWxwMno1?=
 =?utf-8?B?SWRad0VuaGtnYkMyVWZBa3dtL25wV2NvV1FJZzdOazVDTjVoK1k3K2pkbGFM?=
 =?utf-8?B?d0d6MFJvc2kzOVBrQlJHL0YwZXhNVUJlOXBCeVJkazdrbzlmUE4rQmpOK0VT?=
 =?utf-8?B?SS96TTFTQVQvWGloZDhyVDBZMmhIU2JGV0p2b2ZqeERMZGNjNFBndGNHSWNP?=
 =?utf-8?B?Z0JVUDl4dVZZOXIxNlh4eU1tQnArZTJRZ1dNTlg3Mm5wUnIrRWxVSTV0eURh?=
 =?utf-8?B?YVRmZE9NMFJNTUxvUk5ndmFlT1BUWFpoYmRmdi93TW1nZ0NnbE8yUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f184d9-4de5-42c7-6d31-08dec85670c6
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 07:44:32.0696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HZUl8FqN9LLQRrxQep/4oiExQZiF+Gv1gf3diThnkZLZKEv1Iya0xkS4GcJmvFjahjobAPjTLl35XrUp9P6zug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5570
X-purgate-ID: tlsNG-d62444/1781250275-ADB46FF4-F24469B3/0/0
X-purgate-type: clean
X-purgate-size: 1915

On Fri, Jun 12, 2026 at 09:40:03AM +0200, Jan Beulich wrote:
> On 11.06.2026 16:21, Roger Pau Monne wrote:
> > @@ -641,41 +642,62 @@ static int do_boot_cpu(int apicid, int cpu)
> >      return rc;
> >  }
> >  
> > -#define STUB_BUF_CPU_OFFS(cpu) (((cpu) & (STUBS_PER_PAGE - 1)) * STUB_BUF_SIZE)
> > +/* Dynamically allocated, indexed by CPU.  Store physical address of stubs. */
> > +static paddr_t *__ro_after_init stubs;
> >  
> > -unsigned long alloc_stub_page(unsigned int cpu, unsigned long *mfn)
> > +static bool assign_stub_page(unsigned int cpu)
> >  {
> >      unsigned long stub_va;
> > -    struct page_info *pg;
> > +    paddr_t addr = stubs[cpu];
> >  
> > -    BUILD_BUG_ON(STUBS_PER_PAGE & (STUBS_PER_PAGE - 1));
> > -
> > -    if ( *mfn )
> > -        pg = mfn_to_page(_mfn(*mfn));
> > -    else
> > +    if ( addr == INVALID_PADDR )
> >      {
> > -        nodeid_t node = cpu_to_node(cpu);
> > -        unsigned int memflags = node != NUMA_NO_NODE ? MEMF_node(node) : 0;
> > +        nodeid_t nid = cpu_to_node(cpu);
> >  
> > -        pg = alloc_domheap_page(NULL, memflags);
> > -        if ( !pg )
> > -            return 0;
> > +        /*
> > +         * Attempt to use the same page as the previous CPU if possible,
> > +         * otherwise allocate a new one.
> > +         */
> > +        if ( cpu && nid == cpu_to_node(cpu - 1) &&
> > +             PAGE_OFFSET(stubs[cpu - 1] + STUB_BUF_SIZE) )
> > +            addr = stubs[cpu - 1] + STUB_BUF_SIZE;
> 
> Isn't this path also going to be taken if stubs[cpu - 1] is still INVALID_PADDR?
> That may be a purely hypothetical case right now, but imo would better be
> covered right away.

Yes, indeed I was assuming that stubs[cpu - 1] would always be
populated, which it's the case currently, but you are right that it's
trivial to also take this scenario into account here.

Thanks, Roger.

