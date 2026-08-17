Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E844C5DF66
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 12:40:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392912.1631873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvwds-0003aX-UZ; Mon, 17 Aug 2026 12:40:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392912.1631873; Mon, 17 Aug 2026 12:40:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvwds-0003aQ-Re; Mon, 17 Aug 2026 12:40:40 +0000
Received: by outflank-mailman (input) for mailman id 1392912;
 Mon, 17 Aug 2026 12:40:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wvwdr-0003aJ-DP
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 12:40:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvwdq-00BtKZ-LT
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 14:40:38 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a830143-8faa-0a2a0a5109dd-0a2a450485d0-6
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 14:40:38 +0200
Received: from [40.93.201.43]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a830144-b57f-0a2a45040019-285dc92b5d79-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 14:40:38 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH2PR03MB5302.namprd03.prod.outlook.com (2603:10b6:610:9f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 12:40:34 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 12:40:34 +0000
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
 b=og7kMu/QaAwbC6m/sySy/N1YIqyaQwmfTjQcoJCpIbBpB9VQeR8q05IeUY+EyePBInjX0goYwy7ymon3pf+zrTxKkiTsb8AkW4WXH7Fqqm+oHfaxK0KAHHhvl18WLgF6vGVEcGgETfTPBggVOW8GXpHa27fxSgEu/nYTTTdXXy75fQud1JWj4wT8KjGEsQXdlQ9DbtydqiuStxcC4BPTu5vWOfeHlx69K5oz/ZQWQ7jB9fDJ1FMfZzd2yRfA7wdGji/TRaTiVRDnTscqz9nAm/GCIkjJZKv7qAnC4CGel532fVZ/0H8Hw1peVugZaO5YHsmZyUR6IgW4Lc3qlsB+Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCVDK/pH+N6pkNmAz4FOIbG+CD4VwbAdBV3xJJbNKIc=;
 b=EGhqakFCO5djhchzvPxllMjjzMVW/q68l2GLkY2ohCXfXD8JUpdTWi3H9rPtu9ijRq9l8HAo3+k99J0xGJV0ERCacIZJ01xicbD4sJaAjpE3O8H1QqsZsKitLqpiZMa3PAu/qR6I0qm5E3baQZwCmtczOyWXxUGGup8riLLsKU9gzVyFrY1NTJX4XGHygXnTgxkJJtGTaOXasTTDBA0+vUS7lBEeQ2ZeP+S84pjLTb2jgJ7cGchjv1iBOITHNNUleOfxKCZC2ow/MV+8JLR9qxYvZCohnMoIlM5TCvZ2uxJyGW/A7jYvVQho8sChxG/febvi0n4eD9MRdOnYFOFyGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCVDK/pH+N6pkNmAz4FOIbG+CD4VwbAdBV3xJJbNKIc=;
 b=qSMfrf2V6L8pEMfTpxEvrQiGOuiDr2lJJTDvL5PK1mWtiqt9hmaztb1fuMjuLaji5dpJzHh/UO4pCaHvCtHxa1nBtPH8IK5IbdyDukJIOFZRPR+WS0te1bulSnbKn45HrlAkDvgsQk6cpTkQxzmd9AwlODbFespW/YEuaHl30Sg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5b358558-1b17-49b2-af5e-37981d11094f@citrix.com>
Date: Mon, 17 Aug 2026 13:40:31 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/5] tests/x86: Introduce a userspace test harness for
 x86_decode_lite()
To: Jan Beulich <jbeulich@suse.com>
References: <20260803072006.9678-1-andrew.cooper3@citrix.com>
 <20260803072006.9678-3-andrew.cooper3@citrix.com>
 <dd065a33-0105-4527-92f5-f3f127422ee6@suse.com>
 <21d3fae8-e9b0-4c8a-a7b9-483a0257e44e@citrix.com>
 <b76b3fa9-cac9-401f-adc7-88f6881a64f6@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b76b3fa9-cac9-401f-adc7-88f6881a64f6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0007.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH2PR03MB5302:EE_
X-MS-Office365-Filtering-Correlation-Id: b27bee48-6340-4106-06a2-08defc5cbb5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|10067099003|4143699003|11063799006|5023799004|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	5BJQQJLxExrJx/yuOriO0PgdctSqJG7KVVpJaifGBBrc70j2yGpSsKALqCyNsSXuLllB3nkEs1cTZu98V854EUnGGpLlxHsG+cDseGet8cErcT+888F0eO/weltIgTroi6G8QaJ63+F1OQlA/UsqA1fUoGuoiYkyfKGkALrH+QaFxjX1uuW/3G+aX5EyHMMT91avtdZz6wNIFiA5NS3vE+7hVa+2HfeycDWyhnK1fIBiBym3khGgC6Uo1bhFO4MbDdWqQb6Z3Njj8OtdFRDZn4K5pKzoxZJNtV78VZZoFZEKPTa6B9c97Wi7ybL0r5TJkHXr9363WPj+fFrNoS1pTvBYhaj5GjPFuYJG5dciUcYu8MlON37/7S0dpmUkWkP8uiSDa3jVrl2gSdNZGA5fZpEUyUZC1hnPGzf+uX4aAlxGp2rWFGteav1q+JDs15qHm74hTVYBErgZUUu8QC6gwPYgT5zxB1cg39xaB15qSGFFOCU2/sWGFDTEf7UcmRkmBKxhsQ1yZCCwAUKmPpAdVBO6oMs8NLXcc1oDU5m8rrJWj2x39qeniZ2ZnGNbidTGsK6KfQyTuFe+Or6pQmxidCAdf4uT3i5CwzQnXHn4i7nFmQpbnnOxcA027sPThxh1kQtyhUawGIXaqV8IjSgImq0ZRLGu5NugjCaHkd2OoKo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(10067099003)(4143699003)(11063799006)(5023799004)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGh4bS9rZW5VTitIQU9kVXhzQTVNRmhDNGFnT2EvOGk4SWlTbzVXWWFjVG5F?=
 =?utf-8?B?NnFUYU11WnZpRGhHZDl6WDJHeWhieStuNjZSZjVpUVFpVjBha05qK2NKT0xL?=
 =?utf-8?B?aTRKald2TmtJcDJ4dUp6Q2VlOXlwYkJPSGRjQnpWUmF1QloxdVFQTHdmcWc5?=
 =?utf-8?B?TVU4Q1o0OXl4NUFrZ3VxVjFRYjBzMVFRUFZETzl6KzAxMVBqcTFqU05CU0hE?=
 =?utf-8?B?aHZ6cDRwNzFjMTZNRzRGdTlqREtOcStBNS9aVitzQStENnpQVk82Wk1CaVpD?=
 =?utf-8?B?YzR1NzczT1NZdjhHYnp1Z05UME9DWWZ6cWpHS1I2NEprYnFJY0VGMmNrZTEx?=
 =?utf-8?B?NjNlNXR1L1VpdTg5cWFUbGp5d2FRVEpQVU1LMit4TE52N0FIWHlXSVFXYlNR?=
 =?utf-8?B?L2RrNHd5UlN5RVdFdUx6U2hydU5jWGhZcE9vdkFNeGtURkxMc0FpR3pXY2tw?=
 =?utf-8?B?VVBNQXpQeElJTmlidmF2WlZqcGM0RVhPMjFCbHgwRFYzNWNydDlHRm1Gd3g5?=
 =?utf-8?B?SC8reWtIMTlVR3dPamZvMXFXUXl0YVRXNHBRRXFxdXdyZnhzUU8zMkNMK1I0?=
 =?utf-8?B?WDR4WTJoa2tJazF4WlVEajNPUEg3dlJRcjdQZzAxYjZNVW1NZ2x4WmtsTWQw?=
 =?utf-8?B?OG94U1pqamljTGNISTdPM2RKMXlUbkJQeTljZmVkUFJNZm9sYUFhUCtENXBv?=
 =?utf-8?B?WFd2b2pYQStwbWc1cWJGVldubW83NUNPSk5NRlo1Tk5Hdnp6VDNJTko2cTBW?=
 =?utf-8?B?dWlOaUZTaGV6MnlXWkNJRUFZS01FTlhxL2NBOGlmUDd3VEZOc1EyS1NsSTZ2?=
 =?utf-8?B?cUdEYUFYVnY5RjBsemgyaG15Q3NHR0RSaUZ5NDIvVVo1MFgzNXFFdkFINkZv?=
 =?utf-8?B?TWkrS2N6UGJTZFlmTFZrZ1BYeVU3Y25wTGJRMTFOOG1Bb2pBK1FWSFJLWEh1?=
 =?utf-8?B?dFlGVElZQmNEQXNWZEw4Zk9VQVc5b0RsRU9IKzFScXcwZC8zNEdVNFUrSzBO?=
 =?utf-8?B?dTJJajYwWnFEUmE3blZBRmN5RTlWeGhTOGlyaTFDaVlRVFlBMy9TT2pyb2E4?=
 =?utf-8?B?QmpSblNCWlhQYUNqeURYRU1LRW5tNXBPeTBrM25WTnRTeUU3akRZZGhDWHNa?=
 =?utf-8?B?aUZqTkR0Yk5uNDhhWU5oTHJVSFZveWRtNWF0RFBJQTlYTGVZbFU1Q0RMWHB0?=
 =?utf-8?B?MWlncGRSdXlRblBVakQ2WWRwa2I3VGswSWZOL2laU2tWanNjK0FjZUtrSko4?=
 =?utf-8?B?cStPT1dCekIvVmtSQi9PdXhqSlREVkM2cGhGTUZIK3dyMHB4U25yZ3F3RnVL?=
 =?utf-8?B?VnJXejhtbjEvQ0pYN2lOZkl4WjJTREswR0ZlSkZEL3ZqM2RGNTU3ZGNZOC9j?=
 =?utf-8?B?N0xFWFNPNGg2akR4MTl5MzRFLzJESlFnbXJFOGl0YlgvSGNZdzI2Y0Q5ZStK?=
 =?utf-8?B?Wk9EUHNpNTJtZzlzcWlibGptdDRhYkJzYitRSkpidTgxNGNKSktxWjFlRGV1?=
 =?utf-8?B?TTJITlpOTmdWWUdMT09aSE9xaFhrcTBXa3Z2SXJYZG5nUldBQzJzRGUrcDdV?=
 =?utf-8?B?dzlqMlE5YlEvN1lhQi9uM2s0ZGZXNXFPL3RzRGhSenJDQ0tWcFZydDBuOVQ1?=
 =?utf-8?B?SzViZDJuUjFxNzBTNDJDNmZwTGpKRkFFMXBFRVlyendsRW5XckthYVpXb29F?=
 =?utf-8?B?aUt1djdWNllVU0RZSDdiZCt6c0h1NVhqQ1hSTko1OCtpM0NlKzFqQmxCUlJJ?=
 =?utf-8?B?MVEzMTZOS2oxeFBDUFBOdXFteEdURW00Skc3a2l0d0xWZ0NyWS9neDJaVDM5?=
 =?utf-8?B?ejAvakZQbkRvaERrTDRudS9Da1JwbmVuc2xacXhncGlxUURUaTdWeENUMjUz?=
 =?utf-8?B?c2JQUXo3QnM0aW5idHUvdE0zVlduSmhKZzR1M2w2ZVFmTkpoSVpXYjRqTXhM?=
 =?utf-8?B?b1N1cCtiMU5XRUhldGZjQWlJWWczekhtK2RzWlczK2Z4bVJpTVhxN04vKzNO?=
 =?utf-8?B?a3hNWHhqZXk2M3hFRE9RbmdBbWgzMm5wZE1UYjJyVnEyeVdTeG80ZWEvdUQy?=
 =?utf-8?B?Q2dFVnZ2WkV2NXhFSTQ1QlorMVNBcEgvK216VTJ6Mm44NlVkZ3BaSHpXSlFN?=
 =?utf-8?B?Sm9mY3FFVVNheXpRMWY2aDZsd1RVdW5CNnhRTGZLbTcrL2hwdWdhc2phRE10?=
 =?utf-8?B?bU9lZTYwRkovbnFITUhJTXptUUFuSTJBT2wzcHhnc3I4Umw5NDd1YW5VbFFh?=
 =?utf-8?B?RTV0Wk9TYjdJZVZvNjRDaGZWUlJSQ21TVm5rRDd0STNsL3pFc1QvSGljVjht?=
 =?utf-8?B?dU43SjdNeERSb2hEMWxxYjhKSExrc1VIckQrNyt3c2V0R04xczhYeUxDZ1dJ?=
 =?utf-8?Q?ve/+AVkSJ8gaL/SU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b27bee48-6340-4106-06a2-08defc5cbb5d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 12:40:34.4889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7xLHUuUMpoLzYjMWSqxsWNRRC+3GpRGA5FeRCcLSZeGe8GZgn6q9qr8pQF3gl+nFqflW8+4leZYL/y+JH/lnsFSdGtwl/AdHgR9Un7/2ObU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5302
X-purgate-ID: tlsNG-ebf023/1786970438-C3EC6B50-036035FB/0/0
X-purgate-type: clean
X-purgate-size: 6861

On 05/08/2026 7:45 am, Jan Beulich wrote:
> On 04.08.2026 21:37, Andrew Cooper wrote:
>> On 03/08/2026 5:03 pm, Jan Beulich wrote:
>>> On 03.08.2026 09:20, Andrew Cooper wrote:
>>>> --- /dev/null
>>>> +++ b/tools/tests/x86-decode-lite/insns.S
>>>> @@ -0,0 +1,703 @@
>>>> +#include "macro-magic.h"
>>>> +
>>>> +        .code64
>>>> +
>>>> +        .allow_index_reg
>>>> +
>>>> +        .text
>>>> +
>>>> +DECL(tests_rel0)
>>>> +modrm:
>>>> +        /* Mod=0, Reg=0, RM {0..f} */
>>>> +        _ add %al, (%rax)
>>>> +        _ add %al, (%rcx)
>>>> +        _ add %al, (%rdx)
>>>> +        _ add %al, (%rbx)
>>>> +        _ add %al, (%rsp) /* SIB */
>>>> +        /*add %al, (%rbp)    RIP --> tests_rel4 */
>>>> +        _ add %al, (%rsi)
>>>> +        _ add %al, (%rdi)
>>>> +        _ add %al, (%r8)
>>>> +        _ add %al, (%r9)
>>>> +        _ add %al, (%r10)
>>>> +        _ add %al, (%r11)
>>>> +        _ add %al, (%r12) /* SIB */
>>>> +        /*add %al, (%r13)    RIP --> tests_rel4 */
>>>> +        _ add %al, (%r14)
>>>> +        _ add %al, (%r15)
>>>> +
>>>> +        /* Mod=1, Reg=0, RM {0..f} */
>>>> +        _ add %al, 0x01(%rax)
>>>> +        _ add %al, 0x01(%rcx)
>>>> +        _ add %al, 0x01(%rdx)
>>>> +        _ add %al, 0x01(%rbx)
>>>> +        _ add %al, 0x01(%rsp) /* SIB */
>>>> +        _ add %al, 0x01(%rbp)
>>>> +        _ add %al, 0x01(%rsi)
>>>> +        _ add %al, 0x01(%rdi)
>>>> +        _ add %al, 0x01(%r8)
>>>> +        _ add %al, 0x01(%r9)
>>>> +        _ add %al, 0x01(%r10)
>>>> +        _ add %al, 0x01(%r11)
>>>> +        _ add %al, 0x01(%r12) /* SIB */
>>>> +        _ add %al, 0x01(%r13)
>>>> +        _ add %al, 0x01(%r14)
>>>> +        _ add %al, 0x01(%r15)
>>>> +
>>>> +        /* Mod=2, Reg=0, RM {0..f} */
>>>> +        _ add %al, 0x7f000001(%rax)
>>>> +        _ add %al, 0x7f000001(%rcx)
>>>> +        _ add %al, 0x7f000001(%rdx)
>>>> +        _ add %al, 0x7f000001(%rbx)
>>>> +        _ add %al, 0x7f000001(%rsp) /* SIB */
>>>> +        _ add %al, 0x7f000001(%rbp)
>>>> +        _ add %al, 0x7f000001(%rsi)
>>>> +        _ add %al, 0x7f000001(%rdi)
>>>> +        _ add %al, 0x7f000001(%r8)
>>>> +        _ add %al, 0x7f000001(%r9)
>>>> +        _ add %al, 0x7f000001(%r10)
>>>> +        _ add %al, 0x7f000001(%r11)
>>>> +        _ add %al, 0x7f000001(%r12) /* SIB */
>>>> +        _ add %al, 0x7f000001(%r13)
>>>> +        _ add %al, 0x7f000001(%r14)
>>>> +        _ add %al, 0x7f000001(%r15)
>>>> +
>>>> +        /* Mod=3, Reg=0, RM {0..f} */
>>>> +        _ add %al, %al
>>>> +        _ add %al, %cl
>>>> +        _ add %al, %dl
>>>> +        _ add %al, %bl
>>>> +        _ add %al, %ah
>>>> +        _ add %al, %ch
>>>> +        _ add %al, %dh
>>>> +        _ add %al, %dl
>>> Perhaps also include %bpl, %sil, and %dil?
>> They're not relevant to this test, and interfere with the intentional
>> pattern set up.
> Hmm, how does a particular pattern matter here? I don't think you test those
> cases (or more generally an empty REX prefix) anywhere else.

There's nothing structurally interesting about those; I'm not testing
the assembler, and x86_decode_lite() doesn't decode registers.

The ModRM byte has multiple structurally interesting interactions with
REX prefixes, hence the coverage of Mod and RM value.

The patten makes it trivial to look at the disassembled result and check
the coverage.  (And spot the bug that's hiding in plain sight above.)

>>>> --- /dev/null
>>>> +++ b/tools/tests/x86-decode-lite/main.c
>>>> @@ -0,0 +1,111 @@
>>>> +/*
>>>> + * Userspace test harness for x86_decode_lite().
>>>> + */
>>>> +#include <stdio.h>
>>>> +
>>>> +#include "x86-emulate.h"
>>>> +
>>>> +static unsigned int nr_failures;
>>>> +#define fail(t, fmt, ...)                                       \
>>>> +({                                                              \
>>>> +    const unsigned char *insn = (t)->ip;                        \
>>>> +                                                                \
>>>> +    nr_failures++;                                              \
>>>> +                                                                \
>>>> +    (void)printf("  Fail '%s' [%02x", (t)->name, *insn);        \
>>>> +    for ( unsigned int i = 1; i < (t)->len; i++ )               \
>>>> +        printf(" %02x", insn[i]);                               \
>>>> +    printf("]\n");                                              \
>>>> +                                                                \
>>>> +    (void)printf(fmt, ##__VA_ARGS__);                           \
>>>> +})
>>>> +
>>>> +struct test {
>>>> +    const char *name;
>>>> +    void *ip;
>>>> +    unsigned long len;
>>>> +};
>>>> +
>>>> +extern const struct test
>>>> +/* Defined in insns.S, ends with sentinel */
>>>> +    tests_rel0[], /* No relocatable entry */
>>>> +    tests_rel1[], /* disp8 */
>>>> +    tests_rel4[], /* disp32 or RIP-relative */
>>>> +    tests_unsup[]; /* Unsupported instructions */
>>>> +
>>>> +static inline void run_tests(const struct test *tests, unsigned int rel_sz)
>>>> +{
>>>> +    printf("Test rel%u\n", rel_sz);
>>>> +
>>>> +    for ( unsigned int i = 0; tests[i].name; ++i )
>>>> +    {
>>>> +        const struct test *t = &tests[i];
>>>> +        x86_decode_lite_t r;
>>>> +
>>>> +        /*
>>>> +         * Don't end strictly at t->len.  This provides better diagnostics if
>>>> +         * too many bytes end up getting consumed.
>>>> +         */
>>>> +        r = x86_decode_lite(t->ip, t->ip + /* t->len */ 20);
>>> For the excess bytes to at least be legitimate to access (not causing UB),
>>> shouldn't finish_arr emit enough filler bytes?
>> finish_arr is the wrong place, but I've folded in:
>>
>> diff --git a/tools/tests/x86-decode-lite/insns.S b/tools/tests/x86-decode-lite/insns.S
>> index e52c2934c8d8..dc017016b2d2 100644
>> --- a/tools/tests/x86-decode-lite/insns.S
>> +++ b/tools/tests/x86-decode-lite/insns.S
>> @@ -695,6 +695,13 @@ unsup_insn: /* Instructions that would complicated decode, or shouldn't be used
>>  
>>  END(tests_unsup)
>>  
>> +        /*
>> +         * For improved diagnostics, we allow some overreading of the
>> +         * instruction under test.  Ensure there are good bytes to read.
>> +         */
>> +overread_padding:
>> +        .skip 20
>> +
>>          /* This is here to cause jmps to use their disp32 form. */
>>          .section .text.other_section, "ax", @progbits
>>  other_section:
> How would this help? run_tests() is never invoked with tests_unsup[] as
> argument. And run_tests_unsup() wants to only fetch up to t->len.

Oh, in which case nothing is needed at all.  I'll take it back out.

~Andrew

