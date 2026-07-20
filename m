Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD35C44515
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 08:58:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366314.1616202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wljoy-0008Gj-Kv; Mon, 20 Jul 2026 08:57:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366314.1616202; Mon, 20 Jul 2026 08:57:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wljoy-0008Gb-HV; Mon, 20 Jul 2026 08:57:56 +0000
Received: by outflank-mailman (input) for mailman id 1366314;
 Mon, 20 Jul 2026 08:57:56 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wljox-0008GV-U4
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 08:57:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wljox-00B1jt-Ar
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 10:57:55 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a5de30f-bab6-0a2a0a5309dd-0a2a4508a7c8-4
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 10:57:55 +0200
Received: from [52.101.46.58]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a5de310-f659-0a2a45080019-34652e3adc3f-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 10:57:53 +0200
Received: from DS7PR03MB8265.namprd03.prod.outlook.com (2603:10b6:8:266::20)
 by BY1PR03MB7969.namprd03.prod.outlook.com (2603:10b6:a03:5b6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 08:57:49 +0000
Received: from DS7PR03MB8265.namprd03.prod.outlook.com
 ([fe80::419e:bddf:320e:a1d2]) by DS7PR03MB8265.namprd03.prod.outlook.com
 ([fe80::419e:bddf:320e:a1d2%4]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 08:57:49 +0000
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
 b=TZrRrGGenb32dKjtSuz1Mbj1xDtRrjEWK8h0u+Irhvuq0xmvNp6Erxet+N8zeHOJC7fp97JwuKN4D7UvvkuQXBKF0mGNRxWYkzqFHdimKCTN6JgcFwdZ4Gu8pBFXaley3OiUh6XEUfD5JuZh2LKYGCgV4RUya7szGRcuoQ7AwoswFiWfdEECxPa8eDBMztnzx1L9AdJRql6ivRPceGalPhPvFHIOSSqnCRXfjVoXFS53szyMpCsxuUMiuAUfEvNriVIqL4R6wZfpxYuAdyey1MzlCY98JtsxuqdO9PyYhcKPtAaqHqX9dxZXgfYiNFzfU7J2tBiZpZHM5Chfp2huHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKoxIAP90lxRhQiZnq2y7ElyOCeE9VpIO7msgJ508Kk=;
 b=cTYTUXLnc4g5dYWCLTWEbLUGfySZWtdrcRwtwtIid1QFGR93aIOn1oB0r7nTY7X2xDB2vc6ylDFdyMyzM27ZWPYuLbAsptXweOx3IzgNRzMRZfShQQPvYfsyCXcFoATwn4YjIw71vj2pB/OodlHRFbxLn3u/1m5/84Ze/PapL2p2Ypv7Q+z0NClRp2Gpurh3JCcYfRE+CgpNylkttW4j9vgN2oEDnEFjYMG4HDF/GoXpqP/wqci8gK3nqAVzovUEEqOyYJcLHFoer7CaN3YMHVnCy/4BU0Qsk6YCzODdKK6FGJz50o3OSuR8djG+ZdYakfkorya8QPLi5Bo4clsGVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKoxIAP90lxRhQiZnq2y7ElyOCeE9VpIO7msgJ508Kk=;
 b=v5XPYBsLo8KKte7PAuxzfD95Pb9bQz8tCjGIptXPLxu4hooRLv+toyNSPdU9/w5S3pKmFzAqOp7wpq9B4Rdme4PUXpY3cLhw3WYXjDcH0ugV0kW3NCeQzFeu5KBetBYwwM35N7/7IerpbiVOagpCSDOYD737/aEb85DzO9Sr0cA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f0d40078-4e00-4307-84ae-1d5c65346af7@citrix.com>
Date: Mon, 20 Jul 2026 09:57:45 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Subject: Re: [4.22] Re: [PATCH] x86/domctl: restore all registers in
 arch_{get,set}_info_guest()
To: Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20260720001223.2876628-1-marmarek@invisiblethingslab.com>
 <83ac6e9b-3aaf-402d-9877-2ed63d365367@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <83ac6e9b-3aaf-402d-9877-2ed63d365367@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P265CA0012.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::16) To DS7PR03MB8265.namprd03.prod.outlook.com
 (2603:10b6:8:266::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR03MB8265:EE_|BY1PR03MB7969:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bebd456-3132-4c50-3df1-08dee63cf984
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	Ji4wNNAJ9aMvYSItFFG6EQjtj+lxJcc9w7QPnLwGRAkXOvEWBLOz7RPJRi620A0TKEh9ZzfXfQ03S5+DuEwIGK61iI6VEO0Az7i+plbvqHvq6h7jgfBlqVTbVD2KhuW77x/1t/ptcwQL8WCahP7w18MHL+b9Ic46E0iygPrxYS4LA4kJig2YZoFbyBjYqugSPKfA1z46fblpiBe4vswMwGz+iwWaAONl2ARZFIgppChgJRaLn1xrzS5RQ4ciUkuNRr0JbBB8OmJY9I8Pl9QPO0aVosGNHPcuDeLQicJXDhoHIaKzfYMwIgDVX8RLjy2mUPFFU1JWqThjkdwBx8Jhi0+2kOO+OaXueuqtnSL6CsAA9S9LQN35ojhH3WqDo9IER+puanoIZCsAc4sCkgjjQsjTm2MBFoVqANlizH92PMeoSqMTtV/R4kcYR9R9Oj3LjNCekOCFxpljxuCDVMgZdzZJjbI6ILNTW5PySn7U18cEaGQo4l9NrX3P8Jj8yULQ4ADvyKyMq5U3ewpvhpl3pPJ5QfyGcsAcM5oftQQZT7wWu55efS1ZZH7CsBbnQs+vP3P/lwgBrIObOCuYjiChwPs4AOrHfwzpW41OHvcCAjyJHAj99ZBopcu+BnIP5AmGgUP6tCWuvrRS3j681oIFA0248HsCcoapvbe/WGCAQ6Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB8265.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUJTQ05NQytrUGJNYXp2dFM4anRENGwxamVzS2pPS3RCUW10ME9PRlVuNnAy?=
 =?utf-8?B?RE9mc1ZvOTNWdzhRNGtxTHhMK2Q2NjhoUkkvUENoYStrVFhCU3EvQVZ6QVpj?=
 =?utf-8?B?c0Jzc3I5QzJvWVYwTndTbktVL05WU0J3VGM1SGs5ZEtveVdBY3RQRDJkN2x6?=
 =?utf-8?B?VHZ5VzY3Rzc1MmxaNTVCNzFsZU1lNm9DUXpadGd1VTBlTTdZZEdWamxJTEN6?=
 =?utf-8?B?QjV5UUYxQ2FkaER1ejU0UkI3WU5Xd3R4eldNQWdYU1d2bDVBZENYSk9HNG5v?=
 =?utf-8?B?M0VKSmxGMXdKOEwwb1dWYjU0NmprdHZWbUVIZ3dHc2dLWjFFMGFVcVlXakc4?=
 =?utf-8?B?RjNmNXBvVERHUlppakpDMStYVDlsTnZMVCt4QzdDOHY1ZUVSbjBRckUvLzJR?=
 =?utf-8?B?bFdSaW1LeGZjeFNIaEJIQ01hR3h6U1JVSTNaR3hLVnMyN29oQ0J4ajhoOVha?=
 =?utf-8?B?RExKSng4ZzU5N3NydnJLT0U4RWVZUDRVakVvOVVIb3poWXRVMWMwL1MyZmlt?=
 =?utf-8?B?dnVBei9Zb1loYlFQRmtaT25sRXM1OFpqaVpkc0graDVGb0cwUU9EYnV0czlB?=
 =?utf-8?B?YXNlY3NqZHhzbzZDS2xLZWRQVE4xS2ZzbGpKWmpyRjluYkZONDhQMzZncmEw?=
 =?utf-8?B?YW1wWG9oSVBNbEdVc0JjMUorZ2U1V01qdEpOY2h0R3QwR2tHMk1mMG1HWEhX?=
 =?utf-8?B?NTlFSFAvSDkzN1FwSXJ1b2V1WS9mT2RxaGM3S0VKbGdKUVM3cFBXV0ZLUnAx?=
 =?utf-8?B?Z245T3ZrZS9LYzNweUlDQUZ6OStJNU1OSTZTUUcwbTFtb3dnVmVneW02TVcy?=
 =?utf-8?B?NlJ1RHBYdkN0V1gvZUJWNXd2Mm95MThreXpnUjhudDZ2STVnYmxoZmVteEJm?=
 =?utf-8?B?RTVndFRyR1NBVHNmWHRXL2RjZUtWUGdKOTZqSStiT0IvNm9QRGNnL3JQT2xt?=
 =?utf-8?B?cmx2eDBobXJwSEE3eFVtWnNCNTdYSVkydnZDb1krRTI5SDJZc1R5WFpuTlhJ?=
 =?utf-8?B?S0FGSVpRd09jS1ZsK2lnNklPeFIwUC82ODB0VERoOHp2UmhTVXlOd3F4Ny9C?=
 =?utf-8?B?WHBkK1BFSS81em1ESG9FUTNaUkRmK3dvRlVkNXU4YnhHYXljcm5HbGdMSnp4?=
 =?utf-8?B?b0tXSVhjODhRbmE0NXhyS0ljdXhLUi9VTThETE9vSkc1L2hrKzVRWndrZkRB?=
 =?utf-8?B?WktFMTNDaTkvOHpHZXZCM2E3U1hSR0kzMXBmUW9zUFdaSHhhQUkwcUZKR2N5?=
 =?utf-8?B?dERsTFF4QWRoQWFwQ2pOak1ybFFiSDJlTVR6ME8xR2lvdUpyTjh0ODRoMXpL?=
 =?utf-8?B?blRUczl3WW5TcFBqWXdENTBzbndtM3FFcEFFWU5kL2NZR0JYbkZ1MFNuVVN3?=
 =?utf-8?B?dmhncjdiNnR4YTBEZjdERXBuTzhTZEs2YlZKb29EMUpPb0dhajdLdXRvSldu?=
 =?utf-8?B?YzduMHdwa1RpbnRNNjBTakswRkpjOEx0dGlzVVJacWRzVjFFWHN3eDZqbEp1?=
 =?utf-8?B?ZUNoeUNOVmphMlo0amdLNllwOWxDZGliTEs3ZHJpbW9USXp3YVJIMkQxRU10?=
 =?utf-8?B?Y0xOajJMRWZTcEh6VlQ1R1FSSUZ0NTY3WFZiUHpoYXFvcFJ1UWNpWGk0REZm?=
 =?utf-8?B?T09NU3NKZ1JmZzJmNWtPSHlpK3VnZk91amJUWThnWE0xaWxzQVpwUFIxZjVi?=
 =?utf-8?B?Y2hCYnd3MFZDS09KYWxmYTFkWlpGcVZYSXZIWE15ZlpMQWFja3Q3TTdXNHYv?=
 =?utf-8?B?Y0dSV00zMU1nY0o1cWxtZ2p4QkNQb2pzMzlnSzNIWjBNdUdLTk9DUDQwRHV2?=
 =?utf-8?B?YUxKbjJleXRtU2tZaG0yNW1wZ0tNQmdRcUZlZjdtRzE3K2hBdUxTWTJrZmxx?=
 =?utf-8?B?VWtETlh4dUtobFFESGIrU3NuSkxubkpIQ2xMZEJXc0pGRFJiUWkraENGNHVD?=
 =?utf-8?B?ZldkTWtHYUNkYzNBRG9mV09NeGYyNDBPMkdWd3pBQ1JFTHZudlkvV0wxK2cv?=
 =?utf-8?B?Skp4VkljcEFmZWZwakxyRFRENHY0REtTd1IyaHgwanJaZFR5Yk5rVzQreGdQ?=
 =?utf-8?B?ektzdFBQek9rcjkvZnFpU0RIMXhkVE9ERnZZS0gyU2RUNEhGN3VHSnV4MlZQ?=
 =?utf-8?B?bnFDNGM0Q2EyRlJiM0h2SDIrbUdiMXQ1Vi9qNnAzTEhobExKcVlHMitNSDZF?=
 =?utf-8?B?S1Awc0hIeGwwbEdJTmVPR1NRdHhwQndMZmR6bEY5Tmx0NjJjOFZTVkNPNWpM?=
 =?utf-8?B?dU1Eb2lUWnB3VlQzV3JVd1A3b2wxQ3J0Q2xDd3B3dHVYb3pDRmNMTFJ6Wno0?=
 =?utf-8?B?cnAyNm94RG1LOURIYXM5S2Y4dG0wdC9jUlpDM05yZEJFU0c5d25lZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bebd456-3132-4c50-3df1-08dee63cf984
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB8265.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 08:57:49.3639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IZR5ww/E0ihuHzOPbTbNqIrGmtz0VQZGfAgLjlWB+Z44LEG23EXgcJF4SiDRIWSOmkU+j0MZV4AvU5NKb66zcBPHXCI5A9CGQ4XNT4KmCdw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7969
X-purgate-ID: tlsNG-c1860d/1784537874-CD34D87B-6084B701/0/0
X-purgate-type: clean
X-purgate-size: 4121

On 20/07/2026 8:19 am, Jan Beulich wrote:
> On 20.07.2026 02:12, Marek Marczykowski-Górecki wrote:
>> Commit 9f892f84c279 ("x86/domctl: Stop using XLAT_cpu_user_regs()")
>> converted memcpy() of the cpu_user_regs structure to explicit copy of
>> its fields. In the compat case, it intentionally missed few of them,
>> named in the commit message. But the 64bit case missed also r8-r15
>> registers, which was not intentional. This, at least, caused Linux
>> 6.18.x crash when resuming PVH domU.
> Oh, wow, what a bad mistake (including by me as the reviewer).

Yes, I'm very embarrassed by this mistake.  It also highlights a serious
gap in testing which we need to address.  We've managed a release and a
half with PV migration plain broken before figuring out why.

>
>> Fix it by adding missing assignments.
>>
>> Fixes: 9f892f84c279 ("x86/domctl: Stop using XLAT_cpu_user_regs()")
>> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

>
> One remark though (equally applying to the original change):
>
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -1255,6 +1255,14 @@ int arch_set_info_guest(
>>  
>>      if ( !compat )
>>      {
>> +        v->arch.user_regs.r15               = c.nat->user_regs.r15;
>> +        v->arch.user_regs.r14               = c.nat->user_regs.r14;
>> +        v->arch.user_regs.r13               = c.nat->user_regs.r13;
>> +        v->arch.user_regs.r12               = c.nat->user_regs.r12;
>> +        v->arch.user_regs.r11               = c.nat->user_regs.r11;
>> +        v->arch.user_regs.r10               = c.nat->user_regs.r10;
>> +        v->arch.user_regs.r9                = c.nat->user_regs.r9;
>> +        v->arch.user_regs.r8                = c.nat->user_regs.r8;
>>          v->arch.user_regs.rbx               = c.nat->user_regs.rbx;
>>          v->arch.user_regs.rcx               = c.nat->user_regs.rcx;
>>          v->arch.user_regs.rdx               = c.nat->user_regs.rdx;
> Neither here nor ...
>
>> --- a/xen/arch/x86/domctl.c
>> +++ b/xen/arch/x86/domctl.c
>> @@ -1481,6 +1481,14 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
>>      if ( !compat )
>>      {
>>          /* Backing memory is pre-zeroed. */
>> +        c.nat->user_regs.r15               = v->arch.user_regs.r15;
>> +        c.nat->user_regs.r14               = v->arch.user_regs.r14;
>> +        c.nat->user_regs.r13               = v->arch.user_regs.r13;
>> +        c.nat->user_regs.r12               = v->arch.user_regs.r12;
>> +        c.nat->user_regs.r11               = v->arch.user_regs.r11;
>> +        c.nat->user_regs.r10               = v->arch.user_regs.r10;
>> +        c.nat->user_regs.r9                = v->arch.user_regs.r9;
>> +        c.nat->user_regs.r8                = v->arch.user_regs.r8;
>>          c.nat->user_regs.rbx               = v->arch.user_regs.rbx;
>>          c.nat->user_regs.rcx               = v->arch.user_regs.rcx;
>>          c.nat->user_regs.rdx               = v->arch.user_regs.rdx;
> ... here it becomes clear what has determined the order in which fields
> are copied. It's neither by register number nor by field order nor
> alphabetically. We might do ourselves a (however minor) favor if we used
> a clear criteria; likely field order would be best. The more that the
> new internal struct cpu_user_regs mirrors field order from the original
> external one. Andrew (in particular)?

They are the order that XLAT_cpu_user_regs() expanded in; that is -
x86_32's cpu_user_regs field order.

... which now I think about it is correct for one of the two uses of
XLAT_cpu_user_regs() but suboptimal for the other.

They all want to be field-order of the loading side, because that way
we're working with the prefetcher rather than against it.

I'm making a follow-up, because I think it's more complicated than just
interleaving these lines, and I suggest we take Marek's patch as-is.

~Andrew

