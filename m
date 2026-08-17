Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03393C5B572
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 11:24:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392835.1631806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvvSH-0006OP-SD; Mon, 17 Aug 2026 11:24:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392835.1631806; Mon, 17 Aug 2026 11:24:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvvSH-0006Nf-Ot; Mon, 17 Aug 2026 11:24:37 +0000
Received: by outflank-mailman (input) for mailman id 1392835;
 Mon, 17 Aug 2026 11:24:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wvvSH-0006NA-1L
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 11:24:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvvSG-002h43-ES
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 13:24:36 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a82ef6a-bab6-0a2a0a5309dd-0a2a450bac24-12
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 13:24:36 +0200
Received: from [52.101.57.54]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a82ef73-b7e8-0a2a450b0019-34653936cb61-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 13:24:36 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB6496.namprd03.prod.outlook.com (2603:10b6:510:a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 11:24:33 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 11:24:33 +0000
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
 b=NMhXTt8R/eCEQr9eZVne47mX7jpiozH8Ph0d5iiJOv0x6uKMUEndQS6C6GRGoILmrIm6SM1vdZbXMbdT9TMhnNHDLzZ//dhYbj7m6J5Pyjw0+znvBYqXwVm3KxY8+7AbdludjRQpFhS1EthvNGUAMme0okt4Ram731lwvopM488qdGEPxfvJM1jC0m+GdL2pHk+PvY7MfvFXnGmx3vFOApWpLP/QigUJxUt/UYwcJ94Gx9hY2fZZYAPUiDVI2fYDmU7FpzScGyp+abJZZrmPhqhgL2TyqL5lPJw5PSTlWHLA2bdLS1TRJ5snUzjOcfTrnmnRDXH+/ZSZwv5w7B9yiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J/4wWT0j6wo1VIZ76/D6EgFLGuEOmmP3To6IzYW/E14=;
 b=XKmUyZy+3Sw7tMP/3lDr2uRPC6bGG48qNn1O35DlaeG1MEBXcc5UW6cVsUpTuiDWo7Hr4yKRmqTPtmcwfgvN5MQ8bLWJqEYECiQBX6I4Fs3h8qxTx5+YnIP3HDwHBvkvHRs+6yUkPDKDo9xY5C0yG1hZkBW4qbyIgeEEWrrIpFVKRO9Rclpob0qL1cl1nVBaMPOWi6Ogsa1nZz3LquFAeU8WRPyHIMnBrzz5jMRZ9n+B9PotXUjNtxpxfSbyj7J4XEVCbgr5dkmRM09Qp3PnsLL6/R4aPFXkA1Di9W/EZu/AoLwCrnT3XQ9WmftnO+lAHXQgHpObkFnUVGYLgw4eoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/4wWT0j6wo1VIZ76/D6EgFLGuEOmmP3To6IzYW/E14=;
 b=0aPDO/LkGmjnBJcGkFWMj9NwDVVTZTWS9be5YWOEOREds12h9LaLeNtvbRlxts2/juIJYOdkSqQT5UR3snADeuA0xqJb32RZyBOIn/WeUXKGHlVD/UiYsPBRDkLaM3KnmtFFwgRAZjR8/5SeBgYm3oc7FEek/E2xkzCDpQ+LfpY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <76224e3f-791c-40ea-a5c1-ba3bd7fa6572@citrix.com>
Date: Mon, 17 Aug 2026 12:24:30 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/3] x86/emul: Drop trailing r from x86_seg_[lgi]dt names
To: Jan Beulich <jbeulich@suse.com>
References: <20260814185841.1757421-1-andrew.cooper3@citrix.com>
 <20260814185841.1757421-3-andrew.cooper3@citrix.com>
 <2f65ee41-7a7d-4d86-9cdd-82ac4ccedb08@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2f65ee41-7a7d-4d86-9cdd-82ac4ccedb08@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0035.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB6496:EE_
X-MS-Office365-Filtering-Correlation-Id: b539194f-79c8-4b6b-f4c4-08defc521cfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|4143699003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/YfBA4/M0zR8IwR94TLc8mO7NHZrVu08b7oGpfy3O/dLtgCa2SrfY+t8wlVup5GewkLaROdARVyOYYkSaaXQ55PfRZtTMy7Z9cTwBP6vwf0QLm158YOvrW+/cgww2kqfHvp6t/Xjt2RsQHxly5uA4UErrSot2SY+gvb5dFLtBvAv6j/Y/4HSBQoAyUZQgAeW1JbsJ8QOHMCZLXUSXaeVqCZ40hUXZQZ4RmK4C/YI4mpmWOVyLK3B4oBAeSLL1KzgpdrEKgCcp0lfa2CQ1ylWStqPAUS0RpB6R40jHbX91AtbmpaFCQgoOYlI9wJgBiedU9XOjRpS8YQC2qngqAL6JpIF9C5UROobA/37OYaPbf6mvqUodJXthMCv4yzOdcUSTaUHW0nEiUNJH5A5YCg8KpJuiwyztSj3iVgQhYYf/iN7WvaBCffxdiNBgmU0U6gCZpTY8m592Y2zJWdmJixhuXGyXtxPMIhQ9AKG/XXMVhKt4HNnpkg69MlhbtLmP2kjFQJppOpMzutVk1crBcABa50WD8n1P/DRY9jvDOt/NZIGZ6a4gyUD1TLlFZfRjgADjmq2+RIgnMXRsZIR8cAq1+YULsFl/8J3RlOQA32iJqcUneaa9ypoWQc8jVNzBfJOjeZaXmE/cJKQ+dpf0KXUYFFoK3hpTvWm+u6ordIsFlY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(4143699003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djVKUUVSTFVpNEUyenN1TEdkNDVCeWpTME9FbTN0em0xUXMwWldXMnpaN2pR?=
 =?utf-8?B?bzJTM2U3c0pFR1VXMEJwZVVZQWN4K2JUVFJNTXNDZnp3OElHRWdlaUEwSVpv?=
 =?utf-8?B?Z01MamxGMzNwNjA3aWtKdDkrdllDYnRRVmIzb05NSitReDFDV2xIMlBZT3p3?=
 =?utf-8?B?emo1ZEdCRGRNVGRrV3RmRkFPT2pnWFF6a0tjTlBKVk9PYVZQS1RVZEdrK1hZ?=
 =?utf-8?B?WWRFTFlSWUU3ZExMU2U5SXF5Q3NWdFFSUWJEbTJSaUM0bXpEZ01yWk02WCt6?=
 =?utf-8?B?dVdhcERFZ1ZEV0VWZjJaTFdTc29sdDZQRjhCNVgxMVBVeUsrUkt4T2k4elBj?=
 =?utf-8?B?ZDI5MkVCWXZ2Ykl3NytZcFFzZGE0aFpOV05UNkRySFBCZVJpTXlXM2oyR1RF?=
 =?utf-8?B?RTcrUVU4eHNkazZvYVBnaGFHb0tqbGI2dSs5S0FzbkwyM1hYMWtVbjJNdkE0?=
 =?utf-8?B?bXNncEVCRmU5S0x1R0xkWklMVkswMUFqUENVaVZKSXBublNvWXlZeE5BOUJ0?=
 =?utf-8?B?azRGY1UxL2NXNUJGL1VOVThnQ1FNOFRZSTBYampHVjYzYk9aSExsb3lXY2Qx?=
 =?utf-8?B?T2xsOHk1NGRDSnZZTGVXYm9GaXNMQU1ZcG85VHdLeTZvbmh4b0NLakZ5S0VI?=
 =?utf-8?B?OHRPR2l3Rlc0WUovUUFic2ZpZzgyZFpJbWZjWkV6TFIvSHlLV3dhR3l1M2t0?=
 =?utf-8?B?aGhMRjg5M3phSURRblFuWUtOMWRqeS9jUzgxdXIwdTkxSnAveGZlTWt0QXFT?=
 =?utf-8?B?UWFxK2RCT1lOS2NLUXpWb2hvZzlxcEJkZERtaytCMzFzK3NKUytFU2RLM004?=
 =?utf-8?B?c0VJeU1uLzFwc0MzM00vbjdJb0loZXNZU0ROTlFaVm1TZ2ZUYzY3SklCZWVh?=
 =?utf-8?B?N0ptME5oaTZOWER6b01PaGNQS1JFNDRieklZM0ZRK3IwZEw3NUM2VDdxTUNu?=
 =?utf-8?B?OXk1Y0w5aE5JYTlCeEdZdE5Tb1pMeUJ3d2grTHBvRkthSkxxbmJDTnNGTk1k?=
 =?utf-8?B?UUsvTmpOemc2cjR4UGdwR0taNGw0NzJVYnVDbnhTQlVKVTBkRlNtYUxBSHR3?=
 =?utf-8?B?N2dFbk5pMUhuN2c0S2JpcTJnWGltdUJXL2w3YzU1RzZNSW5wQ1NLSnBzRzNJ?=
 =?utf-8?B?aElXZFIwNnlpNGpBZFRNOFRhbkc3RHZQU2oyUDBSd2gyR2hSSkRyQ1hrUDFx?=
 =?utf-8?B?Vndla1V0bmE4WnlReW1aSWJuSUZsMXR3aUFhM1QwU25lYzE1Y2pCYVRMMFBT?=
 =?utf-8?B?K2R3aHp4ZERaSCt3OFp4bUh6aHZxcFdRYWphazZlSXNQUGNEODhGTDJraVVl?=
 =?utf-8?B?c0RtWnVSSlB3SlJEY2hXVFlBOGRJSmd1b3dHQ05WTHU2RTdUdG95R1R3Tmx1?=
 =?utf-8?B?L3dzTG5Bc0tUdVNEMGxQNGxuMG5LTnFMdUFUMDdYWTVCWGcrNmx6QXBxdURY?=
 =?utf-8?B?QXhRWE91SHBpRXNOUHVMZHR2U2lzYmUrWFNPTzBwekkxQXY0NWNmR1JWSDdJ?=
 =?utf-8?B?dUJRUkM5M2NNUU5JV2FPZWtLNnhVb0ZXM0kzTHVMamJXWkxWTHJaMFd1cmxU?=
 =?utf-8?B?TUd0NS83YlpGaVBmSGR1blUzM2J6d1hzZEcvY3hhUElHaVBVRTU2eWtkYnc0?=
 =?utf-8?B?dUZ3SFBHRmtXSTNkRkN3YlhHOFdYV3ZOVFU4VEtjWXMvclZMaHNLdVk5eFJX?=
 =?utf-8?B?akNKLzVKSzJYRFdYMEwyaitmUDE0a3cyN2dtNmJ0U3NyaXNPZnVjRXBKR1Mv?=
 =?utf-8?B?TjFHSmNpeTVjOUkrM0RPNTR4VzBlQ2Y4NDNwVjU5b1ZKNmhybzVEYzN4eVQ4?=
 =?utf-8?B?ZHNxRXdPdVhHaGQzTTBPT3ZyZ05LYThwU2pLUDgrQTIyTmNwY2pRbkh2NVdz?=
 =?utf-8?B?dmFXVytwcytQMjcyc1BGWHRaWms0VG9sUmF0OEdJSTZZcmFjR1d1ZHB6Y2N2?=
 =?utf-8?B?QWV2R1RtYWZKc0VwZ1pRYURyWlZsOU9IM0h1UWc4NUZic0xMeXQ5d2ZJRDh6?=
 =?utf-8?B?QWRxZVppM0xva2FkRjh2enREREJzY0VoQlFsV0hSMnRDNE9BL3JSenpNWGZ4?=
 =?utf-8?B?RjhMc240TWFhcDlLcDJEN3NIYWNoaEZlTHEwVmlyeUVyYmNjSkQrQzlxN09l?=
 =?utf-8?B?QW8rWlZZT0JiakRVb2lPTXVHTVZFaVZKdUJQOWVlYXdOSWtBaWRDNUFINWMy?=
 =?utf-8?B?ZW5CNnZ0Sm5pakszdGdxTWZ6MnIzUkZGdGhiZkZPMVg3OGEvZWExWjYwZDho?=
 =?utf-8?B?RCtnQitRMHN1MVZ4d3JKODUzWHR3V1RaaFUvM2UrakFRKzhuRm9kYmlPMkZQ?=
 =?utf-8?B?bDc5eE0rOS9SVXN2ZlUrT1lkMnZNa21GNDgxcDdwREl6YnNBNklnUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b539194f-79c8-4b6b-f4c4-08defc521cfc
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 11:24:33.7768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rukl+wDHSwhCnoWNHqVaxoQCyU14TF0MrTWD5VE1Jk68eJ53YZ7mWDl9piuEHlZfySqAO9+qSD12pdCZHQxjucWvqpt01212V1ZOCcPsOGc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6496
X-purgate-ID: tlsNG-42698a/1786965876-A98C19EA-A28C32AD/0/0
X-purgate-type: clean
X-purgate-size: 365

On 17/08/2026 7:15 am, Jan Beulich wrote:
> On 14.08.2026 20:58, Andrew Cooper wrote:
>> These refer to the segment, not to the segment registers.  TR is the
>> odd-one-out having "register" in it's name.
> The more consistent naming would then appear to be x86_seg_tss?

I was debating doing this, and you're now the second person to suggest it.

~Andrew

