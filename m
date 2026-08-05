Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D38EC55ABA
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 15:37:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383719.1626985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrdgM-0005yz-8W; Wed, 05 Aug 2026 15:37:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383719.1626985; Wed, 05 Aug 2026 15:37:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrdgM-0005ys-5h; Wed, 05 Aug 2026 15:37:26 +0000
Received: by outflank-mailman (input) for mailman id 1383719;
 Wed, 05 Aug 2026 15:37:25 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wrdgK-0005yW-WE
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 15:37:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrdgI-00AAlK-5V
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 17:37:22 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a7358a2-5cb7-0a2a0a5109dd-0a2a450b9a3c-26
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 17:37:22 +0200
Received: from [52.101.61.63]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a7358b0-b7e8-0a2a450b0019-34653d3f75a3-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 17:37:21 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by CO1PR03MB5937.namprd03.prod.outlook.com (2603:10b6:303:6e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 15:37:18 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%5]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 15:37:18 +0000
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
 b=UBB/a+RoHluFkJF7rGfmEJDk6AgzwRcxJRoq7DafGICkamXXhVSICKkqhOB3MsjCvhuU0Udid8dBKi30lwnfZgawuam29jkb4QRST25BJXPj2S0TIqtPlxS5+F7UQvTB6/GgB7KHZ3xSFXh8EYRxLbPvuS2MBTZFi3YpgD15xtKVpWxXGBf3dJDXbsjoYtb6L+YH6rUBqFscXgmCh0uLKPA1B2ELBh46czcIeQ29/CRCvvgz/VX8DRH6qb08+NNIj80ISGYon/f6bMvk1ePEwBvLXx3vJ0F6jCHD5RZzEzgQjbsQdLjd90Ri5M49fmHjtPF0EoaIewkHxa9samyLnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OpJuoyeWX8X4J/xCvkd6XAjCDW5W2vgxIKAaH7xIHAI=;
 b=twUR1hHZaW9NSMFEo0SBTfoeAISL0pNV31JxaV9IsWfqnFkYfp74aS4jD4na2ZGcunleT8YcMC9ilclCMJ5FoZFKDBs1LUrCGYb8lz84TUZVeSBHRr1blpUUBCqY5IkVRPx6cnPSiU0Qyihnqqj9dYZPY0DwrYPfpz+qB0B4TXwcT/xpFKx9+d56wVcalVqsHdywk4OQgaKsBBkkUGxiuUUYB2E72ykB6glMfPcA7zBHAa9iRSdcsKOs9v053HT7eaQSyyJ8KDZy6w7qRupY++2kj919ATw3o9ni9hqu2rI5n83PXcv4Chpb1IlTWARlVsi1oZ6cN4ipoT9u7msfKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OpJuoyeWX8X4J/xCvkd6XAjCDW5W2vgxIKAaH7xIHAI=;
 b=caJSxtAhrFc+rwlQZucvGQRKn/2RExporS3MtAsMo/hGHTFQrGAF03ALc9lea+jcLLRwIjrMZCH+lBd1LpO8t55+N7dDMagGm9Fz/3XiVVu9tj1O6ITHu7pzQ++n3aVuTXyg8JFeLxsjiaoSd9UVxJWk70CknnSDEOPNtm/knQ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <da3b4ee8-7c12-4fec-8d31-6f2f66bba4a8@citrix.com>
Date: Wed, 5 Aug 2026 16:37:15 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 5/5] x86/nmi: Don't configure EvtSel repeatedly
To: Jan Beulich <jbeulich@suse.com>
References: <20260805124525.105457-1-andrew.cooper3@citrix.com>
 <20260805124525.105457-6-andrew.cooper3@citrix.com>
 <d76fa0a2-1a53-4ee4-b077-d51715dba339@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d76fa0a2-1a53-4ee4-b077-d51715dba339@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0203.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::10) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|CO1PR03MB5937:EE_
X-MS-Office365-Filtering-Correlation-Id: 194fc579-9724-4c52-e1f9-08def3076ed9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|18002099003|22082099003|5023799004|11063799006|4143699003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	J1ls53dVXlI5kO3RN9tk1OcaQxcDkPasxiLwXSFrYwPq46tgNuarPaU76P72rUye/L/Wq9XBgyDvvVHyYpCvoXh1NejM0bAglJ93+r2ZFEIV6CH03K2HVl40DwJ3JnqoUgbn5u3uKaZ8CjhWbJbnitzXq1iEJ+eoVlGOgUfKT8OVbHn88NSJAkdCipWN+3c7CfvWSe7zFF9f5od1+J+NG91a2T3t3w5ELSnLxJ0pL9Ia1m/6CVvoDpUKkx725/fYVttqAzyMgvDxKxsRrAaaZOWqOmFZSOgour5zhYKlYo7S+5g5t0In+8YkYrp2IDfaCya0aJXfesUNDrMGjsJiu1+g7ouaXIXm3OVYCU6/E6BAHH8Ljjkc/IpyylNd2LRG+1WZXZOiVI5xiEFQpqWyq96Ug7QdmuF1DMIsB00VX53MOFOJhpULI+BsOx8W1ZVZcLLGeLct9bRrOCkmCtityPhZTtckQj4rswcro2xXxYFOuQ1EJu4Pq1ggv+PfbsJl/I+LYF/tSRK75i3ZiilkxLn2sq9RPNnJ4lNOtllKPIL8MzQ0B80gfY5FWzIPAAF0fmdHLbDL3geQlTHpa6EKOKPnz08pw5L8n9wQfQLaFZgFmJlGCvGEmSaJ2JtCC1F+MDzF4Qt/aaIq86vWOdtiPHrIfY94BlpZCcNBLvmA3sE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(18002099003)(22082099003)(5023799004)(11063799006)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnNINytmUFlXUmFoM3VNd3NBbHFGbGJXdWVEbWlUa0hrcUlhamh4WlRVOEIy?=
 =?utf-8?B?WXdCUk00SVJGalJ3QlBVWjRhZ2pLd2FWbXllL1dMbFN3SE4rdm41UkdieGZj?=
 =?utf-8?B?dlhtSlZnaUlTcFBVSEtyaGNVSW8vMGgvTFVNZkd4cmppL3hMV24yTDB4djV3?=
 =?utf-8?B?b1BXR0FERHVkL3hITTN2eWdiK1lGS00xWVhyejltUDNuMEdleExwbmpKOC9s?=
 =?utf-8?B?cU1oZnVxNTNESDFsRy9FMHlpZEtzU1NvUnJxeWZyZnQ0VU15aFRhdm90dGV1?=
 =?utf-8?B?NElKYUh3djJ2eXpqNTBwb0VMYjh6elYzbTM2Y3hrR2E2ZjNtWEpZRDN3ck1v?=
 =?utf-8?B?K3NPNzVycFVrUWJLN3FXOWsxaVMxbktkYWdKRFdGNEI4NG5EcnBWbnJzMnMx?=
 =?utf-8?B?SnhnOUgyVkN4L0pVdHFBSVdIamxBZkp1WDNGR0lPRjl0ZWdZTWExOWptTVNz?=
 =?utf-8?B?OW9KQVZiSS9uQ2sxSFlHVnNRTUdGMXdvdUdYNEZWTVlLenJqVENqanFWeGJT?=
 =?utf-8?B?OGxXR1FBQkVOa1E3WVAxc2hzNnVVckNUNzFMWmw4ejQvV21XaFhRWGlBNUta?=
 =?utf-8?B?TUJmdkh4NWt1M0JmM1d2cVBoY1dNa1dBaUUwL2JKWExKTTQ2RVdkSkY1STla?=
 =?utf-8?B?cDFlS2U0SGpyWHZiVC9VOGx2UGVzMEtHTUdvU0JYa0RkdzdPZ3JXdVUyakNU?=
 =?utf-8?B?ck1zNVAzbGdjMHU3KzB5dDIwMEFrTnNsOVdjRXQ0RWlqV1dSb1VWbjEzN1NG?=
 =?utf-8?B?ZGVtamdkZUpraEN0bkJOZGx4T2NxaVFlTUFOdlRqV2RVVE05bzhKd0tmQkxv?=
 =?utf-8?B?ZUJINXlOMGFQWllCUE9OajluMkRFanJOVExnWm5sbnR2em9OT1BpV1dkL20z?=
 =?utf-8?B?NmRvRHYrMDFrUnBIQjArUmtXZ2N2OFNQYWFaK2tMZ09ROXRhQ3FVY3c1NE4z?=
 =?utf-8?B?S1l6NHZ1NUtUOGh5RXYzaC9tTnJ5Uis0OTMyWXM5c1NvOXdUd1RzazlIVWl4?=
 =?utf-8?B?aCtrV09adm1wNndSam5MMU42eldQQllFQzZ2dWlmSGFURWxOdUlFcHBTTVVO?=
 =?utf-8?B?RFdnSXVXclRyOFRjOVRjSWxWVGpTTVN1NHpldGE5R3BUdEg2Yi9SV1pSWDlP?=
 =?utf-8?B?ZTdKRHd6Y3ZpdDdmdWRMZnl6Y3puZmpIS3BEbnN2UXJFQTJZL1kxRm9oUEFE?=
 =?utf-8?B?dnQvWGRGZTUzaHAzRTgwMGNJZlJ5OWhZQlVSVGdld1lhZ3NiaUl1SnJFU3hu?=
 =?utf-8?B?NXBLYmVtaTdySFVFaXNRWUxzcmNzZlFaS0VSUEpGcUNEY1pRdG5NUThYWUx2?=
 =?utf-8?B?cjk2MUQ0Q0ZxdFppb3R4Y3lxSGdMMGpVY2xQTUtKenNOMitEUW9iMTlYb3JU?=
 =?utf-8?B?UFdXVC9kNFUxMkxieXFQZjM1S2EwNFRwM2lzbFM2dkUzcDVxVk1TMFhLS3ln?=
 =?utf-8?B?UWp5d3VsNEJoVmNsd29GRTMwVW5YeG15R2R4L2RTQkI2STJBa2FoKzhmd05i?=
 =?utf-8?B?Y3VtVUhXbmNWT2xPRDVhSUR4eTdCc0s3ZWNRM0VtY2hZUEFPUlZXd2xrOXhy?=
 =?utf-8?B?Q2ZYU0grcGVtVDRzekFpSmpFS2oxREI3UFdTdG5VUzI0Z3UydER6Q0RKL2dO?=
 =?utf-8?B?WElYUlZ1NHlJZ3NMNWVaTEExdy9yK3pIUzFNRk85d1VzTldUUE83aWpldW92?=
 =?utf-8?B?bkxIVFk2cW5NZWxnLzNkT3h1dEtqK3BrbHBRY0lESE04QmZGbkhWSm1FTGo5?=
 =?utf-8?B?MFZobWg5aGU0eUtra2pxTDh6UEtiSVJZUjlRUzhpZ3BsS3RBM1V6KzdHSEJZ?=
 =?utf-8?B?UmtDdU9tWGo2T3lzd3dUaHpHVE1KMXNRVStpVTFXdGZwbmNJWE5tY0VialI2?=
 =?utf-8?B?WkhjaEp4WGNNVmVqL0hhU25tOWZPWGVQblR4Q0FRREUvT3dubGpVZW1FVEpy?=
 =?utf-8?B?VThEdFhHb2c1bTlqRFdRQTBVbWpoT29qMFhEb1RzUFdSRE1Yc1dDRGRoTTZh?=
 =?utf-8?B?MEp0UFR0RHhVUExFMFlaNWdWTXNDTUFHUzV3YkRxU1BSZzJZcnNGWTdLeXU1?=
 =?utf-8?B?cms4d0tLVnRqQzU2YW4ycThGcDlicUxOYXErZTRnd3NEaXI3Y2FFZzZhR1Nw?=
 =?utf-8?B?bjRrRTZ2NDl6RlBvTUVuWHgzUm5Vck9QQzQ5bTE3QitFRkowT0Y5ZzViQUJM?=
 =?utf-8?B?WmJYb0pPbGsyQ2prazIrZ2FCUHR5VUI5SEt0bkhCYjNKTkc0bFY2SkhkOFh3?=
 =?utf-8?B?UGJaNG5WTmd4Z3ZBNHNxR1U5RUZQOW40TS9SZVg3dmQ4NGtRYkd4Sk51Tis4?=
 =?utf-8?B?NkZmMGlrSy81MFBrVkFqWUt6YU05SVNXMVA2aCtNWDhSZUx1RDhNbnNYb0tG?=
 =?utf-8?Q?gyZiZXuaPI+x54yM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 194fc579-9724-4c52-e1f9-08def3076ed9
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 15:37:18.4413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nOqA4flYTpnk9H8GQhu7KJExGQTbxSQVDUbYgSfzCDrNE+LmKuOzsXcFU5XRwsCvjaZuI47UUEOSryyw1/yqHIiNb1FTlRINbHL4evBWdII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5937
X-purgate-ID: tlsNG-42698a/1785944242-AB0DD9EA-2C67C515/0/0
X-purgate-type: clean
X-purgate-size: 2252

On 05/08/2026 3:20 pm, Jan Beulich wrote:
> On 05.08.2026 14:45, Andrew Cooper wrote:
>> In both setup_{k7,p6}_watchdog(), EvtSel0 is first zeroed, then written with
>> everything but the enable bit, then written with the enable bit.
>>
>> setup_p4_watchdog() is slightly more complicated, owing to what
>> appears to be a bug introduced by commit 2a2bd8de16b6 ("Clean up NMI
>> watchdog handler."), which causes a second bit to be temporarily
>> different too.
>>
>> The middle of the three writes is useless in all cases.  Drop it.
> Spotting the 1st write in setup_p4_watchdog() wasn't quite as easy, as
> MSR_P4_BPU_CCCR0 (as passed to clear_msr_range()) has nothing to do with
> MSR_P4_IQ_CCCR0. Using unrelated MSR names there is as unhelpful as using
> raw hex numbers.

Perf counters on the P4 are utterly insane, but our local logic really
doesn't help matters.

Another option would be to remove P4 watchdog support, in the basis that
we really can't test it.

>
>> While doing this, rename the 'counter' parameter for
>> setup_p6_watchdog().  It is the event which is passed in; the counter
>> is always counter 0.
>>
>> No functional change.
> These sequences of writes almost look as if they were trying to cover for
> errata. Are you sufficiently sure there are none anywhere, for this to
> truly be no functional change?

There is a reason to write logic in this form; it's just not applicable
to us.

The original P6 (besides being 32bit only) had two counters, but the
enable bit was in counter 0 only and controlled both.  I.e. you needed
to write logic to program EvtSel1 without the enable bit (it is strictly
reserved), and then EvtSel0 with the enable bit, in that order.  This is
in the SDM, just well hidden.

I spoke to various people, including PeterZ who wrote the perf
infrastructure in Linux (starting with Westmere, so it never ran on P6),
and Linux has absolutely no logic of this form at all.

I am reasonably confident that it's just copy&paste without due care and
attention which has left us with the code in this form.

>  If so, ...
>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew

