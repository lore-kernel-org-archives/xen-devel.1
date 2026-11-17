Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6666606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 20:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=M2FKS5b4
Received: from list by lists.xenproject.org with outflank-mailman.1493159.1693274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTPNL-0002UB-W5; Tue, 17 Nov 2026 20:01:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493159.1693274; Tue, 17 Nov 2026 20:01:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTPNL-0002U4-TI; Tue, 17 Nov 2026 20:01:55 +0000
Received: by outflank-mailman (input) for mailman id 1493159;
 Tue, 17 Nov 2026 20:01:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xTPNK-0002Tx-0C
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 20:01:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTPNJ-0031vs-8m
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 21:01:53 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6afcb2a2-e002-0a2a0a5209dd-0a2a4503e9c8-28
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 21:01:52 +0100
Received: from [52.101.72.103]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6afcb2b0-fae8-0a2a45030019-346548674590-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 21:01:52 +0100
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by MMZPR03MB647648.eurprd03.prod.outlook.com (2603:10a6:190:4c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 20:01:51 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0592.009; Tue, 17 Nov 2026
 20:01:51 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NOkXDEISLd3jmdunm5muRqVDytgEzIcAanHBMP/Jj9Qx9vb7zlIBrYwAhKP00f9uKpwv+tSH6NqXjQje+fs15d98CYAeS/2/vwAAsPe16bTq3wCHJWreTtpzm++eX7jmQZfvEB0eGRVacWS/3LOi7Oc90oFJC9zfLqHjYA8vcj/XeVJJaIQI1k1x8u0HhwKnFcjJFmQtctmdekzs4dFP7GIjTFHnY2v/SNBcJ4/0K0vXgC9DJoJg4TD3vyhGjUZNL1XxveZ+f++paQJsfu7lA4ynroled94kYoLYNcNm+FVL5sqidh86hSSeybpeUDQYnVmK19t2NvSkN0h7vTWhlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RRzRUb02wn0dNPPs83iGYBLA70d7sWs6sN9bzdYnSpk=;
 b=D/nU0j9lT2HzfFrsOnNS8RQaNUs9EkkfwMFqfZ9SyKfe0X1N2T3LW+PXfZUg+wGMoqSB1sLtuDL8NmnQTHOq5y8KuzKwMN++NlT+Qbg+wclH6uilAcE1b2jyPf1WS0yexe911L6bCvr9G77oKTVPOz2SAwyM0L66hqbR2HA4MrhBCJN8D9NdmXaso6AHItFtfE15Eey33rYVKH9191VQn2EtelO5Aozld8EUleUc3KEXzqlepLBkUwYRCmpDbCshs3guWkCDqejr/SuMHyAgetRXwmeuYByd+zZftmR1VLEGuM2yj34oneENbHEGTQMolAQYciVxhISfdjpv9bsI9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RRzRUb02wn0dNPPs83iGYBLA70d7sWs6sN9bzdYnSpk=;
 b=M2FKS5b4a42INqWn3wCbuzayCUScwAxKfrC6gIel3aX1REnWhaDi2Xprpr8pG2iwlgn+ihLtWOcxx7XUiwyeWcbbbhAmZndiFJyXDTqSFqONsh2eQH1bk8AOypgVOkoZSLjLWIkveQk/GoAl91SPHtcUcakDBO+bXfYtwt+3PWHVNnGCmlgpGaZ45fHZtmrOKGWPa1O/ifBBhZK2kJAWlIW75WBMEDra7lR0ggjX3HJTteya05eYo/VPTMybCTozJk/mk/63FLKEU09Ng/xYXFGuUJ32cdXYwNoZAtl+LHCr6o576/Ap0zDvSSHbkXDi8FgPvYrQIewzuJYvsXIa4w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <e4396ce2-ca0f-4c18-85e8-bf0a2afa97e9@epam.com>
Date: Tue, 17 Nov 2026 22:01:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] automation/eclair: deviate MISRA C Rule 11.8 for
 xfree() and vfree()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <cover.1793699713.git.dmytro_prokopchuk1@epam.com>
 <4accfe649e163bb4d0372c432256ed394b4ee50d.1793699713.git.dmytro_prokopchuk1@epam.com>
 <de39dd8c-1db0-45a9-a9c9-ad2f2e0a90cb@citrix.com>
Content-Language: en-US
From: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
In-Reply-To: <de39dd8c-1db0-45a9-a9c9-ad2f2e0a90cb@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0055.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::35) To AM9PR03MB7526.eurprd03.prod.outlook.com
 (2603:10a6:20b:3de::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR03MB7526:EE_|MMZPR03MB647648:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ba6d55c-12e5-4157-43e7-08df44e59ea1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|6133799003|18002099003|22082099003|261102123227099003|261026121527099003|261021121427099003|56012099006|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	lS4HpNb1ITo5P4kKxbBLOGoTxwfpSfqYJbZFIhTCMsEO5YqJT6OI/1Wd3Txrp/I7qhySzjkHEtiF04fpO30gh7kBxSzbINqlNHCwRF7cMDjInykcKBtbXfyDOBrMWuuM4HMueWhV0eXNn0kRFNJxgehj6pSB6CsCzTQkdVDYnRjA8ohs01uJ8sKg7nDRaVHlXB7cntpSJqtSJr6l5pAPYCQwvYRAXoIBGI/4PBGgF34OIR5pxYYO5SQc4eE6hWhCC4kBhLUO6xaBxMBcaKn65wVuAGITBrR1XYVaq4jhHg6jK3orjbrWSJ/2i0fFu3e2YXscbZ4Laxex1BMSHj4ZSVYDmJjrpGjsyNNMzfD5jMN/3F0eVpV21TqpYVIl8sJbYIPQ+izqvGBauvy0H+eQo/MQ6YP6NCjDia1eJvli3cutw5yNPvfnBgHx+g0SgQ1412SCXIuccEZNleXlWwsLxUA2voEVyZFy5vz1tQqwBOgPlFppbXgaVozu5WJObL2C9edXmjjfLdaMjwQEHeJY9zp4I9Y/isyc2XIJHXeEz/KcvEtQHr6Xx19yARUKJzQ7jI8xHaDnpSQO3WoXpHaXCurx4kAfcosheh9yIBlkncjtVGzS6XqVIieY7pUscN8HdLbaH8yQ4px1qLpi6dgcfDarMthGif05qAG1xI6c2GI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(261102123227099003)(261026121527099003)(261021121427099003)(56012099006)(11063799006)(10067099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXlGb2FBZDgveEJPTlFEQ1h6NWZWeWd6ZWE2WWlTdWNkaWVlNWM3dlR4UGtJ?=
 =?utf-8?B?OE8zMHl6eFo2NzVTU3pEcGlFbzYza3lCd2x2R1gzbW1OZTIwM3dFOUNwMnNq?=
 =?utf-8?B?RTY2aW40TE1CSXI1TVhlZ0hUVDF3M0dvWVlQNkg0NEk2UWFvcnZKNXBGOGZX?=
 =?utf-8?B?RGh2dFBKVWJJc29QMnFDbGpPb2FGT1pHc1NTaTNDNVBxVmxTSkRhcXNOMWd2?=
 =?utf-8?B?ZmlNbk5tWVY3YnQyS0Fvb2E3aWpLRXZaM2s1M01Cb3p4Tmw1R2dLVFEySk13?=
 =?utf-8?B?a0xaRnp5OXp4NXo1djk2SXRkRHdvWUIxcGVVNFg1STVGT3Vidk90ekNLM2h6?=
 =?utf-8?B?akwvOEdobjhpanhXOGd2QnhMNlVXVjU1anI4UGRSWXloUHRwNGwyRVg5aEZi?=
 =?utf-8?B?c0FUdzB3MDVudjJyekUyNlByOHM4c1llMlFTWDNteEJCT0pBZ2pGVE5Fc0la?=
 =?utf-8?B?ZDFTWEl3QSsxc1lqY05mbndyL0o3dUNCeGtTbHFZM2FhQThXMkRta0paYzFt?=
 =?utf-8?B?Unp2R2VqODFjRUlUeGdiVXBGcEFPUUpxcS9keWtNb2tjS2pKdHBVdE0zcUxo?=
 =?utf-8?B?dWpTUTRGTlp2VWkyV2pYNnFHcEhNa3J0Y2xaOEFPSHRhRCtCMk1qVmt1bm1D?=
 =?utf-8?B?WHNJYWdpZk1ZZVdhTXk0Ym9jN1dCdnpSUURiUGdobTNqcjFaMWN1c3piamhj?=
 =?utf-8?B?eldNLzFtSVpVdGpnbk1qMTY0NEwvTkY1dklnODk3c2xDdnAxN2l3U3oxUG9a?=
 =?utf-8?B?cDkzMzdGSzhHa3ZvdDZSZ1V5bThESFd0K1BjT0VjNEJwS2VOSTRoVHNlSWd1?=
 =?utf-8?B?MkxZRjA4b2F3RWk4RGU2MUFMSDRhZjk4L0RROUp2N1JrN0ZmT2NQdFpJUFNa?=
 =?utf-8?B?ODFFZEJhbk5jRnY0aWdjNmMvWExpOGExUWx2ckRYNHBoa1dMVXNpUWo0SWNm?=
 =?utf-8?B?T283TGVCWjZsR2tJWFJxTjUxMVRIZlRaeFh2U2l1MkttdHdkeS9ueCtKYi9y?=
 =?utf-8?B?b3pTeFA2T1NHM2h6RWRocEwxaXhPZHF4WWYyZDR6NE9vWUY3ZzdHWjBGbVM4?=
 =?utf-8?B?RzNydkJlZFpoRTVZY2VyV3FmZTJYRHh1THBmU1h3T053aE0zLzhBVkV1MGNP?=
 =?utf-8?B?SWVQQzRreTVMOXFkVTgyVndvTmJzL1BFU2dJa3pjc2h2OTBnVHJTekdZRThv?=
 =?utf-8?B?OXpnVmkzcy9MOEtqVEJMb2RiTGxJNjlLU3ZiN3JrcVBncEZ4Z3RSSjRjSUo4?=
 =?utf-8?B?T2YvQXdwOTJsV3JUbTZxVURBMHBhV3ZGRlVhRlhUaVNBZnNweGJRYkxTbjQ2?=
 =?utf-8?B?TnVhWDMwY21ZL3AwMXgwM29FQTFBRHpDZU5rRVA3YXFIRWFxZHl4RURzZ2R3?=
 =?utf-8?B?N0NaREhzU1VYeTBzTlB3SEpJam5ycHcvbzhpYldNU2NTWldrZUFDdUQ3dDJM?=
 =?utf-8?B?OFBtN0NRMTlJNFQ3VkhjRy9ZSGJCUGQwZ213dktoejBFSGszSUhMc1dVdlQx?=
 =?utf-8?B?NmhBY1kxQlhRWVd4eWJXd3g4VEVhLzdnTlIwQUh6c0pVc1lsejF1RXlHTHJl?=
 =?utf-8?B?bDk3TzB1ZHQvYmZxeXMwMHh3WXRwZkZGak5aNjc1NWdJZjFSMlFjS3ZQM1F6?=
 =?utf-8?B?Z1FYMjVwaENrSXVCRDRBU1MyQ1ZmQXZjczlyd3J0bFY0VldnUkhadTRFeE9o?=
 =?utf-8?B?RndDQ0JJc1RTTzZidzJ3ZndTaGpoOU42eTNSSVh1REJSVXZIeEhvcElHNFFB?=
 =?utf-8?B?N1o0aUlOZmJpZTczTkpXSEdDMUUzbFJpR2NRU3BVeUdZZHZETWE5eHFraFpu?=
 =?utf-8?B?M2huUlIwSnlDclNQN0ZYQkVmVHVYcHFJKys0SkRzV29mYTl1M0tRTE1YTTVw?=
 =?utf-8?B?MUdWM3ZGdmE5WlNpODRFZFVwZUtKd0t2d0MwdXp0bGo4Z3JFMHJXNlFqbzU0?=
 =?utf-8?B?UUhKL25GQWFGWlhNSkpFY0lXNjAzSXd2R3Q3R2JRZ1dpMktLWGRNZE5LbU9w?=
 =?utf-8?B?dzZMcllidWV6cmhWWmxxWWVPMkNTbUhjNVg5MHU0c1d3bVZVKzRBSzRtaVpl?=
 =?utf-8?B?SnNrc24zUjhIcXozblhySERxOEFSeHlaOEFTT3Z4NjJZTXFBczh0UlpPQWVy?=
 =?utf-8?B?SWtWdy9yUThQamZyK0NZNW5zcHlsVlA1R2lXWmJBTDQ3cElRWHlZTnVQS2FP?=
 =?utf-8?B?bUkyc3VuZXVmcmNJd0NDTVUwWXFBZUhmZWZqZ3lMS21Kd3N2djgwOGFIcjlG?=
 =?utf-8?B?T01hb2luUitvQ3lDcmx0T0toeFhQK01FNFFyVytwUEwzVlU1TzdOVHNmWUZB?=
 =?utf-8?B?SlpJek84MURVRGp0aFQ3V0Fzd3plb1liOFdMWnR0bHhJQmhvNGtKTVhZclA3?=
 =?utf-8?Q?UlfKxmeADwF6i42E=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba6d55c-12e5-4157-43e7-08df44e59ea1
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 20:01:51.0451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GOR7bwteQPHzHOL6OF6TrrIG0x6Um3IGvZ9+mpdSLnddaMQmzi4lCGPTDvQqQwLOYPiT6TyKYnwz7vcX12r95MWWE5Zj/r0FAgrMp8yP+Rg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR03MB647648
X-purgate-ID: tlsNG-33051d/1794945712-6D0D94E9-EFF9CAA2/0/0
X-purgate-type: clean
X-purgate-size: 1592
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/4/26 13:24, Andrew Cooper wrote:
> On 03/11/2026 10:29 am, Dmytro Prokopchuk1 wrote:
>> Livepatch passes const-qualified pointers from struct payload to xfree()
>> and vfree(), which take a 'void *' argument. The cast that removes the
>> const qualifier is a violation of MISRA C Rule 11.8.
>>
>> Such casts are safe.  The deallocation functions neither read nor write
>> the content of the object being freed, and the object is not accessed
>> after it has been freed.
> 
> I have a very firm objection to this.
> 
> It is impossible for any allocation from malloc()/calloc()/etc to point
> to read-only memory, which is why free() takes a mutable pointer, not a
> const pointer.  The same is true of any other heap implementation.
> 
> It is impossible to make an object in read-only memory undefined.
> Objects in read-only memory by definition have a global lifetime, and it
> is absurd to argue that a specific heap implementation ought to permit
> making such objects undefined.
> 
> 
> The bug here is livepatch storing a heap allocation in a const pointer.
> 
> This comes from deeper problem where some contributors/reviewers want
> the const keyword to mean something it doesn't.
> 
> ~Andrew

Jan, Andrew,

thanks for the review.  Given the disagreement, I will drop this 
deviation for now.

If the preferred fix is to stop storing heap allocations in
const-qualified members of 'struct payload' (so the casts go away), I
can prepare a follow-up patch.  Please confirm that is the direction you 
want for livepatch.

BR, Dmytro.

