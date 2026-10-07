Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C5ECA5FFC
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 00:07:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441850.1659448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEFBl-00040O-Qt; Wed, 07 Oct 2026 00:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441850.1659448; Wed, 07 Oct 2026 00:07:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEFBl-0003zR-LF; Wed, 07 Oct 2026 00:07:17 +0000
Received: by outflank-mailman (input) for mailman id 1441850;
 Wed, 07 Oct 2026 00:07:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xEFBk-0003su-Ew
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 00:07:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEFBj-007ODb-Rt
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 02:07:15 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ac58d33-e002-0a2a0a5209dd-0a2a4507a862-2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 02:07:15 +0200
Received: from [40.107.159.140]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ac58d33-b4ea-0a2a45070019-286b9f8c3197-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 02:07:15 +0200
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by AS4PR03MB8229.eurprd03.prod.outlook.com (2603:10a6:20b:4fb::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 7 Oct
 2026 00:07:13 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0496.010; Wed, 7 Oct 2026
 00:07:13 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b3/7o/zLPsUU1nCRWLcGFDJPb55m078pfX+93U5sLzbRaBzgcfSE/h3aNZn9yz98vx0omm8wuR5otsUPGJhpM5P8JqMnRtMIRIBI4aEmrPEsIrJe8enHPJfQYemjdrqMeUuf9FzL58ktaaaBjN5WkHHOeWOmvxsY4X3aIzVGk1yxmCnn9c/B1pneqvmAvNKBgfAtJxIhDk2MbkffhAVWTGPlcR8Ho/WO5CuW/oz/ju2cbtJexW8BGG/ozTLX185CyVJKZXAePnVcwPDsaJecIawA1OXueDsRhPI1i9iCYnO20EL7EHr+9YLn5v162g0ocdcghsT2oFx4qixjDzqw2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+RBjyGHKMyCDE9Aii7NGmNigYgh0DUTvdcCMdaLjkcc=;
 b=WuoKVYqEWcn2vbi03lBZslMKL4HFo/F9YcEDkOKk+iQ+TVCmiqCZK1S7mOtT6JGTtdzqIwnZUh4sEYgJbSJZokCvGlMlxroipMF7VgaQUM7VPeunvrMknempKCfFbOwWrdPz+2+4w3WkeY6zafphKCwc6flasKSqHcFcq+wQU/QwiAwzYLnNwlzsbEvLdjcn2U0yfYRinvP9esAePqosNF65WKTfA9JXVK5JPagediBe/ubZCpsUetU7ZS1pyTncXzDBiNRGLPdIPMWZsQBjLKKASDzzsabQqG4No4ObWgc/goZNhNlFuma74TtSLbGyxp0nnnebLnS1HRa1KU+glg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+RBjyGHKMyCDE9Aii7NGmNigYgh0DUTvdcCMdaLjkcc=;
 b=G1zM717T31muN2XDCcv8mj83aZUstksNBSrAegXje5+TJwyaIHyTvUX8U3jhKfmzgAxR4chsExk5PUwoHMm20aIPFD2CrqTqCbcHrs5ZMTL82uH1QVjaSxH2SRIbhsCMyeY/LLBYfyER1KEZLYfNwI/OOybTsMhxqcuhryYWdCUsieuDaSV9cgGuv1LuK1DFqWwJwB7WD5CoMga5sDHtYqySmvGe1OW1as18pUjOpWi3fIjLntiQQu2k99N//sa40Nf6X64eMePlOoNXX9fcU630BWt4mv+cvCSVVa8rF0qXfpwZ1MRYqw6YCp3qnGTZ2Adx4yADCl57YJceAs3j/A==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic
	<milan_djokic@epam.com>
Subject: [PATCH v4 16/22] xen/arm: vsmmuv3: Insert vIRQ properties into vIOMMU
 device tree node
Thread-Topic: [PATCH v4 16/22] xen/arm: vsmmuv3: Insert vIRQ properties into
 vIOMMU device tree node
Thread-Index: AQHdVe/OQnGcH8ud10GMgq10JjB29Q==
Date: Wed, 7 Oct 2026 00:07:13 +0000
Message-ID:
 <72451b96b206613f92bc79b8adb5f7a2614e70dc.1791328190.git.milan_djokic@epam.com>
References: <cover.1791328190.git.milan_djokic@epam.com>
In-Reply-To: <cover.1791328190.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB9587:EE_|AS4PR03MB8229:EE_
x-ms-office365-filtering-correlation-id: 8ca01cf1-7b61-4e74-3fa0-08df2406f090
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|56012099006|11063799006|10067099003|6133799003|22082099003|38070700021|18002099003;
x-microsoft-antispam-message-info:
 Hwtt/WBlbaWh+wU2Ir2niCL0p3FkZeEQPp59xn61E+m6lfKjmkVv5WboEhSd/V6bPCT/z052atkYcOXIk5hsjtKJ6NLK3QlI5N1B2ctYMMGSgYMouHT7oQON1P9R/SBgjo+CVnilMxD932CuyZnC9qUQd4BMYWELE/Pz5oMM8+ve1MjPynK5wMi7CtvN+4IiTVtSmrlzHbOmOeQwPcE4S/tYiWn5mfro5NH+FKckCMhqa5v5/MwNfsuArk5FbUwXjczxMRspPMzwaNc7q7FxO8Gd0JRfTajdjUjDQXhDzfnN43sEeoHzfODh5kTteW04CbrB8bSV4zoYplEFvYUyw73l4gr9yuzs2sa7A6sZMdZJLgUHuTf6l90IDwcMc0/5X9U5KkYIz5ArIck9AxivRaEYFrX1qY3H+yCRlPFVFwvw1+lXNvlxAb0BfSxKxVoIxTwzJ4RGi7zcdlx2xqoeAZgJVJXCm7W6+uNVndwAQj8XxmiAFIMm108hC5/9Q0sTpNTGotLZg4ABydQGwMIwR9pkeeeYvcLPSlpfsC9gH942HyLQGetkM55+4tPggBFI557I+suFnMfXVT3IWH3u7IZu3ftj7I84FwiTujvpp3+dXdYe5xteGaNM3XRccQ78lIC79zPrh4tmjTtSgC6lfHmurrjgXDfd5ATeqcEzLtnBtZbNJrLNHc2T/P/BfTK3vMM9rtIO4+AiduB8yeUZ6f+6noHJxQZGYfrPg8KfhKY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(38070700021)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dkFnbUpUU055YTk2NWY1NHdab3V4RW81bnpNTUNkOHBLeHN1WmhiYjRtOEVR?=
 =?utf-8?B?WVQrVUwxdlk4Q3FVaytvU1RqS01uUmN1Qk82LzQwL1pSR0lXWG9RSFlFcTJp?=
 =?utf-8?B?eWl0bTdyNEtKVG55NGdxUVlHMXNoN2krb2NVOS9lTndBbXNjSjRpY1VjU3BS?=
 =?utf-8?B?a2JwTmI3MWw4Y3E3T05JdjV3K1RaMCtzbjJ5MXBodTFIN3Z2VU8zRUJtdUpp?=
 =?utf-8?B?czJ2MU1JSm1zQnloWTlLeVlqdnZDbWZxZFpjZnVRYk9rZzFTTVRSRTZnazQ5?=
 =?utf-8?B?RnhXKzRlTG5jK3VRMWk1d3BadFQ3UFJOQVMyTm94ODlOSUNMb3Q0Nkl5VU5w?=
 =?utf-8?B?S0FmdXJzZkRJZUlkSHpVa2h1cGtvMGlyMkxmZCtUeGJLRVZmYjRpRDZFOEhj?=
 =?utf-8?B?SXZET3UvNjdBRC9IK2VxREhmakQ0QzZVYlJNM1pvWW5mWHVZWWhCZVpIcU00?=
 =?utf-8?B?a2c0OXN3alR3b0hFUW9HY3V5TjRWaytGY3ZUdjQ0bFI0V2lveEMxVUowOU5O?=
 =?utf-8?B?NURwTm90bS9FVjYzUnIwK3RRUVFjR1pwTXYxRTlqYjY1VkNBblc2b21CRlcr?=
 =?utf-8?B?NWRCeFNPckU2algvT2NEb3FnZ0dkOXhLcEduaXVZTnI5Vy9NeUs4Zjc4QjNN?=
 =?utf-8?B?dUlMYnJVTlNON24wZVlKYlJiNEFLU0M4dkVaZDJVRE5Lbk5CTGJ0VVd3bG9j?=
 =?utf-8?B?RGR5QWh3RGhmT1ZzMytqY3Z3MjBBVWZsNjlubi91RjNSRUx6V2ZMdS90Q1Vq?=
 =?utf-8?B?aVp4dTAwTy9KRFR0UnlMSUJHeVRzcGR4OEs2emc1SG5UWjMwWWlMeDZENzBw?=
 =?utf-8?B?OG1PTDFpbm9JRmNQbEZLbHN1QUFzSlFhNjFuRTkraGNVdHJJblVvbUgxT1ox?=
 =?utf-8?B?RjdLN3RWcDczWFpwQmdhaXZpR1NEUmNNN3MySkZwYWxBMXBsTHk4ZUUvYjN5?=
 =?utf-8?B?b2NKaVpvbE5QdGhBYkh5cFgwWGp3Q0ZIUEJhUGxVdUN1SG1URFlTbVZNZkpD?=
 =?utf-8?B?ZnJOMjBsbmFiU1pxTkp4RkxMYmNydE1kWXRMODQ0QVVLUm1FOURQVnd2QlZy?=
 =?utf-8?B?ZEpFMWc3c0tSaHFsUWNKUGpQZFpiQ1grRDI4M2VqazBmSTNHTHBsUVRrSTZq?=
 =?utf-8?B?TFFmQWdscXVYN1JzRm8vRHdEdEpYNWFhVjE0akJNaCtXUHlna2k1ckZ3TGJG?=
 =?utf-8?B?Q2VMbTRHUUY0ZFExT2VPcVRWVnNnbWZvVE55d01iRGhLUWNpakZSdVdyUG9X?=
 =?utf-8?B?UnFneDBnWTkweDFBMS9oOTdidElPeDZxZDhmSkdTRFNRb0w4ZzA4UTdDN1g1?=
 =?utf-8?B?MGRBQ3ZNQnYxbWNneVB6cyszUm4xL0tGRWFMcThhNmJJc0FJZzc2RE13Ni8y?=
 =?utf-8?B?bHlLVWRtN1lYUUlraEx2SC9XUHFBd0h4QnJyckd4bktjLzg5RkJRUHJkdDRa?=
 =?utf-8?B?eStIb1k3ZmJIeGYyTHZIQjBBWXVoNFluYmpVNU5CRE1EekM3VlFwdk1TSUFn?=
 =?utf-8?B?VUYyRWFxekFUR2hGWFA5eTRVRmpsSlowOW9QSlRCYm9GUVFoNnF5VEEyU2lL?=
 =?utf-8?B?eVhzU0F3TGdyaGpDNFZBMjBqc0p0eVlkL1ZGOWQyVlB6SmduSkFZMFJkVm5x?=
 =?utf-8?B?dUtjSFNZWm5wT0hQZnM4bWEvbmhqejc0bE9yQk1wOWQ3M3llMmd4WERlOFI0?=
 =?utf-8?B?M3dsQ2RUYjJuYUE2TVF4YksxL2RST0EwaWVtVGVhVUFJNTUzV1VPc2Z4MUdr?=
 =?utf-8?B?VU93SWZ5MWV6L3JsTDZTcmZiL3JVR0RTWjZjZ0tnc1k5UERDblVTNHo2STUx?=
 =?utf-8?B?VXZCSXA4RUtwc0c5MUkzZndiZnNXT0NzNzBqdDRFTnZudGUzWmhPeE5IcDFE?=
 =?utf-8?B?Rm43K1pQemdkL0xuYWhHUWJPaFFkdkRIOHBBc0JxTE5KZU9NVy9vM3U4eTRH?=
 =?utf-8?B?eDhkVTFCdCtCTEJRRzBkY1lFTFU2bEJCek5NYUlLbnhyNzl0TmZDMEdZS2du?=
 =?utf-8?B?V29LMFVoeHNvQWdUNk1TTlU5MkRuOVR0YzRZVGIzNWVVSXlnYUwyazJVR21l?=
 =?utf-8?B?aFdyVlBENVE5VEVOeTFPalhFTGVBSVpNa0YwMC9GZWh5RkNqY3g2VzgyVFBq?=
 =?utf-8?B?ak93MzZxU0tTQ2hPNUFPRkxRVC93OFdNZndWaW4wY09mdjM0S2tUUjhCdXRK?=
 =?utf-8?B?ekJaUGg5OGFrb0hoc3J4RjQ1NTZzbU1KYTk5U0NPQmJHSGZLWkNFTll0R2ly?=
 =?utf-8?B?SCtzZFNKaHpFNzZxMjZwTHEvTnFISWI4ZUw2bFZ3SFpJK2kwQ09yRkFmVlhp?=
 =?utf-8?B?N2xHdnFxeUFJK2tFMXZRTXgwUUxiVXlydXhwZEcrd1AwZUFOcXZJUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca01cf1-7b61-4e74-3fa0-08df2406f090
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2026 00:07:13.3980
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l3yyXPPPU4DBbCaQvkx5rlMBMxohiqj06oOOkbfvwql8lzPDad6UlaoN7d9JlHTKe41U8UeGfUxyz58gVhfvqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8229
X-purgate-ID: tlsNG-ef75cf/1791331635-A62C4AE4-01886601/0/0
X-purgate-type: clean
X-purgate-size: 5920

RnJvbTogUmFodWwgU2luZ2ggPHJhaHVsLnNpbmdoQGFybS5jb20+DQoNCkluc2VydCB2SVJRIHBy
b3BlcnRpZXMgZm9yIGV2ZW50IHF1ZXVlIGFuZCBHRVJST1IgaGFuZGxpbmcgaW50byB0aGUNCmVt
dWxhdGVkIElPTU1VIGRldmljZSB0cmVlIG5vZGUgZm9yIGRvbTBsZXNzIGFuZCBsaWJ4bCBndWVz
dHMuDQoNClNpZ25lZC1vZmYtYnk6IFJhaHVsIFNpbmdoIDxyYWh1bC5zaW5naEBhcm0uY29tPg0K
U2lnbmVkLW9mZi1ieTogTWlsYW4gRGpva2ljIDxtaWxhbl9kam9raWNAZXBhbS5jb20+DQotLS0N
CiB0b29scy9saWJzL2xpZ2h0L2xpYnhsX2FybS5jICB8IDMwICsrKysrKysrKysrKysrKysrKysr
KysrKysrKy0tLQ0KIHhlbi9hcmNoL2FybS9kb20wbGVzcy1idWlsZC5jIHwgMTcgKysrKysrKysr
KysrKysrKysNCiAyIGZpbGVzIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pDQoNCmRpZmYgLS1naXQgYS90b29scy9saWJzL2xpZ2h0L2xpYnhsX2FybS5jIGIvdG9vbHMv
bGlicy9saWdodC9saWJ4bF9hcm0uYw0KaW5kZXggMTIwN2I2MjBmYS4uNDEwZGM5OGQwOSAxMDA2
NDQNCi0tLSBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfYXJtLmMNCisrKyBiL3Rvb2xzL2xpYnMv
bGlnaHQvbGlieGxfYXJtLmMNCkBAIC04Niw4ICs4Niw4IEBAIGludCBsaWJ4bF9fYXJjaF9kb21h
aW5fcHJlcGFyZV9jb25maWcobGlieGxfX2djICpnYywNCiB7DQogICAgIHVpbnQzMl90IG5yX3Nw
aXMgPSAwLCBjZmdfbnJfc3BpcyA9IGRfY29uZmlnLT5iX2luZm8uYXJjaF9hcm0ubnJfc3BpczsN
CiAgICAgdW5zaWduZWQgaW50IGk7DQotICAgIHVpbnQzMl90IHZ1YXJ0X2lycSwgdmlydGlvX2ly
cSA9IDA7DQotICAgIGJvb2wgdnVhcnRfZW5hYmxlZCA9IGZhbHNlLCB2aXJ0aW9fZW5hYmxlZCA9
IGZhbHNlOw0KKyAgICB1aW50MzJfdCB2dWFydF9pcnEsIHZpcnRpb19pcnEgPSAwLCB2c21tdV9p
cnEgPSAwOw0KKyAgICBib29sIHZ1YXJ0X2VuYWJsZWQgPSBmYWxzZSwgdmlydGlvX2VuYWJsZWQg
PSBmYWxzZSwgdnNtbXVfZW5hYmxlZCA9IGZhbHNlOw0KICAgICB1aW50NjRfdCB2aXJ0aW9fbW1p
b19iYXNlID0gR1VFU1RfVklSVElPX01NSU9fQkFTRTsNCiAgICAgdWludDMyX3QgdmlydGlvX21t
aW9faXJxID0gR1VFU1RfVklSVElPX01NSU9fU1BJX0ZJUlNUOw0KICAgICBpbnQgcmM7DQpAQCAt
OTcsMTEgKzk3LDIxIEBAIGludCBsaWJ4bF9fYXJjaF9kb21haW5fcHJlcGFyZV9jb25maWcobGli
eGxfX2djICpnYywNCiAgICAgICogb2YgU1BJIFZJUlEgZm9yIHBsMDExLg0KICAgICAgKi8NCiAg
ICAgaWYgKGRfY29uZmlnLT5iX2luZm8uYXJjaF9hcm0udnVhcnQgPT0gTElCWExfVlVBUlRfVFlQ
RV9TQlNBX1VBUlQpIHsNCi0gICAgICAgIG5yX3NwaXMgKz0gKEdVRVNUX1ZQTDAxMV9TUEkgLSAz
MikgKyAxOw0KICAgICAgICAgdnVhcnRfaXJxID0gR1VFU1RfVlBMMDExX1NQSTsNCisgICAgICAg
IG5yX3NwaXMgPSBtYXgobnJfc3BpcywgdnVhcnRfaXJxIC0gMzIgKyAxKTsNCiAgICAgICAgIHZ1
YXJ0X2VuYWJsZWQgPSB0cnVlOw0KICAgICB9DQogDQorICAgIC8qDQorICAgICAqIElmIHNtbXV2
MyB2aW9tbXUgaXMgZW5hYmxlZCB0aGVuIGluY3JlbWVudCB0aGUgbnJfc3BpcyB0byBhbGxvdw0K
KyAgICAgKiBhbGxvY2F0aW9uIG9mIFNQSSBWSVJRIGZvciBWU01NVS4NCisgICAgICovDQorICAg
IGlmIChkX2NvbmZpZy0+Yl9pbmZvLmFyY2hfYXJtLnZpb21tdV90eXBlID09IExJQlhMX1ZJT01N
VV9UWVBFX1NNTVVWMykgew0KKyAgICAgICAgdnNtbXVfaXJxID0gR1VFU1RfVlNNTVVfU1BJOw0K
KyAgICAgICAgbnJfc3BpcyA9IG1heChucl9zcGlzLCB2c21tdV9pcnEgLSAzMiArIDEpOw0KKyAg
ICAgICAgdnNtbXVfZW5hYmxlZCA9IHRydWU7DQorICAgIH0NCisNCiAgICAgZm9yIChpID0gMDsg
aSA8IGRfY29uZmlnLT5udW1fZGlza3M7IGkrKykgew0KICAgICAgICAgbGlieGxfZGV2aWNlX2Rp
c2sgKmRpc2sgPSAmZF9jb25maWctPmRpc2tzW2ldOw0KIA0KQEAgLTE3MCw2ICsxODAsMTEgQEAg
aW50IGxpYnhsX19hcmNoX2RvbWFpbl9wcmVwYXJlX2NvbmZpZyhsaWJ4bF9fZ2MgKmdjLA0KICAg
ICAgICAgICAgIHJldHVybiBFUlJPUl9GQUlMOw0KICAgICAgICAgfQ0KIA0KKyAgICAgICAgaWYg
KHZzbW11X2VuYWJsZWQgJiYgaXJxID09IHZzbW11X2lycSkgew0KKyAgICAgICAgICAgIExPRyhF
UlJPUiwgIlBoeXNpY2FsIElSUSAldSBjb25mbGljdGluZyB3aXRoIHZTTU1VdjMgU1BJXG4iLCBp
cnEpOw0KKyAgICAgICAgICAgIHJldHVybiBFUlJPUl9GQUlMOw0KKyAgICAgICAgfQ0KKw0KICAg
ICAgICAgaWYgKGlycSA8IDMyKQ0KICAgICAgICAgICAgIGNvbnRpbnVlOw0KIA0KQEAgLTkwNyw2
ICs5MjIsNyBAQCBzdGF0aWMgaW50IG1ha2VfdnNtbXV2M19ub2RlKGxpYnhsX19nYyAqZ2MsIHZv
aWQgKmZkdCwNCiB7DQogICAgIGludCByZXM7DQogICAgIGNvbnN0IGNoYXIgKm5hbWUgPSBHQ1NQ
UklOVEYoImlvbW11QCVsbHgiLCBHVUVTVF9WU01NVVYzX0JBU0UpOw0KKyAgICBnaWNfaW50ZXJy
dXB0IGludHI7DQogDQogICAgIHJlcyA9IGZkdF9iZWdpbl9ub2RlKGZkdCwgbmFtZSk7DQogICAg
IGlmIChyZXMpIHJldHVybiByZXM7DQpAQCAtOTI1LDYgKzk0MSwxNCBAQCBzdGF0aWMgaW50IG1h
a2VfdnNtbXV2M19ub2RlKGxpYnhsX19nYyAqZ2MsIHZvaWQgKmZkdCwNCiAgICAgcmVzID0gZmR0
X3Byb3BlcnR5X2NlbGwoZmR0LCAiI2lvbW11LWNlbGxzIiwgMSk7DQogICAgIGlmIChyZXMpIHJl
dHVybiByZXM7DQogDQorICAgIHJlcyA9IGZkdF9wcm9wZXJ0eV9zdHJpbmcoZmR0LCAiaW50ZXJy
dXB0LW5hbWVzIiwgImNvbWJpbmVkIik7DQorICAgIGlmIChyZXMpIHJldHVybiByZXM7DQorDQor
ICAgIHNldF9pbnRlcnJ1cHQoaW50ciwgR1VFU1RfVlNNTVVfU1BJLCAweGYsIERUX0lSUV9UWVBF
X0xFVkVMX0hJR0gpOw0KKw0KKyAgICByZXMgPSBmZHRfcHJvcGVydHlfaW50ZXJydXB0cyhnYywg
ZmR0LCAmaW50ciwgMSk7DQorICAgIGlmIChyZXMpIHJldHVybiByZXM7DQorDQogICAgIHJlcyA9
IGZkdF9lbmRfbm9kZShmZHQpOw0KICAgICBpZiAocmVzKSByZXR1cm4gcmVzOw0KIA0KZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL2FybS9kb20wbGVzcy1idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbTBs
ZXNzLWJ1aWxkLmMNCmluZGV4IGZjZTljZGJlZjUuLmRjZTJlYzdmNDkgMTAwNjQ0DQotLS0gYS94
ZW4vYXJjaC9hcm0vZG9tMGxlc3MtYnVpbGQuYw0KKysrIGIveGVuL2FyY2gvYXJtL2RvbTBsZXNz
LWJ1aWxkLmMNCkBAIC0yMjUsNiArMjI1LDcgQEAgc3RhdGljIGludCBfX2luaXQgbWFrZV92c21t
dXYzX25vZGUoY29uc3Qgc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbykNCiAgICAgY2hhciBidWZb
MjRdOw0KICAgICBfX2JlMzIgcmVnW0dVRVNUX1JPT1RfQUREUkVTU19DRUxMUyArIEdVRVNUX1JP
T1RfU0laRV9DRUxMU107DQogICAgIF9fYmUzMiAqY2VsbHM7DQorICAgIGdpY19pbnRlcnJ1cHRf
dCBpbnRyOw0KICAgICB2b2lkICpmZHQgPSBraW5mby0+ZmR0Ow0KIA0KICAgICBzbnByaW50Zihi
dWYsIHNpemVvZihidWYpLCAiaW9tbXVAJWxseCIsIEdVRVNUX1ZTTU1VVjNfQkFTRSk7DQpAQCAt
MjU1LDYgKzI1NiwyMiBAQCBzdGF0aWMgaW50IF9faW5pdCBtYWtlX3ZzbW11djNfbm9kZShjb25z
dCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvKQ0KICAgICBpZiAoIHJlcyApDQogICAgICAgICBy
ZXR1cm4gcmVzOw0KIA0KKyAgICByZXMgPSBmZHRfcHJvcGVydHlfc3RyaW5nKGZkdCwgImludGVy
cnVwdC1uYW1lcyIsICJjb21iaW5lZCIpOw0KKyAgICBpZiAoIHJlcyApDQorICAgICAgICByZXR1
cm4gcmVzOw0KKw0KKyAgICBzZXRfaW50ZXJydXB0KGludHIsIEdVRVNUX1ZTTU1VX1NQSSwgMHhm
LCBEVF9JUlFfVFlQRV9MRVZFTF9ISUdIKTsNCisNCisgICAgcmVzID0gZmR0X3Byb3BlcnR5KGtp
bmZvLT5mZHQsICJpbnRlcnJ1cHRzIiwNCisgICAgICAgICAgICAgICAgICAgICAgIGludHIsIHNp
emVvZihpbnRyKSk7DQorICAgIGlmICggcmVzICkNCisgICAgICAgIHJldHVybiByZXM7DQorDQor
ICAgIHJlcyA9IGZkdF9wcm9wZXJ0eV9jZWxsKGtpbmZvLT5mZHQsICJpbnRlcnJ1cHQtcGFyZW50
IiwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAga2luZm8tPnBoYW5kbGVfaW50Yyk7DQor
ICAgIGlmICggcmVzICkNCisgICAgICAgIHJldHVybiByZXM7DQorDQogICAgIHJlcyA9IGZkdF9l
bmRfbm9kZShmZHQpOw0KIA0KICAgICByZXR1cm4gcmVzOw0KLS0gDQoyLjQzLjANCg==

