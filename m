Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23960C98309
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 09:56:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430042.1652644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Jhg-0004vL-Ai; Wed, 23 Sep 2026 09:55:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430042.1652644; Wed, 23 Sep 2026 09:55:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Jhg-0004vE-7z; Wed, 23 Sep 2026 09:55:52 +0000
Received: by outflank-mailman (input) for mailman id 1430042;
 Wed, 23 Sep 2026 09:55:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1x9Jhf-0004v8-A7
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 09:55:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9Jhe-008YhE-NE
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 11:55:50 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ab3a226-bab6-0a2a0a5309dd-0a2a450ada92-2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 11:55:50 +0200
Received: from [52.101.46.49]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ab3a224-f2d2-0a2a450a0019-34652e3145f9-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 11:55:50 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by CH2PR03MB5192.namprd03.prod.outlook.com (2603:10b6:610:90::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.16; Wed, 23 Sep
 2026 09:55:47 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 09:55:47 +0000
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
 b=QW3P08R9FBshieWcfVJCGf8EHV3vze0Km9Q2y/daInrPc7pe0gUt7r4grCJlNiJ4k3pN1a/L3Vg+jkFejwVO07wxGiUgmakobVXKjbNYfBFZpsH1hXTLOow5p65jphH4ZKBxIY1EHlxc6O0ejLVUrmIxaccITLpqLtuw3g9RjTvcl5ZGp4WAqE/oFpwSs18EdOwMkaKLYpOmKFysWXCsPekVFIxKhQZalMwYG/mlsUIPo8Nfx8OYgfuBlTmNLig3tEXvZ0eCGSDAXI+yl69eZTeDFU6x0GlO6XdEngPFP1JL6ivucwA64sR3/fGiXApXt0d1f5AvF/meEngiB58mmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ql/HNTMaNe4Qijw/njauqk0Pyeg8MFu3OjIs10pvGjY=;
 b=Nn8Lv2dpz55YFmls1CH/PYAvYG5vQN0D2ZchdYXLaBb0FYdyXRAFmvHKXXyg4LdDjLvrETHAlhh+vM8KVhtYLFppEjOQqFQQE16h8uexqn/J3ZIyTEg2jncDI6jOvrKDxh+aYrznB2H7OdS6LkM7s3tUxi9LHM8TmZze4PO8Kw4M/bhsRG8h+w2GC7f/rJTgJyabkpSwH9kCeWCbchbl5rvmR1HR1GJLe5UN3QCpHHR2TH/MKCXhg0wWGx40hHt7mpvKCt5Yn3T4mlBKjttdW2LI3WtK876q5kn4tKD+2f17bY/xBQoCcmAjlAa9Odk3rpZX0gCfFdpyOiHYOQ5G0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ql/HNTMaNe4Qijw/njauqk0Pyeg8MFu3OjIs10pvGjY=;
 b=OMAuIP7pO9DuABZKReHkECYgqobNBHvYm6aX3An91d5Te/xmDDTTfEg03wgJm5Q9HWYHMU/IVCmTiwXBt0mWPv6ubCHg8B3ijB3OeOGblGmd0jIfz8i4LNrIy3ArDaY+8r3bMZnQGUhnXlWxgjcu4gZL8luok+AfHHRsJF1n/SM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <21b02d5c-4e21-43fb-b371-201a125bfdbb@citrix.com>
Date: Wed, 23 Sep 2026 10:55:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] x86/nestedsvm: fix up
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: chunjie.zhu@citrix.com, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger@xenproject.org,
 jason.andryuk@amd.com, teddy.astie@vates.tech
References: <cover.1790146987.git.chunjie.zhu@citrix.com>
 <b72ef69715f9e7e6a797045b0091489842d5e563.1790146987.git.chunjie.zhu@citrix.com>
 <f8f887ba-2528-461c-bcce-54afdecf8336@citrix.com>
Content-Language: en-US
In-Reply-To: <f8f887ba-2528-461c-bcce-54afdecf8336@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0107.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::22) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|CH2PR03MB5192:EE_
X-MS-Office365-Filtering-Correlation-Id: ca166abb-5f8b-4299-d500-08df1958d752
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|4143699003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	35fBlqY0rz0BxXhxpVajKgoR4kih6YYW1HYtfOgukS0Hms4n5QY5uS1YOhzmTU1U3RYjNwpRhb24ZpgXTprHjK/v2EWKFAc1QLAYNwVmbJPDv3YmUrDHRcBisbJh6XCyOIAbtbWvk60g+aQw7EzdIfizSxVA4XV18sKJL4KJAakdqaIrel9xvZhZb352DVH2Z8GErOxEDkBuOPWky3525WlKEMbfxs6wUBOvGd9XsVsA2nhjJxJkAvPHQmtJrGH3qcnpYqbE6fgA8Vr/mhyaBocYLTDcsdcMLEaFr0KbYZL1BvHzbguEuaE/iMgJaTmy6dPYoeALMAWuACtyyqFeNeHBArI3r6NxK3nfFGfz1XWRzaC8gAqqAKVFumsruGrNnT0i6dNPCzj/TdZvCBmZJQtN4KVg45Qa90hxIPdtwKXUYyqOSflPE0GqCjgaMmVeONw2bfSBT6X/+Q/zUu/x1/2/zqa1tgHh3Frwj9RxAGSwCs0BEYelpQ7iABuAvRSG4aXypYcE/31YQLNwcdHN7ZHYIzx7n5eexauZmGnEkoyLLSUlAe1Tvb11syBmr2Qn76SQP/fx7dPLVkU3fFbl+JSMoj197k8zkuODBU9NFutb2AtNqDXWDfmDFDJ4u5J/TC39hfoVWj2ILNGKOybt9PIZ/fBe7zBNwNEcithqGIA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(4143699003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajczSGRnSlo4eTUrcVZFSnh0Z3U1MHNmYU4zcWVHQzVHT21kMDJTVVg0V3BE?=
 =?utf-8?B?ZGpvRGtaN0FXS2lhSVY5TDl6dEI1N0tZUGxDVlQzM0d5QStTalpJeVNjdk9i?=
 =?utf-8?B?TEFVVXExbU5ETnA2WXhpYlBoMjdhQXZSSThBQUlZRS9BK2ZvOXFOQVNPejFL?=
 =?utf-8?B?Y2xFaHNWcTVvR2phMUpCM1YvTVZLVGRUNGp3M245ZjVnSEoyb2tKOW5ia2or?=
 =?utf-8?B?VXE4T2E1ZXp4ZVJYdWFXTFlOQzNTeWVuS1pOWG9JVEZlMTVua1d3aFIyKy9S?=
 =?utf-8?B?THNpa0V2bThVbzduNXUvUE5STE1Rb202Z2ZOSDNZaGI1aVpKSEtBYTRZVDJG?=
 =?utf-8?B?MUZaOHlkZXhpSDg2bDJjUGhCQWNGQWZtVDV1VzZsdFk3eTR3Vm82cWExd3Qz?=
 =?utf-8?B?OHZhcHV0TjBaUUw4VjNQVDBHa2RsaGxFRk9MK3lvMjR1MUFrVDlObjdLcVRw?=
 =?utf-8?B?NFFGUWZIYlRjcXM5TEczWVlnU0lVL0FsWUNYS0YwL1VZaW5QNzFZN0FpTnpj?=
 =?utf-8?B?Uy9mcmhpSlZVTEpKbmt2bWRTZzFIKzRjNnVRZ0g4SWd1TktscEsxTDR6dGR0?=
 =?utf-8?B?eHF1a0hmVEtETnJoUXM3dnBZMmVjbllILzZGYUZVYWx2bnI1a2tiTUJ5UzVv?=
 =?utf-8?B?WjdHUzYvOFRLVVd3WWlOMndnUFhSVjhNaUpTZFNVUk9VNG02by9nVTV3MjZs?=
 =?utf-8?B?WkVUUm16QXJXSm9yMXI1Q01Cc1JKVUZCTTBWMFRBeHhvdzEyTzhkWVYrUTFK?=
 =?utf-8?B?bnNpYzdoV3FLMnhReGd1a0hQcXQ0MGZiQTYydTdLRHJXQUlFdS91K1NrLzJS?=
 =?utf-8?B?VytGS0Mvb3RjWjRvR2hCWFpSMDRBSEVuNkV1M2dkcjBWSlAra2h6NGUrS2ow?=
 =?utf-8?B?ZjVUSnYxWVNydVNUTXZQYjlZNHNiUW53d1MyRFhKaGNaZUlUTHBscUdiOS9T?=
 =?utf-8?B?R0ZkV3hySlArSGFUbE5wQzRLRHlXVExOMW9IcXdTc0NlYkRXckh2NHJONG14?=
 =?utf-8?B?ZUR6UHplZStPSnFkOXNBZ1Fkc2QzTjNHN094NFF2U1NiTDIyZGZYY3FGdG44?=
 =?utf-8?B?Z3pOYmIyUlpNRjJXaEV2L3hHaGN5YnhxaVpBSFIvaXYwWDR4RmhXbHVPRDVJ?=
 =?utf-8?B?WTdhS1RpcDl1Y0E2K3FyYmcvc3lHNTg5blVCS0paSitURGRTVmN3d3ZhZWty?=
 =?utf-8?B?V0kwcFRnc0tESWhnVHN0QmxkZmI1MXlwbEpSQlcxaStGSVVDdzN4N0RtWmJC?=
 =?utf-8?B?WllJR01JZWdxZUdCVWZvMVpzdEJIS05lMVgyQ1lLU0FIY0NweUpVWlFPcUZX?=
 =?utf-8?B?bWJIK0lPUnM0NVpXSDRjRUJMb2psR2pxalBPZUVuckFpWXVtZTNuVGt1ZGZS?=
 =?utf-8?B?cXJKeXhsbGduVHZzamFOT2NSZTllU1FsaUdBVVBxY0VlVWsyalF0K3BTd2hF?=
 =?utf-8?B?N0ROMGhXUVFvVDBiRGRVUmlxOGI5b1czOEgybkRJS2ZFenc1Y2JEbkgyRzJP?=
 =?utf-8?B?RnBzbE9laVNYbU0wVEhKbGRDcDNKeWJ4OEZIUE5KK1FXL0grYVhGWG5hNG11?=
 =?utf-8?B?Ti9sd0c0ZjBjRU9BUUE5Rjc5UVo4V2RiWjc0amZoQkhIL3NnTG5XV3VycnVY?=
 =?utf-8?B?QXJ1K0FJZ096RVFMdjVYTm10QlRPR2FzN0lUaFgvT1dFZmM3akNjNjJTTTlF?=
 =?utf-8?B?aHA2WWZTZTUrZkp0WjhDck1UcXRUQWZ0ZDF5V3h3eE1HeGFGMjM5UUliblY5?=
 =?utf-8?B?TTM0L0ZqMmRlSGRSb1pBYzlHdHU2MlBLSFd4UHRjdkhGRGdXdUVSYWF0QWF6?=
 =?utf-8?B?dnVPQzJNaVR6RnVpYjJzK09JMS9ZTVk2ZXR3T1VjYlZQQy9wcEIzbGVEZzNy?=
 =?utf-8?B?Z2lTNHdZVDN3RkxyTS9tUzM2SlBpOVhFa1FGVXZCR042UXdSSUhaRWRMR2Fq?=
 =?utf-8?B?SlBNaHVjS3krOExWZWpJMHB6b3RnMStLQkpUcEpERXBBWFNXOXBISXRpUVF1?=
 =?utf-8?B?NzJYOXBNKzFYWWZKZmpLSlhjSG9WU1piNVBIZ1NDMzI0TlRGdndGZGxvdkd6?=
 =?utf-8?B?THB4RnJJMEE4S3RYS2h2cUNlVGoyWlFSY0lCaWhqSVA1QkViTW5QNXNyK0JO?=
 =?utf-8?B?WmdwcTN1MWZtL1ZmbHZWQjZ3UUg0K2cwQXNsWUtMcnZpMFBkbW5jeVVjalBh?=
 =?utf-8?B?OFpyUjNvOEJuS1E3RzVBeEppTjFJYXlkdG8yS3lJMGdFUzJ1a3h6ZDN1eUhh?=
 =?utf-8?B?YUxzMkxRN2RpYzVDT2JEdXdWSkhaaldxMXZ5NUZMeXFXd3o1TUNNaE5ZTW40?=
 =?utf-8?B?U0ZsRWxyTnhYc0JkenhUNjVtQ3BlaklSUlZRZnMwS21GcVpiWE1qT2FIYkNa?=
 =?utf-8?Q?J+JxnwXgLjZMwk4o=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca166abb-5f8b-4299-d500-08df1958d752
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 09:55:47.1867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7IHiF6+ljH0+bDgrU5BG5Q2o8bN9pkkNrxB07gyxQpUCrp0MTqK20TWyucigRN/ijaQmyYC810U58qVQHcpiPbfOqZX5MPsXy8gcDOY+P1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5192
X-purgate-ID: tlsNG-4011c0/1790157350-530D9CFC-547B07A0/0/0
X-purgate-type: clean
X-purgate-size: 4656

On 9/23/26 10:42 AM, Ross Lagerwall wrote:
> On 9/23/26 10:20 AM, chunjie.zhu@citrix.com wrote:
>> From: Chunjie Zhu <chunjie.zhu@citrix.com>
>>
>> Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
>> ---
>>   xen/arch/x86/hvm/svm/nestedsvm.c | 19 ++++++++++++++++---
>>   xen/arch/x86/hvm/svm/vmcb.c      |  9 +++++----
>>   xen/arch/x86/mm/p2m.c            |  5 +++++
>>   3 files changed, 26 insertions(+), 7 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
>> index 82e01e513e69..91872af8aa7b 100644
>> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
>> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
>> @@ -355,7 +355,7 @@ static void nestedsvm_vmcb_set_nestedp2m(struct vcpu *v,
>>       vcpu_nestedsvm(v).ns_vmcb_hostcr3 = vvmcb->_h_cr3;
>>       p2m = p2m_get_nestedp2m(v);
>> -    n2vmcb->_h_cr3 = pagetable_get_paddr(p2m_get_pagetable(p2m));
>> +    vmcb_set_h_cr3(n2vmcb, pagetable_get_paddr(p2m_get_pagetable(p2m)));
>>   }
>>   void nsvm_vcpu_update_nestedp2m(struct vcpu *v)
>> @@ -373,6 +373,7 @@ void nsvm_vcpu_update_nestedp2m(struct vcpu *v)
>>           return;
>>       p2m = p2m_get_nestedp2m(v);
>> +    nv->stale_np2m = false;
>>       /*
>>        * This may happen if we've handled VMEXIT_NPF at the same time as a
>> @@ -383,8 +384,6 @@ void nsvm_vcpu_update_nestedp2m(struct vcpu *v)
>>            vmcb_get_h_cr3(nv->nv_n2vmcx) !=
>>            pagetable_get_paddr(p2m_get_pagetable(p2m)) )
>>           nestedsvm_vmcb_set_nestedp2m(v, nv->nv_vvmcx, nv->nv_n2vmcx);
>> -
>> -    nv->stale_np2m = false;
>>   }
>>   static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
>> @@ -1024,6 +1023,20 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
>>       struct vmcb_struct *ns_vmcb = nv->nv_vvmcx;
>>       struct vmcb_struct *n2vmcb = nv->nv_n2vmcx;
>> +    ASSERT(v == current);
>> +
>> +    /*
>> +     * The physical VMCB fields covered by VMSAVE/VMLOAD may not be in sync
>> +     * with v's vmcb if a context switch happened since the last VMLOAD.
>> +     * VMSAVE below would otherwise capture stale/foreign register state
>> +     * into the L1 shadow VMCB.
>> +     */
>> +    if ( v->arch.hvm.svm.vmcb_sync_state == vmcb_needs_vmload )
>> +    {
>> +        svm_vmload_pa(v->arch.hvm.svm.vmcb_pa);
>> +        v->arch.hvm.svm.vmcb_sync_state = vmcb_in_sync;
>> +    }
>> +
>>       svm_vmsave_pa(nv->nv_n1vmcx_pa);
>>       /* Cache guest physical address of virtual vmcb
>> diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
>> index 5354c4f1b85f..2f7053ed7eec 100644
>> --- a/xen/arch/x86/hvm/svm/vmcb.c
>> +++ b/xen/arch/x86/hvm/svm/vmcb.c
>> @@ -357,10 +357,11 @@ bool svm_vmcb_isvalid(
>>           PRINTF("CR0: bits [63:32] are not zero (%#"PRIx64")\n", cr0);
>>       if ( (cr0 & X86_CR0_PG) &&
>> -         ((cr3 & 7) ||
>> -          ((!(cr4 & X86_CR4_PAE) || (efer & EFER_LMA)) && (cr3 & 0xfe0)) ||
>> -          ((efer & EFER_LMA) &&
>> -           (cr3 >> v->domain->arch.cpuid->extd.maxphysaddr))) )
>> +         ((!(cr4 & X86_CR4_PCIDE) &&
>> +           ((cr3 & 7) ||
>> +            ((!(cr4 & X86_CR4_PAE) || (efer & EFER_LMA)) &&
>> +             (cr3 & 0xfe0)))) ||
>> +          (cr3 >> v->domain->arch.cpuid->extd.maxphysaddr)) )
>>           PRINTF("CR3: MBZ bits are set (%#"PRIx64")\n", cr3);
>>       valid = hvm_cr4_guest_valid_bits(v->domain);
>> diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
>> index 027b9ae69be3..d1fafc479c78 100644
>> --- a/xen/arch/x86/mm/p2m.c
>> +++ b/xen/arch/x86/mm/p2m.c
>> @@ -1517,7 +1517,12 @@ p2m_get_nestedp2m_locked(struct vcpu *v)
>>       np2m_base &= ~(0xfffULL);
>>       if ( nv->nv_flushp2m && nv->nv_p2m )
>> +    {
>> +        p2m = nv->nv_p2m;
>> +        if ( p2m )
>> +            p2m_flush_table(p2m);
>>           nv->nv_p2m = NULL;
>> +    }
>>       nestedp2m_lock(d);
>>       p2m = nv->nv_p2m;
> 
> This seems to have combined several bug fixes from our internal patchqueue (I
> know because I wrote some of them...), some of which have already been posted
> to the list.
> 
> It's not clear why they were submitted as part of this series.
> 

Looking further, patches 1, 3, and 4 also contain seemingly unrelated patches
from our internal patchqueue. Can you resubmit this series without these
patches mixed in? Or if they really are required dependencies, (where they
haven't already been posted to xen-devel previously) submit them as separate
patches at the start of this series, maintaining authorship information.

Ross

