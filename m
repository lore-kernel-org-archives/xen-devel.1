Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93664606A325
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 08:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=Pdk4F5jW
Received: from list by lists.xenproject.org with outflank-mailman.1494063.1693751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTbU9-0001oD-0Z; Wed, 18 Nov 2026 08:57:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494063.1693751; Wed, 18 Nov 2026 08:57:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTbU8-0001o6-SO; Wed, 18 Nov 2026 08:57:44 +0000
Received: by outflank-mailman (input) for mailman id 1494063;
 Wed, 18 Nov 2026 08:57:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTbU7-0001nl-Lz
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 08:57:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTbU7-004kpD-25
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 09:57:43 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6afd687d-bab6-0a2a0a5309dd-0a2a4509c928-18
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 09:57:43 +0100
Received: from [52.101.84.114]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6afd6886-be1a-0a2a45090019-346554721259-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 09:57:42 +0100
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by VI0PR03MB10685.eurprd03.prod.outlook.com (2603:10a6:800:261::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 08:57:38 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0592.009; Wed, 18 Nov 2026
 08:57:34 +0000
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
 b=RXXeGfCyZtpeJ1YBPkLKGcU/KeaovFt3OnWUNf+Lh+AIp4W2T5K6wgHbjBVZrnloIFS8yprR0VsXFb5611M17wbKt77fVO+kpEkmF5bSQKDjFueVKysUBa+X/ze/tHrm9K1NVLW96JzUD3ODO+krP3mh5YtstFbmEBW8yZ4w0zj6qfI5Ysn8L40NcCtmBIMdGp0hVvO1iylHMNcLdfVUbF1Zs6hqYLmk27wraGjPU/Kl9/fUL6OnhHGroA8I1CMdXA6nfAH9YsLkjIt6Cz/DSXEO3L9G71BjiLts54vP/m7vTcL9gMV6zHmVQaXNHT9S1w26YABfYywd79nw3Rh1Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ySiYqjCFjN2XiVPiNpAsAed6vySI7lf7A6MJPRbnKo=;
 b=i53eEXJ4PR1Yhkjwj3aR0KywHrSCxVeUy3SrsgZh6DCmvlz0bdDOZCWdBhj/TM+0xMZhLAn2oyb1q3rX0Xmsj6BHQom4/V3zOPFv0rhfeJztm57cft2qZZEFsyUk7jpw7nCBwVRdPu5jy2w1JjlZITxA5CbK/EJParT8PezHDiogTgNaz05dKq776B0aXcuIdWs1KI61VErrL7X5tIbk9k0TCBhaUob3aNmzbfHn0X8hIrrohT2yEW6RtYvlvHJ4amFG3ihVV0rUjCJWG1y8FO6c25r3+baj52EGSmhn2Tk39AB5sWBekkzBvTzPg1UXIE2J/m7O+sbKbRYtSaN2fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ySiYqjCFjN2XiVPiNpAsAed6vySI7lf7A6MJPRbnKo=;
 b=Pdk4F5jWihC0lxPh/CXpW5+qE5soZRWIBV/kDK9XQku/ksPG2BfszRRM1hv+KDbvtTdS1Gw0pG2qIAljT3L65uOpcPpmYzY838w5+x+Vu43KN2d4ymv2eaLwbeCAZytlq8Bq4Y6ORW9F6eK+UfHEVCUBQIkfN4qL6ydY8pd31l8TuSWc6ZYKUOsvAEzkPPJbuQGMzEA8aE3ycFbP0DdIA0Eecw534OK6EgNyRdgVgbKdpC4O6d49R4W2qJpUcdJhgiBbEIz8leD1xyFvShpHFcD5kWYnf3/pX04ARSv0lgwZwFgZA1906loDgwDiCsnAWugH9M/8Eao/0sewbaQNrA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <8f688b2d-99d5-4bbb-9505-27eb68917288@epam.com>
Date: Wed, 18 Nov 2026 10:57:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] misra: deviate MISRA C Rule 10.1 for boolean operands
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
References: <d02a8b799661f9e58be3b39a31ec1c07eff3fcf4.1794939649.git.dmytro_prokopchuk1@epam.com>
 <c116db93-abe5-459b-aa89-45fc89f477c5@suse.com>
Content-Language: en-US
From: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
In-Reply-To: <c116db93-abe5-459b-aa89-45fc89f477c5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P251CA0024.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:50f::26) To AM9PR03MB7526.eurprd03.prod.outlook.com
 (2603:10a6:20b:3de::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR03MB7526:EE_|VI0PR03MB10685:EE_
X-MS-Office365-Filtering-Correlation-Id: feb1a077-4380-4bb1-de77-08df4551fcd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|261102123227099003|10067099003|56012099006|11063799006|4143699003|261026140227099003|261021121427099003|261022105027099003|261022075727099003|261028144727099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Ynn4i5wS97+gLMsCs/hAxGGrDlvziQwIE22yJsd/371xfD4dZy3NCJtTT0VP+YQS511cLSHJtapnM7OvRwtGV++1GtqAXfdnKW6ku664hwTXaPczG1zLgDKxmShTAUmWLyiub60SrwKChV39PIhU5N/N4zRRRd6NmC1SGhy3TwKXmEzblMVZwJCagKQvyn67oJLYhKa64MMmrCRUPQwPwsgZFZ2ceyC0KZ4T/kwKVvrLgz9KLNhFZeog/IbRE15jvmViPzfz/8qJwhzR4sDzscqdh5jvXqO0o2nMy7zI4L6pxUpekzRw0CeFLwCbnD2o24cdj7FsJck8dLcjncHfbxPXV/bDhbJd32oyScJ5j7ditWIOjId1GLHTesiq54iX1GXhGSvJI3yHudI0VcL4xLqv8OzqNTO6x/uPJl2b518bss99P9+8nBumCZtVX1WvyEBq56w+ZznXKArSdKZgmPHr0j924A9mSIxxixQnKxlNZXkMcd4bIqJ87EGHX8ll+52yqe+6IzRFt9Nv464Yeu/mfCGcdSiIQFZ5vJIAMxcXO0GqaNtZUtCVtarx6AwV2Vqlp5tyqwYLaSwdJj4Z+UzHRzHiKACc6FZ6i7USEad4+ltocPDXp6hqdgKeiQNozsykqifvv7vKb3G9khhBYDZTJ+QtS61UsbFOR+ICpuQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(261102123227099003)(10067099003)(56012099006)(11063799006)(4143699003)(261026140227099003)(261021121427099003)(261022105027099003)(261022075727099003)(261028144727099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2FkLzdVNGFCMTNMMjZOa2k2eHBSRFJQRXVuNHh0cVBvNXd4ZU9kb01wa295?=
 =?utf-8?B?bUtQTkI1MXY0Y0MyejVXcmZpRjJFdzBmZmVPazNHV0N1UTNLYXpiaU5qWkZz?=
 =?utf-8?B?a1pYMGVxRFJGWVZndWx1NGx2Sms2YTBwUzRPOU9DTjhEVjVyNkZCOXRDdzk2?=
 =?utf-8?B?d2t3Zk54WFd3ek1Vcy9iaEdJYTJ2T2ZCekxubjJtbzg2Q0wzQVlRT2hTZWhr?=
 =?utf-8?B?RmFvOStxN3ZhRk5LV21IS0lSZmJwalk5NWhEd1FHUTdkVW1IaFM3RWZvUWV6?=
 =?utf-8?B?aERSbXVxOGZqYUxzTnJQRGdibVN4cFBMbnZxc0p3NkF5QkZObWk2SzV0Tzdk?=
 =?utf-8?B?QTZLT2tRRzNNL0tlL0xDbUFaWGxuUGVwaytWc1VUYk5Rb090TTNLaVNJTW44?=
 =?utf-8?B?OHFTTkFYZWh0ZHE5MUNaajVaWWlRME1JNFl2OTVOTUp2VzV3eCtUTUpveVZY?=
 =?utf-8?B?ZWUrRWlMeFkvcWYyT1F5d0xRT2NwalRCS1JRaFJIVVl6SDFhZktIU1BwalNC?=
 =?utf-8?B?R3pSRVhVbEhBOThHbVBTQStyckxWUG9qNk9DSEo1ekJtNXRLd2kwdERJL2NY?=
 =?utf-8?B?b0I5eVNQWk4vQzBLaVl2NHJaT05IblB0N2VOMURSMHBEdUpZbGU4V3BLYW5W?=
 =?utf-8?B?UVcvRlMzeVZpTkFpWm45KzV1MGtsczFSajhsUnZPbTVyZ0ZpYU1zUVJFcmc5?=
 =?utf-8?B?TVpicEhZMTZtalBXOVVpclliRkJyVlpQRU5NVU1ZSmcrK2s3WlhPeU1ZbFNZ?=
 =?utf-8?B?MFdQWlNmejAwSmxITXFPVHpsbSt1LzdjMmxXYnRoMy9Sc0Jmc1RaeVlPdlJH?=
 =?utf-8?B?WWcrNTFrTkJoNzJrUFhaQkVaTks2UzNhOVhRS3lmVEJQOVR0bHFhVEtLMDVj?=
 =?utf-8?B?eWxUY2JFV3lsQVFsSnlBZWU3QXA0bDRxUjNTc00ycG1oV1lCblZHV0tLcHJT?=
 =?utf-8?B?SzA5MTNvbWlNbTVTejdNTXhBaDB2KzVRR1ZsK3ladjAxUGczUDNMT1NueWI5?=
 =?utf-8?B?RmJQd082S2JzQkdjbmZ0SFlxUTVqeUFnM2c5Wk9NdTR5REtiVW96V0QwSy9l?=
 =?utf-8?B?MlJ5QXRPUHRtZk83Q0E5c3pQMEVrS2ErYUVzazdBcUFrS0VldXhya3Q4S2xS?=
 =?utf-8?B?TEtuU0s4aW5neXVrYTBVRm5HUHFaK0lLa0I0d2VmeGhpSlQvbEh4UE1YNnhQ?=
 =?utf-8?B?SVpJTU9BWm9xbUIxTGxwaWFUaEo0c0R6QWwyVWVZMDhvakprRS83T0tTcXRv?=
 =?utf-8?B?ZW9WelRKOG4zZmkwRVBuRlZPd1ZnWFdVbk5pMUt0TTAvaXNaclgreVMxanZs?=
 =?utf-8?B?VDFjd0pEUUNiN05lelFSM3Yza0JIMXVXamRMNjRSMnN0c1VpVXJnUC9qNWFM?=
 =?utf-8?B?VGg5ZWQ2Qlpvbk1vVXhvbE9KbmxPb3dpY0JkV3duc0tRdU04NXhVWlRtOFBu?=
 =?utf-8?B?anFWQnM2eitKbDlaU3NyOGdFOGVoZUJmNzg2UDJuZVd3ZmgzTTM1THN0bnhT?=
 =?utf-8?B?V2hSVlEvTlBVZ3RFQXlBc21aV001S0dVblZVa1NhYmVqWGFOYTN6N3RZQnc4?=
 =?utf-8?B?VDI4QVRic2FnbGFLNmVZa0t0YlllREcvZ01UOG1PelRLQXZYOXBVajNDRDNv?=
 =?utf-8?B?NS8wUmt1OWZuQVc2K2NQNjlrM2xqUmpzNmlFSXRMSDhDWWwzTTFsNnN3bTVL?=
 =?utf-8?B?NGFSaXZLMDViOE9kV0tnb1NZR2lIeHdjekM1MkJaVlU0dE0vVEY4dGVHU2FO?=
 =?utf-8?B?WXBGcWkwcHJ1Mi9tZzFSQkF3ZlpiOGpsa0NQQ042cFpVV1ptdlUxc2tRZ09J?=
 =?utf-8?B?SHBjMjVxeWpsNVdOaHJRL3RLNEpWbC9zaWpWYW54OVBjc0hXRVNQbVdBSU1C?=
 =?utf-8?B?SEFocFJEaTNnbHRuNUt3ZlkwcTFTNmVIeENDZERSTFVjY1B2dG96Vy92OGJB?=
 =?utf-8?B?c01aaHQyWjJxSWlFSUdNUEU4MGIvc0RkV0NpenVaWFhQcVRtQWVOMllMNzY4?=
 =?utf-8?B?ZjN5MFRzVnpxSVJZMFVuYUt1blpyL2FyZDVwWjArSWtVanJRc2twRmFIWHhF?=
 =?utf-8?B?Nk9WeS9BejVkbjQ2b0FpUnl3VVJ5WUZpVWd6c0xrQTQrYW9MYmZJL2JEUlZl?=
 =?utf-8?B?bzFGRU1heTlPS2Q1alJhVkV1RldpeEFwL0NEL3NHdFIzU1hvcEdwT0hyRHlS?=
 =?utf-8?B?VVdqOHRvTmFRSHVobS9ENVBWZkVPaG9MWWhjWVZDS25JTVNXeWxVRVVPQ25V?=
 =?utf-8?B?c0xuRS9xYWhtcWM5Rk5HN08zTTVrZUdvMHNVNTdhK2M2WDlwS1pVT3lFTE5z?=
 =?utf-8?B?clZlcDRpVHF3UWZuK25oQ3pRY1JOYnZPdGlET0xVeWVISWtxd3RwWVhTVWNM?=
 =?utf-8?Q?fsm7HjZnZBGSxF+M=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feb1a077-4380-4bb1-de77-08df4551fcd5
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 08:57:34.7543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /I7b09/Ojve4Uq/IDCpwMzY9vEEiWvrJKif7AmgmuxYybkWGB0P07bidA62AecoxXr2OKNayT23iBszuAJB2T1TQR5C9OPV94TLY5LZyevc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10685
X-purgate-ID: tlsNG-bad1c0/1794992263-3ACDF034-5E1ED062/10/78276251493
X-purgate-type: spam
X-purgate-size: 1117
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/18/26 10:49, Jan Beulich wrote:
> On 17.11.2026 20:35, Dmytro Prokopchuk1 wrote:
>> MISRA C Rule 10.1 states: "Operands shall not be of an inappropriate
>> essential type".
>>
>> The result of relational, equality and logical negation operators has
>> type int and value 0 or 1 (C99 6.5.8p6, 6.5.9p3, 6.5.3.3p5). An object
>> or function result of type bool has value 0 or 1 too, and it is
>> promoted to int (C99 6.3.1.2, 6.3.1.1p2). Using that value as an
> 
> Like in deviations.rst, s/that value/such a value/ ?
> 
>> operand of unary +, -, binary +, -, *, <<, >> and of +=, -=, *=,
>> <<=, >>= is well-defined. Division, remainder, the relational
>> operators, increment and decrement stay covered by the rule.
>>
>> Update the ECLAIR configuration to tag the accepted uses as safe.
>> Update deviations.rst and rules.rst accordingly.
>>
>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> 
> Preferably with the adjustment (happy to carry out while committing):

Of course, I agree :)

> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Jan

BR, Dmytro.

