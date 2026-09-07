Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14B3C79F89
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 14:16:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410900.1641709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3a8m-00023H-Ms; Mon, 07 Sep 2026 14:16:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410900.1641709; Mon, 07 Sep 2026 14:16:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3a8m-00023A-K8; Mon, 07 Sep 2026 14:16:08 +0000
Received: by outflank-mailman (input) for mailman id 1410900;
 Mon, 07 Sep 2026 14:16:07 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x3a8l-000234-Ac
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 14:16:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3a8i-000krg-Vw
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 16:16:04 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a9ec710-e002-0a2a0a5209dd-0a2a450583b6-32
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 16:16:04 +0200
Received: from [52.101.52.12]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a9ec723-4cb1-0a2a45050019-3465340ce1fb-3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 16:16:04 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB6367.namprd03.prod.outlook.com (2603:10b6:510:a9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 14:16:01 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 14:16:01 +0000
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
 b=o7MW1ZUx9b9t6qQYKgWP2b//oMHownP8vWwq6QfJ1EFdFcUdc1sdgwFnSSHSeR5NSxfCzgAYCJ6LHuldpetQKXDwLqJbLyjyuvQ3MapaDI0clvFc/YYC+BJe8VG29IVotLMvy1t8YTfSOy1Qt9ixcSmQxZMHeSitW35TdFH7yTV8JSXh5vJdVzBzboQyuphg2IJnMYZTY8/w/fRcVcO1vewXzVGgQUzEFaLqG4Lj24Fcm44iDcr0oqSTNpY+lcDFXLXxeNrpSHFvJz3qyANR9bac6s6ZcVxnupaH9/zvlOL7WcmZAIwBTc3W2A6+P3p6XbPieJQNA355Hi7y5vf1lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O6oETVrXcAV99ocSF1FA5hDufNvJs33C0rjCdbF1QHY=;
 b=si6V/jfcI9QxVYnOFptXfvmfm7NJbgX6mPgMxDYrX6C5vU23nTJQ6useEwbguv40rvgiypqeBFxpVWQKv+yDUw7s7BmkcVF9gXymoBqFqydLYafs02rvT3mSZ+veX2njAsRxLVlgZ7OSGwoQrb8x9sd7EpSQm3JeJp+aKsjOF6JzTDLaXIVjtHHPaDocVuNnABUg+TxkRbXOCjcJ8w5FxI5alblZxvP8l6ZaFFrMgW3RylGZzFO2wOGGnvoIL/zJ4b3AMC+t8BvbouXGDUeUHHvVbQLR3yBVLJ+ivnp2l5OpKyYsY0HUcUbHNVJizvFTuXMgy0Y5URzIxGRALvHFew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O6oETVrXcAV99ocSF1FA5hDufNvJs33C0rjCdbF1QHY=;
 b=VjP9CjIOxcP6b4t7xFhO+Sy2PPAJgEEwL2hRLlIaRYSGGu9J4MLDKE9koTq+mYL47aTRaxEOMPCKV0klTtTYR0gPV5eC347rgJHrg0vSUI4KBPT1hK3/4xtACcWwq+tkFnDa2cGeBgjEoscR3RroDF3DLUDd2dfTttwYL5Ht8U8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <00433163-b6fe-473e-9726-17790e1feae0@citrix.com>
Date: Mon, 7 Sep 2026 15:15:57 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH] build: also exclude .data.rel.ro in $(cmd_obj_init_o)
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0d40567f-6527-419a-a210-65e74bef988b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <0d40567f-6527-419a-a210-65e74bef988b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0562.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB6367:EE_
X-MS-Office365-Filtering-Correlation-Id: df92d128-5837-4047-76ca-08df0cea8b9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	9M1ml3qN5XLRWYoZqlHzNS3jTZJUvrS//UES37St9cLRvbZ8T0EHpPYORHCCXKxB/fvc65RzQ9fBtKG4AElm34Magc8W+gNHfkGZsT4h+qknD0us7s33MJ7ON5i9G8CmfCtZ0wWpjLBfGlu+cwwyE6eLyd4VxGvv6RUuo47mCE1DEwxbL6E43ZS1VNwzYdliFHEDRZr7/UVd+dceehv4RkOxmpCHC9l20EzJK+jNA76QQjhK4JlrkzDPmxr+uElgqWZ9AdMeqvIRrupi2eJML4oeK240SyeCd7r3fIJC4QLoVRBgONgtJMI8nEqsAccBbIM7bUf+6yaENdZeAFQg7R/79yAkZyL8j+USLRpn2m0HhsOU/O7lZzj17oG/AxC5svNk0udLz1AzI4EjQ2F2nDT8NIrGRnoA0jaTtbChnwH/UVXDJTjqd8IYWPahT9RZGh9RqtqAjyHC4AGyomiXd8ARtLzxns3LlCgPa0bHwslgdPaKtB8BxWfi/cYOg6lpY+F95QGrCLq37t6zCdEv9ApqdeXTcZ0CVqqk7zys1+8gqYKEZ1WJGtDv2qt1vn0o8mv7/2Ceesk99MAdegYT6KhPAVuaxLU+ZGSANWhtvzMPmLDLKArqqcvwsgS+z72kwU6PrH8A1mc1/ge3iONIGy0ev4LqoVxraMPCNJLEap4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1cybndiRldoR0daaWU5c2NpQ0V0Mk5qTVVNcWQwdCtYSitya3c0R01NeTVC?=
 =?utf-8?B?YldJQ1ArQmtWamJnREtNQ3dscndtek1wUmxPdEtHWG94TDNQT3pCSkxLZ0tq?=
 =?utf-8?B?RUsyeVV4ZXhGM0p3MEpjWW9VMVFCWnBuZHhsMC94QmtlcCtkZGN2blVrQ1Vl?=
 =?utf-8?B?dkRXbS9MTHdaTFpFNVNSSDhqcHd5YlZqSzJiS1FyRU5MYnJ2MWhBcklMRDJW?=
 =?utf-8?B?UnZWVTEwNGk4dnhMenY2TmNvdjIwU0tIZStCQ1VuZllDaHkwWW1LMGp6TkJC?=
 =?utf-8?B?d0VjZktweXJ0S1pveFpyd0ZYSnFIVXVKeld1QWs0ZmRyOE44djhWVVM4bGZq?=
 =?utf-8?B?djR0UWZTQXNjLzc0OHYzN2cvMVNsalJJckQya2tMQWFvNFdVK3FqejQxelpj?=
 =?utf-8?B?dzRGZ3FiaGRGVmV4WUE1K1pQNmw3eE1qSFljWC9BRmxKM0luMU9KZWtyVnFQ?=
 =?utf-8?B?dzJka0pTN2RXQnMwR2FnM2MrQUpHREdRSDh2RjRCUkNQbjd2eGY3eHV3dXFl?=
 =?utf-8?B?Y21EZDIzd1lnei9UaE1TUWdqYmtqUVFuUTd2MUZLM1NaTWVzb1lLZVpxK0pT?=
 =?utf-8?B?RWZWT3BNaFBGVFBmSlJjVkJ1ZWQ0M3lmK3QycWkyOEREZmdIQlpDU05tZHJr?=
 =?utf-8?B?SFN2OGdyOGdMK1lHdVhBSlV2QkxtaGg1dHZYMjRZOUFBdWUzY1FJOXdzSDBj?=
 =?utf-8?B?TTBsMUZJQ2VsaDV5bDhUM3BZZlVrTWN0TzFSTHloK3VFSHlnOU5nay9VSyt5?=
 =?utf-8?B?eWJxT3YzejF4TGx3WEthODRTQmZSMDFNNEtwaDZpNndySnpGalBVUzdPUzVi?=
 =?utf-8?B?ejA2TWhaTFh4bnhkMEtYaWhTd3BWUENIdVRqUXV6R0w2NWFzOXhnMitMTGc4?=
 =?utf-8?B?alNPNCtkeEhlRFRucm9Zekc3cVo2dWxxM0R3SEFqczVxVEhLVmJGdGw1L0xL?=
 =?utf-8?B?emdFdU04OGlwSjM4cmRka1VUekJ2Rm1meGhTKy94djMzL3BPVk1jL1hCaGZa?=
 =?utf-8?B?cmFKUUlEclZhSVQvb0xNZW52eVJ1OS8rVTVEM0dhdTJTUzBZelVnUlZyRk9t?=
 =?utf-8?B?WmVYSXBKamIyUkF3T3VZVUpOQXM3SWtGRm51cHQ0ZmM5NElWT2xweGg2aTl2?=
 =?utf-8?B?NWR2NG1yNFhKQ0FPT2pTVUI4Vk9sNjk4MXl4Y01yaFM3NFRaM05qbGF2eWhr?=
 =?utf-8?B?cXc4VFIxU0YwWTk2a3dKWE9iR2dFMFdScGY1NisxeWdXYWREMnR1YWgzbjU2?=
 =?utf-8?B?ZnZId01kZ1phYTlpNkpPSU44WWJuc2NQRFJjVUQ3VTRpTVpla3llRmlFUCto?=
 =?utf-8?B?SDBzYXZuREJZd0dxTVVxL3lNU0xyeUlWdE5BbmFJbnlNMUZZcmxuSHczQnJt?=
 =?utf-8?B?UEcrRk42YjRobElPTFRxSUI2dmd1MjBITzh6R3dGMnpKQ2MxQmM4RGUrNURW?=
 =?utf-8?B?R1RRVTEzaGxOOEt0czhVdDI4M05OdVdjdU9KL1BLWWdUMlo3aGltazNUdFBz?=
 =?utf-8?B?cVNvSXlaZkwvTVpSSnBlOXNQekRFMWFMRnRxVktBOXFVY3hoR01TLzBGd1Ji?=
 =?utf-8?B?V3k2dE1ja244WC9UdWVYN3ZseGkvc0FkeHdmU2l6MytXWmJTOTNLYkJJcjdT?=
 =?utf-8?B?WFBQRHA4bWZ1cW84a2JpcGprQ1BSNUdtRTg0TXltUDY1QUJOazJFZlRsZFI1?=
 =?utf-8?B?S091cXZxYzBRbG96UGwxVGl2S0VWaXpzTmlCRTlKRS9kNjZxQUZld3FrVkdO?=
 =?utf-8?B?ZFNjSU5NMTJRd05mdERuUjhja25DcTNCdkI2cWxmU0ZvU25CUURVNWFicUlE?=
 =?utf-8?B?WThWRzJ4TW5CaXZTR3JWNXgvNXRZWHQ0M1NZUWJ3WElpdEFqMlpIemplYlhI?=
 =?utf-8?B?dW5ZQ1JDR21nZFVOb25aSmFBYnR1MldrUjFjQWwwT2wza05QRThlNlFXZ29t?=
 =?utf-8?B?SzVjckhxWkYrQjNla3NFcWt6akdkaWo2ZGlXd01FNVVOWngrMlV4MVd3UWlR?=
 =?utf-8?B?a3VjZ1duVThlRDY4NERBNUQ5RENoZTBxZXZobVFLdHoxUllTTVJPRkpLYlRx?=
 =?utf-8?B?UHlKbW43NkhwN3dFSkQ3NlhOekRRUkRWYmh3S1ZZSFFMVG84TEZqVXFKakg5?=
 =?utf-8?B?bGUzVDJQMVUxaGEzMjBoTXp3bmF6NGtOWHVOQTdoUWkzODc0aUZqR25iUmFI?=
 =?utf-8?B?Wkp4djVJVlpVRlJiTUIvZTNsdmFnMjRnVzdMN01qaE5Mek13NVI5SXNhS1Ni?=
 =?utf-8?B?anhodW4xRHU2dy90L1BKTFl6cFl4aWZLT0FpZFpZWkd0U1E2Q25xYk92YnpK?=
 =?utf-8?B?VGNaaVBjUGlYMVg5NEtIL3QyRktYaVNZN1A1aUdXVzdhNzEyOW9Zdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df92d128-5837-4047-76ca-08df0cea8b9d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 14:16:01.4836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iTKbgVQ549FttGrlYMrebF/N6J/zSNvnubpi515JSxYtfS5bQ1LgDhj4zBkaPhFe/v3WKRGz6mWqJIi6LZbzGz6T2B7Rn1jZGyEVQGptdiM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6367
X-purgate-ID: tlsNG-c201ff/1788790564-71EA92A1-FA11E4B8/0/0
X-purgate-type: clean
X-purgate-size: 351

On 07/09/2026 1:18 pm, Jan Beulich wrote:
> .data.rel.ro really is merely a special case of .rodata: r/o data, but
> with runtime relocations (not relevant to Xen), i.e. r/o only after
> relocations were performed (by the dynamic loader).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

