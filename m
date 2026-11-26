Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBC1606A31E
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 23:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=Zg5mMNun
Received: from list by lists.xenproject.org with outflank-mailman.1504255.1699733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWiy6-0002BC-C1; Thu, 26 Nov 2026 23:33:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1504255.1699733; Thu, 26 Nov 2026 23:33:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWiy6-0002B5-9M; Thu, 26 Nov 2026 23:33:34 +0000
Received: by outflank-mailman (input) for mailman id 1504255;
 Thu, 26 Nov 2026 23:33:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xWiy4-0002Az-LF
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 23:33:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWiy3-007xDz-9T
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 00:33:31 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b08c1c3-e002-0a2a0a5209dd-0a2a4503d658-6
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 00:33:31 +0100
Received: from [52.101.193.23]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b08c1c9-fae8-0a2a45030019-3465c11767c9-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 00:33:30 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB5733.namprd03.prod.outlook.com (2603:10b6:510:39::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 23:33:27 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 23:33:27 +0000
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
 b=sz8iylTDHTdzpXClbLIWdZPAV/DYdivk54Vghhh5sP5o1ny3yWbNE128PrEuIFxaxC8ifix/4tnCcVlIxGFbw9+1ck5TpTvLii9Ayz2WFwgZPOw2JqJY7TTMAyJKkbybPw7Cb7AW7ur14O/v4fpczna6zNw+ZX92/0y1ntgYDzJVx8r3fsq3vJjzbRaA6MQVZBWXdkwbteYJ9iDYcSyjaE2Ny4qv/4LQuDvoDfgt7GVV2rNjcuHSwZUrZZOgRHd4SFyqQ0paZdgepmcNIRFmg0myCpoH/8q08p+Y0mvl2LIyQP792nuOMwKbqePGtSOMadnn3I/Sg9czdqlBl9Nx7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkrKf9Hm5bK7TR0VIQOAZIDoswMOH1cmaIdWFG+PAlE=;
 b=O3QqfbHmAXUsKoNrC3I/gWaINoXeqOBvNgrZYjr9L/jZxZvVKrz4S7/wkxOI7Cuav0KaEew37m71JkNRlMyDLeP4x8MiIcjMCa06UXiw9SRnTJX9L7ZqkksYAColXduamAl4dAqREd1OqX8tKxAZDpl++8E91K7SZEpOV8PY/zWwWP2VL6hgrbA+yj/YXa7weVgRT+tXnpKY628Q59lYrv/x9F4CheGMNhmgG+Ex4PXv2E7CF3QADIGVUd5mmW97LP/1SRHr9h3hX5y0ejGb4POQiYG4Ju9tnO8YH5YugPn7wm0c+UXMKap6mXoSHqoKQkUuc3HH/veh2yRnQ7IuvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkrKf9Hm5bK7TR0VIQOAZIDoswMOH1cmaIdWFG+PAlE=;
 b=Zg5mMNunxrUdgT6Ii2Q1jAvzWIdr7qiFhyMCLXKHyZSUy8m9GDOQTOYv6uDWIgUv5NiSzOsEb2swxowfNe11kHjDBe3whZI9VWr0qTRCx3kU4GsC4fRL06vKs/4wsGjj+xJaGM5Lo5guqZ6LwVEN3kD1BgS/KmC4rG0NSrPmdNY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <512c2e0a-0467-4dca-9319-ffbf2907a56c@citrix.com>
Date: Thu, 26 Nov 2026 23:33:23 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 0/3] docs/man: fix typos in man pages
To: =?UTF-8?Q?Bala_Andegue_Fran=C3=A7ois_Lionnel?=
 <balaandeguefrancoislionnel@gmail.com>, xen-devel@lists.xenproject.org
References: <20261126222918.951621-1-balaandeguefrancoislionnel@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261126222918.951621-1-balaandeguefrancoislionnel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0210.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36d::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB5733:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cf84a10-ce6b-4d4d-f07a-08df4c15abdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|11063799006|6133799003|261009223327099003|261009221727099003|261009220027099003|18002099003|22082099003|261009221227099003|261009223027099003|10067099003|56012099006|261102123227099003|261026121527099003|261021121427099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	oe0ioLOFppje2F+6a5rLcBGct3KYCFzLvlToZBs1sNX4wIPUcEVitGGrTiN70W39qBS/RHovwycQ86DcoTT3iituU8Up2MWhDt+E4YbsQTvIdqdOlGpd5HD+CnSuDLbklwKbvvVmbefFlnV7ForQKns708++KnIOQPXnSuozkc4pr1v7Mik2f3jv7m4ATKcX5ZsCPqJhoP+bsf7YhO2fhLI7unZVIEFRHdPFOz4cIKhI29fwI9lZy8VL9sdOgpbAnxfT90d131Zplw2AqtfWskOgpu97vG2KLuu69EyTbYOUQl7BR+ypEOD88H1iUCz4c1NBDBvAG78zWeW7P3LjH39NN+kHdZgMYTxcoKP3p564euBxYaTMdmEWnhOWePuNpmmRuTiDPjno1wSP3Mh1jZvXs7auAG6WAklKB8md96G0//hf7z5ztYjkzSMGsjKIkS1xpCqCN6H8evLT1URbJqKHGvmSU66xPPyXoyGJJ8TkstOUqics2mz+0jgwpeVdlmVUW872zZ1Z7KaCom9uHPDIa4vQv4yk5G9dx+IWG3+AXe/oscmC+wI3V7uYLaIK7B0jBIctWtA6qdHxb9kaSTDu/zOVcjezOvVhRa918bxJ4qEjHSFC4l6ONUvT2uUzZmZNO9Jt3VkbCccH1zarrVkJonQ42gzMJ3Cg7WrtDrU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(11063799006)(6133799003)(261009223327099003)(261009221727099003)(261009220027099003)(18002099003)(22082099003)(261009221227099003)(261009223027099003)(10067099003)(56012099006)(261102123227099003)(261026121527099003)(261021121427099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEtkSUhsS2kzNkR5UHUxSktYMFkyWnBzTHB4QVlvbm5FMjVIdHYzWjEwWFFJ?=
 =?utf-8?B?b1BmNlBLY3RydlZsWHlwU3B4b2ZuZDdCeFRnN1JNWSsxTis5ZGNoVXlDeXhF?=
 =?utf-8?B?c21OR3ozME5VN0ZBSi9RRHpmd2tnRDhhVkEvelZ0Njl5aXF0T2JUaE5QeXU3?=
 =?utf-8?B?TkpVdXk0RjczVDRkZ241d0Y0NjFLeEtubEozeXQxQ0ZDT3FDQVpDRkM3ZW51?=
 =?utf-8?B?eDZzbnhnMzlZLzRFbjAxaG4zR1FlNVV2bk5taEdxaHhFVnhsTHBMYkVXTUdF?=
 =?utf-8?B?bDdYWXpla091K0VLTEd2R0xNVW1naWtSUlgxd2NUdU9ONUNwTTZneC83NWZT?=
 =?utf-8?B?V253b0p6ZlFrRE1nZ0I1YW9WWlVFakZ5RnZOWlc4TVRDanBBam01UEkrd1R3?=
 =?utf-8?B?TGMvZkJIcldqL2U3bGtqelh5Zit3YU9FRU5naUdCaGgxN2RjTlNlZUtpVVhE?=
 =?utf-8?B?YXQvR252Mkx1MXYwbUhzRnhNamQwQjRUTjZ4cHQveVF3QndZMWhESDFjTUJk?=
 =?utf-8?B?VnZ3S3VBblNNUUdBbmpGQWs4Z3pMVlpSa1FhZW1TSklTcnBudXZKZ2x3WlNN?=
 =?utf-8?B?eVlQSnVLeG5KZTE4ZnRlUVBYbnMzT1BOdnFZdnptbjFWWFpuOXNNdWJpeUpt?=
 =?utf-8?B?OEErSFNobkk3SVBwUU1IVlFGam45Qm5rQUVqK29CZFp3ZkVQZkJPVDFtenhY?=
 =?utf-8?B?VWlWcjhGWjVYVmNXM29rN0NKZytVQm8zcmhjSGhEZkFPUmlxVytPY2hNT3lP?=
 =?utf-8?B?SXBRQ3hOYnJ6NXBEQzVqSFB2L09pMGV3eG56aHNSY3djRDk4Q2VCKzZ4T0Jw?=
 =?utf-8?B?R0FFSXNibGpXWDVVT1pBRzhIVzNZajEvQ2U3d2xtaFVoSlJhemR4TzFEWXcy?=
 =?utf-8?B?V2szZmcvSi9tbTNPclBiUWY5Z042UklvdkpwNkZlOG5SdVVzcFM4MGJXZXVl?=
 =?utf-8?B?bjRQa05iTE5ackRFTVUrVjhlNDl2c1JDcFRqcnduYWM5MzFXUWFSanpsalRM?=
 =?utf-8?B?a29NWm12d0Q3NUNBN2Z3OXg4OVhmdEhaS1hoK3FOd3dZeW5GQ2ZhaXFLcUNh?=
 =?utf-8?B?TXljODUvVndIK0treFE4S3FHeW5ETDdkMEs2VVpDZG1mdHJJM205RnRHRXlO?=
 =?utf-8?B?djd0OWh0Wkl3dVNHSDQrUEpjSGZ1T0RrQTJnc000UUFQanlHeitNTEt0UXph?=
 =?utf-8?B?MkYzVjQ0bzlMZlhoVWlWbnYrR1kwSVpOTGM0bEhsTCttMks2Vm1xanhvd1lz?=
 =?utf-8?B?bnRvMjZCR3NXbk5aLzRPQUxvRzNRTi91bHpDRXRZbEJaQy9ORlg2b21aUnox?=
 =?utf-8?B?eWV5alI0VVRNSm9nY2NJQStXVkRFMGtQUUF6NzZuVVowYnQ1bllDR0ZLYWpv?=
 =?utf-8?B?a3ZYM2ROdHVrMERsQzFNWHdjU0orNmQxVlBEb05ScDJIeXZFTU5oRXc4R0dt?=
 =?utf-8?B?cEExa2FqRUhYUEtOcTNQMkVxcHpDM1VkQ0JCeGcxaEZGREtMbnZhMjJsQVhK?=
 =?utf-8?B?VWxLU2NIK0pkSWVvditHSlBRK0ZvQ09OcFZ6d1lDYjgxbFlrcTM3T1ZpQnlw?=
 =?utf-8?B?dnU4OW1xRXZWVVYzUmd5MU5ZMlJuN0R3MytNeHBYVVMrSzdPY2YwZS9rK3JV?=
 =?utf-8?B?d0Q4QTVkc0txUHZZVTR3TnJMWHd1NWU2U21pN1ozVXlEbTY5cmZFZytUdnkw?=
 =?utf-8?B?Qkh3Y2N3U3V1Yjk4MGgvdm9NWUhSd1ZLS2RCTkI4MWlaUW1oZ2xzdUdaYU90?=
 =?utf-8?B?Wmg5c1hXOXUwREJvNHdHTFo5NHRZZEJGWTJlZllqNmVTVkNqdGl5VmJTYXZp?=
 =?utf-8?B?WHJlaVpDY3Ura05jVUZNSmFDejliSkNMZmJsMWZCbEdXcUF6Y2tOZG9LUC9I?=
 =?utf-8?B?OWxUWC9RL1RwUGN3MU9WNXE1Mmw1dkxXYW41aU5LM3pWbnI1NDA5bnlXMmN0?=
 =?utf-8?B?Rlc0NnN3RXRUdHcvZlZFSklIZkFoZE9rUjRSeGtmUm5xVzFRWW5Wc3g0R01Q?=
 =?utf-8?B?UFBrV1VxOHZReng2YkoxZnRkZE5tclBWckhwSVJqb3FQRytWTURiaVM5aTUz?=
 =?utf-8?B?QVFndTFhbGZaOCtyT0x5QmUrRDh4NFJkK3N0WFYzQjQzYVE3dXpUalpTdUd4?=
 =?utf-8?B?VG5GYkd0NWRGS2ZobzJVTVo1dWFYdWtXUTJ1TXdoK2RaQmI4T285VTg3Wisv?=
 =?utf-8?B?U1Q4cm8zcURvMzg5ZWNySlAzQnNnR3ZUT1FJNUxIN1RmUm5oSDUvQ2UyQms0?=
 =?utf-8?B?ZVF6TkdZTHlmT1B3R2twU0xuazZYSWdYZ2d3ZVpSTEFqM2RuZE5ZcjhEdHZT?=
 =?utf-8?B?czR5K3MwMG1ENXBVUUJUMXBEaVFzN3krQ1pQWUxVdnhQSi9FQk1qUERpQWZI?=
 =?utf-8?Q?jNUSC1k6uWPuK6vM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf84a10-ce6b-4d4d-f07a-08df4c15abdc
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 23:33:27.3072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ta2jhf+UgHkuMcyICxLPUye6YACFq9pleb12agto9rYWCFiP7KXDm87/mScIuktrETtuL78a593MN9+0NwKz0Xs+Skh9p1FPUAKtzi/Eefg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5733
X-purgate-ID: tlsNG-33051d/1795736011-6C6DE4E9-FE6B938D/0/0
X-purgate-type: clean
X-purgate-size: 384
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26/11/2026 10:29 pm, Bala Andegue François Lionnel wrote:
> Fix a few misspellings found with codespell in three man pages.
> No functional change.
>
> Bala Andegue François Lionnel (3):
>   docs/man: fix typos in xl.cfg.5
>   docs/man: fix typo in xl-network-configuration.5
>   docs/man: fix typo in xen-vtpmmgr.7

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

