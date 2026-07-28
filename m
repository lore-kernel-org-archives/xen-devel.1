Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CED4C54F4C
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 12:39:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1373915.1620844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woh5n-0001MB-Uf; Tue, 28 Jul 2026 12:39:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1373915.1620844; Tue, 28 Jul 2026 12:39:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woh5n-0001M4-RC; Tue, 28 Jul 2026 12:39:31 +0000
Received: by outflank-mailman (input) for mailman id 1373915;
 Tue, 28 Jul 2026 12:39:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1woh5m-0001Ly-Tj
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 12:39:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woh5m-00EIIW-81
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 14:39:30 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a68a2fb-2eae-0a2a0a5409dd-0a2a450ae7a4-14
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 14:39:30 +0200
Received: from [40.107.200.22]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a68a300-f2d2-0a2a450a0019-286bc8169afc-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 14:39:29 +0200
Received: from CH8PR03MB8276.namprd03.prod.outlook.com (2603:10b6:610:2c1::14)
 by SJ0PR03MB6456.namprd03.prod.outlook.com (2603:10b6:a03:397::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 12:39:26 +0000
Received: from CH8PR03MB8276.namprd03.prod.outlook.com
 ([fe80::8420:cc3e:23e9:7a0e]) by CH8PR03MB8276.namprd03.prod.outlook.com
 ([fe80::8420:cc3e:23e9:7a0e%3]) with mapi id 15.21.0245.009; Tue, 28 Jul 2026
 12:39:25 +0000
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
 b=X4iESyg1h/+4yvap1I2rMmxbfFRWGMqsm52Y3KVqcpQZF9n34AbzHCS8iwd6QK6Kt9pnAiKgfNTkEActZYai/olKX2ZZKEdMiLstRBeYt/6zyBOgw/C2gg41eGLyZC/ubL+vl0WVVpDBxSmtLtfj9Bd4AMGiqbMOYzpJQobyxUu4D2osTnFOPXUB5KDwEQCQ30i8aEB/6r5sq+Ju6hPqZ0zyCqRthGphcVQCon5sedECDX48TJCnvhwWEWfOGbipGuddNZ9Ip86IVMEfNc1cf3jHxAR7nyt4D2PM7Fyu5IluqJlSNVQrp6qEncCjqjf387PkQR9RBNMDe1DvSZQimQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pAYhclLHvcCjImLNBCeAPyS/EiAxCznlSJeU+QPvu4=;
 b=kAt+hvX7IeDCOG+ecs7xpjqqrIK7c24W7DrRLTjMhymQVdC6PFQBX5yDJFOxEq346UyrlA1MANa4mWrPl/w8MEKvLOe6V+JwkxdJ+uh6IpbKovHx53PrLE+OKWY+AcH8dDEBQ6S9hVJfMX/Ca+ou3Hgg2fbaRlutVIa88FxbHTIEHxPtxVbZ3DOXn5CKJc3fKhWuOZ6RnDGQCN6ycMS4kriS5Whf+z0+tmRrl8r2iDQzIYhlKX3Cw+PEIi1HJJa5IornUXlDAX4i6guQCUdIHn2ecdZaN/8lRoxYiDFDyfQ724ShEfxXbduylbEockydp08mjaVVscjdm8fPBoC8fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pAYhclLHvcCjImLNBCeAPyS/EiAxCznlSJeU+QPvu4=;
 b=CbYrjZJveaRc2DFL2bzvp2kzmNRfaRiu6G+wUav0A6+Q3AY/W9+DBq2bZm7pAKSak7m9BRuycQxteMm93Z2u2QmEsQv3viEJHYZswAwj0Y/Z4cxSqm+fSGw4IjvpXm8zQHWNL/JX6fLZCq1bjGiH5ot7S9wyvWGeKa0fUiVlQSk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <89ea45da-dc21-4dc4-b6e6-dc4ac5b2f45d@citrix.com>
Date: Tue, 28 Jul 2026 13:39:22 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/vrtc: Use a real type for rtc_ioport_write()
To: Jan Beulich <jbeulich@suse.com>
References: <20260728123137.41861-1-andrew.cooper3@citrix.com>
 <b8be4d29-e92e-4ecb-8122-07d370e7c6d1@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b8be4d29-e92e-4ecb-8122-07d370e7c6d1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0027.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::14) To CH8PR03MB8276.namprd03.prod.outlook.com
 (2603:10b6:610:2c1::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8276:EE_|SJ0PR03MB6456:EE_
X-MS-Office365-Filtering-Correlation-Id: 38785060-6ef2-4d29-369c-08deeca54244
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	f3VMX7qe/uXWMTcEtFmVFNVCoIhU8JuqRUKTbAYitJebhH4YIE3cbyvxxj0XpueWBPLNoEfRbP6n+B5E7hFvzrnOGKOdltiU/cy8PiyBHn8C2jxCkSxCiI3iWxJui9UZoS9mJyfTsFKxhq/wCUNaer4hBB8VqTiWZ5QuMIj/myxAcjfjhNSRBNe22wPpJMT+b/Bk1pdEXId9DPYLxDuW4cV6SRI/yk8OSWjbIPsmdRrzmy84701Cc+8ANGsw84s7UsvtmLyYUo1w+rUrIPDAwOXWHzeWQIdx4xg8xc1kavf8r+n+ecv/vowjjr1MQE3q/l1OWsLD1DCm8CuSK+jtqt9R73+q7DUBUq51fUpnM7V1wKu5qa0ha3Y6pHmIcE7zH6zc/T1CBS34sJqSRqbQj5B/yUeUk6rbtxX++lNO0HZwE7beGxGRwAFW86oZ4/yHOvXbxCQNuByGrlJsIeLWr5FOT+fQgEtbQTUyQPHlssTWgP2s4lOUWqiFPjI07I10PZTVaYmLZ6MVbJ3TXqaJlzZazRanOyftnuqUZv2pewUQxdNOgN779N1haF2w6fKXjUMQqHtPJQPPcYdOnggKNO9tCxw+DpQqVXz0N/7vJVaJJxFvhQ2hHiV7+howmBIMsaGJA5jkz6WjYXWkeL8XpylvMYwFDs1xsEKKcSlptDo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8276.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnZqdkk2SnhaSWV4WkdCZWEwSTZTQ29YbE1OemdoVWZneWk1MytydmdTaUty?=
 =?utf-8?B?ZUdXSE5kb3l1ZS8xc3k4K0FiT1c0Wi9DLzIvZy9QOHc2YnpKWWtISWpabmdG?=
 =?utf-8?B?Nkg0d2NnZWRaNG9YRzl4TGN4eE8xdEQ0d2gvcVBIWkxMUlhYQ2Nkd2RicGQz?=
 =?utf-8?B?UHFKRFZSRUgwTUJHU2hkVlY1SkRtbC9VNEg5VHRReDBRbkMwc2dFdGhlR2ZD?=
 =?utf-8?B?WXJHbUYvOXM2QlF6UjI5alA3R3VoWnJoUnFhN2VoWk4rajVGQkpuYlZkckQ3?=
 =?utf-8?B?UXNwejZ5Ti9UNzBPZUNsNHlEY3VUK2hLV2NkcXRObzV0NU52N042TjNuMysy?=
 =?utf-8?B?aHV5R1kwREk4WXRzYktFS3dVcFpBV3dJRGpHa21XSWNLSzZKVHd2OGRjN0c3?=
 =?utf-8?B?K3NDczlkaldoZDZMeDNnN1hCSzFVbVJ0ZlNTNVpFZlE3V25qUjB1ei9WY0I4?=
 =?utf-8?B?c1RGZ0Y4cm1Qd2Exb09QWFFMam5OS1NmTzNMN3ZiMXNIRC9qMUczZTF2eTMy?=
 =?utf-8?B?MmNBTjZJK2RXQ0tCd09WRnIzUUVNQXFzWUJJWmVLeXpLL0cyaUVTNFhETXVG?=
 =?utf-8?B?Mm8xOWVKRUNKc3J5N21CbytMMEVSZEFITHNCWGhzT2J4eUVieDBMc2RYamFu?=
 =?utf-8?B?ZWZ5VzJrTGRRNDV4Nlh2Rm1Mc1hodFg4NGpWSUNjVTlQZ0FoOEJ5aHA1TG9K?=
 =?utf-8?B?bHRKMnA2dFZVdWQ5b3ByU080SzNocWF3djBpRUp4ZDdyVHkzQ2F5Y3hkVnFZ?=
 =?utf-8?B?Z3p5aXRSbWpiU0Z5M0UrWG9JUHl5UFU5dXVOZHJFVU5VeXloNzJDTlZZeXdX?=
 =?utf-8?B?eWlVcTRwdFlDQzZNY1ZGSWZMc2ZGbVUzUWJQMzRwcE5NYnc5UmRaeXFoOTd4?=
 =?utf-8?B?aHYweDhreTlLbklUMzF0ZWU2YnNQNHUyNU5BVU56bW9udjMvdTQwR3NlY2ty?=
 =?utf-8?B?eXJCTk1UZ2grMVdFdG1pWlBDR09ubDNpbkV0ZXhmd21TYVUwRjVnSXdUeHcr?=
 =?utf-8?B?TUZhS3BsOUNZY0dRREM1dCtoZm9OQnRJSHp4Vi9TVXE1KzZYaTVYRnErVUxm?=
 =?utf-8?B?bDNTRzlidkN4NTRwbEV2WWFLbkxEVGpaZTQwdEdQNjMvejVPZkliYWdUdlo5?=
 =?utf-8?B?elEyNUcxUXZlb3lJKzI0SS9ObDZPSGZGaXdTMCtTT05yL0VhN0NrZEg5RGpj?=
 =?utf-8?B?aUpkL2F3eEJXY1dBZDcrb2F6a0k4cElGWndCc0dNTGI2Sno0WUQwR2FUTUYw?=
 =?utf-8?B?SGw4YVpIRnA1R1NuaVdhLzBtVk1hRE9yUU1maFZyTXNpWWdKTm9GbC9CTXRU?=
 =?utf-8?B?ZkFUOWdRY2YvU2lHWGJjUDYzVlJEWEh4S2ZOc0VaajZwWHZBdmNkRld4ZjRq?=
 =?utf-8?B?S1pkOStsbXpPTTJFSm9naEl4eUc0T0M2cG1mVktzR3g0ZnFCbDU4WFBqWXh5?=
 =?utf-8?B?RS9xZ0xxRlVSTzIrNjNxZUJsMHBwY3dKUjdGNHQyOVFxSEJWbjVZbk93WndE?=
 =?utf-8?B?SnA1aWhsYjNORnp0NWtrNGxiZ1laaFByZllJZUtVWUYrM0l2SFBwSU5wVmVv?=
 =?utf-8?B?SjJSckF4VTdiL2Q0R3BvNFlyVzI3ZFFPeTcxMjRaZGk1bEtObk5YdS9sTUF5?=
 =?utf-8?B?SUtmaWRvNUdhM1ViejBKYmhvMlBpeGJRWEZpSTlYbTJRT1BUdVltZDBjd3lE?=
 =?utf-8?B?VkpRc2RXSGwzejZ0T1RIN1paaXg2WGJ2emkzV3paUDlGWGV0VFhtMWlQSnZ2?=
 =?utf-8?B?eEI3TklZVlhHODY4V2RZbm1DZG1nZlNxeHB1WTBRZWV2MW4xcWJQNFdxeEx1?=
 =?utf-8?B?L2VXM29MOXpZVTRUdUVXZlBud3Jrdldkb2Vab1NOdXJhT0dXcTc5OUhBMW55?=
 =?utf-8?B?Z2FCVktEVFpZZHdvZEFja3FESnlmcEJ6VlVVU1lMQmtiQ0dYelNDZ1JGbnpj?=
 =?utf-8?B?RTM5VGRLUFlCRE5pbG92SGlFM1FmQUZ2OHprTlNTMjNWeWl0M2U3dTVGKzZN?=
 =?utf-8?B?cG5uODBWRkc5NG41a3drdDBhRUlrWnRNamhKcjZUaDNZcGUvUUFOMDFnblps?=
 =?utf-8?B?d3Y3dU8wS0d5ZFFJUmQ2emZTT2dqV2FHbTZTUGw1emlQeWpEWk5PQ05PT3FE?=
 =?utf-8?B?dHEvdkhPTWlCK0J6Z1hTQ1cwZTdVRmMrcG8wZXUvVmZvY0UxUTl1dnVIc2FP?=
 =?utf-8?B?eDZOa2dQWGN6ejdKUVRoemtWcnVJS01ybFZmVVQ1MFM2TnFHUXhkTzB4TXpJ?=
 =?utf-8?B?ZVVBRjVlQTZuZUFRN3BRNUJuK2J6V05RcER1VitydmhWV1NQN2x6RFF3akgw?=
 =?utf-8?B?OWV3ZVIyQ0doejZ2VW9oTHBKazVjdnpCSWtuNnZxQWQ0c2llOHFPcXpFcDAz?=
 =?utf-8?Q?QGxxXeKX5S2117l0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38785060-6ef2-4d29-369c-08deeca54244
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8276.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 12:39:25.9370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t3aq3FkjNdaWS0OfkwF9WpGzYZSPtKSeXaWJM5QrcwqcHEuDbcsF6Www0BGaspRH0Opn9D1M8zJa4LwyWVXe15LHBV3TS9omC8tkQnC9vWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6456
X-purgate-ID: tlsNG-4011c0/1785242370-583CCCFC-24A89E62/0/0
X-purgate-type: clean
X-purgate-size: 1044

On 28/07/2026 1:36 pm, Jan Beulich wrote:
> On 28.07.2026 14:31, Andrew Cooper wrote:
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
>> --- a/xen/arch/x86/hvm/rtc.c
>> +++ b/xen/arch/x86/hvm/rtc.c
>> @@ -469,9 +469,8 @@ static void cf_check rtc_alarm_cb(void *opaque)
>>      spin_unlock(&s->lock);
>>  }
>>  
>> -static int rtc_ioport_write(void *opaque, uint32_t addr, uint32_t data)
>> +static int rtc_ioport_write(RTCState *s, uint32_t addr, uint32_t data)
>>  {
>> -    RTCState *s = opaque;
>>      struct domain *d = vrtc_domain(s);
>>      uint32_t orig;
> It's entirely unclear why it was ever done like this. Even in 3.2 it could
> already have been done the type-correct way.

There are a whole bunch of callbacks which use this pattern.  They must
continue to use void * for the function types to work.

I wonder if at any point in the past rtc_ioport_write() was used
directly as a pointee, but I haven't gone looking.

~Andrew

