Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6817D606A31C
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 03:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=qvlJ3X4T
Received: from list by lists.xenproject.org with outflank-mailman.1490164.1691105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSn7l-0005Gg-Ia; Mon, 16 Nov 2026 03:11:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490164.1691105; Mon, 16 Nov 2026 03:11:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSn7l-0005GZ-Fn; Mon, 16 Nov 2026 03:11:17 +0000
Received: by outflank-mailman (input) for mailman id 1490164;
 Mon, 16 Nov 2026 03:11:15 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Shuaidong.Chen@amd.com>) id 1xSn7j-0005GT-Jw
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 03:11:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSn7i-00AET0-8T
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 04:11:14 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Shuaidong.Chen@amd.com>)
 id 6afa73c3-8faa-0a2a0a5109dd-0a2a450ccd5c-30
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 04:11:13 +0100
Received: from [40.93.194.45]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Shuaidong.Chen@amd.com>)
 id 6afa744f-f479-0a2a450c0019-285dc22daade-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 04:11:12 +0100
Received: from BL0PR12MB4754.namprd12.prod.outlook.com (2603:10b6:208:8e::26)
 by IA4PR12MB432591.namprd12.prod.outlook.com (2603:10b6:207:12d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 03:11:09 +0000
Received: from BL0PR12MB4754.namprd12.prod.outlook.com
 ([fe80::ebe5:87e:6d95:580c]) by BL0PR12MB4754.namprd12.prod.outlook.com
 ([fe80::ebe5:87e:6d95:580c%4]) with mapi id 15.21.0615.009; Mon, 16 Nov 2026
 03:11:09 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gW7HAE62mpD8BTzkjFUF+9RQpqgwaRTwcHZKysKyqiE5oPg8++bz0gIeQGrJhlBETKHpCw5ts4WwGJry8JL6VGrwOb+Xtl4oW4IJJtBoMzP8ACk0rGq4npJEBuw4mhLg9BaDPD7ythBQUvTBBfQx+S0y90yX75O1Uwk1TJB/5zmVnWZpHIENfti6EwZocPvjD7FBpxyfLYpGHd6lOqa6o+dFcg3ZDV39AzKDf7ZMt/KQjdA1J15UPWLIVjGwX8Ifuzs/DEGu/ilZBqliA5gPOQ3RgIKWZftDTqNu2R3n1NATuT5YcXL8Ra5MAP3iwVkscTQMh64AjkH4WIjVFWVZIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dp8aX1cMyaugwUiiTypQ8ezcYG71Rjcro4Ult/fE28Q=;
 b=r77ojAMrmf/iVCCHfR4AMmPQdmQqObAj7u8GHIK36s8/jf/hH2Vh6NpbUNkoVCkfRrp66oqWIDYDQRj015jHA4uF0Vcik/sQjZNvFX3Rh74hEARJ2VKrpBJXZ/ddC1R8IhA4PdwbB3REWI8hGPmEe/WzTWuUd3TjMxdXQuHhaARru9eDteHktctQWvI1l+Lp+XCpWtto2wDVgz3Xn0zf7K5J/p6YBiUv1qYZkcwRmdZeDtenxLS1Hy6yOLRXBswSRiHKkhbA7cH2Os5krEIDV/0ww481lxYn2O1QSzaoDwyUZz0khYXdG97qgw9c0HzFnaLCKH3QIfil3JOERvK4xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dp8aX1cMyaugwUiiTypQ8ezcYG71Rjcro4Ult/fE28Q=;
 b=qvlJ3X4TAZxRKlmTFXOADs77g8Bj0NTOYNcvwi6eq72lATga/GGab4MnXfW7V+Yygza4n5VfFdeuIzRFCKvN4Cv/9IoPv/aw40aYIxqRnTGIjkLkcHf3OXhGzIloAM762Lrpm4WAdOk0REBHlCx0NZpexf1C+X8eFX+b/YrrTJU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <696b5591-9cf3-47ae-89c0-4a07d9ae3d13@amd.com>
Date: Mon, 16 Nov 2026 11:11:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] automation/eclair: deviate R2.6 for the x86 emulator
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>
References: <20261110134902.2891528-1-shuaidong.chen@amd.com>
 <69fb2281b50d0d8a959c9347897ab508@bugseng.com>
Content-Language: en-US
From: "Chen, Shuaidong" <Shuaidong.Chen@amd.com>
In-Reply-To: <69fb2281b50d0d8a959c9347897ab508@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: JH0PR03CA0004.apcprd03.prod.outlook.com
 (2603:1096:990:6::18) To BL0PR12MB4754.namprd12.prod.outlook.com
 (2603:10b6:208:8e::26)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB4754:EE_|IA4PR12MB432591:EE_
X-MS-Office365-Filtering-Correlation-Id: 72ca42b0-9735-48b6-cfa8-08df438f42da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|5023799004|11063799006|4143699003|261026135527099003|261026121527099003|261026140227099003|261026130827099003|261028144727099003|261021135927099003|261021133027099003|261021130227099003|261022115727099003|261022113327099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	p3YIcvn6fSGPupozVQqiB6QEZgzXXp36fMawFKKQe682wxlTQWpHDI3BwmBGzWAFwCMYzfHFro5cVoEo4kokQea0Qof5U1AibVRnX7jadbCRXDIqNZuuiskZWReB80VhHVOONFsEtBWFOa9SLz1FZIJGnffFvs78fz/SxPeVQWpvHJfqc/H1cZvxGdCb5K2o4VmvGXCBhJNlaCZlMfwOTU+9e9A0bGloAnbY8dbQ6zuzVauXyq/CT7hALwvYhXDLDmUXynrbXXz43gJRTXzsSR8ODoNpyD8tX0mLB9DSU7M0yiP21AHeZN+AR38EcdcQl6WxcqlnFNxfTK78SxF68wZt8BioPiRfA6M9+LeeANiHrav2lNW27lr5kVIVNgL7h6wPLxnr3vynNFSla5833CBhYzQKt0vz/KXkCo72U59R0ONim+B9oFpzcnY9auCa2/jouEEp9V6yycOwROHMRbbtnxMI4HAZUwwLIa40kKOapuq5FeTJkDwKvYfk+mu5FybcwVM1MhDjFDFR7e+oRlWdazYIi5yomj+AJJcGcSiDy00MVWpnWSPvfr+V9yjLdjLiaxEs1tZjNvOQU/ocThdsNT9wBZmfT8L8wBdE8A2yMu/6K74S/meTq+ZaH/70bBRNnV29QvYHBvk/ZzAKrBssVq6Li2PDw23zIMcphcU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB4754.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(5023799004)(11063799006)(4143699003)(261026135527099003)(261026121527099003)(261026140227099003)(261026130827099003)(261028144727099003)(261021135927099003)(261021133027099003)(261021130227099003)(261022115727099003)(261022113327099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnhuUWVWb2ZNdVJFNDJsN2N6RlRzNUU2QThLNHpKUjR1TmRxM0VSUnU0K2V6?=
 =?utf-8?B?blF5ZG9FVWtsMnlZYTk5U01OZzJsK0RwdUZ0dzJsdkpucVplb1ZPWnFyKzM2?=
 =?utf-8?B?RnRWZ0RWLzJsdlZrU0kvV0tENGtJK3o1Nnl2dUlHNzVYWDA5UkJybmUrdWl0?=
 =?utf-8?B?bVZvNDlrRVNabjNJRmQ1Vjh2TWtlMkZjdCtOUTZ3eEtEamphbUhialIwV3lM?=
 =?utf-8?B?c1dSanpFSm9nUGhKeEdpMVZNWW5zYUxGZjdVTFNXZTNyTVdpWVJSRGx3WXVn?=
 =?utf-8?B?UGc3RzZIdkM4U2hUdmtwK05pVUl1NkVrc1hudCtmck1COFpUZUFUUWVuRWVk?=
 =?utf-8?B?cEgzdzk2MlJ4SythSmpZTlIvRVNISVJnQXpIeU9oWk5scStvR25sUHVjeXR4?=
 =?utf-8?B?S1hsa0YrQXlaV1N2dE5FY0lod0c0Z2lqTEl3WDZhWlFlY0l1Y1g5MWxndzRj?=
 =?utf-8?B?RjZVdEdMMDE2QVk3RkJQVEF6MXc2RWhqUDVkU0tISmJiTk4wa0w5Z1JzYUhS?=
 =?utf-8?B?MXloMnM3R2pnZHBraWhTWGJtNGtpZklUcEZnZHpmNFNnbjk0Rmd5YjdUM2s1?=
 =?utf-8?B?Q2RjckFzMzVNRHNTY0VaaFZTMnB4MXBsUWk1bERWUXRjbU9YQ21hakNrMklH?=
 =?utf-8?B?U2h0dDhhR25lbVVhMDhmbWdjSzVPMjF4ZXk1QWZhUWE4MTAydjdtSXdXVWhL?=
 =?utf-8?B?LzZjeVNoZXZ3ZW5wK1UxQmdGeSs4SHV6Tk0vcGNXSHNzYXl1N3pPWUFWc3JN?=
 =?utf-8?B?cjQrVEhKbWRHaXRVcW43STJZYnRqeTZWbU9remFMMVA3c1lvQ2lVQll6K0Ur?=
 =?utf-8?B?MHoyak9XN21mUFkzMVIvR3FvbEs1THQyVXlncmdDcjZ2SkhSN0tQUWNvSXY4?=
 =?utf-8?B?MEltVXdDa2dUK1Jkd1VBT0l4OVl5a3kxamcvMUt1a2FWKzZtbjY4cFBrTmpw?=
 =?utf-8?B?eDRVVWlYdjdNczdpakdKVERpdUJQZmo0ZTZkVXRRWmNuNWpzVmVTb2NGNHZ6?=
 =?utf-8?B?UkNRQUNacXE3a2pKcEYzbm16dnU4M0dRaldJbFhyQVdONkRRMVBQTTRnM2dL?=
 =?utf-8?B?V29QamphNTRvN2xTSkRuR3hCTk10bHZ1VVBYbXI1djJRcG5QQ0pPWXRBTnBt?=
 =?utf-8?B?MmxEMnZFNloyaTgrOGcwTmFWTVBmSk9XVlJwbXZhdUMrNTNaYXlheDF4YkZF?=
 =?utf-8?B?RjQrM2E5Z3dWSG5uVGZsTlhHclRTdHliRzJ3MHMxeGZVVUxCamdtd1VWL000?=
 =?utf-8?B?OTFnY1VrZkZWOFc3TW9BaC9Pa2YwUndiMGhKdktKSEkxRHh4QVRibVhwZFlF?=
 =?utf-8?B?bGlxdENkaXBpeHVneWh1eG1walgzaUNBZCt6d29SUUhsb3c0Nm9JL0JnNElM?=
 =?utf-8?B?b0FKckxMdDQ5MXVXWUtORXBOeUtNMlpYRGNYN29PY1I1MGlNRVRmdk9Ea2FO?=
 =?utf-8?B?Y3JKaWZQVXcwUmNTVG9UNjZCN3UyNUJxYUtGTEMxVjQ5cDFJeTRsa3JrSzkr?=
 =?utf-8?B?RWhVbUtEU3h0ODFBdFMyRXV6SURNa0hsN2J0RnFPZ1B3NjhSZmlNZlVNTWpO?=
 =?utf-8?B?eXRVTjBZYlM3dS9leVB1M0RPNWV4UWJLRUNKQ2ZQQjFTMFA5czFGVkN4SVJq?=
 =?utf-8?B?LzlOME5QZkJ5a3h3QW43S2hmTFE4NUpNdlMzVlQwS01lV0hqY1J3SDZPaFRQ?=
 =?utf-8?B?cjhSU1ZmNFBkb1NrNytIODlUTWNOM3FQaXlzcXZOdnFxQ0F6MUkwdkUrUmRY?=
 =?utf-8?B?Vk5zemJGditnSHhxS1dIR09GelRMaVlHZGlFU2lCUnRqd054aDQvWHF5emgr?=
 =?utf-8?B?U01CUnI0R2NXWUtiOHU0S1Q5RE1UZUZValFrNndEZkZHU21QMlZoWVc0OUgz?=
 =?utf-8?B?U3NhOXpSQVpDQVZkRlFIcDBFWmJYeE8zT0c1Sm1SM1VjaFlOanFnQjNMQnhY?=
 =?utf-8?B?UjFsbk5zYVdWZVNLL04zUFJrK2U0MWVJL2F5elNwc3gxZnh4Q21wNzZwc1B3?=
 =?utf-8?B?THc2ZVNxbjlwNmVMRFBVVXhxMTFsaW4rR25Hb3p4OWtITFhUU3krNXdQUmRi?=
 =?utf-8?B?c3dRZmRCSHhpb3EzTGVIbFBES3pMeHExMmllWnBJTzJ2ZXNhNFVLN2Z0WTRn?=
 =?utf-8?B?aEQ5ZlByN1pPRlRaWXZVRUVDQjU2cGQzRndXdVh2UFhKcFpvV0JGT1Q0Ylor?=
 =?utf-8?B?d1JUYVp2eGtKWDE2RDV1MERUc1JLelh1d05UeEFjVjQ2RWlGREliR2kvSm5h?=
 =?utf-8?B?MUNJa3BlTlhDVE8weEVhTElMTDJMbGJ2akVJVnJuemh5aW9FbGRhazNrWm5h?=
 =?utf-8?Q?G2Dc3XYVyJBhGjIN/X?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ca42b0-9735-48b6-cfa8-08df438f42da
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4754.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 03:11:09.3605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bi5uX8vZlqBTVw9316i+/W+qHI+uwy1vvjmux1JElwi8Oqwy7fTGYTnj1atAjRq0ltCqJYvXyI4hK5cQT8PxWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB432591
X-purgate-ID: tlsNG-d25034/1794798673-774D7A5B-23B9EB44/0/0
X-purgate-type: clean
X-purgate-size: 4338
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/12/2026 10:23 PM, Nicola Vetrini wrote:
> On 2026-11-10 14:49, Shuaidong Chen wrote:
>> MISRA C:2012 Rule 2.6 (advisory) states that "a function should not
>> contain unused label declarations".
>>
>> Depending on which parts of the x86 emulator are compiled in, some of
>> its labels end up with no goto targeting them.  For example, with
>> CONFIG_HVM=n private.h defines X86EMUL_NO_FPU, X86EMUL_NO_MMX and
>> X86EMUL_NO_SIMD: the CASE_SIMD_* macros then expand to plain labels
>> instead of case labels, and the gotos to several hand-written simd_*
>> labels are preprocessed out, leaving 91 unused labels in
>> x86_emulate.c.  The build already acknowledges this by passing
>> -Wno-unused-label for that object.
>>
>> Annotating these labels would only add churn to the emulator. As done
>> for Rule 16.2, deviate the rule for the emulator as a whole.
>>
>> Signed-off-by: Shuaidong Chen <shuaidong.chen@amd.com>
>
> Acked-by: Nicola Vetrini <nicola.vetrini@bugseng.com> # eclair
>
> See below for a small nit
>
>> ---
>> v3:
>> - Drop the CONFIG_HVM=n specifics from the deviation text, as the
>>   deviation itself isn't limited to that configuration.
>>
>> v2:
>> - Drop the __maybe_unused annotations (v1 patch 1) and the CASE_SIMD_*
>>   specific deviation (v1 patch 2) in favour of an emulator-wide
>>   deviation, following the existing one for Rule 16.2.
>> - Trim the Cc list.
>>
>>  automation/eclair_analysis/ECLAIR/deviations.ecl | 5 +++++
>>  docs/misra/deviations.rst                        | 8 ++++++++
>>  2 files changed, 13 insertions(+)
>>
>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
>> b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> index 296340bb4c..12afc758dd 100644
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -55,6 +55,11 @@ removed by the compiler, the resulting slowdown is 
>> negligible."
>>  -config=MC3A2.R2.6,reports+={deliberate, 
>> "any_area(text(^.*__maybe_unused.*$))"}
>>  -doc_end
>>
>> +-doc_begin="Depending on which parts of the x86 emulator are 
>> compiled in, some of its labels, many of them generated by the 
>> CASE_SIMD_* macros, may end up with no goto targeting them.
>> +Annotating them would only add churn to the emulator, therefore it 
>> is deemed better to leave such files as is."
>> +-config=MC3A2.R2.6,reports+={deliberate, 
>> "any_area(any_loc(file(^xen/arch/x86/x86_emulate/.*$)))"}
>> +-doc_end
>> +
>
> There is already a definition of that directory pattern for Rule 16.2 
> [1]:
>
> -file_tag+={x86_emulate,"^xen/arch/x86/x86_emulate/.*$"}
>
> so you could just reuse that by moving this file_tag definition 
> earlier. For instance:
>
> -file_tag+={x86_emulate,"^xen/arch/x86/x86_emulate/.*$"}
> [..]
> -config=MC3A2.R2.6,reports+={deliberate, 
> "any_area(any_loc(file(x86_emulate)))"}
> [..]
> -config=MC3A2.R16.2,reports+={deliberate, 
> "any_area(any_loc(file(x86_emulate||x86_svm_emulate)))"}
>
> [1] 
> https://gitlab.com/xen-project/hardware/xen/-/blob/staging/automation/eclair_analysis/ECLAIR/deviations.ecl#L534
>
>>  #
>>  # Series 3.
>>  #
>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>> index bee4686675..7b983db264 100644
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -116,6 +116,14 @@ Deviations related to MISRA C:2012 Rules:
>>         such labels poses no risks.
>>       - Tagged as `deliberate` for ECLAIR.
>>
>> +   * - R2.6
>> +     - Depending on which parts of the x86 emulator are compiled in, 
>> some of
>> +       its labels, many of them generated by the CASE_SIMD_* macros, 
>> may end
>> +       up with no goto targeting them. Annotating them would only 
>> add churn
>> +       to the emulator, therefore it is deemed better to leave such 
>> files as
>> +       is.
>> +     - Tagged as `deliberate` for ECLAIR.
>> +
>>     * - R3.1
>>       - Comments starting with '/\*' and containing URLs are safe as 
>> they are
>>         not instances of commented-out code.
>
Sorry for reply late, Thanks Nicola, will do in v4.

-- 
Thx and BRs,
Shuaidong Chen


