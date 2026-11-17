Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5AD606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 19:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=TYQDTRnT
Received: from list by lists.xenproject.org with outflank-mailman.1493122.1693247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTP6O-00068H-3X; Tue, 17 Nov 2026 19:44:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493122.1693247; Tue, 17 Nov 2026 19:44:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTP6O-000689-0V; Tue, 17 Nov 2026 19:44:24 +0000
Received: by outflank-mailman (input) for mailman id 1493122;
 Tue, 17 Nov 2026 19:44:22 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xTP6M-000683-MZ
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 19:44:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTP6M-00GOJi-0u
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 20:44:22 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6afcae4f-e002-0a2a0a5209dd-0a2a450c9854-40
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 20:44:21 +0100
Received: from [52.101.69.80]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6afcae95-f479-0a2a450c0019-34654550789a-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 20:44:21 +0100
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by CPHPR03MB395035.eurprd03.prod.outlook.com (2603:10a6:380:107::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 19:44:20 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0592.009; Tue, 17 Nov 2026
 19:44:20 +0000
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
 b=IejFVDUaLsiYoaunGs9/Jplvtew3ginMzXbFC6mIA7P60YX4inxCnWmQo8QSWB2+sbEdJxMUCHseG7van82btGZWbZgefHJ97LtGC0zhkNBGqHe5fUCjeK52lKWGmgfHKCV+Y/9iscVM5kMWbDCFqn0JCGQOhVJJ+00LibiSHe6eMlKOHGAoogeORC2m1PMpm9MwIJtQ1A4kQ3m4mW6503AfYbYZomSqru6GI/uVzwyFLHehbZLzmkK+x9bKQSad6dYmN4yaYK/uJE7TANSGdZ93w0DGQbzbZVOwqjF7uEP+nK1UbnehCTMnX/5yne+28n7q7LoShByZEr+6etpHHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJzR1wUEaX8q2Ib14WNH4EogHp/b+IvlKUADDKOReSQ=;
 b=QaDpvMg5yC58RPQGbT1F1PBJgGz8Gnko3ZfDn2Zi+htNgiyG7PJsn4a/+7IiFOLLgsRk+833oIOYz39wzFp079c93MF4NfxhlPQH0h4QvmtpIKP95Y8E3tNyujIQk6fSWaAv+oBhGpiNIybxKHpMKOIdJXAC4bQpu5yqdQskiMSRvpeIVGlYJ1qGI+FJTt7bkh1G7UknQ0nb5zebIjanswzNSR0ZcXAoXCZUKTHZHTTKq5JqO371jMYpdezfuD3Z7fMTQAx7xH+1IdrtfCoGJjuIDMtG1Yk7aCnzNM0d3kaPVXC6WLtbooPmCCaa/LUjNfXGESdabb4Xo7GLh+5rmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJzR1wUEaX8q2Ib14WNH4EogHp/b+IvlKUADDKOReSQ=;
 b=TYQDTRnTffy/ZwQgrv3SGgJdRUi+w+03E1pvYwIfzI8Q93EIxcwdAhAv2RWH4ZLWB77p7qph0KP0mixlXQ3josn1XS2u2H3joyufIXlpXAP/NEb+Dbf1KXe1oPENQe0YHRgNPe8BIeu1WeoUixIcQd06u6l/KHoYEWFTfSkZKqrH5v9sMZFxYQVWa9w0riWDoY/TftnHqkiLm1/6F2xyPUFRurSR35txw2aR6Xr+Se5IlETxsuZ6cAv2M+LOQ/HmRt+VAyWQQInM6Twx0QlSXSlbfpgvYvCSorz49PDMz9UeoZfzbpcHkHrmo7Cb4wRy6hLdLoNPGccGblm7DsMZnw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <0e9946c3-0337-455f-8400-33b752156215@epam.com>
Date: Tue, 17 Nov 2026 21:44:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] xen: make stop_machine_run() take const void *
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>
References: <cover.1793699713.git.dmytro_prokopchuk1@epam.com>
 <60f768b63656cc41b664678618c17248823b2d7c.1793699713.git.dmytro_prokopchuk1@epam.com>
 <f66d95a3-51cf-4a10-9984-e1e44a7ceedf@citrix.com>
Content-Language: en-US
From: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
In-Reply-To: <f66d95a3-51cf-4a10-9984-e1e44a7ceedf@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4PR09CA0023.eurprd09.prod.outlook.com
 (2603:10a6:20b:5d4::13) To AM9PR03MB7526.eurprd03.prod.outlook.com
 (2603:10a6:20b:3de::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR03MB7526:EE_|CPHPR03MB395035:EE_
X-MS-Office365-Filtering-Correlation-Id: 8627bab8-9be8-4df4-0f96-08df44e32c4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|18002099003|22082099003|6133799003|261009223027099003|4143699003|5023799004|11063799006|56012099006|261102123227099003|261026121527099003|261022075727099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	vrAR0K9lpqgMAJz/UjZC4GKCkw15Ku2mtTw4WWBMcof23jLOD9JEJc1yGoljzHtL3I7UBEso+1WZGpDfQrENGx0diYiIumpQ5lYG1zRHDi6ouc9O+SJqFPN5UFY13WGhcFdm10HtROWuAIPKhKtAASpE2z2TCJn2mhdJ19js1hYoOrbycE7uLPnAlVVjWJGLQaGn6BjTNn2MSPYOhETfemz1YZUBQUFbXeWzImV1A+3q+OcFX44jFfNz1FT1cgpTO3I0CTAAjZSoyE21H5GptmScfvK1JEV9HSgARd2+yjMITDWFpQNDclqBEOZAOaUB59oNyJq2Z+BCRDDHllutpSwgSW5XIVPvt8uwsvEmfeKm0jK0i+5fK+jFTqKiGq873aI86nPtz8/3hvEs8xKIe3EocCn+TiJEuL8fiK3dnUwcyCcSWAuyYFk61EvLhCBnI9vU4O5ibhTXy1nAGrHogX2vpo7168DiTAGlDxaSDGyPvgAa0uSKNCxjE1FPPD1s103Apc9Jyzch1hMFHBm+UHNMqHzNu2huWToEmEP6FMSnoHqWIg0Aa/4B9gQQG75Z+vBb51uM5noznNwq9s4xjXB3uaPCJkZ84jTkrXrsVxSAHF4l+EmFYwtq/dQOGsnGf/+h+eWwfqrRrDJZeRWEA3PqALZvey+inwYnqDc9FPk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(18002099003)(22082099003)(6133799003)(261009223027099003)(4143699003)(5023799004)(11063799006)(56012099006)(261102123227099003)(261026121527099003)(261022075727099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3hJZkwrYzNsb2M2bHJLcHdvaHpLRjJyVzREdGpER1c5NWhHcE8xRzF2Ti8w?=
 =?utf-8?B?b1dSZXhQMGtmTXR2eUpMMTZ4UlFFblF3Q3BTZFY0a09aZEd1Y3crTzk4dFNk?=
 =?utf-8?B?Vm5WRGNFalFWd1N6SE9FSlhTeXRKZ1VKeHAxcXBjOXQwZ3YxdzZXME8yczcy?=
 =?utf-8?B?bGNZamplSFpNbmZLTllJL29SNjhvUUhYUlFYN1pUYWIxM25OK1k3RjdLVlpT?=
 =?utf-8?B?U3JycmNCNjhuMFpHNzNCd3lpYnBRT1dhM085QzE3WVVFV0gyc0Mycm4vSFBG?=
 =?utf-8?B?SW9yTjVaelFCaUEvTzJUMXQ1WHkyL0JraUtBQnhlRlgyQ0FJdVRGUzVpbTlI?=
 =?utf-8?B?b21sQVZtMkxVQnRwbVgvWEl2d0VNZysvMWJNUXRvMzVYYmd0L3pEOUVSMUU3?=
 =?utf-8?B?bHBvYkRLNVJsOGxZekFuYUJpM3FKMzNYa1ZGOHFLNTZqblNwb0VONmdDRVlm?=
 =?utf-8?B?RzBnWWlJd29hT2w4MWJtbTRRZ2I0eU5LaGd6bGRhWVdQaTlyeFF4QlBXY3JZ?=
 =?utf-8?B?RVJRZElIdWtLclJqTkdmdTI2Z25ySWttbFllZGxKMHN3dmRaLzR3Skl1TEhV?=
 =?utf-8?B?MTRFakRpR2F3UlRVRjRCYTFqdDYyQWROK2RWckFKWFdyNTZ1R0dtMHRSR3o1?=
 =?utf-8?B?T1V3eE1qbytod2pqdkVRS2lGZU0zWDRiZmJFRDRibjF4dVMzdTdjTllvTFZR?=
 =?utf-8?B?MTg0c2hKUEx3eDR3d3MwYlFrZ29jVmcvajU1ZHlZTDd1NFJGL1NwdG14U1BW?=
 =?utf-8?B?NG90ODAwWXFUY2VUaEoyNEpxMDNOWmJFRHRvNnRHSTI3VWNWS1BGQjNyV2pE?=
 =?utf-8?B?TnJYSGQ2OVpONFhPSEQ4YW5BMVcyK0lidnlvMWZKU2dEVFVNVlVwdU14TDky?=
 =?utf-8?B?aGE0Z2Y0MmhHRVdwYkhLWEVCUFBNaGFyL2tzczlEWkJCLzh3MEZxSGF4Z3VQ?=
 =?utf-8?B?SGo5MWI5SUh3SExjNzQ4dlBveWd2WlBkVGZPdHViSVdBT0J2czZNeWF2ZE9L?=
 =?utf-8?B?cEIxcFVybm1keGtIUjR2SmIwZ0JueURnRHBxUVk1OHBUQ0hndEM3Nkk1MG9V?=
 =?utf-8?B?TG0rdnNCNGhMRjdoSktKY3BwR0Uxa3c1TVQ4bkNJRDEzc09IT2JmZ3Via2M2?=
 =?utf-8?B?RlROcFZqK2VVVHNnZlJHU0FucE9LY1hmOVZENlFFY1dCcFNGdVlnV0hkRFpa?=
 =?utf-8?B?cU9GS2NNWUsza053cHJCeGs0b3R5WGM3VWpMdWVtcHNsZ2JtZEFSWmdSTGQw?=
 =?utf-8?B?SFJuM3U5TnR3SUdPdHZveHNIeWo4b1VXeGNTSCt1V3REL25jbHFwS0RDUU0y?=
 =?utf-8?B?UStFcUpHVDJpMW90a0M0bzFkUzZ5NVo2S0gyV0lySkhteHpVWUdIN1I2SVl1?=
 =?utf-8?B?WHhBS2IySmYrQTVodzVNVmw1ajZVa2dnb1ZiOEVUMUZCbVhUcWFxWDZMNTBV?=
 =?utf-8?B?M0tMSzRxdFFMeDhJQUQvd1NlS3dObEI4QzV4UGYycnBXbDhCd05jZk9Hb1pu?=
 =?utf-8?B?dzlKKy9EeHhiUHpTczdaeGUyenRoUFMyR2NyMTBCa0lZdEozbWhDcVM2WHY1?=
 =?utf-8?B?QVhvYnZiOXdwdTZzMEJWUXRFdWNWRW9pZzU3SUh1dWI2S0dHRTJOYkNIM3Ji?=
 =?utf-8?B?REtOYkJwMmZjZDVoRExwdi9qRitrQ0hpZWdLNXFTaFUyeWptb1NXeWZBQ2Nw?=
 =?utf-8?B?cmg3SmplcjRYWnBHNHF3UEpNc0NUaE04REdwZ0pZQU1CNk9ob3U1Um96K2Rv?=
 =?utf-8?B?dnRwYklTUHMySXNwL2JNdlhFYkpUV2N3OEhoQ0h4b05lSDBBd1BVb3Fid1ZK?=
 =?utf-8?B?aDhTOEJqaUxBbFhvTE5sRmdEaisrMmJsNVE2cW5tOW5LTGdvWElRNDdqRXZX?=
 =?utf-8?B?ekFjdEFwUGxXZHZWQmhDOHQxTE9EV1dqTlB3cVQ2UzJGVHJycndFRzllVEJz?=
 =?utf-8?B?WkM5STJIZzB4WjBBVENMVi8vR0xXY0RWdTB5WldweHROR205RkNUUkQ5aEVL?=
 =?utf-8?B?Q1NkYmVLcmhKK0dOSHh3T3RRTXdsS2FyT1dnaTJCUFZvRkUrOTFUcFpTbi90?=
 =?utf-8?B?OC9oa1pWK0tKNlhjZTI1bTZyYXZZM1lMRjU0UGU2YlN6MTFvNUJzOHJwaG9M?=
 =?utf-8?B?bVBQSUxOQ1BHTmZ1UlNFNUUxeFIvRFhtUm55MUtiSGRLczRsSEh5LzgyUFU4?=
 =?utf-8?B?aW9WVExqS256L21PL0FpM1Vab29hSFlqcEVPV0Q2QjhrdGhSZEFKMnlwQTBv?=
 =?utf-8?B?b1FHQ3JIZWNoK1pocUVMWkNNVFZFMXpGNEhIdUdvTkp0U1hzbTMwTGVvbHM4?=
 =?utf-8?B?Q1F0cUIwOEZ0TDZ6OUVqcXp5cWdsUU1XQVc3QWpsalBDWnNYQTZnWWJtUFJD?=
 =?utf-8?Q?J+jPIRlRyvdiSmzM=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8627bab8-9be8-4df4-0f96-08df44e32c4c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 19:44:20.2621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C7LMxfTzUjcSauclvvuIfJoQ2UC5rdZobjA3+OaJtV0ipa5oCkZ3pjN4da7G0g+j9yBtCjM4GjoGZuuWo709fV4QnExtuKo3pMKjOpDgNmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPHPR03MB395035
X-purgate-ID: tlsNG-d25034/1794944661-778D5A5B-69576675/0/0
X-purgate-type: clean
X-purgate-size: 2061
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/4/26 13:49, Andrew Cooper wrote:
> On 03/11/2026 10:29 am, Dmytro Prokopchuk1 wrote:
>> MISRA C Rule 11.8 forbids casts that remove the const qualifier from
>> the pointed-to type. On Arm, enable_cpu_capabilities() and
>> enable_nonboot_cpu_caps() cast a const struct arm_cpu_capabilities
>> pointer to void * so that it can be passed to the capability enable
>> callback, either directly or through stop_machine_run().
>>
>> None of the stop_machine_run() callbacks modify the data they are
>> given. Make stop_machine_run() and its callback type take const void *,
>> and update the callbacks to match:
>>
>>   - the Arm capability enable hook and its implementations
>>     (enable_smccc_arch_workaround_1(), enable_spectre_bhb_workaround(),
>>     enable_bp_inv_hardening() and enable_ic_inv_hardening()),
>>   - __apply_alternatives_multi_stop() on Arm,
>>   - do_microcode_update() on x86,
>>   - take_cpu_down() in common code.
>>
>> This allows the casts in cpufeature.c to be dropped.
>>
>> take_cpu_down() is always invoked with NULL, so it now passes NULL to
>> _take_cpu_down() explicitly. _take_cpu_down() keeps its void * argument
>> because it is also used as an on_selected_cpus() callback.
>>
>> No functional changes.
>>
>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> 
> I think this is a backwards step.  It is pure luck that none of the
> callbacks right now modify their passed pointer, but it is very
> intentional that some callbacks might.
> 
> Callbacks use mutable void pointers in C, and this is a known friction
> with the C type system.  If there existed a way of matching mutability
> between the callback and the pointer, we'd be using that, but it doesn't
> exist in C.
> 
> The safety here comes from the fact that an individual function doesn't
> modify the thing it was passed a pointer to.  I think those want local
> deviations.
> 
> ~Andrew

Understood, thanks. I will drop this patch. And I will think about the 
deviations.

BR, Dmytro.


