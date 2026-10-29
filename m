Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E76606A31A
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 05:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=41Bv8ap6
Received: from list by lists.xenproject.org with outflank-mailman.1464157.1674888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMIiv-0001lW-Bg; Thu, 29 Oct 2026 05:30:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464157.1674888; Thu, 29 Oct 2026 05:30:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMIiv-0001lP-7l; Thu, 29 Oct 2026 05:30:49 +0000
Received: by outflank-mailman (input) for mailman id 1464157;
 Thu, 29 Oct 2026 05:30:47 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Shuaidong.Chen@amd.com>) id 1xMIit-0001lJ-FJ
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 05:30:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMIis-009fd1-HH
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 06:30:46 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Shuaidong.Chen@amd.com>)
 id 6ae2d9ee-8faa-0a2a0a5109dd-0a2a4506832a-38
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 06:30:46 +0100
Received: from [40.93.196.21]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Shuaidong.Chen@amd.com>)
 id 6ae2da04-195a-0a2a45060019-285dc41532ba-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 06:30:45 +0100
Received: from BL0PR12MB4754.namprd12.prod.outlook.com (2603:10b6:208:8e::26)
 by CY8PR12MB7145.namprd12.prod.outlook.com (2603:10b6:930:5f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 05:30:41 +0000
Received: from BL0PR12MB4754.namprd12.prod.outlook.com
 ([fe80::ebe5:87e:6d95:580c]) by BL0PR12MB4754.namprd12.prod.outlook.com
 ([fe80::ebe5:87e:6d95:580c%4]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 05:30:41 +0000
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
 b=tdGJ0oEnEvLq5kTdjdnCAO9IQS/DpY2dCKk0lUWezBjr2ilmRD2TfHiph0uhJeOhVH7Rv/Xld/Q7ufZkJ7znSwcFTYOIXVPkzkdJ1tn2CwJHmG5jDuOcPBqk8Zl2MmI11ZQRSuIlRnFMbke3HP5l2dML+1GSFmDERdueCdyxNV3x0HCFQLCtKQhuXmEL2as990pOUMajHQK8piShDs7fVRpXPdAIvCosf9Gmh7ZSsCM5pD5TSOzw0k7d3RDapyKn22hXeYGYjpA2lERCpCz+2OuMtRKT/Vul/KzJEgCLcrRusDX+KIzrANPaNpPmA3yxaylZf2MwqdGCxmCpSblqYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+7Ss2GG/Hma27POK23U05kkj0KyiUOhq/b8t6sTeYo=;
 b=ewfJfl9HtfYGvp9AI3yhHKTRbXnuX9ugLN9/f0Ho6bgNA2UiiFJVB7q5DeM1qnJodSFMZX/kH3D2lpOau5xcf6gBRo0UmZM5OPXtBjz/CAiIIpbBAxHyjjokr64F5h/qgpItxBKtAFxAl+XkHHvBcAg5bKGtSeLficf2dNsOvvkvwYJAwtbPnA2wRHC7gfOUl56hFPNrIcIvNU9LadoZtWu8Jpk25RV4U2LQTJedrgY+g3e2nZ+cBZHN4b84PMmvZ/Xoy74mvT3rpkS1bNa/QfS91KApz1zrryzR1+KQ/O6tv3ww827ohF8AgLYXRwsPW7OmtEQmdJCHB0OOkKwbUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+7Ss2GG/Hma27POK23U05kkj0KyiUOhq/b8t6sTeYo=;
 b=41Bv8ap648Q1H+c4xcX7qxvu5tf3NcesTDeCRYr5U9jzxB4mFidCJHe9NQkgzU0dHizXbaYU1aD9KGjC1cKXah2xC1+dJ2yhJd2LGzeZdpruYBtfS/jIDwkSlyjQAi3Tkrm8ci0/65rHWMXo19l+ZGk4kSJH014uohW9I3ftLnM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <67f91d71-5692-4c07-a834-f282daaebd5a@amd.com>
Date: Thu, 29 Oct 2026 13:30:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] misra: merge the two R14.3 invariant-condition
 deviations
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 Penny Zheng <penny.zheng@amd.com>, Ray Huang <Ray.Huang@amd.com>,
 xen-devel@lists.xenproject.org
References: <20261026030309.2507461-1-shuaidong.chen@amd.com>
 <67e298cd-3b84-4476-9dd3-607e505effe6@suse.com>
 <321e7082-5cd2-4a41-9c49-ff091d9ceade@amd.com>
 <DMFI88UUOAJ7.19ST79GRB5D7H@amd.com>
Content-Language: en-US
From: "Chen, Shuaidong" <Shuaidong.Chen@amd.com>
In-Reply-To: <DMFI88UUOAJ7.19ST79GRB5D7H@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TPYP295CA0053.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::10) To BL0PR12MB4754.namprd12.prod.outlook.com
 (2603:10b6:208:8e::26)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB4754:EE_|CY8PR12MB7145:EE_
X-MS-Office365-Filtering-Correlation-Id: 5336d154-9678-48e1-5eb5-08df357dc5b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|261026140227099003|4143699003|5023799004|11063799006|56012099006|261021135927099003|261022075727099003|261022105027099003|261021123027099003|261021121427099003|10067099003|261009223027099003|261028144727099003|22082099003|261026121527099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	taYteq7yZ8hXz7Tde8bI1ZInPaeInp/FC0JVAAUzk62zKGhmBxeDdAVsjqucQXAs0bBRLuuETIFqlPnpm4hGPscK0p0y1/sJSS7QtyJNlhJTh2c8RJ0V9YiJgaqp6Q6A1gcGWml5Jhuj/nbYY9ZrgNOryVpmSjcfFi8fKLCKYfShtBkxdh93SJxd3sDRwDnFfgXN6Xa0jWbykujc8jc+XIj/aNVUvR+hu+BbqibvQwlubsw8X0TPgOOASX/G2RXUmOOP98m0hlMgykhv/p9N/ueGS9V/kcCzdEPeeK6IcZq/AlO9dJFM7tS3doNUV5il/rK41BgCqgyn6TFw/YdFjgs4GKFTJcy+l9lLcPtpYCQ3xt0s4GEvdyZh22gmkOiTvPFQeLpbCk5a4FFmozNZQ4e481P+V50oVLiJb3bGClbgplrKnuu+Zak4e2Aek4IWMIogeV+T7tmNmDvB/0aU+QagdIMobd6SEOa3o+BZd2UtkmZn8BoGO+iIPJ5M8pNBOtMwZDKVAM1iXCr4cEKuWWu8h7Vbka1RXYap7pcLjAyE+lZ+I5DMtLXnUIs6mjQQLA3t28abVHrqCQzYkIR2VzjW32vXvdFhnGT/YdTaXJgjXXgv1NwMbf5mswGZhmI6zyaFvG0LxAuefjsRf93exr/9FtYDjp5oH1MOjDeIJ+Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB4754.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(261026140227099003)(4143699003)(5023799004)(11063799006)(56012099006)(261021135927099003)(261022075727099003)(261022105027099003)(261021123027099003)(261021121427099003)(10067099003)(261009223027099003)(261028144727099003)(22082099003)(261026121527099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXZKK0taY1QrbEtMUU9PdmZkelhUUkozMHZOWlBMYkFGSDF3cm9RK2czS3dj?=
 =?utf-8?B?SDg4a2l6YzArdmJNT1FHQVBPdHNDQjdCQ05wNnVKdFB3M0drUG9ibUZaT3lW?=
 =?utf-8?B?L2FaUTV5U3lWbEtGUUNvNE92eG9CN2xGQkc1L2ZXMW8yVE1nZjU1bVRrNjZ1?=
 =?utf-8?B?cjRMZkVzaHF0UWppWnhQdEVmbERsQzZZSVlDRnJJWkk2bHV3YURkQjJHc2JZ?=
 =?utf-8?B?SVh3R2FqOXZNYS8wYnUxbkpvOU45K3BSQXpRODY3eGtOWUxsdFM3bCtFK2d5?=
 =?utf-8?B?aDUxK2t2OTRXRVUyTXVrc1RPNnVYcVBHZHdUYVNXd0U1bkNrRWlPa0E4YWVQ?=
 =?utf-8?B?d0R2cTM5NnlqcGp5alZrdlMrdS94QVlsTDk2OTBEQVZxTXRGR0psM3lSckUz?=
 =?utf-8?B?MkxzM0FUb1BMb04yQytOa0d3S084Sk80NllUZTRNN1h5YmpUY0ZOblJjN0gw?=
 =?utf-8?B?bTk3R0hWK2t4SDZMMVlPYmFoU2JCL2YwZ0hGdEpOemVteFpidGN0NDA2ajVj?=
 =?utf-8?B?M3FhZUJkRjBkOWtad0I0djA1bFMwcmYwdWExVm9INitrZ1k2eUszU1pTMXcw?=
 =?utf-8?B?SWxJZXdkTk9RdWFhanBXOHJnbzRpd1BsSlFFOUYxSmNlSFBLcHR3clBJTitI?=
 =?utf-8?B?Znh6Z21HK3lFSUU4NkcrQXFmQU5ENWRFQnRMMklHcnZqMG5yVy94ZUVPMloy?=
 =?utf-8?B?cjBYRDdaV3R0RU11ZjJyTlBFK2wxZ1lBM0NLK0h2SXc4eHVTaTlYMmR2S1F0?=
 =?utf-8?B?VGdFOU5ScGRFTytYMGhsR2VDY0xtSUhCVU9TMjVOcDdqazU1OFBLUW83R2c4?=
 =?utf-8?B?aVBvSEdKZ0pNSTU4Ukg1MTU2NDU3RFlGaHJOZEViNEg5V0V6cFB1cWh3aE9y?=
 =?utf-8?B?bG0xY2tqaEMyNGoxQ0Y5clZvd3FHV3ZESXBINGtHaUppOTM2VWpUdlc2OFYx?=
 =?utf-8?B?Nm5MRitWanl3elRreHJTajI4RlY0WWFLbDJKSGpQaFVPWlhmbmJ4SjJwRFRS?=
 =?utf-8?B?YW1FZC90L0dUK092N0NuSWlIK2NYVTg4QkdCaDdFaGEzUlhmL3VBeXpSeXlQ?=
 =?utf-8?B?bFZoM0F4VFlOZDRKNDdNZG8wWTMrYkQ5TkRCc2NSMXA0TkFOSkROVXlzc2lt?=
 =?utf-8?B?ODVQUGVLT2o2OG9LQm0wWFVNUWhUNlczR2dlL3lHTk0wdHlVcm43V2RDSG05?=
 =?utf-8?B?NzRVVE5xcHl3ZVRXZzJFYkk4Z2VJQUxlakVPOTJrbmhSU1hTK2ZmcHIraVlo?=
 =?utf-8?B?YTc3SXpIeVFwVHk5ejdoalEwRWRWMi8yNmNiekV3eHR1K25lVVREbjZROVlo?=
 =?utf-8?B?VTh3eGhIVy8ycGw4NHAwWjFxa2JVU24rYjJvZFZCM256WTVoV3dOa0pTNW10?=
 =?utf-8?B?NlUyTkNpdG5xM01Zck8rS01obkJtbVdQLzdzc05QdXF3ZjhSUXhQZmJ3czZY?=
 =?utf-8?B?cEY1VHpqVEdDazdYNTRxR2NObmRoUE5pQlpYaHlsMXNRZWkxcDdyMnpOOGM1?=
 =?utf-8?B?OVRoU3BPRWY3TUs0Tnh3T05Ba1REQjZkOVdkZDJvazdWVHFqK1VRQy9QQ3N5?=
 =?utf-8?B?Yk5tUVJQSVhwVWMvVTYwRmY5Z1dMckM3NEg1d0hVUVlxUWtONGx4VVJtdWNJ?=
 =?utf-8?B?TVV3ZnJoYnI5TWd6d2ZoUnFZR1NHWllHRWg2Nk1GRDlNV2lDaWxKeFVhNlVy?=
 =?utf-8?B?OS81eVBxNmxwQmVncGhBZjZ5TjN0UG9WOGFnWUpKcHJvYjI0dU83VU5OS0Ft?=
 =?utf-8?B?bHRDM3lBc1pGcHk3S0I0NjV4UDJMZzN6M0xSWUNNdUNPdWlGK0MyaEYrNTNi?=
 =?utf-8?B?MWcvMlAveFY1aU1mOG00VDhSZW5zeEtRRVRlbmdWeUZBQnpVQmtOSkdib0x6?=
 =?utf-8?B?VVZFbXNpQ1F6YUZ3S2JOYnBId1JseW11YWh4QStNcm10UGptQkgrTG9Nc01J?=
 =?utf-8?B?OFB1OWJPN3pTZXpqdy9oeldKTHppMkpOeW5lQlA1Zk9FZVduRnhzNDhBZXBC?=
 =?utf-8?B?bitGd3c4VU5kSVBmc1lIbi9BR08yWXBIbXJZZkRuWFM0N3hlRkQ1eUp2U3hY?=
 =?utf-8?B?YlFNUG1SNENBVlNTb1ljZUhRZGNZQjgrODFWd1hLVmxpdm5ySEswUVRFQmtm?=
 =?utf-8?B?cW15VGpmSmlTWE1lcnZMNDVCTFVUOHlyNnF1Mld1SHBEUExrbUpVendGRGVQ?=
 =?utf-8?B?SVM2OEpTVGJTQ1FUc21XTWxIWmg5bFloWEpha005Z0pIQ2RGQnZsdzVjZWg4?=
 =?utf-8?B?Y1IreWw0S0kvTXpyVi95Q2ExV2V2Rkd5b3N6SnRQam9PSHAwR2FDOTlzYlZp?=
 =?utf-8?Q?I/Pp9eogzBIX+cl9yw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5336d154-9678-48e1-5eb5-08df357dc5b2
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4754.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 05:30:41.7381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZyUFBZDKb8ziKm+4eQt2M1qanOERC6m1rzxYOKSNTbnztJ6hgZmTCZDezHUba+xVc/BSyIBpgOA3jscBWicfbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7145
X-purgate-ID: tlsNG-16d1c6/1793251846-F4C0777B-9F5FB199/0/0
X-purgate-type: clean
X-purgate-size: 6520
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/27/2026 5:14 PM, Alejandro Vallejo wrote:
> On Tue Oct 27, 2026 at 9:18 AM CET, Chen, Shuaidong wrote:
>> On 10/26/2026 9:14 PM, Jan Beulich wrote:
>>> On 26.10.2026 04:03, Shuaidong Chen wrote:
>>>> MC3A2.R14.3 ("Controlling expressions shall not be invariant") is
>>>> deviated by two separate entries.  One covers 'if' statements and
>>>> conditional operators and places no restriction on where the invariant
>>>> condition comes from.  The other covers 'switch' statements, but only
>>>> when the controlling expression is a 'sizeof' operator.
>>>>
>>>> The rationale recorded for the two is the same: the condition is
>>>> deliberate.  Nothing about a 'switch' makes an invariant condition less
>>>> deliberate than the same condition in an 'if', so the 'sizeof'
>>>> restriction reads as an artefact of that entry having been added for
>>>> read_atomic() and friends in arch/x86/include/asm/atomic.h rather than
>>>> as a considered limit.
>>> Well,
>>>
>>>       if ( 1 )
>>>
>>> can make sense, especially when 1 is the expansion of e.g. IS_ENABLED().
>>> Otoh
>>>
>>>       switch ( 1 )
>>>
>>> doesn't make a lot of sense, even when it's as a result of the expanding
>>> IS_ENABLED(). I agree that limiting to just sizeof() is unnecessarily
>>> strict; alignof(), for example, should about always be usable where
>>> sizeof() is. Yet making if() and switch() equal is imo going too far. I
>>> realize though that it may be difficult to find a suitable boundary.
>>> Stefano - do you possibly still have notes from the discussions long ago?
>>>
>>>> Fold switch_stmt into the general entry and drop the 'sizeof'-restricted
>>>> one, which the general predicate now subsumes.  Invariant 'switch'
>>>> conditions that are not a 'sizeof' become deliberate as a result; that
>>>> is the intent.
>>>>
>>>> Signed-off-by: Shuaidong Chen <shuaidong.chen@amd.com>
>>> What you don't say at all: Does this help with any remaining violations?
>>>
>>> Jan
>> Yes, and let me give the full context, since the motivation comes from
>> downstream safety work rather than from the upstream analysis.
>>
>> On safety branch one of the techniques we rely on there is to pin build-time
>> configuration to compile-time constants, so that the code which the
>> intended configuration can never reach is removed by the compiler
>> rather than merely left untested.  That matters for us in two ways:
>> code eliminated at compile time does not enter the coverage
>> denominator, and - more importantly - it is not in the binary at all,
>> so it does not have to be carried through the whole qualification
>> chain.
>>
>> Two examples:
>>
>> https://gitlab.com/amd-xen-safety/xen/-/commit/160dac43f554733a68d83c38cc1d0e73b3b7bff0
>> https://gitlab.com/amd-xen-safety/xen/-/commit/e0eccfa7184b7acee23916cd5cb2a3b5afa101f2
>>
>> A side effect of this is that some of those constants end up as the
>> controlling expression of an switch statement, which then
>> trips R14.3.
>>
>>   > Otoh switch ( 1 ) doesn't make a lot of sense
>>
>> Agreed in the abstract, and I would push back on anyone writing that
>> by hand.  But that is not what happens here.  The sources still read
>>
>>     switch ( gt->gt_version )
>>     switch ( opt_bootscrub )
>>
>> exactly as upstream wrote them, against what upstream intends as a
>> runtime-variable value.  The constant only appears after a build
>> configuration specialises that value.  So the construct is not a
>> pointless switch on a literal; it is ordinary upstream code that a
>> particular configuration has made invariant - which is precisely the
>> situation the existing 'deliberate' deviation for if statements and
>>
>> conditional operators already covers.
>>
>> Of course the other alternative: rewrite those switches as
>> if/else chains, which the existing deviation would already cover it, and
>> the violations gone. Technically that works.
>>
>> The reason I would rather not is that it is churn in common code for no
>> functional
>> reason, carried indefinitely as a delta against upstream, and it makes
>> every subsequent rebase of the safety branch more expensive.
>>
>> Having seen that a deviation for switch already exists - restricted to
>> sizeof - extending it to switch in general seemed the smaller and more
>> honest change: it states that an invariant switch condition is
>> deliberate, just as the project already states for if and for the
>> conditional operators.
>>
>> -Shuaidong
> To build further on this. add_sized() is one such case (already covered
> by the disappearing exception. There are existing cases in the upstream
> tree where this is or will be the case, but due to their being inside
> macros become invisible to Eclair.
>
> Or my (still not resent) cpu_vendor() series, I rely on placing
> X86_VENDOR_X constants as invariant expressions in switch statements.
> Even if nothing does it today, MISRA would be prohibiting constification
> of any global that happens to go in a switch for no particular benefit.
>
> IOW: This isn't about hardcoded values, it's about IS_ENABLED() gating
> and DCE.
>
> On the specifics of the patch, it's not exclusive to switches. I'd much
> rather see it extended to for loops as well.
>
>      for ( unsigned int i = 0; i < NR_MAX_FOOS; i++ )
>          ...
>
> Where having NR_MAX_FOOS be zero is effectively a guard on the whole
> loop. Today we need explicit early IS_ENABLED()-gated exits to keep
> Eclair happy on some such statements, and that's just strictly worse.
>
> Shuaidong had to recently fix these violations in our tree because the
> spirit of the existing exception is needlessly exclusive to "if"
> statements.
>
> Cheers,
> Alejandro

Yes, as Alejandro described, some DCE techniques have been adopted in 
safety to meet the coverage requirements for safety certification. 
However, this inevitably introduces code or macro patterns that can 
trigger violations of this rule in some cases.

The current deviation for this rule is unnecessarily narrow. If 
extending it too broadly would have an excessive impact, we could also 
expand it incrementally to cover specific cases as they arise.

For example, this patch could initially extend the deviation to switch 
statements only. That would already be a reasonable improvement over the 
current situation, where only if statements are covered.

-- 
Thx and BRs,
Shuaidong Chen


