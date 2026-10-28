Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144A8606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 08:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=R6iWrHBy
Received: from list by lists.xenproject.org with outflank-mailman.1462923.1673906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLyiQ-0007wd-84; Wed, 28 Oct 2026 08:08:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462923.1673906; Wed, 28 Oct 2026 08:08:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLyiQ-0007wW-45; Wed, 28 Oct 2026 08:08:58 +0000
Received: by outflank-mailman (input) for mailman id 1462923;
 Wed, 28 Oct 2026 08:08:56 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <takakura@valinux.co.jp>) id 1xLyiN-0007wQ-V6
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 08:08:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLyiN-006gCW-4Q
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 09:08:55 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6ae1ad8b-e002-0a2a0a5209dd-0a2a4505a6da-44
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 09:08:54 +0100
Received: from [40.107.74.89]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6ae1ad93-4cb1-0a2a45050019-286b4a591b72-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 09:08:54 +0100
Received: from TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:403:511::19) by TYRP286MB4478.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:1af::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 08:08:49 +0000
Received: from TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5f8d:a6bf:3b84:5a82]) by TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5f8d:a6bf:3b84:5a82%5]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 08:08:49 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rM5KAO9ItCLUv+3aXhisy5vH4yizfFuFbrm+021OU/gQBtvm34jy/Yl73DuGUBHT1UVaJvgj2hYeU9NMOTnOYXHHapVqVCtz0VLrbn/Cojdz8Z3T4aEjEw1eFE6zXZBhqqePy5Jhl83sjQ5qf3WfcvWuoaRzU774FLhHdbpEOUNfkAtA8USznZkhLfKqnMss3v/6k3hfbu3PHcJhaIGACmxE5ndzV3IJtYITEyD9oDYAm01D2j+Z+lquh14U19lXPhBWUoTsHb50us/SNy2z4+5R20HNid+/blF2VYUloT0x1dCfWchHob6cYtgRx8tzl4/OO91w3xBpIXvxRmZr4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2B03yrV6ETCBmypYMvpS66Ut+q9oewu4GOSrgKwVmCE=;
 b=FvOFXujH9rQovB3gV6jAcbEAVoUEyiw6WVyDR3nxwsFWkee5fM+Jk9kmDDRQVMhYY5KywLKayVumMqWjdkfiZC8thT12Ljd9hiudmWA4We+ye2vaMo9OaHeSh/LB5ryM/30HN9P3JLSU7QV6jcyz+R7HSw7W6qNrNY6G7+LNM3wdGbpyF09n7qcmg8t/tjsYDdsfmQSzpTIjs5tXIUMu03JOWHpfF2jRdA2FfXckyZ5N+dgKylQUrE+yVTTJipGZesU/nG9U83OocyXhaXA6lkMVkRjBhdE4K7cPwGFro6Lp2KTzJY2e0GzDgW7X3XVLRheBLgjIxFSFk3rC+aG0hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2B03yrV6ETCBmypYMvpS66Ut+q9oewu4GOSrgKwVmCE=;
 b=R6iWrHByzxRyG72iv++2QqYsRdofSkSkI4r/Vo0DDHcZLRXcdm1GKKKPZ0SltYkOE6HE6AMPyfB9wTb0UcOUf8P+f/8kzB83r5ThK2WV4ne+3Z0o/IM4w0a+wB7B1PCt7srY6/aQVwWMszRfgdkauWxkhQU+k6xAH6Ar92KKZPY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Ryo Takakura <takakura@valinux.co.jp>
To: andrew.cooper3@citrix.com
Cc: xen-devel@lists.xenproject.org
Subject: Re: [RFC 0/5] Introduce dynamic tracer using Livepatch
Date: Wed, 28 Oct 2026 17:08:41 +0900
Message-Id: <20261028080841.118926-1-takakura@valinux.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ef4f6390-1d06-4e24-af66-48dc0689ad38@citrix.com>
References: <ef4f6390-1d06-4e24-af66-48dc0689ad38@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0031.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::19) To TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:403:511::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY5P286MB319683:EE_|TYRP286MB4478:EE_
X-MS-Office365-Filtering-Correlation-Id: d70da82a-bd98-4e84-f1c7-08df34cab28c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|261026140227099003|56012099006|261026121527099003|261021121427099003|261022075727099003|261009223027099003|261022105027099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	iGjh8y38TKrQ1v0KnDWwkahJ2K0Onx6v69iT6uDLxqs39YO9Dc74WNSoL6k07GI2D5VK9tY8YJH4zV+NDJCX6Jtq+e40VAPRTax8f1EigQ2l7pOb3I69//qYnL0KIrBEso049thM3zBkSAKqeG02PR33b0iy66c/JY3VB2gcO7JzppAjBznMDZWxA7JJiCaGDeT8srWqDZGcHC4IDgJnPCCv+jvMxsWWUdrADLjSs9AF9UYAxcgv5VEl6PcsgEtK5evalESzKvkFQG1KFSEAykZ8M+A3zWIsdJUl1aFlW8uATvWQ1FZJPL1ENGAEtqLU8FSBjiC9YRGd7qd6eG5IbuZ1QQZaYXTTWGXrkHP3dfuTHTjT2fARJuqx7QHX+OFbjl/TSKGNm5J4ysWPZziK+viyCq0J+0iJ0rn5TPezEJzSScmZHjG8XmJ0rev53M14jjo5v9rofH4XqK6UZ8mIM8kZsvQ/ynTBbTWNbsKeaTRdGBsn8EM5LhVqZfW40d9Ph9cxNuNN4FBhFMpGR9j41KUmiDEW8sm4AserlVssreaKRsVxW2rCvBnCeT+otCPYUNtallqh8DditCqLpsQPpFh57RxOB1PCPDFEhm4vot8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(261026140227099003)(56012099006)(261026121527099003)(261021121427099003)(261022075727099003)(261009223027099003)(261022105027099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?37sz03XI5tyNLptVTjFYYw3la3T8k2ioNn3g6U/5vTxgvM+75XNNQ7ND0yLP?=
 =?us-ascii?Q?7GopmEESwPdLTwe00Lpi3qPPJFct3bSdOnrKyZpmyNKf9ZNFnVc1CNdutmVo?=
 =?us-ascii?Q?Ssg8VOBeM80nWbZq2KAIIqtefBHj+lLe/tcUnQh4mCVMroR/f1weORE+mOe8?=
 =?us-ascii?Q?GuxrxgWtEguAcCOwzwqpuV6qTXS8A/26u96hEyDc41Ax6JCcNF+/M+kmO6HN?=
 =?us-ascii?Q?Sy72wIJ0P/4iWUeQ9KC4i91M8WSaNVo/aQnN+V/0+0AU1TmVNLRwval6W0SI?=
 =?us-ascii?Q?2iDTl/WcEEf1MGX5GjOB4KWorK2s8WAv4ujwQZViruf3kcVO3q3NOY4Vx7IY?=
 =?us-ascii?Q?wscbgl017vIEgJ982C5eLAR7PH4StfyD3c0ax770pyBLPNzMt4DDpVdhjuwt?=
 =?us-ascii?Q?868h0iKehT0wlLzIwfnLfvtg+W2fgZ8M7Bk97fd8n4p2HnfJfAhO4Vvcl+Eb?=
 =?us-ascii?Q?WvGIvtpzoLcjQiuk8kY7eAV2Hg8MvZZyJ/EmkoYD+ltXTmY/pOc9mTLCYVBJ?=
 =?us-ascii?Q?QogFNonU79Zy8Ly1HqLH4e3fFDeYo+CLbPnHXpqUoGp7q5I0OErb8PvcYe+9?=
 =?us-ascii?Q?42sjTagoXQgE9YMZgs61EK8Fyg0AewJRBTBP77gjNB3hmGSaBnt4SqBVhKFC?=
 =?us-ascii?Q?BQLoawL+4Pj6tZ56pT+O5wknUecF2C5+oeqPusTzCEgP/yudKp5h9d1kkSp7?=
 =?us-ascii?Q?qhV0V+Y6sD9d7PSdmPLOzhstkD4NrzYuJGatUASe4pOUKQi/Xk+TVQTPTaVP?=
 =?us-ascii?Q?eO+moZ0JvsImdlaa204t+38EmBvEpAwfu3V/mlAFiD/lTHMBLqBOa5YFXrsl?=
 =?us-ascii?Q?zk8691q2ME5wGvIRQTx4dwHEyDUQFgHYAevc0R4VhXtgzxIAPtt6JIDVUrxA?=
 =?us-ascii?Q?fmyeEIMRgWIxZftmjzMXLIyvLkTaS0SDxzVksti3qZSy9f8uzgjk0U8IEjP+?=
 =?us-ascii?Q?T4dlH6rzFozM7ApHPmBD1oYQmZJZdKVoHAH2qhtURJGBT/JhaHc1eIwzTKEK?=
 =?us-ascii?Q?DHkrQcvDvBMNgdG2c7s6u5pHhcK7fuwf+nngnGi/3gJAVs7lZxC6wJs6mfR7?=
 =?us-ascii?Q?/vEQul0C746xbag1Xm05G5y9Ze/LogdWnzhO/tPPgHpdLkCOERYiGn8UHgHI?=
 =?us-ascii?Q?cJIztvvUkyA90Wr2dGcz9iXjTtKbyrm1npIE7tG+Ih0yf2dLG+YHsk05VVCC?=
 =?us-ascii?Q?XkdA/I3ruRb2sI2cSWCKs+LrLNnR+Kie3h/dg0zuvKNJM/tOAjuVvIcBw4GC?=
 =?us-ascii?Q?fyq5vxOjp8a8QkLH2IYMfbx/awSZCkUPFHvvz3fjeSemA0m02BsoZTNQFs32?=
 =?us-ascii?Q?ILhjtDyUgVlnP99bxA/6lCyq1hvJU2cR4m5y+X86pOudG1DgwyzPZ/dtDQkI?=
 =?us-ascii?Q?wnTO9hzfgHbgRO5j3xzCqvf7lUejV2lnNC2rpbtHBqc1A4au0f11+9vQ44Pu?=
 =?us-ascii?Q?MUIe1Vd07TdPr/aRVkoCWZAcIVY19HAjKlTDa4uvxs/ub3M/sEyv88pu/kAP?=
 =?us-ascii?Q?U0tI7OZ3DAO92qfSp7iCwcXboYiTYJpu8StLZg9HvFASEHxloqGyYEF8yWnI?=
 =?us-ascii?Q?53I1Hdi5AaxciXD1NBkK+lwusR7GxJOJInsLgbFSwNk2iI/84uu1DGwCN0xI?=
 =?us-ascii?Q?YlOIl3chtJi0N80LiX98rvHflbsbVCBDjQ1/CdjR/A1ib489QgNr/gFC7O9Y?=
 =?us-ascii?Q?quQhCNbSh+nH4Xb3o546SnzEaFuG5bhRXldR/HfVa/OcnjOhjp9/me7mi1/u?=
 =?us-ascii?Q?rtKvZW3MDw=3D=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: d70da82a-bd98-4e84-f1c7-08df34cab28c
X-MS-Exchange-CrossTenant-AuthSource: TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 08:08:49.4233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UQlklGzRecROof/xX7UHsFP6gIjYuLwzxMuLgmqmdRbJuBByoI57zv3g7Sgs/IvDVdS2mAomIi8tMagt9zTlww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB4478
X-purgate-ID: tlsNG-c201ff/1793174934-247132A1-5A9589CE/0/0
X-purgate-type: clean
X-purgate-size: 1857
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 27 Oct 2026 10:18:44 +0000, Andrew Cooper wrote:
>On 27/10/2026 4:37 am, Ryo Takakura wrote:
>>> You are also going to need a GCC_PATCHABLE_FUNCTION_ENTRY_BROKEN symbol,
>>> because of https://godbolt.org/z/sde4faxaz.  See the ASM_GOTO_OUTPUT for
>>> another example of this pattern.  Just use a plain version check rather
>>> than tying it to XEN_IBT; this is a new feature and people wanting to
>>> use it can use a new enough compiler, and it avoids variability
>>> depending on other options.
>> I didn't know about the compiler behaviour. Thank you for the detail.
>> I'll make sure to check the acceptable compiler version and add a version
>> check as you suggest.
>
>https://maskray.me/blog/fpatchable-function-entry seems to have a
>blow-by-blow of the bugs.

Interesting!

>The ordering with respect to ENDBR instructions is the only issue which
>will affect Xen, I think.  We don't use COMDAT, or BTI on ARM yet.
>
>Clang support seems to have been mostly correct at the point of being
>added, which is rather more than can be said for the GCC side.

I see. Thank you for the advise.
I follow them when preparing the check.

>>> Separately, you have a number of MISRA violations which you're
>>> introducing in your series.  I see you've got cf_check, which suggests
>>> you have built in GitlabCI.  Have you also run Eclair?
>> Thank you for pointing this out.
>> My apologies for the violations. I wasn't aware of the tests
>> and haven't run either of them. I added the cf_check following
>> the existing code that I referred to when preparing this series.
>> I'll make sure to run those tests before sending next version.
>
>Do you have an account on Gitlab to run the CI testing?  If not, reach
>out on Matrix.

I don't have an account yet.
Ok, I'll ask on Matrix.

Sincerely,
Ryo Takakura

