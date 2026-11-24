Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2C2606A322
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 11:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=mrLNQNGz
Received: from list by lists.xenproject.org with outflank-mailman.1500845.1696894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVp7Z-0000sT-AI; Tue, 24 Nov 2026 11:55:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500845.1696894; Tue, 24 Nov 2026 11:55:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVp7Z-0000sM-7b; Tue, 24 Nov 2026 11:55:37 +0000
Received: by outflank-mailman (input) for mailman id 1500845;
 Tue, 24 Nov 2026 11:55:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVp7Y-0000sG-KS
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 11:55:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVp7Y-0005p4-0q
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 12:55:36 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b057b2b-2eae-0a2a0a5409dd-0a2a450981ae-16
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 12:55:36 +0100
Received: from [52.101.46.41]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b057b36-be1a-0a2a45090019-34652e294aba-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 12:55:35 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH5PR03MB7885.namprd03.prod.outlook.com (2603:10b6:610:20f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 11:55:31 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0662.001; Tue, 24 Nov 2026
 11:55:31 +0000
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
 b=DqM/U1Nse5jfqiSaaC05tNhz4qnH65XZDHSNscZobGdXVjqmlAaHtFQD9Vyun4bcV7yFIYItdN7VR0/DmXbsbnJ4zdl4TT+pm06/TVKvlxOaFp+OY6s02SlVShkDcqRdhWDqXm5734UnyxfvJXB4PdYJl+iY32xDuFlTZ6uhS0iUp56As//XOQLvMKbJJd9m/FKpFDlwn1U0sJptHeEPwcTp+Fo5p53Br2lcouUXPZOdfURUvtC3ZJBl/GjWnH0s+AEuPrpIkMOxnxWUruNBgFGIF6uwJxRMTbjdfadMgfnJVpwz4VcWzslzfxmIwFrEKBjDV30PzC6H13rHfn1quA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z6IXkOw+5i9/9gBJQZGhJWqbkGNoBROjJG6K/3LZkMo=;
 b=TNVxmkxysm6vzZPw4MbSVhRG/4fsUnWDkQ0KjD4AJ0zTZKlrWdL1VJxnguAPd2WsZVKCPLfCfv2zgJZ7V5j3OWy7liRTG7M8pK/WmG4/APmMDYP48ou57uEU0MiHzgYyalgilH5w67g+kA30LxSr0Ejnlru8sgUe4cmgXYLvyKPVaBsu7GlAdpTNBhCgIB97CuvknqZqo1My8j9fRboPivgC/PiEyssjdgl2k68zTICnyFRHUv/mAB4QDpxCjcK8NY3sIvPoObNlArjZFAL23ur7Gd1fh27+Cv95DW6n7AtZssE8xTwFbvoKO480UJea2JL5Ij42Li1AWGRm9UIDXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z6IXkOw+5i9/9gBJQZGhJWqbkGNoBROjJG6K/3LZkMo=;
 b=mrLNQNGz7AIAEnbHK2fKR8i+XGgqD9V2a54spexXEvEqkGPabMhWpZ8HyWFy5feSV6BiF2D5xQcbmOY4V5hH+2041+qlE1ht4mNtASNrc6jH8yM0W6R2P6BWqrlmvvaAAGoVUMJrRt1QKM+30kHlCY0tvTfD7SPIbpP7gaIF2Cc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5608f7ad-006f-49fc-9a84-a32a6d38bc4f@citrix.com>
Date: Tue, 24 Nov 2026 11:55:26 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 0/3] xen/treewide: Remove NDEBUG
To: Jan Beulich <jbeulich@suse.com>
References: <20261117115549.3872611-1-andrew.cooper3@citrix.com>
 <a3f79064-9030-4efd-9829-a408b73c81c9@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a3f79064-9030-4efd-9829-a408b73c81c9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P193CA0051.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::26) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH5PR03MB7885:EE_
X-MS-Office365-Filtering-Correlation-Id: 9083cafb-00bc-4a5e-6d12-08df4a21d6f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|11063799006|10067099003|4143699003|261102123227099003|56012099006|261026121527099003|261022075727099003|261021121427099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AylaTKvrssp/HCYqu08CgfcEMUunFFoB0bAIS/OjPlNDp3I9Yf2Ac7VNPcrogyodWHGj9+NLuJVDktIUAszxSZRwIYu88PY51/sQtX43MSEQ6T5qAh8H/RvAhFulYwJPz3hyzyKprYZwfqz0gLUWuDyh0xc+PkDdUf7kBO9GD6pwSubROVLu1Yir2zGSUjXFv25BBhDNJ1DgcMwfrKpMV28DcnqpHLyYuDxtDW/H/j9DGHZc+eJI1egoAcaOBOcUK5KrFtpmtGuScs5gRjK0Th3Cdf1b3ZoB0N1xxbuKxvzuOZfwX27wRRU775eCV1vaW9FYJSSoZ8Npq9IXrz/5aEdt4C5bshESVD/NVcYJBzdIYKObFJxfZdfSvDRKgfZfo3+Dt9pCpt9Fh41ZvmFYUQjNSyx4wh/+g9dCWIym3jJnD2AHMOb8r3FJE4i7bArZvBq/iTddN8CP2pVhWJCFp6irfcvmnm6SXDFmXs2ZTnoajmi24rP4kZNSKHC7oyFnMP8sZ5NgfNuFH62el8odoUKu/P/gqeXNwqMu87R3FNbDFSWUz/kVQGAtyQe+QS+61DiSEdshjlp4DtPrQ12iZ8BXsnNN2G0LzWoet3WVC2i2FEtA680VAdodZPuAjv060SbCXWwr8MSXmuHL1Wq9L5NDsK96w//esvfBiwp9HkU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(11063799006)(10067099003)(4143699003)(261102123227099003)(56012099006)(261026121527099003)(261022075727099003)(261021121427099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUk2bHNnTlFNNWxEMnR6QVJ6SndOaTJ6bTJjeHAwRFViVlRSYmN2bjR1cFcy?=
 =?utf-8?B?MkZ6OGJMek9PWlFOTHVhQXVZMEl0cC9BMGIvc3crd2pwZTJOc1NjbWRmS3g5?=
 =?utf-8?B?bXZJMmg3aE9SLzExUjNWMGVMVnd2RndsYnc5ZXRiODBBTFdmRTlCR0tDdWZa?=
 =?utf-8?B?M05RUGJrZmpkTGJMVHBwTlFmUGVpZ05MVldRd2R1K2F4STdsazZGbGNCTDQr?=
 =?utf-8?B?RWR5TWU5bUR4V2JBeFNlK2xXeDF4NW8rc1d0dldRV0lMc1dzczR2TkwzMFli?=
 =?utf-8?B?Z0NJK3lXSDFsU3VmQkxUMDNKNzVyc2wzWnNRUURsYmxiQ0VBWGVXQjVOelFk?=
 =?utf-8?B?T1RKZWx0TllUaVQyMStnVENsbWRvSzZCZXNuOWJjYjN3am9GOGJMWTN4U1Zt?=
 =?utf-8?B?cjhKYzN3L3NiRHJHQjZQNXdLYllhZXc0S0ZEL3VhNk9nWEdNMC84RjlNaHND?=
 =?utf-8?B?RGFWUlk0a3lKWkhJU29CMndNMmRoOTVXamJkSGtGdkFkWXBYYzUzRlN5Zno3?=
 =?utf-8?B?ZTAySkkwdngrV1lyc3BMSGJwMTBORmpZYjVRVHY0dmdTVGFDcjZ0TStsQnlU?=
 =?utf-8?B?WFNQbTVKeTJpdE9xdUhrYjl0a3VaeVVrMFFRU1JwNS81eEpuNUxUQ1EzOHZi?=
 =?utf-8?B?R3ErTENGUTZITVgvenZId0JNOWROTnJzTThnb0FCd0packpSRmJ6YS9rWkxE?=
 =?utf-8?B?enladlRtUWRVSjRvby9Ia2hPdUxoK2hKVTIyZ0d4YUN2QlpuS1dxemUzUkRI?=
 =?utf-8?B?b0xla2xZWTBIbGk4QThxNnVBWUNSOUhvMDl5ajVmM3F5dFh3d1B2Q1FRTmV1?=
 =?utf-8?B?aVhNOUxzTE9OQTZtcjNQQm94RWFQR2l0UnNuYmpma21hcjh0Ty9Md2V4ZzlM?=
 =?utf-8?B?N3Z6YnlGTWFIOGZiQlJDMVhPQUU3bUpNeFlvUWNsemhKMjhPamMzYlUvb1ds?=
 =?utf-8?B?NnJqYmJJSUJlb1I4aXhLeWZhMXJaYmRXeXdiMnhiMU1pMitVenArZXpHRGwx?=
 =?utf-8?B?YnBxY1ZHNFpDNER0amlOcmErYmxzOUR6MUdRSkFmVkxvbEFpOTIxUElsbHFT?=
 =?utf-8?B?VGZqeW9jaTd0ejQyZDdMNHhucC9pdmw1NkdjY0JxNmhpRTdRTWJ6dnZnaFNq?=
 =?utf-8?B?UlloQWlBYnZ2dW1ZTWdSLzBPb2V3S1YralR5aGV2S2JiUm54Mk1lMWZWTWJB?=
 =?utf-8?B?ODlGNUFKa2RwMkJBVHB2WDlRWmJJNjlka05vS0RsNTFHeUN0d3I4Z3JQN0hP?=
 =?utf-8?B?QWJId0pML2JnK2NycXFwR0k4L3dWa25scVF0N3d1VnpJRUZ1TmJDdXdRYk0z?=
 =?utf-8?B?STNxRGg4QTdqUVVzdXVyOTdGV1Z3VWxqQ3ZzRkRWaVNLRzRRY25kVjdNd0NH?=
 =?utf-8?B?NWFRU3hVWXB2dFM0UjI0ZjJPV3EyKzRPUThpcU4xbUhtZjlwV3ZzNmJ6N2NI?=
 =?utf-8?B?a3JQRFdIN1VJSHZOTHZtL1lHOU9zWGNhNmgvUFIyd1pRY3M1SldKRXpFVWph?=
 =?utf-8?B?YS8yOUpPbkZ6Nk1UaE9JQ3ZNbHRwb2F2Z01ucTZaV2pFckcwRElVUkxQekxT?=
 =?utf-8?B?WVV6ZEl3ZGZEOWdiOTU3aW13RS8zZkYyY2dZZVdSd2dIRUVsZTUyZ2xSci80?=
 =?utf-8?B?SXB2K2N3QWZYV25zY0tCRGNIZGl1dmwyUVRoMHhDNEJZaVlEZUExcnFIM1ly?=
 =?utf-8?B?ZW1zeE5JL3ViWm5Md2VjOGpzVElqbysyMXhxdkhoWi90Uk1EL0pyOXltOVl2?=
 =?utf-8?B?Nm1nNDRKRDg0L0xWc0ZoQkY2QkpJMFNObVBncGlQVUlTeTRKLzI5Sy94eXB3?=
 =?utf-8?B?U3h3TVoxSHlRVkFTbEd2bGxjMEtVVG9VaVBYRGxPU1Y5dnJ5Vkpvc2JkcDg3?=
 =?utf-8?B?TkFkV0poNngrQ2RuSDZ2dmxVQUlFRVphOUgrRCs0OEk5NnFoSmE3cWhONXFK?=
 =?utf-8?B?TFNWK3RaOTFPdGMwVnV1V1pFcnJkU0xpR0VGbVZsc0NJVG1tVG45azNwcFFC?=
 =?utf-8?B?T2lObnBLazVneE9USm1tTWZFdEVLL1hiRUxYS3JjdzVsZFBFclIwaXNsN1BQ?=
 =?utf-8?B?bStOVFdLNUlJbFRrejNYNjdPSEJibVNNMGcwZ1h4bElSdE0yZFJsbG1CQVVr?=
 =?utf-8?B?aTJsUnRMUE0rakVGSUFuZmNucnA4WkRiY3Z2SDIrb0RvNmRrMEJiTDlpUmpj?=
 =?utf-8?B?V044eFc3aFZzZm4rWDk1MThHR1hnNnBrZW5Md2xXak5JOTcwdk5CR0F0N3dx?=
 =?utf-8?B?OWg1Z0RwRWRoTWlMU29SanVCRjVMMGNsRzQzUXhHK0lIK3ltS29uc29vNmhF?=
 =?utf-8?B?QlI0bzd3MEtaK1V4WGpxQ3pZZ0NWM2YxYUF0TjFQNGxBcmZBVmhpUUlacEpw?=
 =?utf-8?Q?BlLJH1p0RrZMAHps=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9083cafb-00bc-4a5e-6d12-08df4a21d6f1
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 11:55:31.1256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a/A8g28WHaJl5pSpvaHUFVe63H6SVS6fUZJzq7HgfrvRacWtslay8Aj6sRMkmhCJhBZZ2Xy6shfeaKcMvrUnXaJIgSXrnnEVZCU0+XEf4eI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7885
X-purgate-ID: tlsNG-bad1c0/1795521335-BE6DA034-A7089BD3/10/78276251493
X-purgate-type: spam
X-purgate-size: 1098
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 17/11/2026 12:43 pm, Jan Beulich wrote:
> On 17.11.2026 12:55, Andrew Cooper wrote:
>> We have two ways of spelling debug build in Xen.  Reduce this down to just one
>> way.
>>
>> Andrew Cooper (3):
>>   xen/treewide: Convert all #ifndef NDEBUG to CONFIG_DEBUG
>>   xen/treewide: Convert all #ifdef NDEBUG to CONFIG_DEBUG
>>   xen/config: Drop NDEBUG
> While the ASSERT() related distinction was helpful imo, I don't mind the
> folding:
> Acked-by: Jan Beulich <jbeulich@suse.com>
>
> I wonder whether in x86_emulate/ keeping constructs like
>
> #if defined(__XEN__) && defined(CONFIG_DEBUG)
>
> is actually necessary: CONFIG_DEBUG shouldn't be defined in the test or
> fuzzing harnesses.

It turns out to be more complicated than that.

Because neither the test harness nor fuzzer defined NDEBUG, the
non-__XEN__-guarded #ifndef NDEBUG sections did used to get compiled
in.  This is the state.caller checking and x86_emulate_wrapper().

I'll insert CONFIG_DEBUG into those two paths, to keep the checking
as-before, meaning the __XEN__ guards must stay.

~Andrew

