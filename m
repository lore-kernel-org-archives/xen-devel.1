Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C919606A327
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 16:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=I6uiKjsF
Received: from list by lists.xenproject.org with outflank-mailman.1502575.1698603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWFc8-0005MS-Cl; Wed, 25 Nov 2026 16:12:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502575.1698603; Wed, 25 Nov 2026 16:12:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWFc8-0005ML-9R; Wed, 25 Nov 2026 16:12:56 +0000
Received: by outflank-mailman (input) for mailman id 1502575;
 Wed, 25 Nov 2026 16:12:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWFc6-0005MB-Tn
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 16:12:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWFc6-00CI41-A4
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 17:12:54 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b0708ed-bab6-0a2a0a5309dd-0a2a4501b7e0-40
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 17:12:54 +0100
Received: from [52.101.52.69]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b070905-5bcc-0a2a45010019-346534453edd-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 17:12:54 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS0PR03MB989236.namprd03.prod.outlook.com (2603:10b6:8:397::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Wed, 25 Nov
 2026 16:12:51 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0662.001; Wed, 25 Nov 2026
 16:12:51 +0000
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
 b=vWKAr9483CW1ijYc+N/P8jmQWjKLhljxCw7CkWD4dC+sSiE809E5CyPd3LZ28YTu8lROsVmyNiValx0nNxJlILeTC8ZNjASgAuW5pf7eR07QhcOpB6Of6CZK7UAgC6ATAS4HcR6yPaFsIsj99vfbtbNnlMM/3+jnxzog1+GsOAXx4t/NGJcOrURMj36pXrP1c6T2QcYc386T1PCC1wUJ42asBqvLoEKpyEzHtn+55CvCD8xtWwn0Ug3h9mBlr0AQmOIyIomG8W44MOdaDX4hAAkCsyc9HHwblmRw23Fp93O4/JaRu9AMV44xuxPu5dpFRXoJnQgoOiNeC2Ul3hjD7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3a8o7mGjnIsXvMVyHXRdMjH4m9aUSWA53vCK6Y270kU=;
 b=hcFZHC8i0vUnQF9ws87vKKbbVCadFuEKzLxA1QdlqjzvpetymIOh7fA+tXl1WWzuC8WymXCmDMDDhrYjCud+45RAxth+oNIwxy0OCdmYeZnlCoIo0e+/fJdeAGrzBwJcfCdFMrzD9FrS6h1iru4JID18KTb+opsgVIcgfRiXheemFaieJvgUu9XuXwrt7RiibLu9R3RC+Tc2l72zvPXb8rnNho3yRCZo0LjN8wv6HV/FAEklNu+mXXu5YpuOamvS5OnqrLeIqUc1o+dyRx2k1T4ih+KkS2FfsfIkKbx7Db2Zfe5B7HrgHVGLLTfrwbmwI3ga8JPMkKJo540KMQbLWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3a8o7mGjnIsXvMVyHXRdMjH4m9aUSWA53vCK6Y270kU=;
 b=I6uiKjsF9NyCyA0GYgzxy5iVCg2G0VvqKe0G3GL9xRh7CQW5dt6cByCVVEbYq+7+VD+iyQYm5PWzgOuX14PEsLfs7SM2PxAndufMRBEa11lmvSX61FGrs08PqAtf+fphW+Eh3+yrvV0SbXKD8gwEc2eEtvf+BzaQfYJbB5uF7+s=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f9d6e1ca-5077-406e-99d2-8a0c1b7f82a5@citrix.com>
Date: Wed, 25 Nov 2026 16:12:47 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Marek Marczykowski
 <marmarek@invisiblethingslab.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v5 3/3] x86/EFI: replace ebmalloc()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ce77413b-ec50-42e3-a1fb-cfec6e6efcba@suse.com>
 <e9e13623-b695-4095-a283-b9840e704e55@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e9e13623-b695-4095-a283-b9840e704e55@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P265CA0026.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS0PR03MB989236:EE_
X-MS-Office365-Filtering-Correlation-Id: 060e5c2a-0b86-402f-369c-08df4b0ef4ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AVX2+O/rvwlAkRcp5ANBrFw23F0QUX4VwBDMZKjxejPmsE6i3H8GOkzw4WlDzFb3F7qn3fnALRKyZIH1ygUmLKdqokMgR5BezRq3cG9TvqDjYq+WGH9U7sMP9SKB3K0BQqfJMqGV/oFltW2ypF0Dyl5hBgD0bjXomxwYuyAezKrHk4/6CcyjpsP6RYKNEu4WnJ1q86rhO+6jlsKn47rebEWiv8gMUQpNN9L0W4fRVrYKiv69ZlifTD3jRYu6ly2JtbSQv6BRYGZjwN5KEhXs5ZfQHRqPD6kcSSUunAKJ8J8weRBxv1RLKxaqC6REPspiJwB/QyAjy+4DcP3wOBCRF42woG6ecRlkaYEztjuEBif8Oos5bJVelgrPWAa1y7+SGdk7F21Wvn7zEtNB46exnncrD0z9Fx5zTpFS3E6nCXXSuuD0hyFWQyLX5qvrQYEUpnu4VSkOLk2lnBtTtDL07qktyCRLi7n0FHPcugQsM++22lcF6B9cqnCifkVqM/D+bZzaimBBJ6148U5DDPG8OfbvTDUAMdUP7ZyzIzidBdqEGY0kfW3eRz4N/tmvhMcrmoGj+YkwglqKvBc5lI+1Rnav6qIppV2GSVgVzRW5o7yoR7o78rZRiTBvDsQG9btZq3/UlXQHg5w/DkGUJf40b4YHejQJg0uwjXlsBiqkmrc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXZWTnl2YVdmeHhNckZLR1ZBSEEvOHd3c3RYZHB3QWNnTVdMb0MxNGJFcE5Z?=
 =?utf-8?B?Yk1jMGhwYkJ6ODdvVW1SSGRnYmlQQWVBczFldlNxY2NsNEdoYmhpS2ZqeVVN?=
 =?utf-8?B?SHJoQUNFdUN2ejU5c0NrdUNPMUs1SXZ2T1FPQUtKR2FkOHlSY3dUMnJRMFA4?=
 =?utf-8?B?aE5UdUsyR2g5Y2c4eStldm5tdEcvamlJZXlrelovY3FRZ2p3UEpIVTBNRXJF?=
 =?utf-8?B?blFyQ2s2QmY3ZHJXeU9kZkN0UC9FM1duSnhONWt1U3BtREhQelJzMmxtdFNE?=
 =?utf-8?B?c3p4dy81SWMrb1NSOVNxK2RjK0w0NkJOSWdaaWVSTE1OY0VJT01jbWlPMjYz?=
 =?utf-8?B?RFJvclJ0WERzdDUxSEdaaU9abGdHakhWMGhSNFBYNHYzaUVJVFVQbFNna3BK?=
 =?utf-8?B?QUdqWERUSjJQM256VXB4M1o5b1Iycm43V2NTaGFzQm4vUTdwQlZWOE5hM3Va?=
 =?utf-8?B?SWYrcU5vOFp3ZEtPZ1JnaVVUdzAvVnVNQnlHSlF1dlJkZWIzRmtFdmV2T0U1?=
 =?utf-8?B?bDVZTUR5bC90Q0RqYlU4ZVRMcE5UNkZHeDhNTm1sYlpudm9Db1pxTmJtUWkw?=
 =?utf-8?B?enQ0bmRFUTBpdW5uWk1FZnM4NElUdEd2bzBSZGM5WjZNWnA4VFNHSUJnbUc4?=
 =?utf-8?B?MERGZlU3S3FUL21qRFlvbjNJekcvTzdrcUszT1FhRDhoWURSc1UzTVFWcVpT?=
 =?utf-8?B?SW5MOTE2eEppUjNPOVR1VWd0ZGxNaGhLOGJQYVhRcGVza3ZnVzJvMVhyVEM0?=
 =?utf-8?B?b2gvSUdpQlVyRUxSWVNJNmhkNERVeFhHdjJhVnFGNExQVjkzZHNYVnFWQmc0?=
 =?utf-8?B?WEs2TXpMd0RnK1B0N2d6cEZDR2V2OEJTOGhWM1dPYmk4TEZmV0lCdFNoTVlR?=
 =?utf-8?B?SUY4WUpDSExLY2J6MmFqTHZQendNSHE4MlFoOFB6UHhYUHdrcWVJUWVrckg3?=
 =?utf-8?B?UzE5UFlMOWxYUkpjdFBraUl2RFp5cnV3aWViMVlYTFg3cUtuRFVRdHNBRDUy?=
 =?utf-8?B?d0REcnZsMmVwUkwvNG91ZGkyUUVSNWo1K2cxdjRhVm0rb1NMdVMrc212NXZY?=
 =?utf-8?B?M1U4TExJRlNLUGlWeGNMYWxKSmdIZi8xK0xNZ082SlV1U1JkTEZzZDRFNUo0?=
 =?utf-8?B?ZWdMZFUraEx2M2NVT1dQVkoxSUlHcVdvNFdhRHNLckhaS3lVbHlPN0M0RWVS?=
 =?utf-8?B?VnNpVm4wMFRieXd6c3lEamR1ZWtnN25EeEdMam1NS2grSmxGS0RwSzFqWTZu?=
 =?utf-8?B?YzBsZzVrU20wVjl3Y2lNSlRJdHhHSGlUd2l4MEM1OElmaFJDU1V2dVZRaWhX?=
 =?utf-8?B?K283NVcydmtFb1BsVHVFa1hEQ0RFNmNZN0oyMy92MXhpUzVlM1RLTDFvc0FM?=
 =?utf-8?B?enZwOWtsT1FqSmtxd0RMTGlOVnJGTjVCYVRiZkdGWmtiQzVYaTc5UW9kQnI2?=
 =?utf-8?B?Z0JSM3ZKY0ZEQi9iLzcxZ1BpL0F5RmNGN3dLck1ZNEM3Y1VGOW5VQ3ZMdzhx?=
 =?utf-8?B?N05ORkVVZFpjT2NjV2M3aDVLMjlQU2xkODI5VklvRk03bU5sOWNVUDVIZ2Fk?=
 =?utf-8?B?a0N4RTFTUGFwSTRvTko4SGY2M3c2aFRrZU9LaFVyZWhncHhrQXpBQndyOHFh?=
 =?utf-8?B?VDhuakkvQ3Uwem14cXZFazNKb1FEZG0wWlFMQzJDRk9rUzVPT0Q4NWZ3REFu?=
 =?utf-8?B?MVhiRWxTUEd2OFF3S1ZXQ0U4bE0zWVdMNkE4THB2Z1dUR2x4My95ZVhSZVpO?=
 =?utf-8?B?SnVlSjdRVm90MUVoT3cvL1V3NmxwWmFTUnJlaWRCcTFKQzR2aGEzOVlIU1A0?=
 =?utf-8?B?anB4Z3d1RVBsUVQ5TFQvVW1DZ2F0UHFIYXNTcmdBZGxOYW16OHYvSWdFcGdm?=
 =?utf-8?B?dHNudGgyOEFMSVRpUTV5NU55YmYwU0RYZGpwV2NXaElOWDNnYkduMHQ4aTA4?=
 =?utf-8?B?Y25KYWg1Qkd3bHUyUGx4NkN1TTEyYUVUT0Z2SkRuMm1sekdNbzJOQVE0d2ov?=
 =?utf-8?B?YWN3YjBGdG8zMk1tVEM5QklQaVNZWW5kUkpqWS9KUHpMVythZzkzeStMbHVm?=
 =?utf-8?B?UCthVHVzeUhSVCs1WG9oK2dvZ1c0VEZIVXhNdG1JTmgwSzJVeGt3OFMwb3Nr?=
 =?utf-8?B?V1d6ZVRlNjc4T0I1TlVBS3crQ0RMZ1J6cWdKMy9JVmdiZjN6WkZobjBaTU9v?=
 =?utf-8?B?U3NBcmw4TzBRTVlpUXk4VVlRSDA1bWQzUldaMGlXaklNa2g1U3B3NGRWY2NF?=
 =?utf-8?B?WDlDMlRDdDNnZHpXNUpkcjZCSmZaUy9jWHpwTERJb2gyMmhsUUxjTk1MRGdt?=
 =?utf-8?B?U29DZ2E0WmZvbzhWRC9LUzRZVVV4VHdlckQxUFV6UHNPNzhzSkVjcXAvd1lH?=
 =?utf-8?Q?EgSCswPbYsLeh/CQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 060e5c2a-0b86-402f-369c-08df4b0ef4ab
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 16:12:51.8056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lqq/bnUhuHtGdgjXh0ULAjDl1M18Ik2G3YK2Z4vcN+NZIEopVlRYE1qw+q6L4pTbvjLQQ8bngYh9zIIGoXf9XXVmuIiIi+Hax0uDXijycjE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB989236
X-purgate-ID: tlsNG-d62444/1795623174-BF0DD5FD-E583CA07/10/78276251493
X-purgate-type: spam
X-purgate-size: 316
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 25/11/2026 2:36 pm, Jan Beulich wrote:
> Use the new brk_alloc() instead, with ebmalloc() merely being a thin
> wrapper.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

