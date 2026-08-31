Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A058DC61DD3
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2026 19:14:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404354.1638074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x17SO-000317-5W; Mon, 31 Aug 2026 19:14:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404354.1638074; Mon, 31 Aug 2026 19:14:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x17SO-00030z-28; Mon, 31 Aug 2026 19:14:12 +0000
Received: by outflank-mailman (input) for mailman id 1404354;
 Mon, 31 Aug 2026 19:14:10 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x17SL-00030t-Sr
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 19:14:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x17SK-005m3j-HI
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 21:14:08 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a95d263-2eae-0a2a0a5409dd-0a2a450cb254-28
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 21:14:08 +0200
Received: from [52.101.53.31]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a95d27e-f479-0a2a450c0019-3465351f733a-3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 21:14:07 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH0PR03MB6163.namprd03.prod.outlook.com (2603:10b6:610:d2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 19:14:03 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 19:14:03 +0000
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
 b=v+QmqeSmU+OI1Wg4DF1x9V0ifJBQh9d1qiZka8LVMditbyO39+zhnVGFpvhtCZeaxDx4kuxaFyv3yYb+ffOHsdoo7EPWmNh5/i2QN7OlL7FlVtnPBn00ADraICD0/3DnphQW4cS2RL/PS5xpEXvwZclMbuF+yVjLIHCkkfkeqqiMpUldI7xPDmMK19WKPzcRZGI8Z3/FzCTKtJEIXbgmW1yPgyJcEuKLhSKILRmo4+sQfzlJ6wWaACPhBkM94QDW3GRJRedJFxWxpnpPzGdaMv/rKI5Zx3Mi5kfsM/vJMan2R43oqj2NeA9GBApf/KBwfvcy8906xNOPwcM5RmvLeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hasiMGvSWOnhhlezsOC8sWqiCwztqsJ9genIk9j2i/k=;
 b=bpIGIS442Rhk3rbp81bQ9t8NtiPTH2w2/myEZj3Z3JNUAaBukyK2sV90mGAh9YBec7kSpYz8PB10psuL2NuteD3acgY3kD4NsZe3N1tDJ/VCPNVeIYt84BytpxI+kUi+uJ89ZgNKWvPV3IMwda+gZxGIeB0ARJT+2VUK3TRE+KXghSGFMntS8MP7xhK+Buc7e0sRNKs2SyaPsTyLCb7e7UYGb9ty42bg8mcGmVAqyz9Z9IvJeMfiYWT+cdC3PVl4XKnOjDIEOyQLcHONsyREG0fuyqx4bYnYs10QYaqmeio+E0bVI/QJzXIhhplhXGQXxWth7ztH+Mqm64JZzvE2Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hasiMGvSWOnhhlezsOC8sWqiCwztqsJ9genIk9j2i/k=;
 b=AOfY7Kwedp4NdZcmq54XkocjKIyvvZKRX4l9MfDCUXMh0z0sm5MqEnEwpiPMgAEDpzOPmQjE2cBDLGo85Mhw79K3ASZCW0ubcg+7gPLJZG1Km+CToZVFKu+nQyp21MfLVh6u62tM2msFXgC0bAMp3mr15ID5Y98oMA+C77WS4Bo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <66fc1415-df9e-41c2-b3ae-78305814cbfc@citrix.com>
Date: Mon, 31 Aug 2026 20:13:59 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH 04/12] x86: add noreturn in a few more places
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
 <d0f991de-db67-4f49-aef0-25c590b3889e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d0f991de-db67-4f49-aef0-25c590b3889e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0045.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::21) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH0PR03MB6163:EE_
X-MS-Office365-Filtering-Correlation-Id: a78bae3c-0a7d-4a9f-b833-08df079404fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|6133799003|56012099006|10067099003|4143699003|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DnTWbh4urRLZQeqqyhK1GDJXMb9pzLyFv52HbFSuHlJLZycD3ub+aVo8o9oqZPpusXCMfJDkdcpvqy9mly+t/DMiMKiL8nxBh74c15utIiFUgVfCEWG59ZBEFI5qrx+DCuwcIOwkfduv4Efl4XyWrMB6g9q9JtcNbwYbwIXB/b7fWnLH0DPlXFa0G2yFhc4tG+AXYZhUZEndonEjhp7pPP4ltNVWQiDNUpwSS/PIm4ZHifLToL7PNdjgx3tui0wMyotYcVdAkkHCT8zoSVR0olO1jtqKRqR9Tmjm1omPOPl95FT99qm+v3btH/Vsu4k3vykq87smLKpj9LA0dKY4BOIa4x+QKx2DA0b+Gp4gj3SzfeAL+4yHvknwEH5OTuKumZu6OG0df033bNWf0v3xGUgB0L4tH2BmWDv6W9ogK6Dh7ogi4ElqcEiw1sOESnyEobKK5+XCe0YbFlFPCPFUc36v7R7d8UMGwwQb/n8y7mmG0cTAEdNVNPuy6BAf2RR3cd+UVV/lOfNi1HrxuySsDcwKbD6LpPxn4CHl34CnW4Jesx6H+EOxu3ozb1lg7bcZBfMKljITzzYIy2anVpc6chukJMOtPYHD8a/P+Pg0Ov+WMbq9yM6AbHJIKFIrABTfnY0tTeG5o15DQRjBnmLRgnzVO+I5/JX9/hpaBxMaEaw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(56012099006)(10067099003)(4143699003)(5023799004)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3pVWTgzcHRJYktNZW5pMHIwVmZrdU4rVEthNzZKTWVvUDRrWDI1cFgzR0RJ?=
 =?utf-8?B?YmMxM010bUhIN2RXNlhacjlUZ1ZHWlhUcXY0ZjhvN2gyOEwxUzFYSWtoUjhJ?=
 =?utf-8?B?T0RBT01yYnhFSkpMZDZZVkdxUE1CUGlNekRlUnh1bXQyNVo0M1YwVXU1M0pL?=
 =?utf-8?B?aDlzQ1BEdTZocjJKQXJnR3FOVzZlNmgyVk90aGs5U0orMWNIY3dtREo0bnQz?=
 =?utf-8?B?TTU3eTJNb04rWWpFeXN1K3JUakxRR3VPVmw0d0pvcUNLWHhuRllQbnFLVmNH?=
 =?utf-8?B?bjNORFo2R0xPVmExTWRPbEJVT0h3N0hTWnhjK3R1U1F6bHBHSzhlOE14UGZ2?=
 =?utf-8?B?Zk4zSUNVWVNpSG8xanBXbFJNdHkvN1BOTys0WTVtZG0rVFlqU0h1c1pMck93?=
 =?utf-8?B?VFBkZ3AzMHpxeC9ZbGFyamhseXhaK3dKL2c1amVQMEdzc3BtVmowMW9POTVm?=
 =?utf-8?B?bUJiaE1SL1pIS25JbG9vMUFHZkVrT0trYnVOQ1JFbHZ2SXlidjdlV0drZFAw?=
 =?utf-8?B?MTdaaG5JM1lpOGtUQitJcXVzOENDbFN5dUZwZGFvTFlESzBMenVmQXN6UXJG?=
 =?utf-8?B?MTVGajFNMjdyWUdFR3BVVkFTYklZb3duVGV0TnJ5ZU1ySmxhNFJkVkxLZUY3?=
 =?utf-8?B?Tm9hSlY4SUQ2UG4yRUt1RmkrT1RJc24rUXBwWUZkcVdwNkpWWTJVVFByVC9z?=
 =?utf-8?B?TkhKOG42L3FlTXlEc3EzajlMNXA5U3owZkdaTzZ5UERqbldyTUhmVE1SSUc1?=
 =?utf-8?B?QnJuWjJ5c1B3UXVBVmE3TVZ4UmRhOHdFY3dlYXEvOVBHRUphSm4yUm82Wlpz?=
 =?utf-8?B?VDBsUWlrZUZ5aVhLeHZyRCtoQTBnU2xaOGFIb3RXcXhpT1BMa2J3VzVTSHJF?=
 =?utf-8?B?ZG5KMHZJRE9mT1RWQ1RDZWc3d2dpbEM4bVJCR201MWJVaG1RTVlXVS9JZ0tl?=
 =?utf-8?B?ZnIxZHVHUFQyRmJybnRNTUtHeDZNSnl4a1ZOQktWVFRjeC9DU2Uyc3RrcGJP?=
 =?utf-8?B?UEk4TStsV01TWFJKV0dWa3F6cmNpeDRqZldQUHUwTXVXSzdZNFVRdytJNGVN?=
 =?utf-8?B?dXNqL2FrSVFKcGorN3laQlR3MTdjN3dDL0h6elkvUCs0WWJWS1lwWm1wcmN4?=
 =?utf-8?B?NFNYTFczTDVNeHNhM3hIdTdtRlpmWWNoejUyOXQ2ZloyRlhKQm8rYkhGS0Ji?=
 =?utf-8?B?QVNQR2pTd1IzOWFFSVZXbWgxbmRmR0tma1RQRVBvQ1ZKV3loUjJCL2dzSito?=
 =?utf-8?B?K1ZKR3lPMUtxVFp3TUYxOTJRS2FjWnNsU3hyUDZUTlV5UEkrRFkwUnZQRmFB?=
 =?utf-8?B?SmlQZC9HeWxqdzRqZmdPcEFLT1hpSThXTFJHcDlaWFdVTGIwalQraExKQVBl?=
 =?utf-8?B?NGQwamphdk9udXlJYjFpTks4NzJLNzRHRVd4MVo4Mmd0Y0JLSnBaaGRNZ1Q4?=
 =?utf-8?B?eHdud3J1YjVhNDdTUXg3b2RZOWR5anRDQ3p3Zk9vSUl2MVQ3WVBZY3pYeERj?=
 =?utf-8?B?N2FRN1o1bEVscDQwSmREcnZHeE5rTUpPcHF5N1hHcmJucHljdnBWNzlkRThj?=
 =?utf-8?B?VU53enJseU9kUTNEaFAvVUxpT053TVY1c0g3OHhHL1FQazZWVWtDT1FoN0NR?=
 =?utf-8?B?eTN1WFdwU0g1VjMwSnEwYnNna1E3VG14dlRzSTdIZlVyaGREaVloamFaZnIr?=
 =?utf-8?B?cXlRWERhZnNQZ1I3TTVtcHI3U0ZyUllocEpSL2FvTlNNNDl4MVl0cWwzNk9l?=
 =?utf-8?B?aDNnN3FXdnlCSDYyeXN0MGxqT3BHbHB1NzltZXQrMjRqc21PY3c3NFlwZm1i?=
 =?utf-8?B?Umx2U2pmbkh5Mmp6Y0d2TjVNQXYxUEVZQzNQOEp6YTdxbnNreHh0K3pQemJu?=
 =?utf-8?B?K3FFY3o0anJkR3cwVWxPdkd1czNyUE40TmlDVnEvaERMNXdVWk03L0JMQ2g2?=
 =?utf-8?B?dWxyNk1LQ1FIbHFSZ2hFM0JkdUNwRDJUZkRKN3lpVlpWUHRvNUJ5em9qamRK?=
 =?utf-8?B?N1Q5T3dqYjBFcE82dURtTHpHRUdrQ3Q5WURnbmVra0xISTF6b0oxYUJLNDhO?=
 =?utf-8?B?ZXN4dVY0Y2RTN2VHMElpbXVhekVCWXM2SFdEakpnc2ZGdGJyOW4zUE8wK01D?=
 =?utf-8?B?dWRxUzB1Q3JHY3lkeDllSGE4N0VONlM0V2o2N1ZEZWlEWmVQT0daN1VHa3hX?=
 =?utf-8?B?Y3QyUjlPV1ZtMGFsUHZvSDlyc3JwcU5SbkZ5T2VyTUJhM0IzQ3lHaGJRaU0x?=
 =?utf-8?B?U3E3bUVDeDZ0Y3VucGpEY1ZESXZsUDhWTEVjZmtGZGh0cVRLZE4vTGIydFFw?=
 =?utf-8?B?a1VDUlFBcDB6T0lGYTRwRWtZZGJtYjdRalkrNXpXRW5IMlpvNXJidz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a78bae3c-0a7d-4a9f-b833-08df079404fc
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 19:14:03.2403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +hk4sPfFufHYnM6ihriOzPNHIYaB3YHC3hpp+aFYSYec7CGfrtPvP25lT5dvO+ccs8yJN/QF7x0ZBrCPgiWH5OSrIfmpPSlx0+vpgfBZLxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6163
X-purgate-ID: tlsNG-d25034/1788203648-50321A5B-B7C56ABE/0/0
X-purgate-type: clean
X-purgate-size: 1582

On 28/08/2026 8:01 am, Jan Beulich wrote:
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -2304,7 +2304,7 @@ void asmlinkage entry_from_pv(struct cpu
>      case X86_ET_HW_EXC:
>          switch ( vec )
>          {
> -        case X86_EXC_DF: return do_double_fault(regs);
> +        case X86_EXC_DF: do_double_fault(regs); /* noreturn */
>          case X86_EXC_MC: return do_machine_check(regs);
>          }
>          break;
> @@ -2615,7 +2615,7 @@ void asmlinkage entry_from_xen(struct cp
>      case X86_ET_HW_EXC:
>          switch ( regs->fred_ss.vector )
>          {
> -        case X86_EXC_DF: return do_double_fault(regs);
> +        case X86_EXC_DF: do_double_fault(regs); /* noreturn */
>          case X86_EXC_MC: return do_machine_check(regs);
>          }
>          break;
>

For starters you're missing a break, and the only reason this isn't a
compile error is the trailing comment.  Second, it's a tailcall anyway. 
There really is nothing unreachable anywhere in this construct.

But by far the most important, it the singular noreturn attribute on
do_double_fault() (elsewhere, and not visible when reading these two
functions) which is preventing #DF falling into #MC.   This introduces
fragility which did not exist previously.

do_double_fault() would conditionally return if we ever got around to
fixing espfix64.

So no - I'm going to insist that Eclair is taught to accept "return
some_noreturn_fn();" as intentional.  It is objectively less fragile
than the MISRA-preferred option.

~Andrew

