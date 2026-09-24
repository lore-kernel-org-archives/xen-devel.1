Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774E3C9830E
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 15:51:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1432579.1653782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9lic-0001TZ-QZ; Thu, 24 Sep 2026 15:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1432579.1653782; Thu, 24 Sep 2026 15:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9lic-0001TS-Ni; Thu, 24 Sep 2026 15:50:42 +0000
Received: by outflank-mailman (input) for mailman id 1432579;
 Thu, 24 Sep 2026 15:50:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1x9lib-0001TM-35
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 15:50:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9lia-005oqL-G8
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 17:50:40 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ab546cc-8faa-0a2a0a5109dd-0a2a4506e544-4
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 17:50:40 +0200
Received: from [40.93.195.61]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ab546ce-195a-0a2a45060019-285dc33deb71-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 17:50:40 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by BN5PR03MB8054.namprd03.prod.outlook.com (2603:10b6:408:2ac::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 15:50:37 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0428.015; Thu, 24 Sep 2026
 15:50:37 +0000
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
 b=yFVC4DQMltpsRL4PzN6oDDwsXU4OIeWyg8kYPPKA+ETbJyunoNpZjnPmkPC2pkVwa+8cuEcL6OgvM29axdkA7FBGV7YGyNU3rW13WX278of/LtLNiF/ETjXXUeYoR6B6mB0pTRE/uMlk1kG1Fh8YZ8Yff/8zoXDi550lbCT6XdIKjiYOrr0M5OfArHmZ2LTtkeTjtWfuGO2gwktYAt5ItURZ4rGYT5gB3tGEJAlPqjg0yLZsrdc077pcmMzOeCXngZ+Fr2gBG4hKsla6q3GhUziBKEUF+qIlAx/jo3H/KdsdEZBiS+Z0f0O9HM9Zh0RmERY2E7HrkgJrRRc/OP78aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bnzNbHNp3VyIXb7hkxTft/FfzXATib4lEj8daziz1rw=;
 b=hjVHE9Qkpui9bI3cajPD6oTQ7jDpC/bb+kxDh2XOhpR52YfKx6vzkLNVBxZ0Fy69PXQ8L+u3nnB6T7BRtwseKdDzxcEbsSZ3xzHUhWzzZeKLQ+jiFI+SmzCtOXY1ho4abmyZ1mrV2thWyH1Peu60l0SDgfMb3jS9mU20EJySn0HCUgfs4fUUOacP2ppg3jgu8rbwny8JzMfglXv020Qzrall5dNIsP775WEeQK39yTw7Q/6gNqEGXq60xOvTWhWNF1Ot9S7Jjd183aEzIbcAJ8+tEZsrNihref8uVUN+pzcdPVRv132GD5mCylpzXlMrbOrLD8Z/ylo2JNiVEmu+IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bnzNbHNp3VyIXb7hkxTft/FfzXATib4lEj8daziz1rw=;
 b=W6EQyjOP65lFi7+rUhDBV7mbVep+Orf6NOK8v5FDyxBY1Aw8wiffp0S1mZ77arGC5C2rJtrpK2+YAmwbwkDkpiUKY5b5MATnLqCRhIkvdD3t5sdJruhxYfHrSQMSm9nJO9EeOSgmqCzbUA4KDAFU8xK7KLl0/ArE4fymIEre1LM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <70bd67f8-fbe2-44e2-a050-b6065ba2de7f@citrix.com>
Date: Thu, 24 Sep 2026 16:50:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/nSVM: Save L2's CR4 on #VMEXIT, not Xen's
To: Jan Beulich <jbeulich@suse.com>, Lin Liu <lin.liu01@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <a5702b9bc1d354dac5778deacbc397e76530408a.1790069475.git.lin.liu01@citrix.com>
 <38c41bfb-48c6-4408-8da1-2b7d730a6c9e@citrix.com>
 <711e6af5-beca-4b71-a2cb-75cb1ed93689@suse.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <711e6af5-beca-4b71-a2cb-75cb1ed93689@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0098.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::13) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|BN5PR03MB8054:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b9f0825-0bfe-46e2-5193-08df1a539397
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4dKF3NWiKJNO+t4lOIr0MgtXMHzWNTFNXIw2fkzSdK3LTsoo2vJllzFTs2z0XAJXVqSH1+FM8h1qNS26HaTxXBy/FpWpDlDw6x2LG1oxUlUQ6qUdJ4lPrBipGrmBBOt07W/2qgoZ2nR9B0B45o+keAiyjjZImXfKAIFXvuGZyEofRLjRiy+E3eNe02boqnc3A8Z33B4s+c9RHwgTOEwAsIO1wznq4YkqX/MYHU/4a8Refra+dGX47n3tGytKR2KWlExBXwG4xejYraw6urUxOr7G+dpfvVT3XWd0UItSIMnS+wb+FT1ZkyMyRJsuMPoJgY6xrVKMlZdqAR/NHe1L6xSccs8vKUhbUofAivB84MwBHj3Q86GkxcFn1vEH5bDy2RDZCR/4tzIfNh44iKP5rt7bmU4TwkfF7Eknb6dyfNUVsxXmg1b1HT1SYlJsle62WbgAbOhvDV4T8M/ui8gkaIpyF470m5x+wH0QKT5tVfp6bJpL0nkveGii+a1xU0Wpt3cpL81U7qTUi37XkLuyl0aY+izM6KpJ18/MY4BtJdM4ZGNlrgUD5yc9yhopsBL3mkwzmEPnz1ECiAoCsFXA2wJX4Ih4YoOO37l97i3OxdgxNfvuAgDmjf0DoAmEqrMEoA3CgdT8O0m9Mdf29GkgC5JSZosJl1h3/RMHMdWh1SI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVptQ1ZSNE8xZklQNCtKMFZTNGJiV3d3OW95VGNILzk3UnVmYllxcU9RNkpQ?=
 =?utf-8?B?azlNZ0pRVlVyWXgzV3FJb1piQURmVUxsQ0d3RDljWjRkM1R6QU1vVTk5RUln?=
 =?utf-8?B?WGY5c0NCVTc3UWVTUU5tUzBCRHNYZjkvY2lvdHhvTGlpM2ErMDFTekZKT2RU?=
 =?utf-8?B?SFVESHYxOHNWOG1zdG9XZXVjZE5zbXJVMFFSUUpsZFdVajZ5cEQ5S3JGTzNP?=
 =?utf-8?B?K0hPMC9pVzJPZnRKTnlMUVNrZ3czbnhzSG5rRzVIUHowbEo1USt6ZDRPei9k?=
 =?utf-8?B?TWNOM1kwampUdXBsWStyZHRZQlQvWnA5TEZQeVhVcGhUbC9ZTjJka0ZBR2ZC?=
 =?utf-8?B?bTByMHdEelRCcEtiVlVmMHlOa1grdDUyc1VwS1kwVm1ZaFZwdGVCcCtCKzFu?=
 =?utf-8?B?eDN4b3crU1hPV3k0cEFkZDZ3Qkx1WENTa245KzFUcFUzak1WOTlpaXZwb2RD?=
 =?utf-8?B?M2IrSjJyVXJZWDl6YVh5eFpVbDBIOFk0bWxCNWRmZlJneGNaR09IcE5pK3h1?=
 =?utf-8?B?NlpNWkhIYVBFbTVHSFcyVVRIeXBFUnBQK0MvM3U0YmNpTVRKcDhvdlduLzVT?=
 =?utf-8?B?NWs2dWxaQW9SZ0s1VGI4RXh4cWZKVUFDdWgxZW5vTHZWVVdacHBJdC9CWXBy?=
 =?utf-8?B?aitRVFpPQlVYRjYzTDZpa0k2MUZ0K0JHMWFDMFZrZmpVYk5JWjhRc1c2L0N1?=
 =?utf-8?B?aSt6akczSUJ4bTMzTUVvRkp4RTY1Wml5bS82OFJ2MEtaK2FGS0lFQ1FodDZ1?=
 =?utf-8?B?RWhBRnJPMWtvQW5oSDRlaEVsdEtGM0VmRHdJZDAyZzk2V21GVVI3cnFUN2xs?=
 =?utf-8?B?L0lJRmNoNlBPaHBzY2VGS2d5Y05oVk9oNEM0VXF6T3J2NXVXa0FzMTlpNU80?=
 =?utf-8?B?eHh3WWZmaGRiTE9Xa0ZWQ21uc2lrTDkzSEtzUWNML3p2OFBJVkY0Y1plUmp3?=
 =?utf-8?B?NE96UlNnT25SR3dJMEpCTFpncjU3bmFCdTVCWjI0K1FDbWJYYjQ1NHhXYWdO?=
 =?utf-8?B?T1FIR2pjWWVSYU5ERUdUS21KVit6MGY2TlBSQVpQSVBPOURIWDI2K0kzSDJZ?=
 =?utf-8?B?UzdXNEZseWdaT2Vha1cyNzNXRTBCeFMwZHVYL3A2WG1ZeUxCUkl4Ymw5VlM4?=
 =?utf-8?B?eFhnbU4ydk95aTlyc3EzQVNWUldBR1hVSW5yT1NlSXZCWFR2UTcvU2pMK2Iv?=
 =?utf-8?B?clQwcDJtbXJiTEQwYkJ2L3ZNWFR0VjRSOTJ6d28vQ2JJYWVBT0Nqb3ZqSmlC?=
 =?utf-8?B?d3UzSmdZcnN0aWNVS1p0Y0VrcHlHb0tGb3lRQVVvK0hCZzdUek42ZFJUOGpR?=
 =?utf-8?B?MFRtNGRVaEFCQURibFNVcjdUT21NZGlOdTlENzBPV2VDU3VlWVUzc0xNdG8w?=
 =?utf-8?B?ei92VElIcElZczltLy9YVXlxcFVTcTZDRk8wV2hTYU81V3Fnc3VLMWlsdFVk?=
 =?utf-8?B?WldXaGx1bUkzT3J6S3A5U0JWY05XeFR1S1JxcGZIb1hiSzhzWURUWmt0MzYz?=
 =?utf-8?B?Q29vZy96RnVQdGlYTzJVZHM2eDE3Szg0a3FwcWRGZi9aMDUyY0VSb0hmZkti?=
 =?utf-8?B?R1JaY1VpcFYzV3lIT3NEWnlHOW1EazZtN1kxV0pjN3lUOGRQRjk1YkxxbTN4?=
 =?utf-8?B?OTZCZDZkeVo3ZHJiOUtHS2JlNlk3Sk1DZmVjMVI2dzk5WXdnR3Z0ZDNBYVlC?=
 =?utf-8?B?bVc0a1BmTXM1WTIyWGFyY2xhTUdVSldOZ2JjSGpuL0NuaTUxeFlqZTU1alpy?=
 =?utf-8?B?K2V3bmZiUVlmR2FrdUVReEpKdHdqZVVZQmhTOGhmZnV4MUZKeHczcTA2MlZm?=
 =?utf-8?B?cDJKOVJQWjNrMG5yenRpQWUvaUdXQVplYlFBQjNDMDQyaUtuVTllem1uTmpS?=
 =?utf-8?B?V1JPLzFzUEhLa1pXNmoxc3RGajJOUXowcWErMHhmVUhpVWd2N2lnaEx1NHdx?=
 =?utf-8?B?VHo0MytOR2hRUVFMVXRTREFNMHBwckw0SjVGVWVwaE9jSzhKR1FWSmFxSlhY?=
 =?utf-8?B?Q0t6Q0ExZnE2U2ZDcnBpL3NuZWh0ajhhUy8yaWNHRC9PcU5obzBRVWZtMERy?=
 =?utf-8?B?dUJvdmNHMG5UVHYwTnVWWnlKb3lkaEpUYkl2YU0wTmdaY2xMS2RmNjFCZWJp?=
 =?utf-8?B?MGFGVlVsYitPaUNGb292YUpadzNGTkFGZ1J4Tm1uazRTektOUHdvUmc5bkl4?=
 =?utf-8?B?K1dZN05mS296MWZiNXZCMnJPby9jWGRQL3BDdkxmeW9LbjF6dnd3OTZIYTdo?=
 =?utf-8?B?QStRZkdSemRkaDU3SjhkUXd1MFNZUGxnTFV3OHJTWitjVEFWdTY1dkpBcG9T?=
 =?utf-8?B?d0FiWndDazRld3U5Sjgwbjlvb1YzSlEzeDV0SzZWUWZNWnN2ZHdtSHlmQUw2?=
 =?utf-8?Q?NR6u0PUgL7uofOiw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b9f0825-0bfe-46e2-5193-08df1a539397
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 15:50:37.2188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HcYngFRgkooV9o6iiT21Uu0pR4fov4L4gnVysAvZUpeo4LHm59vjJgCinLRJ7qiy8ooP04awEva1oZlDV4MbY4IB7EcaevR+V6WrBrKV9JI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR03MB8054
X-purgate-ID: tlsNG-16d1c6/1790265040-FD00977B-EB648B20/0/0
X-purgate-type: clean
X-purgate-size: 1992

On 9/24/26 4:01 PM, Jan Beulich wrote:
> On 23.09.2026 13:16, Ross Lagerwall wrote:
>> On 9/23/26 10:51 AM, Lin Liu wrote:
>>> Xen leaks the host's CR4 bits to L1.
>>>
>>> nsvm_vmcb_prepare4vmrun() constructs the shadow VMCB's CR4 via
>>> hvm_set_cr4(), and svm_update_guest_cr() ORs in HVM_CR4_HOST_MASK.
>>> nsvm_vmcb_prepare4vmexit() then copies CR4 back out of the shadow VMCB
>>> instead of the value kept in v->arch.hvm.guest_cr[4], so L1 reads back
>>> Xen's bits - under HAP, CR4.MCE.
>>>
>>> Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
>>> Assisted-by: Claude:claude-opus-5
>>> Signed-off-by: Lin Liu <lin.liu01@citrix.com>
>>> ---
>>>    xen/arch/x86/hvm/svm/nestedsvm.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
>>> index a8b15d6eae..8d99b0affc 100644
>>> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
>>> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
>>> @@ -1082,7 +1082,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
>>>        ns_vmcb->_efer = n2vmcb->_efer;
>>>    
>>>        /* CRn */
>>> -    ns_vmcb->_cr4 = n2vmcb->_cr4;
>>> +    ns_vmcb->_cr4 = v->arch.hvm.guest_cr[4];
>>>        ns_vmcb->_cr0 = n2vmcb->_cr0;
>>>    
>>>        /* DRn */
>>
>> Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>>
>> Did you consider addressing similar issues with the other state copied from
>> n2vmcb as well? i.e. I think something similar would apply to CR0, EFER, etc.
> 
> But (assuming the above code change is indeed correct) wouldn't we better deal
> with CR0 then right away, rather that leaving things even visually inconsistent?

That's up to the maintainers to decide, though given the state of the Nested
SVM code at the moment IMO it is fine to take valid improvements and make some
forward progress even if they don't address all the related issues at once.

Ross

