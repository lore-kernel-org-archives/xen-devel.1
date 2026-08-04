Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 777CFC55184
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 18:55:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382571.1625919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrKIa-00085s-0B; Tue, 04 Aug 2026 18:55:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382571.1625919; Tue, 04 Aug 2026 18:55:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrKIZ-00085l-Tb; Tue, 04 Aug 2026 18:55:35 +0000
Received: by outflank-mailman (input) for mailman id 1382571;
 Tue, 04 Aug 2026 18:55:35 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wrKIY-00085f-NK
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 18:55:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrKIX-007HgV-KH
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 20:55:33 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a7235a4-bab6-0a2a0a5309dd-0a2a4503eab0-2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 20:55:33 +0200
Received: from [40.107.208.45]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a7235a3-fae8-0a2a45030019-286bd02d5678-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 20:55:33 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY1PR03MB7995.namprd03.prod.outlook.com (2603:10b6:a03:5b5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 18:55:27 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 18:55:27 +0000
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
 b=w3tnGWvshcEid+ytbQ85X9gaHqFCrebfv4y3opcmBCyI8jgO6b2jYx5QK6nEC89P0n60+nMRKgHDT12coPNp/ggexLjdLJgyJnNaswjmjebkDoixJSbXrFyC0QXePIxVKvP0rsSgk6Fpdtjj0jXYxRTnlaZEKelR2CByCFMfTkbrP/wD+5f8OGQAtA/6w0OtoYBpBNiv2vjM/dhSdFSzKVjuHpJ+xPiuZzICpS8OHPRgCIrC6gN25fqfx3H/ZHCb49GAoNjNsZLJbLRNmHq3sJEPM7Ipy8st/sGGVCnr52uOzPAgn4FM6wRNwyUCZQee9UvSZtfUxu2mlFowKj1Byw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LHMDwvv46rBKThaqSqCUdebu9WeFZbWgaZ2tLVoLzwA=;
 b=Aq5a7+PewbMth6871HBPSc4V0HyrWU5AdPTQaQZUZQ2UWx0wINRIuXSZq8CDCR5PnOPjKJQ1EPWazNsNz3Yb4hoFtKau1quTzGQfJWRdAA7a46xqVWGiXhRYqmgpDpo1lk+/hheHdgWaPAe2hURykMK+6JV7dP/WX1Pqu4B55j//x/hktWDqR1Cs2zctKWVb10NeJZAu7LDaNmnAcsvT+HBBKW8SBUfrR8I9euOe8PFwPSDKB2vBNTrXTbssk6nIBjK3j3kTrR5pYsIDqqZCWbDxOMBIapSoEOIlOUZ8NoTq8S75US5YhkOneuSwMuBKJaflwNHUM+tbbaYFaJk4lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LHMDwvv46rBKThaqSqCUdebu9WeFZbWgaZ2tLVoLzwA=;
 b=VbqoHKec+aRXDPyPtUhyVpFhdrkq/6Y1PKITc7G+Qw2HhsnKJGKtLwbCe4eSqjsoVX9rBMINYWPg2Mg/aWipch9ffEOzg/xhRXZGL9PMBidcsrI29VkkbWCtOoO8AyDWTW0jrdPDoSQcWAK8OXDHXJE4M8gmb2Jzi3pXnMkv0Ys=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9dc1d91c-52e2-4cd9-a234-6d6ca6ecceb8@citrix.com>
Date: Tue, 4 Aug 2026 19:55:24 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Frediano Ziglio
 <frediano.ziglio@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 2/2] CI: Check save/restore of PV domain as part of
 qemu-alpine-x86_64
To: Frediano Ziglio <freddy77@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20260804174219.835096-1-frediano.ziglio@citrix.com>
 <20260804174219.835096-3-frediano.ziglio@citrix.com>
 <anIn7VAt2oQJ90Js@mail-itl>
 <CAHt6W4eCdqp2NDzjHyQ9vdezJkjVyxTwJH7HuReVxVSihox0Rw@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CAHt6W4eCdqp2NDzjHyQ9vdezJkjVyxTwJH7HuReVxVSihox0Rw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0080.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY1PR03MB7995:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e90e035-2a8f-4b54-96b2-08def259f28d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	2d3jkuSSTnxtuym8yOyTGKhGiwR8/uP8JwQ2QQcDJT9v6zWoamsZPrY7yaPsS/snij9W2pvGtjQbL9qeSoLCjnO3yFCDx1nVmgg7wv3EfnmPqKye4eHd8+QwGz7YEVCKOpee/06WJ4adcetwnyAyvmeNO9h53gmDhVNb6R20bHk3yTJ8ZkmMIO+2YtAqyZ8VDtTrdGdDA8bbgjWpp6efkGpXposXXb+QvbVxk5b8YzrcoaJgVxEI2egwcKEInyt+2yDkarWp79xsBTwWrDOtnNcGEitbNCsC0drMnVtxhHrFcFzPT9eVyFWjwav3hoMjxGPQ9LxnTimCUWh/VGSwkaILAmm4G5+uduFie1HaRO/WxGCpnbHx21pDpTcLhxt0NzJdXzLignE3ClXzuJRXrbIkk50J8f4jwqhCxr7dVIbhm8V/nxxJX32HMQFyDMDDOKoN1OuoQHwA8eUY462gCuyat2bxhgxbvUTSQ3mrW33wF3rcwH41eD9r4F8urN2eGQdNiUUwvl2pI+HC1EpaNtG6v0PBqDzWTZANdhnj3k65+ME/dIvLu6Pk0lDrqvbFA9OR/zxdZjiL9y580kMthRlk1updcDX0gRZXmgMoXAp27WQXOa1X2J/q4zuH1yNxbqV0/gOSVo5hwulSJh8D1C/U9xAcJWkugGhw9Fz+0IY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWxuR0hZQk1UZHBHem5odXVEWEdpajA4a3gxUll1WFo0Mzk5V1d5bXl0bEZE?=
 =?utf-8?B?SHdQMWlPakE5aExGeDlkTjRKcDdaaHkzRXpGNGJXdXZFRHN3SWpHb2REaGtS?=
 =?utf-8?B?MWQyV1ljajBmR2hCQkxGeTQwK29VU1hyZGVaSnVWMm9QWXpKQ1c2MmxVMXJp?=
 =?utf-8?B?bTkzaVlNYVUxcXlnak42T1B5YXEvbU9yV1dkcmVLeVo0NCtMcFRhWVlRN0xV?=
 =?utf-8?B?c3MrRWNZWG0wRWFvTkJ1U0FGaVJ6UFozVjZWdUFmdE1NdkNoU2hrSkxramdL?=
 =?utf-8?B?RzRFUHNyQWxYUTlqRVkwMUdRZ0taa21PYVdCS0U5VHB6ZnlINkNSd0RHNUVR?=
 =?utf-8?B?NW5KVDVzVStBeTR6TWtvWFgrTGZwVGtvTUZ3NnFqYVA2Rmxqdk5wMWNTTndF?=
 =?utf-8?B?UzFxeEk5TGgxNE5hTkxUcEtZU1ZNT1J3NmhQcTNSbWlQYUtrK0VhSzhrd1BB?=
 =?utf-8?B?RnhCMXJ3eEJCakV4MkZxeVVrWCswWUhuOUx2SWZObFFLcGpZQ29sOWZ2aEho?=
 =?utf-8?B?WlMvcGcxTTcyUXNVOHV6ZDJGYzV3ZXRmTlZBc1R3a0N3Z0JYbDdGck9tZTg5?=
 =?utf-8?B?RzZ4aFFTdGFXY1I0K3FWbEVzTzk1S2tWVTlyd3Mzd0w5SWNOV1liYmE2akFL?=
 =?utf-8?B?bk1ZU2pjVW9nd1lxbFFIMEVjRC9uQXJTQUc0V1lnS1BDNXkvdWt1NGMyZVNI?=
 =?utf-8?B?NFgwWFlIVXpxSVVOaW5LTE55WG51NXRuSm54Yms5Y2dkUVJZSUxWNzR0SzMy?=
 =?utf-8?B?bW8zeUsyQ3EyTktwZFJOeEUwU1AxYmVNY0pkU0lkTlFaczZJODU5TDVsSzRs?=
 =?utf-8?B?VTl2OHpaaVBMQ1p2VzdBR2hjM2dNMlp4OGtQaGtRR0Fob2J2ZitQbVU2M0VW?=
 =?utf-8?B?VWVCbnVMM3RjdEQzaWZOTm10KytHVVBudEt2dldKTXJqajVWYUR4MEwxWjQ4?=
 =?utf-8?B?aFp6NEE0c0FRMXA5dm02M01PTHBhSTRqTzVzeGd2M3VIMjEyUUE0b2hkdEE2?=
 =?utf-8?B?UDVOU2s5NXM0dXpjZ2txZmRLWWF0UDNBWXV1L1NTTjdHQUw4OW9oL3E0bzN2?=
 =?utf-8?B?TDM5UFNrZkpqY2RZUjArSktHZnI4MTFjVUdLd1BKRU5kdk15QTgxM0JaVmVw?=
 =?utf-8?B?NmYxRmVkZWxGbkQvSWdPNnh1cTRFYUxrU0taQUR1UjRPVVdCK0pTMy9IZ0gv?=
 =?utf-8?B?c1NOLzk0YWpSUnVQdHViOHFWM2IzNThkWE1CQVFoY3hyckF0bXBQN3dwNXVi?=
 =?utf-8?B?UnBWUXlLSzVDMCszRmpqV1lRMHVSOU1jZENTSmRDenB4K3c1MnRLM1NNV2x6?=
 =?utf-8?B?WjRSTldMblRsT2hoNzFYcEhkZHZ4UmRKRS85aC9GRVk2bUdmQ0RtTjF1aHNi?=
 =?utf-8?B?TEFkSW1FcCtTL0UxbW5iOW1GWm5nTGRYMERFVHJSNUhzWUJZS1lnY1N0STc2?=
 =?utf-8?B?S1ZXK1NIRThNdHEySGpwdk40TFJGVHYrMXh4YjVKUTRteHV3ZVBUclZQMCtk?=
 =?utf-8?B?UjJoUiszbllBK0dDdGJGaFZWNmNyREp6Y2MrRExTelplZVJWcHpBRVRnTEFK?=
 =?utf-8?B?L1BDWHlBOFlYUVEvRXhmVWhtNHhmYlIxcWoveUxVbXJLMi9aQ2I5K2ozaVRZ?=
 =?utf-8?B?WDluck4yQTlTbUNlRFZ6ZEVxZWtERS9JTUVWQ3lTZ1FxMW9NdDJRZ2gyM21a?=
 =?utf-8?B?T0ozVDc5Vkw4UFJOb3NiWWxHM29Db0dPSVlxUEtSNkE4Tm1pT2pVb3NtcUFz?=
 =?utf-8?B?QzE5em1GVFphOHBoUENyT1RwVlg2bndRVUt0dGdBd2JCUmUvY24rQmpoQkNT?=
 =?utf-8?B?K3c3K3VhUzN1VW9wUkZMb2tNYlVyTUZuR09pNUJINUhRU3RyRGI2Wjg4alI5?=
 =?utf-8?B?dzhXTnh4YUFhU2hndDRNTFpjVDVUbUI2Y1ZzZEVRcVZROXkybStHQUMrMjdE?=
 =?utf-8?B?eUlrOTNoR3FDaXZXeVpCNE1ZTStLU2puNGU1c2FSTzRPYURVOXFoMmpjSTE1?=
 =?utf-8?B?SzFmczBQZi9tQjU5UVAvdGdGdnpGNXZtd2xIN1NlVit3SmpPTTRidW9EcFJn?=
 =?utf-8?B?RmdjR1lkcFJxRU9NV2k0MHBFUWxVUTgzd2Vza3NvU3VjMmJON3pzaDNMaS8x?=
 =?utf-8?B?dUcwZ0RkMTFxSUkrcFVyUDBFaGhIQmlZaXlDM2Y4NXRFWFQ1aXJ6WklscGhZ?=
 =?utf-8?B?WVBPYkhpc0ZWVlhWcFg3TnRIbmZKN292cDN3TGxWeDRISnpTa3lySGQ4cFBX?=
 =?utf-8?B?d0VzNGdqWW9aY3JZR2RkcXl2YnN0dGwrV1JZR2RvTFZKTG1TQWVBMU5VTjla?=
 =?utf-8?B?T01aaU5UelRvT0hlVmlaK2dISHZPTFRQMVN5VjVwUU9MeGZaVDd2QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e90e035-2a8f-4b54-96b2-08def259f28d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 18:55:26.9931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pE1s3349156D1QcXMj4OXAQiych3b69FZkindCdiL5S+3EC6jNIIK/DQOAgRtJbtgkG7Yy9VC1sB3Av+/MJ54DzsV1k4xOq3G2cFGe6v2cQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7995
X-purgate-ID: tlsNG-33051d/1785869733-76CF84E9-BF4B4530/0/0
X-purgate-type: clean
X-purgate-size: 3987

On 04/08/2026 7:48 pm, Frediano Ziglio wrote:
> On Tue, 4 Aug 2026 at 18:57, Marek Marczykowski-Górecki
> <marmarek@invisiblethingslab.com> wrote:
>> On Tue, Aug 04, 2026 at 06:42:18PM +0100, Frediano Ziglio wrote:
>>> Make sure that save/restore continue to work.
>>> The check save and restore twice to check for corrupted status.
>>> Also a command is launched in the guest to make sure that the
>>> machine is not crashed but working.
>>>
>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
>>> ---
>>>  automation/scripts/console.exp           |  8 +++++
>>>  automation/scripts/qemu-alpine-x86_64.sh | 40 ++++++++++++++++++++++--
>>>  2 files changed, 46 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/automation/scripts/console.exp b/automation/scripts/console.exp
>>> index e27886bbef..ff58ed29b8 100755
>>> --- a/automation/scripts/console.exp
>>> +++ b/automation/scripts/console.exp
>>> @@ -58,6 +58,14 @@ if {[info exists env(WAKEUP_CMD)]} {
>>>      system "$env(WAKEUP_CMD)"
>>>  }
>>>
>>> +if {[info exists env(EXPECT_TEXTS)]} {
>>> +    set lines [split "$env(EXPECT_TEXTS)" "\n"]
>>> +    foreach {exp snd} $lines {
>>> +        expect -re "$exp"
>>> +        send "$snd\n"
>>> +    }
>>> +}
>>> +
>>>  if {[info exists env(LOG_MSG)]} {
>>>      expect {
>>>          -notransfer -re "$env(PASSED)" {
>>> diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
>>> index 60f5cc49fc..409a601c34 100755
>>> --- a/automation/scripts/qemu-alpine-x86_64.sh
>>> +++ b/automation/scripts/qemu-alpine-x86_64.sh
>>> @@ -48,6 +48,28 @@ xl -vvv create -c /root/domU.cfg
>>>
>>>  " > etc/local.d/xen.start
>>>  chmod +x etc/local.d/xen.start
>>> +
>>> +# Script to test save and restore.
>>> +# It saves and restores domU domain twice to check if the domain was corrupted
>>> +# during the first sequence.
>>> +# At the end open the console to check if the domain is working.
>>> +cat > root/save_restore_test << "EOF"
>>> +#!/bin/sh
>>> +set -ex
>>> +xl list | grep -q domU
>>> +rm -f save.dat
>>> +xl save "$(xl list | awk '$1=="domU" { print $2 }')" save.dat /root/domU.cfg
>>> +xl restore /root/domU.cfg save.dat
>>> +xl list | grep -q domU
>>> +rm -f save.dat
>>> +xl save "$(xl list | awk '$1=="domU" { print $2 }')" save.dat /root/domU.cfg
>>> +xl restore /root/domU.cfg save.dat
>>> +xl list | grep -q domU
>>> +rm -f save.dat
>>> +xl console "$(xl list | awk '$1=="domU" { print $2 }')"
>>> +EOF
>>> +chmod +x root/save_restore_test
>>> +
>>>  find . | cpio -R 0:0 -H newc -o | gzip >> ../dom0-rootfs.cpio.gz
>>>  cd ../..
>>>
>>> @@ -70,9 +92,23 @@ export TEST_CMD="qemu-system-x86_64 \
>>>      -device virtio-net-pci,netdev=n0 \
>>>      -netdev user,id=n0,tftp=binaries,bootfile=/pxelinux.0"
>>>
>>> +# Sequence of expect/send strings:
>>> +# 1. wait domain start and close console;
>>> +# 2. wait login prompt and login as root
>>> +# 3. wait login and launch save/restore test;
>>> +# 4. wait restore from domain console and send a command.
>> Why doing this interactively over serial, instead of adding to
>> etc/local.d/xen.start and then printing test result at the end?
>>
> I'm using expect to interact with the console. expect is not available
> inside the alpine root filesystem.
> Some failure I had during migration is that the VM crashed. In the
> script I interact with the console to check that the VM is still able
> to run commands.

We can add `expect` to the dom0 root filesystem if we find a need for
it, and it looks like this might be a good enough reason.  You want a
patch to https://gitlab.com/xen-project/hardware/test-artifacts
images/alpine/*-x86_64-base.dockerfile to get it included.

But, for migration testing, this really wants to run on the real
hardware.  Besides the main memory image, there's variations in register
state and validity which will vary between hardware.

~Andrew

