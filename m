Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4188BC61DD6
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 11:30:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405672.1639125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1jAN-0003V0-EN; Wed, 02 Sep 2026 11:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405672.1639125; Wed, 02 Sep 2026 11:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1jAN-0003Ut-BX; Wed, 02 Sep 2026 11:30:07 +0000
Received: by outflank-mailman (input) for mailman id 1405672;
 Wed, 02 Sep 2026 11:30:06 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x1jAM-0003Js-1P
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 11:30:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1jAL-00EyNP-92
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 13:30:05 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a9808ab-2eae-0a2a0a5409dd-0a2a4507c9aa-40
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 13:30:05 +0200
Received: from [40.93.195.56]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a9808b8-b4ea-0a2a45070019-285dc3387c73-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 13:30:02 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.10; Wed, 2 Sep 2026 11:29:58 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 11:29:58 +0000
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
 b=K8avEXm04Z7yZaM5Mylerec2uj5wtFYTF/JZ8pULXZ6mq7OW/7BJ9Vwc49v5K54OcypyX4cmJqhd5PY3j8MaqvtqASC4OjWpF6ays7a8PmYeCh2xhkbwqvZAjnJKn9vs7/qyT+2eZEv0FFsDXXPtNq6ydSxh02/603ZkyKIGWRbZ08OcHNj2ljZ6fsPuqSWud1y+r3v+YYH18P5RDRDjOCkWkrxjLmEl/kPpNGOADST/JdKdkOSNkFBtemoZJOqwBjCMURfOtwt4n4iRqefkM23NybGs3kF25rX0yurGlvQxvTCT/IZk+SsQ3F9z/2GqXmeRRO+k++ThyO1sltlsog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rknqFhoN9EyOuvKQ6pktIc4DwDN7Q5InRknRMXQXJUg=;
 b=XNNZLKc/yv7Fy/MsJ4GD3lG+5PGFHnEZY7DIkBVqCtVeXypdcnOQ4DbmYiA9XgOCS7BR+kiY9TubUmJeh0GJX7UWislHrtiNxA8bT5lrbYHWMbexzPjiFphgqWMGJao4V3YZVWA2Y2RSsgyTyfmcxisH0tFXZmIvrr8TLeTymtckH3xFmgrsCXsKyBAL7YbJRKA0SdpZDZRM3LfN4hL4XALQxEKZilsMygV+K+rfyBXWl/zFqvyN5CqU+po7Q7mganUgsUb5icOt9fsM4ULkI2rGJ8P1jHBnMGd/W8Xr39+gEtBcOHCZ5YzICsa3gDSSh/7dQWU4njApzmGTm6TcbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rknqFhoN9EyOuvKQ6pktIc4DwDN7Q5InRknRMXQXJUg=;
 b=uhAOomtqU/0fWP3qCp5iF7yLs3lH+HvAeG1JtA56Rl+aoIMkT8BSgoLMSTfuLRUtwRQCve7Q3+HtIRHhPQ00rGCLcY0RSO+o1+QOjbmXLYMXU9lLMMTv+Owa7+CgH3zxb2/8q6OW7S+EAPRYL6RpGzBgXrsw1+ZzmYI08TinB9c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <11dac855-d2d2-4f28-8a53-de740a3ed5b5@citrix.com>
Date: Wed, 2 Sep 2026 12:29:54 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 02/14] x86/bitops: don't cast away volatile-ness
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
 <75bd486e-054d-45f4-93b7-800b0ddb21f1@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <75bd486e-054d-45f4-93b7-800b0ddb21f1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0141.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM4PR03MB7015:EE_
X-MS-Office365-Filtering-Correlation-Id: d9bc5c29-8c3a-461f-96c9-08df08e584c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10067099003|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	kT8C/Nps1QKr3npN4dxkyj/0IYumcTqkCNEOJ81dT0276jhfe7nj19nAZjPpQskhb4zf79dRyb6NSw1f/JtkS/NUHvtj+FWtqUIF1CBZOpgAShg93sWuKxDy6HXQ5zRZ5Gf+3DQTWQQYJGdjum7ZGay9URQLBbbgRMFMzT5x0gxEKAUeMTc5R4YqiY70Sr73kVizbTJt9RyoCXF5nTli57PFuoRNrJTYfk7/YqZMb1qEvczJ47JKLldViaAjl1usqzLSGyHRvAgudXX3pOH4IaYYK1yC9SmCz0gThhRtEBjQFK/ZEJl9IIzh2lATPhfhrWw/Vv5cOQogy7tjhCmXwAZ5jPeMID7VSFy+y/akR3VyZwAJ+xtMXm+M/b4zDclRtZfkU7J/K5pqcDVtSY4gyhv1jMwsnv643Ps1/hbncK7doOelS0u45W+6veeImzOimRlLrW9UCzlJGTdxpVjHt9+ugnM+qnB3Dqdg2++O0+xIt+ndoecTl6HpwYPIMZXzg7VXhblJ90EtcRPsduO+P77a98XlzPcZFpW0RJHjHqGdzBorJjJ+OEtoC2+dPMQqjS9GnQBLDjbxTouBO7Cc4553TOnUX6aaPjYa+TMH7oxmMrfxVQIS7vUpf0lnrp5yFIGPHVhl1oCFIutZhCXRDX3ADxySJ+MtuxbX1xAB2io=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDNMZ0VOb3ZwaVJ4TVN2ODcxRjZ5Y3U1NVZqdVM3RUVhbjRYRSswbEg2Sk5z?=
 =?utf-8?B?NmJTd1pVdzM3WC9rMERTcUlndlZjeGY3TTJvYXRhckM4UkIvNWhXUVZuZXp5?=
 =?utf-8?B?TnFVTFFaNGtQOUhEU3ZDNVdkNWVmVnUwVVJrYTBhWFBPZmJWaTNDYTk1Mi85?=
 =?utf-8?B?M1NwcStVQ2IzaWdzWjlxL1RJK2grS1RRUUlPNjhYcnRXcGFQNlc5K3o5dVlP?=
 =?utf-8?B?dlRDWit1UDlna0Y1T1B5K2NBZzBYSFZpNXNCajhjcnN5bzJKZEJzR2dXTWFZ?=
 =?utf-8?B?T2I5bmlkOWppcXFjOHlOUW9nclBjQmd2eFgvdXBCM2M0Uy95eGZUMEllTi9J?=
 =?utf-8?B?cVRlL3RVVlRwZkdmRTJVSjVnb20vcVg1dWY5TjdmczFuZ2NFZnUvTWFjS0J0?=
 =?utf-8?B?elpkYmpVVXFuU0drSWpEbkl2bGpaUFl6TjVicUREUGMrcnh0TjRQSXp6TExE?=
 =?utf-8?B?OVF0VGFaUmlIK2Z5TUlaK3NBR0xaSSs5NFEvUHhIUGQrTkJqeC9yYW9xWFov?=
 =?utf-8?B?Q2pDTmJQRjQ2NkhDWUpyTEVhaCtFcXppZWZrazdmNkx5RXNWbTZLd1Y1Yjdu?=
 =?utf-8?B?b1JCNE12OGkwQ2hhRWNmT0VIL2wyMHNObU1LdXd0cmRIblp0WCtYbitpNU1R?=
 =?utf-8?B?UXROVmhnREpjK2lEQ3BYZjNpOWVxMWVwczk1VjlFTHcwUVNWNkFOaitMK3ow?=
 =?utf-8?B?OFg5RFFLRVVnL1djb2NHejBaWlU1aTQ5MDZvclVqcWdTamZpK0c5QWRiV0N0?=
 =?utf-8?B?VUp5dms1QkM1Q0M0ditLa3AwdTMwZjdFOHlRcnQrSURKblFHVlBRQk50NE5H?=
 =?utf-8?B?ajBHNTFVdCtHaWdXNHQwbEhJQm1GRGQ0VVhSeU9wQy9lM0lLOURhMzFKeUJU?=
 =?utf-8?B?YlYzNWJKUUM0M3JJSnVHRXluR1BKSy9NMmorNHd3UXZSN1M0SzJUTGtWZzVi?=
 =?utf-8?B?TEZrNnYrU3V2QUZBenhzY0JBdThkK1M2ZEZIYy9CaTQyclNPYVRQaW9BWTY4?=
 =?utf-8?B?WUMyWkVTRVV4ZSs3dGVoNWhDZ05qS3FNOTd2Q2lHSHVqd1R1c21jak85TjQr?=
 =?utf-8?B?c1FCOVU5VHF4VTVHNlVoZkFkRktIeTQ4Z1A4SHFxL3VYZ3VYTm1mbzB1V1lQ?=
 =?utf-8?B?R3JvMkFsNzh2RXZ4SC9RbmNjVzdwK0xyWGcvVHJJak84STJmN2U5R1VWbno3?=
 =?utf-8?B?aHZDejB2QWJva3drSlRoenhjckhhY1U0eXQ5OG9nbVVjOGhDdm1tT0JyS3Fz?=
 =?utf-8?B?aFBQWWViS3FUR2l4YzM5ZG9lekEzeGdtOHVmOGtvVGkzZi9jTjFCTU9iYWVG?=
 =?utf-8?B?UzIwellaKzV4Rmlmemc1WFdxNWZ5VllUTXVESGxjRVB2NFc5aDJ6azhzRGtC?=
 =?utf-8?B?UmZKbS90UHpOdXUvRUZzSWNGcFBiNW44WFhBbEZnUnVxZmNtUGhoZUo5enBH?=
 =?utf-8?B?K1QzTGtpbGc3cXVIeDU2NmU1eFZXazREejVlM3IrM0hVRS9PUE5wWThIVzJE?=
 =?utf-8?B?VG43SXZ4M1pPRDdsVXRYcFd3TFJUaFY1L1NQbzIvcHZxbEVQZ2JqOUVQVW5i?=
 =?utf-8?B?d1pxTzlsdTMyUGJqYzdHNzdpUVJYcDRrZkFCeDBpUTUyQk5LNytuWHAvci9V?=
 =?utf-8?B?TWJYNWUyKzdVcVNqclRUK3hkSVdpcUwxNk1ZU1JsQVBZVjVzUzd3UDJQQlBq?=
 =?utf-8?B?MHhMRld0NDBIOVkya1ZHaVRrUDdicmpPR3VINXdGbW1yRnhPYmIwWXBTVjNV?=
 =?utf-8?B?VHFOY2x1U2NjeC9FbkxNOU9yZDlvM28rdkNORVllNHBXUmRvMXF2dGZTd0JY?=
 =?utf-8?B?UXZYQ3ZLMHBEejRNa1VlR2hjWTVqNC9KZHZIL1A0QVE4c0RIR2ZaZTg3bFlL?=
 =?utf-8?B?WkVDOWlVbXNrLzVvMlRndjFZNDZ3OXlPNGVUTU5RNTlYLzdUNlMzRmlUMGli?=
 =?utf-8?B?QitzaHRTdHk4MkorMTJ0OThNdjZnWkNuSHdjSHd4Y2FhR0NveGk5b01WRCtN?=
 =?utf-8?B?eXVKTkZLQjY4ckw5VkZxZ1B6em1MalJlWStSNzJkTjFnNlVJYjdLUmg0YmF6?=
 =?utf-8?B?b0pPV21tbDAyRGVmOUxaOWpDOCtTcWhpYWlUSzU0b040LzNYRmNmblk4V3k4?=
 =?utf-8?B?S3pQRW95RlltMWF4QnVuV2E5QkxrcGR1YW9RVUdEVFQwYktNMXdUVnQySEdq?=
 =?utf-8?B?TTY4UCtFWTVadmdzVXRpZ09UcmdYbHVJTjkwOFk5ZkQwc3VBcTZVZldSSUVG?=
 =?utf-8?B?T1BBWkNuclNJcVRNajExMFZnSVI4L0ZYaGNvcW96WVpFbGxIb1RCbWtsUHpO?=
 =?utf-8?B?dDUxTDhTRTJqenhxMVFxYmh6T2V3NDFNaDB3NFVhakhaNkFqakRKUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9bc5c29-8c3a-461f-96c9-08df08e584c2
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 11:29:57.9565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ThIvg4INEe9SGaeyO3dCuXKCaeg2794g56xFvZfdPjo/qsHSR01qvSnZvbtfLfdyabUYENNFgNxZ/qdzHnK4VAAhGsrJl8r3sPQWthGjbHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB7015
X-purgate-ID: tlsNG-ef75cf/1788348602-A68D9AE4-08FB35C6/0/0
X-purgate-type: clean
X-purgate-size: 444

On 02/09/2026 7:30 am, Jan Beulich wrote:
> Doing so, besides being a bad idea in general, violates Misra rule 11.8.
> Use the helper macro we have available anyway.
>
> No functional change intended.
>
> Fixes: f1879b2c2584 ("xen: introduce generic non-atomic test_*bit()")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I really want to kill ADDR, not expand it's use.

I'll do a series and pull this patch into it.

~Andrew

