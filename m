Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CE1606A68F
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 16:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=JgE7kZo9
Received: from list by lists.xenproject.org with outflank-mailman.1501316.1697428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVtkP-0003dC-Qy; Tue, 24 Nov 2026 16:52:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501316.1697428; Tue, 24 Nov 2026 16:52:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVtkP-0003cN-My; Tue, 24 Nov 2026 16:52:01 +0000
Received: by outflank-mailman (input) for mailman id 1501316;
 Tue, 24 Nov 2026 16:52:01 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVtkO-0003Yg-Rn
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 16:52:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVtkO-004DEj-7s
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 17:52:00 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b05c0a8-8faa-0a2a0a5109dd-0a2a450bd572-16
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 17:52:00 +0100
Received: from [40.107.208.52]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b05c0ae-b7e8-0a2a450b0019-286bd034a35c-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 17:51:59 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MW4PR03MB6364.namprd03.prod.outlook.com (2603:10b6:303:11f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 16:51:01 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0662.001; Tue, 24 Nov 2026
 16:51:01 +0000
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
 b=gbQEckCtNdGBaYJci9HfPoLCUcjyMF4FwNbwPvXnHZ8Zw+GPyQ2oPNtur8mEjZVinrYVaKnuFkUrOgN2bro3hfooyWNGEVkT47ExuH4SKvy8U+4B9bAE0/VMtUhMHBzDT0UMMuOsKzK1at40sgHsaxWUlvhmPwTv6D/mGcoV43VxyUBjY1mhl9XwPB8R30Q+hG4eztdFF9BpKhrSMZ7FBNIltm0Sv0a49hmQd+QeGYqXLpISn8FcHd41k5bWCvuEfF1L8ESv5RJSdz+Ef8gZFdMvixcpbzKb5iQcZZhiKeEsw53xGb+Qo1BHpXE9kO7eB4SdJYL6BSXfXKzMVJFPLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEWWvLlUhTn5ko0WECcscRN6dXP6/v9CVmy9p4T1gqc=;
 b=sQqZPEk3YlB5b/K0qzM1tGSqYDjnQ1LZMR1no+93IuhmHeAkEKYEHQm0MFPGG8DHRB3wWbLmiJOv7FUR0W6v2ByShvppLsE0d6KJFrChINFoZwQXOZFg+QIm7ScUIHYYHbahnEx/dwTF/mbsvjvn3WD1PtIXKQjaRiVsvX+z2+VNZLL2SdcklhoPvU8+hqeyWGuBw+iNetP2Stqv53iNMUwn79NlDAVVjQvuaik+MCrmdEdR7KNd644n1ccilXf9k6cKvgsR1QQBlBeekzcUH9o3VeOyTmjERyuaJOfMNbrr7HBDHnpbKO6fHqIwUsu/Xr/t7RMtsfBehXqt2TmnDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEWWvLlUhTn5ko0WECcscRN6dXP6/v9CVmy9p4T1gqc=;
 b=JgE7kZo9i61d+30JolOw3+NjGghBxYD2g04gq3mopwA69pajGpXFeR0iCYHcpJEUiMdn3PGYxRNu2sahS+tSNU8/d3y60MmXkbm7ccc7W3f/bmeYmfwidl+CIyG32fnix3of/R7f/1FO5timfZlFb747wkAB8qinUS4LiPkbjAM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2ffee613-bcb0-4039-aae2-b920aa359ae2@citrix.com>
Date: Tue, 24 Nov 2026 16:50:57 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH] x86emul: ignore XOP.W for TBM insns in 32-bit mode
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b95feaa6-2e17-4999-8218-60e1c742eb70@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b95feaa6-2e17-4999-8218-60e1c742eb70@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0319.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MW4PR03MB6364:EE_
X-MS-Office365-Filtering-Correlation-Id: 989c0327-5452-4d58-eed1-08df4a4b1ef1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|6133799003|18002099003|22082099003|3023799007|261021121427099003|261022105027099003|261102123227099003|261026140227099003|261028144727099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	dlosMlHKWLgjVQmBkQ7S7ovKexm78btfjx5Tb8Alc96OSCYeQMWZ4ayCvp62SvyCc4x9ADpjoCENciStWghlHwnkQbhSXFj+tsy+97cWLoD3xwoQpwpQ13uJFYdP2qm2tjYKFqwJACLKkLvyq11b1f4ixWMJPbB9FrFn8VqzxRO1sE4phA18105g6IRIC2mpUjzOqbS9UFdgBhfN5nKu/uT0EeGqf4Y4H2Xb0utgC5zmKR/HpZOzD1zWeVWiuxspmahLbwi7Dfp//tMic67MWV4AvtBGmJojPF/tnQR86uq7EHnJbv7JOQnbhO96Comk1AerYIRLQ3k9l6k1O0iqhzaMc4prc1U3jYfYrd7rNUC5wiGGvKJB5bISPQWQ8wgkddfftFlmqOIJNbmrH8LtLC6wy1FZE5ewoSXOJjLq9DInFCGy/l0Bd0J+oFDVOfBKsMG7R0tn/CyQIv2XFBiXwor/C8fqS69CoGutJSuhCqBI2IXY6OSO6fiK0pPPYtGdrrnz0GFYwvvhhz0L4Jh+ph67BamWXvARQ0IlzILb8Sz9ASiZZ2xjN972gb0cez3vPazpWBQ2D7DBaMZxL4aAp8/Gbq4IgvdZfaatIR0nC2RMsCNFtkWSHWm7GGr2QhAoqsuND3Trx1+u/MvMjQu+916WF3QAi3YFe7OIT79wklw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(3023799007)(261021121427099003)(261022105027099003)(261102123227099003)(261026140227099003)(261028144727099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?em5nbldrN2d1eHd5eHUwMmpWV3M1dmw3L1JYaVNXcSt4M2lzb0FzanRIeHlN?=
 =?utf-8?B?VHpyNXB3VlBHRkdDZS9PSldZd0ZMVVpvell0T2Zub2Y0ZGJlSnFpTHpHVFYv?=
 =?utf-8?B?M252T2JBaFNHMTdtRHRoeVZLQTdoOG40REtmbCtXcVhoVm13azZvazZKRXNY?=
 =?utf-8?B?dWlZK3FZTmlQSXJ0RHhlVjcvUkY3Si9tbk5UNTZmWEVTNzlNZWlwbS9UUnc1?=
 =?utf-8?B?KzhSWVVoUUVyMjBsN1pBSUdIMjdVWnF5N0RkNVlhY3VZNEY1MTRPdHQvQlZJ?=
 =?utf-8?B?NjNvS0lWdUxQRXZNRjRXMTJHZE5iQ3pkejh6cFEvckxzZjFMMDlMRDNsVFlo?=
 =?utf-8?B?TE9wVTJiYStGekRZNlNZYWthTmJkZmxnZ3pmUFlzcHdPVHFmeXhybnBNakNu?=
 =?utf-8?B?Y1c3Um9RMVZuZFZ3bXVPSlhaVE9EOGNIVDFiSjFvbmQ4cUlGQUx3YkZHRXZF?=
 =?utf-8?B?ZUY2YjNnZExNV0h5T2lPS0x5ZXd6bzlJSXFKNnRhZDlvbVFWN0p5VUVDWEZI?=
 =?utf-8?B?bVlTNjJibjEyTFc1d0JSbjdseFBaRDRxbkdBa2VHTVhhNWM2RGxRUkU4eC9w?=
 =?utf-8?B?Q3NuZ3ZqOVNxYmpoZmVVNDRrUDVZWDkzL0ZxdHFqNE80U2ptb2xTY1o5cVpK?=
 =?utf-8?B?dXpxMDRlSUFQTFAyZjJuenJkVUx1R0JwMDZKQkdLQXliUnJiUysyQ3Z5czFi?=
 =?utf-8?B?SHF3dUQxSkRIV05oQ0JVbGdCSTE1V1BxbTFyUkVZR3lTOVl6cFhrUlZ6VkF6?=
 =?utf-8?B?bnpIYnNlUk9iN1FaQ1k4V1NZb2M2SVNwM3h0enAxTEdXUzI0KzVVRnFZeWRG?=
 =?utf-8?B?cko4VjJKUktqc2RidGVDNTllQUlqWkhZenZOaVF6QTJObHVYa1JWRXVMRXQv?=
 =?utf-8?B?TS9sM1RRcGVuZzlsVDFEWDFmTDJ3WGg2QTRCaDFLV2V4UGh4Umt6RUZySjNn?=
 =?utf-8?B?bUNNUTdSd0NFSFZqOXU3QmxPY1NjRmdMbzlmTHo2VmtmQ0RBMXM0TkhITWpQ?=
 =?utf-8?B?LzErb1huU0dJcVM3SCsvVzQxaWVjUGpiaU9VK0IvcVdPckk1dGlFdjhxbGF2?=
 =?utf-8?B?R204alpRNGs2bmIxRmpzelpzVHFuODBGbm44QXlyOC9pZis0SnlzSW8xTmJY?=
 =?utf-8?B?RGRlWEhhTGVHM3UwMVl6MnFqTzcxb2VicTZmRVdsL2VlZkpaNUJMd0Y2RHd2?=
 =?utf-8?B?L3h5eUJkMjl0Z3NuWklSei95UnZzakVpbjFTZnJOMVJ6QlpKU2Q1K2RVaXp1?=
 =?utf-8?B?VVVyMXFTTHhkUGgwTzg1eUovbnRGenNCVStQMC82WnlZS3ZnRjlyUGx0eE9V?=
 =?utf-8?B?bEExZWErOXp5dWtHYTBRRWNBVXdoVHllWnRoRjh3dG5Ra3VZSU1ubWxaWG9x?=
 =?utf-8?B?T3F0VU9LcElQdDNya2o2TVNQekcwYWFBSE5NaGwwK2pmS3lxRlR5ei9lN2lW?=
 =?utf-8?B?MFdxaHRiemUrQW5iejlKa1NuNTlCYnRNam1JYXJLWFd4N2h1K2M2N1hORm1B?=
 =?utf-8?B?SWNOSFdqM2JJWmk5NGY4S0tua0dYckp1VENpc2ErQzdpSHRLVCt5SXZVVC9N?=
 =?utf-8?B?QTduYS9UdlY3ZFVabzFsYjFvdEl3dzZtS1FPREVoalJycWFwa1lhQ0gwS3hX?=
 =?utf-8?B?S0JOZlluN3Q5VVNqRTh2amM2aVRhUURwTGJYa3c1Nnl0UFlodm5MSFN1a1A3?=
 =?utf-8?B?SklZTkRHVEk5UnpCY1lzQ1QxZDZOU2V0MVk5TFNGQWlMRjhRNytqdnk2OHd5?=
 =?utf-8?B?eEdXYkJnTVdLcGkzYWxnRG9zWWVWZEpZU0pvVHd2QmZlbVpTbkhUUkN6THpa?=
 =?utf-8?B?OExYV2JNOWt4VHEyU0E5amM1YndSZkZkdDFFVFIwSUxVcmhCN2lzSXNNL0ov?=
 =?utf-8?B?STlGRGxwcjVlWmtjSTBobDFvOWZpQVVjODJTRTB3U1JxM1lOV2lCc2Q1NlNC?=
 =?utf-8?B?aHROdTM0SVdrN01HNnVWdGtCbXNaQkpuK2tuTG9UNnpVMTVYaHp2eC9JdjBk?=
 =?utf-8?B?THFScmtsdlFwSkdyaFd5M3MzYUg1TDVuVTlpcENtSlNVTjBLaW5KVG8xaFNj?=
 =?utf-8?B?M2N0clE4Q3A1Z1hmSEdZdWo5ak1EWUdqSFMycUVrMlhSWHM2UldCT21yUGdv?=
 =?utf-8?B?Vk4yVHlEU2dCdHl6ZUhRNkxzcEl0bmJvL3lwK1pRc09qbkpjVEVaWTBUVnZ4?=
 =?utf-8?B?RWpqbVZ1OXdmckRpMTRoMExienl1bXN1WW8zK0lSTk9JcjI2WVRhQ3lIZ3p1?=
 =?utf-8?B?NXAwbUFkd0ZLWTkyWXhneEczdWg3WmQzQnd0cllEYS90Q1R5eW0ySHBtYXFP?=
 =?utf-8?B?S3lrdG5PdnlwN1BwaTFjMitnalZoYXFSQXNPRk9tclJQTHhaZzE5Q2RwbEw1?=
 =?utf-8?Q?FZRUoJSwKX6xbZlI=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 989c0327-5452-4d58-eed1-08df4a4b1ef1
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 16:51:01.3654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JmV0GIoVn0OY2y5Ty/0HhDwYdAW1DCwl/rj5RvD1gcQThzHLFVtPsBt2lQypfRXp8S1OKnjRCODTOytFznHEyAQLd0h95FgfRdD+++1eqdY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6364
X-purgate-ID: tlsNG-42698a/1795539120-2C39B9EA-F2A0EF5C/10/78276251493
X-purgate-type: spam
X-purgate-size: 936
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 24/11/2026 1:32 pm, Jan Beulich wrote:
> Quoting 1179d51dcb7d ("x86emul: ignore VEX.W for BMI{1,2} insns in 32-bit
> mode"):
> "While result values and other status flags are unaffected as long as we
>  can ignore the case of registers having their upper 32 bits non-zero
>  outside of 64-bit mode, EFLAGS.SF may obtain a wrong value when we
>  mistakenly re-execute the original insn with VEX.W set.
>
>  Note that guest the memory access, if any, is correctly carried out as
>  32-bit regardless of VEX.W. The emulator-local memory operand will be
>  accessed as a 64-bit quantity, but it is pre-initialised to zero so no
>  internal state can leak."
>
> The same applies to XOP-encoded integer insns.
>
> Fixes: c4afd683f95c ("x86emul: support TBM insns")
> Reported-by: Roger Pau Monné <roger.pau@amd.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

