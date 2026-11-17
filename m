Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEFC606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 19:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=FVZF+eWT
Received: from list by lists.xenproject.org with outflank-mailman.1493138.1693256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTP98-0006od-FD; Tue, 17 Nov 2026 19:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493138.1693256; Tue, 17 Nov 2026 19:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTP98-0006oW-BJ; Tue, 17 Nov 2026 19:47:14 +0000
Received: by outflank-mailman (input) for mailman id 1493138;
 Tue, 17 Nov 2026 19:47:13 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xTP97-0006oQ-QD
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 19:47:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTP97-0012UH-6d
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 20:47:13 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6afcaf0c-e002-0a2a0a5209dd-0a2a450990cc-34
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 20:47:13 +0100
Received: from [52.101.70.142]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6afcaf40-be1a-0a2a45090019-3465468e9ca4-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 20:47:13 +0100
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by MI9PR03MB911483.eurprd03.prod.outlook.com (2603:10a6:290:b9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 19:47:10 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0592.009; Tue, 17 Nov 2026
 19:47:10 +0000
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
 b=UhS22RopC45Yb8CoxisYXq8x9ACCIfcJKGhC0vQtj3E8aIA6vs5luDmOCstYclqXY7/tFSjAe02b/hdjrEA9cqnorOLc5PESE5Q+ZcoC9kyzcT2Hg+akGhC0iEY/QxxTubglaSqGZKSUQfLD2WI153aE+D4xKq9jOmCvX+KDB8EMurGDgvJYQQ5wvg/OZA7BL+xGRDHiaBmksdC6cMitErFUBQxxb/1CGZy0lvDTE6djhYsRb3taG557Wzxnkafka3P3Cb2JD35cZNoHCTlOZ2+ocMkCw4EjNi/KsW8nuDGOxynByzW/WX6fezmTctWNNT1GR+jShiE265gUZ62Xtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+LwSGq8fK2oVQtlAGFozOKBY4/mb8ctFXpYZJncJDVo=;
 b=Jy/+dj28uyFc4sGiE+V1pA2GcbGAjejBMAxwod6yaP+1SFRCga0HdS5EHEWdaUrtWf0uUVqKBrC5LfuZt3SpXooufbJaMvZMSXRVw4qyfw5JsHW7g9tabCsWD5zg1SKko06qr+ajFHDJA/xn3bfYYLMR6tCS7p+RjeS2ILMNc1+Q6HwKYfO1DEdd5MW1u3e2cP0AbzMtSaYy6b3uaSwAR927wVtzoO6sNxKe4ZbMNSdy8vDJbFhbxY/M+OyhavCez20mBeeBWXdlzqwbcpsDneA7yBVLTOyVUIcsV1yKLGua4pxzgmrYZDbPEI4T7fM5VC0KexbCl8VgTofd22HjDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+LwSGq8fK2oVQtlAGFozOKBY4/mb8ctFXpYZJncJDVo=;
 b=FVZF+eWTAK5vx3IzZ9gDFz9/OrZu9HxuFgvijhEsJBPIdG1LFaHEauQkftyWH611yKIoMA6NDz7grMUx+Qg/+dX2Hs4at7rKndzp76J9rR9haQYNSU0ZloL1YwV+KRZo3Qs+0T+/6RvgU46J8ODkiJ8QM5uoMJfdecE6xG4KGrKs7lMZtBYXf3DCqxSX4KsuQOT3mYx6HTxJq0JKQOsWOdeoPVU2cthxqLbzkmg1Vh3d3GbG4kwz8SlIEgNvYgunIG8pONo05u71G9lOrEJ7URYpj4jpM8ZKMHpdF993jhEmmfx/Jm843DZftfwmn/mgLUx+MWb4CWuYdwwo72YVvg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <eab2dbc5-7cdd-4e28-8e4e-3f5ae5c522d5@epam.com>
Date: Tue, 17 Nov 2026 21:47:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] xen/arm: acpi: resolve MISRA C Rule 11.8 in
 acpi_xsdt_modify_entry()
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1793699713.git.dmytro_prokopchuk1@epam.com>
 <3533b0c51c28689ae7ef05cf8ca88b49d72eba5f.1793699713.git.dmytro_prokopchuk1@epam.com>
 <3949a7d5-8249-4656-86f9-1b86ecf6d01f@suse.com>
Content-Language: en-US
From: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
In-Reply-To: <3949a7d5-8249-4656-86f9-1b86ecf6d01f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: AS4PR09CA0020.eurprd09.prod.outlook.com
 (2603:10a6:20b:5d4::7) To AM9PR03MB7526.eurprd03.prod.outlook.com
 (2603:10a6:20b:3de::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR03MB7526:EE_|MI9PR03MB911483:EE_
X-MS-Office365-Filtering-Correlation-Id: c077b765-a396-4932-3f81-08df44e391b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|22082099003|18002099003|261009223027099003|4133799003|56012099006|4143699003|261026140227099003|11063799006|261102123227099003|261028144727099003|261026130827099003|261026135527099003|261021133027099003|261021130227099003|261022113327099003|261022075727099003|261026121527099003|261021123027099003|261022115727099003|261022105027099003|261021135927099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	rOPAwQ2DhncboGh1XvW80lJf9unPD6i0hOMdIPeJ5a6dCvZ6lYuBbYl4TMzJIFijYVbexAfjXdkjOlN6QST4WHeuhUlCHbI5nc78Q7B1rG6NybnZslxf7m+cQs8Thl1dGTQSiqAp2rZPKxESYvSZ7g2BTu9fJMgfaUUZ6uJAm8yfgT+u3QjrNK0gAuWgIoarzgoaxe5yrZhigDSyhTEA54GW4znD/CuPXD2NxTx5TP3bVWDlFNu/8FKzHypZkXjoSB7SoS0MQkTDv6FeqNCAVKaklHvlEmMDudE9TpCirKsCl0ncyqtP+BlPJqX5G1G56qB6KauAHdLv5vUEqupMBa0+rMrRCTmpA6vzjUq9SxtriWV4BVGL0v57uVxYbQOtE9aR2zplMnJJdAWdFCTI28gh37a7TeM235io0PGaw3gCI1ABhmfVpcjZJIEnh/jdJX0yIaRbDmx4PRn5v0tG1X8bow5rdCDUwPU80Z/fqUlGTMO954yLzt+3Z5an6mAeentz3BQ2YD1UY1mMHQK5IZdAl2H5NztVfiwujn0d9/ql9pRKzpgUax4URngAHSstGF/bO8xcEfHX+NKTi4AvexleOqsc38Blbo2w1bS1DLBvZ5znZpbj5Lu1QYd0/AhR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(22082099003)(18002099003)(261009223027099003)(4133799003)(56012099006)(4143699003)(261026140227099003)(11063799006)(261102123227099003)(261028144727099003)(261026130827099003)(261026135527099003)(261021133027099003)(261021130227099003)(261022113327099003)(261022075727099003)(261026121527099003)(261021123027099003)(261022115727099003)(261022105027099003)(261021135927099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTJGWWZ1bjZ4RFR4L1BVa1FGVUdXaGVSOFVqcGNETm9jdktkRXVHOGE2eDBl?=
 =?utf-8?B?a015V2pXWmVEbWQ0d2RQQ2ZhVmZPeTY5dUU2bjBJcCt5V3VBZjBLSlJRVDEx?=
 =?utf-8?B?ZXBweUhYK2xNcUdVYzlRQ2luNnJQdzRtMGJhVTBVV2VUUHZZUjQvY014ZU1i?=
 =?utf-8?B?RTdKeXo5ZnRzeU5xQlB5Z05DTEF2RXYzcnQwYzRiR1ZGSS8xaWpSZ2NCMmcx?=
 =?utf-8?B?eWlvM0FQRnZvNk45alR5djJIRTZUVDBsSkEzRENrL2g0SCt5Mno3YzNzUEs2?=
 =?utf-8?B?d2c3eTlsWHRub3E3Qk1lUmRocnppdTNsS2FQaUNaZ2JQQW9uVS9yQzN3M24w?=
 =?utf-8?B?VElmRWRkZmgrUHQxdjc3cll0REh2eGNWaSt6aCt4RERBUC90Q25FMmgyY3k0?=
 =?utf-8?B?M2VlMTArWTRuR25VYWdCbFRYNjRIMmhDZmZhVDc3SHcrQ0tlZExmWWtvNzNC?=
 =?utf-8?B?NkoxYmdMNTcyQm1RZm1KOW1IL0RJTWZIRm93Q0M3cW42Vnd0OFF4bms4b1JU?=
 =?utf-8?B?THcveFMzVElOclVyUVg2YmE4c3NtcThFRWIzUnJ3cThITXF5WGw3TTJ1UW1Y?=
 =?utf-8?B?TU1reDl3UWN2VEZtY3FJQnFtSEcwVzRLdkVMdWd0TFBNZngwTUVzSWtFUXNs?=
 =?utf-8?B?b2FTVWlaa3JXRTlJd3Rrelh3MGMyb2N1QjFkNWpmM09DZG9NaklOY2MydmJE?=
 =?utf-8?B?QlRLRVRXZkIzSGZXK2M0Y3YwU2hoMlNQUVR3dVg3aTNVd2NQc2wvcUxodjZI?=
 =?utf-8?B?bkpoaldSMjU0WjNOY0pONXBXcnJyYnhKNGVJMFdOQmhzd2Rzd3lxdjRoNlk4?=
 =?utf-8?B?blVHSG5RRHFzVDFqY2Q2U29KMEhYbTFlS1dUWCtKM0twVzdTWlVQNGxaaTBP?=
 =?utf-8?B?c3U4dmYzTFNCYnhjd3pLNmZGZHZydVB0M0E5dEdDZE9ZSGJoeFB1N0w3Wm5F?=
 =?utf-8?B?T3ptMXpmQWNCTVBENDdpd2VZbldKK2RIOEhyUnZyU3BFQjg1VWlNbHdXR0Y2?=
 =?utf-8?B?WVFZenlGeUpUSUFCcG03MER6S2J0ZXlNc0ZqTExCbWZldnlkL2g5VkJ6ZFBZ?=
 =?utf-8?B?Njk4L1QwM0pFM0tDZWN1eTJnR0kydkR1YVBpU1BJYzZqdGFLMG1wY3c3TmRq?=
 =?utf-8?B?WG5wRW5KU1ZETy9RZ0ZSODh3MTZVZEF5M09aZHFKanlqdCtBOUhOQUpqT0RJ?=
 =?utf-8?B?Ylpza0dSQjlHeHpHaldiQUxxMDFJa0dna1ZYZitKVzNONDZ1QmhKQktOZzhF?=
 =?utf-8?B?d0RjYTNyeFhIQ1lKS0ZqV09vZldpZVBVZGNPRzZ0NUM1ZCtVWk83d1pJM2lE?=
 =?utf-8?B?bjFsWGh0bkFtWlZWUC9VcjJEU2lwT05TL2RyOWhYMTBpZTc1TW1POEdURHpt?=
 =?utf-8?B?K0hxalNvdVE5L05OY2pOVTdDZ3JoODRMWHhDbFRjWUFWTjlyaU5OZUQ3MGpr?=
 =?utf-8?B?blRTS0pJc1h1U2UrVE1nUWpEQ1laVDIrejFtQ1EydmNTQTlMV3BRSVJWTWxG?=
 =?utf-8?B?MmRkVWtKOFlzSTNLbzh4bU83SVdKK0U0VkM2QkE4QVEvM0FqVlhiY0wvbjZZ?=
 =?utf-8?B?OFhQV05yRUhwLzlkQmdob2lXUjVuUVkrTXVndHF3cU1XOVVJay9VYmtScG5T?=
 =?utf-8?B?enI1VXhQOHpPaDY2OEZFVktUcUs1WEc0Q1lNei9lWm1Zd0R6VFNFdlMxSGZS?=
 =?utf-8?B?N3lrSlM2YnZwV2JmVXc2MzZldTRaak9LbGhUYlY0eTZSRGRIRmJmMitDUi8w?=
 =?utf-8?B?NUZ6UVc2Ujl4eGtPRlVSM1RTaG5PNjg5MTB6ZGhWVHVYWXNNa3ZicUVWckcw?=
 =?utf-8?B?WjUwQlBna09KVUgwZTF0Q0VEMEY1ZXJib1F6SktoUi9TdjhkTTh1bU0yek5E?=
 =?utf-8?B?QnlVTmVaaE5reG13enMxcWVVVVNQRWNqTWdPN2FYTTZ6SzcrOTAvVE4yMTFR?=
 =?utf-8?B?SGpXTWFIWS9KQW1GZjlDZzNnSkFpeGxpOS9lQmpEVzZYallOVkFjSTJlU3BT?=
 =?utf-8?B?TXVlWHNTbEo0TEZPcDFmL0ZBUUpoZzlEUWxiOFFDMUdEbXpZNklQSENheTZo?=
 =?utf-8?B?WXRoaEsxNkhqTnRZSkVvaUNtU25ORm9CL1lTM1hFVmc3bE9uK0R4MnMwcFFy?=
 =?utf-8?B?Ums5aGRYYTlnWjVUbnBxQkNXVHhXRnp5Q1FmSFBjOVR5RllqMXJST1JBTUxs?=
 =?utf-8?B?RVNHdktqNG9VUzhTMDB2azJUb0xRWjJLblVnR2tESmlXdkY2MTdZS1JhMVNn?=
 =?utf-8?B?d0VxaGkyRDVjczNRYWFvSkFqTS9hWjc1TmV5NG94UzJXZjRhL1dxeUViMDVo?=
 =?utf-8?B?WGRXYXN2QmgwY0VpbTNmSVU5SEVPRUt6cDM0bUhjTG1wNzV2ZVZvTEpBZWdo?=
 =?utf-8?Q?YZqz92gs/c8HmoRY=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c077b765-a396-4932-3f81-08df44e391b3
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 19:47:10.4181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ct9r4SwF2y6T3eBXDnlXEtqMxxOxgLsoi1tpPhar8X/QFLf6p3BYVFonFVw6M3kSGHpdMUgR901regxasK3LSgDKoC7BXsLJ4KVxnxSqN6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR03MB911483
X-purgate-ID: tlsNG-bad1c0/1794944833-FD469034-C80F1031/0/0
X-purgate-type: clean
X-purgate-size: 1421
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/3/26 12:34, Jan Beulich wrote:
> On 03.11.2026 11:29, Dmytro Prokopchuk1 wrote:
>> ACPI_COMPARE_NAME() casts both of its arguments to 'u32 *' through
>> ACPI_CAST_PTR(). The 'signature' argument of acpi_xsdt_modify_entry()
>> is 'const char *', so the macro casts away its const-ness, which is
>> a violation of MISRA C Rule 11.8.
>>
>> Use strncmp() with ACPI_NAME_SIZE instead. It takes 'const char *'
>> arguments, so no cast is needed at all. It also avoids reading a 'u32'
>> through a possibly unaligned char pointer.
>>
>> No functional changes.
>>
>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> 
> Worth mentioning perhaps that this (apparently) is an alternative to
> https://lists.xen.org/archives/html/xen-devel/2026-09/msg00044.html.
> 

Thanks for pointing that out. I should have referenced your patch.

> Jan
> 
>> --- a/xen/arch/arm/acpi/domain_build.c
>> +++ b/xen/arch/arm/acpi/domain_build.c
>> @@ -253,7 +253,7 @@ static void __init acpi_xsdt_modify_entry(u64 entry[],
>>       for( i = 0; i < entry_count; i++ )
>>       {
>>           table = acpi_os_map_memory(entry[i], size);
>> -        if ( ACPI_COMPARE_NAME(table->signature, signature) )
>> +        if ( !strncmp(table->signature, signature, ACPI_NAME_SIZE) )
>>           {
>>               entry[i] = addr;
>>               acpi_os_unmap_memory(table, size);
> 

Dmytro.

