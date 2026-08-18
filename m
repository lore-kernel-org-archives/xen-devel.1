Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1317C5DF80
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 11:26:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393990.1632794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwHx0-0004kn-KO; Tue, 18 Aug 2026 11:25:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393990.1632794; Tue, 18 Aug 2026 11:25:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwHx0-0004kg-Hc; Tue, 18 Aug 2026 11:25:50 +0000
Received: by outflank-mailman (input) for mailman id 1393990;
 Tue, 18 Aug 2026 11:25:49 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wwHwy-0004kX-VK
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 11:25:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwHwy-00Gj8b-Bs
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 13:25:48 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a844136-2eae-0a2a0a5409dd-0a2a4501ab6e-20
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 13:25:48 +0200
Received: from [52.101.201.64]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a84413a-5984-0a2a45010019-3465c9401a88-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 13:25:47 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BLAPR03MB5572.namprd03.prod.outlook.com (2603:10b6:208:292::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 11:25:44 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 11:25:44 +0000
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
 b=mu9i2Hfb3ioo6UGjjycxdB2qaxjT/HR6L7V2+jywOzBqmiM6Cg774o9OEud1ewYi9G4m2X719uAzbyKcPnXBxACJ8wH6+hex6MnwETJVQlk0rnG2zqgEqupBCeL3Qd/3g/9PtQpSLKqtCBkw4CodBrmvN/ErBZ6rSbwW1DzkFK9r6ETNvT0/95pMhgZW0PubdpXWjX1/OI8lGN7TlRf7tZcj+8NY9vL7XQI/cReFYp1Ef6spDIDiB8R53Ud9sdAz0Zo4dbtbWmK32JubiCoueR9DHpGaKcNVCRNRcJcjAxQ8xahgaTwP/jQCN9lQIJadnID39eyn3NmdUNi5PrBNuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I2PDRsXl3qSiajdMqTa8WBM2OuMW0US74uehJ7v6P/8=;
 b=RayS9DEecC3LW7J13QywCGg4NN6LdA49x3/tQoVZrSFjHH8NQUzwKW2XhxaWYtZtP3MzhpR5GYIjj9H+JaR+0o+/sSd7wZEAKj29aHHU60r+SBZpyyDJ+yh6UtifNdX+SJ3pNB+KglcuzIBENj5Gxo22A6kf4VFWDMRFX8Q6eQUf9+TajVz+QbNtvm8uaaHK81mBbL615fWXQikIdavLdZgMJP5TaRvc7oZs7h8gg6B2K/lq/nun/4brnjEbhDDkN/CLIkVobBeDrsobQm865rmprI8EkFCBKxEPsdvxaQHCJsq2epG0vBn4/m8vk98VtTjhfh0QHWiY01dWLZaGAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2PDRsXl3qSiajdMqTa8WBM2OuMW0US74uehJ7v6P/8=;
 b=JzzlOmjs3r4HoYsBJreJfjsYR+l1L8XjcsbQOg54rm/gjmGhUgn9Cj3YLdjirVKc9oUWd0bgV+yD+dP5L4ltmCHraiTr/lERkRG6C+E3GbuHoc0+SwRUOS27YQqbixiK1FSmTBs5AGYrEdiqyaOSc1JOEZdxRNrhLwPJeA46EEo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4291b18a-c33e-4068-82b5-1cfdad211cbc@citrix.com>
Date: Tue, 18 Aug 2026 12:25:41 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 2/3] x86/emul: Rename the x86_seg_* system segments
To: Jan Beulich <jbeulich@suse.com>
References: <20260814185841.1757421-3-andrew.cooper3@citrix.com>
 <20260817121129.1787344-1-andrew.cooper3@citrix.com>
 <e3e692f6-c9f6-4ed9-9212-fa61521f22e6@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e3e692f6-c9f6-4ed9-9212-fa61521f22e6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0065.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BLAPR03MB5572:EE_
X-MS-Office365-Filtering-Correlation-Id: 88510243-842b-400a-414a-08defd1b718a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	h5rJynVhREZsQmyHmbQNK8mfEjCEcu3nO/zhuC4/D7zsbMtj6zAQGjoaE0huLLk2XD0wIsB8AwuYLbgSgCOe/0WheLB3Ldr1N2QeMHm5uqcVPkOgGxT3m4whiHHzwvoCOPfhJ5kfcunC0Vxw2gHHaa6FKSpqvoZI/F6S8yFgRc5+sKU7Lbfli3eHkvl/3OKONHIHa94gJkJ4Fjy+L3rVDZwhVSdDfBNnlCR0yq0OZq8hr17dMA5fRoB2ebJpBAE0kuy5KJQ09f32+zyA840NHnwf4Bdilnwi7w4pJvXhtuIXHWQ07XDeqYj9q7X8NFZ1CgiJf+zjyPB2Hl8pCarXsyKSSd7NB/BjVaAfmdc60TD8fi2RvuG6SGrIH/N/q2PAFHOgvRdHgSjGhWZ+xUplSAKTi0otLZ3QBHQ+NtBO6p7qLY6CdqeIFCzkqQMpBLm2YiFiZb5jlWRZHDxNpueWHxguNOl1anvtzddlHgr6yr6+wUNgnP+Bl33PglbmCf2FCF+Z2324eFZ7mf4+UBFT/skbD6VGgXhs0AHF+fH2Wz2/EUFOA/3S5Q58GhIHmBLywiNX0+IucH4bnuyVY4a4nwB6tuVk5X9HI6TDggwfThyAu01cMrsBd/+DNkgSYjrVoIHDxC3tdZwh3NZjcVd5f8Fio/5X/p8/z5ryWEWwyss=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTFnYVRua0d4RE1KaEtCNVdxakg4emdvUnU1WXlTQW5GcDdqbGErSUdreTlO?=
 =?utf-8?B?MWkzY0FyZkNtZzhyOXdTRHR6OXAvWXhibDVrK1FnUEwwT1h3eFh5RkppbEk1?=
 =?utf-8?B?STlGcWRBaDdLT2Ivc2dQTGN4ZGlUZnBlajg5M25CdjBoeFkvNXphc0ZQTURT?=
 =?utf-8?B?Y0xlTUpZbVNTaC9Sc29IdTI5T21ScEp4MG9QU1hQUk0zVlRkdWpIYWtKZUpq?=
 =?utf-8?B?Z0dJV0lhRDBWVmJWZ0hZdTNMU3M3Umh6dlBacFBSTW9yNi90aVZmUnJoTmJ3?=
 =?utf-8?B?WjMxcWt5WkZuWDFtY2R0RWNNeWJTSG8xSXVpMkc5dTVMeXdwUGs0UzZUUTRC?=
 =?utf-8?B?VG80eU5weVRBSHgwU0JaK3d4djdUL3NyL1pxaEhOVjJWZSt0VmpJaVZjOWM2?=
 =?utf-8?B?d09mY2pMYmowZ3dKRjBNZDdLQ2doVTlkSno0cHAxeFRiSXVrZTUzSlJYNHk2?=
 =?utf-8?B?SHMwS1RFcTNIL1QwM1d0Ty96akdhYTl5eldIbjI0OVp3OE5ZbmJmU2xCM2Vx?=
 =?utf-8?B?K1VGUGtmOTVONmNvbDlpUHk0RUhaSXZ1Rm5od05TSGtlTm55cWhVS0FGUWV2?=
 =?utf-8?B?OUYrWFJWRVg1d0pQM1RtSERabUtNTGRRUmZXY1djWjVuUnJybW5IR1BsS2tN?=
 =?utf-8?B?c1NOcmMzTHREVGFuSTQycm1OenlmT205ZnFlYUlTY2srb205M0x3aWpkamFt?=
 =?utf-8?B?eXllVXlmVjU3d2xJQTJQWS9IQ1kvSHFueCtrWGgvN2djejJuM3NyQ0w4blo4?=
 =?utf-8?B?dzd5WnFqL0xHanZJWTloRTJwUGFrM3BmTStjNzM3WXhIaGhzbXd4MDR6cG04?=
 =?utf-8?B?Q1FMV0FIT2hhU2RzRFRFV1NOcSswK2xsM2d6MTZFVk04alk0UkZlU3hqcU1j?=
 =?utf-8?B?Mk50VTBINXBIQVZ0N3pNY281cDhBbnY0RDB0M0xUSVlPRWNmUFdROWVNVmly?=
 =?utf-8?B?WWxWbkkrbXMvN1RTdHBCd3hlSlRSRXZza2xpSXBFTVExUGtZbml3L0V3WVRV?=
 =?utf-8?B?QTlraC96YVYxem5kUko0TlpHM1QySjR6NXNOelZta3B6bndqUS9MZ3dIS3Rk?=
 =?utf-8?B?bmdlRnZSdktkUlp6ZS8wVVJHeUJrdzF3ZzVVbG9BVHR3TTFRTnBPeWdVV1Ur?=
 =?utf-8?B?TURpZUhXUllOYU44ZndjTWp1SUw4Tm1lbTU1TVhmR1o4cnptdnBaS3FIOGdm?=
 =?utf-8?B?SzkzSUhveTFGSkNKeGRScjlLZm1jcll4WkdydVJqekluOHVzM3dONzljQ0Vq?=
 =?utf-8?B?YUg1WnI2WFQrRWlpRWV3SVFjTW8wVHZ3bTVoejdkZ1I2MDU0dFBCR3ZQTFlI?=
 =?utf-8?B?TEsrS1FId25rZ2tzOUswQm9POEdreWRjMGVVMkVPbThrOUtUWmNnMTBRQkFM?=
 =?utf-8?B?T3dNdHVQWDdyb0J5dUFyWDFYSmRXczR4RXJ6dFA5N290cGFCMVVkeU05YjhR?=
 =?utf-8?B?RVdzYlV5c3JZRW5ldE5qT2tvRmJoU3BxRDZSTkFyTU9IbnUxM2lsTC9YUUxE?=
 =?utf-8?B?ZGp1YldxS1JrcFdhWjZ1WmV0Y2txTUUzbW14NDk0YWFVcWVvenRSMkxSdzMy?=
 =?utf-8?B?YmR3UnFHTEt0RndzRlVkT0Z4ZThKOE9RKzVKUCtLQXg3VnhZTHVxUU5yK254?=
 =?utf-8?B?WGp1cGp6ZWZVb2tXcjVKN2xoU041LzlRSFdCYUJYaFFDUlh0WUxFaHhXcEZi?=
 =?utf-8?B?Q0hzcVhyY1hHZzhWdWt3MVJOa3EwbTQwbWkxSTFFWkE5TVJ4RjNuaVFyY0sr?=
 =?utf-8?B?RGVTRHJ5aU9VNkJZckZPNE92cFZGckpIQytBanBTTGJlM0Jwc3pUanA2UVdW?=
 =?utf-8?B?Qk9vOG8wd3VCaTNDbFpwRzJkZ1l0blRiOThJVFB6eEZRZ3g5OVRXUUFlYVdU?=
 =?utf-8?B?dTVNV0Rjd1NhWWVoOE1VbVlIaDVRdjdOUU5qWkFpUW1QYkcrOHFVbWxRakRZ?=
 =?utf-8?B?TktJWXJndUg0b0tYSnEwckdtdTk0TG12Ym9EQnRxZ0FOa1JkSmw0c2I5YU1K?=
 =?utf-8?B?SnJqMyt4QS84SUhwaENCdXZIWnI4UUJnc25zWWpGZVh4S0E5SXBFZ3BBeGpI?=
 =?utf-8?B?d0c2YUMyYWQrelNydTFUbEN2Um1oRWlPZkZJbTMrbG90TURTb3pFQlNIYVFV?=
 =?utf-8?B?dUJOaGNMZk44TWdEakpyZmtRSGxwcVdBY0VHQ2NYNmllQTI2NnhEelFjK1l1?=
 =?utf-8?B?TmZLdGFlM3RBRGRLZlBaTFUxMzFFMjU3K2l1UlhOZ3RVVXNqQU9obXRzSXhX?=
 =?utf-8?B?SzRmM0d1ZlRZa2JoUjIxTnRCbW5UWXFxUEE5c0NkY3ZRNGpIaU1HMjVER01K?=
 =?utf-8?B?SzVyNTU5cEtCeHVwbGQ4eGFicEoyRjJjdmZjK0FTQU9NN2xFYUZTZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88510243-842b-400a-414a-08defd1b718a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 11:25:44.4697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y9JbFRA3jD9RKz9HMxmsMAiM76sv+QE/xvh4CYzFHjVc8HisWIDcX0TwN61kh2YOXuJH2tCZMgOq/0NKjczvZ3Ve+lZsyBmn8SZI3YHSe+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5572
X-purgate-ID: tlsNG-d62444/1787052348-BC558757-949087AF/0/0
X-purgate-type: clean
X-purgate-size: 1495

On 18/08/2026 7:31 am, Jan Beulich wrote:
> On 17.08.2026 14:11, Andrew Cooper wrote:
>> @@ -131,18 +131,21 @@ int arch_set_info_hvm_guest(struct vcpu *v, const struct vcpu_hvm_context *ctx)
>>  #define SEG(s, r) ({                                                        \
>>      s = (struct segment_register)                                           \
>>          { 0, { (r)->s ## _ar }, (r)->s ## _limit, (r)->s ## _base };        \
>> -    /* Set accessed / busy bit for present segments. */                     \
>> +    /* Set accessed bit for present segments. */                            \
>>      if ( (s).p )                                                            \
>> -        (s).type |= (x86_seg_ ## s != x86_seg_tr ? 1 : 2);                  \
> From this, ...
>
>> +        (s).type |= 2;                                                      \
> ... this wants to be 1, while ...
>
>>      check_segment(&(s), x86_seg_ ## s); })
>>  
>>          rc = SEG(cs, regs);
>>          rc |= SEG(ds, regs);
>>          rc |= SEG(ss, regs);
>>          rc |= SEG(es, regs);
>> -        rc |= SEG(tr, regs);
>>  #undef SEG
>>  
>> +        tr = (struct segment_register){
>> +            0, { regs->tr_ar | 1 /* Busy */ }, regs->tr_limit, regs->tr_base };
> ... this wants to be 2.

Yes, I did spot that just after sending.  I thought I emailed out, but
clearly didn't.

>  Then:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew

