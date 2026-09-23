Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CC5C982EA
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 11:17:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430213.1652783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Ky3-0004eW-Uv; Wed, 23 Sep 2026 11:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430213.1652783; Wed, 23 Sep 2026 11:16:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Ky3-0004eP-SI; Wed, 23 Sep 2026 11:16:51 +0000
Received: by outflank-mailman (input) for mailman id 1430213;
 Wed, 23 Sep 2026 11:16:51 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1x9Ky3-0004eJ-6y
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 11:16:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9Ky2-007XID-1t
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 13:16:50 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ab3b51b-2eae-0a2a0a5409dd-0a2a450bae00-6
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 13:16:49 +0200
Received: from [52.101.48.8]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ab3b520-b7e8-0a2a450b0019-346530082af8-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 13:16:49 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by CY3PR03MB8152.namprd03.prod.outlook.com (2603:10b6:930:100::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 11:16:46 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 11:16:46 +0000
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
 b=Ko156pzfNLv/coan9zKcYFk7a+dOlodbFjsWaFwDjIgBthz615Brrb8GqgJU07a25u67m3nToYFm8LAkALVcg4XIxwVjRPs1rJcnHShKDXtAMs2Efr7IDRmICHaQyH5F8LJBMNUvhVHOXMongqcKYLLp4nQlgDFWj8QbURsBG9vb/qZNaK5r4FeDNEXud1Xk1ORUb6QdvoOSdUjbhspaWWIlLiLkUmyhph9ykk6hvqBQLohN7hSHdBofGYBUNIUzUeQY5WW63OopBaqLwyVl/qvtbX1SwzqyyoxSnca9axi6c0XUoikOBxuuFOPWq0+kW5O8o7PuSkXy5hy9iDZlNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QxfeYVCK/ABHBpdU2TQPFB2PkdQGMgpkvrmStIswxk8=;
 b=Yf4VzTFJkxZWF8Zj2V3RlrARUJy51Xh3MjmYxc/ew7+Lr0CjynI9cvnUqeEpFFSpZzbBIAzE3HK/4ref9Csq6H93f5MsmZfaPsmHw799MU0mlq/djuJ1gzzJnJtgbwITDt+NN6J3dYLib4jgPXHrAix0Zs5JzIYswsEXkcc9Yf+5Qp0Bak3UJaELvFdBSWPmrKmTiVtj23R0HK55/TN+CJMTpfn5GN6MtFt53JnWFNfQweatq9PildM0FhEz5DAkQajrGh6LEJFtrM+bwPef4WGdSo35yvSv+vWKyAXV7mvkmLzyWJ8GIxsBxXj9+AsvtQdP1MOL6AK61QbbcpMDZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QxfeYVCK/ABHBpdU2TQPFB2PkdQGMgpkvrmStIswxk8=;
 b=TVyANupYmlotxXcwXgf37oUDOg0McuGrcmnQzSNnbAeNIwcyXVdlDtHC+5WuUBDA0TCqZzX5MXreG1v+v20GYRCfMm3HtM3AfMEmmlJdjj0HjOCgWirgj3IrRvtvDCiCZKF8xCquhuYnCS711B/aGiFW42zC3dTu7hVwpOS3kt4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <38c41bfb-48c6-4408-8da1-2b7d730a6c9e@citrix.com>
Date: Wed, 23 Sep 2026 12:16:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/nSVM: Save L2's CR4 on #VMEXIT, not Xen's
To: Lin Liu <lin.liu01@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <a5702b9bc1d354dac5778deacbc397e76530408a.1790069475.git.lin.liu01@citrix.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <a5702b9bc1d354dac5778deacbc397e76530408a.1790069475.git.lin.liu01@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0071.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::13) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|CY3PR03MB8152:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d7fca29-1c82-4df3-6a72-08df196427df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	N4OMWksP/6Ngg54e6v18okY2MN1iPAHEFJ+mPsQB/ESdfBHlepqFTt7V27tMO+MKIxBM99peC7C5ERFyPJHeBom8Gs9Y1mUbxHBm80wLim/+KyUDJyGoLUZ4n004Ng1IuAf7vo1mg1O35Ww3yg/Ul5wsTK5ftmqAL7LorW5Zd2rf9DHU2aJFmu9NFHZGHCZQ8OarG/XYPHRYjmJpsmSh6OB0mf0AprYXbTsR8dEA9Ot6BsSq5jbmqlqpwLPHX9Ph2LEaMGkHkKvgNsKKbkaYlULOhaUIrGqusKMPTsRrxARWyRK4D9xUytaOEO0CoMJgWMYJnN8ma32EHtDA4EsWXwe+aeZAbE2NOq+Q/LsF/mxmyBi1cROjwqEbnsqRCYnuiROBp22KldFplX0E/IHWmbwcymEnbQnt7Hq+LBGM4aZYI88uNLBK4icN5cXps5QiaDRB01t14c6F3Tx5sEjWMSk4hUK1yJCcx1Mywpl1vEKb/K2dDcV+d/zfLvwLEBLxYgBPk1ubhAuXbkbet0giTNaK9ONXeatsu//d0gz9QfkbCJ4ty2sdn65zudaITur4qZNobMZFY4fQbL9vYJvI73WLxUWTb9x6OXdzvrCzDsGGA5k8926s9BR/LTFUAvYhOcg902vasLGSmsLEk8biF89BCMOTxMkmsrEBd8tJDIQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0lyRVdSam85REFGaEJCaUJIWTJ1OUFWWW1sY2lLd3JlMGN0c1cyTUtnRTN0?=
 =?utf-8?B?QUdqZWZlakdDYnZBTWxSOWJTNTRGVVFUM2VvNUxUREVuVTZOa1ZGalNUdW9t?=
 =?utf-8?B?WGRsMDFmTEtLNFB5S2U2NXozM29UTkkrcW1Ham9nN0l0dTJhUHQzY05wQUNC?=
 =?utf-8?B?TUFpcE9XL2FNVkpzRVVLMlh4MnZ2ank5TUNRcWRHVXFJMHFvL0ROUXUrZjhG?=
 =?utf-8?B?UWRTa2hjR0psOGpZKzZSQmNId1V5RDd0SjZZc21mR1luSEJYZzVvWGpCd1Vt?=
 =?utf-8?B?Uzlsc2ZGZVJZcWRuT2F6cEhRYWdNTzE0MHdiaUkxYWVFd2owUllTYmtSRy9l?=
 =?utf-8?B?bXJHNU9oQlVuMHRhbUV4bTNKd3NhaWEzdEVjVFB3aWVXMmxONFl3YmVHYWY5?=
 =?utf-8?B?QkdOREVSeDVTMUlHQ0NVZy8yQTl0U01nYVA0NFpJdFdEZjYybGF2b05QK2Yz?=
 =?utf-8?B?dHVzZGd4RXArTTBaQ1JKeXdLTGtEN0gyV2E4UE1ZZmhlWVI4a2RldlZWYWsw?=
 =?utf-8?B?WTlUamJQQU1wbVRsT3U2eFV4MmVTQUZKYmJMS3BVLzkxMU5DT2pYQ2lIMGV5?=
 =?utf-8?B?bzdXYzR3Mi90ZnZFNjZvbHQ2VFIrOXZxNitsR0JOWEprbVZWY0hUUnFLZ0wr?=
 =?utf-8?B?c3FCY2pjbE42SnNOcHlNWWFPZE4xaHMrK1UyVkgzaUE3aElMeWIvUno3azlK?=
 =?utf-8?B?ZDlKSWdibjVrcFRrME8yMnJ1ejR3SDVvUms2ajlLdlM4bEhlMEZXMk5SUmls?=
 =?utf-8?B?NGx1L3c4UU45b1FzV0MwR2s0VkhJWWoyL2JRT2EwVHFXWUt4MkRYMjdreTVB?=
 =?utf-8?B?d05wcWZWdC9JNWpoM2kwdlRpeEZkbG5VVXdtWldkVGhKUHdvdUk1aHBBTER2?=
 =?utf-8?B?TDhVQ1VKQlVpRUJZN2FPckROSW9xbzgxdzlDL1ZrRDBqS0NiR01Zd1lnZ3NM?=
 =?utf-8?B?VE5WRkZxZS9vSXlsa3M2bEtWdDdIOEo0WkVMUWtjNTBxUG5YbTg1azlBdDJ2?=
 =?utf-8?B?SitVQ3cwdmxXSEpDZXRnV2owSmNrWkJUTG9mZFpYMTd2alJwV09GeTVHS3JX?=
 =?utf-8?B?OStlZzhWTis4aTJTVjJxWWlHazV3QlBRNkRKVmIwMnRxOXpnM1N5S2phbnlw?=
 =?utf-8?B?VGllYjlCRFI2anB1TWVPRnVsZyt5a3k5WkFIOVNiYkJrMFJNSlYvakh1UXF1?=
 =?utf-8?B?WUxabzdhcVVtWEpsYmE4QXVwdU1sSXN5bFViU0VrZkpuMGhNTncwaXA3MDNJ?=
 =?utf-8?B?QjAwRHpOT1VZQWljZHM1SzRxem5KWEoxNUdPRnNlWmNuQzhBa25sdHk0a0w0?=
 =?utf-8?B?UEdsODkxaDdwcTM0ZGQxZjl1cW1DWjNIK04zWnB1aWxTd1poZDBYeUJmeHNt?=
 =?utf-8?B?aVRCdUlpT2FWQlc4VzBuQmhCUmhpM1JpRG1SNHNyTnNtR2xwNmxwMFJEelpB?=
 =?utf-8?B?RGxwUDlUMEQ2OGh5ZXFLNWd5RUtVRzVMcDRUMXZZVkhKbThvNkQraVlUcjA1?=
 =?utf-8?B?dmhRSG93YkF1a3NPaW8zZjVyZlIxdlpUdTRKS2JVcEpxa1RYNXRvTFppd1lB?=
 =?utf-8?B?UEdub2dFcWFKVGhKS1N0Y2NaMW9kMlpTVWliczhERUp6TkcxRVhZSlBTbXBG?=
 =?utf-8?B?Y0ZJQVQ0TXZ4dUdvb3RlMHQ1QVFvQis3aVVnK2FpbGtnQ1RuRVVCQXd2eXlj?=
 =?utf-8?B?YWhDSlkzU3hxNWEyOUpDMW5Bd1RKbHNrMFA4S3BDNldGcXlhaGpMWnpqZFFC?=
 =?utf-8?B?VldTNmtWTWx1UllQT1hhUHh2WGZ0MmM5RzVWZ1pQdWhGVHJkNG12QU92bUc4?=
 =?utf-8?B?aktucGRhMk1EMFhka0ZLWjdLSTNKelg5dDh1TVRna1dNUzZIZUYyeFVFdWFF?=
 =?utf-8?B?VlFwOFRna0dFTXdoOG9pVHZ2VHRudGxhNmtwb243SVFIOEhEQ3RScVlVWHlH?=
 =?utf-8?B?U3ZxU0FkUHl6emhRWXBYSnBONkJ0bk85aFV5c2pJVkpoVDlDaU8rR0h5K0M5?=
 =?utf-8?B?ajBmUjJITyttbUZtcXFCRUd1ajJqZ0JramVYTVVZeVloejFvY2k0cmN3c2dq?=
 =?utf-8?B?Rmh5TmZQaDNPZ0VHdDRGTGRlSVFGQTNJUVdFTmVqNTJzSU1qZUhZbzM1aTVS?=
 =?utf-8?B?dVllV0hta3R2cjBtMTNvUnNvUHhaaEFxekl4dGM5emtMMkQ5V0xGNjJ3bU9l?=
 =?utf-8?B?S0cyRGkxL0NIUHo5UlBydzFXMHBxVURIeTlkRkNhRTNmU3hOQ3psRjExUDU5?=
 =?utf-8?B?Q3V5WFVhaXFnWDhyaWhNZE5FK3RZQmFRUTNQK2dlR0dOemRDeGlkcnBZSE40?=
 =?utf-8?B?akNrRGwwUXYvNWpoQkFKQ0t2dXBaUnQ2ZGtndU0yL003RW1NMERaMml3eXRM?=
 =?utf-8?Q?dA8kVG7cMo2lcR8o=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d7fca29-1c82-4df3-6a72-08df196427df
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 11:16:46.8112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q2FSVhW96QwrXn2KvYKD32ug2BwkmbHEjnxFP6Wf+BCwtxBPh0Bq6A19Iy3OkZj4y2z4Lcz/hgBkpLkSaidwatjMUs59J8jwqiurgddHkxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR03MB8152
X-purgate-ID: tlsNG-42698a/1790162209-1B4D39EA-A6FACC28/0/0
X-purgate-type: clean
X-purgate-size: 1653

On 9/23/26 10:51 AM, Lin Liu wrote:
> Xen leaks the host's CR4 bits to L1.
> 
> nsvm_vmcb_prepare4vmrun() constructs the shadow VMCB's CR4 via
> hvm_set_cr4(), and svm_update_guest_cr() ORs in HVM_CR4_HOST_MASK.
> nsvm_vmcb_prepare4vmexit() then copies CR4 back out of the shadow VMCB
> instead of the value kept in v->arch.hvm.guest_cr[4], so L1 reads back
> Xen's bits - under HAP, CR4.MCE.
> 
> Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Lin Liu <lin.liu01@citrix.com>
> ---
>   xen/arch/x86/hvm/svm/nestedsvm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
> index a8b15d6eae..8d99b0affc 100644
> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> @@ -1082,7 +1082,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
>       ns_vmcb->_efer = n2vmcb->_efer;
>   
>       /* CRn */
> -    ns_vmcb->_cr4 = n2vmcb->_cr4;
> +    ns_vmcb->_cr4 = v->arch.hvm.guest_cr[4];
>       ns_vmcb->_cr0 = n2vmcb->_cr0;
>   
>       /* DRn */

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Did you consider addressing similar issues with the other state copied from
n2vmcb as well? i.e. I think something similar would apply to CR0, EFER, etc.

As an aside, it is confusing that the same CR value also appears in
v->arch.hvm.nvcpu.guest_cr[4]. The SVM code doesn't seem to use it and I
haven't checked why the VMX code needs it. Perhaps something to clean up in
future.

Ross

