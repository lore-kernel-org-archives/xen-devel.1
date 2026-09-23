Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D54C98302
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 14:37:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430809.1653260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9O6N-0006Mb-HN; Wed, 23 Sep 2026 14:37:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430809.1653260; Wed, 23 Sep 2026 14:37:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9O6N-0006MU-EY; Wed, 23 Sep 2026 14:37:39 +0000
Received: by outflank-mailman (input) for mailman id 1430809;
 Wed, 23 Sep 2026 14:37:38 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1x9O6L-0006MO-Vq
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 14:37:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9O6L-00BeHO-3J
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 16:37:37 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ab3e42d-bab6-0a2a0a5309dd-0a2a4501db9c-6
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 16:37:36 +0200
Received: from [40.107.200.62]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ab3e42f-5984-0a2a45010019-286bc83eb03d-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 16:37:36 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by CO1PR03MB5826.namprd03.prod.outlook.com (2603:10b6:303:9f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 14:37:27 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 14:37:27 +0000
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
 b=Mk6EmlHme4d7QuiKzZFEgXXgyr+Jtzp802UUrskyYAhuRKUKZwxxhDxseSl3b7RNf2yWAR9Ls0loFNDUeuw8FV3Dn4ryECbTx2mZqN4K1Z13b1OhIyVy6wbk/Yui6SVQiZizJ+uddi/4a9TR7UYrTCvpudtLXvZULzqxVYU3Jwf8n2VP2I8n1nJDIClIJ7kA30uLYEEe6kwkQhXjmkgF0yiLB5bpdUmG1eE529RE8t+/U00HxIUK/XHVS2VyUPsjyMcEB2aBo+fF+hYvh2bGfzRZds1ua1pwOr97MBL219wQ3wqLv229BV+ve90lk1ohy1w1kSquQvPtYquxGySpSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTO4s41TL6DXseZuSSKT4rCXXUTREqY6kYM3Ro3m/9M=;
 b=adLsNpiMJKPniLuu0G3cxx0hY8BNoUKU7Oy8VMU3YCupkUQyAsTTEuTTMck7Dsn68suETLymoKxYaPEe69ooF+rULTyq0FJi2hQRnpMOn2Aw5QNkfpI9mqAGtoKseON7+oJL1lXzsKLHMCTkOW1PiKfyyi6iIqQwplzGzyhmMA7qFnYPHMc3F6nEELlmieqWvTqf7ppIrY4Ry+6scj5LC66Qe2kIs1lPRmi0e1N5mCZjaOegId6VlDKIdTOPsJyFaBmdvqhfSJ+3FeAofy1UTxDJJf/VaSqpuTUEPOmGd7hI4L+RoCvTHBhc34ld0N0JBC5UI9W3RpHogfCE2kMz1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTO4s41TL6DXseZuSSKT4rCXXUTREqY6kYM3Ro3m/9M=;
 b=GeY4MoMBx0CK+y7V1Gdjb/lbJGRr9ysHmOJVIKkfoj1CYHiP43fLpE+iikwWXLA87wxE4BwPEhautrrT78YmJlXE81XVEXgTVkac0+HjzmoKMAQtwznUtQaGluDdrMTHMNbaFpg3Tp+q07eu257Wzhj390RAInfp26hB10eEIl0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <66aba455-6005-45f7-b01b-ad0e58ff7579@citrix.com>
Date: Wed, 23 Sep 2026 15:37:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] x86/svm: Fix VMLOAD/VMSAVE state handling when using
 nested virt
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20260911151250.1232332-1-ross.lagerwall@citrix.com>
 <f7e45d61-1232-413a-806f-5e041d7b67ea@suse.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <f7e45d61-1232-413a-806f-5e041d7b67ea@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0501.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::20) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|CO1PR03MB5826:EE_
X-MS-Office365-Filtering-Correlation-Id: 30eb4a67-d182-4d63-9a43-08df198030ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|56012099006|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	Y96eu6+sap9m4C1zhR+mYBQCrUUXAW6//x3BMbfRVAiiJMuxbriaegeFdMeBxrQJLOkqIgJESy5AbYTWXtOY30laS8wVrkUwsa7ViekH7vuO5yQ/P+hIyFFdO9jdQgYtKPoOTKSgr2SQ3Ny5ZM9LSAwl/gkTI5nsZR/Q84uQbPpIX8z0jgXJgpuQ5esug46PzOlr+Fl5iJM954DxNzR/39+fRVDD6A4N7XblAvke9i+smFXyPzXfk/Ztyhl0cYDYFJjN2+CGJUScaApJSL2vBVG4qzQmLupt9B+NS+erQMVQYsflsSnT8l36R/e9wX2Ru3VrRRHobbOmG4wvvDhBr0gDUjxxZSN5tN1Y0zOqrlYpwnGslJC8VIZpocn84GrpQ9QjLK6BYVPjAcw8joVBXkma41bjV53LZHM95ewKALAvGfWtmRZ/pugy3nIBJXODswQLTZjknUNCVWwY7+h6QTFzLHdLDP1gke8F6wygKKjO27otweQHXJTGTo0HVeAEYEpzKV3NZDGUODKn4NELEzQpsQkTCvCf6DhztH0urKpoXfZ/s56ZE9Cmez6RmME2r1RtzOnifHah9yViYv+D/k+sMwyNW1qqU5N1uHG0W0WXjt86YMHzOqTgYd8m5+nTRat3a1SHwIU17WOa1bABjF+MapvpEU5OYnBKAPjFxKQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFl5ZVdYaU5SenJrK29zZCtCQWFjQ1l2Y3RXVnVwUTUvS3VidlM1OFZtK3c0?=
 =?utf-8?B?aXNaY2krNEpJZ2M0UE5KYkVuVlFQdmtsdUpSa1hXK3FlQkZ5Q0ZyRWY3dnNu?=
 =?utf-8?B?QWc3Q0R5SjkxbDN0OE1ZNjA4VlNYbjJVeFJ2UGVramU5VS9taExIK2hLTmxp?=
 =?utf-8?B?N3psa3F0V2k5M0Y0N2tydGRCNCszeWUwWWZMVW9GY1cyRXdnYkMxZ3NMMVFz?=
 =?utf-8?B?Q3Q5djhaQjZCdjV5YVlzYzJrS0ZkeUNqdmFTZDVkTktibjhuRThCdlk0Wm1L?=
 =?utf-8?B?Z0w3MlRNTTlwQkdKU3Zvb1c5UWtsQ3Jsb0pVWFNST3pVWVBENlBhVENiS2ls?=
 =?utf-8?B?RDUrdFc5UUZTbC9JODRSVlhaY2MyL0hvMGMydDV6dXMrZkU2WnpURlB3UUpF?=
 =?utf-8?B?RFhwS3poY0d1d1prMHlETStqa2RPUmxTYWFtTlA4Tk4zS2F5RGU1VDlHN1Zx?=
 =?utf-8?B?S2dueTR6c25vQ1VGMjhXWnlISXRyOHA5NmIxVnRUbENtWWRnZWw4a2R2STJO?=
 =?utf-8?B?Y1hBeWxLTjNoK3dIUXFuYzB3L1hsSlI5VkphT0FZTDVNZzRJZUMzVnJrUktV?=
 =?utf-8?B?WVJoQ0kzRkJ4RWkzV1BEUzR6MSt3Mit6SmcrK0RtdkFOSGlaK3UvTmZOUHdj?=
 =?utf-8?B?eVUxOWhVcS80L0poUWhPekpRQTBzdUdERE0zZTdtZkc4OE9YUHU1RTRtQ2ta?=
 =?utf-8?B?cEVUaE9FMGRNWEh6S1l3a3g3SGlpUTJNVUJ0cytuV1BnT1hKb0J5a2ZlVU5y?=
 =?utf-8?B?T3RUa3J4MmRFOVg2a1hxd1JWbjNabE81QWsvOWFGN3ROY2ZtN0g4c0d6M0tS?=
 =?utf-8?B?SG1UQ0F5SzIvV0RIQ0p3MHZUM2pKUndyOUFLQnhsaDNDY3dNMHdSTEFQODZm?=
 =?utf-8?B?ejJOVGFHcVJTVU8wbzlHVTdEV2c5YWRWUFVyZDdabjl0S2kwT1JUQWJGMlp5?=
 =?utf-8?B?QWlUMmloZC9lbzBlVmxhS1M0bUVHaHZaaVBHSHpRY1B4Vk0zZVk5TUJ5RnA4?=
 =?utf-8?B?dTVrUzBzZExkSExTL3h6RkNOdEcyYUJqcTBYcTRnRThQaVFLTjFPVVg2dFhi?=
 =?utf-8?B?ck5Fc25ZTGVYVWg4a0NKMHVGeUhxQjZaSzU4ajZjaERWSzdYdVZwYndIeEpZ?=
 =?utf-8?B?VFJNNHZGMHdHWElwQVI1cWNVcUxmWjY0ZEtHdkhOMjB5Rnc3VTJLTlM4RzBo?=
 =?utf-8?B?TmZoYUR2aE05VWsvQWlFekRDYmdSTWJhMGpMenBta3k3WUZGYzJYY1dEYzEw?=
 =?utf-8?B?SFh0dzkxNHJ6M2lEKy9xNHFqdXRlZFpteTV1MjlhWjhIbHkyem41YVNIVW92?=
 =?utf-8?B?Z2ViRldrK2wwRW5XNDZOczBha2t5NGxBZ2pnNGlYN0hiRCtMZGxHMzNNS1c1?=
 =?utf-8?B?Sk9UWnZtakdJZG9tYzZjYS85czlaR3R1NTZBR2ZYQ1pTM0k4N2EwSEM5dHp3?=
 =?utf-8?B?QzJGcHpmWXkwSzJON3pzMWdKMENIWjdhOWVPcTdTKzVvSjRUNGZ4aVhsVkQ4?=
 =?utf-8?B?cXhnSzl1Yys3MkN1YnRwRDVSMThwUjFyYWNOY1Evc0JtV1VTVjhFUGVCTGlX?=
 =?utf-8?B?N2NNTGJYY29qeEJWQ3FvWWZYaUhFRVpJOHByMnJGRkhRbEVDbXFyc1J5d2JX?=
 =?utf-8?B?WkFwTitVazQ5TFIzd0kzRG9hTjY1UXdkWW9SbVlBZ0dxL0h0bm91NENGKzdw?=
 =?utf-8?B?cTZPYzZrRXhXNnlhblhzbmdMTk5qRkhZcVBIeXZENEJmaCtiOS9VVDIvWEtj?=
 =?utf-8?B?U09ZSTU0NUVBdC96SEtvU0xaVXF3SDB1cVdqck1uK29sSG9iNm1DVkRCQnYx?=
 =?utf-8?B?L0RGMUdCQWhZMFlrSklaYm43L3NLNXlCY21nVU05bTBvcEp2SVBtRndDK3pV?=
 =?utf-8?B?SUNEYmFsTUtiYTF4N1kxZUU5UE1iSW1RNS9kWWJtWVFha2V0WmxUclNrNlRI?=
 =?utf-8?B?UzMzaUtGZDAxbmRjWERoK2lqamI4all4aHBmMEt4b2ZKeXUrd2ZRVWJCV00v?=
 =?utf-8?B?bG1EL2lJZnJmYkFuT0xHYkpITENEcGpuRHQ0Y1pYdzZwZEc0Vm12dzBYYU1M?=
 =?utf-8?B?RTEwRHFhUEMzN2kyV2tHSnF4Z1YycVVPMFM4bS9LVDdNck5aMjdSeWdFYVRo?=
 =?utf-8?B?UDIxYjVBejNZb3pvWkdLTnRHdVY1aTNiRElDKytmKzFCWG5ESC8zYzJ5WTRr?=
 =?utf-8?B?dFVrSG12Sjc1WHMxRGFRYlN0WDBXUDhlMmo4Vkh1Y2tmUlRqYUMzcmNObWc0?=
 =?utf-8?B?S2IrVGlwOXhXbmhPS290Y1dVSlBVcHV0UXhOVHpmZ3QwNHI5OHQ0WnhnVHMz?=
 =?utf-8?B?OEZCR2JUSDFUanBOV3F6TEFBMDJuUVB0RFFua29sRFZhZkRySU84U0wydTZs?=
 =?utf-8?Q?9xRB0gKPTW+5G+pc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30eb4a67-d182-4d63-9a43-08df198030ac
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 14:37:27.4835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6YaJDMEGrbplKotJhaFiHg+kK1wRRrgDsm5EymEo0p0bdHycIljUbmsX6G+SMhPu8FkFsSj54iMk3U0Q66ZJmmMmGliPTieWHLSZJvgv3z0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5826
X-purgate-ID: tlsNG-d62444/1790174256-C5341757-FC0CD747/0/0
X-purgate-type: clean
X-purgate-size: 1317

On 9/21/26 12:21 PM, Jan Beulich wrote:
> On 11.09.2026 17:12, Ross Lagerwall wrote:
>> --- a/xen/arch/x86/hvm/svm/svm.c
>> +++ b/xen/arch/x86/hvm/svm/svm.c
>> @@ -444,30 +444,30 @@ static int svm_vmcb_restore(struct vcpu *v, struct hvm_hw_cpu *c)
>>   
>>   static void svm_save_cpu_state(struct vcpu *v, struct hvm_hw_cpu *data)
>>   {
>> -    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
>> +    struct vmcb_struct *n1_vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
> 
> Here and elsewhere you assume that vcpu_nestedhvm() is legitimate to use
> even in the non-nested case. I think that's heading in the wrong direction;
> I think that a hypothetical mode with CONFIG_NESTED=n and the entire
> struct nestedvcpu wrapped in #ifdef CONFIG_NESTED should still be possible
> to put in place, without meaningful rearrangements or renaming besides the
> adding of the respective #if{,n}def.

This assumption already exists, e.g. see svm_create_vmcb(), svm_destroy_vmcb(),
svm_dr_access().

If you would prefer not to introduce any new cases like this, I could introduce
a new macro, e.g.

#define vcpu_n1vmcx(v) (vcpu_nestedhvm((v)).nv_n1vmcb)

and then for the hypothetical CONFIG_NESTED=n, it would resolve to:

#define vcpu_n1vmcx(v) ((v)->arch.hvm.svm.vmcb)

Does that work for you?

Ross

