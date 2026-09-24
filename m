Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90E3C98314
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 12:56:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1432253.1653702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9izk-0005uO-KN; Thu, 24 Sep 2026 12:56:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1432253.1653702; Thu, 24 Sep 2026 12:56:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9izk-0005uH-Gb; Thu, 24 Sep 2026 12:56:12 +0000
Received: by outflank-mailman (input) for mailman id 1432253;
 Thu, 24 Sep 2026 12:56:11 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1x9izj-0005uB-H1
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 12:56:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9izi-00HBr7-Ad
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 14:56:10 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ab51de0-2eae-0a2a0a5409dd-0a2a450c9686-24
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 14:56:10 +0200
Received: from [40.93.198.52]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ab51de8-f479-0a2a450c0019-285dc6348419-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 14:56:10 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by DM4PR03MB7013.namprd03.prod.outlook.com (2603:10b6:8:40::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 12:56:05 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0428.015; Thu, 24 Sep 2026
 12:56:05 +0000
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
 b=QzFHmTSXrhlLb2x5jaoCLOKDqG09UfBu39Dm6JpMXa0PxIzsTOKa2n79rzLUECPTwFBDecwNZTwzbF5eSkKigiN2rJKbBcL0/tNxiOVFrvxhqK7IkRCcsgQNMl14vVRbfNmqstgLWe/VTVjtapnlTpuTbWNaXgoUy4n+1ZUsvlfwxhmKZC2RZAK86BdWsgLFynovN2Ap3VjCeumDJzaTMEZfoE4N3I6zR5olu3GLSQAMrPnQmO+kc3HNg4mKSotJT9UHe3iWXI/AA/9yLVZhh924SBqHAdxCxKtwzWXHIswfsSV1wny2wPk2+lzCRwdlhz7lsvckZWCqkxTeEuuumQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3qnXD8olE1RhVt4hyXvZJ14EiAuMC0A2U0g57NmoSrE=;
 b=Z946lt3g1PJyUmRgfDFGMERwHGBWGHchLpqo3L7Uwxpd0n3yGiQGvPNUw4zFVF1ZToOXvFiWd8fgm71cOd96wcYCIklTi+gHr6SmBZPto8q9Oho0RmKYlDqMLIhhnUOTTDgF6i7BXJT1Vyrp9jmXq7SPSnxRsDEI0Co8Vh55DcybJ+NWwye8S5+2jVobxH40M9AmkgIj6pdsARnNRNNmfTo4yfQd69+mhGp4pWaEn2CKCAXZsBp+Rf5Y8XcYhn68qeYYuiKh5evJf8ECTtiWtYS1EmKVMddC/eNDyXmdlDJXwNSxGLrwaHAQ4K5A7riu0hWhz/LlsRs8gBUul6KGJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qnXD8olE1RhVt4hyXvZJ14EiAuMC0A2U0g57NmoSrE=;
 b=NpiS+ZYtotrzCC2OoxAi/iAsPTQsL5H+pCGhgiuv4T3a8JAYtpwur52XVeEwoFwp7hU2n4PF06NibZSiECgTk9FTwkUkLSwALR2oh5xua3QiXugqmy/YdvnvQFbBnECqVsF7tIy9U69eTHBRjhl6PS7zPWGwYg+OFriQ0EqiJqE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f6de75b7-f936-4257-9a6b-c9ba9a3fc17b@citrix.com>
Date: Thu, 24 Sep 2026 13:56:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: Clamp Viridian features to known set
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
References: <20260924110342.1045230-1-ross.lagerwall@citrix.com>
 <b444508c-1684-4999-b560-c95b9be0efb4@citrix.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <b444508c-1684-4999-b560-c95b9be0efb4@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0298.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::15) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|DM4PR03MB7013:EE_
X-MS-Office365-Filtering-Correlation-Id: 38f5a246-6673-4f47-a325-08df1a3b3205
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|6133799003|10067099003|22082099003|18002099003|11063799006|56012099006|5023799004|4143699003;
X-Microsoft-Antispam-Message-Info:
	oXbKAWQljDv381DZwuCOjVck6Xob7lmIljB7+jclrS8pFWRmI1scxQdrzrCsH8B509q9YmygPzgg/jNmu2gealkQz0njpYYy5+xNLF3TXLz3+YW85aU4898X8xxsFo1vucbVppRENlvNxrpmNtprIC3wpQ+Ibc41WmCrbmbCaFSPlGbvASaXFHcNPtXOEePjrfJDiaPLIIjI6jyiDtDxlDnch8Cl9JXD3Tc+GyKYN2yD1nFG8V655c+wGmLxH/HyAyANswB6/nlA7s1vam91jQAGzSPynJ0tjr6pWw1NS9KumQ9wiVZQ9jWgaChJdLvFPa2j1WETeqU9RVB2pTJivw/GovIeUhZVNAH9JnEUm5OtU177LKGA7R6SULQt+RZ2s+0V+oW21wyBuiztYjMcWv4c/OLVc+oplMSaaT7BHQzlLatiS4lpMEIdE5hDHvbizKtxnwmwLTVcLu4bqMX6pJqT4EBarsl9sQETqPxJKSRJa7Wgh+ZYNS6VUWP+2YfOzBddoR+IU5FwbnainpgthtTKl//zepNRTqVKwkaxqch9AYEMbn7GhCuLxLIAupU7ObkBf36vXGjoS8GeryqUK5DfZC096+8Ma45T5eEXQdfNbcmLNos14oseJgm8mqINF9u/t6gBGcjBnSKJSYdAJLeCPKTUFBt/dmqKUik8/s8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006)(5023799004)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVdIY1plaFhlUXBoSzErY3g4MDFqOGRoMU9LMlozS0VkOEVGQitQQ2FHU0hD?=
 =?utf-8?B?Z2F4UkxneFpNbTV2VjhTRk45L3hBNnBuSkxkNThqUGtjcEZvdEEwSDZRT1li?=
 =?utf-8?B?V3llVlRqOFBLdkdOclRCdzRZSnZKa2w0dVdYVXBUazJkS0NiT2NIbjJUMUVM?=
 =?utf-8?B?SjEwK3hoR1RlelBZZElnVzFWSkR3dXhGSEdldE96YTF0S3pPSDNES2RGck4z?=
 =?utf-8?B?M0dBY3RLSlZQbno3aFNQSFBTS0ZzeXNpME9iQmdXbzlPK2dpUERDV2tONmxB?=
 =?utf-8?B?WExSUnh5azNJNFc1WHpTWjlSTmFyZkUwV2g1dXI5Zk9nOURuZWNFcCtWd084?=
 =?utf-8?B?czN0RGFLOWdQemVqbVVFYVd3ek83cmVoYXV2UjYzeDhCYlJ2RlJFS2w2bU9Q?=
 =?utf-8?B?cS9HM3kyTHZNeW55OEN1UHVpSXVsamVIaWNEM25IUjVnRUpLVm84bWZ5VGY2?=
 =?utf-8?B?MW1BM2pDNGZKbURzMUFMM3BxM21OL2NkWnNkaW9tR1RaUEJQUlBBR01SUlVH?=
 =?utf-8?B?ekhlalZxV2FaOUQyZ1AyV09oMGV1NWoyOWhXU1FuMmYybFE1Q2xYc0hocUZO?=
 =?utf-8?B?bmdJZlo4TjFEek5WdVdybmptTzZNMXEreW9ndWhXeDJCVUYrVDdhdHJqY21k?=
 =?utf-8?B?ZGhlMUU4QU9QZVJwbWt4OHNTY1pWTjB3L09VMmxpV3lJZm5CdHdRVG9YWXY4?=
 =?utf-8?B?cFBqQVhYNTRibnFtc2c5M2VhRVBRamN5VzdlamRINTZxakZUS0EwNGxER2pa?=
 =?utf-8?B?aFVrYklTbXhTMU5ydDRyOTRCN080Zlh1d2lCQzkrbUNpenVSZWEwVnRici9a?=
 =?utf-8?B?NkorVXJsbk51TjJ6TzZ4UTY1Wm1YR1B1dHZ5TThxcXl6dHZFSlg0Ykl3c0Ux?=
 =?utf-8?B?REdDSnhrZDMxb1c0VFNjR0J4RUhTT1A1d2djL0NFQnQ2WkFqZEcyZVdodlVX?=
 =?utf-8?B?NkxNRUpiODEvNUlkaHRXZWZ3NkNYN0JvT0tUekt3RnVQV2dISXpYY0NmZDdZ?=
 =?utf-8?B?WFhLSjY4b3JxYUluMHJSWHVSaWxHQVBCTGZiM3ZqVnZ4T0hTQWhLTFRmQ201?=
 =?utf-8?B?VzVPQ2pWN0RSYXBtTUcrS1ZscUw3Z25WSXFoeU95cm4wa2FpeDhraDJlaWJO?=
 =?utf-8?B?NzErZ1F2V1ZnUExOREhQN0lOOHVDQkZUcDZyZzFRWXdpYzdGWmRWZlpDODBo?=
 =?utf-8?B?Q1N5TkJVVWFFOUowOEZnTm91dDZiZWF6N1BrQ3l6dnFicDIvWVhSa2FkbjJI?=
 =?utf-8?B?TURXRVpsVS9jMk1ENmlZczFXU0N2czJEZGNsRWIvQ1dCUVFXZHkySWJ1aEpL?=
 =?utf-8?B?OTJpdEdCeXZtWUNYYi9yUjhFSDJRS1Z4MStWbkFMSTVSOEp1cjNrUW1HN3di?=
 =?utf-8?B?ZnlpcytwZko5RXg0eTZYOW9QMUcrYTFqN0s5U0NxTm82d21FMTk1M2M1V3Nt?=
 =?utf-8?B?bW12NkdLcTM3SmRaa1haOW5zUnVmbjNqMyt3dzdPT2lrKzZGSFY4Vm9rcDl4?=
 =?utf-8?B?dVNRdldFbGVScGo3R0N2Y2hiNkZQZndzdkNzMEptMVdxcWdYbEVDYXAyTURh?=
 =?utf-8?B?MHZzWWhEeVRMZ0JvdFBwNXQ1NXl0SDVJLytNWnQzcEJCeC9IdTlaZTh0REs0?=
 =?utf-8?B?ZDFwSXdvSkErNUtYZ0llUUFaRTV2eHlXVkVNUWNXbFpGdWRsbGswNm1mVVVv?=
 =?utf-8?B?WmFGeWZsdmkvRlJiQmZOaFFuNUw1cUI1eXVVK1hQeFR0cnJQeW01cWwySlBR?=
 =?utf-8?B?a2VWTjUzMmtERmJERE1HR29yKzdKeWFqMk1ZRXlueWVhVDVTckNwN2VDYzAw?=
 =?utf-8?B?S2xOdGZsSUU0dDYrTWpRVDY2eVpZSUZYMjNzYWkyM1Nnb3dNSDk1bGJPdW5L?=
 =?utf-8?B?WThmb2x2b3RieWs5WGs5NXV3WFUvQnM2RmdGZ0xqTDNrR0VWK0w2K2pPdGFB?=
 =?utf-8?B?RWc4TVpsdnpjd2JoVGEwdkdIVlJOV2djSi9VV3lVSS9mQThqWGNmYnl3eHNG?=
 =?utf-8?B?emdMNUREcVU2T0x3Z1pMT2xaeWxwdzZiMzl6cGRVMTNVNkpLV3RFR2dHYjg1?=
 =?utf-8?B?MmpPTGdvK0ZZbkhrdXNHc1RJL0RMOEZxd1h4VTdWN2cvVmVlc2JkdFhReEpB?=
 =?utf-8?B?MjJoaWtmcnMveURaNEJOVWxWb3p6Tkp1V1F3RndTaHlTWkoraWdxZDgxYXZ4?=
 =?utf-8?B?MytuR3Qza01DV1gxc2h0ZkVVd1BmNFJoblJHWVhHRWNaTnZCV1hVQ0ZUbW9F?=
 =?utf-8?B?cCtWWFIxZ1I0dDlGMFU5MFc5MnpYOU8wMkxvZWEwQWd0dlFCN001VG9tWXc2?=
 =?utf-8?B?SGlWMlFEbUUvTTFtdVZrUnFRYlExbVA2UzVUZmg2ZVFvYk84TWplelovQmhj?=
 =?utf-8?Q?Vy3vaZla28bCfUx0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f5a246-6673-4f47-a325-08df1a3b3205
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 12:56:05.6198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5pZ9JMitDclYhSK2RxQGMCALh32dqAkOqwPlmV0YVlJxq5Zqi7k3sU/W2Ive6WTCGRpJCWEoWHlsUJp9H3zZyb2QLA7ujKqX+OVpMx5fI/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB7013
X-purgate-ID: tlsNG-d25034/1790254570-50520A5B-8B560B05/0/0
X-purgate-type: clean
X-purgate-size: 854

On 9/24/26 12:20 PM, Andrew Cooper wrote:
> On 24/09/2026 12:03 pm, Ross Lagerwall wrote:
>> Instead of returning EINVAL on an unknown feature bit, clamp to the
>> known feature set.
> 
> Sorry, but no.
> 
> This is equivalent to saying "I've got a VM using AVX512" and Xen saying
> "ok, I'll ignore that safety check and let you run on non-AVX512 capable
> hardware".
> 
> Requesting a feature that Xen doesn't know about is a hard error.
> Truncating features out like this will cause a guest using those
> features to malfunction.
> 
> It is a bug that this was expressed as an HVM Param in the first place.
> It should be part of CPU Policy, and it's on a TODO list.

But isn't this the same thing the CPU Policy code does? In
recalculate_cpuid_policy(), it silently clamps the toolstack's choices to the
max featureset.

Ross

