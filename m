Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B619A606A324
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 10:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=axVXFUmf
Received: from list by lists.xenproject.org with outflank-mailman.1468093.1677115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNp9Y-0007s0-EK; Mon, 02 Nov 2026 10:20:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468093.1677115; Mon, 02 Nov 2026 10:20:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNp9Y-0007rt-B0; Mon, 02 Nov 2026 10:20:36 +0000
Received: by outflank-mailman (input) for mailman id 1468093;
 Mon, 02 Nov 2026 10:20:34 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xNp9W-0007qc-GW
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 10:20:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNp9V-007F4D-Ss
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 11:20:33 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ae863e3-2eae-0a2a0a5409dd-0a2a450bd5d4-46
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 11:20:33 +0100
Received: from [52.101.69.91]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ae863f1-b7e8-0a2a450b0019-3465455b8c7f-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 11:20:33 +0100
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by AS8PR03MB7208.eurprd03.prod.outlook.com (2603:10a6:20b:2ea::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 10:20:32 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 10:20:32 +0000
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
 b=Fz1f0OU7AtxSIchXc0DYiyNZ6zeboqMk0hfTUMOgl2YTS/Ath+aofFMFwnJ0TOW4UXxa3Dp/FTpa6KKmj2Jr8e8+6Ql3mi0Ta11p4UU24QdQygVtOwtapTdKonwOE8J+OjU1Sbx9mya+0JVomESFDcrbAHP5F+Dv2aYyk382z5+tQFhwCPYVPP+jjXFDgSQbDzEbuwTMgY3mKBaaNlaGUnl14LgONpaZlQhp59w3n4xfe81UN4yv5+E1weOV8I/IFPd0tXlmehK5NQ/2BIKDmyoy4VS5Txb7V5uuhdFc/+faGMKDoIsMcW0yU/vue2JKl1I0PdPSVTZHeNUgV9ilkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fQGErjLt4aaJfFSUsdbcBsT1wHZRgXFGd60qt1Qhn8=;
 b=k22GwFKW1WI01uOQPViPtDAzupHELA5h2noEScpr6ZQf1Oe8QmLO04M4UQyKB5Y1oBb0xb0BEc2mvLu9EwZeJ0R4866zLKSOtdDnBYW/FQql7WjrLIOTPztBqOts1SxZV6mBaFeKUIepnd2qD80EqrfpzRD3xeRqOHr5wV0Kx7glZrcci2KEDCRzEh+CJr4Bdme0JFRIjrCR6NP93d4Yt6ueShlgPMAW87RsSD5+Dh+5zg5DbmYSibIW7D2rvpuS49iPktHC7+Aq1nXHMhe2JfjPKQhuo1JggG1aGVyKQycHFZ5P1pnRwC4FsWtKDpVKojukbPWMYAuqM2yXS5fz1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fQGErjLt4aaJfFSUsdbcBsT1wHZRgXFGd60qt1Qhn8=;
 b=axVXFUmfoaN2gTXBM8I+IaXIvpiZxMclotK2wUYIrDF4whF3HYoRoiG+xfTeCgxz4e9PpQ9X5bqIbDL6bGzygQM3va6f4ePXP2oPNu0eMlugjlJFdn9XZEHCbDMu2k589lFNqR2pHtiggNfHNKy4/RD25qLkR9X65DcdKToPVAN5eZvTS1cFCjy7HDb+5nZUntiIX873D0MKUPDSIhKJfzyl+XTb+UW6StAQogHdU670dJIoGj2D21YrTU0Fq+rP0C+TupEub7wXHBAMur79dP8PjaNlS3R9Ww4EpehikfjHIY7IQvWGAJtJmvRblAKn6jkIA2MCatM9AyywfM1H3g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <dd2f093b-4151-4c42-ba7a-c7b1ce96e02d@epam.com>
Date: Mon, 2 Nov 2026 12:20:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: deviate MISRA C Rule 10.1 for boolean operands of
 arithmetic
To: Jan Beulich <jbeulich@suse.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a536212d9cb18b5c23d06c1c06b9a8ae03941440.1792428626.git.dmytro_prokopchuk1@epam.com>
 <83187933-b4cd-46df-b428-368d6f71cfaa@suse.com>
Content-Language: en-US
From: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
In-Reply-To: <83187933-b4cd-46df-b428-368d6f71cfaa@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: WA1PEPF00005B90.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::627) To AM9PR03MB7526.eurprd03.prod.outlook.com
 (2603:10a6:20b:3de::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR03MB7526:EE_|AS8PR03MB7208:EE_
X-MS-Office365-Filtering-Correlation-Id: 623caa20-00c6-4bad-dae1-08df38caecd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|6133799003|10067099003|22082099003|18002099003|4133799003|56012099006|11063799006|4143699003|261021121427099003|261021130227099003|261021135927099003|261026135527099003|261021123027099003|261022105027099003|261026130827099003|261026121527099003|261022115727099003|261022075727099003|261026140227099003|261022113327099003|261009221227099003|261009223027099003|261028144727099003|261021133027099003|260925021311599003|260925021911599003|260925022911599003;
X-Microsoft-Antispam-Message-Info:
	2Cc8999qjflqCMaRYftAJVGkThUS3BeconlXbJ+TwIP6INlfo1dGt0tZ1U1IWPpSaaMf3yy6QL9jCxn+I3wYhWI+5fQHz81E5CDKUoOUvfE6dmoE+lvXpzgPEs6tOQ8+v2RBMg+I2psxr9VYx7YYOFEFXhtIKq4FAAF0WBr8GKyrAjjUlDuYlbAx9bQtRCT1y6H6l5Pn2pAZhZtUQOFuVx9sMKM6T8hYn9ORuSLTbhV1/UkMNm8THQqTuUK0aIQhmhwrYoKgABbadxmK6cF+xEuOzF8yWGHnCvSDdHTQgsDJsG8C3w1cXwFn3DPHtD+kkO35TrTcBQKQ/ObYA2xyncnCuLfG/uAnLmvdD8f7/YNYcpxpSEmewvc7TiX9GvBQklSLtrFrhN7mdUQ89P2hiKR6SSkMljFZ2xGcl8naviOJJdMrEZdvMk+JsWypaij6KMA2QDklSI8+c6DcCJizKwGI6qWJ6cb6rLbEIpqkDCY8rCSDAcrWYDN4X0b1y0ELUg9hSdiElxnsG/U64kdggd+PYiZH+yp8Wx2p7wJ2k/Mc+2+DDSDN6zE60zRzAlYvtefM/ITg7GVl5pVPqnAtW2ub8UckSgoXm1YLMg1N8tEZMTPIP4wYfrmPX7LP/bB4Q2wzJny+xKytl4Xb0hZd7GLUbbbT+/BSmQRhzDkt4Ug=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(4133799003)(56012099006)(11063799006)(4143699003)(261021121427099003)(261021130227099003)(261021135927099003)(261026135527099003)(261021123027099003)(261022105027099003)(261026130827099003)(261026121527099003)(261022115727099003)(261022075727099003)(261026140227099003)(261022113327099003)(261009221227099003)(261009223027099003)(261028144727099003)(261021133027099003)(260925021311599003)(260925021911599003)(260925022911599003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEgxTU1lNXY3bUl1cldURXhRdzBIV09KY0dBU0xmYmp5TTVKTzllcFlDclJL?=
 =?utf-8?B?VVVob0FReitxcG5FYURpNnRXODhnSGRQd1g2OW9mMUsrSTYyS3loSGxVc0Vs?=
 =?utf-8?B?RmtZZGJEL1ErL0FnV09HUThGeHVpait3YmVIV1ZoOVJkTGIyNWpRek1ieE5S?=
 =?utf-8?B?Y21RRUxpMGxnZStBN3hDaUhBK1hpdEhsRzlsc2QxU0poUWNFaVZGQ2U2MFl4?=
 =?utf-8?B?ZndsQ2x4MFloQ1JJdUdtUU4vWStWb3cwQ3h5MFhERGdtdWJ0MkRqb3JpUHJt?=
 =?utf-8?B?VHBDdGk5eFZUQVdNVTdiSGE0M0NWYlFGejVCOW9jenBjSDlNaGhMTDRSUzFr?=
 =?utf-8?B?bTZ3RGZMMjRQb21MOG8wVDRVUlpXd09pK3M1cWdEcGgrNmNDcTNiTmhReWph?=
 =?utf-8?B?MTdwV2FCQUdKRnpKb0hCanZZR1dhMTU0WjhjeUQwSGI0Mk1FRjhXNkFDR0or?=
 =?utf-8?B?ZjRBTHJzV0FLUkFlalZTbzJmcFFZOXVnL09waGFxK1Z3T0JSSEcyVVRwNitY?=
 =?utf-8?B?WjJJWHdON3E0RFV6VGFIY2o2T2RMbzhLV0xwSXdMZ21iUjdkb2hKenZLS0pa?=
 =?utf-8?B?Y1cxa0NvcTJnMklQQUdDNFRmbi8xbzRPM0xKdS9LQVhmb2VBMlU4NlhmR3o4?=
 =?utf-8?B?SEY2QXdnODFZakhraTFuK01WUGNxd0lYRU5LUWRydHVXSFNqcExLeW5nUFRZ?=
 =?utf-8?B?MkpmZUlBZm9QVjJ4a3VZYVg5SHhLZldCb0VrZDFob0dHcGtDSG1KV2JoU2RE?=
 =?utf-8?B?RWxrTU5hOXFHNi8yWll6Zno3NDdOOTc1SUNGZTNQQmdET0ZXSjRCSUF6QzJ5?=
 =?utf-8?B?U3U0MWl2UVljaWhrbXkzcGMrQ2xwQ2RkQVhFcFdQL1dkdXlkNFV3ZWNsYWQy?=
 =?utf-8?B?ZHhSeURHbU9vQVFzYThpVlArOHRpTHJacWVEWnE4NEVOaWlzbmZnVnJZUTNO?=
 =?utf-8?B?SzAxMEdtL0hkUTdsNW1sbjdVUldUSTBUWmM3VXUrL2wvM1FmUUsxWGlYZ0kx?=
 =?utf-8?B?WlRCVUhJdXFPM0YvZzBTcXhvdHhFYjFYYXpvU2M0emxCeGRYMlFLc0tDdmps?=
 =?utf-8?B?SDRjSElGSzk3MXZkNHJhVWdoUzFDUytSTzBidzNFNVhmRk9DVkNlb2hyYVNH?=
 =?utf-8?B?SjBGeW1RY09hbUZEbmEzNWkyZGlJNkI0YS9JQlJUWXBpRElWQmUxeUdOWTFk?=
 =?utf-8?B?QlEvUXJFTmJVc3FQT05PS0Z4N21IMWZDcXRQV0w0N3NaenR4ZkVGWWQzL2la?=
 =?utf-8?B?S1dzb1NwSEcwdUVPaGJqTWVFM2JBV2FvMjFBZEZJMjhuRXVVeUUydUJ0RzFB?=
 =?utf-8?B?OWxDUVNyTXMvd1ZaMUp1dUdVOTFUUy8vMHJlY1J4OVR4YzdQRDJ3dE1hcXpZ?=
 =?utf-8?B?T3Nhb3ZZMnh0dWU3ODVsYlVDWHB0b1dHSkFDUTBTWThlTk9DaEY4QVJOa01Y?=
 =?utf-8?B?eGVqazhRaWkyZTF3SktSQUtNRk51clJkdllEVWpLamhabVNwT0NBb1RKU1Fn?=
 =?utf-8?B?b1Y2elV4bjdGYkFxL2p6eXo1ZTNIbXV5dTQzZ3d6Z0hqYk1va1BEMlhzaDYr?=
 =?utf-8?B?QlhsYTdSbTZBZ0pEL2ZxY1R2SXlMajBIbm9FTnZPakxxam1LcndlUWtuZWJo?=
 =?utf-8?B?QUZabWJKMU9KOFlON3dhMTYzTGxzV2V2cjVUdE0vMjNhakVOWFpuSVhjVGg0?=
 =?utf-8?B?anVyT0RkMGRKMXBZeXdjZUUxSzNGbnllc1QrYnJmaXo5RHlBSmFmcVphd21U?=
 =?utf-8?B?S3NnS1VZYzBlMnBYbFNDQzd3U251QkpPQVBwNGsvSFZYTzFQNmV4aGE4ZXZX?=
 =?utf-8?B?aUVkSGYrOVMzSlZjZUtibzRVcXFnZXFPQjVrV0VhMGIxbUJaN0I3ZzRtTTgx?=
 =?utf-8?B?SUtkbzd4VGtSazR6cXEzRGc2ZUhWRTBIU25xR1NSbkpiVWRNMGd2ZGlmby9s?=
 =?utf-8?B?ODhyUUkrQ3dIeDBCKytoSEw2dE5CQ3ZaRlVPczFwUlZCaXZEVVVSVTROV2pD?=
 =?utf-8?B?bkJxSW14V1FoZG5GNC85T1hZeTdDMVNUSEVtSDh4T1VmYXFTdVdjeDJEdmZi?=
 =?utf-8?B?MkFrazdiMkxvV1NQTUZ4cGpoK0h2dDdadjgvVkRmTEJOQ1BmaXpKT0s4czhD?=
 =?utf-8?B?c010ZGFnNFNWL2RVWEFLeE9vTWd4SUQ3b1Z2T0JGTzYwUjBsMWZOTElOQm94?=
 =?utf-8?B?c2hRaElkd0R2K2swUnZHOHQ1V25yaEFHU3I4NDZhZnpnM05PS1JpOGgzQ2VN?=
 =?utf-8?B?VUVuRHFKcUl1SmFVVXB2cE51OWJQc2xKNzVxM2RjQXJ4ZmhQM0w1OWlGeFBH?=
 =?utf-8?B?Q2cvNWg5eloyNFo2cGZJVmlieWUyU29FM2lrNzRxOXBremVwQ0R4S0k4ZXNz?=
 =?utf-8?Q?eIuWZVvOO1ofVOy8=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 623caa20-00c6-4bad-dae1-08df38caecd8
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 10:20:32.1187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ryD/YfWI06EmFSPuPsUo+0ASV3sxD1xitd3xFAxSHqWWnaia7fI8ixouURU5xuCme1ccoHK7lVS1r5nPbBPtb8KDMYuUqyZZIwQ5K/jFXcU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7208
X-purgate-ID: tlsNG-42698a/1793614833-ABAD09EA-804CFFA2/0/0
X-purgate-type: clean
X-purgate-size: 3738
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/26/26 13:13, Jan Beulich wrote:
> On 19.10.2026 18:54, Dmytro Prokopchuk1 wrote:
>> MISRA C Rule 10.1 states: "Operands shall not be of an inappropriate
>> essential type".
>>
>> The result of relational, equality and logical negation operators has
>> type int and value 0 or 1 (C99 6.5.8p6, 6.5.9p3, 6.5.3.3p5), so using
>> it as an operand of +, -, * and their assignment forms has well-defined
>> semantics.
>>
>> Update ECLAIR configuration to tag such uses as safe.
>>
>> Update deviations.rst and rules.rst accordingly.
>>
>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>> ---
>> Current patch resolves all ARM Rule 10.1 violations (actually, there were only two),
>> and resolves around 55 x86 violations.
>>
>> Test CI pipeline:
>> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2963748389
>> ---
>>   automation/eclair_analysis/ECLAIR/deviations.ecl | 5 +++++
>>   docs/misra/deviations.rst                        | 6 ++++++
>>   docs/misra/rules.rst                             | 2 ++
>>   3 files changed, 13 insertions(+)
>>
>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> index 6cdb10a129..8bfb1a0f89 100644
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -335,6 +335,11 @@ still non-negative."
>>   -config=MC3A2.R10.1,etypes+={safe, "stmt(operator(logical)||node(conditional_operator||binary_conditional_operator))", "dst_type(ebool||boolean)"}
>>   -doc_end
>>   
>> +-doc_begin="The result of relational, equality and logical negation operators has type int and value 0 or 1 (C99 6.5.8p6, 6.5.9p3, 6.5.3.3p5),
>> +so using it as an operand of an arithmetic operator is well defined and well known to all Xen developers."
>> +-config=MC3A2.R10.1,etypes+={safe, "stmt(operator(add||sub||mul||add_assign||sub_assign))", "src_type(ebool||boolean)"}
>> +-doc_end
> 
> Why the restriction to add/sub/mul? The text ...

Because this is the pattern found in the Eclair's report, and it can be 
deviated safely (as opposed to unary minus, division and remainder which 
are not included intentionally).

> 
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -347,6 +347,12 @@ Deviations related to MISRA C:2012 Rules:
>>          well-known to all Xen developers to be a comparison with 0.
>>        - Tagged as `safe` for ECLAIR.
>>   
>> +   * - R10.1
>> +     - The result of relational, equality and logical negation operators has
>> +       type int and value 0 or 1 (C99 6.5.8p6, 6.5.9p3, 6.5.3.3p5), so using
>> +       it as an operand of an arithmetic operator has well-defined semantics.
>> +     - Tagged as `safe` for ECLAIR.
> 
> ... here is less strict, albeit ...
> 
>> --- a/docs/misra/rules.rst
>> +++ b/docs/misra/rules.rst
>> @@ -387,6 +387,8 @@ maintainers if you want to suggest a change.
>>              compilers' extensions)
>>            - Implicit conversions to boolean for conditionals (?: if while
>>              for) and logical operators (! || &&)
>> +         - Results of relational, equality and logical negation operators
>> +           (0 or 1) used as operands of arithmetic operators (+ - *)
> 
> ... it's again more strict here, yet at the same time somewhat ambiguous: Are
> all arithmetic operators meant, or merely those named in parentheses?

You're right that these places are inconsistent.
In v2 I can specify the exact operator list (binary +, -, * and +=, -=, 
*=) in all places. Also I think *= need to be added to the ECLAIR 
configuration for consistency with += and -=.

BR, Dmytro.

