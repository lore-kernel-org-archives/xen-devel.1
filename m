Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA321C5DF7E
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 12:41:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394128.1632942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwJ7d-0006bK-Jc; Tue, 18 Aug 2026 12:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394128.1632942; Tue, 18 Aug 2026 12:40:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwJ7d-0006bD-Go; Tue, 18 Aug 2026 12:40:53 +0000
Received: by outflank-mailman (input) for mailman id 1394128;
 Tue, 18 Aug 2026 12:40:52 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wwJ7c-0006b7-Lu
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 12:40:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwJ7b-0091Nc-TZ
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 14:40:51 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a8452c1-e002-0a2a0a5209dd-0a2a4507e0fe-34
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 14:40:51 +0200
Received: from [40.93.196.63]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a8452d2-b4ea-0a2a45070019-285dc43f991b-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 14:40:51 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DSVPR03MB327264.namprd03.prod.outlook.com (2603:10b6:8:37c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 12:40:48 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 12:40:48 +0000
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
 b=boSSxvf8iN0RMRR9sI2ePDev6KEZBDrAHs4R+JHTboOCmSFS719AMj4s/L9uWOTQ4QLuj6NVJ6VMwc7gJCJLbhQ5LbuD/nNdqRixQTXLXeHyQdlJORllr9p1ZZv2CS4sz4xlFgYHIq+Tzpz0TZRGH0chxUSTA9gUpTOgx2XccXjb4dvaCKvpEAX2UxDMVJM3dRoiRoCIqlTIg9Q5gSc/rSIIxOSjBKIQB4JSyveIOVPzXgaliEyUm3YuIA6HByMNzBs3UBFex3zjDJbzLHGl+po4CHaBXuaz8QHkNcfQua33p4pZVHs0qmps+kPqnycWaGWXdTnryDNdcnio9qL9Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Se8YLnfgXv2gKpjSg3NRrAj06ixFg9Xs0ND2aASdIWM=;
 b=f0W3EOkMtHzjmbnDQ1h74Ooh3gsEKLqJqaHVYcXSO0mchWOgOkZqND6iQhSMM+rrO1elUTeX77pCq2Ef7Obbj8cQuvb5fwIkQmtY6TKpQo508Dfo7HPh23FnFtHmdmZV8LT0xE3zSYk6qRJsc0wluYF34akoSViN5VITyxQy8lTZ0sNdricwERuoBufZsa8MZzVog/Bkv77xQ60JmYbzFBHHpoXD9CX/iZ9si1i8F7elRuTcNcSiGMihdm9vsFLQHN67Nq4NFToI0Hc/Fhrxn5zhR8+Dwn0/iF/c+9u1WF5URcB6Edg+aNodu4rLXcu8SrNaJNq5oC+GyvFfq1OgPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Se8YLnfgXv2gKpjSg3NRrAj06ixFg9Xs0ND2aASdIWM=;
 b=VxAI/G/KUi6JV/oGM6kmASjB8Kd3dQ35lcZIsx29u2EXAGkVpiLONcCTxFfuliZA0LzYQ+pAqfIwI08U6Z2EhMZcKQgugqCX3D90BTYzg2tLTFCNSfNrU5XS9qtNF0wpHe8PLryk8xuwvewLdOr1/bLVD5nmv9NwpEI+P8nlg4M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d739485a-72cc-4518-afa9-8d2692a225ae@citrix.com>
Date: Tue, 18 Aug 2026 13:40:44 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Jens Wiklander <jenswi@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] xen/arm: ffa: Harden SEND2 against invented loads
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
References: <1b483ce633bfa7d304cb78458ce029370691f00c.1787055320.git.bertrand.marquis@arm.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1b483ce633bfa7d304cb78458ce029370691f00c.1787055320.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0314.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DSVPR03MB327264:EE_
X-MS-Office365-Filtering-Correlation-Id: df2ed854-2ac1-44a0-fe3d-08defd25ee02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|56012099006|10067099003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	607nC/FyyIv65khyPwvoTg981PNygNbaMnd6zaA3HMBLzzHVezgoGYErj+Xibz6dm5YMA5yzib4PQyWNDiKeeDjkO3AuMqjBqLkkMOmPRoTyH/0GTSok/ZyLuE0F5YoZFZU6YaWpUB8uB3xR3R+qP621a+DuPKRtWRQ3wdJa7eOaEcARtMM3y4rtjblgOfKR2MQW0+H1CN7QB/L2wTpP8dTNetcSo+OJKgiImlZ/6W6HBIurwF5jnsQW2LsZh+H1lLle0bvoq0B8NoNlgbUcX01WiaY96CcQDwfGOfBOd9Glx5hQUl/2rRYlRQFuKY7+1fPyr3Bh4F6Kja893GwpQ5N6LqJIpwnua2Y9fia9KbKCs3JJ+nw5681h2E7GoZRHS7yZqTGEojGkQzEM9Nl3LS5JDoe5KTCwFJmx5KZgXjBGD2zKowiAhqsq1NcRiP2AIqqF59h8eY7IPTB2FPq+0GCrNGpj45+A66bx9XgU/Miy+pw6qF2dBiTNWyBMH2Z3dbTWf1LqPOBzsjWrYpiGU2o9oKCd0MPBo8TywKsFc3YXmrbzah9fkQh+ucJL7/Hcd7fOcCzrXA/RJ/qN7cVk+hOtXYwgqGAjyVzDY04lQdUR7JHYYbXazpm33I8jC60tx0/bugPoJqxE1GoRLOBjW7x+VzsnO/Qe7tBDnL8YOWI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(10067099003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3FUMG5GYnB4dk9MSkc5c1VzSEpzUXJiOEFjdjd2Sk1id0N1MXFQaXlBbW1t?=
 =?utf-8?B?b3VidUIyZ3dSZ1R4TUdxenAxZUZSSlNvaFFDaWd1dzlXcnBPS1l4ZDBOUWlL?=
 =?utf-8?B?Q1dlckVXTnRVUW1pbEtNaTJlNHhZTlphN291aXVKbE5wNzFYdGFaK01JOFlp?=
 =?utf-8?B?b2Z0S3gvN0N6M0VEYjkzWUhTNWZYQmwvR01McUNiaUhzTUhrT0NiZ2ppQlhI?=
 =?utf-8?B?YkNWNm1lZkhkTEx4cnZHRU1XUWVJdUFlSWNIS0ZUb1pvbm50NEExUFZ3SDVx?=
 =?utf-8?B?cVQ0RmxEbHFiUVRBWTM4V3hjVU5VRmpoc0xxeG5jNlZOS2xpUUF4Zkg4UG5k?=
 =?utf-8?B?ZVhUc0hJWG9oVHo1NEtKekZGRE90ZXZkeUh0dmhLZWpGbnJSbWtRNngvM2FC?=
 =?utf-8?B?N1ZPR3FmMFdYbSszK1JnamMwMHlPTXFubFJFT1FUbmRJcEhUSm53ZUtqZzd2?=
 =?utf-8?B?RUZzZHZveHRYR3NQM1EwdnVWUXpjU296NXplcHhMREFVUExQUlQ0WThLeDNr?=
 =?utf-8?B?YUFxRTBmNUVJNytHYkhkYlJ4TlNnNUJnVmp3VEQrV0ZKYmRaMEpSTXhnaDZL?=
 =?utf-8?B?dWZGRGQ1eHQ3OWFkaG5OcEcwOXRjNXdtK2NTblFvTmlId3ArWmgzVThrOXRr?=
 =?utf-8?B?UksreFIyRFoyT2pNbDJwVU00MWF3OXZEbWxSbVFhZE9XTVhhUHljTlZ6MUxa?=
 =?utf-8?B?ZlA4cFgzOG9Ycm1HTGk4VXhBM1pGd2s3RkxWb0tTbDdMeFZ3UHh0c2pQdnNt?=
 =?utf-8?B?MkU4Y1BwK2FvZzZ3cnZJWHpJNU95R1VLRHNLTVd0SUZ3MDdvVXBEbXdtcDFm?=
 =?utf-8?B?cktIMXpYMnNpNmhaOWUwcmxXbXduZ3pkL0dobmlPdlc2c3pBS0JxR2tmekFw?=
 =?utf-8?B?SlRSbmdFdDAyWVl6VFdRaGpRNi9yRlRPbjVTdlN4bUREaHRjSm5BOXJUWFp6?=
 =?utf-8?B?R3N4Uzh3UmJycytPejY3dHVMOFFwYXR2aUdYVUpmL2hsWEJlYnpzUnZNQmJK?=
 =?utf-8?B?eE5kMCt5VnFEbGdmNzhJcjh5TWJ6TDdrYnBTcTVYVC9EK2ZLOWR2Uklablhx?=
 =?utf-8?B?NUwrM2hIaWR4YjFPcGNWMXJOcmtEVW82UjFaTG1mSGE4RFJPU09qOVFqUjE5?=
 =?utf-8?B?OFRaYWYwWC9Ec01rd1F2NVdMMmMvM0JCdGZMdWY5SW1iTytxMXhuaHNEL3Vx?=
 =?utf-8?B?OGg3MFdxSElNdDAzazJ5QlVkdVBPMjNMQnBjTmhwd2NRWG9OMU1JQ0c1bks3?=
 =?utf-8?B?bHNsdk8vSHYvQUhDdWhhZ1NMY2p5YjFqOWdiVHRoLzF2bUpuMlNldVpCLzZB?=
 =?utf-8?B?bThZZUxDYjFKOTJEeUVnOWZjYjBtdk9MSEtabk1WT2RKZXFvTU55R293cFJE?=
 =?utf-8?B?ZlBpSXRWSEdOL0g2VE9KUm1QRW9SUlVWWndSSlJTNE02czNoVTMxYXNkZ3R6?=
 =?utf-8?B?ejdmQ3lpdW9BWVdFTUR0WXBnY1UxOTFJOVNWZkczTmhIZ0NyQStFQ3dkOFJT?=
 =?utf-8?B?SktTVHhLUEdDYzl2MEY4Z1NpcEVFcmU3QTE3RElRdVFZbVFDakNZcnhwSzlw?=
 =?utf-8?B?MlpUcnlONnlYVXR3WmJ5MFdHZW9Xa1Q4a1ZrL0hOR3JuYjhxNm5abmg0M0xS?=
 =?utf-8?B?Uk1lejB4bkswb2twMjFZcmFXTW9YL1NiVFRlMU8vcDJCWXpTdENldXVOcWZ4?=
 =?utf-8?B?ZGVnRmhkbWRuaGVmWTI3YUlCQXhNMTRxRjBuR0RneUlEaTA1NWIyQzAvVzZj?=
 =?utf-8?B?SDVVeFZ0NmhnaE5CdWF6RW8vYnJDeU85VzU1NWZnTEN3NjlERE11R2RlV0pU?=
 =?utf-8?B?QUtHRkRJUGZpQXBtellUa0RublFiMEZLYWhIRnVFeW9Vb0U0MllNQkxiS1pE?=
 =?utf-8?B?T1RxcnJBNldyNkh1VXpSNUpYdS93VkVwaUFDM0kvNkcwT1QzZ0trWVVRU29n?=
 =?utf-8?B?V3IwcCtjREErYmlaRkNtWjJLbHhLYUw5YXNuQnBQTCthUE9GODZoM2FQRFlN?=
 =?utf-8?B?bm81L0hCWFpRN3M4eG8rTWt4TkVBQzlIeGkzZUtnM1o0SzdveENKQ1EzZnEz?=
 =?utf-8?B?TTgvS2U5STdveUZrdXg1by9yc28vbHAzZ1dXTi9JR1BERG5kZG0rb1k0a1dW?=
 =?utf-8?B?YzFnQnN6OUY1cEptUDVsOGJsNHJ5UE9haVQ4Ylg5dW0zNUcraDgvZVdLbkZu?=
 =?utf-8?B?L1NlN1oxN3QxMzB3UlNCOHJ1ekFMOFVkUUtBU3ZMeG8zWS9wVEJOd1RxbW5p?=
 =?utf-8?B?SkllRWlQT0s2VnM4MTlzVzlWVjVFcUNJMUQ1ZDlZSFQ0cTh3YldablZ1Qkpi?=
 =?utf-8?B?bXh0S0ttUUR5MjdodVliWUFlSnphcmFpTGwxRERuYy8vZmhIY3JTQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df2ed854-2ac1-44a0-fe3d-08defd25ee02
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 12:40:48.2792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0iHw9vPJkPbyRQIvOBwv1QQqOYuLz1pQaI0d5nhD90+qUbYOb+ZFhtdDucojtbsH0LqcUJrEROpchqSNphZQy0JAFdQTnjvHaRj8iequsto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR03MB327264
X-purgate-ID: tlsNG-ef75cf/1787056851-A6AD8AE4-8C3EAAD4/0/0
X-purgate-type: clean
X-purgate-size: 2577

On 18/08/2026 1:16 pm, Bertrand Marquis wrote:
> Research into compiler-invented loads has flagged FFA_MSG_SEND2 as a
> possible vulnerability.
>
> ffa_handle_msg_send2() copies the message header from the guest-writable
> TX buffer before validating and using its fields. A plain structure copy
> does not prevent the compiler from re-deriving later field accesses from
> the live TX mapping.
>
> For VM-to-VM messages, msg_offset and msg_size are validated against the
> source and destination buffers, then used to copy the payload. If a
> sibling vCPU changes the header and the compiler reloads either field,
> the checked and used values can differ. This can cause an out-of-bounds
> read from the sender's TX buffer or an out-of-bounds write into the
> receiver's RX buffer.
>
> The cross-VM path is gated by CONFIG_FFA_VM_TO_VM, which is disabled by
> default. The audit ranks the likelihood of such a reload as low, but the
> C semantics do not guarantee that later accesses use the stack copy.
>
> Add a compiler barrier immediately after copying the header so that
> validation and use consume the same snapshot.
>
> Link: https://github.com/xoreaxeaxeax/schrodingers-toctou/blob/main/observer-effect/audits/audit-xen-tee-mediator-RELEASE-4.21.1.md#tm-2--ff-a-txrx-buffers-ffa_shmc-ffa_msgc
> Fixes: 98af565b1e61 ("xen/arm: ffa: Add indirect message between VM")
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/tee/ffa_msg.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
> index 1eadc62870f2..39f561c8237f 100644
> --- a/xen/arch/arm/tee/ffa_msg.c
> +++ b/xen/arch/arm/tee/ffa_msg.c
> @@ -257,6 +257,11 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs)
>  
>      /* create a copy of the message header */
>      memcpy(&src_msg, tx_buf, sizeof(src_msg));
> +    /*
> +     * Make sure that "tx_buf" which is shared with the guest isn't accessed
> +     * again after this point.
> +     */
> +    barrier();
>  
>      src_id = src_msg.send_recv_id >> 16;
>      dst_id = src_msg.send_recv_id & GENMASK(15,0);

This does look to be adequate to fix the potential issue, but you should
drop the ACCESS_ONCE(src_ctx->guest_vers) a little lower down.

With a safe copy on the stack, there's no need to further inhibit
optimisations around it.  In fact, it's unclear why e040b94d0fff added
the ACCESS_ONCE() in the first place, seeing as it was already an
on-stack object at the time.

~Andrew


