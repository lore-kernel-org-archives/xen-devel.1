Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11063606A7D6
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 13:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=mpgGvMrn
Received: from list by lists.xenproject.org with outflank-mailman.1481721.1685634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQlY9-0000Vt-P1; Tue, 10 Nov 2026 13:06:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481721.1685634; Tue, 10 Nov 2026 13:06:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQlY9-0000Vk-JU; Tue, 10 Nov 2026 13:06:09 +0000
Received: by outflank-mailman (input) for mailman id 1481721;
 Tue, 10 Nov 2026 13:06:08 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Shuaidong.Chen@amd.com>) id 1xQlY8-0000Vd-Id
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 13:06:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQlY7-00AkDB-LG
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 14:06:07 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Shuaidong.Chen@amd.com>)
 id 6af316a2-8faa-0a2a0a5109dd-0a2a4501e35c-42
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 14:06:07 +0100
Received: from [52.101.201.16]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Shuaidong.Chen@amd.com>)
 id 6af316bd-5984-0a2a45010019-3465c9107619-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 14:06:06 +0100
Received: from BL0PR12MB4754.namprd12.prod.outlook.com (2603:10b6:208:8e::26)
 by MN0PR12MB6080.namprd12.prod.outlook.com (2603:10b6:208:3c8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 13:06:00 +0000
Received: from BL0PR12MB4754.namprd12.prod.outlook.com
 ([fe80::ebe5:87e:6d95:580c]) by BL0PR12MB4754.namprd12.prod.outlook.com
 ([fe80::ebe5:87e:6d95:580c%4]) with mapi id 15.21.0569.009; Tue, 10 Nov 2026
 13:06:00 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gMcULA4aLqtmBxkXO3pyd0vqZVb0D7HKaVane9H48KTYS173wU/QQMcN+SsX7EDn3fkneeC936LhI+tF7PmyEHa/RLY9HSADJSD7jUJf9h7VnZ+rFTkqAX949yo0mgR3+gRfB3jOR5uily7XKxHnOpo31IwFwzirNPqtQLz50W94f5oyR7LE2yOmwQN01vHGprhb8G8pKKBwWjPSRlDUNYOW3Cu8h+InuZ99IZRPwC7vXxAE/YALBL5x4EYzNXGeA2QPE+LGbYTzvIFKcT/BO/EZLNW8REB2OEaec6xPagstnh9mBboy1dJLCimnpT/4E+OT2jjdQwC/5nZ+Njb0Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plY/X3S4IxeE2+9jEmCtopgc9f1ulD1AfmuCW9INAtY=;
 b=nSmZBC0BrwNx7fL4Abvt0YsLNUTq8m+/HhB/jJ0BVB4N4L9kk8grg7UZpxHkkem3MlObcmbb3t00BXv5hG9QGKjL8ySwsrM8NRJUml/l1YGhPYvXn+NkiZT/kzqyZxkIPwZXRtYXRlJDwUw1paV129k8mqVp1AKlyhjm1yEj7GeiNi2dYl2QnVqnyQvlt4kqkdqU1txKTDak4Guq0HpP4CPqmR+E6GIGCvAh8pUgQorCep8uIrtWBa2+JGpaUswEhohtjpFroqn+1KIlVpJQCUsqIjzXkzz2y94h3QWzBSgDpTuHk5z118PZfJV1BmRP3KfEYYDEMTDV8CIQMexyAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=plY/X3S4IxeE2+9jEmCtopgc9f1ulD1AfmuCW9INAtY=;
 b=mpgGvMrnH/n9JiPKSOPM8x/AOuHXbgp2oityWvcr2ziB7pxHxB8UQE0NK8sxacE5zKUjJYXDapLn90VSmJF/UKvg6wL/l+6WDlFzTyzdZbT9tQ8hlWvQ45Tdglhjq5bBUGPdxc297vRuC0tnOuA2zT4iN9R8T9cTzQfjV1wugl4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <b3c9ed2c-a49f-480d-b5d6-00b2d9a7fb6f@amd.com>
Date: Tue, 10 Nov 2026 21:05:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] x86emul: mark the trimmed emulator's
 section-internal labels maybe-unused
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, Michal Orzel <michal.orzel@amd.com>,
 Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Teddy Astie <teddy.astie@vates.tech>,
 Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 Penny Zheng <penny.zheng@amd.com>, Ray Huang <Ray.Huang@amd.com>,
 xen-devel@lists.xenproject.org
References: <20261110071231.2888628-1-shuaidong.chen@amd.com>
 <20261110071231.2888628-2-shuaidong.chen@amd.com>
 <d62fbd3d-f3e4-479f-83d8-0f2807162d9d@suse.com>
Content-Language: en-US
From: "Chen, Shuaidong" <Shuaidong.Chen@amd.com>
In-Reply-To: <d62fbd3d-f3e4-479f-83d8-0f2807162d9d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0014.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::17) To BL0PR12MB4754.namprd12.prod.outlook.com
 (2603:10b6:208:8e::26)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB4754:EE_|MN0PR12MB6080:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a4ea282-69ad-4c8e-f2ea-08df3f2b5d98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|4143699003|56012099006|11063799006|22082099003|18002099003|6133799003|10067099003|261028144727099003|261102123227099003|261021121427099003|261026121527099003|261026140227099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	IC1lwt9Va0hMhyOdplKLfmG8V9cw2Nmt4sZVkUbyHxCudLesvvQlOqp9BN0fqBDdbqC8QOuq1h2PtuLFdXCKmUtkyMC2/JFUYS353qM6ZlVu6pmMAu45B4SzngrGFz4p3Rj0UK99fVmU2xmn1aaKTAeOD0UdiZRkgKMO/jGTljM+sS5Q/u9/6RWRsDgmXZE5M6/tRovPCZh8XuVjluTYvwfAjInDIcW4RJIs/Kh0xpEimut/pN2p9atUXTqBViQbi9YdEHAsznDeJohQHMTOdajAMTeCyEqUEcUYKryn2bnU/BsaoOf9Lv9+GoNr5x1VRsDpWdJckpnAINRqankMxu/FrIG9vTUx5lHb4os0YWJA37V12jo8gg59RW331nKj9ospXCOf8touBjEMCEPUH89uC2hSygoQO7qJllOnq2qb1hNmwqPFh2oDKxV9eumxPBWJzI/4s/cXZNRCDZaLTB1uFPuHFnDsMhGNXoI6POtPWcbLgo4+ENcP12xPeRygEv1qouNjYBXUx3TEdVy9rcbQvzU2D7K7rwBmjMbhT751QBZWcUUzBC/dWxcJYL/+e4RkM8Q3hRW06ONE1KfS+5heys8uAGzVcukjm4Gc/RH6FeLOM72R3LnK8Kx3kylClh/iXTu0hurYXN/ZRqKAWMQfubj1JIktuBy6NdRfOOU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB4754.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003)(6133799003)(10067099003)(261028144727099003)(261102123227099003)(261021121427099003)(261026121527099003)(261026140227099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEFVZjIrTjE1eDl0MHdCNFVQOUtqRkwyOWtEVUxrb1cxdW9YeU82WHFvWTVm?=
 =?utf-8?B?SGJOandtNGd3SitpTFZpaXBFWmhaNmo5S3hvUElrWDRTUi9yQ2pKUEkzbU5j?=
 =?utf-8?B?bkRpTlNwMzVGQjdocDFNamxPUmRSWUQrbFpmR2MxTnFjd3RwVnNvdXVRcE5j?=
 =?utf-8?B?am51OWVxSzN3R3BROFQyZ2JwV0tzem5vcS9kV0FjRmN2NklBUWFMMGVLZFhW?=
 =?utf-8?B?WFZ0cmJYaWs0bGpmenI4UElreUdLTGFoSlJKSHJObU9sWTN5dXJPME1IUVBi?=
 =?utf-8?B?MkZLT2xHQmtLOC9LanQwaTlmOXdiQ2NCY2xVa1JPdzZFVG9scWxicVZldkxu?=
 =?utf-8?B?dVdLbTVQc3QyWDhWMEk0QlVuQ1doK2ZRalY2ekN6TGRpeGxtV3dhNTdHUGVm?=
 =?utf-8?B?VWNGTWRaYjZUL1k1cnVmeCtlZnF4bkdwTUI2ZTZmeElKQmt2QjVrbFZLTjdo?=
 =?utf-8?B?MUE4MXh2RkRpYTZsMkZnOUlGZVNKU0p1cjNjNVJ6Q2dBK3JheUtSMEJRbEda?=
 =?utf-8?B?V0JyR2RrVFZkTVdHakU2cGkvVDh6bXFuN2xPZ0Z2NERaRVVDdlBSUUVVQjQ5?=
 =?utf-8?B?T3k4TkpDSVZ6ZUlRMGI1Tkd1VU1kRC9UaGEvL0JtbUs0blhuRzBKZ1RoQTBk?=
 =?utf-8?B?ZzFieUxYMXoyMnFqZ2tYbHlPTE1qUS85VVAxRS9YRy9nQTlLemNOblNmWnBk?=
 =?utf-8?B?TzNNWVQyRW1zb0lkTWtYTEpsZXRIQWpySHViODZMaWlBZ3JicFpXNCtxUTNN?=
 =?utf-8?B?dHk5OWtLNHNrV0xQeTVRWi91b09YM2RvRlowQm1tbldUV3Y5UENZblhpeExl?=
 =?utf-8?B?a0plcld5Ym1pbE9QbG5ONlV1TDl6eW5tRzNSaHBuTHVLbWF2Ti9teUVpZWxW?=
 =?utf-8?B?aWgxYTV1ZzZKeWlaUTR6WDhRViszQmRmalFqREJ5czZnWkxGWmhFc3dwZjF5?=
 =?utf-8?B?djAzbERnL0treDl1UUswRVlSeVhBLzZHSU5maHovc0EzUTlqNmNHUHZQR05h?=
 =?utf-8?B?Y1V3ZDYzcWcrV0tNNmNUWVlaZDU0T0k1ZlVvRElHQUFRZDgwTFlhbWRxMzBP?=
 =?utf-8?B?SjB6VmdTMTdPM1QvUUFJZDlmbGhPOWpMaWpybmJyTFpXa2lWWVkyb0EwTGdK?=
 =?utf-8?B?a2YvNHJheXRObXBRa3FhcEQvTEdoTy93L3JnbVErRDBrbWF4cm8ydWZCVVNn?=
 =?utf-8?B?dXJoQzJOUWdVNDZBTDFJSk5OUEZhS0RMWGFicGd3dTE5TGFHaCsyM2xFQ1hx?=
 =?utf-8?B?NDQ3ZDZqalN0S0dxNjIxSEVBbDNVU0pzd3pOQTZUWTJBZzg0Mk4yWTBLYkpy?=
 =?utf-8?B?SlNRdmRMN0FXSUdmQ1kzdTUyejJ4UkN1TUMxK2dUSENFazlqcmJvZWRsNCtu?=
 =?utf-8?B?QjdlYVdwY29oOFk2UWVlQ3JiekFodlhVRUVmdjcxSDFmeXRwN2o1emFKRXRn?=
 =?utf-8?B?RHJpaTdwOFZvc1BkRkd5UmJ0NG9OVVdHY0hGRE1iU2Z3MDZCMVkxWHdJejBO?=
 =?utf-8?B?V0dDVGdKbER0VURsUlZvWXNQaG1pcVZyYXVkUXI3Y2ZidUIvRlNKU0JvWXlO?=
 =?utf-8?B?Q3dlMThPa242OHlReUJnSkEzVkNTcnFLYS81TGxMbjRwc1lDNGU5Z1kzRXNN?=
 =?utf-8?B?M0FvMDlZVXo1VUNUNlJpK3dsTnRMVnhKVjJoeFJMN2ZoM1BkTG9iamw1T20v?=
 =?utf-8?B?VUNBc3ZUckppaGpEQk5xaU1tdWFaZ2lsaWhHSnM1TVFVWjFXOStHQnlhWVVN?=
 =?utf-8?B?SjZDd3BHZ3pSTGE3cUtld2JmMUJiOUhndnFYTjJReUgvOGlLakFnanEwVmtt?=
 =?utf-8?B?ZHh4QlJ0L1VneUo2aGJpYVptQXVSUFV6d1doZWlkd2ZuVE9JS3UrdG1JYXd6?=
 =?utf-8?B?WGNtMUI4T080MUFrOHJOR3IwZWdhd08vaFJOWEhNY0JJWE5LRmxFeXZqcjc3?=
 =?utf-8?B?RDJLdTMxZUZONHRlRnhiU2Y0TjlDL05xd215VTJad28xMzNSYzNGQkRXUnJW?=
 =?utf-8?B?T2xQY0l0RXdEMFlnQ3lEMnFOOGJxangvbDhwcEM5cnduR0JicktuMk50TXpC?=
 =?utf-8?B?ZjJZSEdiSWNvWFV6Rnh0cmtEa0FaOUtDQmMydlhRM3d6VG1EdTl3YkFqR25r?=
 =?utf-8?B?NHZ4eXNZUzJiaFNmZXRYSk9nNGpzR2FaMnpzdFhkek1vVVl1KzVoQjZ1MXBL?=
 =?utf-8?B?S1BjWHFIK3pxUG5jdTF5VnZtZnpKUGdFaVFXa2VxOGt6R0crN1JiZHd1Qllz?=
 =?utf-8?B?RThhYytGSWYvdmZJcnRqZXpka1JvNkJObXRLS2l4RDJQSmFicXY4cklGS3pJ?=
 =?utf-8?Q?6y3C2cCwuooQb2SyBp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a4ea282-69ad-4c8e-f2ea-08df3f2b5d98
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4754.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 13:06:00.1160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9u5zUZQw65VEXGDjp8eH5+WGXfYIDukJ/YDVvd9kMDqwkXRQHOYjoEx5Xrk4xVrhL4kJpOrygO+U2wr8nKNqMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6080
X-purgate-ID: tlsNG-d62444/1794315967-BF262757-913E041D/0/0
X-purgate-type: clean
X-purgate-size: 1914
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/10/2026 5:30 PM, Jan Beulich wrote:
> On 10.11.2026 08:12, Shuaidong Chen wrote:
>> In builds where the FPU, MMX and SIMD sections of the emulator are
>> compiled out - with CONFIG_HVM=n, private.h defines X86EMUL_NO_FPU,
>> X86EMUL_NO_MMX and X86EMUL_NO_SIMD - every `goto' targeting
>> simd_0f_fp, simd_0f_xmm, simd_0f_ymm, simd_0f_cvt, simd_0f_mmx,
>> simd_0f_imm8_avx2, simd_0f_imm8_ymm, simd_0f38_common and
>> simd_0f3a_common is preprocessed out, while the labels themselves
>> stay.  They are unused by construction, which the build already
>> acknowledges by passing -Wno-unused-label for this translation unit.
> If we choose to go this route, why would we then keep passing that extra
> compiler option?
We'd have to keep it: patch 1 only covers the 9 hand-written labels,
while the 82 labels coming from the CASE_SIMD_* macros stay unused in
this configuration, and the compiler would still warn about them.
> As to going this route - I wonder what the other x86
> maintainers think. Afaic: I can live with the annotations, but I wouldn't
> be over happy see them appear (as their amount is only going to grow).
Fair enough. I'll drop the annotations, see below.
>
>> Say it on the labels as well, the way the rest of the tree does
>> (unimplemented_insn here, done in blk.c).  That also clears the reports
>> MISRA C:2012 Rule 2.6 (advisory) - "A function should not contain unused
>> label declarations" - raises against them, with no new deviation:
>> docs/misra/deviations.rst already recognises __maybe_unused as the way
>> to express this.
> Emulator code is excluded from scanning in various other regards. Is there
> a particular reason why this rule needs complying with?
>
> Jan
No strong one. R2.6 is advisory, and the reports only show up in an
HVM-less configuration that upstream's ECLAIR jobs don't analyse.

-- 
Thx and BRs,
Shuaidong Chen


