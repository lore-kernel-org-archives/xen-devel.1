Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CF0606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 21:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=m0tRK0NE
Received: from list by lists.xenproject.org with outflank-mailman.1493261.1693346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTQuA-0004jG-KJ; Tue, 17 Nov 2026 21:39:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493261.1693346; Tue, 17 Nov 2026 21:39:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTQuA-0004j9-HS; Tue, 17 Nov 2026 21:39:54 +0000
Received: by outflank-mailman (input) for mailman id 1493261;
 Tue, 17 Nov 2026 21:39:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xTQu9-0004hy-1S
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 21:39:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTQu8-002MHT-68
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 22:39:52 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6afcc962-2eae-0a2a0a5409dd-0a2a4504dedc-38
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 22:39:52 +0100
Received: from [40.107.208.40]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6afcc9a6-b57f-0a2a45040019-286bd028b1cb-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 22:39:51 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA3PR03MB478502.namprd03.prod.outlook.com (2603:10b6:806:53b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 21:39:48 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 21:39:48 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kYrBqSRQATWJboNohcghYPOSZrZ2GoBxQXCH4eWiFgla3iZb7KOQnAp3CvfY1O/7veGx9LQlADEgfZRyA7FJQA4aIoudxSwOc7DpqiVre2+cCib/7mMLUEohfp8OjUn0voarEauhFN1bVRCPQ8kpk5sRWQOzLxdsQs5FyGCcyCXHk/W3FmQ3vKuVbTN4/qgloGmzmoWZAhKmI7Zj/NarUtgIQhHyx4Z04Xz/1qpYcRrchP1lmR8avJX+O4BvWkqAh9V6omtzcx3i/EjyL7NkdEH8P4FkTQw/01gFOdD0gKEvtPixrQARKV4WvbQg52a13ZI+kaG201XGtavB9rxAig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kc871PPoZStTQptbxq3eVWgs4dJnVIj9Az2TLzuDDMs=;
 b=Wyu8RyJ8L+0T9DqgvO44FqvRHZ419dPKB4cLMstdOrAigG2kS9RPJQgNmM1/wuIzKaHKeJBRZpraFiRZxWrDzJ5RwrBTcf3ZdLyuuvk5VPBT2+1XVtRokochEls/7P7zdArAwoAYfLta6NOc4+r91km2Ap0Dj69dcC20B5NrAz9d/IbK2Qn4VD1R83Z8EliJP7AGmllTxDdyK8yqO2FHZf6H7F47tzH8yzQBSjNgwn80UCm/RAnj34HdFxGh/cw5WQLHYj5BXs59RCwJFrmhJhCHziMc8BfBoVAjx5SoJCV5fOSnN6nlc91IF+OXraAS+ixifO6fykZab2YpjXfNuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kc871PPoZStTQptbxq3eVWgs4dJnVIj9Az2TLzuDDMs=;
 b=m0tRK0NEnRoebJXk6+16KsBvsztPxt8UIIQq0FL24nvEbYJ8l4mlwzoH5UblyP8Tnpsyw4BKrj1apHy0LKB2F8FU1aYHig8zBaQBjUe0eDnnQq8K4Od2CqolWF30sWhmoiHXcANGa8nIu/xxJHm1pSWiyd2KjczuOZbvpJWcEHk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <91ac13b2-d470-41e2-9096-7a6902d87359@citrix.com>
Date: Tue, 17 Nov 2026 21:39:44 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: deviate MISRA R11.8 for capability enable
 callbacks
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <74ce8a8150674591c2b0daa672f8e2e00b2a1201.1794950154.git.dmytro_prokopchuk1@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <74ce8a8150674591c2b0daa672f8e2e00b2a1201.1794950154.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0046.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA3PR03MB478502:EE_
X-MS-Office365-Filtering-Correlation-Id: 84b2e681-fee4-4c60-035d-08df44f34e23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|18002099003|6133799003|22082099003|261009223027099003|56012099006|260925022911599003|260925021911599003|11063799006|260925021311599003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	PkO0CEraohljih8qpzd8DEObafq50KUtY8FloDdnCzbjchovMgk3FHwWo2NV3hDlSsJYvaPQmtIZzNvJd9sXwRxpSUvW2m6ZhMkwjSAXw8Km/lAYD/nE5ROkesGSTYHmGBYbTTUT5e2yOne2qaWRo/1SIcivqIV0vtV6Wq/ZG3LYMr37pg9MFcNy0HM16TkewgNzb0Yku5GywDlYdABlqM8wmUW3Nyj3JFUWhaPNFQkzXkt1mSEFVgULdXed+68PuzvT6PqWXs+N6I8ski9huolVFT2X/v+nsJ6tiR8V2UQ+g+cKGyp5Gy2NxV1+peBRXelgtSgh4BcQY21wE0HJCXUV3hb8o9dgCHhwg+938f+2h5e8tn1HvcbB5gtgHswBi9m1zBWgKFZXOZVDVQ+Cg6BRneDQ551zrM/m0//A0QuuxgN7CCespRXbaQIWnykor9mP0fgMNhk27kZm8k7BU4S06rEHweVVc4THDK9L+MjlJoma3yt/Qr4FZ0g6jjgLWqk9z33TWB/8lYWg6kGfPILNQ9XfMVmbP6wqqZWmbo2m7fRjgdnEZNFquTZZ8NYLSMa4px0OZxJ1d+lWm8Uj/tfpoOvQlvF07BcvXp9ssQi81mBLqoB/PF8tgEgmJtk3jTlt9rpHfDDeH21b9BWA4UdY4gzYPw22cpchSweE06Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(18002099003)(6133799003)(22082099003)(261009223027099003)(56012099006)(260925022911599003)(260925021911599003)(11063799006)(260925021311599003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3ovamFNZmw1ZmEzSWdWYm1JdW1IV01TVUJWZEtwOEJmSUpoUFBYYmRvSEli?=
 =?utf-8?B?MEhUR0tvcXhua3RHbDNBWXhEdGNBZS9MMXAwc1d3T3BBdkRyUGZWM0t2TURm?=
 =?utf-8?B?a0R0TzNocWJnMEQwQ0R0czlMVFFNb2tsYXlXSUx2YzBFeUNBSmZ4OW9JVnJP?=
 =?utf-8?B?V1ZxUkNLbm5CY25Ga1R6ZDdCTnd3aEpHcDlEZExVRlQ5K00vRzYzUmdsRnJR?=
 =?utf-8?B?SXVUcjlCN1NabmtFVlJuMDd0TEFTL0JRUU53eW5nWUNrTkI4cVJRTmQ1SFF0?=
 =?utf-8?B?U1JIb2JidjJ1RG16OU1UcFFBVXhMMlRGbDZLTVZKTktBKzFjc2pWRkUxZC9i?=
 =?utf-8?B?ZG5HTDNRODRSaVNHNlR6Y2h1bHdRWmdBNXFWcFh5aC9EMjJLN09SYzVuZ2FT?=
 =?utf-8?B?d1kvV0poU2xNM1ZYT0RMYjR1WWRJYWtyUzRJK0FmbWRYOWdOblIrekoxbW43?=
 =?utf-8?B?dG9EcVJyNnN0RUxEK2RZaGZGTnRGUzRUbzd0NitETjUwNktRUWNudzI5YTB2?=
 =?utf-8?B?dzdzUUc5amVTMUs2dlRGN05hd0RVdFRIVU54TE9XeGhqNjlnNjhxYzZCVUZa?=
 =?utf-8?B?R0lsV0RMQmliaXZsY3FvMXpTZk94T2YzQmtxTmdKazlGUm5INzdQWmJHcEZh?=
 =?utf-8?B?bmtSQVdVanJDL2kwSTNCWnJ4YzBMNWJLVVhmcXdxejVpSXJZNWxjWHhQVGFy?=
 =?utf-8?B?Q0V4WW11bW9KSFdoQmRQbDVrUktSUklkZ2o3TUVwZUxuQ00xcFRmbVoySGhO?=
 =?utf-8?B?YWtmdmJJZ2ZvM1M1UDJGM3N2bVdjaHZrMDBNNkoyRXlBWnFQZTN0T0hXVzhC?=
 =?utf-8?B?Yjk1cjRCZTI2K01BVXlpTkJBaUVxUkQ4aWNZdWswai9aaHg0Y1l0NGpxL2l0?=
 =?utf-8?B?SzhDMnFtU2ZjMk1YVVRiWWl6UmVEV3JkcDdHSGFLWEFXaHRlakJZeTJtdXdk?=
 =?utf-8?B?UC9BdVBHeFFSa29Za1ZudzgreU11QkNselJDVnZoOUFOcE5sL3g3cnBmTnhm?=
 =?utf-8?B?M2dPK2tTRGdXN2pNYlE0cUtIVXVMTnRPa2RZWEtFdWt4eWF1RVF0MFlCT3Uz?=
 =?utf-8?B?VjVNSlV6L3NOakIwT2s4ZDZhaHFmUHpHcVhob21ueFN5YTNvUUxjaGt3OVFr?=
 =?utf-8?B?S25UUCsvaTcrZGxmY093ajl2VFZZNmZFWm8wVFo4bStPUXhjQ0lSZDVvbjk0?=
 =?utf-8?B?cmlHWkpjTlZVMC9hWi91dlVSR2xWMnBSUExZMllDaHZsK3YzQ1Nrb2pQVDNj?=
 =?utf-8?B?enVjSEI0VVVGTnZUMllPVVdBMitQbFoyRERoN0RuMTk0YU9RdGVQK0ZQV01D?=
 =?utf-8?B?cGt4bUtYRHlCTG42UUpLaGVFNjJtSXUya3RTNkdXS0UvSjEzZnk5Tk03eXBi?=
 =?utf-8?B?KzM1c3ZBK3RPMEVJMmQ2RjNIb3FCNnJyVTE2WnloUXNFNVB5K2pZeGtSZ3py?=
 =?utf-8?B?bjhKWFVFQVpuQmNMclBMd1NOYWR3bnZLREs5Q2FsRTMwNkliZXg1V1FPNnVH?=
 =?utf-8?B?T3FuT3lIL0IwQ2FpN29lTW13VTV4OHltdWp2U0VZNEgxak9lQkt3dU5WZzgr?=
 =?utf-8?B?RlNyNzE1YjlienFjZU5nd1owVi9ScTBBVGFMcGhjenRVaCt3cEt0TGFRdHcz?=
 =?utf-8?B?dm9hZjBkVFlicDgrYnBZbVJRS3VmWThoNlRaeWtDdXJjaTRnUzRycSsyUGNr?=
 =?utf-8?B?SmxJZEdRclBiTHg3RHhwQzRqSDNLVi9GTWhYa2ZncnVnRHpDQzl4Ukx1RnhW?=
 =?utf-8?B?ZnZXSHdVTlcxQXlnbmpOdXM5SHZqSWhORlhQeDhEMG1NSHNKWWlOWDdkYWtP?=
 =?utf-8?B?cDBtRUpSZ0ttUmtFdnhrVC94QURQNnBQN1JMaGsxaXZTM0FYZ0lTQlVZS3Fu?=
 =?utf-8?B?ZytiZjY3cG9oWmcwUEt0Z29FbE9zTWovb1RQL1VNSWhTWmJIcWkvMmZOMngw?=
 =?utf-8?B?am9ubHlpOUx6Ync5Qkx2ZDIvMjhhVmhyN1hMeTJ6d0pZbzYwWFhqOG9OSHVJ?=
 =?utf-8?B?NGJzNVRQT3F4STRLaGlHT1BOK29JWFlDSnBPWVN1d3hCUExUZWk2YUh2ZVdh?=
 =?utf-8?B?VkMyRGpPSmx5TVdZaTNicWpQWEtKcXZpUlFtNC92L0xiWmk4ZzFzZ2t1cjhx?=
 =?utf-8?B?cE1SNDB5NldyZnNQV09OUjR6cDlVNzdwTFNVelBoaENSekh2dGdzWmR3ZXR4?=
 =?utf-8?B?bjQ3RUZDcFVYbnhCdVcrK0ZPV3M5amEydFR1d3VmL01oL25GbGpaZ2x1MjZw?=
 =?utf-8?B?ZG52MWJEeHJneDR0SXhxYTlTRi94MW9qZ2UwdGZ3aWhUVUszeVdYSnp2b09N?=
 =?utf-8?B?NUsrYmdXT0ZvSVlGZmxJZWtYUWdtV2FGK3h6OUM4QnhPd0ZVVEF4dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84b2e681-fee4-4c60-035d-08df44f34e23
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 21:39:48.9179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uad6/p1f8w0TtZLeg/3zD8B4QTcBcZIzLt6mSy5OzLUqv5vmejOBHSXzlNZuukUU/S+yQT/PTiIyMVwqhNS5Wvf6f070/615LYMHfZOByug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB478502
X-purgate-ID: tlsNG-ebf023/1794951592-C1CD7B50-A220F144/0/0
X-purgate-type: clean
X-purgate-size: 2964
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 17/11/2026 9:31 pm, Dmytro Prokopchuk1 wrote:
> MISRA C Rule 11.8 forbids casts that remove the const qualifier from
> the pointed-to type. enable_cpu_capabilities() and
> enable_nonboot_cpu_caps() cast a const struct arm_cpu_capabilities
> pointer to void * so that it can be passed to the capability enable
> callback, either directly or through stop_machine_run().
>
> The callback type takes void * by convention. Existing enable
> implementations treat the pointer as const and do not modify the
> object. Document both casts with SAF-15-safe comment.
>
> No functional changes.
>
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
> Test CI pipeline:
> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/3081209229
> ---
>  docs/misra/safe.json      | 8 ++++++++
>  xen/arch/arm/cpufeature.c | 2 ++
>  2 files changed, 10 insertions(+)
>
> diff --git a/docs/misra/safe.json b/docs/misra/safe.json
> index 3584cb90c6..67f8ed9869 100644
> --- a/docs/misra/safe.json
> +++ b/docs/misra/safe.json
> @@ -124,6 +124,14 @@
>          },
>          {
>              "id": "SAF-15-safe",
> +            "analyser": {
> +                "eclair": "MC3A2.R11.8"
> +            },
> +            "name": "Rule 11.8: cast const capabilities to void * for enable callback",
> +            "text": "The Arm CPU capability enable callback takes void * to match the generic callback convention. The cast removes const only to pass a const struct arm_cpu_capabilities * into that signature. Existing enable implementations treat the pointer as const and do not modify the object."
> +        },
> +        {
> +            "id": "SAF-16-safe",
>              "analyser": {},
>              "name": "Sentinel",
>              "text": "Next ID to be used"
> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
> index 8d8cd19a96..4d2b183a62 100644
> --- a/xen/arch/arm/cpufeature.c
> +++ b/xen/arch/arm/cpufeature.c
> @@ -72,6 +72,7 @@ void __init enable_cpu_capabilities(const struct arm_cpu_capabilities *caps)
>               * an IPI, giving us a PSTATE that disappears when we
>               * return.
>               */
> +            /* SAF-15-safe R11.8 cast const caps to void * for enable callback */
>              ret = stop_machine_run(caps->enable, (void *)caps, NR_CPUS);
>              /* stop_machine_run should never fail at this stage of the boot. */
>              BUG_ON(ret);
> @@ -108,6 +109,7 @@ int enable_nonboot_cpu_caps(const struct arm_cpu_capabilities *caps)
>  
>          if ( caps->enable )
>          {
> +            /* SAF-15-safe R11.8 cast const caps to void * for enable callback */
>              int ret = caps->enable((void *)caps);
>  
>              if ( ret )

Thankyou.

FWIW, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, although
you'll need an ARM maintainer for the patch to be accepted.

~Andrew

