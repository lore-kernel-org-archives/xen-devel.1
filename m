Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC37C79F82
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 14:09:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412080.1642567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3wVr-0001j1-CH; Tue, 08 Sep 2026 14:09:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412080.1642567; Tue, 08 Sep 2026 14:09:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3wVr-0001iu-9T; Tue, 08 Sep 2026 14:09:27 +0000
Received: by outflank-mailman (input) for mailman id 1412080;
 Tue, 08 Sep 2026 14:09:26 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1x3wVq-0001io-NK
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 14:09:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3wVq-00GkFn-42
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 16:09:26 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aa01715-8faa-0a2a0a5109dd-0a2a450ba786-4
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 16:09:26 +0200
Received: from [40.107.208.52]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aa01713-b7e8-0a2a450b0019-286bd0344bb3-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 16:09:24 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by DS4PR03MB8446.namprd03.prod.outlook.com (2603:10b6:8:322::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 14:09:18 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 14:09:18 +0000
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
 b=sSa+SlxtlDRH7MLMeJhbGOTkMCKUxW9AsL/WzzhTcs9X9eBhfA93nmpkXf0t5YOmof88Qh3WheXhRTia/+c0KJjamttcUUSvnv3bLImZqEL3vO/Etj7PlyxLrilimnkPqZK1127o2tKI4WIYMvKZAeI8yQEqavqhL6VUqQfbJ6rsyAf/qzJl6l8aV6EQ1TihfkwMK0Bfo8TmcV7Yyz9HenZRFwnbkKDts1AvWTKGoCuhuQFQuYI80Yg+El2GtMEp/jguJn3WlBegKBGeI1oXXexnZc91jEJRnpEhJBdR1ggvXXCb6QPFAtyFUGFHzx8ewCRWtLyZGWHvjSoLeLu9Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UpaGsNzzJWRgZ78NXPfKGfndninYraoAyb0SMbIgvtU=;
 b=tQQlQQEATJ88rmDVJQF4V5/Zl/IKMHOREICE0j5DHVJFlX/w3hk6yBlbVRELinuQ9mmI9k5R3M/df+YAklfYmlZbGFQtCWNgxeZrsq1wvzVee/TCTDCrZi7rvXMQPWJgZ/GxHuB2Ml72iMBIkIPefthQlxIQQr450wEggRmg3k7I6Hg4t1TBRhz5OmzOJGCwu9nrDqeqqvM/ebo380FnRlNpTRAlnjIxgdF7v11HTrK3W6t/J6XxzNeB1xHKky7L2VFcyUbGOgVKvBYZPmy6vJ9ngP57YGytvfFwCEKPRr9Sb8ByXewq7SPNDeTUk+VDlTxH7tiQUaJvuDVDzFv/mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UpaGsNzzJWRgZ78NXPfKGfndninYraoAyb0SMbIgvtU=;
 b=HJvyBqKZL1245Bq93PQHdaRrO/G4+kowGCdiGYeqh5wsuLfz+XJUWFJsaLbji0EVvQtrY1jr+ftV5s8lOAv8giye6IOSPksAPFwsOP/fJMIobepYKlmJncHADLdJFoKCY5DI3W1Q1ZQlvX9151BShc8rKGXjvR4kxQnLfsjy10c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c9ad35cb-119a-4c71-bc51-d558b4b0ed74@citrix.com>
Date: Tue, 8 Sep 2026 15:09:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/svm: Intercept CR0 writes selectively
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20260904122330.306936-1-ross.lagerwall@citrix.com>
 <8fbc99b1-d98b-4f52-b9ea-bd84e8bfa2ca@suse.com>
 <ef71d534-1bd2-4837-90d4-adf1822fc4ba@citrix.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <ef71d534-1bd2-4837-90d4-adf1822fc4ba@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0082.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::15) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|DS4PR03MB8446:EE_
X-MS-Office365-Filtering-Correlation-Id: ac675d28-14a6-4380-db97-08df0db2c59a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	fTJxtBIJpbeLohIjkVRclHs5Tr5ZowXN0SbBz9K7dE4BwQltrfjxRIot4lZHPjrTzTcrKod5bjOyfzS5i6H8p5O4A4owaA48AVGlljX5E2ML/QO2gjWH5HpMpg3iYAHfhcSWk5kFh53LaiywhrZfhTzYv371hTHPjcmA1G8ds5h71mBDPz1TfW4ULt6sfK39nNVfMzce9U18Fve9uG4c0A52ZVK6STZlgGTtJtcVGXcu2uDcbe56JxWtugdrXQHu/kkoaAFyz5CH07lD0EKEHPMUG2P+XU8ERlIHVBN4KC/UQxlfYeStzZr4xAzTQZNQby133ntgNeaEZiqTelGkJU5GM9dOjIvPqJLwYJ05fG9eWD20nTRshcUtLHa6/kimmm0FZxGiQ70qVSWt52rqfCGwKg0XO4u5i3fQv6yTITQ+Ljmb6IcOUnJfWVplkEzYo+ZRB4ljy5ATvmJbfYdswv/2dnimbAsKf5Gg1m9DlwDliYdISm/up5XpBr0vQNvKM5Ek9PKvVPmvp0Di9KmxFpkkfjJDlcRWvWKbDXDntCqscqnnNhhxt1nMpTc0eaW7uWWsnKJDhVTbEIjFeApGLWKmmMx7XSZFm0SF0XZN+gM8bRj7DzcShSxM90r945V3ejRtYt3MDUAoUO1dWBAXA7fD2h1Bgsc0Y/Unxbc5laM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjZZVjhKNVIyc2xQL0RqelJIa2FxUDFDOWVNUEloYmlReUtyUnE4TTk5MVZt?=
 =?utf-8?B?Qm9FWFlLVkZQSGR0ZENVZTlxTHVJenc1OFBISm1PSE9jb3V3N3VLQzJrKzNt?=
 =?utf-8?B?YXZHUWN0ZGJCY3hvQUJsdERyWm1sc3FYOGdBZ2o4cllsQW9ENEMwQWhhQjNs?=
 =?utf-8?B?aE9KZlV5bVRpNDRudlU4b0NhN3RKN1Y3WGVMSWZqSDZlNkZhd2c4Z3RDWnlw?=
 =?utf-8?B?L2xrYTZqdHRPY3RuOEVuam8xQ3RaaVZJa3g0VkdoV01CNTRtbHJJUFZVdHZn?=
 =?utf-8?B?MzFFOEN5WlVvV1gxUm1WZGhvc3J6M0htWVN1YmljN2hsYkpWalZTSkp0aThO?=
 =?utf-8?B?NjhnbmUwTytka2JkVzJJc1NNa0hXbjdZbjhiVm1QVVpPclhrdVpnVlZjQVhr?=
 =?utf-8?B?cmI0TzA2T0RpakQ3bk8yR0ZGRC9WZWY1Vjk1MnRzU0J0M1k5WEdnV3Q1d3BH?=
 =?utf-8?B?SUZMWVdNUTJ3cGlYczExcVpKb1B4TVhaNE5kZVJBUVkrK01TNFlwUjFGdlRx?=
 =?utf-8?B?eE1hUjhDeDEwYnhJWFUwVkZaWnpDZjBnTHk2WDl1UHpTRlVqV1R5bUhqV2hM?=
 =?utf-8?B?a0Fsbm53STBPTVZmRS9rUXZURHdvTEdXdlp0OWxNM3pmczJwZ1FxTUtMaTNY?=
 =?utf-8?B?RDFEZ1dMUjJybm5HclgvOGJ0SUZnV24rdWVRTWVDZlNObjlMQWhzTHRrTHAy?=
 =?utf-8?B?MnFNZVBURXZoNWZpNis1azV1U1pWeVB0Unh3SEtEQ0R2U0NZTndTNHpxWUNz?=
 =?utf-8?B?YWFHVitsb2xRVldUc2tya3hFSU5Ba3NUb2srSHRFK2lrVW1CZjA0cUVPb2lz?=
 =?utf-8?B?ZmJKY29qZVFvbjlIUjBxcWtDUFRkcFB4VXRkdmlENXR2akhxbHVHVFJqbE9l?=
 =?utf-8?B?aWcxMnZZWE9tL00wOU5qQnRqRnJrVXpua215WCt2NWdIdDlUajQyNVNtZGdI?=
 =?utf-8?B?OGdkc1dsakMwOVJFN0E0VlRqVDRjdlpqUm84azMxeU4rendUM21uMXhDRWth?=
 =?utf-8?B?SEVMczFaclllWnE5MDZ5Z3ZCZk9jNCtBVnAvOHZnQUg2bEk0bmswMTM5Nk1H?=
 =?utf-8?B?RFJ6MnNpbksrejBlemV6N1BldmtvaEUwamdvM1dBci9CRWtLcTZ1c25IZ1Ux?=
 =?utf-8?B?TnQ2a2wyODZRc3JwS0FPSTZJWXdXbTZzSkd2ODFrV3lpazFvaHN4Vi95MmNX?=
 =?utf-8?B?OHNwUkNFMWJhZVQ0QjNja1dCT004ck5yVEZ4ZjBXZ3cxTkg4clNSZWhxZFk1?=
 =?utf-8?B?emFiWk5CV2xUSE83elY3M2JvcnFpdWdFU3l1ZEhiMTRPaGZsMk5JOHBGc2JE?=
 =?utf-8?B?blJvSUU3b2lWTTRxbXNacG5uak4wWlRuUHI5ODIzd2JreENCRlB2a3JpVThH?=
 =?utf-8?B?MWNtakZjclpDaG0rMjF1TVZLS2REa2VuMGtrcDhPU0J4endrUUFpRW44aE1E?=
 =?utf-8?B?VXV0cGtnMGN2RzV1bWROSnNGL09iL1lxR2FpaTJvRkl2RnBtYTFDeFVDaTI1?=
 =?utf-8?B?dFArbGZQTzl3YzN2UXJ0ekZ4TVplU0FvUjdNWE04c3JKWVdyOUF6bHB6UnRp?=
 =?utf-8?B?RE1zQWhkTG0rL3FFbzVxL1VjZVZTYnN1eVY0T1hHVTdJRks4YlV0MzlxcnJs?=
 =?utf-8?B?VXl6Z3lxc2pFbWthQm9mZDk3SVVWNm1STlVsV2ZDTHc1TUR2V2RLdmI2RVdW?=
 =?utf-8?B?Z01GM2IzZ2xKYjd4K2VEcklJWlphZk1sSlJxRjhycjVTRWlxSnhrNS9GdGtY?=
 =?utf-8?B?VE1tak1uVEtFUm9WcEgrb0RiTFVScnpBZU1qdHh2WmgvMklPSHhvbk1pREdM?=
 =?utf-8?B?NmRrWnM4TGt0TlZVRHh4SVp0QVFjRktCeE5kUXYzSExsWmh2cXh6N29zQ3NN?=
 =?utf-8?B?WGdqVTZ6TzNicTJEcVZxOXM4V3loZGRRSWhkb01oVk1GWXVMTENZMFg1NkZs?=
 =?utf-8?B?UGV3Y3Jlbm9ZWFZXam9pdHlyWU1Td2lZYTdTMktyRmJWaXR1WlNSb3I4OG5v?=
 =?utf-8?B?ZDRieUpMZy9vSTZES2JBeW54ZjJXdi8zeUdSeTU0OUZ6NUUzWnNWS3dWMWF2?=
 =?utf-8?B?ZnVlUWxwY1JCbytxS2IxYlAzVGdjZ3VNcmE3cUpDbUVXMHNIVWVnVEVqMVBJ?=
 =?utf-8?B?cEd0TFdIc3hVWDRROEFSbENuMkY2bmRhSURTQUU2c3QyOUhTcmRyOVNOM2VC?=
 =?utf-8?B?Q1dWZjFJR0V3ZnZrRkhpOUd6Rmk0L2ZVM0E2Sk83MEdUQjNXemJXdnZwVWJ0?=
 =?utf-8?B?L2xiNFZGaml0SFd5RlpDb3V1M3pPL0c4SVhWVW1VTFMrMjdsQ085U1FaYjVY?=
 =?utf-8?B?WVMxM1VEdFIyWXVNN0dUL0cwQi9iVGpBdmNKSlhEZkRLbVZzSlorcjQxRkZD?=
 =?utf-8?Q?UaZ9NZgLH388wUDQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac675d28-14a6-4380-db97-08df0db2c59a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 14:09:18.2219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VSQoF/DxvQiycfOwK9o0pFbO7yxegjV7IoVqCyyk3xD5dF1Z2ny76mJXDehaMu/erU8ost6GiY2Hp4Z+jOi5WIxEV51T1nhjd08aCPhfqqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR03MB8446
X-purgate-ID: tlsNG-42698a/1788876565-196C29EA-D641BD4F/0/0
X-purgate-type: clean
X-purgate-size: 1868

On 9/8/26 2:57 PM, Andrew Cooper wrote:
> On 08/09/2026 9:44 am, Jan Beulich wrote:
>> On 04.09.2026 14:23, Ross Lagerwall wrote:
>>> @@ -2517,6 +2518,7 @@ void asmlinkage svm_vmexit_handler(void)
>>>       hvm_sanitize_regs_fields(
>>>           regs, !(vmcb_get_efer(vmcb) & EFER_LMA) || !(vmcb->cs.l));
>>>   
>>> +    v->arch.hvm.guest_cr[0] = vmcb_get_cr0(vmcb);
>>>       v->arch.hvm.guest_cr[2] = vmcb_get_cr2(vmcb);
>>>       if ( paging_mode_hap(v->domain) )
>>>           v->arch.hvm.guest_cr[3] = v->arch.hvm.hw_cr[3] = vmcb_get_cr3(vmcb);
>> gitlab-CI says no to this patch [1], and I think it's the change above which
>> gets in the way of running guests in shadow mode (as is the case for the two
>> qemu-smoke-x86_64-*-pvh tests). svm_update_guest_cr() has
>>
>>          value = v->arch.hvm.guest_cr[0];
>>          if ( paging_mode_shadow(v->domain) )
>>              value |= X86_CR0_PG | X86_CR0_WP;
>>          vmcb_set_cr0(vmcb, value);
>>
>> i.e. upon reading back the guest's CR0 value we would wrongly record it
>> having PG (and WP) enabled, at which point shadow code would try to use the
>> still-zero CR3 as page table base. I think values need merging here, with
>> only TS and MP taken from what vmcb_get_cr0() returns.
> 
> Yes this is broken for Shadow.
> 
> Shadow shouldn't be trying to use CR0_WRITE_SEL.  What's in the VMCB is
> unrelated to the guest's choice of value, and reverse engineering it is
> fragile.
> 
> Use full CR0_WRITE for Shadow guests, and use CR0_WRITE_SEL for HAP only.

I did try Jan's suggestion which fixes the initial problem but crashes when
dom0 brings up its second vCPU.

If keeping Shadow guests using full CR0_WRITE is acceptable, I'll update the
patch to do that since there are surely better things to do than spending time
making Shadow improvements.

Ross

