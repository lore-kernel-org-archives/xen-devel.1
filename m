Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81988606A335
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 08:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=m0prqe82
Received: from list by lists.xenproject.org with outflank-mailman.1490230.1691160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSs1t-0001Hv-6o; Mon, 16 Nov 2026 08:25:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490230.1691160; Mon, 16 Nov 2026 08:25:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSs1t-0001Ho-3J; Mon, 16 Nov 2026 08:25:33 +0000
Received: by outflank-mailman (input) for mailman id 1490230;
 Mon, 16 Nov 2026 08:25:31 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xSs1r-0001Hi-P8
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 08:25:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSs1q-00HNZj-Ui
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 09:25:30 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6afabdec-8faa-0a2a0a5109dd-0a2a450391a8-40
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 09:25:30 +0100
Received: from [52.101.66.102]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6afabdfa-fae8-0a2a45030019-34654266fe23-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 09:25:30 +0100
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by DB8PR03MB6218.eurprd03.prod.outlook.com (2603:10a6:10:13d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 08:25:29 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0592.009; Mon, 16 Nov 2026
 08:25:29 +0000
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
 b=E/RwifKXh++9h7LDC9yzncQTxo0+XB4up14mn+Z2zvDGsRvXmjLqB5Kppe/hwiZdrOq5xRxUN2VvJJNDVlU9kdJZ2yoH7cxztad9r0zHBSL3+13LIPl0odXKKqBwwQ4zGdn4Hcpe4YP0Heo3VrSz3rZAI18rVpICXddvQ+0/COGelwBcwCPKlxeaJbWdCeos0aLM3zfC7tIKM+JjjmYR4GYm/w+KWtUO+I9yOPuuifk5P6DMQhOZId4/QVoZljnSP5gRqrKSjTrwFYRh4jz+iuSBCScALwC6IgnliNptRPn7y/+FjM2PCxb4w/fr3TAX1ZvZfZFQExP5STie2Hgoew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mc/pwjjp4loY/3YEWg67ubJK3VxtoO8we+DA/8g0xOA=;
 b=KTtdDotRkgyTB8Vlbc+Bvzr6zYHwi+zx4YlldmqArKwn29UWQzinAwOvwOG1mkfc0KvFJMWhChXxBcFQd6ongYhKSHQ1LeIi83cbzJw67CSlMY50DtuMIjFhJVlNIGA/KtBjOvi/eWwzK3yX5ULqcgHFXZMcuqPo1ompIxN3Qmj4j7/J9tyYNH+Xzo7BEILUz8PezAHvgUmtQSmgfYg4OQVitkVULVwja/CjTKwa33AShXoU+4P1lHwkzULiOjcqe46Vkdbe5va2yu41DJdGUn5BQAtbUKH1sOrOeSpUo/EKvu9dNm/XYjS5j9bdMfHPSOI+ZQQ8O6deTXA7v36KJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mc/pwjjp4loY/3YEWg67ubJK3VxtoO8we+DA/8g0xOA=;
 b=m0prqe823trrPs5daWskZ6qFjnFVT/HjEVkdQyRkWRDaI3UuAoLJuKhUiaUQj4RN4G+brRWs9n5L1j2b83O4Ji2BjrBbfLbqozFoOVM2II79/HgoOWpVpitLW7859nRNZALjfrK66FLrkunah8cu058PDqeFkCFqXBaoj01wh8u0Fue5MJcxRW6e8/XcY8Am4+akcAWRTvnZxxNow8HzATlfkr31EFvRY+YDMBBFHTA0PsWAXklfaisbCZUEY4VsZ/K4LHcM4dXhVVXTKeUJMbokBY+i8oNfilOmQy4jYGGQe41ciGgc9EJEtcfRXTx21NlhRuYEL4zWUlpteVuirw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <6afad02b-03d6-4813-ae03-65562578db90@epam.com>
Date: Mon, 16 Nov 2026 10:25:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misra: deviate MISRA C Rule 10.1 for boolean operands
 of arithmetic
To: Jan Beulich <jbeulich@suse.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <810b14fef78b77572a87a7268aa718274b975f80.1794298911.git.dmytro_prokopchuk1@epam.com>
 <21557e4f-305e-4a21-8c57-aadcb77fabd9@suse.com>
Content-Language: en-US
From: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
In-Reply-To: <21557e4f-305e-4a21-8c57-aadcb77fabd9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR2P278CA0028.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:46::8) To AM9PR03MB7526.eurprd03.prod.outlook.com
 (2603:10a6:20b:3de::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR03MB7526:EE_|DB8PR03MB6218:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b853b3e-ab64-4ff2-7831-08df43bb2c2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|376014|23010399003|22082099003|18002099003|261009221227099003|261009223027099003|261022105027099003|261021121427099003|261026121527099003|261026140227099003|261028144727099003|5023799004|56012099006|11063799006|10067099003|261102123227099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	FfCOAaXIv0ZMJQWY3TN2grmcjt4rTv3TtHq4I5vCNvReAyIrHV8DcEZowXhlB7lBCCwkq5SEUPGMXJLj0EF18+JJHk+rjNlrPMAIwdm5YdG0eedTKPq+pfc+bEkDSzJWGk/iYkNmz03JIvzCx7MxuyyLvIT2DVPScEi3SNdDoMYgjnZw9+vHSNc249sPayILRcLHZA1KuEf7Ot+WKYURfhyS5SLDmpMOBEzxRa1A2ftywXhr9vjVaiyiBhUM/5bhWYIh1Ay+mmex7J4NHQ2ETJKtDBEqWjzFWRbBFHqvYpMJL2doEYOtd7p1hAgISkaoi005nS7dny5ASczhS0VpMmMsEWgmdSI0Dz3kX4YaMGphzlRkTeVIdYgZpaoKIVfBukeRrrNvlw8CkpWMSmXaAul2TR99aq3q0/tmDb9F2QrGvmRiov74F9YUN4f1EiOKF2HGpjanf+bEHDKb5Wsn5Jse9Hqe/rkTdXISO4dll8ydyiU5PNwvTbFAIwwH2t9oa1Z2utegBCxT1eUAs+mSBqsDLZTddY3XYtSJtPi9K8q6M6OTpQu/oNyL9eY8IK8Ufy6/LKBfeN9xNBzv8LRxxG0tIZ6nXu9b1yFTVxyXfSqsZvBDbYRO6HNbGVq1YJ9TW/8RBsn2mZObhQnON/YxhtnBHJ1ZQe13Kq8xMht1ZsY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(23010399003)(22082099003)(18002099003)(261009221227099003)(261009223027099003)(261022105027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261028144727099003)(5023799004)(56012099006)(11063799006)(10067099003)(261102123227099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVFjY2tvR1VuZ1Q1YTJaVUFMRjQyaGd6a2tkdzNWR1FBa215OStKbTZsQnda?=
 =?utf-8?B?RTN3TEhObFd2N1lIMW4xaHJYNTUybkhYU2FxeHJ3cHJlaDJxTkI5c3pyeEZL?=
 =?utf-8?B?bytpcGVKYm5QYXZtckFWM2xtOGdnYWJkODNBV1ppM0VYTXZ6d2NaZkkyckVJ?=
 =?utf-8?B?K044Rmg4VmdYQ09SbnJtK0dHK1k0WldiOHRCbktPa3hQa1N2QUgzTHAwVlZq?=
 =?utf-8?B?SGlGWCthV1FHaGtNSTJIa0t5V1ZsNUI0L1dDdHlreFpSSWpXd0xaY0RiQ1dl?=
 =?utf-8?B?N3RjTUVwZm1yU0k1Tk54N3ZRRVlvVHMvRlJSQzRkNFpMcTlyOFRsaGswNFpy?=
 =?utf-8?B?MGUyNE9hK016ZEx1eUZHT3ZyTGx5V0Q4ODNYdThvbVpNRzB4RXJQZnkrcU9Q?=
 =?utf-8?B?dDN2dDBkdk5ybnZ4bFdaczdtbTBGNEdtU2FlYXlhbUR5OGVTY1ZuSkVWMUND?=
 =?utf-8?B?Mjdja1NuMDNUOU9qbW84RGpkamZLWnRyRzZwQSt4dURJQ0t5NjVUbk5OWnRv?=
 =?utf-8?B?VUxZY2x6dnc3b3hTWVhMdFRsT0NqeGNDYkNkR215aWxzSFhBdE1wSEJtc0Fa?=
 =?utf-8?B?U1J3VXBLYk1UMlRncTVuN2xJSy9wYld1VTNqb0RnSmYza2ZtVTV0UGtNTUdG?=
 =?utf-8?B?NHVOL2NnYzlhYWl6TmlNMTdBWmJQaUFCR2NqbEEwRmZjSWVLV3hwQWhEMWNo?=
 =?utf-8?B?RU5XbU55dThpbmZabkZhYkYxSnV2THBqcFNrWlhnTy9IdVBsZlhZdVpWTW1W?=
 =?utf-8?B?cUY3WVZncTlwL3JQMkxRSytYcEc5K2loVEhYRjJsb0JJL1lqNFBtSGExVzgy?=
 =?utf-8?B?Mkl1WE1Ieko2QTBhaFRNeGFiMGlZcW9JbC9OUDk1a2gwaEh3QVA1Y3VsQ1dR?=
 =?utf-8?B?MUdJVnk1WWhiMTNuR1hrbnAxdHhPcXRSMUE4UC9sOWY2VHlMR2FuUUVGSm1R?=
 =?utf-8?B?VUNzV1pOanVHSVJZV200cENLY09pNHYrc1FGWkVRSm1RMi9JaDNkdURJZGFK?=
 =?utf-8?B?RVBjZ3AzNGdzNVNBTGc5clpUMkxQbU44emZBalZTbWQ0dHhxV3lsU1FkUU1B?=
 =?utf-8?B?ejVlSytmT1ljZFlwQVBxeFF6WFZoSi80TEsyRm9kUEhyWjJvYjAyWlVKMmNW?=
 =?utf-8?B?M1FVVGtxdVdubDJOd2tMODk5UzBpbmVsZHR1UVN1dHpZcnpVSFVFS3BjakhH?=
 =?utf-8?B?bmtTZGRrMHdVY3Rvc3RmN0o0aUpRdWNwWk9pSmJXOGFSRnVOdTFhc3pFMFBO?=
 =?utf-8?B?WHg3UzhtTWJZTEUrS2REWHZybi9BakhoYlluVHhHQURQRHZnUks3WWdyTGdX?=
 =?utf-8?B?aUV2eXJyc2FxUzlhOXA0a0FPS0FvbGN6Z0dUSFAxeXV1SXNvamRUTDRwL3pS?=
 =?utf-8?B?Q3Rvb0hPTDQ3TmZHZE43OVlPVkFoZHJZWjFPUFh5dHhhbVFpeWkxaHl6UkVH?=
 =?utf-8?B?c3pCcjJscW1CY1J1QytwTnEwZTl1MDRKeWs2dGdCUVM4SFpVb3B5ZUl5SW1k?=
 =?utf-8?B?YVp6RXVXbkc4am9aTUZZREhhVlhyS3NmWG1rMWQ3SGdRcmNOVFowQXlMTG91?=
 =?utf-8?B?T1hHVWRZMjFvSnBYRjNnQ2gwU0ZvcUgvenQvUURvQnE5Tzc5OERiZzJWT3Y0?=
 =?utf-8?B?SC9uQTBhZHVkV2dIcUg4Qmk3WVAxcVpyNHM2YVI2TUtXcjRKMWFiNlM2WTZU?=
 =?utf-8?B?ZUd3OFlJWkoydjVFZWJwQUh4Y05kZHBCSktIVlJ2Y3A0SG54MUtyS3JVNjhs?=
 =?utf-8?B?TGE3NzBVS1lRVUMzU01RdzdzVlRjMDV4UzBXTUZKSUtHMUtkT1BXbHpPcHZJ?=
 =?utf-8?B?OTRudXVnQUZjRHpvbTAyMStHK0M1OUlVWFBVN0txdFY1dG4remF4Z0VENFpK?=
 =?utf-8?B?NUZPRWljaHp4TmRIaGpVVDJhbCtXeEtxV25qNW5vb2JsSTdwWnhNU2YzNEVs?=
 =?utf-8?B?dXFYcmpCbTNRTTZWLzNCdVRhd1krbUppbjgrT09VSXovdHN1U0piRzRtcFZY?=
 =?utf-8?B?NDJ4NUF6NWhmZEdoQUtyS05DQ3V3czk4V1RCQUNEUytsSk5uS0ZaN3EwelJD?=
 =?utf-8?B?cE9KaWw2YVFmV3lBOTI5N3ZYdjM5UThwUVBsb0d2Z0pOWnRwYVc5b3BzWkND?=
 =?utf-8?B?U2hIK1JQRCtXd3hoR1liZjFjUDBmNnFEWVJmeXR0RU5mU1pEdFViMnJqMlly?=
 =?utf-8?B?M0Y4MklKcno0RWtUd1BUR0xoUFlBLzltWkJzZm5aN3JtbFA1aENUY2FTQks4?=
 =?utf-8?B?SXZMS051VFVtNXVpU01uZ2NCT0pYNVJoQ3A1N1R5eXNPNnplSVAwN1Z1amhU?=
 =?utf-8?B?a2JvNjd2K1VCMjBtWDhoQVR2Vm5yeWFqNHlUVStBT2tLMjN2WVdMU2FielBa?=
 =?utf-8?Q?lnGGHuoEq5np+q5k=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b853b3e-ab64-4ff2-7831-08df43bb2c2b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 08:25:29.0697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QE/5sfXE01vHwqCJAmDHjRCQACRXf4YItdDA/kV+T5qaWMoCVEEttTy7j4NzPrLZfjY+nVOeDWUUyuUossN+UGF27ZtF1st9SOrj/TdzgwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6218
X-purgate-ID: tlsNG-33051d/1794817530-75EFF4E9-3824B734/0/0
X-purgate-type: clean
X-purgate-size: 2515
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/10/26 11:58, Jan Beulich wrote:
> On 10.11.2026 10:25, Dmytro Prokopchuk1 wrote:
>> MISRA C Rule 10.1 states: "Operands shall not be of an inappropriate
>> essential type".
>>
>> The result of relational, equality and logical negation operators has
>> type int and value 0 or 1 (C99 6.5.8p6, 6.5.9p3, 6.5.3.3p5). An object
>> or function result of type bool has value 0 or 1 too, and it is
>> promoted to int (C99 6.3.1.2, 6.3.1.1p2). Using that value as an
>> operand of binary +, -, *, <<, >>, <, >, <=, >= and of +=, -=, *=,
>> <<=, >>= is well-defined. Division, remainder, unary plus and minus,
> 
> We did discuss division and remainder. What's wrong with unary plus and
> minus? Unary minus in particular can be used to create a mask value from
> a boolean (all bits set or all bits clear). And why would unary plus and
> minus be excluded when bitwise complement (which is less useful with a
> boolean operand than unary minus) is not?

Agreed, there's nothing wrong with them. Bitwise complement is already
covered for any operand by the existing deviation, so excluding unary + 
and - is inconsistent. v3 will include both.

> 
> As to relational operators (which it looks like we didn't discuss in v1):
> Is it possible to express anything with them which cannot be expressed
> with equality operators? If not, I'd suggest keeping them out as well.

No, with 0-or-1 operands each of them can be written with equality and
logical operators. I'll drop them in v3.

> 
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -335,6 +335,10 @@ still non-negative."
>>   -config=MC3A2.R10.1,etypes+={safe, "stmt(operator(logical)||node(conditional_operator||binary_conditional_operator))", "dst_type(ebool||boolean)"}
>>   -doc_end
>>   
>> +-doc_begin="A 0-or-1 Boolean operand of binary +, -, *, <<, >>, <, >, <=, >= and of +=, -=, *=, <<=, >>= is safe. See docs/misra/deviations.rst for the full explanation."
>> +-config=MC3A2.R10.1,etypes+={safe, "stmt(operator(add||sub||add_assign||sub_assign||mul||mul_assign||shl||shr||shl_assign||shr_assign||lt||gt||le||ge))", "src_type(ebool||boolean)"}
> 
> Imo this wants shortening by making use of regex-es (provided such can be
> used here).

Unfortunately no. Unlike file() or macro(), which take ^REGEX$
matchers, operator() in ECLAIR only accepts operator identifiers or
predefined operator collections.

> 
> Jan

BR, Dmytro.


