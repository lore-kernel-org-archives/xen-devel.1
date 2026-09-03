Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2D6C624A4
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 13:36:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407186.1640281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x27bX-0004l6-Eu; Thu, 03 Sep 2026 13:35:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407186.1640281; Thu, 03 Sep 2026 13:35:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x27bX-0004kz-C2; Thu, 03 Sep 2026 13:35:47 +0000
Received: by outflank-mailman (input) for mailman id 1407186;
 Thu, 03 Sep 2026 13:35:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1x27bW-0004kt-8i
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 13:35:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x27bV-00Ad7F-Kg
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 15:35:45 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a9977b1-2eae-0a2a0a5409dd-0a2a45058140-2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 15:35:45 +0200
Received: from [40.107.209.64]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a9977af-4cb1-0a2a45050019-286bd140c5ef-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 15:35:45 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by IA1PR03MB8062.namprd03.prod.outlook.com (2603:10b6:208:595::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 13:35:40 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0382.007; Thu, 3 Sep 2026
 13:35:40 +0000
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
 b=FzKMWBY2ROvImy8RsNbZDqrnj6VV3x21Q6PP2A7Jcw/z08oGGAf6CRTPn5JaxYLRkptT1YNmhzOJPBuidanZsYVKZrKtydle/TYpUbqCZKArhegDdj4iFQ1FdONsib9VGYzKLpMQ/12uSJGPKiKK1SDhn1WB9/dAFa0/xkc8EKP7Ln9UpyiocJEVZX+1+hWkjD4KLACGYXmbifVcJ4afXYjUCZUbQ2+dQO8qqf9ngkBe9EGgNefU3f7AT3gyiTYlzycMDOtuphtqXrPTD+2sxmsy+8AnbXRHWgRqqWdlkmY7kTev08/nmKdIRcowA7q3Gjs8/nD+INZMXYF2kKdR5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1ndxIMHm+9Fc252ktH03lLK6XaDXQ6ekAlPo8ysQZI=;
 b=e8jIgvu/ucn+Tb0Z4+oTOHX1y/C8DHZ5EIqnInObHRyRSU5w7+uHbV4IyLwTd+EFIjSoMye76yHUgAqNKkP9ArHN2m+UugTdtlNcFBxYyu1bBdkkOtcguDu2kyiLkUcwN45uBUQzXCkc9fBWISaEGZMWlGb1QC+pVt0SVaw4IlzVuOA7e4Ta/qXADvj0KEGQ1cpKeMFAdkaO4fuGujYOX42tQPBDFAgGGepkXQ36+L07p8RAHI0wUNLyUz5LyFSDEdMinjz5uYkKYarWwSinfaqKdb8lFhAPCtJ5ssTgERhyJRV4wE8H95nnKNLvZmX3wOzVx7+nKkBeW1SS4oJp7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1ndxIMHm+9Fc252ktH03lLK6XaDXQ6ekAlPo8ysQZI=;
 b=kq8aLX2un+o187JdOCCzJxiK8Tymy8koV9U8SZTIQJnVwPVECibYZ1UTlcfRscEk/J5S7MITJM1YYVLxk6yaDIx8tY3X1isMERf2pAzx5AZiAtK0qXKSawTnd2uudtZCWHNqUUC/4EMEc+OxF+525XPfN9wFOnoW6app55u0eNo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a79edb3f-0ff1-4583-b091-745e38ac2f8e@citrix.com>
Date: Thu, 3 Sep 2026 14:35:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] x86/svm: Intercept CR0 writes selectively
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20260828141955.4009939-1-ross.lagerwall@citrix.com>
 <514b9ad4-912c-45fa-9450-3c85adaef483@suse.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <514b9ad4-912c-45fa-9450-3c85adaef483@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0389.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::16) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|IA1PR03MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: 20493461-ee20-4fc4-c15c-08df09c03f0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|11063799006|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	O3Yb9zPwchWM7nG3yj3SHUt5PpmM+0g84ZAYd5idPAaigGQKLKIf8lPSvFafIdtU0l6MvkJnfcR3t6ByhmDM7lfbMX6fnZ8zzIhf7VWwfWLKDTKbpk5Pwvi8GHYxA+sxJh3+EGVdx+nc+neM3jHQWhfx0Eh5Uvyf/ziQYeK8Ep0fACcjrxY59UMo/Z9ffls/xQyD9NvDEHDXIVYmIUGuMJJ4lbqpm6cgLe7mjNd0Il8fcX8JIlqbaYbBwwnarT2bpWlHfv6Hp5KIZRJDRsuKfTFK4lYMiOjVOlnwHTZo23vnfKJoS9SqyA+BiQ8aJp6iQuX5jG/myLAWunRgGIK6x3EQ6JQKscAfLlxMJa/BRjeIUKGzP2VfgmYhKrxO3Q5uVgkIVjWUf4vZVQxDBS3eBZbj7ATTC/wtdAMptdAcdQxFHvsnbCRzQ8jYRh8/Fez18SnD5CZbbIE5X/aUmhj4D9v3G+xLV3nygz2dnPcty2gxCrZnnVwLcQjzSBof2MRmnY2mIZWnrW41rwR9aeKzhGlN5Aym4WivGUzexmIggwAclpZmHzmLMihvA1FlYnVc/mDgM3Zx+nJbxdORb/ZsufqN7wzZHBYVgu5X3yWm2Subwfgqq31Z+AU9xx7LEMk63eq0nv11FgKpMrKZJB+N3IQCnUHR2HoDnzf8w3Xu6ok=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTRuRXA5QURCVEs3dWVtTmtmS3I4N0tqSjVyZUlUMVZrcTZWUGR5ZXc0Sjd5?=
 =?utf-8?B?ZVg3S0NteFFmZnprNTJvaUl2M0plVVo1LzNPVTZ0Q0Jxd056V3hUU0VuUjFW?=
 =?utf-8?B?eXRBaHg3S0pqekJ2c2pMMzVKandzMy9wWU02cVBZc2RjNjdVVjB3L3RDTUFK?=
 =?utf-8?B?cW54M1I2L2ZDWXB5STdGVUpwMUxTVkVFZ2x1ektJVmh0ZndsMC9ZSk1CM0JC?=
 =?utf-8?B?cFhoYlpsOW5GdFB5UFVaWjdOZVpaTXNqY3pVTU5qc2ZlNWo4K0ZjNUgvMGxU?=
 =?utf-8?B?WExsWGh1UGRwRFZZbGhmMGRrdmRlRDZVcnJTTWs5Y0RFSDEwTGg0T21nMlBR?=
 =?utf-8?B?dU5IdnY2bnllNERZRGF0ZG4xWUNuOWFBTlh2L0JZMis1NUp6cVk4WWpqSVRo?=
 =?utf-8?B?d1dieEE4VjBzd1pVb09hNWZyWUZuWDVEcldxMXFoZ0J6TFV2OHNha215Y3F2?=
 =?utf-8?B?UDIvSHl1YU02ajV1b3V4RlpzeDY3c2Q1ZERXNGdIR0xJQW11dUQ1Y0dVY25m?=
 =?utf-8?B?SDExejRoSmQ5c0JqQVZpbFROTmpUUW5PS3ZwREhzYnRVK3FqKzRwY1VtS2JT?=
 =?utf-8?B?MjF2dzdVTTB6b05tZ3kyTU5zb2doNUZ2WXJJS0MzV1BMSDlwSENCdXhUMCt1?=
 =?utf-8?B?aGJlRG5kK2lYVnkyY3BSUUxJelBQWTFjdmJYUG5mNWJCcGZvSWZCQUtYL0pZ?=
 =?utf-8?B?SGxaNEYvQ09IYjFTZ1VTb2x0N2hnM2J6RURjTjdLSDFpN2tMY21RSy9pQzAv?=
 =?utf-8?B?V0NVTTcwdzdVK2duK0IwSHlyN0pNREtQdlRzb0FTM1VYNThSSnBjeWlGaEVI?=
 =?utf-8?B?MEh2UXM2ZHhxNXBrdGZxY1VvSk1EcVB1UjczNXVxd1QwL292T1hTd01mS0hJ?=
 =?utf-8?B?TnFzVlU4WXFmNmRNdUx4RW1BNW8vSXIrWHhkWWR2dmhxMkIrRkE1ZitpQ3pM?=
 =?utf-8?B?ZXNKSDBEUFYxUUQzazl2MEt0Nmx3SUUrdVR1R2c2SGswRldPa0JjMUVJbzZL?=
 =?utf-8?B?bnpVRWh1MUFKUnFPdWc1UFd2dnZZVkQvMVBJMktueXBXblU4RFFNaWI4R1Fs?=
 =?utf-8?B?NzN3T1Q4MUpzMTIzTjQwTnl5QVFHS2NkZWNDdkhtSmpnYWFJWGNWOWZUN0dI?=
 =?utf-8?B?YjM0ZXp1WXFlMU1FUFAwbW9YVHgxVzZqQWxNU000WmFGQ3F4QVdyMVRJQkly?=
 =?utf-8?B?TTZyTHp6ZFFHUHB1WE5nVUxOVC9YdmgyMmZNNUVsZ3lzNGUxMjJkVXlMRTBj?=
 =?utf-8?B?TGlUaGhOYzJad3NWWUU5RkRod2FDMkhkZ3ZGRDhyVUVDclo1T2J4ZFozM09S?=
 =?utf-8?B?NWRTWi9EVklMK2NoVGtvOCtZYkR0VEU4YVkyb3BReWtxamQ2UEpiY254bTlX?=
 =?utf-8?B?NFI4STFjdFJIcDRRbmNYZFd5MGt5TU1KaHJZQWtYbUUya283ZDR3cTBFMWU4?=
 =?utf-8?B?bXNDTjdkNFVIY3E2VFliWmMxWU9BWWJPeHNGVVN2SUk1YjgxVjBNUTJ3WkI4?=
 =?utf-8?B?ODFsejBXZ2IvNlg4ZHhFTjg0ZDZXRzZNckh6TkVOOGdHUFdrdXFERG14UFYx?=
 =?utf-8?B?ZlZURHkxazR3djB1N0daWDJNL3V5OUxVa1ZrdFJ1QlY1cXVFcjVyUmdmcWxk?=
 =?utf-8?B?V0V2MmxLdVR4Y0dhRlNheGIrV0lIeTJmWWg4UUovR3dtRlN4VllQeTRVSGJj?=
 =?utf-8?B?bHJGdXdQN3R6ZW9maTFGVHkzc2dkYXhIdmZ4SDI3OHVQTjkrSDhSb0JuMDNK?=
 =?utf-8?B?NFpFeCtaNHYzdHRieVYvTmloaGhIRGZhQVR6MXQ3cUxJQW85eGRMUXAwbFhz?=
 =?utf-8?B?bzBVMStpL25KQm5tZ2J1ZzF4aEF5bFoxenk1YzZ0TUdXbTFhSU9yNkVWUFRR?=
 =?utf-8?B?cUxxZWk3VUJGZDFZc0dyV0JhVnJOOVhWSEptSjJYRHFpSlVhNTlFUGVaVDBI?=
 =?utf-8?B?TWNpTTZUbXFyS05LZFV0NisyRnV6ZnNmaGxrZmV6ZEY5Z1p4d3V3NHF2bnJY?=
 =?utf-8?B?TVRQYlBjOVJDZGFGQUh0SGMwdUZGVk4yTVZyRG43cW9aT1RGQTc1ZC9KUXNK?=
 =?utf-8?B?VDVLanJ1bkRrMzlpYWZHWGNoSlhENUJQdUg2cnFSVzdHOXM5Vm90Q2h3eHNQ?=
 =?utf-8?B?cC9kMzVRSlhRNFB3SW9mNkNUREc3Z3dudFIxcy91VDFZZ2c5K2llL0VrSUlh?=
 =?utf-8?B?ckR0K29GRGtVbXQ4aHVIaS81V2EyN3NqeTVXaUNqR1ExcFlQSHRyd2JxTU1U?=
 =?utf-8?B?WUVaTzRmbkpNakRtVDBnaVJaWC95ODNWVmR3REtMcTgyLzJzblp6aVYybXNM?=
 =?utf-8?B?bm5oWFdwM0hSNVIxMU1ieWNqdXFNbDhaUHhRVVErZ3FYV0ptdW9DN3RSOU4v?=
 =?utf-8?Q?9BKV736ExMZMt4g8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20493461-ee20-4fc4-c15c-08df09c03f0a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 13:35:40.7748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hO53ro/ycPgxhpyPIFsQB6h77UfPxQ8bMFFvB9lBba1HiKU9r1c3Kza58C889l5XJu5SN03yKaJb62HZ05MIqabhDOSypGpobDjJuSUcALs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8062
X-purgate-ID: tlsNG-c201ff/1788442545-251182A1-A0FD2D7F/0/0
X-purgate-type: clean
X-purgate-size: 1416

On 9/3/26 2:02 PM, Jan Beulich wrote:
> On 28.08.2026 16:19, Ross Lagerwall wrote:
>> Xen does not need to track when the TS or MP bits change so opt to
>> intercept CR0 writes selectively.
> 
> Not anymore, which may want expressing here (or else it looks as if this
> would have been possible from the start).
> 
>> Aside from potentially reducing a few
>> VMEXITs, this fixes a nested virt bug where L1 intercepts CR0_SEL_WRITE
>> and L0 intercepts CR0_WRITE. The hardware prioritizes CR0_WRITE and so
>> L1 never sees any CR0 writes.
> 
> Yet if L1 sets CR0_WRITE, since intercept masks are ORed together (if
> I'm not mistaken), ...
> 
>> @@ -2882,7 +2884,8 @@ void asmlinkage svm_vmexit_handler(void)
>>           break;
>>   
>>       case VMEXIT_CR0_READ ... VMEXIT_CR15_READ:
>> -    case VMEXIT_CR0_WRITE ... VMEXIT_CR15_WRITE:
>> +    case VMEXIT_CR1_WRITE ... VMEXIT_CR15_WRITE:
>> +    case VMEXIT_CR0_SEL_WRITE:
>>           if ( cpu_has_svm_decode && vmcb->ei.mov_cr.mov_insn )
>>               svm_vmexit_do_cr_access(vmcb, regs);
>>           else if ( !hvm_emulate_one_insn(x86_insn_is_cr_access, "CR access") )
> 
> ... we may still see VMEXIT_CR0_WRITE here (i.e. its handling cannot be
> removed).
> 

No, it shouldn't get here in that case. If L1 sets CR0_WRITE, it will enter
nestedsvm_check_intercepts() and then hit the NESTEDHVM_VMEXIT_INJECT case.

Ross

