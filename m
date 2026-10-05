Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174B0CA5FCE
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 13:31:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440846.1658341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDin1-0002Z8-IQ; Mon, 05 Oct 2026 13:31:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440846.1658341; Mon, 05 Oct 2026 13:31:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDin1-0002Z1-FQ; Mon, 05 Oct 2026 13:31:35 +0000
Received: by outflank-mailman (input) for mailman id 1440846;
 Mon, 05 Oct 2026 13:31:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xDimz-0002Yt-WA
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 13:31:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDimz-0090xp-AU
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 15:31:33 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ac3a6ad-e002-0a2a0a5209dd-0a2a4502e05c-34
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 15:31:33 +0200
Received: from [40.93.198.50]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ac3a6b3-6ca4-0a2a45020019-285dc6322559-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 15:31:33 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV3PR03MB7503.namprd03.prod.outlook.com (2603:10b6:408:196::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 13:31:29 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 13:31:28 +0000
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
 b=WLuj9PQa4n2xeNVtuSzhIMyMsveZlt9Fh/9ljCfAuzL82cQ4ITU93rH26BATPn5/vdjjfgzhPTVCWezgVAU81EnalwiMxLjVWlXRYrbGsqxcU4jTPYtOXBXYa55IFhLaADCXhzrJnVWBW8ms5E6koB0p2VUbiL/jlJQW8Hw64cSAgO97OGbFEmhGx1sO2MpJvIRFKL/vBPkXDrnAO6t3naMaJt4jJ34wYbRYGf2MnjXnVCXkLj0lxTtjUm+OMXk7g5kHgChXjRrMGsmIxKA1kP85Sxy8u2rXqpZPvb5tkM1lnKm6VMZBchLWb42tPDxgdRwtKWkRV35+hlc1tAzLqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4m7g2htVqhurKMSya+Sem3hwmY/Ah9yJMVIyOGqAHE=;
 b=CN447TX4BtBtEe6xQlQ2B/I6xyZoUgxua1qiTZ5uI9AZLGq38CgQViyHPIMgUEJiEKI9bHAfI+2wErQ8ST9loW2zU+kkmKieZhwKL4tMVfcArg7aSGZ198JAqJurPeeDFjKr1JjAyyBmbcOMj4U4V//T1jIH50aPF+JwtmktpjqEOMkOLnjRE4ePWF0FwNhYtCVAqMNaYy3uJoiMcijOrXZksqVKrWwFhD4ra8g4JgkLCyRk0rkmSY7BF8U3pco3g/fSqO9NPJs0GaLQtS2+FHJGJnVEBnz9ROuz34+ylssAsyOL3X/XFk49E4pVVz9+RtYmYi0K1q8GVTMg/2unAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4m7g2htVqhurKMSya+Sem3hwmY/Ah9yJMVIyOGqAHE=;
 b=oKA4qN9QFv1hdYuTryczlwvLzFxDB63spMEyaKamqSw5YXakZkSyCquA9I8LyB0hb992J1F8CmUH2VTQUVJcXDELeX61LvwtR1T0E9ac0F2nd61Lv0eZYHdKV0L0N8VRCllAxl6CEQ8Zuqk6B71C9USvqnh8GAhHl8/4LBSC09o=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <73781201-dea9-4008-8568-06a7d5ac3f20@citrix.com>
Date: Mon, 5 Oct 2026 14:31:25 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH 06/12] kexec: machine_reboot_kexec() doesn't return
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
 <26fe76ce-db8f-4641-aeea-667fb6ee3932@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <26fe76ce-db8f-4641-aeea-667fb6ee3932@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0466.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::21) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV3PR03MB7503:EE_
X-MS-Office365-Filtering-Correlation-Id: 1852a8b9-00e2-4c2e-c256-08df22e4f61f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jb0kuX9xV7XxYCXpIuxOsLuitBQq94d1eDLZpSfR+WIYyFQ3hAHwUaq1M9kzoa9rSHQtn2F7YNx3vdaClfAXgVJ3iBnTxDn3+/jMSvPz0C92svLdVP8JR5Nt8VUaWL3zeDwzFgiz1Oh/1Vcz50Dy0o3OljF18MhiK86ym+QlSfiunte/4XXzCrHNegeBZCx7QPrJeeJsMOPj+dGtsONQ7g/z0MX/HptmX63923Z0KDDtER1uX8OTd4gCSI8KbE+3f0YQeMZQYFz6i4JwWf1dlEZSISsXlpWQYnJka4VlBI4PCLwa6UyiyZLvwRusE4Y0VsWxo6QqXxwJYuu/kLLWT0GdaaM8OJ7vtVWzidJFdq4+vmtdtA/1nLPZbV1aCkinsDteKohN3Y6Kl4cvZ+tS20Qlg2tGo+ZgohDBXgD4Wn9g9qh3Rii9jg9t3uubqV+0XYy8qmP3pz0aO/FWWiW1T0L9txXPvY9FBdvODqDiJ4MJvmeraSu8XZiArI9YXifstTULWbak06vFHZS6G4x8ybZjQ9cyStYlynaEhA3rQ01w8L5456jnBPNMPw7bPTZoA/hd96NG4hl1PyN38+CitHwwmUV3w9Xb+UXYK17EIb9oBdOhcyFXzk1/m/WUukepthrpXrN+4Zjb7Q7SuokAVn4y5Z8qaCFgqsHcg6rEUh4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnBXWkVTakdxdUNYRGhsbk13bG5HNFhvZ1VJU0l0MTI3NW9pNFNZRkJSRWJ4?=
 =?utf-8?B?azZlaU9pNmFXYVI4dGExOVMwQXFab3pwZFIrdHVZaHdBRzNZb2JqMWhURlFr?=
 =?utf-8?B?VzVVNGkyS1B1WkF6T0dmRVo2R1lHeVlrT0dVMDUxQVNZZSs0ckJDUmZDTS8v?=
 =?utf-8?B?WTY3TmlBSW9NWFlha3ZHUW1DOWF4VVBrR2J2bG5oY1ZYUEhKRUExNG56MENG?=
 =?utf-8?B?MTZma1hKRHpGdFFuWU1VdlN2K21ia3gvZFN4S053Zi96VmR2ZldSNzRjUGZi?=
 =?utf-8?B?K0hCRWp1MUw0NlQ3cER4L2JLQyswZ0FhRVJ4aDZNcUhsWHFKbnQvRTZGQnI0?=
 =?utf-8?B?UE1ic0cyWERlMXZKQld5UVRtRHBxSjhxQ29naG1QaWlGcEthME9EaHQ0TCt0?=
 =?utf-8?B?OUlYK1JVVDZuY2IrY2F0ME9mRnRsaERJa2JqS1RwVTZRamRmNlM1WW5PT2Jy?=
 =?utf-8?B?U3lEY1BHWmo2dnU3MlJnUlRDeE5xVVRkNmxNM0ZZdjRINElZMUFwVHpXQ2FJ?=
 =?utf-8?B?SGp0V3h6T0xwTXovK1JUMlBpY1EvT3pKZFV6NkJaU2E1SUgrUjFPM0g4cEx2?=
 =?utf-8?B?eC90eW1GWXdTdWlDbE9vemo2d0VJczJWa2Joc1hYRkozQTU5aWRVZXp3U1lE?=
 =?utf-8?B?SjF5T1hkUkVYYUsrUHh0cWplNXpmU2crQk1QbmN5Y3owZmZybFhJWGp1THZ1?=
 =?utf-8?B?RmkwU2JNcFJJbmdzR0FYV2JERnRWK00zaVJvazhsTGNqRGFnWHROeTBmaXNT?=
 =?utf-8?B?dk1Ta29xajdaN1E5TmUxNjRjNDBsd01WOGFkcWd1MEFVbW9aZGVaUzdhNG1I?=
 =?utf-8?B?QmpZdjYxMXlBREFlSGtEckFnQzNDRGU4T20zb3d2MGhxSWJ1NW8vM0xNQ2x3?=
 =?utf-8?B?T3p1WWE0cGJKZEFCQklyWGlud0ltcTVKTkMxWTc1aHIwK1lmQmVvdXk2VUhr?=
 =?utf-8?B?ZzdNcVNCajhzOEdLZHk4QjdBdzJwRmJvSm4wMnlEZ1hDdzZLSEFMWWNIcjVV?=
 =?utf-8?B?Y2RVOWR4NkRpOTVmMlNMWVN2eUl2VWc3WGU4LzA3QTdWcTNqVUFhUjYzQkpY?=
 =?utf-8?B?MUYxblVaYnRNR0ZXYmgvVXRacnBCVTl1Tk11OVdhdXlDQXU5UFlza1hqeldn?=
 =?utf-8?B?LzM0VHh3K3RiSDZ4Y2pQaytWQ3NwRDJiVHE1dXdYMzViZ3ZlUDVrZkgxbkww?=
 =?utf-8?B?SDY2ck5MRjdOaTZnMytQVmU3MzhjMzlnbCt3cTJDbUpaazBDTWxrNG9kMFh5?=
 =?utf-8?B?SHBGU2VVRjkwc25Od0NGTnd0L01rTEJBUWJndWJ5NWJuWHNaL3pGMUh6Vk4r?=
 =?utf-8?B?VzZlKzBnNlNRMmJiRjkyZHJ1VTNjYlpPVTJjdXlXekUxQW1jN3U0UXRTNW9s?=
 =?utf-8?B?b1lDNjVsbngwaEViOHdGYkZOM3FmYXhUWEhaVWY4blloclNiZnRBZ3V5R3RF?=
 =?utf-8?B?UU1TbkNQRGhyYTdyTFg5ampTMzdCZjkyenZmbVFoR21qSHVYTURMUGF4eThP?=
 =?utf-8?B?VVpZTENKUTVWRFJoVVZZMkZlaFdjV211S0NoOG45UDZXektxOWZoUHhwMVlq?=
 =?utf-8?B?a1l0blQzdDNDeWNJSWFhbDhBbFV0NHRYUFdVOWxtWnhrTkpHd0UvL21EUGRT?=
 =?utf-8?B?SWsrSTQ5OUFOMy9KMzNPbVdHODdqS0xRWFlKUUgvYTliT3ZnOHgxbTdZU0hS?=
 =?utf-8?B?NlhEaHNRaWFZNUtUVUx1UjZwRFNhNlg1ZjJhNVhwcVRvTDkwR1I5N2NWaWRX?=
 =?utf-8?B?UnNQUko2Q1MxOThDNi9ReG9kNll2aklBVHZnSFFNOWhTRWVQUUtrZjlBdEJU?=
 =?utf-8?B?Nk1LbFNzenkxNWpxalZsVXkxUG5JcDdndExTOGpDNjN1S0FVYkpldlRySUNl?=
 =?utf-8?B?QnpXU01JZjBCaGVLSHlXVWRnbVZaMnU4VUtLa1ZDYUdoSGZveXlud1ppL3Rr?=
 =?utf-8?B?UDZzM2VLWnA2WGhac1dYVzFsWWxoZzQ4d0tBZ0tFU1diSE0rQzFoanJObjZa?=
 =?utf-8?B?ZFJSbUxWUHdXWHl4UkkvS1lvTE41SHNNTnpad0FQQXk0NFJ1TDRJWGRTR1Zt?=
 =?utf-8?B?RWhpSTFuMEJjL2ZiYlRJWjkzWC91eGdLSVNGTUx1SlJmWG5udi9KVDBkQ1B5?=
 =?utf-8?B?ZmdJSUJzT1hWUkVkK3gwSkZzSkdGdkgyb3E4enJNTHQ4V2ZpMnpCUllpYi9C?=
 =?utf-8?B?S1JVWEFnb2Z0TGp1VFFwS3MrTEd6aWNEMGFJTk9CNkFXRzBhMGtHYUF2RVNX?=
 =?utf-8?B?QXBuNWE2RkZKd1UvVjU5SU9QZ28xOUlkU0w3NkZYUDB1OUpMcjJTVWRaYzFS?=
 =?utf-8?B?ZDkyOWdsNlB4QWNNTVJyZkFsb1czSElFWS9Bd2RCM3JmMGQvbmRkZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1852a8b9-00e2-4c2e-c256-08df22e4f61f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 13:31:28.8923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AUz43XiLixP1xzOEageAv+mhg56g/DBG+klYqBuzMrsLyviqJxy0OJk4FDg62xF26Zl3mZ2G6o1p5yl3r0qBfb17mkqlwfrOBKVSlLy7Vyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7503
X-purgate-ID: tlsNG-720697/1791207093-303C42AC-07650CAF/10/78276251493
X-purgate-type: spam
X-purgate-size: 307

On 28/08/2026 8:02 am, Jan Beulich wrote:
> Mark it as such, and then remove the code following at its sole call site,
> for Eclair flagging that as a Misra rule 2.1 (unreachable code) violation.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

