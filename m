Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D788EC55822
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 19:37:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382618.1625963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrKx4-0008PM-T4; Tue, 04 Aug 2026 19:37:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382618.1625963; Tue, 04 Aug 2026 19:37:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrKx4-0008PF-QP; Tue, 04 Aug 2026 19:37:26 +0000
Received: by outflank-mailman (input) for mailman id 1382618;
 Tue, 04 Aug 2026 19:37:25 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wrKx3-0008P9-L1
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 19:37:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrKx0-001bId-Qg
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 21:37:22 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a723f5e-5cb7-0a2a0a5109dd-0a2a4506b5ba-20
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 21:37:22 +0200
Received: from [52.101.201.25]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a723f70-195a-0a2a45060019-3465c91949ac-4
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 21:37:22 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN7PR03MB283467.namprd03.prod.outlook.com (2603:10b6:208:5f7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 19:37:19 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 19:37:19 +0000
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
 b=Pz2DT61shBSEzN8w+Gte4E8/Pd/ITPXBVulHj3lEE+fBPfkikKw2loC6poxtEFa57Z2+kjyLZuWdwnIE5f8jU4EE+t02Qq8yCpXBBCd/BLwNJrYg6chF7UqcN08DblvUOJIh9eYIFB0u4RC1w+CcOiT9oP2BV9L5Ik/uICs+NdNHwAan/OApBd2RlH3NzSAVz9bVgodyPxcTZt2ipUnl9ADeMYZQDqkBZIw8iKSXQVKDcwOY6qYQPcwSpGVLdcKm3YnPT6bIbJ0v10TkYkYbtZKCTJvxKYbyDbd04jTU6kiN4q2S5F/S3c+5AiuTMGiSZLdngdV1wEBnFzlZV3Prog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHm4HRFiqf/aeTm09glhME2FcmaxvO1JNLPRKicy50A=;
 b=QR1X279M1ywxMJXfgThHE10EYi95003jbNHG2g4zSieqAB+hjsj22OnmshUrwkvFJkVpQOHC+eOvhbvUh86aIitifkU1D51UWI2r0R9lvfT+R3Y0OuJfFqavkw1YYBwbYklyG6kbDtPKR+T8B+xeuQPdTrZG1PN7tgnW0Qn25dsTdkOkjvdCE909xoR3s7RjM3bopiVyYOaVPmxArgJ53LdHwCBbVtjD61lZqFuZEguEpZw6Yf0/sSBjn+DHQ/viGnOTJpMHC/k2MCDNVaWGKDyZBMUeJxYse3qF63WgbgoUr9szH5ZsNTOPajUEoN0h1Sz27jNOPUAI6muJoPuHVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHm4HRFiqf/aeTm09glhME2FcmaxvO1JNLPRKicy50A=;
 b=kQTtaA6y9ktN8sVnn2KOD6Td1oHzs/MExgzizArhbwhOuGrdOJ+DhmCnsPBVMHJghDMoeCtci3ro6OBug+nyvx8lmOq8orugL5cbejiD76gIjACu/aVDiIR1M4BgIyKl4TREwbMhJTmxrIv83mhJtHQipEsbx9wcptY4eVYxzYk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <21d3fae8-e9b0-4c8a-a7b9-483a0257e44e@citrix.com>
Date: Tue, 4 Aug 2026 20:37:15 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/5] tests/x86: Introduce a userspace test harness for
 x86_decode_lite()
To: Jan Beulich <jbeulich@suse.com>
References: <20260803072006.9678-1-andrew.cooper3@citrix.com>
 <20260803072006.9678-3-andrew.cooper3@citrix.com>
 <dd065a33-0105-4527-92f5-f3f127422ee6@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <dd065a33-0105-4527-92f5-f3f127422ee6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0317.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN7PR03MB283467:EE_
X-MS-Office365-Filtering-Correlation-Id: ba013c58-5bf0-435c-5976-08def25fcbcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|56012099006|18002099003|6133799003|22082099003|3023799007|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	QhtGUmJutLjS6bN9Hpok97xSpWokAhiELYDrnUpg2drmn8p/vl8xDGm/MVRbOYn3t+GwF6L3n0356RdnyvxYmnC90ZKdzh0aNlMvcg/r2A+wZgeblbaTQwJ/C5v1cPEw8EwKfiO6140TRXNtNSPLRbUCEQ6Te43b+3EPSs3FQGOLeBqwOkUdGwG+aNRzuGnQnKcouO7ClPLhW+OjyPqdC/FLK/X8Se2shmgvQ0IMp/r0LfYtmc+lNZNT5+jKyYKYh4M7//eubOBN9FtDmCFkKSwgYkBFOiaKCxqrkQmHvKZjzFNo53x7xNJXeQSNwRRUTPOS9IbtkivUjeiwOx7cZplESgehe2zPHo7F2DGSOmoklQQokbxGns91olEDlsjO2WpKS5ztM05o/2hMqjjN5/HlHT133ws24Z/TZRA8uh+tcbmlpFVWs6WEBN7kRBt8tf8IKSEA+1eYHzhJsNTtaNVrX5FyqHzyNCrb2I1Abkcc/CHMkFT5M0BZJtuKw+tlQxzuUCqNBcUivhH4cdLeei5xFyLp6Et2iuKPcXulADWHzbNa/mwgcToI39cWu+Mly+wKU7UqSYguHkIcx+7TAjrlNqN5jeGsd5i4KihavosYTavlShbR7M0st52qjulgC/IQzCNMFkfnb8J62kL29wM+AKKlGp0Vw+1Lsmbr8VA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(56012099006)(18002099003)(6133799003)(22082099003)(3023799007)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUloclFlajBPL1JpbENZdytKRFBPZVk2UmR2WjZFRUVwSVowV21pamt2aTJ3?=
 =?utf-8?B?VXFYclROQkNRS0UzeGkzdWZDYWw4bzU2YWlXbUp6WVFuY3VrRWFuSTVwSndr?=
 =?utf-8?B?eFlGMFlwUWNVakhZOHprdUtiUHArVmlHSURPSWxtNnBJOURYb2JJbDBIdWF4?=
 =?utf-8?B?ZDlEcWkvZEdOZjZiMW8rOTlvakJpZkRqK0NjT3VqZGk4dWovYnQ2T2k1WW1I?=
 =?utf-8?B?N2E0MFlHZVZETFFsQmNiTVdFUDVtME8xZHRqMGJzdmo3RnZkSTJoV0tOUHNp?=
 =?utf-8?B?MDNwMmh1YTE1TEt0YTZrTEhnWmdLR1Q4Y2RtcDB3M3MrSTVwREdDdVVnbHFJ?=
 =?utf-8?B?bFVYdklUWnp2RFAza2RVdXNMYllYTHkrWm03NkZWUGdxNjRUdlR5SjJ5Wlk4?=
 =?utf-8?B?UjlLUldEYnVud2EvdG5hY2xxbVEyNUQ1Z0cramg3WjRkeDluQVFyTkZUSW9R?=
 =?utf-8?B?UVhRcCtNeWJRRnhBWGxSMXVFOWJCTHljSjZrYTVMT2NCZUhrY2NLb25jOVB1?=
 =?utf-8?B?SmoxeHltSjZJQk9VRHBOVFg4NFlSVnNXYjBtT2Z4V2I2MUo1MEVGeFNEcTJo?=
 =?utf-8?B?QllFNmNycGg1Rm9GSm5OTjBCU3g3Wk13VFV5ZmVqUGNFTFhQN2NuVmhWN1B4?=
 =?utf-8?B?UCtOOVU0dWJiYnVqVWVLWWI3RXBWNFNERXNuMG42MFBWTWh3dE1zOXp6Ykpw?=
 =?utf-8?B?d2JJd1I3T0pqYXArcTcyUSs2ckxRWVlOOWp0VEZTTTBnRTI5S1BCaFFkQzBK?=
 =?utf-8?B?SWZSWk9zTG1nWkkvajdKWjJMSkRybThLOUZVbDlGTXdmdjVWRW56WCtlVG1K?=
 =?utf-8?B?eVFaVWJaS1Z4MDdETFZVM0pvQlR6dWExQVBzK0gwYTZaSFFqci9panVLOUFt?=
 =?utf-8?B?L3ZidDJyWGVsV2loK2lYVmczRnBHRDFpdVlkdTc0TXR3eUpIV3BGRFRGQS96?=
 =?utf-8?B?ZFhyUVJiUEhVWmpkbUoyTzhWTldPLzJtRU05YzZid3JJdFA4bXNHWVZGeGNL?=
 =?utf-8?B?Ym9Nd0NjRGxUTUgrRGsxQU41NzUwWDJkYXAyN3NkUU5mUDYrdms5TFp2dWNC?=
 =?utf-8?B?VWhLbFhpYU1RYjc3SHRIOVRhbksyQ0FZRTRaUCt2KzBmcFVmK0NuanF5c1Fw?=
 =?utf-8?B?NFM1ZUZ2UTVKOG12N1B2NVFZRSt0VEhIbTAxL1pyd1hWOVhTRzhleUpMdkRl?=
 =?utf-8?B?WW5hbVJWaWJlRm9KYkFmc1cwWnhJNGIyOWxRZXJEd2dWVTluMXVXcnUvS2ta?=
 =?utf-8?B?MktSRGJMRFg3TmRYdUtLYnhwRFdNUkFzUVVRbzdGMGJyTUVxZjlrR0VmU01N?=
 =?utf-8?B?MHAwY2JuWkcxM081ekxsQkVKdzdNc2V0YkJJL0xZZ0x3eURWSC9Gc1B1Wndp?=
 =?utf-8?B?QWpVMUU4YmdVdHFpeG80dXROY0pwVkM0T25ENVZZa3ozK1cwem5yWUNQcmpS?=
 =?utf-8?B?ZkQ1NmJGM2dNNU9lMEpKWStKN3RGMDljTFpKQUtNN3VsWUJwMWE2NzFveUo3?=
 =?utf-8?B?cDBROGRGRGNoR3FaNkphTTVNYitvZ3EzZEwrTVlvZ0xvdFFwRmhZdTVhZkUy?=
 =?utf-8?B?V0FPRmIxRDViWkdrbW1zbHJzeWNRcjNMMjZyS0FJVWx4MkFTMDFsUHRjRXJa?=
 =?utf-8?B?UjRZb1NVaitZMDhOQzMvM0xFNnc2YlNMMGR6R2VQeGI4TXBFcVpPaGh0L3ZD?=
 =?utf-8?B?MitTdHN1K05tK25TbkZFMmNxaWg5d0dYWlRwbjMyS3RlUmw3bHJBRmY3NkFD?=
 =?utf-8?B?Kytock1SSTRZTUlJR0xtM25maVRacEFWd0dNcDFxaTF2YnJEQnc5UHRuZlJG?=
 =?utf-8?B?QVBlenJXd1ZUZUpmVlpoTG1NVE41OG00eFFEN2VGZFdUV1gwcE1aUjBoV0kw?=
 =?utf-8?B?YWJpSGc2Tm40TVVldVpsK0ttc3lXakhBRGR5eFlrQmQ0dFBPdGdwL1AxZDhE?=
 =?utf-8?B?dHJVVk12aEdKd0lSa3dZK0RIaXRGOWFKNmhKemRSRjRkbDBwek9pcXhueVJQ?=
 =?utf-8?B?VWp6NWhBOFhiSU5SWmF1NjFEMmZqeXUyeHg0VGJWRS9BWHFINGg4SUJ0RWFO?=
 =?utf-8?B?cC9GWHFKYm1qZzFrUGcyYU84d2Zsd0ZhVlhoVTlhOVp3V05od3J2Yzg1MXph?=
 =?utf-8?B?T2pRMXVLMHFxYWkwZGR0WWIxNGtNc25YVXRQaHFpanE0dFFzU0o0bFBvQ0o2?=
 =?utf-8?B?SjdZOFhZclEyVVo4THIrYXl1RTRFTzNUaWNHam0wODI3TFlYUWtreW1ZUU9O?=
 =?utf-8?B?UFRtOTRQdmQ0cXpWM2RzTnJaaExDN2J3YWZNTko3QjEwOWplS1RtSy9McGM4?=
 =?utf-8?B?ZFEzMXNRcnhQSGRqSzY0eitaS3hvUU1ZOUl0RWVPSUZlTXdVQXBiZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba013c58-5bf0-435c-5976-08def25fcbcf
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 19:37:18.9686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4jxL75zvnbgXF/nEZh+ly7yKjUzjrJO30RGES9vgdH+ARu0vC0RO1PoUCI4dfQDiw1WPzY221OWGPL1SmM0UfHzRjgL1BmrcteW/5c1ULeE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN7PR03MB283467
X-purgate-ID: tlsNG-16d1c6/1785872242-FE07177B-45415424/0/0
X-purgate-type: clean
X-purgate-size: 11712

On 03/08/2026 5:03 pm, Jan Beulich wrote:
> On 03.08.2026 09:20, Andrew Cooper wrote:
>> --- /dev/null
>> +++ b/tools/tests/x86-decode-lite/insns.S
>> @@ -0,0 +1,703 @@
>> +#include "macro-magic.h"
>> +
>> +        .code64
>> +
>> +        .allow_index_reg
>> +
>> +        .text
>> +
>> +DECL(tests_rel0)
>> +modrm:
>> +        /* Mod=0, Reg=0, RM {0..f} */
>> +        _ add %al, (%rax)
>> +        _ add %al, (%rcx)
>> +        _ add %al, (%rdx)
>> +        _ add %al, (%rbx)
>> +        _ add %al, (%rsp) /* SIB */
>> +        /*add %al, (%rbp)    RIP --> tests_rel4 */
>> +        _ add %al, (%rsi)
>> +        _ add %al, (%rdi)
>> +        _ add %al, (%r8)
>> +        _ add %al, (%r9)
>> +        _ add %al, (%r10)
>> +        _ add %al, (%r11)
>> +        _ add %al, (%r12) /* SIB */
>> +        /*add %al, (%r13)    RIP --> tests_rel4 */
>> +        _ add %al, (%r14)
>> +        _ add %al, (%r15)
>> +
>> +        /* Mod=1, Reg=0, RM {0..f} */
>> +        _ add %al, 0x01(%rax)
>> +        _ add %al, 0x01(%rcx)
>> +        _ add %al, 0x01(%rdx)
>> +        _ add %al, 0x01(%rbx)
>> +        _ add %al, 0x01(%rsp) /* SIB */
>> +        _ add %al, 0x01(%rbp)
>> +        _ add %al, 0x01(%rsi)
>> +        _ add %al, 0x01(%rdi)
>> +        _ add %al, 0x01(%r8)
>> +        _ add %al, 0x01(%r9)
>> +        _ add %al, 0x01(%r10)
>> +        _ add %al, 0x01(%r11)
>> +        _ add %al, 0x01(%r12) /* SIB */
>> +        _ add %al, 0x01(%r13)
>> +        _ add %al, 0x01(%r14)
>> +        _ add %al, 0x01(%r15)
>> +
>> +        /* Mod=2, Reg=0, RM {0..f} */
>> +        _ add %al, 0x7f000001(%rax)
>> +        _ add %al, 0x7f000001(%rcx)
>> +        _ add %al, 0x7f000001(%rdx)
>> +        _ add %al, 0x7f000001(%rbx)
>> +        _ add %al, 0x7f000001(%rsp) /* SIB */
>> +        _ add %al, 0x7f000001(%rbp)
>> +        _ add %al, 0x7f000001(%rsi)
>> +        _ add %al, 0x7f000001(%rdi)
>> +        _ add %al, 0x7f000001(%r8)
>> +        _ add %al, 0x7f000001(%r9)
>> +        _ add %al, 0x7f000001(%r10)
>> +        _ add %al, 0x7f000001(%r11)
>> +        _ add %al, 0x7f000001(%r12) /* SIB */
>> +        _ add %al, 0x7f000001(%r13)
>> +        _ add %al, 0x7f000001(%r14)
>> +        _ add %al, 0x7f000001(%r15)
>> +
>> +        /* Mod=3, Reg=0, RM {0..f} */
>> +        _ add %al, %al
>> +        _ add %al, %cl
>> +        _ add %al, %dl
>> +        _ add %al, %bl
>> +        _ add %al, %ah
>> +        _ add %al, %ch
>> +        _ add %al, %dh
>> +        _ add %al, %dl
> Perhaps also include %bpl, %sil, and %dil?

They're not relevant to this test, and interfere with the intentional
pattern set up.

>
>> +onebyte_row_9x:
>> +        _ nop
>> +        _ pause
>> +        _ xchg %ax, %ax
>> +        _ xchg %eax, %eax
>> +        _ xchg %rax, %rax
>> +        _ rex.w xchg %rax, %rax
>> +        _ cltq
>> +        _ cqto
>> +        _ wait
>> +        _ pushf
>> +        _ popf
>> +        _ sahf
>> +        _ lahf
>> +
>> +onebyte_row_ax:
> May I suggest onebyte_row_Ax?

Ok.

>
>> +DECL(tests_rel1)
>> +disp8:
>> +1:
>> +        _ jo   1b
>> +        _ jno  1b
>> +        _ jb   1b
>> +        _ jae  1b
>> +        _ je   1b
>> +        _ jne  1b
>> +        _ jbe  1b
>> +        _ ja   1b
>> +        _ js   1b
>> +        _ jns  1b
>> +        _ jp   1b
>> +        _ jnp  1b
>> +        _ jl   1b
>> +        _ jge  1b
>> +        _ jle  1b
>> +        _ jg   1b
>> +        _ jmp  1b
>> +
>> +disp8_rex:
>> +        _ rex.w jo   1b
>> +        _ rex.w jno  1b
>> +        _ rex.w jb   1b
>> +        _ rex.w jae  1b
>> +        _ rex.w je   1b
>> +        _ rex.w jne  1b
>> +        _ rex.w jbe  1b
>> +        _ rex.w ja   1b
>> +        _ rex.w js   1b
>> +        _ rex.w jns  1b
>> +        _ rex.w jp   1b
>> +        _ rex.w jnp  1b
>> +        _ rex.w jl   1b
>> +        _ rex.w jge  1b
>> +        _ rex.w jle  1b
>> +        _ rex.w jg   1b
>> +        _ rex.w jmp  1b
>> +END(tests_rel1)
> What's the idea behind the separate REX.W testing?

Testing osize handling vs Imm8/Imm.

>  It almost suggests that
> tests with an operand size prefix also may want adding. Except that's
> difficult, because of ...
>
>> +DECL(tests_rel4)
>> +disp32:
>> +        _ call   other_section
>> +        _ jmp    other_section
>> +        _ jo     other_section
>> +        _ jno    other_section
>> +        _ jb     other_section
>> +        _ jae    other_section
>> +        _ je     other_section
>> +        _ jne    other_section
>> +        _ jbe    other_section
>> +        _ ja     other_section
>> +        _ js     other_section
>> +        _ jns    other_section
>> +        _ jp     other_section
>> +        _ jnp    other_section
>> +        _ jl     other_section
>> +        _ jge    other_section
>> +        _ jle    other_section
>> +        _ jg     other_section
>> +        _ xbegin other_section
>> +
>> +disp32_rex:
>> +        _ rex.w call   other_section
>> +        _ rex.w jmp    other_section
>> +        _ rex.w jo     other_section
>> +        _ rex.w jno    other_section
>> +        _ rex.w jb     other_section
>> +        _ rex.w jae    other_section
>> +        _ rex.w je     other_section
>> +        _ rex.w jne    other_section
>> +        _ rex.w jbe    other_section
>> +        _ rex.w ja     other_section
>> +        _ rex.w js     other_section
>> +        _ rex.w jns    other_section
>> +        _ rex.w jp     other_section
>> +        _ rex.w jnp    other_section
>> +        _ rex.w jl     other_section
>> +        _ rex.w jge    other_section
>> +        _ rex.w jle    other_section
>> +        _ rex.w jg     other_section
>> +        _ rex.w xbegin other_section
> ... vendor differences here. Perhaps the decoder itself would better
> reject handling of operand-size-prefixed branches.

Excluding 66-prefix is easy, but excluding rex.w on jumps is hard and
would require extra logic.

>> +opsize_branch: /* 66-prefixed branches are decoded differently by vendors */
>> +        _ data16 call   other_section
>> +        _ data16 jmp    other_section
>> +        _ data16 jo     other_section
>> +        _ data16 jno    other_section
>> +        _ data16 jb     other_section
>> +        _ data16 jae    other_section
>> +        _ data16 je     other_section
>> +        _ data16 jne    other_section
>> +        _ data16 jbe    other_section
>> +        _ data16 ja     other_section
>> +        _ data16 js     other_section
>> +        _ data16 jns    other_section
>> +        _ data16 jp     other_section
>> +        _ data16 jnp    other_section
>> +        _ data16 jl     other_section
>> +        _ data16 jge    other_section
>> +        _ data16 jle    other_section
>> +        _ data16 jg     other_section
>> +        _ data16 xbegin other_section
> Oh, you even cover the case here. For XBEGIN, however, this can only be pure
> guesswork as to AMD behavior, I suppose.

Remember that RTM is available on Zen2 if you know which chickenbits to
clobber.

I've not tried.  I expect it's more likely that they behave consistently
than differently.

> I also don't see how you force which form you want.

Binutils always produces AMD behaviour.  (As far as I can see.)

This is in the negative-tests section, which confirms that
x86_decode_lite() rejects the byte pattern.

If Binutils changes behaviour, the test will start failing.

>
>> --- /dev/null
>> +++ b/tools/tests/x86-decode-lite/main.c
>> @@ -0,0 +1,111 @@
>> +/*
>> + * Userspace test harness for x86_decode_lite().
>> + */
>> +#include <stdio.h>
>> +
>> +#include "x86-emulate.h"
>> +
>> +static unsigned int nr_failures;
>> +#define fail(t, fmt, ...)                                       \
>> +({                                                              \
>> +    const unsigned char *insn = (t)->ip;                        \
>> +                                                                \
>> +    nr_failures++;                                              \
>> +                                                                \
>> +    (void)printf("  Fail '%s' [%02x", (t)->name, *insn);        \
>> +    for ( unsigned int i = 1; i < (t)->len; i++ )               \
>> +        printf(" %02x", insn[i]);                               \
>> +    printf("]\n");                                              \
>> +                                                                \
>> +    (void)printf(fmt, ##__VA_ARGS__);                           \
>> +})
>> +
>> +struct test {
>> +    const char *name;
>> +    void *ip;
>> +    unsigned long len;
>> +};
>> +
>> +extern const struct test
>> +/* Defined in insns.S, ends with sentinel */
>> +    tests_rel0[], /* No relocatable entry */
>> +    tests_rel1[], /* disp8 */
>> +    tests_rel4[], /* disp32 or RIP-relative */
>> +    tests_unsup[]; /* Unsupported instructions */
>> +
>> +static inline void run_tests(const struct test *tests, unsigned int rel_sz)
>> +{
>> +    printf("Test rel%u\n", rel_sz);
>> +
>> +    for ( unsigned int i = 0; tests[i].name; ++i )
>> +    {
>> +        const struct test *t = &tests[i];
>> +        x86_decode_lite_t r;
>> +
>> +        /*
>> +         * Don't end strictly at t->len.  This provides better diagnostics if
>> +         * too many bytes end up getting consumed.
>> +         */
>> +        r = x86_decode_lite(t->ip, t->ip + /* t->len */ 20);
> For the excess bytes to at least be legitimate to access (not causing UB),
> shouldn't finish_arr emit enough filler bytes?

finish_arr is the wrong place, but I've folded in:

diff --git a/tools/tests/x86-decode-lite/insns.S b/tools/tests/x86-decode-lite/insns.S
index e52c2934c8d8..dc017016b2d2 100644
--- a/tools/tests/x86-decode-lite/insns.S
+++ b/tools/tests/x86-decode-lite/insns.S
@@ -695,6 +695,13 @@ unsup_insn: /* Instructions that would complicated decode, or shouldn't be used
 
 END(tests_unsup)
 
+        /*
+         * For improved diagnostics, we allow some overreading of the
+         * instruction under test.  Ensure there are good bytes to read.
+         */
+overread_padding:
+        .skip 20
+
         /* This is here to cause jmps to use their disp32 form. */
         .section .text.other_section, "ax", @progbits
 other_section:



>
>> --- /dev/null
>> +++ b/tools/tests/x86-decode-lite/x86-emulate.h
>> @@ -0,0 +1,27 @@
>> +#ifndef X86_EMULATE_H
>> +#define X86_EMULATE_H
>> +
>> +#include <assert.h>
>> +#include <stdbool.h>
>> +#include <stdint.h>
>> +#include <stdlib.h>
>> +#include <string.h>
>> +
>> +#include <xen/asm/x86-defns.h>
>> +#include <xen/asm/x86-vendors.h>
>> +
>> +#include <xen-tools/common-macros.h>
>> +
>> +#define ASSERT assert
>> +
>> +#define printk(...)
>> +
>> +#define likely
>> +#define unlikely
>> +#define cf_check
>> +#define init_or_livepatch
>> +#define init_or_livepatch_const
>> +
>> +#include "x86_emulate/x86_emulate.h"
> Why does this end up being needed?

Well, this for starters:

main.c: In function ‘run_tests’:
main.c:43:9: error: unknown type name ‘x86_decode_lite_t’
   43 |         x86_decode_lite_t r;
      |         ^~~~~~~~~~~~~~~~~
main.c:49:13: error: implicit declaration of function ‘x86_decode_lite’ [-Werror=implicit-function-declaration]
   49 |         r = x86_decode_lite(t->ip, t->ip + /* t->len */ 20);
      |             ^~~~~~~~~~~~~~~



~Andrew

