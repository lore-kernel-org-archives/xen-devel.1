Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5083D606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 08:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=rlOT49ts
Received: from list by lists.xenproject.org with outflank-mailman.1480930.1684704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQhNv-0006gA-67; Tue, 10 Nov 2026 08:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480930.1684704; Tue, 10 Nov 2026 08:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQhNv-0006g1-22; Tue, 10 Nov 2026 08:39:19 +0000
Received: by outflank-mailman (input) for mailman id 1480930;
 Tue, 10 Nov 2026 08:39:17 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xQhNt-0006fv-Fx
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 08:39:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQhNr-00ByA2-Vw
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 09:39:16 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6af2d830-8faa-0a2a0a5109dd-0a2a4504e3f2-6
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 09:39:15 +0100
Received: from [52.101.65.124]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6af2d82e-b57f-0a2a45040019-3465417cbd9a-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 09:39:10 +0100
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by AMCPR03MB998924.eurprd03.prod.outlook.com (2603:10a6:20b:76f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 08:39:08 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0592.009; Tue, 10 Nov 2026
 08:39:08 +0000
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
 b=V0SAAdlWRV1Ayjzob/47woxp1Lr+Na88eUa8Ca89YaIxt8YKXLzpdMxSOh9hd7xex63SALSr1yUhIVILF7rDswFW1aJUhvjnU+SCiEM0s5JOQUx/u+xvz8o6gnFnMncBwYbFo9qX2KNY2yu8q9OyXHyrgBTVw/iVUXlEs4wjg6FKbi9VKP+CwUHkIbteHV0FQJhHAHkInXLRo4L5vOOlhs3nt0wwm4OsBeGMG5MnBQn8GxFpovI+jF16ZAVnfi8HRKhnXVzmlT+lT1NT8gLaiW5P9D3EFaN/dybi4vLACqDCIg+8EvwvBDMZGKK4EIo8ZOk4XqOhRUpSl2h2AVdE5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=apHu60hNl/rYblGF/iAPqiwHaW4vZ1HoNTLRIPNTbrQ=;
 b=LDduuOfzXM4ZSBuyAhaM/QkQWb/b9sN+P2fXY18S9rjyx5jxFPW+nG8l9asaUNRoxzN5gxYyYil2WEIEXJZC5HyhOOq6dFXJ7+VJ6bwE4dNq4iW7Dy96qK3W+Sj+EOuW3P9efc74xoS+Xqv8oXrL/G3SMC8RV4QKxLykUZDVRiP51CSxn80HGkh0nhROMwmrH95U/a1b4cuLET4DS92jrDks68mY1dNwKoTCgt1aDgA9J0CEpN9Ijh0X048CMyFdyewm8W8xLTbrZhnBp9nELPcvKlD465eYoq7quBjRfk7jq9s9Mh4Xah+gOjV3OAW0+j5FmMQIJaYhGukvyJqrEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=apHu60hNl/rYblGF/iAPqiwHaW4vZ1HoNTLRIPNTbrQ=;
 b=rlOT49ts0Svo1orC7XTcpNaiLDdqU/VDpjqSpf4cpU8FxAyz9uk0vOzw5EmVYrFmdna4vIpTHQPXFVN758StgzSa7pza+vxalOji67WFWX4Ck3NyfAW3pClvxQHd23pkK5QZwzCxuFM8bRm69Fe3pvSfxrX7/fVeRCw2ppS2AoH9/UDK2Y6j6F/YztKJ+MmVsdt+raARm9lLNGuwgJWqOFhTcd5Vnm5VhJLrYspSr7Rj+8OnbAan3WBwQSvGGJSNNlLCRFh8MmrN/wpH4lArLGDC6lcZBnNAKXazrfGF3fdtVo7ZRAWNRbh3sPcntXV51BQGXPaR8yOvv6cJq7GO6Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <d597ca4d-ea98-40b1-a2a0-9b2498579b8e@epam.com>
Date: Tue, 10 Nov 2026 10:39:07 +0200
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
 <dd2f093b-4151-4c42-ba7a-c7b1ce96e02d@epam.com>
 <929b051d-2735-4d33-9240-fdf13355c11c@suse.com>
 <fddeac51-52fc-4ab9-bb24-0b3b33faf07a@epam.com>
 <6cde35ac-186f-4a9e-bd66-71b752582a21@suse.com>
 <7ce2c3c6-f73c-405e-adb5-e8a2b68427f9@epam.com>
 <3293924d-2333-4edd-97c1-91baa5ba00d4@suse.com>
Content-Language: en-US
From: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
In-Reply-To: <3293924d-2333-4edd-97c1-91baa5ba00d4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0032.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::18) To AM9PR03MB7526.eurprd03.prod.outlook.com
 (2603:10a6:20b:3de::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR03MB7526:EE_|AMCPR03MB998924:EE_
X-MS-Office365-Filtering-Correlation-Id: 57a7d856-a16f-49f2-b5a3-08df3f061627
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|7416014|18002099003|22082099003|10067099003|4143699003|261022105027099003|11063799006|5023799004|261102123227099003|261026121527099003|261022113327099003|261026140227099003|261021121427099003|56012099006|261022075727099003|261009221227099003|261028144727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	J3GKRBL8I6TdNIhvBVGwEhPJ/IPK+c1blEhRlPYqiGTZ1Qca4nKGvIMN4AfjElMz/nT5jYE/F5bVQ48Mkwd7j9KSMoaWndt7dp6G6sEuC74L6fNlnE1vH6c50EgcxKwvUFhCHicoBVbrymyYpEcrDYLth/yixquByAqfHSRy3AQAK/mgBtpVFDhaTIA+N4AVg52K6wMQHHip1xNLKzPDCFp9dhR8IlwXzLvyJm7otXaoUyjEO6Xj9XZpAzoQUEDOnXZgUwcUco6qkAcHN7hq7KUGFC/JkN2zbJlZ7rPoEy3yCTcfvxPKE8nrJLNwSZch53uH/8+VQkPTItXPZrrY3fHOOPayEakE8qqtzmFfH97tLxdmDLGd94jM9Vq0IBtAOG66Pywplg1zH2z20am/DAaR3vz54sK+l8/L8RJPnPKhqXbVeObMRoR4UKvAxeAP3N9tmxeXFQMmE9dgD+B3YasdvY96QA7h01w51jWGra4uDq2zaM+yVWJ614qN4YnWsi4jniJ6oNzy3omaQ5BnwyJpNhRMkeVyXcvBzQgtFVoXU/gPz0TuEHNT9mV4z/sikP416s6CQlPZdhrimAj3KwRAUM2gIx/eaptdGL+YVnAUj4DrEaTTH3LMnyz7t1WWgV4AK4jojFpVCEjjyhNbEU2yV1VnjvSZCLD9yGVW0i4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(7416014)(18002099003)(22082099003)(10067099003)(4143699003)(261022105027099003)(11063799006)(5023799004)(261102123227099003)(261026121527099003)(261022113327099003)(261026140227099003)(261021121427099003)(56012099006)(261022075727099003)(261009221227099003)(261028144727099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHVqL3RNdExlZm55SU12UXZiZytWU2tnWHdnZVBkeEJ0STd3a01Pd05KRVE3?=
 =?utf-8?B?ci9pQkpLRHQ5U0Z5VmxzTDl5VUh0WEpsM2h5bUpKbTJrMjJ0L3lCditWeWxw?=
 =?utf-8?B?cVNYWStTRlF4aXN1eTN5OFlxVXdKNU96czdoVll0aUlGRFQvTXNiTnlVNVdv?=
 =?utf-8?B?ckxDMm0zTCtEWFJlaUtQOG01RXU3SjgxeWZUUVpKNUYvb2hRUndybkRwSkZt?=
 =?utf-8?B?UzJ4dVE4MnRVaU9sRUpSRWN3T0FCTHc4b0haOWl4VWtrQ3pwVTZqdzh6ZndO?=
 =?utf-8?B?MEV0dnV2MXlLNi9LTzc4WStjUXg3bjBwSllDVjdzYkdKRG9WZHJVMXMrSENV?=
 =?utf-8?B?REt2cU5sdUt4enlWWW5BQWZxU2RXNDAwbzhTVFdXdUsrdHQzMzhBL1pVZmtP?=
 =?utf-8?B?R0NVMU9Vc1FlUUoxbVFGUnhrT2FEWi9nWklWVDl6K0VKOHJULzF5czRsRkt0?=
 =?utf-8?B?Mm04a0V0NHJoOEg1SFdjM1d2L1Q2QWJPZGg3Q0JheTA1T1pEZHBEQUwxUmE5?=
 =?utf-8?B?Rkh0dkdsMkF5SWl6YVJZeGRIdEFiNXhlL1FIcmE1ZUNzekVxdC9wNHNRRkdo?=
 =?utf-8?B?bzBxTS9XWi9XQ01hNE5PK3BMUFNMcEV4OWZrYXhOWWpqVEVFN3k5WWlqeFVC?=
 =?utf-8?B?R0RHMGpKUytuYVplc3dGdWgvQ3ZzV3l0dzBJYUwrT1pWeFBWOU1VbVAyb2FB?=
 =?utf-8?B?SmpWeGo2a3Z0WkFwT0tFSnhBeTZ0d2pNbjBXVTgzVXM5Ynd5VlBpdTlOWFJ2?=
 =?utf-8?B?WW5YaUlmVDNkRVltQlBhZTV5ODIxeEgvK21LZnB2clRRd0srcjUyQmpkVVNZ?=
 =?utf-8?B?YWtNK3JBV2NVMURvd21Cbndwb1RBU3M2UVNIeFRJK0lYYzA2VWlvWkxyZDdy?=
 =?utf-8?B?MHR6VW55OUlhbnlsZUlHdjdiT3NvU01tSG5DSnZLdTYwbWJjb0twajEyL0NM?=
 =?utf-8?B?RCs0R2FYUVR1dGUycXJ5Mmh5SXB0bWRkVXpDcVl2QmtvU242NVRxeUxIWUl6?=
 =?utf-8?B?b0d4TjA5N3hkVVVHQklIcUlqaXR4NmJwUkZxQUFiaFVPZWdza3hjTk5xUUk3?=
 =?utf-8?B?dDVrYnE0dDJTdVdsMExJYjFZN0JWbk5lN0F6Rkp4cGtNOW52ai9DUE1TcFBN?=
 =?utf-8?B?VWd1RURXUWF3aVJjRm5uWi9KS3Z4K2QvTzdpbUQ3SVIydUY2RlZsZXlTaDRV?=
 =?utf-8?B?YjRiZmx0cmpBYnp1bkNlZzc1Rlp2Z2lXemFIV2VIemJLTCsvU1dZRDR3OWZI?=
 =?utf-8?B?SkxkaDQ5aGw5S1c2VzFEUWdMRzZ6dW5IZW1xU1VkSmwzbk8zdTFrbmJPZCty?=
 =?utf-8?B?akRBZ0tTUksydFJHTW5ndFl2dFFZa3lGeG9ITmRuRENaZ2RMK09NNmxpSkJv?=
 =?utf-8?B?cGpkWHo3MTIxNXA4WEpQbE9tWXFhY205eDNQMk15bXo2VzRQNm5EdWt6TW80?=
 =?utf-8?B?QnRsVjF6T1ZSUWJONnpGSTNIS2J3TCtGMVYxQVR4ZTJtZWtqMWgxWlljb2xv?=
 =?utf-8?B?aWdFNkZrV2pkdjh4OWZtamkyUjlpcDVkUVBWZERjZFVJS1ZZNDN3NjFUTHRU?=
 =?utf-8?B?eGpzQ0I3dElURjNXWmNrMGtPZC9oOXBEOHlQUkR3TjJqQ2s1V0R6NVBGS0x3?=
 =?utf-8?B?NnFSeVlLODUwNk5RR1NKNXZsVzE1WDRmTnBpelFuNVRaNSsweWV6YjE1K2My?=
 =?utf-8?B?RTJsZjV1VzkrbTNIbktCTWRFZ0lYRWhMQ3F2b1lKQ2lpSnIwRFpOS0JWbkxn?=
 =?utf-8?B?YjNpVmN0czB6cVRjNTVpQXJmdVltVDRJNjRkNGVNekM5cnFKSjEyRUhtR3VI?=
 =?utf-8?B?ajR1VWthNnJ1QVBTM3FqS2h2QjVzdm1YbFg2RGZSMHJSTGE2RGZIN0V5aUNN?=
 =?utf-8?B?UjNobHFVR1VZQzUzRVVvUURMWW9jSU8rU3ZzVlg5S1ZLR09xVFNyVSs2TDF1?=
 =?utf-8?B?Zjc4WDEzeXJ4U2E3clVFd1VTNkdtK1Bybjg3YXhucFVzSkU2cFZjWmdTQkhs?=
 =?utf-8?B?SWVCdFlZM2pmemRoVjR1ZWw4REtLMlBUS0RVMlNjYS83M3ZjbkxNVk1tMmFq?=
 =?utf-8?B?OXU1dFZPajR1ZU9DQUtYNXY2K0JUdVJPYXNEV3NUTTF3NHlZa2pvTkVvc1RM?=
 =?utf-8?B?KzhGdXRhdE80bnJDQTVQM2l0Uklibm4wNDFiZEZHS0hMeGRmWGdYNmNFNUVU?=
 =?utf-8?B?MXEyVVhTaW9ONDk2bldHTmdneGZrSEtXOVY2OTcyTCthN0M0REVEaTFkT0M5?=
 =?utf-8?B?RWV4Q2xPazB4d1ZiMU54T1prc3c3eitRcmJIM2VJNlB5d1Z2OVNuU0lGU3JX?=
 =?utf-8?B?UFBEWll5RFV1Y051Um5sRUtLbkcyN1dWdDdkMmo3bWJBM2o1b21adVZhbUtv?=
 =?utf-8?Q?K+cE6OyWvZMzGH6Q=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a7d856-a16f-49f2-b5a3-08df3f061627
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 08:39:08.6208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IAM6P5+NvN+hH4CMRMR8eZ187AVazafw+r5IdQYkYZ+GNRL6DWPsGsQr2bKuPGt3MjV0bxvqiUnUGLo+WsnLsF+4a4ZA281GS85544ipXNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMCPR03MB998924
X-purgate-ID: tlsNG-ebf023/1794299955-C2AC8B50-CFCF13E7/0/0
X-purgate-type: clean
X-purgate-size: 3422
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/4/26 15:31, Jan Beulich wrote:
> On 04.11.2026 14:28, Dmytro Prokopchuk wrote:
>>
>>
>> On 11/2/26 17:45, Jan Beulich wrote:
>>> On 02.11.2026 15:43, Dmytro Prokopchuk wrote:
>>>>
>>>>
>>>> On 11/2/26 12:52, Jan Beulich wrote:
>>>>> On 02.11.2026 11:20, Dmytro Prokopchuk wrote:
>>>>>> On 10/26/26 13:13, Jan Beulich wrote:
>>>>>>> On 19.10.2026 18:54, Dmytro Prokopchuk1 wrote:
>>>>>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>>>>> @@ -335,6 +335,11 @@ still non-negative."
>>>>>>>>      -config=MC3A2.R10.1,etypes+={safe, "stmt(operator(logical)||node(conditional_operator||binary_conditional_operator))", "dst_type(ebool||boolean)"}
>>>>>>>>      -doc_end
>>>>>>>>      
>>>>>>>> +-doc_begin="The result of relational, equality and logical negation operators has type int and value 0 or 1 (C99 6.5.8p6, 6.5.9p3, 6.5.3.3p5),
>>>>>>>> +so using it as an operand of an arithmetic operator is well defined and well known to all Xen developers."
>>>>>>>> +-config=MC3A2.R10.1,etypes+={safe, "stmt(operator(add||sub||mul||add_assign||sub_assign))", "src_type(ebool||boolean)"}
>>>>>>>> +-doc_end
>>>>>>>
>>>>>>> Why the restriction to add/sub/mul? The text ...
>>>>>>
>>>>>> Because this is the pattern found in the Eclair's report, and it can be
>>>>>> deviated safely (as opposed to unary minus, division and remainder which
>>>>>> are not included intentionally).
>>>>>
>>>>> Division and remainder aren't very useful with boolean operands, so can
>>>>> surely be left out. However, more generally: How does "Eclair's report"
>>>>> matter here? In deviation wording we want to go from what the Misra spec
>>>>> says. The spec covers all operators. Hence any special casing we do
>>>>> wants to be justified. And, right now at least, I see no justification
>>>>> for restricting the deviation to just add/sub/mul.
>>>>
>>>> Agreed, the report shouldn't be the argument.
>>>> The deviation should cover only the established idioms with a clear
>>>> meaning, and leave the rule's protection in place elsewhere. With a
>>>> Boolean operand these idioms are:
>>>> - + and - (and += / -=): "count it if the condition holds",
>>>> - * (and *=): "this value if the condition holds, else 0".
>>>>
>>>> Other operators have no such idiom (at least, I'm not aware of them).
>>>
>>> The use with * easily extends to <<. With that it's only logical to also
>>> include >>.
>>>
>>> With + and - covered, it feels pretty much natural that relational
>>> operators also want covering.
>>>
>>> Once there, and with division and modulo agreed upon to leave out, there
>>> isn't that much else left, I think.
>>
>> I agree these uses would be equally well defined.
>>
>> My thought is about deviating them without a need. For these operators
>> there is currently nothing in Xen. Without the deviation the rule keeps
>> protecting new code: e.g. Boolean operand of << would be reported and
>> looked at, rather than silently accepted.
>>
>> So I'd prefer to keep deviation limited to +, - and * (and assignment
>> forms). If you still think the wider scope is preferable, I'll of course
>> go with that in v3.
> 
> I do think the wider form is what we want to go with, yet at the same time
> it's not just me to take that decision.
> 
> Jan

Ack.
I'll post v2.

BR, Dmytro.

