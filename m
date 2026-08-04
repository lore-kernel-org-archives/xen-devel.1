Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8BAC55184
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 17:14:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382486.1625843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrIi9-0008QK-E5; Tue, 04 Aug 2026 17:13:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382486.1625843; Tue, 04 Aug 2026 17:13:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrIi9-0008QD-BC; Tue, 04 Aug 2026 17:13:53 +0000
Received: by outflank-mailman (input) for mailman id 1382486;
 Tue, 04 Aug 2026 17:13:52 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wrIi7-0008P2-T1
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 17:13:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrIi6-0074nb-VO
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 19:13:50 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a721dcb-bab6-0a2a0a5309dd-0a2a4502d854-4
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 19:13:50 +0200
Received: from [52.101.56.24]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a721dcd-6ca4-0a2a45020019-34653818a7ab-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 19:13:50 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by IA3PR03MB7764.namprd03.prod.outlook.com (2603:10b6:208:50c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 17:13:48 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 17:13:48 +0000
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
 b=QGqyhXyIjLDdWAVieG7QobmoigOgx7jcmvd0xhTz+8+AZEF4L39zMbaYEzw2+y1TJnX38zENReqjUONan/go71Ky0mjnoESn6IYDA/i8RhDvT2LQCDKip/8eq2rjrZLsAbWZhwybcO/GhKgcWmOLz0MlYhSp8c1jGBH/lju03M6E/dg5pmC9O/NNURFwbsg8datYFRSgKIcxaVC936lJJmgAtMedfJv2/L3/8Kys/XS2fAgSkPDchKMTIit0XWtIZut8bnNdn9U8NiwAwsIJtgMlLOX90tK2IqxVOaihFEl3O9llijOXxYFq+Bj8/K9ONMceB7QZTvcuYAzExZ/xXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zx1F8nl9j7tXALRL1U17qJhg2+6Ayc3Y9A703hScVhM=;
 b=TPS3ymXgNmt1+AbanbjR7i34cJSGw6Vz8jqtyUk5NRzv/HYUQmEwyYCV0lya8qD2DTphh5Jrlb7UYiYNUTHPVpS7yS1SL1mo/9NzGikfTONHlA7Vad7IdPrhRN6nWibiPawuObQbVm4vW7PkUxWtmY99tQrXE9yWJ+sDOLHbrr5ZaDw+++/nS76DXg6Tr0YyHAWHhnAGJ0FZ/xOcArx+SYKGLz2wuVAZWHx0NX8hy/keibBtcGuqDsOJprO9goVGLoPyu/pq02DfHmu5zTHtLHZdXASWzX761U/xoiczTRysAfqeejBYPEEUk8quUNaq65irqDlsgGr1hg5RWo13Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zx1F8nl9j7tXALRL1U17qJhg2+6Ayc3Y9A703hScVhM=;
 b=s4DfpHnWS4P0kCgHZKBhdNtseIiIh6oGHlo4wUM477JEnnZjtXU+l1qy6elteXMfO52zQRanLy4I4KN05206EBsclnQywr1p+EkIAGxwPqZVb5JIwGvPF+K7D1i1RL3ODofNf3loniyVmX9/MyOOkzNuF2w3AxJ4GmWBhLLi9T0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f15222a9-1d61-4d9c-b923-8e6ad4994af3@citrix.com>
Date: Tue, 4 Aug 2026 18:13:45 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/3] x86/alternatives: Rework get_ideal_nops()
To: Jan Beulich <jbeulich@suse.com>
References: <20250522150015.555492-1-andrew.cooper3@citrix.com>
 <20250522150015.555492-3-andrew.cooper3@citrix.com>
 <99a39800-dbba-4d37-afcb-ae041af648f4@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <99a39800-dbba-4d37-afcb-ae041af648f4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0106.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::21) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|IA3PR03MB7764:EE_
X-MS-Office365-Filtering-Correlation-Id: 014bdde5-ee34-499e-b69f-08def24bbf2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ELexaLCm117iZoWkpMbWEEGFU+12lY+u7pKjX8TUSi9VH+bQXwKhjvfXvmbePfAbxtJc7noRIcvlYJOJiEUJTHUlRTM5Iudv1BbmpvHo1DfTYqIiRdClZUeO2SJiSOqSEngqSq+4oo3i11SA+jFABTMEVQ9OSShF9oMe/6agN8vAEc5R2Uvt7jJhatRapY1+kwnyGvTfWr9ZBemzrZbSrLlPpQDFvZnjGGbiayv7tteQQ/C2KSM7kwTdzVDJ+xy0V7+wf9DTzoI3On7Y6t6CIJMAyLyB0R+8Z1Ipon+LEIKSJ9GtwXDQcopwpkB32NB3JZ/QXPVsKXIv3Yx6RT5tFoZ/CXMuc4GLN+HUeZpEt+uk5MNHmXdU6aZtN54QpgtpYEDbmovoOzCnFJ1rTGi4NPMpbn5GqhvwjP/6X3qJmn0IebMg/tafxLBE3nrxSFTCeUbtikpog7582d2sGoboHex2kHcuZtSZl2mo/TJoslbdTnJuVb1+30ttecHTJpXvxae76C7OeFAjOT4kTuAoxUTmxxexUIoSw236qjzy8ZGM18+Flpa9C+M5Eagxq89katBEj+GEuuDjNUmyuU7mcRCxRJloGS4mAkoBUeMUVLLuWN+HbREijms1SJtbKJhIiWvzCwNYFIYTYDaEjEl3VRoJBavDFmMfh5lt8ZPaYUY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckcvdUI0b2xoMUhMVXA3VzhoYnM4OWsrQWZqNzhHazhncTNDUkZSSmQ1bXY4?=
 =?utf-8?B?bnFYYVQxa2djS2J1Ty80WnMrNlU1c0YxQlJJcGNuM1FscHhjTUZrRFAzS1hZ?=
 =?utf-8?B?T2ZnTUZleUtORHBVZFNZenczY01Pa05wWkU2NitGa2tWWmxaa00wNEdEeTBY?=
 =?utf-8?B?M1p2bFhKUksrb0Z6dUJYeHZNOUUxUTNTQ05MblJDUklQZGpHOGp5d2xnQms3?=
 =?utf-8?B?VW96VjFVaXpaeFlmYmNUQ0ZEOW9kVFJKY0Y4TlZIamowYUxsdzJiVTRoVjN1?=
 =?utf-8?B?Y255SnhRRzZ1ckRITE53WFhPQzZPZ0l4b01rSzcyTTAzMHZrVkZSanBwS3Mv?=
 =?utf-8?B?VWJzSjNuUjJGUmlCOEhXWGtzQjlDdWprT0RGS2NOOEZkekFvSlFVeE9lUmpX?=
 =?utf-8?B?bkhvSmlxOHZRZ25sQ3lkdGxFNjgwT0lrSDU4emlGTU5xRHVVQ1pvenQ1bVF1?=
 =?utf-8?B?UFQ1bm9HRUxpRUhReXV1ZXpPZDNERmhTTFR1bTNacHJjK3dKRlp3dlpyVkIx?=
 =?utf-8?B?d2RObVhWUnBGTWJWRUNkWDlBOS9Dbng5UGlaVWYyZ3lUVG9MS2FFOFFhU0tU?=
 =?utf-8?B?QUVEMGdLMkx2TGZYWGZRSW1XcGRabVFDb2k4T3c1VVdQeUVwcHZwNnRBcDhl?=
 =?utf-8?B?Y1gzQ2ttYU16VEFmUFdkYTYzWWs0SFZOZGRJOGt2MGQwaFlBYjg2bVBIbW9W?=
 =?utf-8?B?S3pTdkt1V3l2d1V4RWkzVmljYnJONkRFUmIwOUpoRXJDbW9EV3Z5WDBxNGZ2?=
 =?utf-8?B?TUlVTWc0ZmdsRGhRT3lkZEpOZTVPZDBDUTc1Q0IyUVgvdWJ4MmhDZ1N3S2dq?=
 =?utf-8?B?YVZnb1hWZDlTZXFFcFpPMmQ2M0s1TFVRWFdlN0hKeHh2NkZRdmZWaU5mRXRr?=
 =?utf-8?B?eHpNdlY0Zm1SZzVZelJ3azBuZHJxWlFpc0dTVGtYbTZTM0VQWkJaTlJ0Wk5v?=
 =?utf-8?B?aGN0RkhVUStkOVlEOWpmQzFxWXlWR2RRaDV4ZGkrYXJPdThxcHFqb1N2bnpL?=
 =?utf-8?B?YTNKNk5pSDdrTW9rL1dDY3dEeUx2bWhIREhhYXYyY3Zqc1ZBUGJmTGZObDY3?=
 =?utf-8?B?d1hERUMwbk1iK1RYUlZzcGphcVBldGlaZWw1TXUydFJLSlB5aVVTMDlUdlY5?=
 =?utf-8?B?SDg3SjM4cDBrdlZjMlZUSXU0d1cvL2ZWWDNQbExUZktML1ZJQmhCT0t2U2d0?=
 =?utf-8?B?a1IrR2U0bFlCYkNDazVPUjJZelBoMnkzTnNDTGg1ZWRna3ZXeExST1gwMk96?=
 =?utf-8?B?eHNhWnhPQlNyeUtZSmVHRW56ZDZkRFBrbnBzdGV2UW5IdzFHaVV2VmNvYSto?=
 =?utf-8?B?RkxRTGRiNGR0MkhJQW9GR1FhYWVCWDN1YUg1aklCNFdQT3FJQTNzV2JxbURl?=
 =?utf-8?B?T0o0SzFGRjU0OGE1OFN1NGtleDB1enE1YXRuRzVUdjdFVDMwWDlsWEFvTSta?=
 =?utf-8?B?MGk0SHE1RXhHT0gwWFlSOE5nT0dGRVBDSmREblZqK0ZyY3hyRU5yTUVtWnNB?=
 =?utf-8?B?R0prVkF6RFFkTi8ydjBOanJjVWthRVlaNlpUSGNuR25wbGZxemh3b2haclNa?=
 =?utf-8?B?dUN4V3hJNGdFaTRkdEo5T1RhL2VuOFVKbmo5Y3ZWNnhzQWx0bEphVGl2Z2ZG?=
 =?utf-8?B?K2dKVzdQRC9ra3pDQnV3WlVYSXJ5NmMzQWVPNDVGWGFPK0YyaVBYSjVjV1V1?=
 =?utf-8?B?VFVlWGZlc2Nza1BQY2JjbGZlWU5NWmNaN0w3RjAxSFZoNi8wc0VrMUd1TWEw?=
 =?utf-8?B?bXlXMjhUMGtvbjNSN1F5cE5DekVvNmIrS0lRV0dISE4zbE9HVVVkK2k5ZUZ4?=
 =?utf-8?B?azlMdzlYUHFJSE1keVdZRjJneTBYSTVlZGwzNGNCeERjeXRHSHZWcGo5Z3do?=
 =?utf-8?B?L05SVFdZYkV2dE5oUWlqemRwZWxuWWw2ZTl2czFwci9wQVFWVVVhYlVJdUZz?=
 =?utf-8?B?ZTNjM3ZzR2pMNG9raUlGSTRjU1NzVEVCVUtYRTArRGFkLzQrOWlZaVo2SXh1?=
 =?utf-8?B?UXFuOURKa3N6NWlxcmE1d0RaREx3MFY5ekhzVkV6cHFVbXhsdUZ5MnhBU215?=
 =?utf-8?B?UVBLSkw5eERvRWc3Wk1UNUJ1T05oZjdzVld1dWIrc2d6UWVaMXZ0eHlDUGtJ?=
 =?utf-8?B?MDhKay95bndaWU4vUmV2amdYTi92cTdXaXV3SGNjNkw3V2pOQXJPWlNqblAx?=
 =?utf-8?B?bnJWY3drWEo1ZzBPSEhMNFVtTE1jSGhlWkdYSzdsSHFhMkFrdjMwTmhKOElk?=
 =?utf-8?B?c1hZdGZ0ZXhQTHJ2TFc5NHhFeXJIZDFVYmFjWktaQ3hxSHhCNTlRdTlWVitz?=
 =?utf-8?B?aHZ1QUVoZUN0a3YvS1JVSnFxU0hQdW1maVlYZW5tNXNrVTMxQk5hQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 014bdde5-ee34-499e-b69f-08def24bbf2b
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 17:13:47.9026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Bt+f3sgcPHL4C52UO/P9UYPd1D1ZYyYECTrUJA3pWMQiaJ0gcj6MPVypcBfB6DBASI9XG1iJbPArlQttFrxprUeM71WWqkJ+jVIsfZtJfE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB7764
X-purgate-ID: tlsNG-720697/1785863630-31FD62AC-F0D9089F/0/0
X-purgate-type: clean
X-purgate-size: 1662

On 02/06/2025 10:57 am, Jan Beulich wrote:
> On 22.05.2025 17:00, Andrew Cooper wrote:
>> The implemenation of get_ideal_nops() changes from:
>>
>>     mov    0x19bc41(%rip),%rax        # <ideal_nops>
>>     mov    %edi,%edi
>>     mov    (%rax,%rdi,8),%rax
>>     jmp    <__x86_return_thunk>
>>
>> to:
>>
>>     lea    -0x1(%rdi),%eax
>>     imul   %edi,%eax
>>     shr    %eax
>>     add    0x67fc1(%rip),%rax        # <ideal_nops>
>>     jmp    <__x86_return_thunk>
>>
>> The imul has a latency of 3 cycles on all CPUs back to the K8 and Nehalem.
>> It's better than an extra deference on all CPUs, even the older ones.
> While this is all good, what we're losing is ...
>
>> --- a/xen/arch/x86/alternative.c
>> +++ b/xen/arch/x86/alternative.c
>> @@ -20,7 +20,7 @@
>>  #define MAX_PATCH_LEN (255-1)
>>  
>>  #ifdef K8_NOP1
>> -static const unsigned char k8nops[] init_or_livepatch_const = {
>> +static const unsigned char k8_nops[] init_or_livepatch_const = {
>>      K8_NOP1,
>>      K8_NOP2,
>>      K8_NOP3,
>> @@ -31,22 +31,10 @@ static const unsigned char k8nops[] init_or_livepatch_const = {
>>      K8_NOP8,
>>      K8_NOP9,
>>  };
>> -static const unsigned char * const k8_nops[ASM_NOP_MAX+1] init_or_livepatch_constrel = {
> ... the (at least visual) connection to ASM_NOP_MAX. Could I talk you into
> adding build time array-size checks for both arrays, to restore the
> connection?

Sorry, but I have no idea what you're asking for here.

The use of ASM_NOP_MAX was latently buggy before; it was easy to create
a NULL deference if the initialiser wasn't filled in when ASM_NOP_MAX
changed.

~Andrew

