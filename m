Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B7A606A31B
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 03:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=hSRVmT+y
Received: from list by lists.xenproject.org with outflank-mailman.1476118.1682379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPAdw-0000TC-QY; Fri, 06 Nov 2026 03:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1476118.1682379; Fri, 06 Nov 2026 03:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPAdw-0000T5-NS; Fri, 06 Nov 2026 03:29:32 +0000
Received: by outflank-mailman (input) for mailman id 1476118;
 Fri, 06 Nov 2026 03:29:31 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stephen.cheng@citrix.com>) id 1xPAdv-0000Sz-JH
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 03:29:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPAdv-005eFV-07
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 04:29:31 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6aed4958-bab6-0a2a0a5309dd-0a2a4508cdd0-18
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 04:29:30 +0100
Received: from [52.101.46.50]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6aed4999-f659-0a2a45080019-34652e324259-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 04:29:30 +0100
Received: from CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
 by MN2PR03MB5277.namprd03.prod.outlook.com (2603:10b6:208:1e8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 03:27:54 +0000
Received: from CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767]) by CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767%4]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 03:27:54 +0000
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
 b=ydGM83LXAQNI+iaTbglh+G7pmEqmPjkjah1G6+1ceywS9JobBhMqyP2VwXS6wG7lDj8opmzLIL9O6gZUjVEKypKJq9P5ZwF3UNE6xsihJA3983BFO3e3H1baLj/p4z9uOuOJ7k9K0dh6lRShjVij+YAPllKfzSWPRGr6/iWJgAnWL7upS2HBMBwhM8IgiSkWqlkKz36E9O1hFkzfn51kTmM9/9bO813KtYICW5PHUjR9GTDb0/OnEft2C8k92hIkvDVxUSbiN+I2EuEx7WqgoC09lpnrsZQOjTnY47gppMfdjVOuYJCTv5aIq4M7HXHzSvFT6cwOF8rQm3YfV8XwFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TW4Zg6wX/9RAL3RGKBL/cmC3vJcYfoyPIF48ABGX0hY=;
 b=hf+H409WxGoKAF/9+9URcIVNVO4g8fmgNNS6jTlq3UtZ4WnObJBMUdxy+b/duEeJCRqT/r09bWrWZSkYlwvS2RrplJijwFClUvlmJJPaYW0lhhfhlMQNHrwo5Ar8ebDzGXN5TN9XSVQaFm2IpLriHeE4v5njU0SpBY5WSROYM0e7wibr6TB/hgXkE9WipjNqKRB7q/DKTPlX/EW1GNvAf+arsXvGqov9DyqQS2zH/0v+7pXjAqqwqhybmHcacneNRWo5Jl3RFqcheJxanPZ8QNAjoHnYh4CVOKPvZVWaI9EDoXEfD+XLIT87FTMW6P2EgI74jdKfnBBolegdhPVAoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TW4Zg6wX/9RAL3RGKBL/cmC3vJcYfoyPIF48ABGX0hY=;
 b=hSRVmT+yQQeUi0fPnmzgTR7VjOXLkHXJEcdgqmAiZsczoZSQJp8Vh7kXHXUr9w0W9Peh0mJAWR6XRLw62dO3opxJg178AlRCrSkI1Q+9RSJgnAuzvoPqaz3V4bqMRKmO5FWZvRDklSAQKgpiFQONvDEwpSwwrpkyqJ8378E4hWg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Stephen Cheng <stephen.cheng@citrix.com>
To: ross.lagerwall@citrix.com
Cc: abdelkareem.abdelsaamad@citrix.com,
	andrew.cooper3@citrix.com,
	jason.andryuk@amd.com,
	jbeulich@suse.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	xen-devel@lists.xenproject.org,
	Stephen Cheng <stephen.cheng@citrix.com>
Subject: Re: [PATCH] x86/nsvm: Fix L2 VINTR intercept merging when only Xen intercepts L1
Date: Fri,  6 Nov 2026 11:27:25 +0800
Message-ID: <20261106032725.1054979-1-stephen.cheng@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <e3105225-de64-49e1-9254-45917ad5bb13@citrix.com>
References: <e3105225-de64-49e1-9254-45917ad5bb13@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: JN3P275CA0038.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:ca::15)
 To CH5PR03MB7887.namprd03.prod.outlook.com (2603:10b6:610:20d::20)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB7889:EE_|MN2PR03MB5277:EE_
X-MS-Office365-Filtering-Correlation-Id: d75d01eb-d094-400c-8dfc-08df3bb5f123
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|10067099003|56012099006|261021123027099003|11063799006|5023799004|261102123227099003|261022075727099003|261021121427099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	2Cj/730sTM5wd/vG5g5DIhtwxGBMuGLSrP+z+5C5MZnTUnB7ts+qbYxYgKkbiWlUVKO7tacK0P2J62eDCxf8/D/HiY4d1B/CGwdLZyz+g3Cr8XCiStPyLJu+yDgKTdty5fqftjvjO3fq753ohW6xYUITp5kTVl/qTUzpwyVAcL+iG7lNhkRRLBqtVqE8iJ5zd8kU6a2H0O6VywrA4juedaAzQSH/5MEYOykUZllO8R49oRnu2VYKzANQxV3C8cIS1PN+iSwvaxQA65KzHNzKiZnd2LCj1R9etztdDzF2kfuk8XttzAlnYJTWLwUketue8RPaM3bPU+ScA1XVCCisjxbvawrJuc61XpGKP1JAG4tIzDJcJTPQMv7H7Dxd+DMZyu4kpvI6PxnU4XOQEoGSjpXuXacMKKdYPApL7Wc2mQeI3HHhnhLem6gbztfCGQmaoUQkWev0wwzygU41V5TQ5F1+jaOGVAlW9l1lrSCsuUDbirplzuLCsuASzyrVaqSJW0Ti89D64UwsJK+1niB1FE5yQGo1llEY3PKi/djVsnolX/Su3a0A17ssDWxb/obn5WjA5QXFeKbyG8J1fWtg22e271Bpz1PIPzPhlIPEHZLjnRy7MzxxNxOg4/AggiYcbzf5w19AVUFG2ihvR5iqMC3Lk6yELf3pZHpRDjC0bMk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB7889.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(10067099003)(56012099006)(261021123027099003)(11063799006)(5023799004)(261102123227099003)(261022075727099003)(261021121427099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1M5RHdjNXZUWnc5SlFOWkl1cEtpU2orNU0vWDl1eW40ZHFXZFEvWlVZZjBm?=
 =?utf-8?B?OTJTak9OSDdReDR4R2s3TG1lemJPKzhhOVdKUGh3RUZ1TUtpL2ZuZUxaS01s?=
 =?utf-8?B?cmJmeU8xdFhHQzkvN2ZKOGg3WFBRUXc5dWdIdThkS29vRk55c0EvMXRCVzJD?=
 =?utf-8?B?QzV6T01Kb3RTV3ZKcThpL2xpUERlME5CWU9TdysxeWNqRUZ4ZzhkWG1SamZB?=
 =?utf-8?B?YkQvY2YyaHg5RTNlZlgrZGRtZEVtOWovOTFab3hvUS9acGpTdDFaejY5NU9E?=
 =?utf-8?B?dStmZVoyNkEvQ3pGcGp6dC9LN2tVaCtBRTJBaWk0U0ZBbXhOK052M05hZ1Zk?=
 =?utf-8?B?UlpISjlwQzRZbFdXSXRaZCtsTFU1VmF6K1hOUjdjZFcyYVJOU0poMHRlaXNz?=
 =?utf-8?B?SjhRQnpCMHBMeXo2ZlJhVm5qbEpnMTBGYXVGejZMQkE4dUpVdWxHbEZzNWVp?=
 =?utf-8?B?dGM1RVh6QUhzUWFJOG1tT25vd0VQNkxXOXBmckZuZXV0bjBKOGkrUGpnTVZV?=
 =?utf-8?B?NExkYXpUUVY2SXJtbENSZkU0U3ZKaXFJMDZxTzhONFBVVVhueTlYcG00Qjd3?=
 =?utf-8?B?L1FyU3RPN3o3OUhMWXlVbG55L3BLZ3JWVjhBRzFQYWpVWWlxMGNVczVoaHds?=
 =?utf-8?B?QmNMVW54VU8yd2pYOWRvdkJVS3RxdEJzc2F6elhQbmNUT1dNaEZUQmtvbkwx?=
 =?utf-8?B?NFI4UmRqSE8yeWx2Sk9iTVhWMlY2cE9sRzNDN1JjZ09UbFhNL21vUnlhQ2pM?=
 =?utf-8?B?dWtNRGttRGdyaHhDcWRDeE8zZDRlQXdBaUtiSzRaQ1Z4Z3hzOGhCbUw1aXha?=
 =?utf-8?B?bjd6aGhKOTFKU0pJeEl3TWZ1R0k3QkwrcGlNUTRLT256MkQwLzNaU3RYT0tM?=
 =?utf-8?B?MDFJVGRSdUxUUGpCdGJOK01OcXVFM2NNVlhuQUg0Nkw1dFQ3VkU4dUlLTEpT?=
 =?utf-8?B?U29WQlRoTkx1YXc1d0JUa1pVL0ZDVlBqeEZtNHZvSVBRaGx0ZnIxcWt0V0xB?=
 =?utf-8?B?S090YUIrYktteHZ0Q05IMzFhWVp5SXlGdEZBUHRQT1NKWWVKcXJKTEdWRmF4?=
 =?utf-8?B?eVE0d2hrNDJDZ2NPVDJpSWVJOTdHeXJUY0NWYTdWZWdERFZIWFlzT2lIdGQy?=
 =?utf-8?B?eEE5TG9teWxZWUlmczhxbEFYTXpoaGtDQytoSTl5aHorVEJsOThYQytpMUhU?=
 =?utf-8?B?TTlUYk0wblFqZTJhWGI1TWVHejNHbWNRelAzWnVrbkJ5dEFLcUFUTmdqU2ZR?=
 =?utf-8?B?eFhmVEptSmsrbzZoVTB2RkJtRmtTTVNFQkphZG1kbE95TlNVWmMxL1V6WGZs?=
 =?utf-8?B?bFpuOENKNjJxYm9pV3lNWlg3amVHNjh4YTZzZnR6cWdDbVoxR2MzTFVqOVhO?=
 =?utf-8?B?Qzk2Z3VtUlVxZnl2TmRoTlZEZU03WnhvbVJWVWpLWUk1TzRoQ01NZTFKS2Rh?=
 =?utf-8?B?QlNQU0ZZYVhGMkpIZjV5WVBDNnYrYmVqYllsZnJQMjUydjROT05OZzZ3cmxl?=
 =?utf-8?B?aXR5UGJ5OFZEQktleW1iZEN5QklKWUtoanZ6Mmx3eTI3eHVxV2NlZFM3TVZX?=
 =?utf-8?B?QThrQkR5TmJhZzQwVU5CRlFGd3Vzb2JRT05nY2kxOUVmem1mZ1BwblhRVzRh?=
 =?utf-8?B?L1pxRngvNEpYZFJleTVIN0xTQWduU0pmRW9vVkUvWlA5UnhOZmhaQWl3eHU3?=
 =?utf-8?B?ZTNWK0xTYy9JQUVRTXlIMDdUMHNUOXJCTTQvSGoweDN5Vnd0dDQ2dUNvVEMw?=
 =?utf-8?B?STVBTU14SENma3dvUzFncnU0QU1MeGRJbW9qZnhQZ0c0UHNVdytkbWlIeWVl?=
 =?utf-8?B?ODdjZlI0eThVTXMrYTJlZGxCdmJibTN5cDY3RFczUkZ1cUNHb0VnemZ3Qkdq?=
 =?utf-8?B?dWRMNExYUE1uWkdQaDlwQ1MreTVTbFZ5VFdqSjNkYlFwckphbldGelB3U29W?=
 =?utf-8?B?Skpja1RpaFNVN0krSnRLUE1CMHROWkdlNHAyZTlORFJwOUp0R0laUlEvZnBR?=
 =?utf-8?B?WHJTdjdrMDBrUGQ1VVhIY1h1Z0llY0hUT3owMnk1YVZxVEtOR3hXZkgrRElD?=
 =?utf-8?B?TW9vMXlxYTBTQTIwRlhqeFYvOHowcVdHZVUrc05yRCtZWE1zZWdxOVlsNTh6?=
 =?utf-8?B?djBSbzZiNFpTU3lXY0VlNTR2KzFydzByRU5pbVhYWEhjVXRjcFo0OXB3RkVz?=
 =?utf-8?B?QUNKY3pXTXdVQzhIOWFveC9xTWF0ZjFyNXpXTnMwU2JYSVU3eU5NWDZ2Y2JV?=
 =?utf-8?B?UFQ3NTlIQnFrMHBSenViRDlQbEdxYm1BaW41MmdYakNFczZueGV2bWRqU2hV?=
 =?utf-8?B?dkFkL3NhSXZ6L1VjVHZ0ZWF1Q2JZSTRFR1N3NGEzcnNhUWNHcENTQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d75d01eb-d094-400c-8dfc-08df3bb5f123
X-MS-Exchange-CrossTenant-AuthSource: CH5PR03MB7887.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 03:27:54.4889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EnwYaFkTFTXu3fnj6+zIRelrJ+ObKX3euks4uceuMX3YCL9pcAqrCGGKdEShWyxW3i2+ZZQPW+R/lfx40AjdfwpVMtTKhbfsbKJB5EFqnJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5277
X-purgate-ID: tlsNG-c1860d/1793935770-CC77387B-433F4796/0/0
X-purgate-type: clean
X-purgate-size: 1217
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 05/11/2026 14:16, Ross Lagerwall wrote:
> If L0 wants to inject an interrupt but the VINTR intercept is not enabled, how
> would it detect when it can inject the interrupt? In particular, if VMCB(1-2)
> has V_INTR_MASKING=0 and L2 sets EFLAGS.IF=1, the interrupt should be
> delivered but L0 won't notice.

Thanks, you are right. I missed this case.

But I think the current code does not handle this case either. L0's
dummy V_IRQ is not copied into VMCB(0-2). The V_IRQ in VMCB(0-2) comes
from VMCB(1-2). So the merged VINTR intercept only fires when L1 itself
has a V_IRQ pending for L2. If L1 has nothing pending, L0 also does not
notice when L2 sets EFLAGS.IF today. And when the intercept does fire,
the VMEXIT_VINTR handler clears L1's V_IRQ. This is the bug this patch
wants to fix.

My suggestion for this patch is to only remove the intercept when
ns_hostflags.vintrmask && !ns_hostflags.rflagsif. In this case no L1
interrupt can be delivered while L2 runs, so L0 does not need the
window. For the other cases, Xen needs to put its dummy V_IRQ into
VMCB(0-2) together with the intercept, and restore L1's V_IRQ later if
L1 had one.

Please drop my Reviewed-by for now.

Stephen

