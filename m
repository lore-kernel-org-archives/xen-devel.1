Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD736606A32D
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 16:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=LHVtBVrJ
Received: from list by lists.xenproject.org with outflank-mailman.1486238.1689062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRY7e-00027O-5f; Thu, 12 Nov 2026 16:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486238.1689062; Thu, 12 Nov 2026 16:58:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRY7e-00027H-2Q; Thu, 12 Nov 2026 16:58:02 +0000
Received: by outflank-mailman (input) for mailman id 1486238;
 Thu, 12 Nov 2026 16:58:01 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xRY7c-00027B-Ua
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 16:58:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRY7c-007u2n-BJ
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 17:58:00 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af5f00e-8faa-0a2a0a5109dd-0a2a45068de0-8
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 17:58:00 +0100
Received: from [40.107.208.65]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af5f016-195a-0a2a45060019-286bd041264e-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 17:58:00 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM4PR03MB6062.namprd03.prod.outlook.com (2603:10b6:5:391::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 16:57:56 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 16:57:56 +0000
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
 b=xFCDnHE5xPgWX4esb1YE6ox1xmGRc4qDrHRcMSbtEec8xg+w1pjHMqOKEjbd4EnWXc5T6U0riS5DemtWlsYL/sGIh2eiCp1jjIHOGB02qYqkaexDlAWEem86O/9wy3I7pGwEJN1sRdYAu8Q6BJEJXZxCABMloFeMiX4f6HtCADwZVKShXwwa2ONV7gSzt+v9HtGxSACEM2nh/PGZzbzcdZhkaCLXJQgI0M3VHryazrPW4fgbXAODxBbrHJ0PbgBabWEbT70YRM64f6I/Paow+u9FaB2r4OCiLQ7vREAxYCQoSMivt8gPo83Qo9Ybobmakdbhvbt3/q6J/W9jqKV3DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2FnKVd2F4rSdFeadfnXHh8gYCYDoxIcLP3hJJiqIeWU=;
 b=mCprMGQvUK0E6/zUYmEG2ykFS9GzTvFEOA6zP1M6EKdjq2cqPurbceoAWNZWxsdPqd6mpciB9RhFitqpLq786FGuDYHor9LIXMmHY2oQVSkXAuH4OiYYHZu8d525siJ1lo+W5AvFLOPWTZy8mM5z9YhQ3HWMrbmgDYntKBmaw4NG/4l98XZ3P3UR+DYMUFfDfKivxX1pDiYUrYPxs3Sbsob0bUVxJsAq3bvBI3iqPFoXgQSQlrufiIUDDu7neSYstaSwDV/j24+SuIQA0WJ4GF1MJBm25nJagxTVk6FAlhIXxzOdVc2VZtPB1JhAy2K7pf89HXw2Nr4ivDCDXzeQ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2FnKVd2F4rSdFeadfnXHh8gYCYDoxIcLP3hJJiqIeWU=;
 b=LHVtBVrJrIXC1P3rZkr3Mb6pWh7RWbFF7gRwJockoP1Nol+1yef5rRtRI0JLwFUahdLz5NW8RJhbiVM7c80QCWjjhKxTqHDkRr87FMr0V7LWN/jwS9NYUdwD013f1gMVpIapUEgev5qF0QSKQ1diy2HerSY8XsgpNqQnWHGyLiU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <31b661aa-67b6-4340-873e-f3f1ece132d5@citrix.com>
Date: Thu, 12 Nov 2026 16:57:53 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, roger@xenproject.org,
 teddy.astie@vates.tech, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 4/6] x86: extend do_mmu_update() to support returning
 the old PTE value
To: Jan Beulich <jbeulich@suse.com>, Kevin Lampis <kevin.lampis@citrix.com>
References: <20261112100005.324440-1-kevin.lampis@citrix.com>
 <20261112100005.324440-5-kevin.lampis@citrix.com>
 <e2f8d1c2-fb3d-4232-ab64-ee53d2a4d86e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e2f8d1c2-fb3d-4232-ab64-ee53d2a4d86e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0218.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM4PR03MB6062:EE_
X-MS-Office365-Filtering-Correlation-Id: 74b613e0-2072-4cc4-3fc7-08df40de1971
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|261009223027099003|10067099003|11063799006|5023799004|4143699003|56012099006|261021121427099003|261022075727099003|261102123227099003|261026121527099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ispmw0xTiQhF3SR5sPtZ5x1QimyJWplaqLDnHHMlDnofngxFNPhZQWWCTzZi0EKNyrPyAanQnIfRqtO008bFjJEO/NJZ7VKqwanf/IbkHWF+DnxNjR37q6DUno0qlWINf6+PBT/21OV24gLSOg8TtSKBEhdgn+i7UdhtelV6GzvogYRPES+AEJtMR9MMVH+UaM6Do8dYqND9bR8NnLtXHePBRq2RauVm1qoOvG3Av2EKKB1WfdpSe3saehajkADH3aKWRtOgQV4LpDp2TXD8oNDQ1WFyU74d3OCFLpyE2rswq3IkaJpiv9QbX6ofCCjzszpITQFivwH5l1ozEo3KPLUHV4arL1H7dyrJaRJR8zrIzQNOuU0X5lON5c4ikdr9d5lxfoVGzfOLfUPQ0wx6nuMvZPxiQV+8F2ejUxar5MPQrOvpGMstGBIPrAPsJH6NSpa5T/gUZEgaVqB32stFrZgLtEr1h7aBv03MrdCbb5ZT3xK+2OktQqxQRRZooS3O/bNbVKCtsBC6c+ftPNVQ4mBibk4J5cQwSZK0oEc01PF0K5mWFfGXUQGok4YOV41524XaiyP39DtTs+CPs2+sksmd3r8GPIaaSsT+pVIR6T52lDMEKUPNahDunDcD9lTHlhF3LQZwDlwjmUQ+vpbGY24VYSV6pCSFSleMgnxECeQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261009223027099003)(10067099003)(11063799006)(5023799004)(4143699003)(56012099006)(261021121427099003)(261022075727099003)(261102123227099003)(261026121527099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUVzSFNDVXEyVDRhQ0g1RlFFaVptVjUxMkV2MmJySTNXV0hNRHRDa3BQTjFT?=
 =?utf-8?B?eWpHdnN6UFU4d0l2SCtMZXB0bDJwNGF1VFl1VWxBK1pGbFg0VGpaUnd6NFhi?=
 =?utf-8?B?QUJDeHgzV0hmWkgwRi9UT2NtbVZkLzZmWXd2eEF5M24xa1ZmVXROTjNtL0dC?=
 =?utf-8?B?YXdJK1hOUHIxT0tTK0NsMTAyNzFqWHYwTHBKSzVGWGF1TTRCNDFDaDZHVzcw?=
 =?utf-8?B?VUZNNG1mZ1F3cWlMUU53c255Nmdza0tJWnZ5S2hUV0dFTXRnYjhYMW1mNWt2?=
 =?utf-8?B?dC9BWmxYcGRuMjZDcjBvZVRYUHZybDE5c0R4NGRXazZUS3ZJYlQvZUNycGVN?=
 =?utf-8?B?VjVUVWZDR2FNb1ZHM3hwSE12S0lObHFtcEdYRG96YTRiZW91dzB6bGIzbUVv?=
 =?utf-8?B?ZjdzK2ZTbi9zQWhSaHJJMGUzZVM2bkhZU2MwMkN5LytPUHg3STlZaDJUUWNK?=
 =?utf-8?B?VDdPNHJwL1JMYjIwMlNzNEdEd1Voc2VidGZaUmRFb0ZwcjZvanFGL25EVFo4?=
 =?utf-8?B?MUpLcEo5dEc2cHBmeklFcS8rREZkdU1hN0prejM3Ty9ubTBYd3BvWlB4VEVp?=
 =?utf-8?B?aGJHZlgrTEYvU3hmZjBwMHVDY2hDb21WVThpdCtLb1NUd01ibzVXaUM5RU5X?=
 =?utf-8?B?b0J2VVVvV2liM1o2dC8rNmdFeEpsRHFMdERzWXRXRUFYTThGOFdOLzdsUk5Z?=
 =?utf-8?B?MFJZaTJSbDE1cmNGQklsUmhmN3JZYS9lUE1kUDd2aHRWMGs3MjZyZkhISXRR?=
 =?utf-8?B?YUM5Mm84WFpXc1FxM291d2ZvQVYvODU4dXJYK0NvOHhjVHVxbW9odklzQzU0?=
 =?utf-8?B?WnowTlVBYURScTJiTTJrdDRTcXFSbFdjcVArTFhnK3FJbG4wMnR2ZmdBQU5Q?=
 =?utf-8?B?eDFsaHBCMk5oZEZUazdLT2tVK1BHTy9vcW5KTEo3OXAzOXBCM2JCT0NSU2N1?=
 =?utf-8?B?aXQ4SVkyaStFeEpHYTZXQWY1WGIxQkVGWGUvNHVmL1czdXZBQStNNXN2REJ4?=
 =?utf-8?B?WVdUYUZ2Yk1rY0ZzMEZpajUvOGcySGNuUEZ0UVpGSldHSGUzNklVVFRhUm9W?=
 =?utf-8?B?WWNrK3ZMVzJOSFNDZWc4ekFncjVOUVJGMDMyTi90QnBpa1pnTm83S08yajNr?=
 =?utf-8?B?MmxUK1dIbDE2b083RDBId0Y4T0dYcWtzMjMyZG9lUTNHL3dvNEIyaXRtTi8w?=
 =?utf-8?B?SXZsYUd0d1BaNWJrQ1hFVGUvNjBLWEliaUh3SzlaUTB3b0k3RlN4WGU2d1pY?=
 =?utf-8?B?QjAxenVpZitkVUJveFcveEZVUUZid29yNHR5MkJaaVM4MjVnTDFIUjV5VTNT?=
 =?utf-8?B?dXlqbk1lZ1FGNDJMVXd3bnFqVUtIekh6YkpFbWdrTnJBNTF0UUdzelRtTnVk?=
 =?utf-8?B?UUY2Z2JOYzNXN2FxVkU2RkprTGs2eHNIbVlLYjNyaDRFdDNNcHNnQ1REODRw?=
 =?utf-8?B?ZGx0REQxNzU4c1VmTEF2YytObW1hOUVtTWhkSjI3dFRzT1hYdEJGTlpkNk1S?=
 =?utf-8?B?bkt5blYzMFlQVHo3ZlgrWXpjamhQRzhsV1JmZW4xcjU1a2FISlE2VWhVWXR6?=
 =?utf-8?B?K3BHZjZxblJNaVovWTkxeGJZejhlTE81SG9WNmlEbXNhcDJ1eUVJc0Viakl0?=
 =?utf-8?B?SHRoYjFqci91K21xWVloak90TWM2ZUN5WVB3YTMvczJIcnVZMjQyRkdtbDRG?=
 =?utf-8?B?cjl3MUhpd3lrSFVtMzZZdEttUmxSQVZhOXROSW43YUJOSGM5c0FSem54eU5F?=
 =?utf-8?B?MWRGaTRuMXJ5RThxYytIQ3kwM2NvcjNlajUzM0pKc2pHVnRoNFlNUmNxTDZY?=
 =?utf-8?B?UVlKSEc4TU1yTFVEZ3M2Wm1IeFJEdmZybjRTZnBnV0QrRzlGdGlpdStKRGoz?=
 =?utf-8?B?d05uWEQ0eUNQNUJCbW9BbXJKSWlGUitHMlM4UHQ0SldaRVFEVEt2S0ppMmZI?=
 =?utf-8?B?UnNiclRScXdTRGJPelBLeWF6Q2xIVDhKR293d0hsYWwzOEtlSnlYaldiY0tJ?=
 =?utf-8?B?TW90M3JKMkswUVpiUktEU0MyYVczaEM1MWsvYmF5cW53N1dmajNpZ00zUTVL?=
 =?utf-8?B?NlFuTnNQdDM4ZmU5UGl0ZU5UYXhydWpWUWFVUmZjcHpYbnZsbThWMzZBcWlz?=
 =?utf-8?B?cFdBZnZYN0lweHBUdTl1NmZmYzBhcDBDZ3RtWjU3K0h5eFF4dlZwMVQrTFZ2?=
 =?utf-8?B?STdnOUErVHpSVnFBbm0zM1lBakVCa3I4U1pmbXozTzU2Lyt4czlJYVJlSm5z?=
 =?utf-8?B?RzBGRGVKUlJCcU9Sb2trTUdnc0FpbVNpNG5kbGNDNStHTm40ZCs1KzJTTHBM?=
 =?utf-8?B?ZVYwZ1ozQmNaak4yeXl6eG1aMDZLbndsalNYK0lzRDFxdVVGdzk0UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74b613e0-2072-4cc4-3fc7-08df40de1971
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 16:57:56.4406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: StWtkWkc7WEy6iU04OneWbpu4OKbKzH3sC3zaEVf9q1G+XNotXM5N4NhzNibR6nLmOxQvpMTkYMThaUH41N/R/7NpVxQHAsMcVcxXBG8WxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6062
X-purgate-ID: tlsNG-16d1c6/1794502680-FEC7777B-5720D68D/0/0
X-purgate-type: clean
X-purgate-size: 2228
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12/11/2026 2:06 pm, Jan Beulich wrote:
> On 12.11.2026 11:00, Kevin Lampis wrote:
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -4123,6 +4123,7 @@ long do_mmu_update(
>>          case MMU_NORMAL_PT_UPDATE:
>>          case MMU_PT_UPDATE_PRESERVE_AD:
>>          case MMU_PT_UPDATE_NO_TRANSLATE:
>> +        case MMU_PT_UPDATE_SWAP:
>>          {
>>              p2m_type_t p2mt;
>>  
>> @@ -4184,37 +4185,79 @@ long do_mmu_update(
>>                       update_flags = PTE_UPDATE_PRESERVE_AD;
>>                  else if ( cmd == MMU_PT_UPDATE_NO_TRANSLATE )
>>                       update_flags = PTE_UPDATE_NO_TRANSLATE;
>> +                else if ( cmd == MMU_PT_UPDATE_SWAP )
>> +                     update_flags = PTE_UPDATE_SWAP;
>>  
>>                  switch ( page->u.inuse.type_info & PGT_type_mask )
>>                  {
>>                  case PGT_l1_page_table:
>> +                {
>> +                    l1_pgentry_t ol1e = {};
>>                      rc = mod_l1_entry(va, l1e_from_intpte(req.val), mfn,
>> -                                      update_flags, v, pg_owner, NULL);
>> -                    break;
>> +                                      update_flags, v, pg_owner, &ol1e);
>>  
>> +                    if ( !rc && cmd == MMU_PT_UPDATE_SWAP )
>> +                    {
>> +                        req.val = ol1e.l1;
> If you didn't open-code l1e_get_intpte() here, it would become more obvious
> that the INTPTE -> L<n>E done in mod_l<n>_entry() is simply being reversed
> here. If ol1e was of type intpte_t, doing the update in update_intpte() (and
> not UPDATE_ENTRY()) would become feasible. Since intpte_t is a mere alias of
> uint64_t, passing &req.val into mod_l<n>_entry() directly would then also
> become possible. Less redundancy would be the result.

Perhaps, but then it would be odd to have mod_l1_entry() require nl1e in
a typesafe way while passing back ol1e as type unsafe.

And there's still the problem of reading ol1e.  We could change the
indirection of ol?e, but that's invasive both at the source and binary
level.  While capable of being inlined, mod_l?_entry() are not due to
their size.

~Andrew

