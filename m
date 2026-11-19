Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE909606A320
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 11:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=cFVpbduq
Received: from list by lists.xenproject.org with outflank-mailman.1496198.1694853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU0jW-00079A-L0; Thu, 19 Nov 2026 11:55:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496198.1694853; Thu, 19 Nov 2026 11:55:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU0jW-000793-I9; Thu, 19 Nov 2026 11:55:18 +0000
Received: by outflank-mailman (input) for mailman id 1496198;
 Thu, 19 Nov 2026 11:55:17 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xU0jV-00078w-Dz
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 11:55:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU0jU-005gBM-O5
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 12:55:16 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6afee39f-e002-0a2a0a5209dd-0a2a4509879c-0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 12:55:11 +0100
Received: from [52.101.193.30]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6afee39e-be1a-0a2a45090019-3465c11eb98b-4
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 12:55:11 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by MN2PR03MB4943.namprd03.prod.outlook.com (2603:10b6:208:1ae::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 11:55:09 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0615.016; Thu, 19 Nov 2026
 11:55:08 +0000
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
 b=OKHtf0rIW1AimlFOqh7wpZ0Za+OMA1+tQm8Y9M7yFLlJDq6N4oXXS5d7b51aeA4EQXbwCPnKf5PzYZNMpKT8eaI3VP1Z94wZbsmL+G7OUHIK91tGvE827ZdULbqV2MkJj+QwuZT9HdggaoNLJ4bbXxeyJwvyEHMNrTf3/23ZfIdhORBB+R9k2OTRu4bRhvYlnxN1tRGQAY4hdtBTv13iErpCsMREajUyaCio32mrC+zpCcBolAQqD9T83lW0aqmj/NvHb4Ks5KYMg9/904Oo9P92eOXV/IP644zf5h0M/i6bGh0DzrMtlAiK4uDRCkkFJ+6YVWKq6bQef/l6SIYytA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9cmGdthkLBHjJ8hahufzVZB6gsAkLF+rEULto5VyKts=;
 b=pyjYV66jYPu8bOx61CWWROePXeNiQY8pIKpHviMVMZYbRomze5ylrOZzr+GeU43Yz1QYMkD+9s+OiK4Vwk0y3z2PlTqDafWY/vgkg0PuTpdM7h50Jbx2mSOEWQVNuPtCbm4GnELywIdB6+UWS0x4NMclPqgdCfOW1ljzJuNI7K9T7wrkF95PHJtT1OYRCYcfaBMP+FQD7PnRV+VIj/ygXk56z+YqlknDKKPz166nv/zdHOev3sCJM97fmxjzx0bV9CyzB23ArdXcA0FpU3jvPLG53AVC+BmQwbwPnGk1yHyXHW6NdNgJzU9K13U4tqeteTrtkiu55CNNrgezwabalg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9cmGdthkLBHjJ8hahufzVZB6gsAkLF+rEULto5VyKts=;
 b=cFVpbduqY9yaBP3TiNsrb+Ok4WD65ep8Eo82/BcA4sYW2JROAOOZFz3kGrJBneQqUh9IEtYGk1FbShUsu1VW/Ml+j9/jcPWYpoFEPxjZw/GsN/a1PatsBVl8Z2fGuC6+02+cy6kyDa2w1hAtHF7iClZrriFq4KvdXMjSR4ATe5o=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <229f4fd2-13a5-4810-98dc-5b3e069d70c1@citrix.com>
Date: Thu, 19 Nov 2026 11:55:05 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] x86/hvm: don't let EFLAGS.IF block NMI/#MC due to
 nested state
To: chunjie.zhu@citrix.com
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
 roger@xenproject.org, teddy.astie@vates.tech, xen-devel@lists.xenproject.org
References: <cover.1794482561.git.chunjie.zhu@citrix.com>
 <605e5007fc5cf68418ca637c61d7567ac9224e52.1794482561.git.chunjie.zhu@citrix.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <605e5007fc5cf68418ca637c61d7567ac9224e52.1794482561.git.chunjie.zhu@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0640.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::21) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|MN2PR03MB4943:EE_
X-MS-Office365-Filtering-Correlation-Id: df8ab45c-d780-47bc-ef7d-08df4633f57c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|261102123227099003|10067099003|4143699003|261026121527099003|5023799004|11063799006|56012099006|261026140227099003|261022105027099003|261021121427099003|261028144727099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VjHeude0dkY8IcpQ26JcpUaKwpqlBwN/zTuYe8yNVZVh0EDchmlaa980naN20doHVu+vE4y7ZxAosB+0fOcUjw9rRqxIZxzL8ehk/HJJdFamXtvFLX+PHrYTBk2MGehpD2FJPGX5ughRN7Nce78TKUiynqqeGEhzU65S6Gwa4vCMLtGdEUaph9hA52NLqnI+Z1bAWoORrfMBeuu14NUnLbTegK7M7koOwmB6LS9qQPVGPxdepYi0VE8MRu/d5Bq10WojiWhljfHYzGgPLO/nrj2cBTR83KmJBI4ya0UEjZ25T7Yn6dKX7i/duyo27lRXdJxLkvnoSOuKhJ3YQoNvUmzT0T6xIJXdK/dR+4wFh7eZjnSB8T9RKvOsMZMPvH9aQzFsP5sZbWlIZScg8cGBhkvJOD3rtUY4CNDRF3WVphnQrPiRIenNVRMhC1Q2xN8b5CHOPOJC5HMBIVbszgW42Yhgh8o5cUlpFo5ftPtS6OX/aHaz8N9Xbap5LagdyoiLkT3WD9QF5ipGcoNgQd+aDKoyNl1jHv9i8kVMCNh63tDLKJtJvTrFKa93DpnBt5jo+x7azaCgc8ap8OzgYPiNiTiO+yERuvFegWbVcWL9cKRjJntknTSI2uHFCoK3CnMThHCmOsXRLGfhhrFYfbNH5DCxHdzIQaE9+JkEBBw63/Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261102123227099003)(10067099003)(4143699003)(261026121527099003)(5023799004)(11063799006)(56012099006)(261026140227099003)(261022105027099003)(261021121427099003)(261028144727099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vk1GY3FaRXlTNGYwMThLMjBWSVVEVXJVUXBXL2I0QWhaZjB0MExkWEJjTlcw?=
 =?utf-8?B?bHFVcTU1MFd4VkQ1RWY2U2tvcUZEUFR2WVZLSExZSktVVUxkRkxyUWJHTzZ3?=
 =?utf-8?B?MjBSOUI4Y0lUdTVpV1E5WlIreG5sM0xFQWMvdkZOVVM5YzFNOURmUEZrVzhT?=
 =?utf-8?B?NlF0aTF2VzJJbTRXZFpOZkswMDc0cDlYanJTRmQza2xacnh3bU5TcHJFdGVJ?=
 =?utf-8?B?M0hrb0hzbkM4RnE2Y0poQ3ZPV2FZREVrdVZ2bFhWRUdzOTdONTBDUmhSSVow?=
 =?utf-8?B?bTFtOVZ6MDVhQzdyRTZHQWdPNTYrRjVMUzhLd0pGUmJLRjJkSU44ZHoyOWUy?=
 =?utf-8?B?VFFrNlltYnExVEt5L3crS1dxeHlHZXRha1pjcm56TkVZVHVtS2daYnhXdnY5?=
 =?utf-8?B?VVJ6aFIySm04a0FVcUEwcCs2MzU3SXdHcGhSYndpMmREaUQ5WGd6L2U0SXBi?=
 =?utf-8?B?ZE51aTZ2R2JxUFJBclNRVlNjZDcxY3FlL29sZEVOYndDcUcyZ3ZpLzMxVUNm?=
 =?utf-8?B?NVZiSDVTNUpSUnpzK0s2dWRjVStmTlZ1T3FqeElOUC9oYTNOL2ZzYXFUd05j?=
 =?utf-8?B?VmRtMTdOODBSMzhBTEMrUHFnN3liV1dtS3BJTWcrV3VvNm1CeWwxMHdMcVU1?=
 =?utf-8?B?cXlNRmk1NXdaTHQyUjk4YTV1LzFUQUFKSUFjalBiTkdMT1hCSFRHT3NLZGJm?=
 =?utf-8?B?NW1HclZGejV4YkttcDNwSWRUSU5NUUw4bW8yeEVVNTAwTWQ0L0lCa09TZGs2?=
 =?utf-8?B?U3BkVDRnRzc0Zk5mUEVWcVlxMUphWHRzUDJIYlZNMUd6eTl4ejJ4WmhuSWgy?=
 =?utf-8?B?aG1sVTlCbnI5cGFGdkhHWWNFNmxyNFFib1lrdUVYdGEzbzlBS0hVSVJyQVRy?=
 =?utf-8?B?QUFPS1dpZTl3NG8wTlR5Wnczb2lDak9VbnAvaDVkWVlkTjZTYlNqdHpvVU1T?=
 =?utf-8?B?ajVCQktGZ1YzUmV1aS9vNm13OGtVK2NqZyt3bENVNGhLdElIRjRlQmdYWW16?=
 =?utf-8?B?NkV6bkFsTmFuOUd3dkthdlZsZVVIUjZleUR1QSs5VnJxYWdXazJJZmk5TllL?=
 =?utf-8?B?MzBKUTVUQ0NsWFJkLzRLdE9FZHlEdlZCSCtEN09DTXVRQ1N3SHhPdVlOL3ox?=
 =?utf-8?B?WGdSYlVoQXpReHQwcW1YMjl1aXJTaHYxVktHNlIwZUhkY2N3V2F3MjgreFhV?=
 =?utf-8?B?M2REcWRQT1JSaGt0WDZWZlpDWUpmeDZ5SEtFZS9uRUVnUlRQNkJOajRYeWlL?=
 =?utf-8?B?Z0l5d2kxWS84cHllTjUyTGJzWjBUYzdyTXRNQ2tWd09YNElwTUJ2VUhVby9n?=
 =?utf-8?B?RzJlSE00WFNVZFhLY2NmMElhODFUaWZPRDZQRytGbDhib0ErQ2dpVkNRNkdn?=
 =?utf-8?B?eTY3dnZIMFZ5RDNPdWRvZmR0RjQyY0NGeWxsQ01EUndwYTRUQ09lbll4Sk50?=
 =?utf-8?B?UzVQRVFXR09wK2IzRmFDTUlXOHJFZ3FKZnhYa0NjRDU3ZVg4Q3N3STFkUjhF?=
 =?utf-8?B?SGsxZFNHMlppN2FxalV6TFpCdzVERVl0d0VYY3Z3enFUN0J2NTdzWWlVbzVt?=
 =?utf-8?B?OEYySEY5SDhOVWszdGgxZm4vaGE0N3lZMzNhV0VKRDhIaTQ2eHJxby9EdnRF?=
 =?utf-8?B?L21VMXFhSWJMQVdMc0JXUXVUK2g4STh1Z0szd1lPUnJPZXBndEt4N0V0MTda?=
 =?utf-8?B?L2hJRm90TS9JRGFKbGRrYVNoMVhBVEs5Z0grL1lveitnZnZmYThZVFlkcWpn?=
 =?utf-8?B?WVFtQmtkVEMyT25LYktmUGNYZmR6QXVXaTlISlNVUjFKcitJZjN4dWc5cWIv?=
 =?utf-8?B?RDFyR21EMVMzejhqT2dOblRtNXZYMGdndGdoNi92RnU3aHA5U0JnSHNueUly?=
 =?utf-8?B?WUkrYjFSWjFOY2tnZFQ2ZkVmd1YwWkhEQ0l2WTl6VUV3dVloeERlaHJqVUJn?=
 =?utf-8?B?S1pCVnVDdWp0azdqTWlnUGx1dkVDeWFBbXcwZ3diQXhNTnJhQlFLVThGVjN0?=
 =?utf-8?B?YlhuZEw4NGtDVVBKcXo3d2tDMDliT1lYQUcrZUJFb2xxekZGWFNJdXhidkJD?=
 =?utf-8?B?TXd3QVluUEJsZ1hsOW1SckZLazl4WEo4ejJzYlhoWTdVQnZnL3JjcDdUWjBM?=
 =?utf-8?B?bm5WNDMrNjBnQkNJRURoSUhUUVNVeUJ6bEFiWDF2Nkx3cU1uY25YdWhINmhH?=
 =?utf-8?B?MkhBVHgwMC9va3l4MFAxMnVoRnhVL0RMMTI4UkVibExFRksydEFZcDgwZGpu?=
 =?utf-8?B?NjJ0UzFyUlpUY0hqTXdnM21aM2N0NEtXQ3ZCZUo1cis3dDh3WVVHcVY5eUNx?=
 =?utf-8?B?dUhwbHE5RHRibERUdk15ZlRuQ1hmdlFnWTREWDZMU2FKb0VQZHlMMnpqMHVP?=
 =?utf-8?Q?uMCqePW3B8zKmOXU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df8ab45c-d780-47bc-ef7d-08df4633f57c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 11:55:08.7938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1yC0Xk0xlXA8bCEGK7608fQcQkxNp8jECpFsqjoLCLOduPFrMzF9YZdI/+lAxzZ5h4kJK03cVCIalux8mYIFjEg+D80UJtWOn1HhkhSptA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4943
X-purgate-ID: tlsNG-bad1c0/1795089311-3A8D9034-0953A37B/0/0
X-purgate-type: clean
X-purgate-size: 1279
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/12/26 11:35 AM, chunjie.zhu@citrix.com wrote:
> From: Chunjie Zhu <chunjie.zhu@citrix.com>
> 
> nhvm_interrupt_blocked() reports why an interrupt is blocked, but both
> callers, nestedsvm_vcpu_interrupt() and hvm_interrupt_blocked(), treat any
> reason as blocking every event source.  EFLAGS.IF (hvm_intblk_rflags_ie)
> doesn't mask NMI or #MC, so NMI/#MC get held pending needlessly, e.g. when
> L1 sets V_INTR_MASKING and L1's IF is clear.
> 
> Have nhvm_interrupt_blocked() take the intack and report no block for
> NMI/#MC when the reason is hvm_intblk_rflags_ie.
> 
> nvmx_intr_blocked() used hvm_intblk_rflags_ie for vmexit/vmentry in
> progress and a valid VM_ENTRY_INTR_INFO.  Those block every event source
> and have nothing to do with RFLAGS.IF, so report hvm_intblk_arch instead.
> This doesn't change behaviour as all callers only compare against
> hvm_intblk_none and hvm_intblk_tpr.
> 
> Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>

It's not completely clear what the Fixes tag should be for this. Perhaps:

Fixes: 3a1ef3c33fa7 ("Implement SVM specific interrupt handling")
Fixes: 479d4619fd5b ("Nested VMX: interrupt/exception handling for n2 guest")

With that,

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

