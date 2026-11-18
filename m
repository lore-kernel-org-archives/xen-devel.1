Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E532606A325
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 11:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=aXPN4L7n
Received: from list by lists.xenproject.org with outflank-mailman.1494346.1693953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTeEH-0007oR-Aw; Wed, 18 Nov 2026 11:53:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494346.1693953; Wed, 18 Nov 2026 11:53:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTeEH-0007oK-85; Wed, 18 Nov 2026 11:53:33 +0000
Received: by outflank-mailman (input) for mailman id 1494346;
 Wed, 18 Nov 2026 11:53:31 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTeEF-0007nj-Dt
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 11:53:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTeEE-003KaT-Pf
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 12:53:30 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6afd91ae-bab6-0a2a0a5309dd-0a2a4504815c-34
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 12:53:30 +0100
Received: from [40.93.196.43]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6afd91b9-b57f-0a2a45040019-285dc42b139f-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 12:53:30 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by PH0PR03MB989481.namprd03.prod.outlook.com (2603:10b6:510:114::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 11:53:27 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 11:53:27 +0000
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
 b=UWneE1HI2i3pfAP3LMmLDYpYI3g/tyZ72Dtj5XPXDTuUtKpkQmgnur4E+bdlkUU7MQ7NQOGt0tcqwKXva7XGueFT4CbTVOT6bCa/TlhETXrD7B6OYuEk3/OnXQMTzXnccUjtnHwL6/0mU8tLaXf3+HJcFap0LXTmdiR8p53TO0NwfT9uWzkKRCYOfCdhPQUiandw4+PgWML2azvQYCdyN4i7j2o1eRUAYYiuhMCJXh4wf1QZr6cmcM3hwyth16IJZqFVbz+3WpzLmfcIBAhoSTbgvuRndjRqB2eL9kcb8Ryi+tc70Ig4s4y0K+VWCqVGGoigjNAMY7u4dYND33EIsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0kHR+0ATyqb9XefVDPeK+xybhnYCaFOdT86Z/0ACsv0=;
 b=IHdGMwkJ9gtt3PFQPoK0XRVaDCUIYCY7nIUGAZxV1hxekuPQNUpE/sh/+7HKgDq1JviNRI9XPaEZJ4OkgunalKGvrckQHF5JkrViAE2N37SqZ8hr6FlwhGRLK8/sO79k/fkcmTqquS6PpRS//7RuazvCvG/hn3xZxCcq8qRwgwrRHJUn8EAscLi1+eUkDlVoc+KsFP49kbU+XOOanzt5jASKWhRPSMnkiKObSu+JPbz89qriw8unl9VA/ZH54qorsz2EHomMn0I/3RJ1pMjyuEI1GhAUCxQMqjmS0ncIURsOiPWkBOewACRO24g/EYgs5suaolbTsOGt8F5mmm28bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kHR+0ATyqb9XefVDPeK+xybhnYCaFOdT86Z/0ACsv0=;
 b=aXPN4L7nsMzDhnmh6iIX+xqYdGxGxUX34fnSxld+cBzcCuBEF3Cd3xDIMNS35IL/a5J4rd25sOp0cAOwMiEOz5tdqKdbRTyUT7hElFT6wcVxhnLM4ADGoepH5bvy/LO1toLMkx+qyGZme0qD5vRCe3FJjCr7+nVO9363Z2U1f+s=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <681db7f2-8c68-4e92-8278-681cbafa41a1@citrix.com>
Date: Wed, 18 Nov 2026 11:53:23 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/build-id: Introduce is_gnu_build_id()
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261117202244.4054656-1-andrew.cooper3@citrix.com>
 <20261117202244.4054656-2-andrew.cooper3@citrix.com>
 <488b0f8f-c62e-4de7-bf1c-ae5fdaa75a5a@suse.com>
 <7db862cd-7082-4a3c-a839-1679d956ba9c@citrix.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <7db862cd-7082-4a3c-a839-1679d956ba9c@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0359.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::22) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|PH0PR03MB989481:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e14c8b0-d047-452b-c4c4-08df456a8e8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|56012099006|261022105027099003|4143699003|11063799006|10067099003|261026140227099003|261028144727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3rktKutcYA5lA84mlvB+Q5FqNP253OIUyTJhPSWR7bagQhzxH0BD1/ewCi5iAdqKs8DRABvq5m7G9oRQQ+gdZzWXakenCBo3B8PCn/JPtpbDwqMUx946ttQ2KPzNYpV9xHS+nsSg7fR8L65y4kwozrUD05siEqt74YuRf6SBO8LJ1Zvk0XxGLhop+ThX00DqOX0d95FRCFiRICFvXZaxEDamcLTG/BTCC2ghDpBWbIro0IFCnM/QloJjLaE21QxuyfU5YYcGqwbRGq9u83ARPp758xDgQyu+ffrSfnzhrJQ+cJHDksqEE/T2q3tsChQpXdnXtl+3qwJszNaGwjz7dCKWP3Oy1aQ+1dH3rglzWqRd6v2EpGis/KAUNgnkR2vpR1lVmr3V7dDem2G1pSr7S3jjNXdAXvasITNFMykDWz+TWWxEQv5E+O7LS83j1Y2Hv+jw0x4Wc2yso8DhBWGimdYVId4TLhxWOdxzn7AgwP7wUwI1dVZ/SZa01xu/XZnxaKXpkBmSEusR8uBqhnoWAOAXuWZT+7O7br3fwv67Gpq0e9e9ITuQSnRNmH3StkL6nOS98DNEDtErqrS8QTZz8RhlaYLNpGn4Rn6cv9M/x235GFFlLECfib+M/j6S6Lj1PhgToOHu7H03b/fu62wT7nQDAeGABruoJac9Yq6qeVk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(261022105027099003)(4143699003)(11063799006)(10067099003)(261026140227099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejZCbFB2OWw0b3pOcnpKSjdic1NkZnQxRUk4YWhJYTJZTytqZHhLT1BqUXR5?=
 =?utf-8?B?dVVoc2xOd3dIcEIzZW9NbjNUenhVMXdWdSs5dVRpaHNSeGNNZlFzalBkT3NO?=
 =?utf-8?B?UXUrU3dyRmVEQWpVU21kRmxVb0R3Y1p3ZVYwMkZ2MVlXdTN2QnFiM3BhakdI?=
 =?utf-8?B?T3lISkczVldKK0cwQURhdjdiV0UvN2RyOTVIZ0FwcTQwcVpYOUNEMEpCZWY3?=
 =?utf-8?B?YjUwbkNpd0xQYVE3aEVqVk9lY2RJWElVY2c5U1lQby9WVUNRMDVUSzg5UkN2?=
 =?utf-8?B?VU9tU2FxZHg2SHl0Zys3b1VWR0hsODd3ek5QYWNhNmlZQ0tqbzRZNWtaSjRJ?=
 =?utf-8?B?L3lCdVEzUjZtOE1ZZWs5dXNXaEVtVU9yNEgvYllRYUh0NzYwVWFxNS8wYlkr?=
 =?utf-8?B?QldIMzNnbWh2aWRwZlA4eFhIV1RPK0Y0NUhVaWVBbjB0UDVWY3hCbUpWVzJE?=
 =?utf-8?B?cjVMbkpPODlrdk1acFJqVzNrZlVCZFhlZ3hhY2JRQ1pnTUJZa2FObDhhcVcw?=
 =?utf-8?B?TmFHOFVtTmFERTJnb2dmeEJ0NHNTbldLNjk2c0VxekNvcHBTYlJ6djBueGRL?=
 =?utf-8?B?N3dJVUZJNlhEU1M4VzNwUWdIbHlweUtRSnFuV2prNGRzeHY5QUc0K3d1TGRo?=
 =?utf-8?B?bWk2Tytka1JLV3NpNzgySVV2NUNLWkdpblJ4RkVpbTFINkVRWXZuZk9IWmFJ?=
 =?utf-8?B?UmxOazVWelhrVVc0YXpMUW0zVTJqUDhIZVhsMHBSMStvRVhhZmRDMnJIeFpH?=
 =?utf-8?B?VzZ2ZEE2VjFqVUlSd0VMckNLWC8rZmpzbWpxSFRMc0lGRWh1NUhKcXNMb3JE?=
 =?utf-8?B?NlQzZXJLMjJzaWtScENrdnBlM0pnUkJsWXczWC81eGhrSmFWUGkvaGdFNHZB?=
 =?utf-8?B?VGExTy9ISjBwS3k3REFYODhrOXhqN3AwRnkvbmtyalQ2UTFYcVo4R3lxdGEx?=
 =?utf-8?B?MVFRRmlXck1UUXFiUnVSZnlVSUpkV0F4aTJkWXdUdTVWTUNZZWc4SFV1Ym0w?=
 =?utf-8?B?RUFidmQrUVZMejU0OXlEaGZmcXVIU1JWWnA5RnRRVUdmelZtaTRxZGZwU0tw?=
 =?utf-8?B?SjRlajZBV1gvcEo0RGVsc2lKa1lhOTBxUkNjOXZudDF3WXV5cUJwemxuYito?=
 =?utf-8?B?TUJ2M0o3RllJOHpHYjluVkd0NDdlYlhnaFFQUW1yeXJyRUNka2F6SExvbmkw?=
 =?utf-8?B?Wko1aU56Ly9TbmlFNUlUZ2h2YUpIZU84Qy83dytjNWVoYTEwa1hoRHJCNDBL?=
 =?utf-8?B?ZldCYmJlWVdkc2F6SWhMQlNYQzl5Tk1lRHFLbjc1Z09RazNBZlFxQURRblZW?=
 =?utf-8?B?NWZQd0tsR0FkZm80T29yRkJlOXk4QWsyMEZvV3pBVTQ1ZmZ1Y1h2TXpyVEdN?=
 =?utf-8?B?NC9oMnhxdjM5MkFZMlVXbVl4blBRSlk4YmJLZUZBU1VIVEsva3lRR3FmbklE?=
 =?utf-8?B?U0JXbW5Kc3ZMbFlXdThPWkZQblM1b3luUzI3ZEUwOFcyVWR0K1dibVJBNjM0?=
 =?utf-8?B?eGhDdGlrRmxGbWdoTUZEdkYzSWdpYnZkZGtGMVBQRVhmYnVsT3c3eXlLRXdC?=
 =?utf-8?B?akNMdEdzcEplNDRtZXV1TW1OOTZFamFBeDdzK2ovaENzdjE0SmxSV1dMSGUx?=
 =?utf-8?B?RjR0b09RbEVBa0gyZHB1d1BqaGR3S0ZuUHZ0d2F2UWcrdzNMdCs5WFJ0ZGtF?=
 =?utf-8?B?M01INkJJY0FxRDlrQTM4TzRnbTdDWWZBY0dJa2J0TytPaS9kTHM2amtuSlN3?=
 =?utf-8?B?SldGKzVtcU1WY3ZEajM1aW5JQ3BhMlBmQkg0QTB1WkpGTHk1ZGxyc3ZrekRM?=
 =?utf-8?B?WXFhdTVDVzRib0xRamg3THh4Mk9MQTF6ZUhUNXdnMlB6TjV5ZUoxanhlL1hV?=
 =?utf-8?B?TkJJV1g2RTg0K09FblBQUFhTbXV1Z2tjb0ZVMEM1ZFRMNkZPUXNyclpyWHFj?=
 =?utf-8?B?NkNNYXB5NnBLTUNGbC90eTBwSEVCQWNuY2JzcG8yZnpDQmhyN2owS3Z6UXh4?=
 =?utf-8?B?Yk82SjgzZXFuQit4ZXlMc2JWOHRHcmlJNGthdmhsWVFqTVhaYzJlakdTZTZU?=
 =?utf-8?B?YkU5ZW14TDlZRnRreXdpR2FrMDhneUlpTEkyOEh1c3pvcGwwSm1XbHdLUkU5?=
 =?utf-8?B?ZDNIdFlTbEF6RFlhVUpLTEFkcW5ZT1FCcG50VG9OVUxNeVZDUWNhTkJkVUxI?=
 =?utf-8?B?Q2FnVVBFS24zSTZIdXZQRTZyTWNadkcrZXRkUTU2L1hraW93RGcrTDFqQVN1?=
 =?utf-8?B?RFVsMStjUWpQN0ZZVTZnY1hNTDFNRTNOekhDNFpNaWE0cGdUQXZEOC9Vamxl?=
 =?utf-8?B?TG4xUkZQQ2tCeUpQaE1wN3Z5MDRITUtEcndUazVzSXN1ZEVTN1RYVzlNVkhG?=
 =?utf-8?Q?DNTUHRQMRpRdd+4E=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e14c8b0-d047-452b-c4c4-08df456a8e8e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 11:53:27.1191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lwJLYdLDy3rmDNIT35KV3RtMwNPLI3z7DAXC7g7+mBXRD07eruGJeY896oKeO4IOyx0OqLtzVDUtgmOkkFrNJwbylnsfh2a7q+Gl47HVgaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB989481
X-purgate-ID: tlsNG-ebf023/1795002810-516D2B50-1F7DC087/10/78276251493
X-purgate-type: spam
X-purgate-size: 895
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/18/26 10:51 AM, Andrew Cooper wrote:
> On 18/11/2026 8:51 am, Jan Beulich wrote:
>> On 17.11.2026 21:22, Andrew Cooper wrote:
>>> Broken out of the subsequent change for legibility reasons.  It will be used
>>> to replace xen_build_id_check().
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
> 
> Thanks, but it's just occurred to me that I need to make the logic:
> 
>      if ( n->descsz == 0 ||
>           n->descsz > (len - NT_GNU_BUILD_ID) )
>          return false;
> 
> to retain the property of rejecting a zero-size note, now that descsz is
> not strictly checked against a length that was confirmed to be 17 or more.
> 
> I'll fold this in on commit.

Shouldn't this be NT_GNU_HDR_SIZE, not NT_GNU_BUILD_ID?

With that change,

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

