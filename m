Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C82C54F51
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 12:35:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375743.1622808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp3Uw-0000Zy-On; Wed, 29 Jul 2026 12:34:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375743.1622808; Wed, 29 Jul 2026 12:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp3Uw-0000Zr-M3; Wed, 29 Jul 2026 12:34:58 +0000
Received: by outflank-mailman (input) for mailman id 1375743;
 Wed, 29 Jul 2026 12:34:56 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wp3Uu-0000Zl-QF
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 12:34:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp3Ut-005pgP-VO
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 14:34:55 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a69f361-2eae-0a2a0a5409dd-0a2a450ae574-14
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 14:34:55 +0200
Received: from [52.101.52.59]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a69f36e-f2d2-0a2a450a0019-3465343b0daa-4
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 14:34:55 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA0PR03MB5449.namprd03.prod.outlook.com (2603:10b6:806:bd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 12:34:53 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0245.012; Wed, 29 Jul 2026
 12:34:53 +0000
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
 b=FM+cvm2bVCfWQDvQ4N8Mi6FYGI7WtUbfkauDwhWzLWgE1FdvEQ2wa6X6xhEVNU0ycYmFJcav/oMx1kwJZtZws+lx/lwbNFAqUzKjrsavgK0k3E/WtCdMKzcrXZRqRZN4s7ng0xRqAleBbK8Gi4NSXd/KopAk2XtdMBaAjoOWGOHN035h4Y9EDL0Vu2Lm096FeANxperSDKGHxNXCRZCh2zD+BuyeFXpWPUJ8niLTGziKOUbZ7EsK+RMl429sAigSND0i18GEUTEaUYu2uoRl2xiSwi9+Hjg6tuUS79Szo7NC3eAYy5nJSl3GhqGywCPhoPuUsaHBBBKs/Owwfc9yAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijf+AaFwzvLrYWZoURADwHPayIRU8qj1kNcu6J1mUaQ=;
 b=vVhJ+yUqUA5gZvFSgX+bvKGVomWwuAlM+dkLYlAU64PspwiOVlKfJO1xV92te4Eqq1dYboRmX4CKE0D5LxjAwUGuHHUgskSswkWvVIuCMdsTHpH2IKNwS1ueDvwYI6R+F/A1HBZwW8S72fc3v54ndnlNw+25GdA0inQkyccvh1tjvTTnkRUzoIF9FWBZxShj3Oxn/cDtOIsuGCtwZ7q/1aqWP/J/KEqkqcHrlMHKTqPFvQsa3EaaaOH4PtD+SGTjwIyIIOcYE1lYenEacYqVZxzOzhlmurIbjDCosuWMSazh/3v2dD73gkUaZKMGzranvkozAe0RZHwTVUCm/kB37w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijf+AaFwzvLrYWZoURADwHPayIRU8qj1kNcu6J1mUaQ=;
 b=hV9crrCHxq4XQwRkaVG16FAxq1ef3Xsmt3cjPTZw9ol4QUz65/Y8EK8aAOsEzoIbaJ0C7b+rq5xCAMyljTfNAxPcYxWmaJfstdz9/7Kp/X0eN/5jPs2E/uYKkDfUf5Pd7xxjMJ5XVE+arbe3/Ebt+Eq3enxeoJoCQfys0eedZ7M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9c05828f-2034-4178-9ab3-ddee0003724f@citrix.com>
Date: Wed, 29 Jul 2026 13:34:49 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Community Manager <community.manager@xenproject.org>,
 "committers @ xenproject . org" <committers@xenproject.org>,
 Julien Grall <julien@xen.org>, "Orzel, Michal" <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] CHANGELOG: add Arm and RISC-V entries for 4.22
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <8087862a1149a8875b578c2b3d044919d8563a39.1783950107.git.oleksii.kurochko@gmail.com>
 <24C3741F-1803-4ED7-84E3-0A2801468D41@arm.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <24C3741F-1803-4ED7-84E3-0A2801468D41@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0248.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA0PR03MB5449:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ee97425-765c-474c-f3ad-08deed6dc9ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|4143699003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	srjqMekBdA5+aWV0Y1rsR7yB2fUX3f0gOnno6ZPc9mSbTfWzHe4ERIw+royTKyQxiHbPYmJ/rAsVeXB3PlkmHFJ9zJuvOGzrXuDpPGIFDBqQqitrr6rY2A7mMRSazVa5nvHUGfSp/mcYrGrsMzQUVqm6awjqs4U+awwxnEWHnj5AqBrEDjcJfsRw3Xn1zJlE+elRPcDgOqMlKQLEeFG0l2nz0pJl/7PxRDvo7NriTJnPAmwk3eyJIYrHB6aXp7DmKSPFJcvy5Vo5JQ80CO4TD+xHS6MV7yqolnyZORePAqWWiQcGcS3xwr+GJAiEeDQmsHT7b14CSSZtfDiOt/bns2Cm1ZLdLXaiFunaUSJvI2XJaHBaxON+zQB9pJ3F2peshkYBNQPBD2ZwoCRSej5aNIjWkQzm0vYA1Tj26LL4psczRetNTtWAnyBPcsP6BvZiyoPxyM3YiYr8CAZBlvBcZkdDxQBc0pHRtzDt6d6/pmBdbNOR2nxf0/UBHBCipK96jFPKIp9sUherR8WZmtxSxd830ZN0uDOMSyhnaNwFXkrau6sPHVHq1QyDLM84u+XPY1jdXF9Tf5tImX6Duhxsr10j9tB/zbHkzMFyQ5INWhFM08kMs626YJeBKVPBtJAMK2PpWQkKrH8KrvQLXOmKxRqBnlfgluDlm3Rzr+ySifY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(4143699003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UE1rKzVYcUZWZGJpcG5nSExTVnRtZGwzR29yU3NYREY4WUtrdDZITE1ZZWRy?=
 =?utf-8?B?NVRXdVlraURyNWo5L3ZJUWpIalBPWmdRWHlaMXo4ZlRGL2V3ZmZxcXdnTGll?=
 =?utf-8?B?YS93YWhUWHJxR29acE1iM2pHMGJvQlJsZEMxQXpPNlVnSkdHOTNwckpiVXNl?=
 =?utf-8?B?SnlhWnRhZDNuWGMwNGJtekdKbDY5T1BISDJ6aExFVHp6S1JXUDhaSnhMd2hV?=
 =?utf-8?B?bGcyY01LYlgyditqakl6a0dZdmVOSW9IRUd3bnRwZ3FtK0ZiRjdwYU5PSW1U?=
 =?utf-8?B?ekE1QURodXVBbjd3TGV1SS9XZFFWR3BmNEVSdzFGMmprbForT013UWVBeDZO?=
 =?utf-8?B?VHQyVDRMeUp4Y2NKay9nZk9GMExkYy95MFVjd1VlWTluMlBiSmpiYmczUStH?=
 =?utf-8?B?dWVwQUUvRGI3Szc0N3pkWmxHRVYyaVNUSVZOUVB3UWlLQzU4QlBVb2tWL0Zq?=
 =?utf-8?B?UnlUekNIdWNzTzR6bmdHTnVOR0Y4eTRBTWgxUE0wbnlyb2JMNTZGR0w3NWpG?=
 =?utf-8?B?T3NYdklLTmlZbDB1ZGpRbFNhT2lGNkQ5Z2NqVGczTVYwVmVGN1N4NjhyZERK?=
 =?utf-8?B?dlJMWmsyMGRWZ0VsdE44eWdJTWxud0RNN1RaTm4vY01Gd0cyOW5xTnd4VFV3?=
 =?utf-8?B?STY4R0ZqYkJjZ05NMlU4WHRFdmozak5lYlY3UUt5U1gxck1xY0JPdXJKaVdT?=
 =?utf-8?B?TTA4ZDVWdjJwdnJrZXlRTjJPM0ZiTzhhMG9pUVg2cHpubW9NRG5KS1U3WFll?=
 =?utf-8?B?RzhRM1NNTG9YWWJKYmJXMWhLZGJBaFZXWDZhVk1WQXRqKzRPQVVVb0JRLzFn?=
 =?utf-8?B?YUJTTURUZTgyYW96clNScFJ6Q3dWUDlzcmxsQVo3SlpJMWJ4MmtYa1dSMW94?=
 =?utf-8?B?LzRyV1NsaXV2M0piZFVWK3lCRUlQRFVVQXhuU0VlUTVPcXB1Ti9vd2MxVnlo?=
 =?utf-8?B?ZGRGU1l4eXZ3aDBUZWd1NlN3Mm5kai9EVkJhRDhNY3BodFpOSzdBUnpHNWNp?=
 =?utf-8?B?TmNoUnBZT2c5VUg1U0VVenFTVjlNMmdJekN1YVNRUVNQZUY5WHV2c01ZNEVN?=
 =?utf-8?B?d3RtSUdTM2V1bDltTElUeGd6ZVdIejJNK1ZCbHdDSXQzVzRib0p6M1g1bUhO?=
 =?utf-8?B?cHFHMVZvaDlXOE4wMU1WWW1Ld2x6ajRPOWZLeXJmOHE1SkV4a3htY2Jac2VL?=
 =?utf-8?B?ZmI5VHRmdjJVSG42TTljbG9JbVJqQkxWc0I3QmRya2JRSDRYaTdpNmR5MjQy?=
 =?utf-8?B?Wi9HMUJHME1COUYrNVFmRkhRc084VkxjWjhZQmNzL1NqeWw1TExuWUxlSVl5?=
 =?utf-8?B?RlYzOEZCWnN5S3gzL2JMdXlrKzh2N213TEFzYmhSUXYvZHhtejdHSnVyV2JF?=
 =?utf-8?B?akwwRkJzMWFXbkM3OVZNYlM0VkZTRHdlTlBmSlNycFdpbkgvbnA1R0J1aVhT?=
 =?utf-8?B?TU5Cc0NjQVBIcng5WXVCSUZOcllzUGRIVGVCdkpwdXoyY0p3ZnpDR3VzZkly?=
 =?utf-8?B?bkRkQmdWWjUvcGd4dUhTRTJBRzlWY1pMTTBwdXgwUzlpMk9HYUo0cVc2ZGt0?=
 =?utf-8?B?SHRrdHZid0ZlbXJnbGtzWG9yN0gvcXBMMm01c3dHenZ5MmFFc3hiZXVISWJX?=
 =?utf-8?B?a1ZSRFZjOWg4UXBnZnFrM2xVNVN4dFZvdE96aXoyYXFvVnR0Sys3R2l0dHc2?=
 =?utf-8?B?eG94ZHhrUzl3ODA5VzFKSU5FUTRsdmVHVTRmcHdtMFVpVW0yRkx4YU1tdFdB?=
 =?utf-8?B?V0R2OXE4OS9SenFsbHJzQWdVVnFNWnlzU0JadFRiamZHZEhLbHkxaEJabEpF?=
 =?utf-8?B?aGczUVpsZFRmNVhiRjI4ejZrazdtZktheSt2VGpXTU4rWEFjeU5QejlCOUNP?=
 =?utf-8?B?eWlOc0V0MnZ5MzdmaDQyZWF2dVhUN092Nzdubk1yL1FUL2VhQ1Q4cjJaaThL?=
 =?utf-8?B?K2VMeDQxaHh6QWR4Ny9tdWFuSjNtaklYcXlxaHBESkVjaGF4UVlIWFNReTFO?=
 =?utf-8?B?OWVhR2NxQ2l2WThTS3BpUXdGQ2pIVWcydk5wK25TUk1OVWE0RlBlVS90c2hq?=
 =?utf-8?B?clNBZzRLZzhGcnVTUEp4dnZkTG9lKzFwaVFER3huNFB4b2lxMkNSd0M2a1F4?=
 =?utf-8?B?UEMxVmF3bGc4NXNGbnE2VCtDSjgra0RIQUxsL0lFK2RKZ2lQcUlPWkJqNXE5?=
 =?utf-8?B?SmUzTE9iVjFBRFpmWDlKZjQrelJHU3NrbElpYkN1SmVXOEZpRW5xKzR1MXBW?=
 =?utf-8?B?dUYvU2l2ZmR2NmdnbWpXRVMyeVZFUm04YysySnllN1l2SENZTmlvQ2I4b1dz?=
 =?utf-8?B?T3JwdXlidnZZcFkvZmtvZFJtNnhPdE1LeVZTUTJQVlJHaVpoZFFJdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee97425-765c-474c-f3ad-08deed6dc9ef
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 12:34:52.9848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LsLJLTo2yZ2uVncoIQaglOKXkuQ7B+USE8B7DTzjIZfGKw0JVoUi1wsLQt72RAsEBciVKpk9e6nezDReZrK3zgaLsWIg/KoTzAaY5XpXuuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5449
X-purgate-ID: tlsNG-4011c0/1785328495-58FC6CFC-3DFCA697/10/73395122804
X-purgate-type: spam
X-purgate-size: 376

On 29/07/2026 7:43 am, Bertrand Marquis wrote:
> Hi Oleksii,
>
> It seems that this was missed.
>
>> On 13 Jul 2026, at 15:43, Oleksii Kurochko <oleksii.kurochko@gmail.com> wrote:
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

I'll pick this up with the Ocaml changes then.

~Andrew

