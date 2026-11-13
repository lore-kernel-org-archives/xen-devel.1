Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13535606A337
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 20:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=IAH1O806
Received: from list by lists.xenproject.org with outflank-mailman.1488275.1690351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRy7w-000065-UX; Fri, 13 Nov 2026 20:44:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1488275.1690351; Fri, 13 Nov 2026 20:44:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRy7w-00005x-Ql; Fri, 13 Nov 2026 20:44:04 +0000
Received: by outflank-mailman (input) for mailman id 1488275;
 Fri, 13 Nov 2026 20:44:03 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRy7v-00005r-DV
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 20:44:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRy7u-007jnG-I7
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 21:44:02 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af77692-bab6-0a2a0a5309dd-0a2a45049848-0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 21:44:02 +0100
Received: from [52.101.201.31]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af77690-b57f-0a2a45040019-3465c91f0712-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 21:44:02 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS7PR03MB8033.namprd03.prod.outlook.com (2603:10b6:8:250::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Fri, 13 Nov
 2026 20:43:57 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 20:43:57 +0000
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
 b=R6TBcCpuy0TmwKXWby7MLvXY51br6Fxfg8ptTBNQSjkqE0/+V6Uga3JDMFS6wR/TiBwXnSRcQuGtbCntSq2tq27MxthnglNNxdkCQ/0QkY0y3hAaBT3B1KPd3nfRlZsrtgXNnThotQncF5WG6bq5Ip+a49YjRYj62C/L6uAEGeBfBYB96wT8DIE368IpYMULdeMWCIZseYcdctJm7E4aZ2kI3kGxb4lFJvXyM1K2IDZ3My6KPhYBmenY9LFenJ5vReKjOvFsEPyOcUysNl1fbwt4vpmGtUJEw5iwqnW2z7PneLCkbwBAAddi607cqGLyuR9l4mwM5vZC0evbkx8Csg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mAd9xZllHOIrq7n7+eP2yDfnm3HFKxtXVZ/f6DKh5+M=;
 b=uCZ0R+XCOlnrcC+rS8gbMewqTj+cmF9DEYzkMkGO9K+FFWbt5i+nIt2MG137AihJQ/LN19hjCG6kVCozJ1aD4GkpEkTRUXDggT61XjnQIqRDpziQaUleo0ebpweZiqwIS3voJBu1rlVlGFDwm4zzuCbLzp29fRiPV6ib7uWCEGhtTkMw3vZbhdWLc2v4RGzd8m1kgbuTcaW7fIlU2qPt9W5el4Ii2DcUQTDFm60kOsgqRPSAWJkzs3tJ7BHLsfpzhEUBBA7PKXDoA0ymhWvmTq0OdsHaIF4pqz0MyOqLe1/07KmaMPhLpfx6+VrhUZTtiMxlFe1sX2fImiYOaBE3HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mAd9xZllHOIrq7n7+eP2yDfnm3HFKxtXVZ/f6DKh5+M=;
 b=IAH1O806KVGsZfac38p4tJcsO6+eNgbTzwarklakWlqPDzP3TU1R1RdGv4A5FrUWoALYKm5AOoIVp+Nnx6UPPmKnzAgd+od2HHeuc42JKhQLoJN/EyoonNCWegnONA9/gOACmg+R7iLoNcspUdmKLoZHNMHg1fwUb1RX4IAqlxA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <899199d6-130b-427b-9996-883b1a2f5134@citrix.com>
Date: Fri, 13 Nov 2026 20:43:53 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Frediano Ziglio <freddy77@gmail.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH v8 4/4] x86: Split .init section to satisfy UEFI CA memory
 mitigation
To: Frediano Ziglio <freddy77@gmail.com>, xen-devel@lists.xenproject.org
References: <20260715062206.328049-1-frediano.ziglio@citrix.com>
 <20260715062206.328049-5-frediano.ziglio@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260715062206.328049-5-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0239.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:372::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS7PR03MB8033:EE_
X-MS-Office365-Filtering-Correlation-Id: 72af064e-b284-45f9-e0fe-08df41c6d6d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|261022113327099003|11063799006|261021123027099003|261022115727099003|4143699003|56012099006|261102123227099003|261022075727099003|261026140227099003|261021135927099003|261022105027099003|261021121427099003|261026121527099003|261021133027099003|261028144727099003|261026130827099003|261021130227099003|261026135527099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	25g/OAnz+WQDq2k93m6wtFM/IsJ73bh/BPuERe5DoYLDF03idNtOmZbHgJuOUuAakrKlAr8Ho9PRkeWJSCcBWkcs0ujT6vd77lLSgAliHua96Tu+/GFoA5tLskfvUqZyzlftnNmsSSAZJNq17cafJCQPSjSJJIJTtJaC36ynrXJvDtfUKpuOnh5MmUljNDfjWnd8VaUjlqt2URbPKCr3nCiNho1XwaTZF8VjAJ+2+AoRNTcZ2UknoKE3d2rrQNkkJa/79v9TWJoEeMnaXjQJf4lUdgg1eAqdgkrz37y6c4vWVro2ehznRmlS/wjwQBDEFeaY41FcaFUxsbIN5KJExjRHhiVbNbfkTGpBpXiRg0ib3v/hhzWuHBaMfq56fEUPVsvI+l2ntom8+7WtmJFIK0NOiiCcU+/x9QJo8qYWti0V24yI0ZLQoX0Tdv3gLoG19v+FuLrvGkjp+rtXTT+zg3S/1FlpB2lQ14FiU9R4ziD8RaNjplgfpNvvmXps6CMn7u1xUY66O5cEYLW4TJOeTQ/pZTjLplws0BFLmn9bY2YuYqP2AQGPqq2X0ZYZQOz4aad45GCtN7RUXcZYh+2BwD+Pnii0/mmWxDHvEAjM/s5YILFLiy6yBGSl/Bgo2hIyxDpfMEIiqKRUPvIHh83ARwb5jiwOlKqM7tPV2RJVJP4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(261022113327099003)(11063799006)(261021123027099003)(261022115727099003)(4143699003)(56012099006)(261102123227099003)(261022075727099003)(261026140227099003)(261021135927099003)(261022105027099003)(261021121427099003)(261026121527099003)(261021133027099003)(261028144727099003)(261026130827099003)(261021130227099003)(261026135527099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkthNmE0SkU0UFArN3N4am13NktRc3RGdXhJbEVnek1hU2hqa2J5Vlh6K1N3?=
 =?utf-8?B?L21XTmZZSEV1a1ZqT284Mmd6aGdzQmVuMW5BazUrc1NyUmNydEUyRG5lU2Ey?=
 =?utf-8?B?SW1xN3pHQVFtYUcxUmFwZ1Q3OEhBM1Y4eDJNSXNNbkQ1NjB6cmkwT245VXRT?=
 =?utf-8?B?aTJyTStwcXBleHhOcm5qOERXVWJ0N3YvSWs5WmkyYkg3eTZkSExDVHcxREFL?=
 =?utf-8?B?NkhQb205b0RNTGplZGt0cGVlRmUrVVl4MEZqeHJDTTVFdnMrRi9JY1c4NUU5?=
 =?utf-8?B?V0doOGdVTW85K3ozZE52QlhBdWlUVVA0VUpZQnlvSXdZOXRRYTZxdml1MFFQ?=
 =?utf-8?B?cG84eXZSY2tKMjhia3dUK2QwYU9sMUxUdTB2dlFXUEFicm1wQWhkdUFwWEhQ?=
 =?utf-8?B?YnhKRnNITFh6N3B5Q00weUNmQWVRWUR4SkJ3NlYrQWttUWVKWlluVGY5aXNV?=
 =?utf-8?B?d2cwYnY0U3p1cTJQL3YvSzNrTnNoQzFnaksvMTlGRXVHVkdIU1VSU2dJTFpn?=
 =?utf-8?B?Y0grWGVZNWhmVkR2TmRXd2NueFRISXBGd0xWMTVKNDBCbzJWbXlyWGlRV2Z5?=
 =?utf-8?B?NlFyLzdXaXc0b1RBbGZZOFpBN2lkVisvRGNCd2wvemFEbVhDNHJ3bUdiRGlL?=
 =?utf-8?B?dzBMRkduNnpXS21Ic3o0MDBaSTE5bHA4cHBEYkhhTlg5KzNKbzZCYWMyZERr?=
 =?utf-8?B?eGhVZ1N6eUgzUXZyTVVLZzN1bEFFa2ovTCtzdXZCVkZVWGpwSGx2WTRzaW15?=
 =?utf-8?B?VWY1ejB3T0lQRWRTQkNOWFJOQVhEY2lmWjRGWW9YMnlaazhkVkIyWnhjVGt0?=
 =?utf-8?B?clpFQmZXWTREY0w1VFRNYTRqTkNzM3JWTnhqRnAyblJkR3gxaG1ZdXVWbG9a?=
 =?utf-8?B?b3FHRFpJSnNxaXFwTVZQbERFNFhydmZqZkRUMXJKeG1zOUVWUG5sbXZaZ0Jr?=
 =?utf-8?B?QndpemI1N3ZyR01QdFBKclliTkEwSVJTejF3NHh5RGVscnpIM3hkV3I1RXMz?=
 =?utf-8?B?VlFuOFpaOGJROEN4V3lyL0YvMysxTzNiV2s2cVU2Rjg1NkZuaEJPb0ZPY0tG?=
 =?utf-8?B?dTI0Vi8zQWFHdlB5aWFUZXlkTUpkQ1BMWFhJMVN5d0pjQm0xR0Q0cUhEK3V2?=
 =?utf-8?B?N3ZlNkNJdE12RTV4dm1DK0xNYTlyRXpuWDhtbi94eDNmbS9WR0xjTTQxcDFq?=
 =?utf-8?B?YXFIMUtBU0VNN2t6cXZ3WGhVOElhbVhlbmo1Sm5hMnFNVUQyYU1RNzVMZy9J?=
 =?utf-8?B?TE1uVk8yaDlHL0hkTjFYM2ZpbzJJenZGendNSm9kcmpRcHVTdkJKZ3dRWk8y?=
 =?utf-8?B?WXhqN0QrV0lpc0ZkTENFdmhyRWpHd3laSGVReC9PeTFDb1cxUW4yb1JoZXNz?=
 =?utf-8?B?SGs0QWdvNyt4NzZ4WGNVMHhEcFFEV05Oc3Btb2QveHpUbkZNUS81em1rTXB3?=
 =?utf-8?B?OWYxU3JvbmZmbkZ4NXFmYWxqRnlvWnhrSVZ4eFhkbTJOV2tabUFjdHhoK2lk?=
 =?utf-8?B?dUVjSkc2c241ekpuY3ZDclFBcFhPN2J0aGEyZXRnSUFTM1VVcGw0OXIxWVlL?=
 =?utf-8?B?dElwWno5MTFsZE9iczBDbzRTRDBJUWlHL1lqUGNsSmY0bG45ekhDcFl0cmVM?=
 =?utf-8?B?ZjZWS1NMNDJrelBuTitUYXlONWJreVhvRmtyZVUrMVRQRDB0Y0MwWGltdmZG?=
 =?utf-8?B?RjRiOG9VTVpkc3VFRFJlL1FGeldwUlVudHRISGc4dFpJWDR1RDEvY3pzbWVY?=
 =?utf-8?B?U0tiT1Q1ckoyUUJDaEUrUDNDNXJCVk52MmU5bFNVemZqZFpwUUxqOTBrRWV0?=
 =?utf-8?B?N0k5RjFnT2V0WndGUEZ0c1ZnQVpabkc0eDBtQ3J6YnZ2bmNxbWZEYWhFVmJO?=
 =?utf-8?B?ZmtnRVdUSVF4NGUva3JEUmJDMjRSbUxtUk0yUGU0MEYyNENTVmh4YWNKT2ht?=
 =?utf-8?B?TkZIa2RMMGdQa2VuNW16LzhTdEhuZ0toTys0WHdEbVpRYjR1UmV5YkE5dkZs?=
 =?utf-8?B?OW93WkdGR1NMUDRYMkxpNWl0NG9BU2ErOUU4NDF0Vnd3SUtuT0Rwa3NkM0Zs?=
 =?utf-8?B?M0NBUUZHWFlORHlvUUVUbi82dzk0a2xORC9wdU5xaUVEQ1hyeGx6NkFVcytl?=
 =?utf-8?B?MjlQU05ZQWJkZGhXQkRrL2VrTjhORGFjMUExc1VIOWxJdkJmd2pEMVEwcmdG?=
 =?utf-8?B?YUtIc2xVOFlVUXltZ1BabmxKeG4xQTdzek9WbEpXNmM5eURIZEgyMXV3eGRj?=
 =?utf-8?B?eUo2bnFIOHduSGhiNnZzclFxQWxCSU5DZXZjS2JiN3pjQ2wvaHRhbDIvYTI1?=
 =?utf-8?B?NWVtcEJPbUVtSVV4aUpnR1BlOGVSemEzRTJ2dytZWE1WRWQ5K3hmQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72af064e-b284-45f9-e0fe-08df41c6d6d2
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 20:43:57.4460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Jkn3VsVuewOxw4N6REQnPFIE42CYlpxcLaOmaEewmjQ4CaBrTDWiWX3D5O5fanvdxMPmG9adBsaNG9KK1NegwstBoVyG/NVO5HiBQg/6u8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB8033
X-purgate-ID: tlsNG-ebf023/1794602642-536C2B50-A71DFF09/10/78276251493
X-purgate-type: spam
X-purgate-size: 2649
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 15/07/2026 7:22 am, Frediano Ziglio wrote:
> Currently .init section is both writeable and executable, split data and code
> to have 2 sections satisfying W^X rule.
>
> It is a requirement for NX_COMPAT so the PE can be loaded with W^X perms
> in the pagetables.
>
> NX_COMPAT is a requirement from shim-review,
> https://github.com/rhboot/shim-review#do-you-have-the-nx-bit-set-in-your-shim-if-so-is-your-entire-boot-stack-nx-compatible-and-what-testing-have-you-done-to-ensure-such-compatibility
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

This patch cannot be taken yet.

It is reverting 1308f0170c1 while there are still relocations into
.init.text.  It needs to wait until the trampoline has been sorted.

Also I note that the check for this case in mkreloc (added in that
commit) only works on older toolchains.

> ---
> Change since v1:
> - update comment style.
>
> Changes since v3:
> - Added Acked-by.
>
> Changes since v4:
> - Added Acked-by.
> ---
>  xen/arch/x86/xen.lds.S | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> index 4ed1d2bec1..e26e37db13 100644
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -193,11 +193,7 @@ SECTIONS
>    __2M_init_start = .;         /* Start of 2M superpages, mapped RWX (boot only). */
>    . = ALIGN(PAGE_SIZE);             /* Init code and data */
>    __init_begin = .;
> -#ifdef EFI /* EFI wants to merge all of .init.*  ELF doesn't. */
> -  DECL_SECTION(.init) {
> -#else
>    DECL_SECTION(.init.text) {
> -#endif
>         _sinittext = .;
>         *(.init.multiboot)
>         *(.init.text)
> @@ -210,12 +206,12 @@ SECTIONS
>          */
>         *(.altinstr_replacement)
>  
> -#ifdef EFI /* EFI wants to merge all of .init.*  ELF doesn't. */
> -       . = ALIGN(SMP_CACHE_BYTES);
> -#else
>    } PHDR(text)
> -  DECL_SECTION(.init.data) {
> +#ifdef EFI
> +  /* Align to satisfy UEFI CA memory mitigation. */
> +  . = ALIGN(SECTION_ALIGN);
>  #endif
> +  DECL_SECTION(.init.data) {
>         *(.init.bss.stack_aligned)
>         *(.init.data.page_aligned)
>  

Stack alignment is greater than page alignment, there's no need for an
ALIGN() at all.

Even if there was a need, it should have been PAGE_ALIGN and not
SECTION_ALIGN.  We don't care about the boundary between .init and
.init.data in the runtime image being 2M when we're freeing both sections.

~Andrew

