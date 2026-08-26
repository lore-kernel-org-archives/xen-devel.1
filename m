Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CCEC5DF97
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2026 14:42:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399981.1635939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzEpx-0006Oo-5V; Wed, 26 Aug 2026 14:42:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399981.1635939; Wed, 26 Aug 2026 14:42:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzEpx-0006Oh-2k; Wed, 26 Aug 2026 14:42:45 +0000
Received: by outflank-mailman (input) for mailman id 1399981;
 Wed, 26 Aug 2026 14:42:43 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wzEpv-0006Ob-8x
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 14:42:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzEpt-008Syi-I4
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 16:42:41 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a8efb38-e002-0a2a0a5209dd-0a2a450989d0-48
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 16:42:41 +0200
Received: from [52.101.53.43]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a8efb60-be1a-0a2a45090019-3465352b55bd-4
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 16:42:41 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH7PR03MB6943.namprd03.prod.outlook.com (2603:10b6:510:15b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 14:42:37 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 14:42:36 +0000
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
 b=M79N6PRZKRxLI15FYIICDQFy9N4C6twcYimhGSwsKxaUCuFHfq/x4hZqWRQF+oWMwaaKzUoSXzTd0SaY/WDhTJq7nCaC9B5tVIWw2sVcUwNLY+Siwb1VczUHR3/vP+T/fVLWPmO6we8/2V1rHrDG93c41O7k7/TZ4Q8lnW1Wny+xejiPf0ulsNDEp6nW3HW+U7oga7K2eAcOoISpjScqVVj/mdiPHPeIV9tuhECz9aw/i40TQk5UKZLL64+Ug1nGvXuDOpbo6bb/iRe2+wlwN0FkUFMl5BnFdgbb7Z8jSeCbhGf3+6BO4Cdm89+csam3th+8a5ZHwKmhEB5B1amAPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nIw8x0AOzlMeZVy20wssjgNYi5QuOTCa7cTowLZ3L+k=;
 b=C+/oYj42nS1SvbSla4U53nv/hV0964bZnxCjQdJX+p/XJKX9WOGRM+5KPo23qwlwXQiEbztdfZtdT7LSyZplbPcOgEQ0mpTBqUkKrsc+ORCINabVV4C0IxAq9eGDbrH1vOg/bBjzcUbE96v5ibWOD6LBW/av0ukSv37jcSupVMy1GEdlAyytweoyighn22T83LkU75WgNECm6n0vdMntSmcabeMWLfFl/VeRs3KT0A7SduRJdA+jVl7N6MudUiVKIk8BFgxmTS6F/uEil1IGedGungGFLVXIzFiizExCD10f0vTAarRF8MhYkhuWgJWRenV/Ql0GY42qIar563AfXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIw8x0AOzlMeZVy20wssjgNYi5QuOTCa7cTowLZ3L+k=;
 b=YgME41RnEMsDW9RAoCVYQ+Xwe25lJMig/fChrJqli0Bi8BRJIHvrJKjo4YoswEFjLpb1i7OwZ+a+1+tsM77XJOLggS78DJIMa9VahF21e3+/w5SkojnWbg9iJRoYml2G/eBvfAobOgkClSpCJnzpPD+e7tReQLck8yoNXjX7Ez4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <fbbdd0e6-4a4e-43a9-b313-6d06f4a465f9@citrix.com>
Date: Wed, 26 Aug 2026 15:42:33 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH] x86/IO-APIC: replace redundant irq_trigger() call
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ff35bc09-aa7e-4bc7-b3e8-43fe765c2cda@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ff35bc09-aa7e-4bc7-b3e8-43fe765c2cda@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0082.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH7PR03MB6943:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f2a13ea-0cb0-4e50-ac04-08df0380458a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	zVOUk3t356WEudQL0BTUy/PUSnKSL3dj0eIMEKCSTPYcoddc0QfE3SHXYoU6ob0uI22q+QpdzH8scl/9J+/tnhzK7bqRQPokSJBGgWclxf0c+TDwx3nSZQ5p7W+YXGPbaTrx8uudZ9T4MWlyiI+g/ylJjFXj+va/6EDnw40ww0zJHktZ/i4BgguLqpJpRDRbIijN78W50hbf15PeOlKOyGpAAucPYaic9w9yl794hZX96Ye1aJuo7Qo9SxFWGAnDFZIpn98ThjKCsNDHrdHsAkgz6eRgm8SGFF0zbca8vf06ubBhcxf4X5b2ThZUIptu+qmjKUyfKHod9e7LaSjk2G7MHYtNmt9dcilfUwWEEPyLOFcZ4ViU6kZ9eXL0J00lWnL/9CilXy0X4/jzK4ASnAnvQ47Dq8csWBRocPabBhjM90ItU2w0cQGoD1gOo07xxs4tXhFEnx1w4919kJtA5RLjS+StGMSoIoIN/75n8w9Pq1IaGZVJ4k5LFdgVNeI22IsXrI5nKwr3QVICjA33UIISmdg2e5yNHcHk8F4BW6c5G6WGxUzfdfx9F0l3pOx9ZmvP4ptOkZc0B5oXB8KpsMg61ljziGiNXSpMFmQD3pKjfUyKCG/qgrZUJ/+KcSM/plMe1rHIHZoeeJ2HkCkGaD2NMoRbwDG/shkTYV8jb5M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0loOUNaTjBrcXN0SW0rVzFxdW1Bc2RmZENERlE5U0s1R1B0RjNFTnA5a3VT?=
 =?utf-8?B?RE9Bcmo5RDYxOTQzR0IwRGM3MVlyMzRCQ2pSSkExZzV3VlVhTkZEck5sZVNC?=
 =?utf-8?B?ZTZaRHFDamlrSFozWHhFK1JESXhUdG9VanlMaGVmWmJ1TSt5SFlGc2VoNU5V?=
 =?utf-8?B?WHZTNkFNMkZrL214S3RmQWoycGt5NnRrVGxVQmVaa2Y1MEQzS0czV2tnMDVF?=
 =?utf-8?B?WlJ3djd0S0twMUwzeFo0L0xzbWVhQXpSMTV4Z0NrM2s0WFRwK0lkbUU3Nis1?=
 =?utf-8?B?ZE1qdWhiSy9uUnZ1M0Jzc3dMTE9qcHlOREZtajFLYUZZSVRROC9KU0JxR2hy?=
 =?utf-8?B?UFJNdFZYNk5OZlVNd2llVzdCNFRUQmNMR2JIdFhXL2FWazQ3MVVwdDZuSi9l?=
 =?utf-8?B?VU1pa1Yyb3BHbDVWNHZQMmxOc3NxZ3N4bnZYLzdhOHR1S3BablNlVjVmTmF3?=
 =?utf-8?B?dTVvR3hLaHBmT2V5WkpsRytKNkc0RmpVVDFjTnlGQlZnSm9JNUc1UFc3cGxo?=
 =?utf-8?B?V1FLQUhQVTdqb1g0K2JYRXZSdkN5NWFkWTRkTFlUWVpGdFdzTHFSZVJGdVNH?=
 =?utf-8?B?QVVGMUtlVVZGa2VGQzM3UTBZTEh4WUREZk1yaGdZYmpNb0l4cDVoKzdhL3VM?=
 =?utf-8?B?SXhDT1UzMnFzTjVlQWw2MFlnOWtDd1NxQVhnWC8yRzNPQXR4WlVyYkwveW1W?=
 =?utf-8?B?NDJJMzA3K3F5d241S3MzNTd3dE1Rc2I2WkpiYXNhYlJSYkE0OGdiYms5cXRl?=
 =?utf-8?B?TDZzRmI4UUpPK1c4SmQxbVV5NHd3QnFtQ2R0a0hFMHlZdzlwb1NOdEZSZVZY?=
 =?utf-8?B?M1JwVG0yUFBvK1NLR3o0TVNBWUpLZVo5dnFsMkZUdEZJQjZpcStCK21ZK1NX?=
 =?utf-8?B?Nk9weVF2eG1YbFUwMVczcWswczVkZm44QjJnWHA0b0prank1SVR5cG40ZDlQ?=
 =?utf-8?B?OVl4enAvbUN2Ujl5VXdlbExRcGRvQlp2cENxQkdDREI2WEFTYS95cGdvczhp?=
 =?utf-8?B?ZzdVOXhSMGphTzBCSHg3R2s0OURZMEhwRnlSRXRJd1Fta1RsbHpvN2JyQzMz?=
 =?utf-8?B?RG5MT3BsU0JBdk1WZndLbmhadnllMnhzakRzU1ArcHA2aGU2V0gxeEhaSkJh?=
 =?utf-8?B?TnpaRzhrZXZQMGF0RGorRGFadjhNYlJIQ1JLWEhRT0RmcTdLa2ZRQmk4c0xV?=
 =?utf-8?B?RWY3ZlBJbG9LblZNbjZlU2xvSTFzZE1KbnRhcTZKUVgvRWttTVdLb3RkRHJx?=
 =?utf-8?B?VmMrTTVTOFowYy80MlRybmc5MDN3c0dpSjNnRmNnN1haSHFtZE9UUW1OTzRE?=
 =?utf-8?B?Q0dQOWZIZDdONTRSRzI5dDFVUnl2dXdQRkVnT21NSGRwNGhWbHgxbm8vMS9y?=
 =?utf-8?B?cUR6SXkrRVJ0OEVMYnF5bVREY2VnRHNRWmxkZU4vR3krUi92Z2dOS0RBNW9v?=
 =?utf-8?B?TEVQeHZJUUpqSG1IRXFqcFpiNHhKMk5HaXYvUHg4UkFpdHUrZEpQblkrblQ4?=
 =?utf-8?B?Zld4Tlh0NkEzM0twUENIQXFEbEZ0MTByWmdJdmU3UGlTd1pFSVgxazJEREx1?=
 =?utf-8?B?TU0vTDkvb3JWVTZXSDlqQithSEI4TG1HZUFQNWhadWtsYVcrK2RQZmtkelRv?=
 =?utf-8?B?Wk9xeFliOWVMUzR4dHc1a0FkS1J0ZDIzdStLZ3lBMGtNVjcySUlReUlwOURr?=
 =?utf-8?B?bXRjUy8yZlFlOFVZcjFFRm1nVklLNzNwWVozWmxQV0FEcGlHU29OZWNBRVg4?=
 =?utf-8?B?MDZSZWNGSWtWVXBDZUJqdDVlVVZYdW1vSStXSEViLys0OUlrcjQyckJkNVFM?=
 =?utf-8?B?UzRHYVc0Vlo0Nkw1bjRoN0ZDTUlrdkN6Y2NQckxOS250TFUvbXFkV0x4clZV?=
 =?utf-8?B?eWMyUkg3WlZ5MHVIVTBIYXlONUVGR2RRVDNPTWpIdHJzSHExSTJ5b0NIMytW?=
 =?utf-8?B?cE4yTGpKZHI2VU1pV3l1UWpRNmNBTDQrdFdSZmVPd29paWQvcFVQNkIybVM1?=
 =?utf-8?B?TGlyekFManJHdmhybUdTK0R0dzNDT3Nlb3grZHcyRXJHRzJpcE1lYUcraXd3?=
 =?utf-8?B?eUNIL0t6cHRvVERFbVVaR2lqQjNVVFJ1Z3QrdS83cEJNSEZvWTdhVFBBcHdo?=
 =?utf-8?B?K0tBb0gxb09pdWxOclVuZFF3RHN5WXViaHh4SnFjZys3aVArMmNMUms0Y1JF?=
 =?utf-8?B?UmVacitPZmV5bW5DU1ErK0RZNFZxREtvNmJ3S0tUN2YvejdlTFZ1RnlZZGdG?=
 =?utf-8?B?YktoSi9xNzdBK29OR2ErOGFtdlFoN0RSZVBzRWova2RGOW5WRVVUTU05Ym5z?=
 =?utf-8?B?RnhtNGF5d1NvWTNpamxpalM0REhtb1Yzd1lNNG9lWVNzek50NWJCQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f2a13ea-0cb0-4e50-ac04-08df0380458a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 14:42:36.8080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Noj40m1gje7+EJYarcHrGxoQRdoRku/xMHpXwG8ga7FY8Ayat1/5CZi34v5ZxUFtpiYqT2MxI8RK3Xp9OlCsN/UoyApUf1yhMMn6ZyxYEdY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6943
X-purgate-ID: tlsNG-bad1c0/1787755361-BCECE034-C21DED05/0/0
X-purgate-type: clean
X-purgate-size: 445

On 26/08/2026 3:40 pm, Jan Beulich wrote:
> Just having called the function and stored the result, there's no point in
> calling it again right away with the same argument; the stored result can
> be used instead. And the stored result also doesn't need overwriting again
> with the same value.
>
> No functional change intended.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

