Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294E8CDB47F
	for <xen-devel@archiver.kernel.org>; Wed, 24 Jun 2026 08:22:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1344648.1603694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcIrr-0006SO-WE; Wed, 24 Jun 2026 08:21:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344648.1603694; Wed, 24 Jun 2026 08:21:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcIrr-0006SH-TI; Wed, 24 Jun 2026 08:21:55 +0000
Received: by outflank-mailman (input) for mailman id 1344648;
 Wed, 24 Jun 2026 08:21:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wcIrq-0006SB-NA
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 08:21:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcIrp-00GHzv-D3
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 10:21:53 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3b9399-e002-0a2a0a5209dd-0a2a450ae056-44
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 10:21:53 +0200
Received: from [52.101.201.70]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3b939f-93a5-0a2a450a0019-3465c946707d-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 10:21:53 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV3PR03MB7429.namprd03.prod.outlook.com (2603:10b6:408:1a0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Wed, 24 Jun
 2026 08:21:46 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 08:21:43 +0000
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
 b=BO0QzjCg/l3NIfdz1KqnUMdgkG1US8W6H9fNnn+R5aGUGoy7GyLH8fzeVFATbaqpJ84LOYdvLugBVK6nVbaxwu8kVlfGW0oRrj9xiNNlB8xkfZ7ID1kcxu4JgMV/3GLnVwh5n80ZMYJC+l7PnTZzyi0RxciO8FkLG0udVONhzcAy3tgp4P61HJGgoh1NS9M5TSIm9BXYHB+X6sJ/8AyYD9tkjuJfX+/hRLMcNyS2oZk/B06HujFvIgW7XoyaWZLvLynPoGWKWw16Z2tKkJZhwmGINRj32wby5FKFD4zHBOyra5hRDtseZ3nc9SJT/NsEzrmZSo93pcUVmC6eYYWmJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J/CewV62x9WgG/6xZQ2FScq/QDaOt82ejKoM7fyEWoQ=;
 b=UQTmcS1wrm7Xz3hNCQES4yFgBX4DYHxhiHDI/EP6HS3wLH2/pQpeb5h33sv96eNhA9QIDCZeNh7P1aTvUwY+dp1nQPwN8v6CC0tWhygYJPA0In8bXsmKudI7g+wWYaAYBVxmxM4WMOgeMmVWr+MNXg0blQjtP7I3zQiaAjlmrwO1KJH5W/sVCS80ods2inTf2lkIeGyqc4tD1QoyloZ5B4KocGO6YoOe14hPe+4jYG3KIX1xfLNnHDTClAeiM+jMMzKmYGoblvrJje6kuRa+EKHpk1ZzpkEJmCEEa7antWXGMfOuFZpBa2OOjGF/xuMyMu7CCdZQeB71jCyNhiSHsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/CewV62x9WgG/6xZQ2FScq/QDaOt82ejKoM7fyEWoQ=;
 b=yzg0JW9lQxb1cszlEAt7Z7YlAJRJEF7IrwKee/4ppztIRJ0t28MFjuN17cSoXO8YEOpvVx6b+y+APKb2iZLVpmlK2hDv7Urwgnw1RpgnI5+6dYZO1PivKJuuM+4BJUuCG8IGVmxvfBMLnJ8u+34TuKA47NJeSlTDfABAnSjAMD4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <74d7db00-f4fb-460a-b954-942776405f4f@citrix.com>
Date: Wed, 24 Jun 2026 09:21:40 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH] IRQ: drop (effectively) unused flag constants
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <57e4a05b-0037-428a-ad55-08764b84e70f@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <57e4a05b-0037-428a-ad55-08764b84e70f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0556.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV3PR03MB7429:EE_
X-MS-Office365-Filtering-Correlation-Id: b77a8f7c-75a9-40c5-36eb-08ded1c9a002
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	bgQYsQVZo+i0rVtKrE0FEuvEhKT6TPEK/lrsjZ9Z7gytTFbOJwlu4k5KkzuZ7nd8yG9R/Z9kypXxRXQYOeP4a7kh76qMVJh42E0uTYqQ3DeGWyNkC2o4RGCCJcUWG6sBJyPzAN7gmx2Tx8aQ620r4Q4yheWL+e1SUFfdpCn6aAVDLTNSCA4AgO9wYjmFn42TgfxOHVsHaoIYlp2hU82nXiLLPqjL7cEnGJrz+iQNsAAcvM8DR3JRkfUyctJUR7TwU3PNX4ksLzCvd+NqGHtHaxph7jK03UtuHvgjsl74J3+zn6Im76SugSUo3aLpKd/api4i6q1PudDRzkJcsLb9lrJJGOH8Xg1PGb0O47yhxiHFAC1zm2I/+hPsBIV5P2rOzB1aQWq+0wEVZ6DNuMdP5Z+dBLii7eVoVCNSRCHPNGW34NL3uIn6u/pBN1E8FZrdnUq1zmdhL/1oFrEnFVPqdhVxImURY65O2snJAMo5ClAGyjZ3jfzB5nR0GVOWZ7I+LYIw685jxFtRvN2hdnBLm6hLmH4SGEE0K4UCIUZeDM38c/b7ComV0iUkSEBO3pOM4+TcsCVnyX1Ntajwbsi2WolT+1RJ2ny+1r4f4GZ14LSGOobLE01LTBIrpnshimy9NTCSEcYsqTmGslTLFHg4QE5ADvy8eU8NiRzQTkAax38=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVpjektTMFhydnMvYlFnVmJ0bjdSQjdGQXFDYU1wcjJsK3VjeHpmYkdrQWZN?=
 =?utf-8?B?N21JUm1iNUZSQWg0RU1vZDUvcFBYMndTNFFMV1JJaTBEcGx3ckI0NDVsaTRK?=
 =?utf-8?B?Sno5Q0pOcUMxU25YTGhBVVNtQVRFc1ZmTlkyRHdVcWZIdUd1bWdsQVdoeVB0?=
 =?utf-8?B?elpoc1N5RkNyWVpzRWY2cVZpWjAzSHBuSURPNzdob2M2bmdMcEMxbHNsZk5w?=
 =?utf-8?B?UkRvemtWWHE3a201NVV1Q29hVlBqdEk0b2dpMmUxVzR5ZkFlTlJnRzcyRlJt?=
 =?utf-8?B?WG1uMUlWL3JDbDJHRTE3dVVpYWQraEJUQUQrWVR0RHRtcHo2cUx2TGt6WnQ1?=
 =?utf-8?B?a1FSNUQ4bkVINFk2SzBrUEVzNjhEcFdvZVFib3NuTjJCWkdFT0lUa1U0UUhT?=
 =?utf-8?B?UWM2cVlKUUxRVk9ENEhwbC9jUjJlSUdQc0FQalljbjZYQVVpWjVBRzF4S2lr?=
 =?utf-8?B?em94RnlsVE5idWtLbTVGOVVEN1U3Nlc3WkpSbFhNZnJyTzh1TFQyUll5b25v?=
 =?utf-8?B?K2huMzhLUCttTTljNFZzZTEyWXdDUHhYSFBkS2RJWCs1enVzTUZScVVFaE5O?=
 =?utf-8?B?Z3l4MXVhMWZoKzVuVThxcGlaVHR4QjgwalpPNVZyNnIvL1pjRUwwcEx2a3Bp?=
 =?utf-8?B?enphem9HNEtjQk5MSldkc0w5TklITnZWazhBWXZNVkM0dkxDQmY0YWpvL2pa?=
 =?utf-8?B?dEI3VEV3YXJHd01tcDRVUC9BS05ab3BVTTZmVGtsWU54N0ZpTlBkbkZ5WWN4?=
 =?utf-8?B?OVlnZkMxanhtVk5GVUE2UHZhY011eTFFbDVhUWNka0VRcE8rRS8wSm1ycVVI?=
 =?utf-8?B?V0RXeEVmNzZFdlIvbVBTTEZ4T21LaEVOK3ZqaEk1dmhYZDNmU3lYa0I0NEJI?=
 =?utf-8?B?WlkxWmhyeng0cG0vMEhPVXZtQm4xdjUrODc3TXM2NXBSVmZxQjZSWEMrRXBI?=
 =?utf-8?B?VmdLdU1JWURuaGs2aUdKczFuRUx6M0ZPdnpkZHBKSWllY0t6Vmk2WE9veERH?=
 =?utf-8?B?TjlIdENUQUVSV3hTelY1TDU3Y2hjT1RVQ2tRTXFVZU93TkdPcDVpRlRHSnQy?=
 =?utf-8?B?bFhzYkRSNFI3ajVQQTgrTkVpWEZCbFhnaHRsa3JOa2RrM2NsY2xPWkF4cWo1?=
 =?utf-8?B?T3AwSUhXVmJIalRsTlZacmxMclovREJUNHFwVHhUc3lnTlU1TFJtU2ZhOE5X?=
 =?utf-8?B?Wmx1U3lrdzc0N3E1cFAvc1A5d29VU2VpbVlFcjhXQld2bnZKUTFINW93UVBR?=
 =?utf-8?B?N3EvUDZYYXB4YkhUck1JQks1M0hGM1FDc20vV0hpaU1NNnhiUjFHRHZDM3hN?=
 =?utf-8?B?b0w0Yno5WUVINXBVYXloenhHeG5hbGpXaUhLNlYvSExCMW1iYllYMTlsWTc3?=
 =?utf-8?B?SjZDR05Rd1NiclZGUkZRTEVreGJ6c3dDV00yL05KNEpzR1EzSTFHMjk1RFlk?=
 =?utf-8?B?Skx0a3lZVXpiWDhJb0dVSUxRRzJWZUQ2d1RSSVovSmhYSmNDOHpTVEVwZ0Ru?=
 =?utf-8?B?UGlpQTVEd0lzN3JXbU9UMHNrTHZXK0NlWDlyTjE1ekRkMTdONHkrZGZ1L2xR?=
 =?utf-8?B?c0tYaFIvcG5UVVNXZXptcVVvczdOenFkWGZvOGpEbWZHZmI1VTBLN0Rib210?=
 =?utf-8?B?dDdNTWpDU09jM1NmMkt4d1ROOHNzdWQ5RU9RbWFXSE42bWhLamE3OWsvL1hn?=
 =?utf-8?B?NWlmRExScjl1VGhnUC9JK3gwSGljQnRIVEg5MklpcFlTdWtVT2doOWt2TlVY?=
 =?utf-8?B?OGNEa2p1VisvN0ZTcFo3TGtrbHlsaUZvQVFiOHVyWndjdVp6MUJhU3VXRVB4?=
 =?utf-8?B?dUFzUnpEZXlKOWorSlUvdVA0U3p1K3ErNlo2RTBuODJoL04vMFVVZTk1VFpL?=
 =?utf-8?B?MmVzTitYdzZEZVVaQk5CeXZJQXlaVG1BTloxS0twd3BSaFQ2a3I1clRCWkpm?=
 =?utf-8?B?bmVQTFgwd05tU1lKbEplYkVYeEtrQWhZWmxXcDNScmNCczU4TkcwN0FEL0wv?=
 =?utf-8?B?MGJhWVdIdnZRL0FKeFg3ektKMEoyUjIxdWVzRDNUSjArMXgzMzIzb3h1VWI4?=
 =?utf-8?B?cVdkVVdsSGpYNzRpSWNFTVZ2STFTT0pMMjM2c2JxTG5WN0paSi9QdGo3NTdt?=
 =?utf-8?B?cWFsS1UxUFI0NnhWeW5SWTZ4NForNVhOemVUN3J4UGo1VHBEOVZxdk5IMHU5?=
 =?utf-8?B?dVBpbkJGYVNBVWxiaTQ1MlpOaUcwczZZYVpOMnhMZFpMb01WV0NSeFFPT0tk?=
 =?utf-8?B?YWg2V3UrNFJwbGpUNUVPYTR2Z1RnZ2JMd25tTXJUZ1lhOEVwZ0QwNHBpYzJK?=
 =?utf-8?B?S0lzVjN5T0RSckNVa08xc09nVXdyKzlRRUE0YnlDREhhZFQxOFV3N2VVNVRF?=
 =?utf-8?Q?3SqHhBKn6vAJjstc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b77a8f7c-75a9-40c5-36eb-08ded1c9a002
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 08:21:43.7207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 05tTy73Bz7QpqfzMNHnt4x5iBhtpEXApLpuK2D4dd+N/xhQ+axwwnxw0FtEt4BnEVcT1AJA2fASVPW6hI6/ONVf5C/6rBOtFmstD6d2sO3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7429
X-purgate-ID: tlsNG-4011c0/1782289313-B3BE3DB8-60E1574A/0/0
X-purgate-type: clean
X-purgate-size: 295

On 24/06/2026 9:09 am, Jan Beulich wrote:
> IRQ_PER_CPU and IRQ_GUEST_EOI_PENDING are entirely unused. x86 uses
> IRQ_REPLAY, but only ever to clear the bit. Drop all three constants.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

