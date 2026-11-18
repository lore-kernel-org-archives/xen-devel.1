Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D650606A335
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 18:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=ptWZKB6Z
Received: from list by lists.xenproject.org with outflank-mailman.1495026.1694225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTkfC-0002oy-3p; Wed, 18 Nov 2026 18:45:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1495026.1694225; Wed, 18 Nov 2026 18:45:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTkfC-0002or-1B; Wed, 18 Nov 2026 18:45:46 +0000
Received: by outflank-mailman (input) for mailman id 1495026;
 Wed, 18 Nov 2026 18:45:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xTkfA-0002oj-9M
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 18:45:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTkf9-00Gnxd-Lz
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 19:45:43 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6afdf248-2eae-0a2a0a5409dd-0a2a4507e626-16
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 19:45:43 +0100
Received: from [40.93.195.0]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6afdf256-b4ea-0a2a45070019-285dc300c98d-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 19:45:43 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN2PR03MB5104.namprd03.prod.outlook.com (2603:10b6:208:1a9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 18:45:40 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 18:45:40 +0000
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
 b=M6iVj3NlVtD9/cUkCYlkA802k8snjY+0F9MnrSwFMoERoYJRgvEX5pj/bt5T3YkPxxESzh++tiAqM6ISvHzSuKQYaEqBicckzJieGSar00RaWEHHNdm9MavcZBkl6+k/TOGP8Z7PVKxkHerMuuwSwgWxyMIqsOHlmEeF8Jzl877nrpQwUmIpqg1HywXNbAdOF9w0f0TUA8ABUqepJSILtPQl4puWI7QwlOEQDlPPOccqBDL+U653Um14Ivgsd3shUvCcbvZ6RfdHJhdrDBdq9CvJbjAQw8oQuJkgF/uTodUXDuEVl5I3+2rTf8uij+JV5csqh+e9n/UqS7tZmSkaWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gn3hoDuvx93wuXeWEOuh/xcjjJjMlFXL2Z0gwuHWZqo=;
 b=JtzD9ssWm2Cc20T2TNo9gYeOvu8y41sjSAZe7WRvxJ8PcWiOIAbiZg/DxHu2aXS4NjwwPl4x3srtw4m3Ob7iCSiKL7rqz0NW9WnHkPFHvXfyI3pnS5jdFHz8LTa2EuEiyOgL7qTj0HrkUz3be1Ufh5YKfVgumzuLmSoWsp2chK5/uyoV9T+wDceunyTFZXBtdhAYqCIWCBCYWoo2i5i/TZBg8STKNJ0QMJmF3CNruflsBIPGLlN2+jcSBVcADYl0kjU2QcXcW+4jFmaT1etjiCFMQAPze6qFqYnJEE1FwnjZEoyOZJsJVqucocjy1Wxvs77qXBC8ksrdG1l5fi6dbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gn3hoDuvx93wuXeWEOuh/xcjjJjMlFXL2Z0gwuHWZqo=;
 b=ptWZKB6ZC8LrULC0m6oD8as81pltsTSi1xOsb/xtYX15MI1mVNMQc32KHMIkEEieuEzoWCaJpO+N4tvRvuzjt4nNwhoaXWAKfxUJ1q1oMG3msDzLEzrCNZPAibVZRTV0uAf7HIq0x9p4ZjM+qMu4OWYO5gdx0psx+oxrpIKsJB0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b0c2caa4-f12e-4d56-8cb1-33547b9d5cce@citrix.com>
Date: Wed, 18 Nov 2026 18:45:36 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 1/5] x86/cpu: Add break to early_cpu_init() switch
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20261118171758.1125066-1-alejandro.garciavallejo@amd.com>
 <20261118171758.1125066-2-alejandro.garciavallejo@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261118171758.1125066-2-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0031.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN2PR03MB5104:EE_
X-MS-Office365-Filtering-Correlation-Id: e1835d0c-a3b0-492e-70e0-08df45a42474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|22082099003|18002099003|4143699003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	yKhbKCTBqNCJFcoJefGCrFBLEFFJGYIpTifZMu000d/KRGbAsw7ek9cyAn1o0hDEW/ifTgOtaswi0Wq407QiYOKgstc51PjqlepQIRhTOEKjOkcbiYJALQ+P85ER2xaOA7TIqYX6tiihnCIm7ZgYx5rrxvvpxMaXVmjkCSMMeFTko3nXYACfTBum940fnHk52PwByRvy7XF9lhzgrF71k6K9JhjaKjNlIOvLsnpSl5b9MKK7af6mggEXpa6vOpQLLlYfR0YCKHs0qDi65ygos4tVgIJl8MSh7Qhy5AbpRVySnLIvkIS66PiVXyYBrlnNhOQzva3LlihutKw2EiLCHE0gu0S7zQL+WHp8OWBQ0ZvRaytH9ix2I/l2vmuq/BzgqOEgTdff3ApvLp2yCEYapWv6/39vFyQLs7658brkWeWwjNwPYGRlcDKmikgJbfsvFOMCjI89Zv9MWXINum4emmdvNxKwVBuvTmXBdfPenORVRV7afsRxTWNYAmeQTK/31kwXttELRk1QZ78TaS1KN1Lk4nzIAcIgdj7SDTH2PSGJ/3c13O53/fst9Ft3btyNzdseoCFbAqhFjEruqQQrvty4djgQ03dmTiaSOH+7UT5FYawoeEP9pfqHOA4+R4aJGdGU6CUEpdlSVjP8jA4zHi1SulbQqbkh1vkaIxZ+WbI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVA4SHdDM1cvYmZmWVhqTDRWOFoxeG9ZQzYwZXI2emhmWG1FcWJjeG56UUM1?=
 =?utf-8?B?MTlRSCtRY3hCc2VQdWR5bi84c0p1MVBjRFhVZHJKZzBYQzVaSUR1bDNCSFo0?=
 =?utf-8?B?SS9oUFEzVEplM3NkMDBrWVJhRmtqV216R2E1T3lRcWo1cmxkbUpWUEVPYmJq?=
 =?utf-8?B?dTBwcnM5QjZKVTVRZlVjcVVQVGNvdFBlVDBQY2h5bks1b1hwMGhqdkJrMEow?=
 =?utf-8?B?VFhaMTF6Z1RORjYzR1d5dC9PdTBhYmE5amhCUzZxTzFFV2VSQkk0ajZDSUM2?=
 =?utf-8?B?dnJZS1QySnhOTlZVbHpra21TdnFNajZUUkV2Vjd5UFVLV1pJeHJZc2JPMmxY?=
 =?utf-8?B?MFVoWDJLVlBRWTBnUFhyWk13ajllUTd1eTlCSFdJaFoyT2dVaHhuSTZmcFRa?=
 =?utf-8?B?WHdVMUF1b2Q1MHZvSllPRGRMZUllTjdYdzVFeFpYZGhvN0NTUHI0SUE0a3Zp?=
 =?utf-8?B?WGM3dTQzWGZkbFkxOWh5R3FkTzl2N1lsWEJuSEpQQm5lc296M094Sk4vOFNw?=
 =?utf-8?B?VzNVZHl5T1Yrdjc2dE9LN2JTa3FsRnU0bS9NTFc3aTlhQXJMekJUOTFOSVc5?=
 =?utf-8?B?TGdJYXZTTU51dGFHYjdPS3ZzTVdaOEcweDRaRWNSNEYvYVdhMkJIcmw0VUd0?=
 =?utf-8?B?czZ5bDhkdnRCOWNSSFA0RDNtaDA3SFNKMlcvclg0OTkydWNNMlZSMU9jR3Bn?=
 =?utf-8?B?VzAvS3MxZlB6OG9LdEhnODlZUFVnR0FRSEdZYVF3VnVYR3poQVg1TEtaSzZl?=
 =?utf-8?B?ZVhKeGVibk1zZVBqdUF6OUQrS3NVVStaSmJwNmVYUEN4bEJMOU9OTCtJUm94?=
 =?utf-8?B?VDBSMlJ1RlVET1VlZ3E1K1BqbUlrUDhUdFBNaVlaU1RIZENjOUJtRzhoL3Jm?=
 =?utf-8?B?MTR3Um5rQ0dMZndHTjRERk1uakJFd1ZQV1dTWGVmU0JRRFVOaXRoKzZReFpJ?=
 =?utf-8?B?MnJrZFdHS1ZCYld3cklXYSs5azE0Ty9ybTNvMk55SmhCVmJ3YnpiVGFzM3p0?=
 =?utf-8?B?b3ZLNGhBL2JxTzNhWTE2ZVdRR2ZzcVF6RW9kZTV2TlJ5U0Zhc0prRTlPZHpU?=
 =?utf-8?B?RjNaYWVEYXlJOGtya01LK2lkNHhHS0V2bk5TbXdjU2RhREFxK1BzS1RhQURl?=
 =?utf-8?B?NTVGWWIzNmRCSzJ3WXdDTm9ob0wxVlRLMXV3a3d6S2Q1S0c3UUR0WDZGVXpB?=
 =?utf-8?B?R2c1bW5kQUthZTZmYXVZZW9JL2ZpNHFXQklQTXpsQThmaElVbEJvNmluZ0ZF?=
 =?utf-8?B?bWgvUCsreWQ5cysyRWhLYnZVN1JjMHZkcWQ2OEUyZmcybnhES2lHY3BWRTd1?=
 =?utf-8?B?YUhIeWtXbUJKY1VSWVFNS3A0NFlzTG5GcVpHMWRWQ3lQSlpRczE4dVJlMXNs?=
 =?utf-8?B?SXp3TUwxTEJTUThUSjdQSHhwL2dqNEFlN0ZyRGthS3NUNWZCMEN1dlRTdWZa?=
 =?utf-8?B?SW5vMm8zdkF0TXg0cjIyKzJtZmdVVWo2MGlEbkVsRldyY1N6cTJHaW10WjZt?=
 =?utf-8?B?S1ZtV3ljdzZvbjIyaFRPd2M0R3c0Sk5xTks3eGhYenB4N2szZlpiS3VFUytW?=
 =?utf-8?B?WjZmYmtKbFVCUEVVcmFqb0ZxN1U5aDhnYVJyMExkK1VvU0xjalRhdEtPRlE1?=
 =?utf-8?B?MzJNZk9NZEowa0FDdXpLQ3RGVmVsNG5MdmxqVkhPTVZNUjVMcSs5eG5zeWkv?=
 =?utf-8?B?YTluSzdobnd1aWYrSkZwUytHTmpYY244MEh5SEdTalQ2ZmRxeUdSQVQ0YzlQ?=
 =?utf-8?B?dmtGajllbGNFY3pobHdPTGd4NGRUMmpzaWtSaFpjUy9BTGRhVVlWT2lDWXFp?=
 =?utf-8?B?TnRlSzRBZXZOOG8wOHAzYkpJaGpPSjYwV2Q0M283KzlyOHBZZGlLOHdEUmxz?=
 =?utf-8?B?aWtLRDZMcENkcGhnTDY2VncrWURDakNodUEyVkxGaW9UeDJ1SW42KzJsdlB4?=
 =?utf-8?B?VkVFdXpxTHZsbkVBaDZ4TnQvNUtZSW9HMm9mQ2JkRUppM3c2TEtvTlk0VUhN?=
 =?utf-8?B?aTQ4bENiMTZZNFpmbUpIQ050TXlKb0MrNEEyUUdJL3R1TEtlaUkwZHhJTkZR?=
 =?utf-8?B?Z0VScnVQT3FYeUxOY2pQaWw0WTZ3dyt4eE1Dem5RN1h4OTRpck5sbE5vMjQw?=
 =?utf-8?B?aC9YSkZkNk9EcVBJS214blc5dzIzWkpDbFBGdUM5aUQveUk0dkEwcWpLSDUw?=
 =?utf-8?B?VWx5Qis3b2xtSDBxS0l5MzdUbjZHZFV0cVdkd3NiWVlrSFhodzhMNHQrbHdK?=
 =?utf-8?B?cW0xcEU5SUJGTGxjT0ZtbTNxZ1ZFTEgwZVpmVHAwTE5kdlBVajFnTGRRc0NE?=
 =?utf-8?B?VG5lV2lxN2JUKzRMZEJYY1ltQk5zOGh0MXY3c1p1UUt2Um9LdjJSNGZBR1pD?=
 =?utf-8?Q?WiujJgC+k4avIXso=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1835d0c-a3b0-492e-70e0-08df45a42474
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 18:45:39.9244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XgakAvsRC067iQf49BPkomWuNrNlfL1rIxgmoAcfVW/00OK+rHU42uvlKRfitFHbXnXp/hB2Gz+tAD/WxTO6s/c1uZM8NYJlE5C3MirOJdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5104
X-purgate-ID: tlsNG-ef75cf/1795027543-A5EC6AE4-406C46C5/0/0
X-purgate-type: clean
X-purgate-size: 312
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 18/11/2026 5:17 pm, Alejandro Vallejo wrote:
> MISRA C Rule 16.3 requires every switch clause to be terminated by an
> unconditional break statement.
>
> No functional change.
>
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

