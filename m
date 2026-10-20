Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49540606A319
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 08:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=om3HmZhc
Received: from list by lists.xenproject.org with outflank-mailman.1455140.1668671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ5HC-0003fQ-8b; Tue, 20 Oct 2026 08:32:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455140.1668671; Tue, 20 Oct 2026 08:32:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ5HC-0003fI-3v; Tue, 20 Oct 2026 08:32:54 +0000
Received: by outflank-mailman (input) for mailman id 1455140;
 Tue, 20 Oct 2026 08:32:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xJ5HA-0003fC-SK
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 08:32:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJ5H8-003rM6-M8
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 10:32:50 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ad72729-8faa-0a2a0a5109dd-0a2a450cc3a2-34
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 10:32:50 +0200
Received: from [40.93.195.33]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ad7272f-f479-0a2a450c0019-285dc3217fe8-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 10:32:50 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DSVPR03MB989314.namprd03.prod.outlook.com (2603:10b6:8:3a7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 08:31:21 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 08:31:20 +0000
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
 b=Vn0c7uAicumKSzuWarzvJYwG1AoG9VkoTJ6V0BPkCnvZKp3QT6LPW38PG4DBrihKDnutP8GrYHpTymUKWOWmoE0gz2Rx7RvO4QuPjdgaLBnq81ptM0kXJ9LJpz3S2xV7ZtVFdKwyTWi1u7mBO2L3DGmyziOjjfowAt2WEBYRiPEs4PcHo05rcSsdVwcIvU2x6SKVGvLgYVyoMIRvEu7ohaVsTYJMVCoWYyySTNL3043JywcpkQbNoO12qQnjtmMYp8xGDoyR9fpTqmcEWJVLGQizH7Lwwr3wUdco+k1dG0EMeYixEJ6xLAOA8i7tFpTB79RKC2hR6U/o8lQJtpGkvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aUBo1AHET9eUpwSf4h3YPkc6MwIuaQ2Ke9X8zFvEwVY=;
 b=u/SOdSBHTfNxkzUYeTQLES1/3gdse5M6IXy1AfbnaSRP1BmvNc6JVXmO0T7eVeQcn7o1PLJDS/WW1WSFS37vfNRta2bCYycT6vxPhUkEs4OchWFJATRp0Kb4PmJbPnjiJ05OjpzYeH6NdKi6r5vC2y4OFzzWXkHhVZx6yPBHU54rjmI2cuCkP0B4iOIY3q3QtFUmbMU8duJaEPMfQelFa8nRfV1aXMs8rOtP1rfkv/KfsFs3tgusBHuOu9H9YzFj9ovn6YR7y6mk4lgLWf9RqMqgGcdI0+rLdaeashpipFQ8r3TKMtZabf83rPNWcg+1GY5Fho0NyUZCGP8PePw4+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aUBo1AHET9eUpwSf4h3YPkc6MwIuaQ2Ke9X8zFvEwVY=;
 b=om3HmZhchu4WQwN6KRbIXRh/tT9geE37WH39Cj4YJkUpsFkJJbSlWd/pjmzf4LjzRSAd4b0UacTcmsPfQgSImOtq39ojA4WzTW58GISaFwhlj3QSdd+ny175MScwj9lumGe4VO2dxtusX56GnkTbfUyubxTAOxEaXt5dQTeBOao=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5916f3aa-a008-4233-a562-d091eeb9dc7c@citrix.com>
Date: Tue, 20 Oct 2026 09:31:17 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/shstk: Fix possible crash while enabling Shadow
 Stacks
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
References: <20261019155959.883789-1-andrew.cooper3@citrix.com>
 <atZoSz16waAvDlPw@Mac.lan>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <atZoSz16waAvDlPw@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0514.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::21) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DSVPR03MB989314:EE_
X-MS-Office365-Filtering-Correlation-Id: 923e433a-0eed-4083-3234-08df2e8484ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10067099003|56012099006|3023799007|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	V+TwDBu/xGE2FN9qsau2BzlyLLnEgOaLqAtICtuEUOTUqqgqPL2lBWv2opVfCy9LNMJPvxqtTlprxv6rYoehlUph/C8xKkVtNrU6dNrYhuupIUTt/+jxwTCFlblgjMyueI6D/c77OaohTRBvqG6/TheRabVcWb8Dn/NrdLJwQdyjE2zkKZ3LUq+doo+ViSs1fGuAFznSjZc98ixc9tAEGW3xpQBLEXlvyaDHAexSIyesjrGo4u6cwLLmCLz0kfjUWr5WHGoS/FiIWlId+k5i2xrf31OJQX94rNzaGX7tsN4QgGvCTSPtJejlHlXAP8hNlhQvvqY9Rj8yPy7skhBW8ADwYciP+9GBWplurYYGE2QoR55bj7uEn/9QdM2F3dIt/jWwf6ARGlONERXv20QBvTwPbH1IqBvRY63Y1fCyKzsuXKNFBINKk27OWOtldTjrcQS30cdchBgvj0SYYpMyjcaXyQLmzfzinGuzpeXkeHgcg52LHeBIcnkEuZwQERn3nB8RwrCpoCgYBHc+5m7LjqrEGKv/vJGZPL+zDdkkHihuOF672nGz41Tdqb2Lu030SvnyGUwKU/21bXmufI5Rj4fqAgy2oGHKPITJB3y8tvgpvt2MHUHKPRJIWM7fQqa7dceGSUz133nu35riAJwLgrmg8aFbLdh5k4+AU7uIaZg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(56012099006)(3023799007)(22082099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmE2ckdTeWJ2b1R5Nk5JR2Y1WVZpTytNTUdSS1FMYmlvakVxYkJSdjVnY0M2?=
 =?utf-8?B?QkdCMUJaV2pzZTU2UjVkUmhlV0FCZGZYREx5TXdKd25OMEswanQxc3RnTmRG?=
 =?utf-8?B?MEhDRXp0SUxFeWxKZ3NCVENham9jclNtS0NxbHhNaUZzbHBTZ2tzdmd6YU1N?=
 =?utf-8?B?ZVVvZ0hGOXI4RTRsQitFdVBEZ1NsTDRidnV1WVFtTFpQNW1CK0Z5WUU0TGZ6?=
 =?utf-8?B?M2RUKzFIeWpSK2laR1FGVkhhNDRuOVVYYkNBcDQ2N0pETHgzWjlBRU5CbHlZ?=
 =?utf-8?B?b0IzaU1Vb0xDMkRNK1hOMnU1dzBDNEMycVdvemU0SnY1N2xVMFFxVDBoWEdj?=
 =?utf-8?B?amxYdDhrS09idnlKUTNjRzFnNGZYd01JSEtpVGgvSnZDd1hrcWZoZzBWSXZo?=
 =?utf-8?B?N3dmMk1sdHlxMTNrd0RldlBMVHp5bzFtcC9hemIrODBRYnVndkZ3ZFZ3TC9z?=
 =?utf-8?B?SEJwWndCd3FWSytBRkhYa3NQYTU5WVIzWkI3RHlsdE9rVGVtWEFRY0x4R0pR?=
 =?utf-8?B?UWZEdldWWlNEVzcxMituTGdTeFZxWmREM3ZSR3lFSFl1bnl5em5RcVNsTFo1?=
 =?utf-8?B?Z1ZjdHJBWTdZUGxUcWtXMTJ0VVFLUUdwenZPWnlQejdtYVIvWDJTNWF6N09k?=
 =?utf-8?B?NVJXY0JCTGNPTXE0dnRMU3B5bk1HRjNPYU5ORTluNzd4am0xTVVMWXNxMnJl?=
 =?utf-8?B?QXZvWDQ5bUI0MTQwTnlSWjhuZXpNM2s3YjMwM1JWOVNTb2t0bjBEZzNxQ0Zs?=
 =?utf-8?B?Z0l5SG1oVmswakZ2TUY2OTNSNTNNd2tnYkUvcnJ1V1ZVeVZ5SDVPOHZEWlRv?=
 =?utf-8?B?SlRUNzJrQlNXT01vY2RkNERobTl6TUVKSFk1aFJSQ2laWWl2QzRDaEFvNmtP?=
 =?utf-8?B?c2hZa0xGWGFVa2k2anhaZ2VwRm1MN3pXSWJoTmNrWXc2M0p4SXZrQk83Rkx0?=
 =?utf-8?B?ZXRybGE1VkJrTW1kalJPVWlIdHhldk5FYjUrbVlhallEYVRadmJsZFcrVFU0?=
 =?utf-8?B?N1I0Sk9UR0dRbWwxQTVUK3JnTE9UcDlFOVQ5VjZ4N09jSHRzM1pUMEtRWkVp?=
 =?utf-8?B?MXh4YmphL0FlOHM5eWpGOXM4encraDhwYk41b2pDOGYvZ1IzY2ZUMUNxUk1C?=
 =?utf-8?B?VTZ5dnNLd2JrN3Eya2VxWnV3a0JUMk1zTkNucUlQenJtcmFBUWEvTlVSMHhI?=
 =?utf-8?B?TWpycE5qeWtsMzlVRW5Sa1ZxWFp6dTlwOUtnRWxsclhkdWEzOUxPTVo1dUtE?=
 =?utf-8?B?TDV5d0xvQ0VMRER4cGVaOTRxeDdYbU1mMU94eXYrMVdaSGMxcmZQSFhOMlJW?=
 =?utf-8?B?QjFNcHBLbWQ2d3IrRXlmSDV4eEpqZFJCYmVZZ0l0bDNXbjBUYS9zOEM0cGNo?=
 =?utf-8?B?d0pvZFJpSVVkU0V2NG4zQ1hyd0NNSkE2cENMRE1kdiszWEZrajhmTUNQLzk5?=
 =?utf-8?B?VFFPM3orN0pqMklobVA5NWpYRlMyTStsNXF0aVEyMjcyR1VHeHd2cGxXejI1?=
 =?utf-8?B?SUtuMUdLNVNSYXQ1bTRxR1VUdEw5NmFzaUgvTXMzSnlBdFUwUGt0SDVqSHV4?=
 =?utf-8?B?dVI0cmtjcTY2K2NPbjZVRmxETEN6aEVLb1dlalFDSEE2d0NnRnpLdlRqY0tz?=
 =?utf-8?B?OFJNS0EwZFRDSElYaEN4UStiT2JQM01pL0hYZml6a05oelBPTVNpVDd0eFJU?=
 =?utf-8?B?cXZYdHJwMVVUekJBSTBBZU5mL3ZFd1NDczVHZjNKQnhTanNOdU9SZ3NOc2Qz?=
 =?utf-8?B?L0cyYmhpWnpxMFR5QWFqRmVuRkVZYU5RcWxKWVRRbmU3dUwzdVVKelp5WE1N?=
 =?utf-8?B?YmczQ0ZwdEFPWlR5OE42UU02ZlZuQzhtdEJtaXBnWEhDeWYrdjZRUTh4WWRy?=
 =?utf-8?B?Vk95MnhiSW43TXptc1JSUFFWUkMxK01iQ2RMY1YrNVVISWQ0cXU4VGwvRjU1?=
 =?utf-8?B?TDg0QjFSaDl6NEsrdWlNK0YxYkpMZUtCdVY2UE5xV1NVcEd0U0doSkJJWEQ0?=
 =?utf-8?B?N3h0a2k0eDMwYTNoeHFVclpTMlNkUEFwdGozSUNtUFdZSFZBWFRNME9OdTZv?=
 =?utf-8?B?WE80SlBWZnkydkpBNmdsc0JaY0pFRC9ZNGE5SDlQdmVvOWNLYmN4MmNJRXhD?=
 =?utf-8?B?QmdhZ2dQbzRNVmpxcHh4aFBtd1RJZlA5QTJha1IrU1JGNmE1NlFOQmgvSVh6?=
 =?utf-8?B?UU1RZHBVUW5hYU9GWlVJRFZnZWJkM1EyeThJRlFPYmNjUEVHV0k1ZDRMQUZn?=
 =?utf-8?B?TmMxRm5hdnpBbnZIck9TcTR4dDZBMm9kczE3aFg2NFdpMHRyZDR4K2N3U0tE?=
 =?utf-8?B?b0VhT2VkcHRkNytWM21OczRqSUtXR3cwZDBSRVNHUUlGTkRhZ2FYdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 923e433a-0eed-4083-3234-08df2e8484ac
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 08:31:20.8261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7PtxWnKnG9UXuqHHX5/KMYHfiDXJxJbeKee5J1gBRGxojnHMfwzlGrjy/yl83YJvJdFlBd879uCik0YSOwBYvbsVwMe0vF1c2VmktzgY5PU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR03MB989314
X-purgate-ID: tlsNG-d25034/1792485170-51B35A5B-028611E8/0/0
X-purgate-type: clean
X-purgate-size: 857
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 19/10/2026 7:58 pm, Roger Pau Monné wrote:
> On Mon, Oct 19, 2026 at 04:59:59PM +0100, Andrew Cooper wrote:
>> Between writing MSR_S_CET.SHSTK_EN and establishing SSP using RSTORSSP or
>> SETSSBSY, there must not be any CALL or RET instructions.
>>
>> Building Xen with -fno-early-inlining causes wrmsr() to become out-of-line,
>> and thus suffers #DF during boot.
>>
>> Make the MSR and shstk helpers always_inline.  They ought to have been this
>> way all along.
>>
>> Reported-by: Roger Pau Monné <roger@xenproject.org>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Sorry seems like I'm a bit slow today.  Also worth adding:
>
> Fixes: b60ab42db2f0 ("x86/shstk: Activate Supervisor Shadow Stacks").

If we're doing that, we need

Fixes: 3037d8b7eb3e ("x86/boot: Use RSTORSSP to establish SSP")

too.

~Andrew

