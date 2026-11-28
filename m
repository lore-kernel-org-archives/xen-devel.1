Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F06C606A31C
	for <xen-devel@archiver.kernel.org>; Sat, 28 Nov 2026 12:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=slXA9sk2
Received: from list by lists.xenproject.org with outflank-mailman.1506365.1700206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xXHjr-00052B-2g; Sat, 28 Nov 2026 12:41:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1506365.1700206; Sat, 28 Nov 2026 12:41:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xXHjq-000522-To; Sat, 28 Nov 2026 12:41:10 +0000
Received: by outflank-mailman (input) for mailman id 1506365;
 Sat, 28 Nov 2026 12:41:09 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xXHjp-00051w-Bn
 for xen-devel@lists.xenproject.org; Sat, 28 Nov 2026 12:41:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xXHjo-000OR6-Jd
 for xen-devel@lists.xenproject.org; Sat, 28 Nov 2026 13:41:08 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b0acbd4-2eae-0a2a0a5409dd-0a2a4509df46-24
 for <xen-devel@lists.xenproject.org>; Sat, 28 Nov 2026 13:41:08 +0100
Received: from [40.107.201.32]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b0acbe2-be1a-0a2a45090019-286bc920a690-3
 for <xen-devel@lists.xenproject.org>; Sat, 28 Nov 2026 13:41:07 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5728.namprd03.prod.outlook.com (2603:10b6:a03:2dc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Sat, 28 Nov
 2026 12:41:04 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0662.007; Sat, 28 Nov 2026
 12:41:03 +0000
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
 b=S3ClT7S0omOhNta/rnqik5or85Mwj8c+mDg5rwuUG7lMVVdBA4IGMcSPGyHOIkDjEZZNlnIPxbWBtjwaG5n+Fmt532EdQs6mj9CgEfQ+Yyksd/itU3JSHTMOVM2dVOtwY/jDEeXFUAdsQX0wi8ccYv7HeunsLwVKF9ZYFlIafKqT5enG1XTLeN3dZU094z+nBK9IE6oPdUaMACu4u0bdWskDMsVFGGR0MEECMnE8Mcrh0oytTjXzYRfujw3CJbP6QoAE3JXzcYWKABbIx0cnGx5R9OupgEJxhGls1sPF13MabK4vPqdLUnIbQ75n/R3caL9XzQzMU3OcLXpqWYf1nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y3drNNuU3PSRuIkFK19H81CgFIykgnX3vO/2UnScJYo=;
 b=C3xVPyxR0nNgA40xke3Z/v/kBJMTsWt8Umw6BbLCT2336sXZ+4+oT9uYayYxExPWJRvMftJ8/sSjmScLGBurSVt1CuXqjkQ0S4DghZvsITk3rmE5GOpBu6IuXoiKBVvFuU8lHE1vWWeDzUolYjv9Ayd2rjXPBp8hjlJfbsWjy8LnsXJJhx5mn1hyMP3y1RzbU6MrtiOeZ/zot/aj1wEhD+FfeQp+DfttOnHaWCKQKcrr+vixP4vPXzq2j7+IJaglJAO2/LOb/v/4krU7xW/yZZRxFBII21mFTb125LVVab579hPhiCB0puNDVY3VHdx/9r1xHVXwehHJKbcwaq8rNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y3drNNuU3PSRuIkFK19H81CgFIykgnX3vO/2UnScJYo=;
 b=slXA9sk2lL2UIhpqQNz95jxz0KiN9sIeQhE9dxxAVaaAbDqJj9awgMYSlcGnTe5qMc1eby1ydgUNMagGn3z3PB+m3A+SluPKaJA9vW2SiDZJ0c9p8f2erHGJEyGimMK9q2uw1yxbWL8g18Chi0q+0d3gh1ZhpnVVld885P9QAs0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9a640944-5f22-4d7f-b37c-22562f8ebc28@citrix.com>
Date: Sat, 28 Nov 2026 12:40:59 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH v2 1/1] tools/tests: pick a GIC version for ARM test
 domains
To: Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
References: <1795783916.8631fc262581453bbf619ec5b2062170.1a21d0ffa91000bb85@vates.tech>
 <1795784122.8631fc262581453bbf619ec5b2062170.1a21d131f21000bb85@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1795784122.8631fc262581453bbf619ec5b2062170.1a21d131f21000bb85@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P265CA0028.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5728:EE_
X-MS-Office365-Filtering-Correlation-Id: 50e7283f-69fe-45fe-1525-08df4d4cdd1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|261021121427099003|56012099006|11063799006|10067099003|261022105027099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|18002099003|22082099003|6133799003|261009223027099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	XTsc/cpupUxETHdbCFsWyEYNhAhiLCT/+07gWFac29g3UpgbtT4bYomr7JqwNLSlLV8Cw3apOvLkseqqozVXyc20nFKYG4BhYJf2JzjxOW3shCkROl3LlD95ws0KVKu5uN0bGQA/zGAjjcXq68Ci9RT7ZJe8H7LirMuqMg3QqcmjX7sRFmd7zDR43NtMJdxDuO+3UlvFH0ZMBE0a0S0AhDO60YHJKT6XYZPpnzM6+1uGpoqFzagzXz7X7dzLUZKId3sI6PP7bctkyqHZae1PiivXi1nhVAvZ8fi9ZPRY/2DLfvMzUsJziB3uTXhD68IlZPgSbph781L/b777ph2YmSQSdIep2pvCYe+WLxATULtxYtcikeuxMCKkmLX7YfcGzFLN0PXU2tQ7FqO/Sfy45Dyej62o2+f4lpKDcbcQhk0JLdg5NaGxjSdXa0KO2vJ1DgM7J0iyEVP5Bzr1bnNHyLaaRf4WUtRc75K3T1k6qJKajLMqPmRH9feQYlMlZhPsc32C+iK5yap5JzOo9KLMUbGpLex5xV+fjSu5uEWgdEnFS1hY8CUzgK8RogDbxzxy2GaYfiaJ5ypKnOkA4YqgU193FfQovwmQY9NBpWMH3wkQGnySmEttjuz7nkbzaEWmnHW/02Zgq+7EfB6PZjRFJXUh9RBfMdO2Jp/o+vUrrCw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(261021121427099003)(56012099006)(11063799006)(10067099003)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(18002099003)(22082099003)(6133799003)(261009223027099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDFCTHkrMlBJeDNyUEpHZHRTVzhlN0MzSlE4WnZlSDRYTURDb0tiZERRMERT?=
 =?utf-8?B?MUFUMEkrdjJ4Y1FSaHYxQlIySW9KWnc2TzRQQWJyY21KK21XN0dsOTcrbURI?=
 =?utf-8?B?b0t5Z0dKNEJaTnRIU0gzZk4yWm91ZFQ2QVYyUnlHR3pZSnNQemFobEw5c1RK?=
 =?utf-8?B?dkN4S0pINFh2eHRkSXRuUU5weCtnS3ZnQjlDT0x5Mm5DQ0pYSlJWVUpzWmtJ?=
 =?utf-8?B?MEFKeERiTHpIZXhPaWdGNkw5RUxwakRITzlQNFlaTFZQL0NpMHJ3L1FEa0lX?=
 =?utf-8?B?Zm5SdzNwY0xDNjg5NEcraHU2TXFybnF3Z2p1Vm9NZUduenBsZld6bXhmejl5?=
 =?utf-8?B?dEx1c295eGhRU0NhbXdxbk5Kc1dRVkxxU2ZaUlFQcW5LMDBQOHV6ZDMrSlZ6?=
 =?utf-8?B?MlBlenRWczZQTmthU3EwVFh4SE1ud1A0NkVaNzQ2bG5KNm5ic0ZvUWovd1g1?=
 =?utf-8?B?NE14dEl5TlVScGM3cHNDdThEaFVJUkNiSURPcWdVSmIyVHJqdEFBUi9od2Q3?=
 =?utf-8?B?aDdQTEY2MElTQjgxMDJIL3ZNRStyeXVreTlKSmVoNGNkSWU5bFhjMWUrZ3o3?=
 =?utf-8?B?aWRnd2N6Um9xV25veXVaVzBUZWsxQStuUDJlR1V0eWpsQjZTSHUwdVJpYnF6?=
 =?utf-8?B?K3J3S1NXQkEzWncxWDI5d2JBK0VvWlVNQnhUcmFXUTZaRVZ1UVJTTWNWMm9t?=
 =?utf-8?B?SjBOa1EvMitSSjJTblJCVm5NamNWSTFRbktDbWNqQk42SWlpNDVqUTBRNEpq?=
 =?utf-8?B?cmhGVjRoM1kza2dCQUF6aEJzN1prb0VURUdWWnBkYXVyYzA5cEdjUmhPVWR2?=
 =?utf-8?B?bXZ2aUM5eXN4dkZmdGpDSkZpOC94U1EyZDk5QzhvM2xTZUQ5TTV5UFZzTUE2?=
 =?utf-8?B?UTlsblVqNWF0R2RqVHNnZWk5N0lsN1JlSlpCWFJFc3pPM01HWENVb0czMFZ2?=
 =?utf-8?B?RWNuZ0l0NHdReGRkSHNmK3BDQXRNcFFScVhFZGFxdVpZS3NyQXVFVGREL2R0?=
 =?utf-8?B?R3RBMTZVZm9HbWEvQlVsMEcrYWd0MnpkREFVTWpDZG9BUTh2bmV2L0hSR2sx?=
 =?utf-8?B?STVpajBxYW55VFYyWTNaRS9MeDZJc1FOUzJNdTY2aEYyY2tlT1lmeVZGcmQv?=
 =?utf-8?B?MVFYeDdselFMYTRWWjRxRm03SnRYQmYyeUZEZDEvRGJPSlFDY2xDTWNKQi9w?=
 =?utf-8?B?Mm1TZ0ZMajdGeGxZWXBSU1kyY1gwNUp2TDJzY3V1cDJkSXYwcERrdHUwSWpR?=
 =?utf-8?B?bUx3WW1nVHJoZ0JKemNPMCtVcHRiTklXcjdmRVdTbUpuZG9LMm5rTkxNWmg4?=
 =?utf-8?B?TFdqWEsvVk02OVBXKzBkRld2SS81aGZPZ3pDMW4xMWhtZW5vMGNiSm1CWXlJ?=
 =?utf-8?B?OVcrWXdmVzZHcnFqSEhQYkdQaERaR0toV3M3SEY5ZXhuNE1lQXRPTVNicTZG?=
 =?utf-8?B?YjNxa0Z0dlZ6djVVUTFCZGxyVE1PMThRSWUvdkJIbVAvNnF3eklpNTI3aDh2?=
 =?utf-8?B?YUxMa0JZN1V3YjhRbkJPMmZzSFJLNWFoVXRtWEhEWCtvbDdNRXBibDVmMkt2?=
 =?utf-8?B?ZnR4d3laMTlhZ3krb0o2b2QzZzNsWDMzM1FyTE5ZSVg0cjVKcmhIdUxUZ2l3?=
 =?utf-8?B?ajZYbktQbGRnZHpXUEZvRVhTVElwMW1ySEl6ZkFpRWNhVURkc0ZPYThTUnZx?=
 =?utf-8?B?UUV3Z0M4eXlJWDNaNE8wMnJxNzQ0U241RTVtNmg1dkIxUDFTejB3NDNGNkdJ?=
 =?utf-8?B?YXBGczlaM0xSRDFQOHdmSDFNbmE4bFQyZkpleU90Tk1MUU5ZeGpiTEIxend3?=
 =?utf-8?B?VGJSSHhHbHlKcEREOU1hVldrbmNpNFYvVVFYa0pKd1ljbHVkTjRIUHRYM2I2?=
 =?utf-8?B?czMwTDlNdFczRDZaZlZvbm9JWld0NmRhaUV5TG5MRmcxUWs5ZmVwMEJEalhr?=
 =?utf-8?B?ZlZSaS9TWTJ0c3k1dTRYQ3BHWTdHWVZDbDVIcmQ0S3NjQ0RQN2hmSGRISXM0?=
 =?utf-8?B?ejdtWlROVEtLamdWV2ovR3FWWXdPRjFlaUpOemZhTGxvdzZWS1diZHNzSnhk?=
 =?utf-8?B?dHVKNS9zVGJSSjk3eis1SjNGeDkwanN4amRKb1VQSHVoaHh2UDBoaWY5Q3Vi?=
 =?utf-8?B?OXYwSlk0OWNpRk1TMXV0R0VCOGtobGVOUmNmQktDY2NaanRqd240cXhZSGUr?=
 =?utf-8?B?WjBnUGZEZ2Y2STJiZnU1bi9FZTV2ZW5wZ0J4elYyajF4V1JlVzhiN0QyZDNM?=
 =?utf-8?B?S3d3azJTeW1GWDl6UU1JOHovenVMOExSd2dKVnVDdEQrb25tbUNtR0d6clVD?=
 =?utf-8?B?UjZDMW9Ycmswa2lIbk1MeTl2OWhaQ2h5N205blp1VGtVMHdQQWpYNGlERW5E?=
 =?utf-8?Q?eObBq7UNTnb+R6Iw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50e7283f-69fe-45fe-1525-08df4d4cdd1e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2026 12:41:03.4486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: guftIOJrrMId/vtCtIL2M3DDn3cQUdnfDDXQotcDFJbnS7i9uxl+maT86CCeSfiSbzPLixQ46Ix1q7f3L485aOKFUg9b97KSB0rrxhQcRB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5728
X-purgate-ID: tlsNG-bad1c0/1795869668-3BCD7034-9A28B369/0/0
X-purgate-type: clean
X-purgate-size: 879
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27/11/2026 12:55 pm, Julian Vetter wrote:
> The tests test-mem-claim, test-paging-mempool and test-resource create
> ARM domains with xen_arch_domainconfig set to zero, i.e., gic_version
> XEN_DOMCTL_CONFIG_GIC_NATIVE, which has been removed. Thus, domain
> creation fails.
>
> So, pick the GIC version from the XEN_SYSCTL_PHYSCAP_ARM_GIC_V2/V3
> capability bits reported by XEN_SYSCTL_physinfo instead. Use GICv3 if
> available, else GICv2, else fail the test.

Fixes: 6c6bec2c804c ("xen/arm: remove XEN_DOMCTL_CONFIG_GIC_NATIVE from
the ABI")
Fixes: 93e976a1d174 ("tools/arm: choose GIC version explicitly instead
of relying on GIC_NATIVE")

If we had actually been running these tests in CI properly, this
wouldn't have slipped through.

> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

