Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612F7C79F89
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 09:50:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410758.1641557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3Vzz-0000q3-Gt; Mon, 07 Sep 2026 09:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410758.1641557; Mon, 07 Sep 2026 09:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3Vzz-0000pw-Da; Mon, 07 Sep 2026 09:50:47 +0000
Received: by outflank-mailman (input) for mailman id 1410758;
 Mon, 07 Sep 2026 09:50:45 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x3Vzw-0000po-Vw
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 09:50:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3Vzw-0095Pf-9W
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 11:50:44 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a9e88ed-e002-0a2a0a5209dd-0a2a4501c3ee-30
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 11:50:44 +0200
Received: from [52.101.53.5]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a9e88f2-5984-0a2a45010019-346535052d8e-4
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 11:50:43 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 09:50:40 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 09:50:40 +0000
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
 b=f5iJZyJg7r1gKBfkIKKrBCk8xVsTEf3nKiJu/uFaTMRP32XK16ATRa3ytIU1ds4aYecefFcTCPNyq9AD8HYAa2bSzkP5ocryRdFoqX7nHa4Z5c+v1S40XqeGbiiq9BMeZdOKIZe3zLcRzCfsKhQvmXAmPd+0lcVIlUaFvNd0or4gn/7u5agYv74mUmgQ29Uc/rcALo3EWsWfSeaZbJPMK6k7HB10zVBXmf1ZvZGm1CNXSwZ9/H4kTdxRgJioLrBMiTN/tsec/Ss+n4mY5tigK1PiVdafuGSfeJ5E6UWsH8xOZyR0VX2O6Vjnd1nNxApea2PbOSOiXqCi5ECKtlEOtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EsNg8QlryyCY/8GraPHkjLroq59cBwkONyyVBPoVZu4=;
 b=hX5uG3WRVwripw7Fe8wGvf9Wot8/Kfv5kn+Rqc6sl8Qu+6I3YxnTIhbwPovBcZsOYJ3wWoodmA8U6TLIfGs/VW+lHRhkXxhcBaM9J4ABhNQ9TnpcDkOkBtiYBFhHUqHSMPQVRVUeR048smx/CODZ4QDBskrZlSt2PQv55KzEnYxoiWhqbYP9xUoYkMEtUfbkN46PLDyHKKdkLXw6NmtFsEv9YbtQbDmm8d0Z0FWcK829n9uTrTdEn7ppf7w2zgJwhVCWKx5/ltZPpmHbKYYYJ5ixEPjFA5fbhAwQRtOcN3Oo6ImW5I3S50GHwRLVif8LV8oo8zHbXgSEew6JySKQQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EsNg8QlryyCY/8GraPHkjLroq59cBwkONyyVBPoVZu4=;
 b=xzYEFHW+dw0kistHEHvIr6DndHWWSBJtqBbkZleMu0RG6EYcsu/aMiD2M5E3ZKV2iVZw5nsv4/cl7bq3ma9ucXxplYHVgDo/wcGgpvPQON3clL2LcC1KhTuAF7kzUc7YeTutwUnROlql2DUSJnceqGrvh6zHBq3tr2rFiWmOTjQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1f1d9746-4eab-43bc-a638-99d9b0e0531a@citrix.com>
Date: Mon, 7 Sep 2026 10:50:36 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH] libacpi: drop mk_dsdt's -d / --debug option
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <13ebb85c-62c2-477b-87ff-377bbe3cfc6a@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <13ebb85c-62c2-477b-87ff-377bbe3cfc6a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO0P123CA0007.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a724d41-7ad4-4ab8-d265-08df0cc579aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|6133799003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	rE9AWaU78P2bp8Eu5osqSrEnVGx9WRM/nJopNtJhFFhridpMiwQAZA/Zv11GCuD1UYElQq6QrfgqUI2fLaOI6fTEZRPES04xZcqK//rgiIcUhfeNOhdxf3kmQp7QmB+Bfvc4k0hDIFY7CgfiZkZPgjLFPEa6R+QenvvDnNlstuzJ3E0h0BWfEnHRED3HK5ZuRFeP7rpQJCgPV1xAdmona3jiegvU5FQZ/ZHmgI9YXAkXC6rhAj9V8oMPkcjB/M4bAZDVMThnR1rqybjCkrk+2NaCwoCKDUru6A5rwLDtlZceDpFsWVrIuPmGm7+SdySnK6W6ZJQdDvVD0NkRmuw/sea1I4ZzydJ5oeR3QqWggOMJ0hbGPqaz3UKS/8F3WWcobGZx07QWfR/k3FR/4WGgkMMM5dZtl3RpxkdoaC2F8Y0iqre01pAIjxim68w2YNlCG9eBDMy6EqUjjAHJ626quAUb15MdGpD7Nt6BiP9zlW57/RRUxqG46TSv/dGWNgotadMSUVBXaAiX1nSAkEkPNLrpVtfcqk8WOZQtsS//Rk+69Rm26biu7I0if6ZMJRXWXwVKoBAklS+JBGSdJxS+cxiffEJT9LEH0cQDDN75pXusbw3ItWMy39AapGPbAbxu1+XPicf/9F8PI6V498UAijwrebgkd3qIAEMGVCYqRdc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnVla3ZuWk5MUE45dUN1WFJ0N1BudDJBZklWN3BhTVY2RDh5VXpMWHhQUmRn?=
 =?utf-8?B?V3pJUFZVOUpTSDdDemFRUHFxTDcwWnBuU1dRMjZHTWxsUUlsT2gvcXRYMlN0?=
 =?utf-8?B?aEJQZGh5ODE5akRtd0VtWWlYUnZiLzArVzl3WkNYYjBTQXVxb09iNGx0cW9D?=
 =?utf-8?B?anQrNXEzMGtoM0xVQ29PYnVTTHhzbVVXS1ZoY3pGcVlOS3F3Um1WYVIwdVNJ?=
 =?utf-8?B?M1VDcVBKTHV5OGg4MHI5Z2U4OVdpWGc3ZTZOMkhVdGU1YTRzSm13MHlMbnhY?=
 =?utf-8?B?NG43amFROXpNVFdHSStlZlpQd0t3VnNUcUhnYVNLa3NTNzFDY1BkMmJhNisy?=
 =?utf-8?B?Q01KOHVWN0ltRFZsOWdnVHhHNVpSYWhlS0wwaUpwWHUrZThTWVg3dnpUYzlr?=
 =?utf-8?B?RmtJRUJHNXE1dzVSR1dESjR2aXd3RkVTT01LY08rSS9aNXFIekx5dFNGTnFr?=
 =?utf-8?B?UXh6QzdJUGNGU2p2SlJEQWdmajk3QlhHV1NRMitQVUtlNUZzNk10a25DWk82?=
 =?utf-8?B?MGhYV2VzV0NKV00yOVk5ZXRGbzI0WHFWajdrY0kvQmlQTVlTS1ozd3dtZmpq?=
 =?utf-8?B?b2I2emNia21ERTdWcFlLcDFGWis3V0pnTHlvbk00dWgwNis4NkJ2Rm9oczBR?=
 =?utf-8?B?bkhOaVJabmQrbVJOSWNTMW41dUtjZmtMSGxCcDdlOFQzM0FIYWl6ODVrUHdn?=
 =?utf-8?B?YjRtRDl2eVFvU2oyVWRXL25YTzA4U3BuRFQ1Tlp1OGFTUkFXcjZKYy9qS2RK?=
 =?utf-8?B?czlIWU52clBLQ3NrMFRQVy9KYTQrQ0FXK3RqbmJRa3Z6bm1JaG5tYUVmM3JB?=
 =?utf-8?B?OGZERXVZd1QyMVl1Z0RoV01TaDlraGZMQTc2ZUNUdm1hR3VxS2ZobWt4OFIx?=
 =?utf-8?B?eDhFQTJyQklOclZzNDVGaEVNT0FsZnFPOExGQVlnRmZvdGthTFJkUzJVMm16?=
 =?utf-8?B?MGZ0NUpzbVpWaHkydnh1eXlXYmhnOTlzMDlyYzQ5cGp4ZEhmZFlLWkNoV0sv?=
 =?utf-8?B?dnZZOVlOb3lqS3pNRklMMWloYWxxRGRoWWRTUGhTYzVuK1RlaU9vS1p4M3A5?=
 =?utf-8?B?akk5K0JueVl4MGw2TW9VbFM4RzZ6TEpLazBGdktCeFdiZkhnSk0wMDdJV01H?=
 =?utf-8?B?WjdZT1JqYmQ0QlpGbUxaTDk1emVqVk0zdFI5VnlCclltSzJBbzd2SHFSME0r?=
 =?utf-8?B?R3FIbUxnbVptZFVQcFJpa0RxQldUclRmTE9LSGJyaVNTaUhpVWVyc3lxZm11?=
 =?utf-8?B?TE9kVWM2dHlmZXV1SThweld0VGVmb3V6aFM0U3lrdnNQV2xpbzJaL016MTc0?=
 =?utf-8?B?Ylh3dlIvbTVTVWR5Q1RBYzl1NmRTRHdqcXFwQXdIeWZTbXoreGJXTTBLUEhD?=
 =?utf-8?B?d2d4UXVpaFJWcFhjMHVVTnM0dDBlNnlja1hpMFlRcXZvTTgyMGRkUTdYcXM4?=
 =?utf-8?B?Njd0bElrcSs4T3E0RzZqd1Fkd0M3S3k3amdSU3ZsSTQyV1lLZGNVYzZ6S2or?=
 =?utf-8?B?Ui8rYkhDZWdDVGZKSUM2ZWlPdUprWW1EdTZiYWhEeGZlZThTOEI3a3Vxa0Fq?=
 =?utf-8?B?bG1kR3hKNUgrRkt6cFJZOGwyZTRhL2VCVTJFSkZTazZmYWxycUlDQ01QUWZF?=
 =?utf-8?B?VXlvc0UyZVZHMWFxYUU5K1RBS3NldGhhOW4xcExqSHJQcUlmZGJjdEtpd3ZJ?=
 =?utf-8?B?MzhKVU40aGN3bzJaYTEzNmMxeHNZam01MXpCQllrYWZPdHl2Z1oxZGk2WmJD?=
 =?utf-8?B?b2VoYmExejNTWlBvTXF1OFNoT203R0VWVmVrb0Y4ejJ6RGVacGp0QUtGbUFI?=
 =?utf-8?B?VkxZUHpGb2psWE0zVHloUjNHL3RRQURGSlhoVTdRTlB3UnJwMGhzMFNkams1?=
 =?utf-8?B?anh4YjNYVExnTUVoeHgwMDN0MGZwMDFYL0ZKM0lENmFwMkJiYTdZT1E2TTZo?=
 =?utf-8?B?SW1sR2tTSGpGMnpGUFBCNEMranJTeGdXd0szRjFQRUszVHBiQndPd0w0dUxV?=
 =?utf-8?B?dVA5UkNVQjI5amQ2MlRTRFZJeHlMRnRGNDgwZEdCWkN1Q3F4YmdHR2xQTnAw?=
 =?utf-8?B?Q2kxb2tWc3czeUU5R2lJMjNaZWZYZ3ZNKytGVDRaR281Q1dZYklpMWxSUHJE?=
 =?utf-8?B?aXFoV3owaGFEb0orU2orQXlPMmgzb0hqZXpBUDlhKytUY2dQN0s3Ylh1Nzg1?=
 =?utf-8?B?U2ZYZWs5aDI1RGlDSEVkc2JmMFk0ZjNBcVI2TFpSbFVrYWFoSWxTbkZ6TkF1?=
 =?utf-8?B?eUtLdno1MHhMYndadmlta3I0Qm9BMVRKbk9OaHRrd0JtOHFaK05jTEpGekhC?=
 =?utf-8?B?eFdZRmt2S3dTd0RKNCtZMEFDMlNPb0dHRDJHOTlucU1wZXorYnFjZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a724d41-7ad4-4ab8-d265-08df0cc579aa
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 09:50:40.0104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NhKhghMb9DGXmrl4nqnHUft3x4NqCD2scxTzR+s315c3gdTw5TjqBP1k6gMdxf2cmHWte93tSnWeDPM5Dt+gXnzgihXzASehJk/BZ8Y6aP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5888
X-purgate-ID: tlsNG-d62444/1788774644-1D87F757-223C5636/0/0
X-purgate-type: clean
X-purgate-size: 386

On 07/09/2026 10:48 am, Jan Beulich wrote:
> Recent Clang complains about the "debug" static variable only ever being
> written to. Drop it and the command line option controlling it.
>
> Fixes: 19ab8356abe4 ("tools: remove support for running a guest with qemu-traditional")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

