Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8351C5DF6D
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 11:14:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1395182.1633679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wweF3-0001kx-38; Wed, 19 Aug 2026 11:13:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1395182.1633679; Wed, 19 Aug 2026 11:13:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wweF2-0001kq-Vy; Wed, 19 Aug 2026 11:13:56 +0000
Received: by outflank-mailman (input) for mailman id 1395182;
 Wed, 19 Aug 2026 11:13:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wweF2-0001kk-0U
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 11:13:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wweF0-009sBo-T9
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 13:13:54 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a858fdb-2eae-0a2a0a5409dd-0a2a450be3bc-46
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 13:13:54 +0200
Received: from [40.107.201.2]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a858ff1-b7e8-0a2a450b0019-286bc9027aaf-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 13:13:54 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ2PR03MB7450.namprd03.prod.outlook.com (2603:10b6:a03:561::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 11:13:50 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 11:13:50 +0000
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
 b=HtIRjOuGnXbLgSCEss8tw/Ze4vzMRoAJWUMp9n360G3/S6LlK2J4/7ufEEvzBpJm0lfA+A7YYZPt/S8plA4VKYivwpT1SaDi/4DaoWv6j+yHkTi4xmAZMJS11oRuyXewFeEq95lgWCH9bqP6T4m7GXIN3nIav8cWfN6fZ5UPG5rcr7gX+AIv2GVI6E+LpuAiYynCetHtXv3/sLjrQJIk3KCKjlQlw7d9CcpfuW/ne4HTuhvNBUHdN55ogSFLO0AcEmgS/NwGtZQ1jj1IuzBpUGdHdJ56ikSTPEarRmI263Ukdi6Dm39DJIMYZfVHBrhR8tMLaRkvnZn2DJ9IAPVGSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Z08gkcl2/hGSaktKo543z0fApnu6jnlkBaA+udc4/Q=;
 b=fDF9hbGy8lPl1uzggqir0M8dJwrwEz/wLWvQLI0NRx/1kDG7W4FV3SC54iRsR4KCrBd7YYpGXwdmRyfsgDDNtRuyL2s6dYZc7QsVG+ojkwFD5jdYpfpLQWkSScsAci/wbqZ+KNOtsUcBV7f31B1M2UYLJfhTeMCpbfRILjsO1EVSSCN+g8dFwuCVoITEJ2SXUIMWVOY0d+1Nrv7USOtHRcGX8psCJMFzQ89ggpL4TywTJO0QFZJMiHvfVCuJof1M8rSX2Hl/qRca0frIjIfn/yAyCQFZIzmJ4Diinj5TJNutuisDfD2UdHmT5lx0XNjG5JXItv3Ut7NI+JUph8g08A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Z08gkcl2/hGSaktKo543z0fApnu6jnlkBaA+udc4/Q=;
 b=cuo2sD1ILBj4eVwt++wqMhd3m9ONblJb+qIQ/DMjB96QCXnyQ7Tro2hgWgfb9eP0uDh2fI3t8ZVWpXjFQfCxv4fKLlHArIRUBJhIRBPC2humZFnjz33W8+1u4yastDWKytawClUhs+d0PTWdE4ISyCZOMRhdVThqOU1ujs0SXSw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <65789d8b-d18f-4f1c-8ffc-e1247daa4031@citrix.com>
Date: Wed, 19 Aug 2026 12:13:47 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/ucode: Remove MICROCODE_UPDATE_TIMEOUT and associated
 panic()
To: Jan Beulich <jbeulich@suse.com>
References: <20260818130738.1911850-1-andrew.cooper3@citrix.com>
 <5fa222d8-af04-4b1a-a457-ee5004ace484@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <5fa222d8-af04-4b1a-a457-ee5004ace484@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0002.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ2PR03MB7450:EE_
X-MS-Office365-Filtering-Correlation-Id: 61ef183d-0ce3-4d11-cc49-08defde2f259
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|18002099003|22082099003|56012099006|6133799003|11063799006|5023799004|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	I1/+n3dGYJPL1Y2BrmVhr2okdiWmZypBd+vXiEVVbfviHfZF1lbxWqxzj9AkjevS2qsqaKkhWD9rLgzf4Zl4yJtQ2k7Rz3PfRrvTkymzZ5bl0xXBkg5RTeucvd3hXHQL/OO5WCkop7UkhQTvybi+a2dWUsG8BW7KRufvQM9o8R8AaRPk8WpZtzEQ2448K6BCAOqasJfozIfiI7d+OnV0BzhOhwHzm/1sYMu41u+aRDrPMBx2upej8OKGrhDlUk/d/oZim5L9uZ47dU4kzpThm1SjH9+RvwZVNVhtx7bIPt+L4qX0w0eDKMv+5beTHC08xJVBEaPsjxtBXn6W7G2agsf4GupqKRvLCil4b95X3JLbEx05ezKKpii5G2W9bXA3CFOWPS2/fYX1ufKbjyubrB7QQleiUk9955i69XeceB6HbuZpSSOXSopGNrKD1uME2L9EbJ1mJaxZp+JIhOF3Dzn8WyjTKfGXewrYuFzG/rbZWjTPvx/5MH6nu0eOh9dCz5THoUhgNlyHbTy1W+ShuLTzKYEx7vvSpz6bkMVfFdP3u/XTbllZuS9/rn8w3hr84+sZ/9Q8aL6NRW7p2TTlDPiZef7HFK4EB4ajS/0eTX9DS6nimJw1DpFoy+8yju+iDcmgRx25s1uVNcsgtAtaI1anwN+635WJ+sfpql7QQ4A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(56012099006)(6133799003)(11063799006)(5023799004)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnFtNXUxZ2ZSYXk3VXhiOWhxcDJjWmxOMlZkem1PZ3lqaDR6ajZjdDVrZWdM?=
 =?utf-8?B?NlkvWnlvSzA1UWVnYnQySWsyUzhOKzNjWlRKMXZWS3BoUHB0blVNU3UyeHdy?=
 =?utf-8?B?ZHdkUlR3aENRYkozNlZYeHZaTEcvLyszNDE1QmdPeFlNS3J1aVZTaVNiVFJa?=
 =?utf-8?B?Yi9FSmU5WTdDYXhyTjIveWtwZW40OUFVcjRpQnhxa0Y5TEs4azE2b3RnMHhB?=
 =?utf-8?B?VUcyV3BJM2o3am5lNDdjUjN4WmRseTR0TnhHQUVqRGFtT2c4NUpuV1Y1dGZo?=
 =?utf-8?B?dXFzSngyVVZwSTBFVytKTXJnTmE3WmtEZTFsTGM4dm45UVRTeVRxZlhSUTdL?=
 =?utf-8?B?RzJMYndvbmIreGJOd1pNRExCeTROTnNacGk4c2F0bExOM0RhMVlXVEdrVnhq?=
 =?utf-8?B?NVV5b2V4NENVQ2htL2ZVOVVPaVZmOVlIdUtMdEY0U1lLODAvVEVXbVJ4SWZI?=
 =?utf-8?B?alpPRGN0RHU4QmlHN0dJc2ttb1NmbHZvUjhzRldhUUNuODZMT201bjNDSkR6?=
 =?utf-8?B?N0lWSmdrUWhGa3FqQU96TmJOM016L1ljSU5nL21HVVhHTlc3VjRLZjdpU3dH?=
 =?utf-8?B?YXdTMiszVm9CZFhPOXUrWGRGOFlQS05aZEl6akdWSGxLWEtkdkZ2b1lUUEh4?=
 =?utf-8?B?Zkt6RXQ2K2s4M2ZScHh6QnpmaGZOck1MRG8veXphdzJYRCtNWHpjQWI5SkVV?=
 =?utf-8?B?c0gvWmZKQTlmQ05Ra1I4QzhuUXpLRjMxZ1lGNGkybkFZUGVGODlhdE1lL3pn?=
 =?utf-8?B?Q0VLNkhkTUpyTHJDYThtZXJmUmtuTCsvVms4bVYwaXMwK0pLTnlQSEVxUTJj?=
 =?utf-8?B?YXRpQndRakdNTWwwaEpubHIvSjN2cEVSUzVUekxNSTlLeC9Lek5udCtVOEtq?=
 =?utf-8?B?eHB0TThKUDVwbkRjdmcxNVNXYjkzQ29QWlRMSG0xdzU0bGl1d2ZPNDNkZUR6?=
 =?utf-8?B?VzVSQ3ZTb2k4S1BFM2pWNUd6WTNHVHUrTlpsMkowcEtERXlqM2l2N3U2RTlo?=
 =?utf-8?B?TG11ak51NE9MNG1hZFZ0TEZpSDRRY29vSFlMZnA0MUNETDFwUGtURERrUHZm?=
 =?utf-8?B?QXphcG0wWUQwcTdFQ3pHcmxLZjJiN0xneDIrbkVZdFBOUEJPeklVaVRqcUgz?=
 =?utf-8?B?MXVJQlFKSWVwRCttbW1JbG5iUkpza3FsaUtzQXQ4ditxUGpxa09rTGJScTQ0?=
 =?utf-8?B?STVTYWVSVmFhd3MrdzVGVExZazV1QlVObUV4c2d3cWtZNXVPZHhwSDc3VkRt?=
 =?utf-8?B?VUg5QW5ZaXhyeCs5NG85bGJTbDlXaEh4cGY4QnRvSEtna05YTzVhemY1Q2JL?=
 =?utf-8?B?NFVhdEVBSjB6M09FUEVtSlAwcWdXSDBIWjM4UkJLYm5tQ0QrOGNiS3hSSWll?=
 =?utf-8?B?N1V0YTd4bktJME9QWWVhOWRjdGZhQlJ2dUZxNnlXMGtGSW1BWXRqS25TcGx5?=
 =?utf-8?B?UTVabGhjS3YvdGpYRWwvYzhHejZWMXBBdURxQkd3K3dJQXo3ZlE5RTVucUNo?=
 =?utf-8?B?M2lDRXBpOFhRL1hpWjdHNkU2dG9aTkNPSWQvdnozcDJYUkpZbys3RmhOK1JT?=
 =?utf-8?B?RnUySTZyalQ2Ui85YnRHS1pUZ09qb0F1SEM0OUdBTDVRZVNpN2tVQkFiSHM4?=
 =?utf-8?B?RlRLM0FNZUdRYzlueUp4TkdDT05DMzZUM1EzeFRkNXh2Z2VHc2drOUtHYlZw?=
 =?utf-8?B?dTR4a2hmS3NCc0xCRm0zWER3cnZaSHBYdGtYdVBzWjhQc1RlSWVobUlMSkF3?=
 =?utf-8?B?WGdDZTJUUDYySElvK0xCcElBQk1kbWo1S3R0UHZnOEV2MU9id1BXdjlKZnNt?=
 =?utf-8?B?aU9lTDYrQXZxMStsaFVqcVlsSkJSMVgrRDhPaG5UNEV1SW5tMEY2SmlrMU0v?=
 =?utf-8?B?WngrTUllU2NXSDdXK3lKZkZwcjE0UGh5c2xtSEljZm1PVG5Td0VYK2FrZHQ1?=
 =?utf-8?B?RnIvTDBWZ2lLS0dRTHowbDRFVXN1ektjV2RXUzl2VEN2d1krQitiMEYrT1Vk?=
 =?utf-8?B?VWtUditCTTc3bVdHcnhEK0xDR3cvSkFBbURYaXdGWVcwTG1nTzhaVjBnZzBV?=
 =?utf-8?B?RENqNjM1NXBsS0RLdW9jZlNPOWR2bjN3aTJFSHBKOUdxNjVIZ2NhUU52M2c3?=
 =?utf-8?B?L2hpS2VKZGp1a0pYdEIzbGxuM0tSbktBSkV4amhwYzBMNlQ5cG1lUGZhV1l1?=
 =?utf-8?B?UXJ5bDhFY0RzbnZnZ01UKzFwQVpoUlpRdkpLRSt0REIxN1VXU2dzblliZkZK?=
 =?utf-8?B?YUNvMThOTXhkdUhyakFTRXdyNG5pVEdiaTNaOXhtOHdrcTQ4NUpsSHROT2x0?=
 =?utf-8?B?d1NqYTRDMFZFZDEzYTIrUGdnWHpJV3VFN3JidEcyMUtwclpieDdnQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61ef183d-0ce3-4d11-cc49-08defde2f259
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 11:13:50.5316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WtAUvZVHXMKSwwAXPymZn6aniX8ZgkQetKGg8CSzOdxuDqocNf5CZ63JfcU9URbKI1Ih0UZv4I02ypKYfxJ0dPRYsdYpdqVucO2iSmd4nkg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7450
X-purgate-ID: tlsNG-42698a/1787138034-AA6DA9EA-4F76668C/0/0
X-purgate-type: clean
X-purgate-size: 2922

On 18/08/2026 3:31 pm, Jan Beulich wrote:
> On 18.08.2026 15:07, Andrew Cooper wrote:
>> Panicing in the case of a timeout turns out to be about the worst possible
>> action Xen can take.  It leaves all other APs waiting on the condition
>> variable, some in NMI context.  As a result, they fail to be shot down and
>> dump state for kexec crash analysis.
> At the same time there likely isn't much to be learned from a kexec dump, as
> the source of the issue is in the CPU, not in Xen.

The single most valuable print message I've ever added to Xen is the one
which reports which CPUs didn't respond to NMIs.  Up until now, it has
always highlighted hardware issues.

Despite my wish to remove this panic specifically, there is still
information to be gained from kexec in a similar scenario.

> Further, this code runs with the watchdog disabled. If there's truly no
> progress anymore, how would one know from the outside whether the system is
> dead altogether vs the control CPU still kicking around?

The scenario you describe can only occur if the BSP accepts the
microcode successfully, and one of the APs locks up properly.

If the BSP locks up, we never get as far as deciding to panic(), and the
system hangs already.

If we have a bad microcode, it is far more likely for the BSP to hang
than for the BSP to work one of the APs hang.

>> Microcode Loading on Granite Rapids takes about 4.5s of wallclock time, far in
>> excess of the of the arbitrary 1s Xen allows.  This time is spent in the WRMSR
>> to load the blob, and there's nothing the system can do but to sit and wait.
>> Despite the delay, the system as a whole does survive.
> For this I wonder whether the log message issues after 1 sec is adequate. If
> we know things can take this long, wouldn't we better issue the log message
> no earlier than, say, 5s * nr_sockets?
>

I have some work there not submitted yet, which would periodically print
a message.  That at least gives you slight signs of life.

But nothing involving nr_sockets.  It's far more often wrong than it is
right, and that's not how our algorithm scales.

GNR has gone from milliseconds to 4.5s.  Putting the limit at 5s is just
going to need another change in a year or two.

>> Microcode loading occures through admin operation only, so get rid of the
>> timeout completely.  It does nothing but make a bad sitaution worse.
> Worse when taking one perspective, yes, yet a silent hang also is worse than
> a panic() telling you what was wrong.
>
> This is a tough one, with - likely - no really good options. And establishing
> what's "least bad" may also be difficult.

As indicated, there's only one narrow and unlikely case where the
panic() is a true positive.

The likely true-hang case don't reach the panic(), and that only leaves
"timeout too short" which has proved to be the case on GNR.

~Andrew

