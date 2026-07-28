Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB33BC53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 19:37:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375020.1622337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wonbq-0004Fv-3k; Tue, 28 Jul 2026 19:37:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375020.1622337; Tue, 28 Jul 2026 19:37:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wonbq-0004Fo-0T; Tue, 28 Jul 2026 19:37:02 +0000
Received: by outflank-mailman (input) for mailman id 1375020;
 Tue, 28 Jul 2026 19:36:59 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wonbn-0004Fg-OB
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 19:36:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wonbm-00837G-KY
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 21:36:58 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a69049f-bab6-0a2a0a5309dd-0a2a450884ac-44
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 21:36:53 +0200
Received: from [52.101.62.28]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a6904d4-f659-0a2a45080019-34653e1cc233-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 21:36:53 +0200
Received: from CH8PR03MB8276.namprd03.prod.outlook.com (2603:10b6:610:2c1::14)
 by CH8PR03MB8273.namprd03.prod.outlook.com (2603:10b6:610:2bc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 28 Jul
 2026 19:36:50 +0000
Received: from CH8PR03MB8276.namprd03.prod.outlook.com
 ([fe80::8420:cc3e:23e9:7a0e]) by CH8PR03MB8276.namprd03.prod.outlook.com
 ([fe80::8420:cc3e:23e9:7a0e%3]) with mapi id 15.21.0245.009; Tue, 28 Jul 2026
 19:36:50 +0000
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
 b=gWht8NxNPLEQ0hiqItkkiLlrJHzthVk/J9clf/AJjVziMpluvprCR7qu84DaSvAWt9V6+pk7iihJBwVBm7grTDqem0pt1K8e7byMZXTKyZMRTVdxnDXJhbRAADFARjTt89An1mHClaUUls/qnuZTm65/RXJIp9k0Ko9AHgZw7ElJzDvy1w3xqDXzlcInqoostKX7garIA7WKj43wP5dTyqX05nxY4yw1IJWtfscXvMLp4EZbhSDnx075Reejff6z7LPWcZZl7Ow5hu4rdh7tEc9ZSNzwB2eWBXt0+EM9dRjItGza1abAiwR2COrUtueTiNBwKt3bun0q/xm5du8vNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKV7SF0wlLZn4Mq4ps2W6QB3bWrAInnp6/S2c283v38=;
 b=SxjZdyh/gQsmoII4QyNGjgrQSuU6f+YWyIKv3EEDDspxGRT8JeZCBNOnyvnAHhmAE10ILbMvXWT2gw5eJVyAOh1KUmYIxJMEgAW924ODSWjbH1E/T4kOfhJ2CZgj/U6Z1vHIa6NyA2r+AaqQ/7qdTadxhRMp419DBhsI5LJYjEkBgXKjCKaIbPpjldr+seiDMs0QPjwH9LIKLoiO0k1Y3khZHbUC/Rsd16zfz8Ole4WCiqP7M2I6KqZMXWsZBW7qOm8e1kf3iDfYB0ct3uoCmzVpKaaRpDbQ8Pv8l+/8eIJRZ+zEFDwI74upwyETr4TERDU8fNWSdmGSsBk6WYoIzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKV7SF0wlLZn4Mq4ps2W6QB3bWrAInnp6/S2c283v38=;
 b=rCv3AlpXyjoUI0/M+JCXYhsf2g+CYWAqDGmRRPkS3FOs0s16kt3mRVX7o5CgOfMjJg7A4cbAa9bVy72yLY8pF0Xpntyx5EcAj9JPOPkW6QR5CJ2wPA+jIcYo45KF0sYAcTSHL1myCc99rbaZnjQfcIbw+98Qb3ceU8ZTJmMM3Ks=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <750c526e-8861-46b1-a404-b94f13781910@citrix.com>
Date: Tue, 28 Jul 2026 20:36:46 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Andrii Sultanov <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 Julian Vetter <julian.vetter@vates.tech>
Subject: Re: [PATCH for-4.22 0/2] tools/ocaml: Fixes to
 Xenctrl.domain_getinfo{,list}()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260728154830.67734-1-andrew.cooper3@citrix.com>
 <ff751975-3e64-471c-b499-fdb35c3f17c2@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ff751975-3e64-471c-b499-fdb35c3f17c2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0206.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::18) To CH8PR03MB8276.namprd03.prod.outlook.com
 (2603:10b6:610:2c1::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8276:EE_|CH8PR03MB8273:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dadcd01-343a-4033-bf2c-08deecdf9190
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|56012099006|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	wPcX0qQUDOq+t0U0Zt/pzvTGJY5b5uge8jLk/z7eJ/9lehVeXlG8FzofCTfJ1U6SyX7wTGXcMaO8MyjycLGPowJwyv41weOEU/6o6lf6QiWu6zEWA15ZLGc0cAsZ6agJ08Ex90tCAgCZT0z1TB3I6iaeqKHzASMcLe8iFsSjI7gY+klWqioOht2X2S1cC+8ickvj4t12irGMp9hOVLhbJ22J8jauBfjn1JzdGneAJ6ZnSZukenUgs4nhFCMdIAo96zrO0teYX5K1gfkjYZwdNIFFqO4WaBrZP+FM0SW9x73T707zk2Vvt+HXGNPxSLwNqozZAOX1WXH77jNcXSI7YQcCuQYUcvm3qM0WNLVSWR/K2t+bDN4J4dW3+Aw74O5xUe+yz+axWhsKcffubgEfzml97Ajf2MeC7k6VJ0tvCjLTjNNh8wXSWNxODqJCG/xSI8EHS0O+mZkMwnX0kkiBlLAlbHf9ronP949r55AVb/lp0XDF9xTfruFG2zWBZjFaC66yFn6wclnel++1Aj0Q0ucJEZL9d0pvrCWG2/lLsJYsnFOJ8EOP6fINsJNS7X0JaayklJxKThcRc5OLW25jV6tN1hkr7KYCba0OljhE/AHjRN+FsT4ZMKnHoqj/U2kA5lZWBFkXdlQomU09xsFWRCMgXgGUbcSCV2Z64mtwSHA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8276.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVh2UUNpQzVud2laTVZ5TFl6R3RIV3h0eTFlQjdwRWdtQ1FkRlo1aFJVNVF4?=
 =?utf-8?B?d29tRzNSK0toMFpRcW0yemN4VTJFTWJ4WFhBNStNT1JybkEyWnNFVUNTdWJk?=
 =?utf-8?B?WmpkOWxQNjh0NHhHYWFOR0c4QW0zV29UcENJVzhBdCttNnFjdU1vckQ5TmJM?=
 =?utf-8?B?UkIyVGJyRmxEQzd4UFkraDBYRG1hNmhLZG95NnNPOEtmMnhSQ1pFay8xcjlV?=
 =?utf-8?B?OE5iOXBIZU1IWmdtekJ3a3c3SlFCcWtXWXEzN1l2T3R0TzJ2QUc2SXA0S3do?=
 =?utf-8?B?Mmg1a2xEdFlPZGlPUFlmVExlL3VJdDd3Vm95dHZTKzNDQUQ3KzZ5ZlNzSVpI?=
 =?utf-8?B?TlRkQlNTejgySmxPOUpPVG85UGxndHEvZnkzUjNnMVNmQTJJR2p5dTZsKytn?=
 =?utf-8?B?NEduMmRTY053NmFJc3hxbDVXRlJhL1BFUWVpQlE0QUdFa2Z2REh6dEpVcUJK?=
 =?utf-8?B?emcyaXFmckVQODBhejBkL2xtRDI1YmFmbkVWVnFXek1INkQrNWxYOEs0MzhY?=
 =?utf-8?B?VWkrQ09DL2tUSUoyaFJUMU1zRnpnVnExUFhkZWhCcitPcGl1a1VrNVJxMzNq?=
 =?utf-8?B?SjJkYk1NcU1yVU5JcWl5TjVqSmx3dDdKdGNsNFlNY2JZZlAzQjJqYzl3UmpM?=
 =?utf-8?B?cDhFc0Q2YWI0d2pYcWxXejh3bTQ2TGZ3eWc4WHA3UUdjZHFzM3VlOFJYVEJZ?=
 =?utf-8?B?NHVoOGlzL0dMei83ak9wRUFaOVNRNkxPZ1ViekJmd0tkellOdk1pZkJ0NmdT?=
 =?utf-8?B?SWNCRzZyL1czK0RtaXdnUEhxVTdIRFdIYjYzQURBMyt0aUN3SVlzZE9wR0VN?=
 =?utf-8?B?QkJXcGZVL2NOUEFGQTlLODBLS1AzWUhJZnpieXo5UGdEaXBYRi93cjRpbGxh?=
 =?utf-8?B?cXpFTlJsNDJwWXZrS0xHYlpUZWxZYzNpbTlTc3ZWa0M3TTBjdkhrekM5WTR2?=
 =?utf-8?B?MnRyQzlZQzBFYkE2ci95RzdzUlY1Y0IvWCtpZDQ0RmtPejJ0T3dWWG1TYTlX?=
 =?utf-8?B?T1dINm15TVNqNUJoQXNvSkxRZ2lPVDEwVjhxb3Q2MURDNGFnenl0bTZpbC9X?=
 =?utf-8?B?eC9JN2pOcXhZM3ZleEVhcUNRNFhoV0hpNGJGTUlzKzBQdE8rYzA2dG5rZUx2?=
 =?utf-8?B?dkk4MmgwZWVJS2tuWFlZbWJpN2pwcmJqbWpacHVGSjFWY2piN2dydDZnaVJO?=
 =?utf-8?B?UWEyWW85ejJraVBiZzJleDR1b2djSGpQb0VvTThSb090VisvcDExZTVSeHpT?=
 =?utf-8?B?U0RDUWo1YjlUYlhQWnNDeWNlQmxHa3hDbXRqNVpKUk9QMU1CbXJYNDYvSnJP?=
 =?utf-8?B?QWlXOWtodWwwSEdPWmdwRTVySFZ2eWs4czdOV0RqakxmQzliR285NVUvSlZo?=
 =?utf-8?B?T2ZycjFENTRjMnArWXJzajBLQ3hSZU5NK3NpaU52S29IUlEzK093SE9iaWlT?=
 =?utf-8?B?UnM4SXhsT3oxN1RXemZIZldHRUhZUWxSZDRnUVZoTGt4RkZqeG13azlqR0U1?=
 =?utf-8?B?QXdHZkZmUDY0QkthN0gvamNwWkp6cTdaQ1lIMktFTCtrWmhJbDB6Q3hvUWd4?=
 =?utf-8?B?QW9VT1FvbnVoSjJzN3BiWkdUdXpVL1pZcUdxREJuTTFKQVZuKzFsL0xyRkho?=
 =?utf-8?B?V3NJN3VORmRwd1ZsS0ZWZENkVDAvQmEwOUZVb2FndTVVRE0wZ291dmxYbTd5?=
 =?utf-8?B?dXo1QUFxRkVaaXc3Y1A3REpXcGxJTzJTMFZhRjVJZTNwR2k1TFQ3MzJWb2t2?=
 =?utf-8?B?aHJjcTlJKzRTcjFaQTRtSTR4NU0wZGR4MXJmaStja0RSZEJQSFduWWhSeHp4?=
 =?utf-8?B?YWthK3JUeXpEWUt2RkF0YnVoazZyUFFzYmlUWWdEcUlnV2dic0ZQUDR4T3RV?=
 =?utf-8?B?YSs2UHdHOW9VeUlkQU9remI4OWwxMk5nbDBJU3VmNmEwc0pDUS9JbStnNzFJ?=
 =?utf-8?B?YWVFWGJKb0RIWGZhUnN6MkZzdUpLRlhMb2c1UGs5K2JyWHh5WmxBcTFXazcy?=
 =?utf-8?B?cTZseVlxNzAvNGJPYzlBeWhaM2x6TW1IcjZUUXpMbUpRcmZtU1l2RzZmdkZW?=
 =?utf-8?B?T2VUd2EvbENjTUNmaU5YVzY0aXYwclp6ajhjaHlhU095YTU4QWcyaHBoQmpC?=
 =?utf-8?B?bXNONFl2a3Q1Z2tyV09GUTFrNUZ0V0tHU21UM3FxeFlFV0JUdkg2cEVrUUdZ?=
 =?utf-8?B?WC9oS2U4SVl1ZDZqZnBicGhMdG83enkxNzZQbkl0Ym1rT3FMeFFZeFBOcjQ3?=
 =?utf-8?B?cmhNUHRCR0lvNDJKNDFyeFpsRWhENVdjR084VjFhazlpMC8wbWtvSGRUMDVG?=
 =?utf-8?B?dENQZHlhU3ZHWmkxalBiVkFySEc3YWRzd0pTVW5KU2pSTXY5OHJiclg0Wkhx?=
 =?utf-8?Q?xVLSEn5OeCDwCkZA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dadcd01-343a-4033-bf2c-08deecdf9190
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8276.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 19:36:50.0939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oY9BtLHqdxi/+J6oPFHV/9zkWcpZ4v41VX5K5zVDEOetxJU6eubeLE/s7kV+5bCvQcDFBtut7sm1g2m6c5ZOY+UDCTBEJtulpKAUWwJzbqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR03MB8273
X-purgate-ID: tlsNG-c1860d/1785267413-D735D87B-6B6A492B/10/73395122804
X-purgate-type: spam
X-purgate-size: 769

On 28/07/2026 4:50 pm, Oleksii Kurochko wrote:
>
>
> On 7/28/26 5:48 PM, Andrew Cooper wrote:
>> For 4.22(?). This fixes a segfault in the Ocaml runtime on ARM.
>>
>> It's not a regression vs 4.21, but it is deterministic and easy to fix.
>> Technically patch 1 is sufficient to fix the segfault, but producing an
>> unconditional exception is almost as useless.
>
> For both patches:
>
> Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.  I've managed to get some testing in GitlabCI showing the segfault:

  https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/15583141354

and things working properly with this series in place:

  https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/15583735066

~Andrew

