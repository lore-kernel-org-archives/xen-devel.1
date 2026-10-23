Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD250606A31B
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 17:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=Bpd5UoM+
Received: from list by lists.xenproject.org with outflank-mailman.1459561.1671411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKJ4X-00048U-AZ; Fri, 23 Oct 2026 17:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1459561.1671411; Fri, 23 Oct 2026 17:28:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKJ4X-00048N-7b; Fri, 23 Oct 2026 17:28:53 +0000
Received: by outflank-mailman (input) for mailman id 1459561;
 Fri, 23 Oct 2026 17:28:51 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xKJ4V-00048F-EA
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 17:28:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xKJ4U-00FsIl-Rc
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 19:28:50 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6adb9932-bab6-0a2a0a5309dd-0a2a4501ca30-38
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 19:28:50 +0200
Received: from [52.101.56.41]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6adb9950-5984-0a2a45010019-34653829be62-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 19:28:50 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB5816.namprd03.prod.outlook.com (2603:10b6:510:34::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 17:28:44 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 17:28:44 +0000
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
 b=kXtIn3cTEaNNsrsGqDbTHoBq9qFPbasUIeX4/wYASm65plU6W9cJLwW8X3CU0kobA8W1SEsOwiNFjj31JDJaUrIvhDB3Tcgamso9e1OY6QZ23ft/ouTvrw3AzG6kPmM5r2mPOJrrfCI/JJvxRdBlTVYQ3O/Leq4FaWHANi1s+y2IeQvvupOTd8/rfMYZxgv7mbRu6GaP0zLjBHiDHlIv3UB/2VrEGwSi+1RHKFFFWTFVEwVuPCy2AFKnayGmWl9zc1BTizxUOtS68c8X8Q6kPPJwEIkFo6URFcEKSBRHrgXsrm9O3tSVsMhLIUNtJ69y1tv3TW6szhXS/SHYTIAxzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q0Gsq6CFTPoQfjGjNR58x+XGozGO2jJhMt+GsBY2Log=;
 b=Jb1EquT52YfCDkk8Fcz6OvpeGbWgTPO20l6fk/gKE3ykCtxm7xWmcf0UoGHh+1Oy+PEvdkXCDUOtbOYISKXPhf+AQfmy/TVnTo9LxNj+BimTpOK/RNG8BISNuPcIhcFc/OneU+vhOlkSXSfLDpfB0SZmFRvHrAvDsUYi1TIhgNRjLYYSPV+7Fe47wKVhb7V2RuYkn1bCAs/pwp6ZdCWdKJYXfapSTaSNEdFRk/LlDle2MqMfoctGXBdbRHOBD4M60DPFb0cYlBUxBMaRwBP7FxweGnEhWeaqOr6ssqJoxNv5Hgn2OUHBFxUEVD+Sw6trRh+NBRCjrb78kOLxpP/kWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0Gsq6CFTPoQfjGjNR58x+XGozGO2jJhMt+GsBY2Log=;
 b=Bpd5UoM+r4JM5+UDT6iGFW/VR/9tmoM367tLuGGnbBsJzgN4jNfHkbaioIhaUO+eiDl/JVjQdPe3My2oco8uexMzdIJMJlbBoxHr+vp059vm9+Dtf5LDKSwnOMUaxG/bEBpSVGpwhqh+ApA9ZC3h//TjWplohBNAV4wHF7NvJ+g=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e64725ec-9409-4573-98e6-47f8f87e27c3@citrix.com>
Date: Fri, 23 Oct 2026 18:28:41 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] xen/vcpu: ensure no write when runstate handler is
 NULL
To: Roger Pau Monne <roger@xenproject.org>, xen-devel@lists.xenproject.org
References: <20261023161742.67329-1-roger@xenproject.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261023161742.67329-1-roger@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0056.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::23) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB5816:EE_
X-MS-Office365-Filtering-Correlation-Id: f85615e5-41eb-4aa9-046e-08df312b16d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|56012099006|11063799006|261022075727099003|261009223027099003|261021121427099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	C9HRpGo5j1N0D4ZzNgMzlx79b21PH1XxU4NDZnpxIn57kGTlQ3yCCWQ2Uhe4C7Qh5GrjSOwcT3a4ilQF3QT9xNbikP8CpiZc7pCCZUO6cYxuVWwdEBgnqQFKtAiiswBEmxyJiA70Agt2GnVLfcTsZsfdWLkCvre3F1vX30nsBlKztMviz61x055CJGbX5EMf3roDhLQamnpNLGdbb3FHik+5BdIVcMsvCEeWnNhbsZRpGXupykywiX4V1YzJcvCXAQjy9o73nFDzxxb2wUvyH/Z+Eeh/yMMQhIo55bk7+537lBOUA5onz+sEVOR52DLk2xKNb1YVpH2T3az8yKHxl+P6tQgHzeJVWLjq5mqEmVXS0NdMQbSy+ZSgFYSq9MX7N3VeDSaQf9QwWE/YLpyLq22gze15G50AIvEYNxOx1W683v+FSfIlDFAuA82gxLJtSPbf2Q9TzZ0cD/a9soIGignqoYqLumBj4VlUHebhT/rymZrXPaiQ0LU+pdM5ieT1Qqg8OopqPXam9qd6XwAKnd1IlXBacaoqJDkZkmpf7dBrMmR9o+1RwM+VatSgP3W/KGRqrwMPTvWFcT9aw50QDngoXAXnhmZfKextqkIgIvO+iCYt3BM1x9X69mcMBfZwHpmrsr+z6XhIdrNMjl+QBUWCMC5Af3OMyTxWtD+xl+M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(56012099006)(11063799006)(261022075727099003)(261009223027099003)(261021121427099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0g1YWEyZWZPcXdJTE9mYmxJZGw5NVdQSkVOdG5MVUFiY1RMdnNnUkp5WnFl?=
 =?utf-8?B?cE1lTGFTTmtIN0xGamN4eXVuSzJsbURBMWs3Nkp5T0JvU0NxRTVjVk9GOGJU?=
 =?utf-8?B?Ty8wTndDZGxPYnM2UGNydzdmL0k0dHlnejNOcTV0VG50bGltdHNSNXRtWGVh?=
 =?utf-8?B?Y3dlcDNPMDNZWjZEVkNzendlK0U3TExZcDc3R1ppUjlidmZ6UnhjU3VZSmRr?=
 =?utf-8?B?RiszN0Q1Ty80S3U4bThHdEZEMFNsejFBOXNkcnJ4bDUzU2VkcUNkaTdYNVp2?=
 =?utf-8?B?UmdjTFVxSmhvVm9uMHhZdVdBeWJjR1BlTER2M21vdTBVTjg3SCtGQlAwZ1Za?=
 =?utf-8?B?ZkNlYVdKKzhqZDFONzFibExEVlAyTTBZekhrWEI4N1RkL3dqcy9TN1V4Yjl1?=
 =?utf-8?B?WnpwSmZIYzlkdW5WZUFjY2dJNW02M0tBZ2dLYXlveHczK3prZDZkUVZmT0RO?=
 =?utf-8?B?Ulg4cFY1cFBadFB6c0R3aEExZTNqM29naTVuVDVRNzVhaUtuUllWaW01UUo4?=
 =?utf-8?B?QjdWZHBhTUxtQ2hXSS9zOGROWnhkSmhBeFRDY2ZoWUhJWE9pS3ZEWUpUd0ow?=
 =?utf-8?B?SFBiNUlMeC9ldG1NNkJ1aEMwUFFRSGVtTjE4b3JyYm5PVUYvak5rSEM4N1Vu?=
 =?utf-8?B?bE8yTlVDcWo2UXJKWWFFRDdSVzAxRmdCYzUvNUZBU3dEMDdmRDc2Z002Ukdp?=
 =?utf-8?B?aTNhQ1hYRUZtMjNPbVJQcmRmYnRlUURYUUVnRU9yMWRuYURFNTJoRFpFVjJv?=
 =?utf-8?B?dmxuZkhBNGZWWDhnZlFKSmFjaFZYNk9DanRQemcwbjBjTkFpeTZpQXYrcDNX?=
 =?utf-8?B?UDFNWE10bHlVU2ZHZEZmZnZmQW9HTUlSeHBmTTNwSk85bHZlankwT3gzalE3?=
 =?utf-8?B?ZlJxcGZiYWJPM0Y2bk0rV2dtczloa0k3TXBRS0NBUHp3bTRCRjNqV3BwTzdX?=
 =?utf-8?B?WmdwWjBOdzRDaWcxN25tc1gxMWEyZk5hVHA2b3p4a1Q0RjBiaXZjN1o2Mzht?=
 =?utf-8?B?WGV6akZoTXpCL2NJNk4wbEtwM2VPa1N1eU5GK3BJRHpEeTAvLzJkVFRYVHQx?=
 =?utf-8?B?VHd3S2lKOEVRU3BXMTRNcnViZ2Jwejd5cTdob1NjVThMQnlpMnZhU3Qza2w4?=
 =?utf-8?B?SC83QXVkWHk5dUR0bVU5RjBpUjVEYk5SN2Jnajl1aHpZS3hNdXhkMGZScnN4?=
 =?utf-8?B?c1lKNzZMazlTd2lETS9mZzZHYTg1UThiNFhveDFMdmlEWk9iaTlOYTd3eWFS?=
 =?utf-8?B?cml6b0o5RWJ3eW9OWjRvUkQwNTZYcDRIZUxMNllDY25WMm82aUR0SEovVS9O?=
 =?utf-8?B?UVpQNDgxSE9GbEhabFRQbW91dGx2SGRJWEV2MkJleGpQdVhJNHhHb3ZPK3dP?=
 =?utf-8?B?RDRFUHZSdWM2b1hRcjRtelRySGlXUm9QNDJsM0QrV3didzJPSWQ4VEdaenJX?=
 =?utf-8?B?Q3lRbElkYmNaelUyWjZ2UlozeHBXVWYrZHlwMFR0cTRJaU95V2JTRGc0RTRH?=
 =?utf-8?B?Vnc3TVVabEw3V0lmRWZBVzhVWWJONEx1b0w1bUFnUEdjcVFOanZxUXZPSzVu?=
 =?utf-8?B?SnRWdm5VdGRiN3d1N3dVUGN2aVJocmgwN3NGQVpDb2V2TjJ0K3pHd2NYeDFr?=
 =?utf-8?B?dmd3MWNKMDdHYWJHLzg1Z3VDWkVnMVF4VEwxM1ZOVXdaNWVHYkNpRjI2b0s2?=
 =?utf-8?B?K0ozd3U0VUU0WU9JK0Vpckk4VjljSEkzdzAyS0Z0Kzc1bmlEN3U3aEZLQW1J?=
 =?utf-8?B?Um9COHdkVlhkWEJHekhNWDZwd0tyT2w0N1VxekFIWnlES21zL0RjVEVEWVRy?=
 =?utf-8?B?UkhucHJaN0JnUWtqNmt3RVhNZXNnM0lobWJiYmJndmZCMmZGZFFHVVJhQXpQ?=
 =?utf-8?B?amwxaTdQS1FFZkZ5bzIrTHhrdS91WXlrUWh4MEU3MkZJU05EZktCNFZHQWFo?=
 =?utf-8?B?M2V5cUc5QUozZzVjR0pFaUpWZGRjcEhuU0o5RXhVWUVZUVphSjdOYUJvbi82?=
 =?utf-8?B?YlNVYmhlNEJXRUtjUGRDVGRxbzZlT3IwY3A1eCtaWkZGbVNNL1lSZitaczJh?=
 =?utf-8?B?VFBwRTFVMWZBd0NDZlJMLzFxN2tNUTVwV00wQjdtNkdUTEFKT3NwSXRhNW5x?=
 =?utf-8?B?RCtQYWpDb01pVlpOMFNsSzR6ZXEzTlZueVU2MlcxR0xPcnJOa0EwMTNYemxG?=
 =?utf-8?B?dUdHVithZW93aDhVa09zR2orTVhoMEVBcVF0VkJsZmtNd3pHZmxZVVVDOGJP?=
 =?utf-8?B?Ykk0aVliRy9jTlRwNGtQMDdQOVpvSUZ3QjBycy9ndlFDVmxMOHBCQXFUaE1S?=
 =?utf-8?B?U3pWaXBCVk53TnRPY0Z6dE1FTzJIbGVhbC9PL1FsWXg1a2xhNGZ3R1VoYStP?=
 =?utf-8?Q?QDj+cvg3csjLo6Pw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f85615e5-41eb-4aa9-046e-08df312b16d7
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 17:28:44.7104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDrQcHGGx2t8RuAHz2WcxkzbCOeA2Zbixb3Iof8nfERjdd1KWx895oAvc2KObQRYOLGBSdp5dN+stuqxRM03/Of4PGUGh+YGT4ii0zWJYYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5816
X-purgate-ID: tlsNG-d62444/1792776530-1F46D757-9F79033B/0/0
X-purgate-type: clean
X-purgate-size: 1100
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23/10/2026 5:17 pm, Roger Pau Monne wrote:
> The VCPUOP_register_runstate_memory_area hypercall tries to update the
> newly registered area, even when NULL is being registered.  If the guest
> happens to have memory mapped at 0 in the address space, this write will
> succeed.
>
> Ever since it's introduction in Xen 3.0, NULL is the initial state of the
> pointer, and guards the update of the runstate area in context_switch().
> NULL has also been accepted as an input to the hypercall.
>
> It is unclear whether de-registration of the area was considered at the
> time, but the behaviour of the hypercall has always supported.

"supported this."

Sorry, I had a typo.

> De-registering using NULL is a common pattern for other hypercalls, so
> formally make this the case for VCPUOP_register_runstate_memory_area by
> skipping the update if the area has been de-registered.
>
> Fixes: 705ea2b54c35 ("New VCPUOP_register_runstate_memory_area hypercall.")
> Signed-off-by: Roger Pau Monné <roger@xenproject.org>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

