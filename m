Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1837260A260D
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 13:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=EeIvDtBI
Received: from list by lists.xenproject.org with outflank-mailman.1481767.1685687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQlhK-0005bb-Sx; Tue, 10 Nov 2026 13:15:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481767.1685687; Tue, 10 Nov 2026 13:15:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQlhK-0005bU-OI; Tue, 10 Nov 2026 13:15:38 +0000
Received: by outflank-mailman (input) for mailman id 1481767;
 Tue, 10 Nov 2026 13:15:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQlhJ-0005bM-R5
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 13:15:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQlhJ-007OBd-3A
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 14:15:37 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af318f1-8faa-0a2a0a5109dd-0a2a4502ac6a-20
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 14:15:36 +0100
Received: from [40.93.198.20]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af318f7-6ca4-0a2a45020019-285dc6143669-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 14:15:36 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CHXPR03MB989197.namprd03.prod.outlook.com (2603:10b6:610:2f9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 13:15:33 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 13:15:33 +0000
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
 b=B7X99LjmSSvsFcSvDNOLQkLB0QFNSdv0ezmK5DmwFtP9iZIL4e1I5XLKQW+82vhxBvum+yPf56LIKdaVmfMo4Nv9dypGwMzb/EryI3VSj/RjEZgov5OxYpSIEM0HHN6Cn3ROoeQlwdDZvT1VHgNM6F60ZicsAKCPEa6mLh1yTfob/7EXSj9Y9OECmjISZG41hX/7LTBzf4C1cN1uvpQdIybhKks21nbwRGPJ4Yawk6WDvTaIxEpE77rwpPM40uWVKHKGLgvSYgoDdyPZugDymPrq0V/+zdWLWZU1XSldN6yem0NPab6v9PdPCEfZh9KiaqxNM2da2FUD10ZejDKYpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4ZgCJOANt4PVPCl77/++w9gsNSig0s4H7Z/JmYf6Is=;
 b=H3o6MfOxDnPpdXXwvg6bQ4861Jm1OfnjOJ1VMe6eQhP7cKgduJe7lH/jkKB2Js5nUc4tCxpfPvNtNVefHqmiZIvzZvtjnbgO73o/HngiUsT5FbDunXu068BCob/w+lPpL4PQS60a4pSuz2IdrwsiEuM20RxcUqIgO2eQn6NvgL6lKNta8FMImLn237z6WYUR64QaJ4nCltnes+JgCfhLkriZdUG7uYPMXE01TptNWwlRGoJ6B5jLijn+dd+w/EBC5vNTkZRGj2qG4ijb0MOlr6bNwjklXFZhaWtkWY6rGrmUOL27Y3EsKR75Z1PofUC+ZYAyppOAKYJ0wo2VAyeC3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4ZgCJOANt4PVPCl77/++w9gsNSig0s4H7Z/JmYf6Is=;
 b=EeIvDtBIUPY58GtCtOpCJ50iyLhUJQQnN+MSuiPON4nP0va11uvF7cby4LFAMqFDBi8PiJDwmLt+M6/9c0LG1SEf9l5MH9VnTGy7vUCoMf2l9VGqyeW3KNKs49pdEVIw9Ft4Na2w2CBMfS/EmvOKj+TuKC2/7f79E6ASj8Mwfdg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f9ffba74-3b4a-49a7-abaf-1c062993a531@citrix.com>
Date: Tue, 10 Nov 2026 13:15:29 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH v5 4/4] x86: prefer shadow stack for producing call traces
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d0de0425-a0fd-4ced-9768-ff102b953a22@suse.com>
 <bfec463b-a4dd-4a4a-bafb-c596f83630a1@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <bfec463b-a4dd-4a4a-bafb-c596f83630a1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PAZP264CA0049.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1fc::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CHXPR03MB989197:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f6b599b-85a5-442f-472f-08df3f2cb38a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|5023799004|4143699003|11063799006|56012099006|261022113327099003|261022105027099003|261022075727099003|261021121427099003|261021123027099003|261021130227099003|261021135927099003|261026121527099003|261022115727099003|261028144727099003|261102123227099003|261009223027099003|261026140227099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Q+k8Z24VDp3m+vui798l2H+ei5rsErLk9MTrJvFyg8AXUsgWg6v8ScriTkcUOHj5rOGg7kmcUBPj4ejVp6hpY1dqGo8svHqQAgTGjKfOA43YfYkNSBlm4JWXQZHHkkIrVNuf/MQupKWDnMcXvYGLpzADew64nym6vlSVz568gLZWu+C6NxKuG4SxJFwNY0TqshsP3PpS1Eo5ShoE/+8RFGhFRb8eVOf2lTDvbS3+doDy/ZACPJQgYzN9Z9cQmq9I2JJEKcO1CL1BbXKI4d7lSA5d2pkk42+KSiOf2bfrCszd76ACdyAdOElL1osH3nghRTIXEqB6BuXAVS8uHi9O5vyMpUujKFf66qfF22ji/vWQdiIgsBGpy6XGPE2xZyIykhrMg5hxy5S1fUOcaMNy5D1m4dQKRcvmkvTk9DTymTXTpwhyzAV8TGlaNgYTbrbEVR5o4kn+dh1FNIivASmgphbpvjvKwDWalxZ/s6R2Vu6is8g7sz6IXeMbkEuJazJmGx7s+AiYcGe47WsNOUOALIcGBjSgbtySK5OZQV5sg3CVZamA+v5J7kjvhshw1iy/3hqpXEgvunKq/l0GlX2PBmF1tX70Xr/8wdPikECX2IBhRjOF4czGKXvgo5lr1QKcANBs8Y2ro1hvJeUrfHmWMtfDcQwHScfMs4N9vb0WiBI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(5023799004)(4143699003)(11063799006)(56012099006)(261022113327099003)(261022105027099003)(261022075727099003)(261021121427099003)(261021123027099003)(261021130227099003)(261021135927099003)(261026121527099003)(261022115727099003)(261028144727099003)(261102123227099003)(261009223027099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cTFpd0tDNzlDQVlSNzdzY0lIekRqeVJpY3k0WXdZWUk5QXJiak9lcHVNVjcv?=
 =?utf-8?B?ODhJTnhZUWhIOXhGSWwrYVcrYkVsSUZ4Z0p4ZXNqSEVueTlkdmJLbnBhRmlE?=
 =?utf-8?B?cncxVHdqbFdOb2JscDQxcTZSdG9WajV0MktHcjU5V1B2WXRKb2dkTWg4aWRN?=
 =?utf-8?B?MExsOGxQMW1qdGhyNi8xdm5lY3hYNXN5cnQ5ejRFNkJlRGVYRXN4ejQxOGFn?=
 =?utf-8?B?ODZ4Mm1BcUhOTlY4NnVUYkxHUCt1Y0w3ZTc0TDIxdjNzUVNya0dVTHJsSkE2?=
 =?utf-8?B?Zk5EbndSS2gvQ2FCVGdFckJ5YmMyTWxjSHlGYUcxN05haHlqR2Q3VlNTSk9k?=
 =?utf-8?B?c0pFRExBNlBiSVN4d0NwSXV2SzBmWUZWY2kvOGlBdm03bXFsaUVMV1lFYi81?=
 =?utf-8?B?TDNYOFJsaER2UUtnRW5mQjVjM0JydkwzVDhpTlowWWdMeC94VDYzQVRZbXdr?=
 =?utf-8?B?bjFEMFdHcGNjanZmaklhT2FaQmlYc1ZESUhHdkJWOXhxeHJPN0Y2TCtHUk5z?=
 =?utf-8?B?TE5OSnNhZ2tzd2JKeGdUUkFuSUxCU1A1Tlo0SXhnSXlrOThGRER3OEVFRXJp?=
 =?utf-8?B?ZklYWS9uSEJ1dm12OGJBK2h1UWl4MVp3NWdpQ1B4NFRoZVlmSGgxRXp4Rjd0?=
 =?utf-8?B?RzN0MCt6ZVEvQXAyUzN2bm9DSE5DaXZWZWluZkpYSlRuOUNQYWtJdXlabDQv?=
 =?utf-8?B?VkM3NGJTY2IzNjR6a1ppSmFrS0tRZEp2Um1KMk5NVWpBZDRiRUs5T3A1NURK?=
 =?utf-8?B?TGRVYVR3Q29PcXVldktSRUE1QXhPNUV2eWl6TE82bTYxSXpFRUZwdkdMU0pQ?=
 =?utf-8?B?eEE1SXV1emhQdWhhb2haTWpiN1RhYzFIQnJFNXlBL1E1eU80bnVGVUJVZitR?=
 =?utf-8?B?SjNyV05SZnVMd2I5TVZTQU1QRHhhTjJyWTcrRmdvK2owVUVLV2d1MU5NWGt4?=
 =?utf-8?B?Z0lML0U0eDllWFJVWDlWcDRzZDA2VzVzNmJ1c1F0VDJ6Q1ZmY0NzQm5palBj?=
 =?utf-8?B?UW9MeFhLMmVScmw0RTN4Z2k2Qm53cHBacVp0c2pUckpxQkprV3RUSlY3ZlV2?=
 =?utf-8?B?NEJUanhDSS9ldnR6MVNJb2dzTHFsT05QZ0E2MjNycHJWME14ejFXNUFrT1I3?=
 =?utf-8?B?aXdCWVNLM2RtUU5mUnRuc3RMV01PekF6UjVadzhvM0NXa3dYd1JweFJkSUlY?=
 =?utf-8?B?YWR0K1d2OVRUSlVmdTJkbXhsQnNKRWhaRmVBWHA3V3dzZEpvRXlhSDdCRWI3?=
 =?utf-8?B?VFpqd2JPVnM0NEM1TnA4REdrbFoxU2trdndlT3E4Wlh6d0t5Z0Z6Qk1KM0M3?=
 =?utf-8?B?WEdlU0ZaSkQzc0xtSTIxcDBJVXQ1VkdxSTZLMmpYUWt6UlNiZjFkaEtoRWJ6?=
 =?utf-8?B?UFZBaWkwbXhEYTl0dWRXc2JqVXhucDVWalI1SzREcnp4SmlqdWtkUk91SDhx?=
 =?utf-8?B?N2kyenFXZVRVL2U2dUZlRkxQdFV1NEozbVo3OXNvMlhLZHJaeVFIL0YwU1Mw?=
 =?utf-8?B?UmpwTTR6QnpNcmtPS25SMXhnSGVpMWxBUVdPNmpDZlNFeE53WkR5ZnhaUHBs?=
 =?utf-8?B?TUFCRG56aEJFdmlXUkRtd3Y2d053WkRYcitZUWxMMmJ4M3dwYXladGQvaHlO?=
 =?utf-8?B?QXhucmEzQ09tMzhYalArNUI2YW5mYWpWa1BQM2YvSUl3Ti9VanR0VjkzNXB4?=
 =?utf-8?B?YzY2UC84Zktnb1R5bmJUckhNSlk1MzRIazBXdXRKN2JKSkRza2tZMkVVTklC?=
 =?utf-8?B?UGErQ0hHRHA0TWQralBUK3A2d3FxRnBvVWY1MHpObTAzRzM4V3J1WlA5NDB6?=
 =?utf-8?B?cDRlNm5EcEVzMEo4Q00zVEk1elNpMHlpL0xlMVNxbTVwSERGN0ViVWJtNldI?=
 =?utf-8?B?ZEE2MVYzTE5Ya3BTQXZGNnYrUk5xTFE5RFNueW1IOS9GbUsvd282dFFtdU5P?=
 =?utf-8?B?SW04ejZrelJSaTVDRnFPT0FKUlJHRk9ZVW9GNE5FZWxLWW9MR0xaemwzNmdz?=
 =?utf-8?B?UmZiRks1UjIzSTU2cmpzOXRSeWVQc3ZEazlRalhLZ001QmYvVGcvZWlqcDRo?=
 =?utf-8?B?eDZkbXlEbVpSY1NOZGZNMlFnY3U2Q29VNXlET09nZ1dENjB3VlludTc3b2xQ?=
 =?utf-8?B?M3YwMTdZNzVGUnpYak1hNlBvMkxpNU9MeFpsOFBYS1U3MmpOcGt6aE1hMXNS?=
 =?utf-8?B?L0ZBZlY2aDdaUlZjaHVZRlpkbmRod3l2Zm5YUE9OZzRJZWtPcXBxcDhYRlR6?=
 =?utf-8?B?NnpXcmk3czQ2Zk4yS1BMclY2NjBXMEFpL3loOHQ2Y2NMQ3ZwZVRRWjNGNzly?=
 =?utf-8?B?aFVqN3VTWWFzOHhEenFiYjdRSWZzbW5yN3p6ektUWHk0QURmUis2M01nOUQ0?=
 =?utf-8?Q?6nQZBdcJkE0LtRq0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f6b599b-85a5-442f-472f-08df3f2cb38a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 13:15:33.5012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VIV0SQOwhX6wi4fdQnkW2qvfiCdMfHXHDPkKesDCq2bOV0vcoHNjpPeoLP80R+L5znxwiRYcwso3dyfc7tSjXbSYJsuHJi4ecq9xZdJWjB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHXPR03MB989197
X-purgate-ID: tlsNG-720697/1794316536-F30B02AC-55C3DD7E/10/78276251493
X-purgate-type: spam
X-purgate-size: 7675
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 09/11/2026 1:09 pm, Jan Beulich wrote:
> Shadow stacks contain little more than return addresses, and they in
> particular allow precise call traces also with FRAME_POINTER=n:
>
> (XEN) Xen call trace:
> (XEN)    [<ffff82d04032d730>] R extable.c#search_one_extable+0x70/0x73
> (XEN)    [<ffff82d04032d802>] C search_exception_table+0xc2/0x177
> (XEN)    [<ffff82d040358378>] C traps.c#extable_fixup.isra.0+0x18/0x6c
> (XEN)    [<ffff82d040358e3b>] C do_invalid_op+0xab/0x106
> (XEN)    [<ffff82d040201d98>] C x86_64/entry.S#handle_exception_saved+0x88/0xf4
> (XEN)    [<ffff82d07fffe044>] E ffff82d07fffe044
> (XEN)    [<ffff82d040412db0>] C stub_selftest+0xd0/0x168
> (XEN)    [<ffff82d0403508d6>] C setup.c#init_done+0x116/0x15a
>
> as opposed to this counterpart (earlier during the same boot, before CET
> is enabled):
>
> (XEN) Xen call trace:
> (XEN)    [<ffff82d04032d730>] R extable.c#search_one_extable+0x70/0x73
> (XEN)    [<ffff82d04032d802>] S search_exception_table+0xc2/0x177
> (XEN)    [<ffff82d040358378>] S traps.c#extable_fixup.isra.0+0x18/0x6c
> (XEN)    [<ffff82d040358e3b>] S do_invalid_op+0xab/0x106
> (XEN)    [<ffff82d040201d98>] S x86_64/entry.S#handle_exception_saved+0x88/0xf4
> (XEN)    [<ffff82d040412db0>] S stub_selftest+0xd0/0x168
> (XEN)    [<ffff82d0403d0cc9>] S do_initcalls+0x29/0x38
> (XEN)    [<ffff82d04041adf2>] S __start_xen+0x1c72/0x2235
> (XEN)    [<ffff82d040288a57>] S __high_start+0xb7/0xc0
>
> (note the entirely missing entry for the stub itself [1]; sadly there are
> no stray entries there).
>
> [1] Arguably we could teach FRAME_POINTER=n traces to recognize stubs as
>     well. But not FRAME_POINTER=y ones. In fact, what's missing there
>     isn't the stub itself, but (of course) its immediate caller.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Sorry, but this commit message is still deceptive to read.  Please
reformat it as:

---8<---
Shadow stacks contain little more than return addresses, and they in
particular allow precise call traces also with FRAME_POINTER=n:

Compare a WARN() in stub_selftest() which runs twice on boot, first
without Shadow Stacks:

    (XEN) Xen call trace:
    ...
    (XEN)    [<ffff82d040288a57>] S __high_start+0xb7/0xc0

and later with Shadow Stacks:

    (XEN) Xen call trace:
    ...
    (XEN)    [<ffff82d0403508d6>] C setup.c#init_done+0x116/0x15a


Note that ...
---8<---

This way you are presenting the information in chronological order, as
well as stating which has CET enabled and which does not.

We probably ought to teach the emulation stubs about
CONFIG_FRAME_POINTER.  It should be consistent 


> ---
> While the 'E' for exception frames is probably okay, I'm not overly
> happy with the 'C' (for CET). I would have preferred 'S' (for shadow),
> but we use that character already.
>
> As an alternative to suppressing output for the top level exception
> frame, adding the new code ahead of the 'R' output line (and then also
> ahead of the stack top read) could be considered.
>
> Quite likely a number of other uses of is_active_kernel_text() also want
> amending with in_stub().
> ---
> v3: Correct "link to other shadow stack" check. Don't log a line for the
>     (impossible) PV case. Add example stack trace to description.
> v2: IS_ENABLED() -> #ifdef. Re-base.
>
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -48,6 +48,7 @@
>  #include <asm/shared.h>
>  #include <asm/shstk.h>
>  #include <asm/smp.h>
> +#include <asm/stubs.h>
>  #include <asm/system.h>
>  #include <asm/traps.h>
>  #include <asm/uaccess.h>
> @@ -705,6 +706,13 @@ unsigned long get_stack_dump_bottom(unsi
>      }
>  }
>  
> +#ifdef CONFIG_XEN_SHSTK
> +static bool in_stub(unsigned long addr)
> +{
> +    return !((this_cpu(stubs.addr) ^ addr) >> STUB_BUF_SHIFT);
> +}
> +#endif

static inline, or __maybe_unused.  This stub needs using elsewhere, and
has nothing to do with XEN_SHSTK beyond the first user.

> +
>  #if !defined(CONFIG_FRAME_POINTER)
>  
>  /*
> @@ -797,6 +805,49 @@ static void show_trace(const struct cpu_
>           !is_active_kernel_text(tos) )
>          printk("   [<%p>] R %pS\n", _p(regs->rip), _p(regs->rip));
>  
> +#ifdef CONFIG_XEN_SHSTK
> +    if ( rdssp() != SSP_NO_SHSTK )

Thinking about it, the entry condition wants to be regs->entry_ssp.

If shadow stacks where enabled at the time of taking the exception/etc,
that's good enough.

> +    {
> +        const unsigned long *ptr = _p(regs->entry_ssp);

Something Linux is gaining might be worth using here.

+struct fred_shstk_entry_frame {
+    u64 ssef_ssp;
+    u64 ssef_lip;
+    u64 ssef_cs;
+};

(Names subject to improvement, especially as this is not actually FRED
related, although cs does get extended with SL and WFE when FRED is
enabled.)

The logic below will render incorrectly on the IST stacks, I think.

In those cases, we'll get an entry_ssp pointing at the IST shstk with {
ssp, lip, cs, (maybe) sup token }, where what we want to do for
rendering the dump is to follow ssp first to get to the outer context
and then walk up.  This is different from rendering regs->rsp which
starts from the outer context.


> +        unsigned int n;
> +
> +        for ( n = 0; (unsigned long)ptr & (PAGE_SIZE - sizeof(*ptr)); ++n )
> +        {
> +            unsigned long val = *ptr;
> +
> +            if ( is_active_kernel_text(val) || in_stub(val) )
> +            {
> +                /* Normal return address entry.  */
> +                printk("   [<%p>] C %pS\n", _p(val), _p(val));
> +                ++ptr;
> +            }
> +            else if ( !((val ^ (unsigned long)ptr) >>
> +                        (PAGE_SHIFT + STACK_ORDER)) )
> +            {
> +                if ( val & (sizeof(val) - 1) )
> +                {
> +                    /* Most likely a supervisor token. */
> +                    break;
> +                }

Supervisors tokens only exist in !opt_fred cases.  But I don't see how
this is a valid check for one.  You're looking for non-zero in the
bottom 3 bits, but that's potentially ambiguous with cs and fails to
spot a non-busy token.

The distinguishing characteristic of a supervisor token is that it is
it's own address, so check (val ^ ptr) >> 1.

> +
> +                /*
> +                 * Ought to be a hypervisor interruption frame.  But don't
> +                 * (re)log the current frame's %rip.
> +                 */
> +                if ( n || ptr[1] != regs->rip )
> +                    printk("   [<%p>] E %pS\n", _p(ptr[1]), _p(ptr[1]));

Ah - this n is the thing covering the fact that you didn't move to the
outer context originally.  Please do that and drop this.

If we're going to start using E here, we should make the FRAME_POINTER
side match.  When printing something we've identified as a stub, we
ought to say "in stub" rather than leaving it as a raw number.

Not for this patch, but it might be nice to identify EFI ranges too,
because that's the only other case where we commonly get raw numbers.

> +                ptr = _p(val);
> +            }
> +            else /* Bogus. */
> +                break;
> +        }
> +
> +        /* Fall back to legacy stack trace if nothing was logged at all. */
> +        if ( n )
> +            return;

This comment wants to be after the return, not before it.

~Andrew

> +    }
> +#endif /* CONFIG_XEN_SHSTK */
> +
>      if ( fault )
>      {
>          printk("   [Fault on access]\n");
>


