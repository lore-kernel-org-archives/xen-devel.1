Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641A1606A335
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 23:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=XLWAPI6b
Received: from list by lists.xenproject.org with outflank-mailman.1477526.1682957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPTDK-0007LZ-GL; Fri, 06 Nov 2026 23:19:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1477526.1682957; Fri, 06 Nov 2026 23:19:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPTDK-0007LS-Dm; Fri, 06 Nov 2026 23:19:18 +0000
Received: by outflank-mailman (input) for mailman id 1477526;
 Fri, 06 Nov 2026 23:19:16 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xPTDI-0007LA-NP
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 23:19:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPTDH-001IYP-3h
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2026 00:19:15 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aee6073-bab6-0a2a0a5309dd-0a2a4507892c-0
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 00:19:15 +0100
Received: from [40.107.208.3]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aee6071-b4ea-0a2a45070019-286bd0037883-3
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 00:19:14 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH6PR03MB509186.namprd03.prod.outlook.com (2603:10b6:510:3dd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 23:19:11 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 23:19:11 +0000
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
 b=yZjWxdAWtZXXtAtQqBNnaJk2RydBTEkqp79saJRkUnOKs1SqrvBwGIfaV1cRs8CPSgPd7MYdSi4jnbEZkzTfig556m2UDqphWeN3joahygvFVw0Q8IExbe0E4N71mQqB5w4BPKj8XPxKkVXKpZLRBichi6RuIxYc18oNycMmm0TbarUEPBYuIjO7THoyeBYr/iJBfrjZbgu/v0jdbk+ZfLNJ62EJyEhsogDH/u9+bBSA+TdzDX59qJeLhpZvBewDqgs893wWt+ZQzDP1rCfJauO5Opcs4Qg+0PdjhoRgbWO3is8+k9QeCSXQCGqU65kGIxSsRyy1rSDwHQJQEsG2ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7mTPPzeU9yiw9JhK+uJAQwbhOTiowYidz1i7BzJgZc=;
 b=nAXwSCOKecFI2KiZ/YNRViAFNUk5bRcChBN9l8IMuUKvMh+d8noODfqv06cq0mb3slo//Xq5hfar3dIF2pXDYZpQlOlq0/whRBGcQxVT/CDLxFPICz3Mxf2cYEB/0h1poz/lAji7xHxaJLIATBVHGeUCpTJ/DFobi24/oARYMQS47oxNPOjMw7hBFW+y+Cidcew0O6Qq9X16nmTXdSDexk/umRTMwejNtgQcFh1caDOHV+l2uguxjV5HkDUrOUySylB/+oOx18N0z9C4+dJYcPQluZS7SOZerGcHb45umwEwUtq0LqtLJy/emp+h9GqX2GYWmVbNvxGqVM2/Du18TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7mTPPzeU9yiw9JhK+uJAQwbhOTiowYidz1i7BzJgZc=;
 b=XLWAPI6boA45U7iy/D86PzyiYRCwYPDBH7tY3ZXVUB2NZfQGDwLAG7hA48/sPmoSK+1/MZcH0LUH4fQceFKZGuFS+LukynFDinWizHdw9ZlQ9J8MThJPmBIweLa4EAkgjPkiR6Vu2H1cKfK/vGeZNNekoqA9n8gtEX+mrCdx4Fg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0037995b-dea1-42d6-85ac-cfa7719762a3@citrix.com>
Date: Fri, 6 Nov 2026 23:19:07 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Andrii Sultanov <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH] tools/ocaml: Fix cleaning bindings test
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20261106231732.482518-1-jason.andryuk@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261106231732.482518-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0181.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH6PR03MB509186:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e192ea0-d0f5-495d-cc8c-08df3c5c5d37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|6133799003|10067099003|11063799006|261102123227099003|261028144727099003|261026140227099003|261021121427099003|261021123027099003|56012099006|261022075727099003|261009223027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	bRiG+glrqiEqrE8s4Xm5gkc0BP/415GKMeyKTVuy/tZzfLrLY07LSKG2pAN3KKrGakO9Nes/TO1B+lzdbH+2GygU7cLDFCY7lWio6cfRHO9vcMXujeXTXR0wAKFwYGijF2lYQ6xKIgyOAnCiKuOjDhyyjF1Af4N6bdxSsjyPy9niOIsLlj64y+UKujgDc3gRwa4gO+RL4iWfn+Q1P8gkE0oU3ZpybHla3TUIrU0fkk8Q/B8RgkhpoR6tq24bSa3VWn73ppUbk/DesPUznQ8OlaQKwWYPe68o3qieKU5JsXv9gOvZ3ZACCLbT2czk3kf/m7BFcxuxKuSV6sXKixpeh9CYcbhcJiJeFn71/mdogeK2U6V4nQr9t+OKccb7ulHJQ5yJf1DN16/yZmef21KwOUyEHI4Ooe0GhOpg5Ots2viq36Jms4oWZWZZLho8uGwG3JLuStBdaak6b8xb445ZHBU2+cyhw0nSy+x9JpRdf4JSvVBNNan12ZyLDokgCL7woLpXLX2MK+wkWRoSds6Qlx4kgL6eHP2Noxws1zI9xZTD2tk7ExBIqQY6H8G2tZF0e6xVJJqqQTTJSWyVsjajbofMhg8aXK7c7tFW7piESA6VIPJR53+kfvZJYYAVxq/E96ls/wlqNaL2tloTTNgQIo0Lg8VYV+X7v5qfhc19t8M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(6133799003)(10067099003)(11063799006)(261102123227099003)(261028144727099003)(261026140227099003)(261021121427099003)(261021123027099003)(56012099006)(261022075727099003)(261009223027099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVlaK25kRDdnMXlNZEVyRFhyNW1NSG1qREpuYlJtZk9LNis4cFV4QktHb0xM?=
 =?utf-8?B?RWwvYllDSFpRN1NMSzBxcUJhNTlmaEpOWGU1Wk9EMnhiM0NBblk4MWgrVEVa?=
 =?utf-8?B?cjV3NGsrVjN2aFJpSXlNOFVveDZzeitHOVorMGZnS25JdnVEcUN5VHJOaFl4?=
 =?utf-8?B?dzZmNERTZGROTlJ0cFFKYVkrVXJoVTBUZkZaLzdtSWhBQXRnT014SG1KZ3VH?=
 =?utf-8?B?UXVxOEZaNVRLKzBwNHZjVHc1RC9ldm9EZGErS3RJVVRCN2dIaHA1RGFKZ2px?=
 =?utf-8?B?MlMvRGNQVmtaeWlwR0FBNUJvU2YwOXNGS0U0WFJvMDRKTG5ZNzJZU3RmRy9V?=
 =?utf-8?B?OVdQNENvMlBhOVE5VjZLUHBFN3RZS2V4N2NwN0o3WmRHL2YwWHNXZy96am0x?=
 =?utf-8?B?M0tPaDBzaEVvcFJFNHFLYTRoRHZHRWlJeG5HNEZpeVBaa2MzK2w2NDcxa0NU?=
 =?utf-8?B?bE11ZDNORk9tRmJpNDNNaXpjcnhoWlR2b3gxaGFsQ1Z6ODF5dCtjaHpJNTJM?=
 =?utf-8?B?Q1dYTElkcDRvNVJJeWYyZGJ6b3NsYTlqcFRDcmdEMUgybjZKKzRJQnZrbFFz?=
 =?utf-8?B?Ullxc2xpbTJHaTd4SkpCc1ozRlhUdEFSZEZqcDZGNWxFRzMwejJFK0owdFpn?=
 =?utf-8?B?eGtKNnhlc09sazE1RDdmcG9kUElKZHkvY3N5SGw5YXo4L3RybjdSNDU0c0pa?=
 =?utf-8?B?UzBRTmpXYS9hZXVNcllzZ0tQbi8yNHc2Sk83K1NHY2FmL0h6U3RnMHN2RTZV?=
 =?utf-8?B?a2VBdWtzUFhYSDBNVThDMUhOYmpDYStxczM0Q2w0TkhtblJleFVNbnFzSmxQ?=
 =?utf-8?B?dGRXTUU1bjNFV2xmWFh3WW5xa1VyT2RzRmJGTU1pdWwrOTJmZlFjbG5RYUtG?=
 =?utf-8?B?UnE4RnhuOGdIK2FLMFNqYnFRa2hUeVk2TEhXRURWWFlmb3c4a21uK3RZL1lH?=
 =?utf-8?B?a2twTlZaUDJ6L3ZtUlE3SWxnbWd1SDJRVDFSM0EvdzkraWN4MnZNWUo5YWZt?=
 =?utf-8?B?NlQ3TU5BUlVRanhDdFNIZGpHa2JIWGlOcHUvSmZhTnlJYUpuTUdpSU9aekk0?=
 =?utf-8?B?ZlQyemZJSHplcjc1L3p1NkRrLzRMUXg0OFZVQVZxWVJXSmVJdC9GOEl6Z01Y?=
 =?utf-8?B?NENpVzIvWXMxWG5DQ0hick9KYWZEOHhoTmg3Q3BuUis4eE5uNk1sTE9JbDJl?=
 =?utf-8?B?TEE3MmFMZGhHbVVVU29XaENMNVprY3pmUS9ZMUNyUUE1blgxTE9ydmtTb1Ix?=
 =?utf-8?B?VkxtTmlmZ3BLN2JOYXo3YjJ1aGhiZXMvSy9RUUlKOS9laDd3UkVPemllVmpC?=
 =?utf-8?B?VGVyZzZBM2VrZlNucWkrUTNNL1ViUDlyK3BxLy8zWlhBQTZSREZwT0dpVzla?=
 =?utf-8?B?NFpycGZkM0Nxc3Q5OXFEblkrbzhrSnlCSCtRK0lkK3R1b0lwbytteWNWWFhk?=
 =?utf-8?B?d0o4RGRWWjlXUTVGTlYxcDNLcDBURXpLc3JCTVFQOFNsZlVmSGc4UTI1TlpM?=
 =?utf-8?B?VUVvRkZaaG40MkJWZElMTUZSUjN3dUlLM0NzK1JwMDdYV01XNE1INkFKY2RV?=
 =?utf-8?B?c0Fadnh2dG1mVlk3amZIbk03MDV3VWg0cVgrbU1wU3c2TUIwTnNUd2p6QitK?=
 =?utf-8?B?T2FLajFvZzhSSy9yV1dqL1B2VFplUXQ3Q3hoWForaXc5Qld0RTFPeFRqWUdz?=
 =?utf-8?B?US9PSXlPQmxkSEpTMitKT21EM0JHOFZlanZCVWhtOE1oaTdNYU52cks0NEZw?=
 =?utf-8?B?RTRqd0RmeW5mdXNNWUtlY21RN3JoTFJpOHVORTVxdFF5bjB6MVRUUDNJdWlR?=
 =?utf-8?B?RTB5eUV6VXFXbThTV05UWFU1aTR3ejlQZ1JtemViSkxEdlZIQVFUdUNjRllQ?=
 =?utf-8?B?Uy81aXN1b1d6dC9zaVJIQWlpZEg0MmVCV1JjSnhZblYxckY0MDFoYndQR2xz?=
 =?utf-8?B?eFhtRHVoQldvVExOdUFzc0Q4VkZTTzBnRGxFME41NU1TNTA2bmNDV3R0M3lG?=
 =?utf-8?B?VlY4VHAycjY5Vk5wMUNUcEkreFM2VUIweDd6aitCL0J4dGpCNkp4TDE3RXdx?=
 =?utf-8?B?eklUZ1dkK0J1aGd5akpJQ2xUbmJ6ZVBkb0xyejh0WFFYcHR1dnExRHptT1V4?=
 =?utf-8?B?a2FYYWhJdkNQVEJ2eXVmWHlKS3E1MXg5WlNsSnpuRjZ1YnlFOVIrcFVqTlha?=
 =?utf-8?B?TmRScmRCSVZkcHdLRG5zc09TYmxWWEZoc2dpeHQ1TG44K2dsTjBERTM1Nytq?=
 =?utf-8?B?MmNqVC8xY2dpaTBtSjJVWnIranBkdndtemhxZWN6blZYRXVndWIrWFZsV28x?=
 =?utf-8?B?cE9JejNlT3AzSVNtZDd0VGxScU5SV0NtWU1hcHIzdzRyVGlvT05DQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e192ea0-d0f5-495d-cc8c-08df3c5c5d37
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 23:19:10.9194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ee6wdd+vrvCqv//KfvZD1LcnkE6E552ppK2vSdWcO7O+Vo/EOIEZVP6s990IzarOBn5MY04G4YDHMJC3KiXOHTgzHuvkkG8RwyIK14qsMfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH6PR03MB509186
X-purgate-ID: tlsNG-ef75cf/1794007155-A4ECEAE4-C71348B0/0/0
X-purgate-type: clean
X-purgate-size: 742
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 06/11/2026 11:17 pm, Jason Andryuk wrote:
> make clean fails in the bindings tests:
>
> make[7]: Entering directory '/home/amd/xen/tools/ocaml/tests/bindings'
> rm -f .*.d *.o *.so *.a *.cmo *.cmi *.cma *.cmx *.cmxa *.cmxs *.annot *.spot *.spit unix.cmxa -ccopt -L -ccopt ....
> rm: invalid option -- 'c'
> Try 'rm --help' for more information.
>
> Split the compiler flags out of the LIBS variable, since LIBS is passed
> to rm.  The individual *.cxma files are deleted in their respective
> directories.
>
> Fixes: d97847e858f1 ("tools/ocaml: Gitlab CI test for bindings")
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Lovely...  Sorry for breaking this.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

