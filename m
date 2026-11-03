Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F81606A324
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 06:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=X4tffKkR
Received: from list by lists.xenproject.org with outflank-mailman.1469218.1678114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO7fj-0003tx-BV; Tue, 03 Nov 2026 06:07:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469218.1678114; Tue, 03 Nov 2026 06:07:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO7fj-0003tq-8I; Tue, 03 Nov 2026 06:07:03 +0000
Received: by outflank-mailman (input) for mailman id 1469218;
 Tue, 03 Nov 2026 06:07:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <takakura@valinux.co.jp>) id 1xO7fh-0003tk-58
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 06:07:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xO7fg-005qhr-I4
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 07:07:00 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6ae979e4-e002-0a2a0a5209dd-0a2a45058b86-38
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 07:07:00 +0100
Received: from [52.101.229.87]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6ae97a02-4cb1-0a2a45050019-3465e557aed0-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 07:07:00 +0100
Received: from TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:403:511::19) by OS9P286MB7838.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:474::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 06:06:56 +0000
Received: from TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5f8d:a6bf:3b84:5a82]) by TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5f8d:a6bf:3b84:5a82%5]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 06:06:56 +0000
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
 b=ipx11jCxmVxJ5kNSm9jR0QVlmSv2Z4pgUHSRGTW5sNUPyK5+hxdN95dXz3bxLoUKkFMqPj6nV2npvAMfbn2wCVzsxPZ0DwUY0QEtJOR3GYY5PrkyHwZlioKvC3XNjlQCFuJb93SWH5FLPZD8GbJerMEXStTcERBebtkvT2j5KEG3cDaqTYfJjyBPuWPkH3UVh4bYC2Pn9GLLtdUL9SBA7rmGYsTPv3egA0+/RusJv9ePH6E7QoM736vKMp34UXa+67MMwzT4oARd62dkIXJsSeBDmu1VG648JnFJE/W556PMUW/xinA2f/T5lHCV5fofKci6utyWUvnqxqUVaXpjNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wJbRb4c11sycDgRMbqx2U9KFUPcOdk0j1e342MzWLg=;
 b=Nvh0la2tBsSmbdgo8imOXHk2pwXofTnUzf3D6KhVwusCqcq1iHgX2+Ge+eiurwt0HMNgNlpfiv9V23gTCQGbtksqwozSWcNOsE/Lbhj+MTJk26/ZjUrlp4IEBu+1mZLOx1nAk7uNxHO/XuopcdxioWQ7tKKekKqjDOl7SB5bAWG3ow7mwAq8zNJfIRbkYbhvdLPWqxTttRWmW1N4cViv3cof7hOZcS3wPHikbRA2/XOj16R/I4MkeDAG6vCuvTUUOd7v8Is7KWgzZDByW55t9OUlsZMqSf8NLlmCZ4RMCWYyRvC2VtRQB26g6j89CbvCscTLEg6Ysf5rUjCQne/Cqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wJbRb4c11sycDgRMbqx2U9KFUPcOdk0j1e342MzWLg=;
 b=X4tffKkRbgBTpDBC/F/B6swf5MzEiWAjDFpoB/cYzMZt5Yn4CregWlGrlfp0PJx4PWf84m8+ndfFyLfMIXUqweLHH0OaxbzCFXDt0r9A8RsLFhMssT/FZmcnFGoLxl/gk01GCBfYdUMdZ+KC+KoCwIAB4CDwqe9S7N6hCPR4S14=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Ryo Takakura <takakura@valinux.co.jp>
To: jbeulich@suse.com
Cc: Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	bertrand.marquis@arm.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger@xenproject.org,
	ross.lagerwall@citrix.com,
	sstabellini@kernel.org,
	takakura@valinux.co.jp,
	teddy.astie@vates.tech,
	xen-devel@lists.xenproject.org
Subject: Re: [RFC 5/5] xen/x86: livepatch: enable attaching callbacks
Date: Tue,  3 Nov 2026 15:06:42 +0900
Message-Id: <20261103060642.105330-1-takakura@valinux.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <00f95d00-3d43-4e85-92e9-0b1cba4f0c4f@suse.com>
References: <00f95d00-3d43-4e85-92e9-0b1cba4f0c4f@suse.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: OS3P301CA0045.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:604:21e::14) To TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:403:511::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY5P286MB319683:EE_|OS9P286MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: e783faad-572a-4231-adfd-08df3970aa42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|56012099006|261009223027099003|261028144727099003|261021121427099003|261102123227099003|261022105027099003|261026140227099003|261026121527099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Atx1KbL6e4SbTg9nd9tGOS0SA8Qo9exB694zPj7VEqwsHSqs/sJnHrI1+oAOnRiRagmA2xESdtG3jCV3DQrHHlRI3Y4l2OdPs4sZh5csH+m89RLOFUSPxgQh6+pI7hs+Op2iXODWk78Sane4SsDBlD+PCH1oGxxNNCVowePHNMwF2MTTinPO7PK7CjJhjT+lFlKkh9hcMAFhYSZTZ5DcIlqv/uKUnECKDkeQZM1DfjifIAfeCYcsdp9isSAdxGUr0SXsbrMv5bHjbMF3MN6oWRVqba7STTcyq/DPOLDeLPtIfdafiQqntvnHiNRT/zELjct7z1Cy66WwoiIHPJ01hcdkS0pxBIuyj5Wpsa5r929jr7sKz5YlCNZsCJRZpVEcLx4ou2UCYLQk8PS/y4+5AfZSWmSV+5jCLKJHWWOkedBBBIhKPqyP9nP7AmCJNbgXQsHesc6tpCrBDKYGc+vop5e16DKqj+hpJ6I+fzR2qcOtqWk5x1Y9ou+k7o2zOjCeS6hAGvTsPriKfri1plzJBvUHxKxKYEcLFHdfzvC4JtqUEuEoe7JLtn6l0xI4MxJ0W12dyj72X0qtVWnnfZeToiAwAtSOBjR+x/sRgDauuFk//xGWxeTWy7TSRxufoDvTqJCzc4U124Rvijk0VHCclhqVLzuvAlbbIGuRHOu1Udg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261102123227099003)(261022105027099003)(261026140227099003)(261026121527099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1TT1V1KKkhM1ACK1YzTgob9R7ZdDJWfaSxixUniPTcmAl02RmUBZQ6V6S1hP?=
 =?us-ascii?Q?sVXBF+nttYA5WKeKBvooOr4Sla1Rl0l5o9RmKuu9/ccfD9FVEeuDZKg4IwwX?=
 =?us-ascii?Q?5gWkXrkF4npB1vXXTVytb0epceb45tEiWzcHqtuleghDvVCZmCgH3bKcY6oF?=
 =?us-ascii?Q?XdqqyMNjwqrUlZ9GeAKJbVc2GdGqo/zSlv5S+pJokamJEtt0+lPuWr12TR7W?=
 =?us-ascii?Q?U7GCptRNaGDTL6bohdMIqai5n4xtR7hvw908wR8gj7RrZ2WjbmfN99S3NzIa?=
 =?us-ascii?Q?la/IHH1o58/D3P5rIJFXtwEMW+TW+EV9NaiL3tSU1ixDz8jCM0isYz2r15OO?=
 =?us-ascii?Q?x1XfeRfpStYqP5zJvgGWTYifv64M9ASbfc384IIgto264PsDGnEs5D4p2dTk?=
 =?us-ascii?Q?SpyfK02xbp+GEaurruSuB6YMYZTDmFErcYUFIsIBX5yQwwo/D1OnmHjYOkih?=
 =?us-ascii?Q?1XyeQHGYtT3Ao6RN5CqWwk9aT1p435QPPM1RS2qKNeWnacBoy2g1KtxBckBA?=
 =?us-ascii?Q?44QhE7TRkD3GAUBf6X96uXZVbMtnYYrqdbGPqrYhL9tove1PSti9Pf8gxUlN?=
 =?us-ascii?Q?wOoIzLZ1npKtjilJ/2CK4z37viYDEvW126zW2CAK34zt7FWNbi+VmdKHqvOj?=
 =?us-ascii?Q?997WOM6UJ3wUzlu3/BGGzB0b5DaO7zh5wdnjE76mlaE/jjWowMZfUDAdV2za?=
 =?us-ascii?Q?gKRy8XYnenF+TYOTwXRXirFnh7MauczB6kAvxZtqi7xyNhnL4WppIRPsIaq3?=
 =?us-ascii?Q?ej+z7ONtAP54ntYGKPD/OKl8bPK6exl0ckZIcb8AtL+aPip05T1F9kJB1l+j?=
 =?us-ascii?Q?eRcQcw/12+d9p8wxq7xd2xMJthMIIrpK+8Ri+OJHcqajajbsy/+AYSQU3c7d?=
 =?us-ascii?Q?Z13NGryF1cqmPlynNvQtJj4YMQw3BlBaHmh4PPv2knqxghKKkGayHIMAQ/9Z?=
 =?us-ascii?Q?cwy3aBG+l9nfZHpc5rMfEiPhBOFwCM1N4XiOX10OHqnD6qD6F2sbegeajwUd?=
 =?us-ascii?Q?CZF66e4cijD7OdKDi1gYX9sOqSXPfDWRW/vlciMds5Ulsyzk+JkvFC7DQErM?=
 =?us-ascii?Q?X9MQwZ5UUuZEwp6ZWuEFridsXt6cDw7M57BGVBr6ivtmMmvLAXnxaAec9H6E?=
 =?us-ascii?Q?Ve7s5GL7+7beoD9cDPSzGerA1ciX8rslBnznpqGh9yf6wOjwfwCXeiEgf5Vd?=
 =?us-ascii?Q?zz+PUPwSSGzvsSpB4aMy8W1RUgtCuPiGCGQFIhV+jBVFSnlbkh35KpMLiWy7?=
 =?us-ascii?Q?5X0NfzwHMfmKQgTAfezBrgm/I3/y79bryvix3gmyX8K/NCQjw62ymqirhnbD?=
 =?us-ascii?Q?cggxs2Okuz1I8P6QdYSQAEXEa9+ckejwu85fgQ0C2Rmk0kxY59FExFZ0GKZK?=
 =?us-ascii?Q?9z5z5qZTkiZV/OORaFl6FQIqPJyTUozm0QeyuSaY9KE01mnG2WOZGhvHMSol?=
 =?us-ascii?Q?Fofmbbyv/SJBI3gRnN86CC05HAHCVcae+AkRCu+Y+e1I5ZQoKNTbH3J2C4US?=
 =?us-ascii?Q?X62KktvGP2OkPt2626d9+uKniI1mwFois1x/68DiTdLVF5p8lvUDqDrzNeiT?=
 =?us-ascii?Q?UYHMnyfL2ZE8pWquGoTU75EOLR99xXqsZUf2Wi/HtprJx1fApUYGnCn3tCtc?=
 =?us-ascii?Q?J/5udqgAOtk1ZzZfLDh/PrCqnsP89vaHxwIkONu993JXB/N0BEEhrBhBFR/k?=
 =?us-ascii?Q?MadGbloCnb3jQ83tzDICx5DrsRYqHiagJVsDt8dZ2WDQ1cpa+BUTgK2ZHm3J?=
 =?us-ascii?Q?m6juVbIQ0g=3D=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: e783faad-572a-4231-adfd-08df3970aa42
X-MS-Exchange-CrossTenant-AuthSource: TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 06:06:56.5945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d+3DX8w+iLe4GTTwcmNp8LBEt19mK3Pd/fpnma3FwuQrqhwjtDWuRcRS5NWBgOMVEcueDL3pjsdWNBP1HQDMFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB7838
X-purgate-ID: tlsNG-c201ff/1793686020-251182A1-66229B69/0/0
X-purgate-type: clean
X-purgate-size: 2073
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 26 Oct 2026 12:56:56 +0100, Jan Beulich wrote:
>On 26.10.2026 12:42, Andrew Cooper wrote:
>> On 23/10/2026 5:58 am, Ryo Takakura wrote:
>>> +FUNC(xen_livepatch_trace_caller)
>>> +        pushq   %rbp
>>> +        movq    %rsp, %rbp
>>> +        pushfq
>>> +
>>> +        /* Preserve general-purpose registers. */
>>> +        pushq   %rax
>>> +        pushq   %rcx
>>> +        pushq   %rdx
>>> +        pushq   %rsi
>>> +        pushq   %rdi
>>> +        pushq   %r8
>>> +        pushq   %r9
>>> +        pushq   %r10
>>> +        pushq   %r11
>>> +
>>> +        /*
>>> +         * xen_livepatch_trace_dispatcher(ip, parent_ip)
>>> +         *
>>> +         * ip: Address of the traced function.
>>> +         * parent_ip: Address where the traced function was called.
>>> +         */
>>> +        movq    8(%rbp), %rdi
>>> +        subq    $5, %rdi
>>> +        movq    16(%rbp), %rsi
>>> +        call    xen_livepatch_trace_dispatcher
>>> +
>>> +        /* Restore the saved state. */
>>> +        popq    %r11
>>> +        popq    %r10
>>> +        popq    %r9
>>> +        popq    %r8
>>> +        popq    %rdi
>>> +        popq    %rsi
>>> +        popq    %rdx
>>> +        popq    %rcx
>>> +        popq    %rax
>>> +        popfq
>>> +        popq    %rbp
>>> +        ret
>>> +END(xen_livepatch_trace_caller)
>> 
>> Just in case there's a problem doing this all in C...
>> 
>> No need for pushf or popf at all.  Flags are undefined at function
>> boundaries.
>> 
>> Please drop the q suffixes; they're all unnecessary here.
>> 
>> The ret needs to be RET for speculative mitigations.  (It's emitted as
>> JMP which will be turned back into a RET on safe system.)
>
>Just for completeness: "will" as in "will eventually"; see my still
>pending "x86: re-inline RET used in assembly code" (with me doing C side
>work still pending feedback for that initial, smaller change).

Understood. Thank you for the input.
I'll use RET in case the assembly trampoline remains.

Sincerely,
Ryo Takakura

