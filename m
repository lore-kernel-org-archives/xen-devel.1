Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DC1606A32D
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 16:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=Jcc6XCce
Received: from list by lists.xenproject.org with outflank-mailman.1477077.1682850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPMQM-0002hx-Q3; Fri, 06 Nov 2026 16:04:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1477077.1682850; Fri, 06 Nov 2026 16:04:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPMQM-0002ho-LK; Fri, 06 Nov 2026 16:04:18 +0000
Received: by outflank-mailman (input) for mailman id 1477077;
 Fri, 06 Nov 2026 16:04:17 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xPMQK-0002hi-U7
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 16:04:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPMQK-000X39-An
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 17:04:16 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aedfa62-e002-0a2a0a5209dd-0a2a4501aeb0-48
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 17:04:16 +0100
Received: from [52.101.61.18]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aedfa7e-5984-0a2a45010019-34653d12c3fd-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 17:04:15 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB6648.namprd03.prod.outlook.com (2603:10b6:a03:391::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 16:03:34 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 16:03:34 +0000
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
 b=GkiMkdQgq6NvYytSjwoMWKrdzxT/7OMyoXUwIjVKvOuK5ERTy9aStSfrnNCj7z1BaXmqK+/Ry45PXeHsmSHrDrCzXgUDRjKuUj8X3QTFTT0gq3qVbWEU80vid4fMMaNWn/fRlMYgFZzv6ZlzOn33XWQ03kJkD7wKrM/V74BEMEKBE8bBnOpSk6WzOeVX1wcpRoPCwEo5lxO3Rl7Mg2MLA12EV5udT/IMP9+ADWsuJ0T/dDJedibd/sH3IVUgdiAIJTHWuMoEnxzuK//X04DFBsn3b8Ce/ATUoF9+E0CNPB7lk24cK/8vzTpa5csePfrs3bfjyhmLBgB07cgjWZmtUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yomdQ7QwXopVssE+DCCfhkqY7S3zAHHZkc7NleIfsho=;
 b=L1LRVI6CBaCqBRJsIN/2Hp5ax+qx9JY1cCTIo5Hse860VmXp18Eny5/ERq5brYckTja8Jg/ufak4BPs45zR5vjiP+9rKVluYy9IZj+qu79uaucHdyYYfwGXo3sAcHTBC9LPrZ8/7+tmDKQznJ67c/hh7XiPQYsmV1dish9KGQtqVY1WlAEngi4rD4inEa7w59WN2tsXMEhwW5+MuldFEXa4Hy2mF3ZCdZ3G7kdA+THRM8luw880wRjxubq2FYGVQXcoz0RmZHD/ulfNrHXNSDACw2C5JAME1JyU9zFvK3sI6Bf1OjFW5BLjPH3OlAl2FpW4U3pbjqWNhHlFC9RamLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yomdQ7QwXopVssE+DCCfhkqY7S3zAHHZkc7NleIfsho=;
 b=Jcc6XCceQZX861sPqEHVdNrTzniZWo534wNh9KH5+qMry1zq3ANGN0KNuhRAW1iRTrxwjWDucQDwh8xbkXbk+6vhUy3UT+pEZOiEGKWS3vNGWhuPFdA3dBBu9ZvzyecMS6G8ptUpwjo1+66qgLjKwAfhmd1n6AhJ4JXl5fEydtM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b8d76591-5862-493c-8e54-00663f0f4366@citrix.com>
Date: Fri, 6 Nov 2026 16:03:30 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jason.andryuk@amd.com,
 jbeulich@suse.com, roger@xenproject.org, teddy.astie@vates.tech,
 dmukhin@xen.org
Subject: Re: [PATCH v1 01/28] x86/hvm: move SVM feature printout to a separate
 function
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-2-dmukhin@ford.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261105013347.719392-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0665.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB6648:EE_
X-MS-Office365-Filtering-Correlation-Id: c6c581c5-0744-412e-0816-08df3c1f82a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|10067099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	/AFOcEQLlvTawi3A1EV/qzLXCAXjFlCj6Ez0Oj0e3cnjLXedMxod/866xyXtfJJ/+z6aheCq9GG6QWnpDvGFwd+hvN46MVv+YQCP2+M5uy68vqpRC3z3QDy9xA5r6TmZUaAhCmPVCxLDpdcDnRNDK4Zdhm6ctPCIUGUFDPoXrgRFgIcIY8rblkfemcJ4vq3Wvey/ySE0681UO/bgFOgMRFir0qBDN8dzMAavG+j/EGOTJRmydhRFHfyCJazDCQ/wBJYQ3F3ovRFEVTffYjQ2eyyn6YXgEr/MMevH9xdAUhFGxZ39TAD2Ym5cyJ+/PTkg8ibbfcOrWO0U6l8/cOt+JDWk1EGTYf146qoaDPQ+gwK3/pE4bjYKC7bm+tpCSWTJrR+VQAdNxI0Ui3eI5KU1GAAmfOMggpiS8+/RGG9Ulv6BPa6KgXtoiZHjijgEa0Co/E+cuDWBCQmEHAdeQw/T8eiM2yjvOIJ2Bv28MHllZCWm/z9mfHEK/0XDME8wwvMlbGiP+d8dUHsDGHOqWQXiB+MYQclfz5UAikplLn5PtYVvcwWZo73CiMPDvAryst2vKlAvTxffmJOFRkV5PicJ1HxXjpwyImx/Gfyi9FlnT5IMN0bpRD+YwC4xOdK9dmTp6xZJ4orzShU7I0KfQvIH+ff6GjS3g2ncYuWvaK2vLIc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEZidWxqRkQvTE4ydzNuRExzWnBOVjFlNFBGYWtnZnpMTWhsTEZwRDYwenNS?=
 =?utf-8?B?cEFpVnlxRTRvUURvMWtIblhZN2hjOHRCQS9TWWRaK1VhNTNaUGZ3OG5CVjRR?=
 =?utf-8?B?clJxdnBqWk1NQklHSWo5dlFJaHdxSUZhSWgwOExQMmZWb3JJREZFRW5ha1VC?=
 =?utf-8?B?dUhROWVCUjRYT2I4ejJyQlZMSkJCMld5dUtxR0R3aWNsbXB1S0QvblVnbVVF?=
 =?utf-8?B?S3IxMUxBbTF2TUlzK2lsbXptdmNzMVdqQTBXam1hcmlGOXFWQmJlM2VqM29V?=
 =?utf-8?B?bzM4VUtkaHQ0aVpnUDBTL0hRd2cvbDdOQllwY1VCN1hIUmoxTTRZVnFTclhG?=
 =?utf-8?B?ZTVMSy93aytCcnRtYWtaZFVySVVWM0ltV1dabjNkcFdVZDdtQ1hPeGVSSDlO?=
 =?utf-8?B?dzFVYzY1bDZ0MnUxTVBZTW5kS3pYZ2JHbHVrcm0raVhwK25sWFVMbTVoY2lL?=
 =?utf-8?B?VEVxYXVqd1V6ME9DVFFQbmJvRW8rWFlpRUZieExETFZ0THlQZkpxVnZqL2Qw?=
 =?utf-8?B?NnA2aDRQdHdybG1QWXBwVGtIUXdld3pwU2l5SHIwcWx4VXhLWTlmWkM0WVVO?=
 =?utf-8?B?aXNJSlNuMmdScWg2UnpvbjZTTU8yTWRzMkViY0FnV0FmVi9qQ2hwUXlSNmdo?=
 =?utf-8?B?NEdmUXVtZjNkZS9yaXZ3NmNxSElodDhkazFqUXNEdk54VGlaN0lkSFJ3WDlK?=
 =?utf-8?B?bXpzSUJubG45QnJKcnJnUWZlR2dGOTBrM0lUZ0Z4Q0hEK09uYnBPTk5yN0w0?=
 =?utf-8?B?YmgzWHN5a1BBY0F0d1dkQTlFYlc2eStXR25Da0ZDa2VEdWlkNDlFd1dVL2w2?=
 =?utf-8?B?VWdvQXFBY1VTazNYZXlKd1d0bStjbDgrOVk2eEwxYlBJMVVSUXNUSkROV0dP?=
 =?utf-8?B?WkVHVUE4c2Z0bnFHRXUzTlBqSTUwUUROMnNoU2F1Z0VWeWowRTVjQ1VXVFBa?=
 =?utf-8?B?b0xMOGR4U3ZnZkZIMW9iQVB4VnhOZittSVFDaytHaDlmZEYzWHdwQmhIY3Vh?=
 =?utf-8?B?ZUc0YWNyQkUzclBIYkp5VUhCWCs0dTQ1bmp6U1p3Mkk2eGM1M2VwZmRhdXoz?=
 =?utf-8?B?N2xlYzdlcmFpZFM0TDVQUnVjME0rVEUxZmRGd095TCtVQWU1cXIwRi85UGxj?=
 =?utf-8?B?MisxTXVLWnB5anM2WC9mWTZSRUdpY1Vlam5GTGQ5OVBlMWZwT2RITFRGYW85?=
 =?utf-8?B?RndKRUhaaVFaRGxYdFFUOWhwaXRzRXlBd2lCOUUwb1k2eTEvRXY2aklIejda?=
 =?utf-8?B?R1ZrS0k5ZkxiQnY2Z1NVQWxJUmlJa1VCVnNhSGtadU9tL0t4WVVySkdyRmNH?=
 =?utf-8?B?K0lSWWdTcDJkK0cvZkd1YWNHdFZWbjUwWGQrSkhkSHprR3hRY1dKNlNScEQr?=
 =?utf-8?B?dGVuV01YZWtFQU5rdzVueVRoWHk1bWNydWI1alNnbDlEZEZPSk9zcFN0d2dW?=
 =?utf-8?B?bHRQWmJUQS9vWmhyeXJ6TTZWWUZlREh3ZmMyOUtrRUVDU3JhcVRNTys0clpM?=
 =?utf-8?B?Q0VQdUl5bUJHdTFlUHdtS1NZM0ZITVRKY0E3Vm1GbEx4c0RZZUtzVitVbVFK?=
 =?utf-8?B?YkxuWk5IMWQ4TTVYM1pTWWJjd1ptN3VVbWo4a2Y3QmZWd3V0MmUvMVB5UjdM?=
 =?utf-8?B?eDdJT2paZnFmU2NGd1p5UHB5YUhqMS9WZWlJaDhXSDJpU0JvanBTcjZ1MVBW?=
 =?utf-8?B?ckFkVnB1SHNrYytZSExRSlRvTUZQVGZFM0Z3aUVwUlNNZkFDTDVMbFgwcEcx?=
 =?utf-8?B?aVZBK2FSWUFjNU1KVjNnY0E2QWVYc1kwYXV1TmFuNmJla1c3b0ZtbG1ub2hW?=
 =?utf-8?B?WFJwWXJneDViN08wN3lSSHJudnh3V1h3RWRDZ1JYSm9tUjdjZUV0TmhrcDJS?=
 =?utf-8?B?eXV5ZFhpblVqS05aWC9YclVFcUcySjlkalNneXBmT2NCSHBDcjg0azFYdlJz?=
 =?utf-8?B?TFlpSWRiT0lkSGVuME5zelRqZlNUc2N6WmsxREhqaVZvRGNaRDZJTUdQSy8x?=
 =?utf-8?B?Sy9FVUJmb1dSY051ZlY1enQ0V3VQZEFZMzBpNzFQR1hVTWVJclFhSHRZdU51?=
 =?utf-8?B?dmJWc3dPWVFhaHZuMnR2SjFWTU95SEdGdjZ2TUtmVzljVVIrUlI5YVNUeDVz?=
 =?utf-8?B?K0I2KzA5dms4Ynp1QlJPdWExNEZUMjJ1WG1YUEV3YmJ5eXBsTzVDSThoVlBm?=
 =?utf-8?B?eXZSb0M0YnJUZHBCem03RUpUYjBNWmw5WnhFRndwb0VVRC9XZHJBWTFRcUtV?=
 =?utf-8?B?ZFBQSGRMQ21Rc1A2b2VYRHZGYndrQVR1TnRWOGpmTkEvQys1MnZneStPQWZK?=
 =?utf-8?B?Qmp5Lzl3K2dQSDl6QUM0UFMyQUxhOUpGeWlDRGFhMUNwcFBkek90Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c581c5-0744-412e-0816-08df3c1f82a3
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:03:34.4133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5bYPEj4rm79oCs6tYQxSpNKVcPcdMHiRQ9Kx+SmgB+hDlonlwMpVR3ITW5AzOKM7O8wqxeh+Ikma566aUkoYTepudBY9ru6QaSRkns7WQQA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6648
X-purgate-ID: tlsNG-d62444/1793981056-BE664757-E22310D9/0/0
X-purgate-type: clean
X-purgate-size: 323
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 05/11/2026 1:33 am, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com>
>
> Isolate long SVM feature list printout in a separate function to
> improve readability.
>
> Not a functional change.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

