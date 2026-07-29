Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DE3C54F51
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 14:01:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375971.1622964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp4pq-0002dr-7z; Wed, 29 Jul 2026 14:00:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375971.1622964; Wed, 29 Jul 2026 14:00:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp4pq-0002dk-4d; Wed, 29 Jul 2026 14:00:38 +0000
Received: by outflank-mailman (input) for mailman id 1375971;
 Wed, 29 Jul 2026 14:00:37 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wp4pp-0002de-F7
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 14:00:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp4po-00AYav-Rg
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 16:00:36 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a6a0779-bab6-0a2a0a5309dd-0a2a4503be22-40
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 16:00:36 +0200
Received: from [40.107.209.59]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a6a0783-fae8-0a2a45030019-286bd13b6690-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 16:00:36 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SAWPR03MB989572.namprd03.prod.outlook.com (2603:10b6:806:55a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 14:00:33 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0245.012; Wed, 29 Jul 2026
 14:00:32 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BeSnPXA7dhuTv33afgtiH/ivPLv40Zrz6z5+TUcYFcNG6kx15ACMDZio9azBWkvWK3Qm0l5PhuYvmtvPA4RwvcSudZ6W3rS05BIivBgqXNggAxkUh5FpHUFE7EIBkZDo/guj13zXkI+/CypfqJG31UTIL2XzCPGEsJF+rjAUeKyq06SSMB/o2r3e0MvOYG2tA/BKDSkFGlF6O6fRZrQLyUmzl5Kz5lgk2mgwMl2JSMP7ThzemLgslVGSZ1IsbeQLbV4tRh4Q2zSJ60vVvDMYfnImovZTDIY30ByKnb8hXw8U5DaaI5XW75UZ7qlxtj6gTucK5PrQQNwSKmqhp8sQJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ave1qZswxRkOqiXb8vxI8HtgqORTJHvHmqmx4Jv+D4w=;
 b=UqfXJKShaf4AODRjCj8cSRAG3ynVOCUpltAAE6qS0io8irdLCviEsA14BoM202Fp5sBT39sNJ5TmllD5XsnKNdWuxwC5dpIj1h69wZ+/Y3wzDz4QlAVSyeisudmxULUERz2/klKkZ2i0m2uA624YjMrPXNNcYVSYWIrKjIC5fhxNwVAR6Uj1sjjpMSGXRGaYPdSRT3nMtpfibTKRfkuMmc3FIuqT56ZMruMnF78pqfJLEnxl/HXOQS6UlIFXa8HsjbewExk6o8/q5XIbski70QVABxjvz6+W+Za94ZJnWfZctC/nTSnRS2evVhFz4tjrIupqsU2GqhOQ40GAf+GdLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ave1qZswxRkOqiXb8vxI8HtgqORTJHvHmqmx4Jv+D4w=;
 b=PfCIx+hlWjzq5mTDige+zc8kYR6m4Hz400hMfHlk/GDiP8PUwCAh67pyT4ZeKW1trklCyZ4RX67bz+CAcuMzTram5fM18KdmrI4+Fpbe//swGSHXIl7w0e84ccBL6M+sx6p/tbeeC8R7yZL47UzC02Ack4MTusfwfJR2pKXd1eE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b75026d3-c129-4aee-baf4-17203ab46e26@citrix.com>
Date: Wed, 29 Jul 2026 15:00:29 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v3 for-4.22] x86/cpu-policy: set up host policy earlier
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <da502f31-17fa-4b2d-90e3-1f6988717454@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <da502f31-17fa-4b2d-90e3-1f6988717454@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0096.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SAWPR03MB989572:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b50b869-05fe-4407-98f9-08deed79c18d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Ml8EgQGXLte4vJPblEdjzFtWdr8Oawc4Mc0Hz2Kp0jMpmGTFQJ/VwqsZ3tR5Hr83CGfROsP2OT2rpKhg+Bx4nfeISzWJmFBqSpaWAMg93cDF0sh8rmb80t7SRGseYCUtAe28QDrbM027c7Sx1l0Krh+LHjoINHEGtEJuDr29ltTmJRfJZ5yklZs62EyhUtq5hWlA1TUPzoXK9UPfufXwbGu9f7kXtcEKrkvKMKNBTXB6QJzJYcUHwlvGPXyTJjFmania7iGmfqMJYvXKayDGbXOAJbZ875nLQ8ijiOuzxrms+tw/uZtDX5PelvQPCvJR+omvIDiINmctuG6hZtnU48trHM0LKt4PK1ujDeJllu1UKJ5NqXginPiDQiMBAo9X+QnxKKq3z/TJpScl3FK+Y1bdk5F2eRGLTcTzy2tKsTjyS6t6dsO+1VPYkUVgmnLgHPxsT+XgRH7rmPXDePUTJ+zas71TnItfEkbl6Xa0nqaV1Ug77Dkc0bgW1fZBpSQ4nApNw/DxrsMT68y6/9gRV7K1EdPZ17cJNC6SXzLr4VRS9eblWTsAX2keFi9fCBBw3NhDq16sgO44S3ltmxaXm7o5TDg04FFi8XUFmMHjbq51ECgxnjfACnJ6Maaqq6GhPlIkMnCL5cV++iCeMBQppluSxY684zdh4SQXpp1XtmE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Um9pYmFrNXRjSnQ1UDdJbUxoZDdISlo4RmpZZjc0M04vRFFIUFNwdGorTVhQ?=
 =?utf-8?B?ZFNRVkpnRzRnMUhRQ0UwdFQxQ05SZDJjQnMyOFBIRllWOUZiN201TG90czFm?=
 =?utf-8?B?ZWlRVmV2VE1yOUdaRHhHUTl1WkkxTHpCa1ZWV0srM3NSbkRoSWQ1TnQyNHRm?=
 =?utf-8?B?RnFVdjNEcmpTbzVnWDhuOXR3VGJMa28wWmZ1eVFRMVg5cUJSMjdaSy9jOXF0?=
 =?utf-8?B?Vyt0NWIzUzMrYTVUUi81aDJUNXhJUDUrSHV4UWxMaHhGbzJkbENOTFVYVUs4?=
 =?utf-8?B?am5qV2ptUlVRb1NBdzZDR3Q1c1hCNy9qV256b2FidHpiK0dTOExZbXA5a1lX?=
 =?utf-8?B?d2Vob2puaEM2cjA1SzBhbTZVWkFhN1VaSjRDSm1KakJCZDdTYnRuY2dicWp4?=
 =?utf-8?B?MHdtdnh5ZHd5TWlPYnFGcjhPT25kazVEWTBmaHRxS1gwd09NN3ZHb3JFclNC?=
 =?utf-8?B?R1NrbnBjRVRoL21XV1RZTkowNVlnK2tjV3dra2RHUm14cUMrdi9YaU5EY3Rp?=
 =?utf-8?B?VG1UVktCcXNGY2NRRGMxaDN4SWRIUkZLMTBnTG5ZOXBHM0FRNEpWNTZIbFM5?=
 =?utf-8?B?cS82VzQzVXpmOGU3WDByZWZoY2tPUEsxbzdBWFpWSjlrOWRaWFJka3NlOUZt?=
 =?utf-8?B?RHdIWDMyTjV0dEtDOUpwUXRDS1BUM09pM2l6KzR2TGRqL0V3QWpNcjlqTVVO?=
 =?utf-8?B?dXQ3WHJBaStObDE1VFBLNWJwYVB3TnptQThFMWFOU2huL0hzM2dETjFmL05q?=
 =?utf-8?B?eUFPNUJrYTBCVFlYSlRZaXQ1L3VKV2JCOG1pRS9iQnNXQ29lNVJYejF2bllZ?=
 =?utf-8?B?WUlHL3pDWldRckYvZ3QwbkI2N1ZzeWgxSEthcTN4WTJyVkZKZkY2TlR0bW43?=
 =?utf-8?B?Z3dpWHRUVzViZTliaERjK0ZCNktoQTV1N01maVY4NmpJL2xGaVhLNCt3RXpz?=
 =?utf-8?B?bGJZZUpuUmJ1eCt1bjNNTzlPN2NLMWp5MHdnNmpkdnoxSXFzTzlTVWdGNGxk?=
 =?utf-8?B?NHFYTXE5T2JvUjg3L0xsQzhqZFVGVGRtVEVNd1BiVnFPcE0xeTlnTWtlbUhI?=
 =?utf-8?B?NGMxa3owekpjYnJwYjFObktKQnV3dUtRL1FOTTlHZ0xKWDNLZzF3OXVmb3Vr?=
 =?utf-8?B?d2laQ0t6NVRXcUJRZTdCcGpHUGEzc1llRXdnMXJCd0tNbHd4cDJteGk2NERj?=
 =?utf-8?B?Ujd5WUdSeHRvQ1hiSHJIK3RnMVNpTEE4SU1BRjRaQXJoZzlnSHZvK0VXRGcw?=
 =?utf-8?B?UmpHdnR6S0xEbnQvTHJmYW1hT1FzTlhhdWk5Unc0ek9IVHFBVEtEeHFiSXJS?=
 =?utf-8?B?Q3F5dk13djNzNXdoR0t1T1YyYWZ5dUo5MjJKKzlMVENRbGJYSW1jVkhua1pI?=
 =?utf-8?B?OFZPTEJTREtraGJBOUgrWUszUHZFaThDWEFQalhUY3ZZWXpEZHNROEp2WEZI?=
 =?utf-8?B?R0wzRm5hSmVGVDlTd0xSM1FYK0lUWVdvc0hjcERRazZORFgyemJSUHlrdU91?=
 =?utf-8?B?L1o3eWg5eloxa3lybkVJSGZoaWkrUTFLZC9wUjJTRHRjWi93MUtxcDV0ZE5W?=
 =?utf-8?B?cjM2NFZvZUFrdllEOHZFdkhwYjFIckdTVmdUeU85R0lBNmwvb0xOSjdXK0tW?=
 =?utf-8?B?VWZuc3ZLOTR6bTBYOXcraUxKRi9ZclEySGVzeGgrVnV2K2s2V2VzK1VzQk5R?=
 =?utf-8?B?OTk4b0Q1Ymp6TkxyZmRENXJmQUx2VUdKN1FLdUYyUVJzRXV1ZzJsUHJaeGV1?=
 =?utf-8?B?c2gwMC9PSm5OOHk5SHlZWFFZeTdlZG1aZ0xHc2JhbUJwc2JhcU9LV3QzeUpS?=
 =?utf-8?B?RnBtRzFaT3ltSG9qMmtpZVNOdS9aM3oyWGlmUFJHVWNFM1c4VmZja1o3QnIv?=
 =?utf-8?B?dUpVS0tUemhqdEh4b2hKeGFubnpPbWVaU1NvakRzcnlTQWQ3blNrUTRiWTRp?=
 =?utf-8?B?WU4yeDZpL3NaM1NKREdVYUNNdytBRktCbzNnK2ZzLzgwUnNVaFlxUGJDM2cw?=
 =?utf-8?B?VUppMWFQN3V5dk5uYWQ3YkVkVjJ5SkVudmlWcExWSEl5NnlOU2Q2RXJsYWYz?=
 =?utf-8?B?b1RnYnRSdFBWajd0V0s4aE8wdElIU0R4dXpPMUNVTTlFYzBoVURLZHptQzFV?=
 =?utf-8?B?RE1wa1JJZUtmdloxZDhKZ3I2N25JRWlRQ2FSSHI3TDVEMWxsUytvT3lwUmQ5?=
 =?utf-8?B?enZ2WE5JVCt5SC9GZ2FPS29kd2hUck42RTRKRlZPYUlTaDAyRlkyc2JqU2hr?=
 =?utf-8?B?ZHpnc04wNjRtRjdLV0xQS3RpdzRIVFgveXE1OXRLaWNaNHpZNGE2dFBLV1Jm?=
 =?utf-8?B?YnFSK3UzbjZFaC9LQnp6YkRJeHoxckRhZ1ZlRW9MZ0JsUXVsbk0rbkhpMkdl?=
 =?utf-8?Q?llhWb1FQ3tOEBMbI=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b50b869-05fe-4407-98f9-08deed79c18d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 14:00:32.9013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iz523lvY/EBJp2g3W3ztgYczoBC2rJtnZ1AcDFQvpkdzj9sCqK80/C7tkMmFGnB2T2xnTBXYwKQiGZOzRzRzwfRnglUgLpcJ6ZKKbhMiJDo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR03MB989572
X-purgate-ID: tlsNG-33051d/1785333636-778C54E9-38AD36D5/10/73395122804
X-purgate-type: spam
X-purgate-size: 863

On 08/07/2026 3:55 pm, Jan Beulich wrote:
> In order to use cpu_has_* expanding to host_cpu_policy.*, the host policy
> needs setting up alongside boot_cpu_data.x86_capability[]. Arrange for
> that towards the end of identify_cpu(). Then make sure .x86_capability[]
> and host policy remain in sync when setup_{force,clear}_cpu_cap() are
> used.
>
> Rename the function now it's no longer static.
>
> Fixes: 894bd7617924 ("x86/Intel: use host CPU policy for ARAT checking")
> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

I really really dislike this patch, but I can't come up with a better
solution in the 0 time we have until the 4.22 release.

