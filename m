Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82BAC61DD3
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 12:13:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407075.1640220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x26K0-0006hj-B1; Thu, 03 Sep 2026 12:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407075.1640220; Thu, 03 Sep 2026 12:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x26K0-0006hc-7H; Thu, 03 Sep 2026 12:13:36 +0000
Received: by outflank-mailman (input) for mailman id 1407075;
 Thu, 03 Sep 2026 12:13:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x26Jy-0006hV-Qf
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 12:13:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x26Jy-000tMa-7J
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 14:13:34 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a996468-e002-0a2a0a5209dd-0a2a4502aee8-16
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 14:13:34 +0200
Received: from [52.101.43.37]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a99646c-6ca4-0a2a45020019-34652b25db6e-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 14:13:33 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS7PR03MB8195.namprd03.prod.outlook.com (2603:10b6:8:261::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 12:13:30 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 12:13:30 +0000
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
 b=CzvmpWYWj2vY3gA35a+AU07TSuCvov5ejGljwzYg1PUuhxo8yezz8QJdlpHphdwzHMi/KEsPdLo6oLvZh9C0qXe0wehIupV+D0g0ER5AR7Apy+DOnIqS8XTc3nhAkTjAGpnZTTJfghHFNVM91nU8Xqykv3naFke1LkbYSGFbbn4G0f8aluLjJfrQpnhEcCsQrOuRZVYwHaiMtXk3x9sYH1LLBxgfxaSbMj51ASgEKj3ROzWjtnRA6XvSC8Dd+Lu6lYTb9n8ROYzRIQv7o5GLhewiAOhQGzx3SjVkJfSxOnPQr3VuCnOjVc9Sg+yYu4j1lEqYX25wft5/Bsi0VyiArQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iyqvG3i8EX0ls0rhCyfDc5DGh7QE7Yy6JnrwEKDtFXg=;
 b=CaJuNYkreKs24ixir0eQ7+Ji8J2h/h5sTg2SNqwAz8pBE9gAhVJb5vkDyduJ2EoX8tkZocJB1kOBsEHgLTSDmdKv6B/iZHhAi6lcE6z4zh6gjN7AWQBD5WjvlQT0JbyZN7A34G9c1Hd/U+gLTqI8U+L47m01xFjCGz5tc7qEZ+2sQSogEQziNeH7Umro2SGpK0fCCnmG2+o17h8ghd1PTQm9fkT4BDp/w8Zf2cpqWx2FtUk0EBk8KrdOgwZ/dNDU94QxpP62JENtunXoiy6eMQXD9ab8tKQbneuevyIZncDCmkDxu4umRUkrX76cXfARKjGImlGkTRUxRtoE09OW7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyqvG3i8EX0ls0rhCyfDc5DGh7QE7Yy6JnrwEKDtFXg=;
 b=pmQXbfvVkUIeJSn4jUEc/uo1QBnblDfkTXqreA4Zr5F4uBFPA0LVi4gfKsn4fzTZ34dkEnLuJ6IINoyY7LEeqM9Yj5Ts9jfe3xGXMBCoLj/culpPVpDXIZt/+18oeqA8b/l+14s68qJqyGSqzzTYVkV0yKYh3ti5ydDnwpFe/bk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <64a1aa96-75c4-41aa-b656-f42a68647dbd@citrix.com>
Date: Thu, 3 Sep 2026 13:13:27 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH] x86emul: adjust file comments
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c5d9cc70-66a9-4ec2-aa4a-395824ae67e8@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c5d9cc70-66a9-4ec2-aa4a-395824ae67e8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0291.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS7PR03MB8195:EE_
X-MS-Office365-Filtering-Correlation-Id: 75b99242-73f2-44e8-f1bf-08df09b4c440
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|18002099003|22082099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	DMcyYvElw1/CbwPEAbWhnsC4oPXQcfv+FYSs3AvlQTJ62Ti7mqqHQBGUMwSKbbN3tbmz5qHbJ7VDrasARsn8YxLRei7uo6Jg8papiiXDoNQhCiZQ1CE716afawnbIMker/cscAheNsc6ZvCUjqfWOG6vn3gFGW7ewMC6yKTczu1qNjR8QUMjcQLceC5OrMZWIhZP7gz/o4SJEytViQDFxHphU3iU5Dxqa443MEH3U6hUGMu7Iskz5C4CrUVZZbTUyBXuBlbqwPL8ejE7wUbfI78bWHBPMhD3a9kj4/oyb1ZXspkaS/zjM0Zb80xY6H56g73TyXjwHMfS+eljxxmAJed3XLaWTmEFqQ3uxv/y1DvazLDVN3QOwliYRY7e3jYHDOAZYD2jECXmGTxVC7C0Aibi78GwZTS/vsg48S8/xt0WoBbVk/5lHTuUdYuj5Rh4SXdaUxTI3vQuMXU5EL6k9YEuekaviptn7+LRArIjrU0LIxmD4NZhiGfOtTeR6bcDWUqkH1gLh2LgTwABwHVpd6BCtTZb0COqQlI6O0At0pUgQO+ZOxIHnNuDrCeKPCps5ldtL0geNr6ZN3sy4PeeDDLFlFO5E6/xF/qMJiDjnqApg39bfhHU/hHz81hfm12K98OAlhbk9VTa67RVbIKQj/uc5QYTdOWS9hEf0kKRqCc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(18002099003)(22082099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkUxWi9WeVA3RzJlam55dTVqK1NWZnRCWXVQUVdKRG85R01VNzBxZS9aajRM?=
 =?utf-8?B?WTl1OXVoSUE5RmQzU2tTRWtxVnpqQzdKd3VmZDVXRGp3TzVtd2sybDRYakd3?=
 =?utf-8?B?Y2FCamE4c3N3aUo5TG9SdHIyZHZObFNPcUV2TmxOcnBNNFBMRTR3b1JIeDUv?=
 =?utf-8?B?YkJaWDhQNnJjeWlmbHYxVmVRR2N1S0VoMndOdnhmVWxHRWxiUi9PM0V0Z1R5?=
 =?utf-8?B?WlBybEJiN1NxR0MzYklRQWxJQU5VdEJIMG1odmQ3cEpYOVlYcTduV2dmY2hG?=
 =?utf-8?B?NXRyekVZeVZXbGIyRWg2MW9TeXJhbHRha09XRWpEUjQ1SHBZR0ZMR1JIYW84?=
 =?utf-8?B?aFhER3hNYllsV1QyZUcrU2JGM0p2NzIvSmUyV28yMmpzWjYrTE9md1JvVkxP?=
 =?utf-8?B?bTVtMUJheWhaa3NLeFRycWFKaEc0TGNCOW9KRmluYVRoV3doa3l5aWNQanlJ?=
 =?utf-8?B?akJRNFdoK3owN2VNZXlGVGV1elZjU1pLYWpNTmN6YWJLZDVuUnFYRHVGbkRy?=
 =?utf-8?B?cGcxVVYybU9EM0YvdGxTRElBMmJXcHJDeWM2RlFvcWg4ZElUTGNkb05xQ21C?=
 =?utf-8?B?S2pYRE1Ud1lDeVVINGd1U01pa0FZNitJZ3EyRERLZTBaZEVycWdXckZUUTgv?=
 =?utf-8?B?RWhGVUZrV2J6cjlxZXM5SHBuUDRzZlVTY2FBVE8yTHMvT0VEOTIyaGtEVTNG?=
 =?utf-8?B?QjVoekFGMFp6Ui9ISW53WGlqUkZ5TGprOUZuajcyN3lzTnF0ZXAyRHExaUFP?=
 =?utf-8?B?TU91bHo2aUphcUJ6V2c0VzBsSmZxdThiMWlRVmRva0VxYnlRZUhyUzFUMUo5?=
 =?utf-8?B?WU0vSCtQYlpsZGhwNzRYWGNGNXNmM0lmWW53NTIyVDNDRGE0RXlyb0d2VFdI?=
 =?utf-8?B?QnZORzhXeXZpTjlSM1RpTndhWHZZZUJJTVZqWW1QOEF5U1UwWG1mVXlsRHpj?=
 =?utf-8?B?TjZHVjlIUFBvdndMblFEYmt1M2d1c05OemxzTkdvem1oRlo5aXIvVTJGeTF5?=
 =?utf-8?B?amdSZkZPa1BPc0gvWE00NEkwVy9LZ1lPQVVqS3RkbUVnN2tpTjVjSmppajhQ?=
 =?utf-8?B?eFdoNk1aczdwTTlQQWFTYmxoUE5QK2lzZkttbTV0U3pibzhOem03V2tVUjEv?=
 =?utf-8?B?KzdwRnMxNDZNQjZHZG9UUk1MeEdTNUk4RVhlZ3ZUNHRUY0lyNW83a3BxYmJn?=
 =?utf-8?B?WHlWNEJIQThyN0hxaEkxYTlZMFBkb2RRYjZVNFcwdkdzU0ZIdTJ0ckxTelJy?=
 =?utf-8?B?N0Qva0N4aWhMbXp0bFc3NnNGWVhVbVc5Ni96NjNidXVQZm93YndBOUNNQjhj?=
 =?utf-8?B?SjB6WUNZWHBoZnBUekYyVkowNzhvU1VLTHA3VjNaMmNLSkViUDRRdHpkeHRz?=
 =?utf-8?B?dGJnTUtkcURnbURqb2g1TFRDOS9yQVRydnhOY2xidnpIMHJjb282SkdGMlU3?=
 =?utf-8?B?L090eFpmcWhJK3UxT1pWMG5ybGhIVW5Pb3hCOEZqVWJZR0hIc3g2cXZJRG5m?=
 =?utf-8?B?SWNRdjgzK1UrU1Z6MnZaOUNNTkVadlV6bVBqUHUxU0tvbUsvQUtWTnhQRkg5?=
 =?utf-8?B?NmZhU3VlYnIwRUZMNWZIU0FGSU53UlhZQ2NNdEpyS2hZNnJPVVEzL2k2OGFy?=
 =?utf-8?B?RHRCQUhIQXZkVlR2cVByeUZtOFpPY1dZWTBac25LQmdaZmQ3NXlCUlVsZDJj?=
 =?utf-8?B?RTE5NXUrVzNucDUvcEdrV0prbjNOSUVHZkdDOStrKzZxaStYbG0yOFJDR1Nh?=
 =?utf-8?B?ZExSVmUwWGVqQ09hVGJwZk1UcFZiOXV2ajhRN3BmYXQ1YmJZSDI5K08rRVcy?=
 =?utf-8?B?SS9zZ2IrRGo5YVJXTlJlQkFtcGU3ZFJHOU0yQ1pCcFpyWG9IUndib1IvYlVS?=
 =?utf-8?B?R0l2aFU0c2NSa1pDWW9ncW9hbVQ2N3FabFdEMmphQkpRNFIydVZUd2RRelVH?=
 =?utf-8?B?Ylh0dExIU2wvRjRBT0I3Yk1saWZYZjkyckVwZkgwTjZoVmM0Q293UVRtOUpo?=
 =?utf-8?B?bklsV1hiSHVhNGxkMWU1aUE3TTNXK0NxSGl6Znl6Q1RiWHVRVU9FSTJZWkx5?=
 =?utf-8?B?VUI1RXZsYXgzb2lmazlXMUdkYnR3eWp6NmV2b0dPUEI3ekp1RTVMMW0wS1Zv?=
 =?utf-8?B?QWlpMVRXL3B4N1UvaTNaY1dGMEo2TFBldmVRSkw5WGNLZzNPbU93TURxUmQ4?=
 =?utf-8?B?SmFlZXl1SzdsODR3R3YrdlVyYkkxS2J6MTNTa2lrblZPNWl6aEZjakhzOVlO?=
 =?utf-8?B?OWJkWTNmVGdLM3Y4NVFCbVNDWFNqUVdOZThWV0tyaURyMHVSaytPS2xXazVM?=
 =?utf-8?B?UGM1dDR5TWk0em1MM3l2UW9WVlpKYmdQYmJpS3h6cUtYK1dGcDJ4dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75b99242-73f2-44e8-f1bf-08df09b4c440
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 12:13:30.2960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ll0lVXJvXzBRT3OMpHgsuYrgZ4aRvLYwyWjWRJMiQYo0kJgVmxVhX6/qD5kCbQcbtqDiH6956RityqaDkRyv46XpR+sobgumAbbTsngV+zQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB8195
X-purgate-ID: tlsNG-720697/1788437614-305C52AC-21422C14/0/0
X-purgate-type: clean
X-purgate-size: 275

On 03/09/2026 12:56 pm, Jan Beulich wrote:
> With the split-off of decoding into a separate file, both files' top
> comments should have been adjusted accordingly.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

