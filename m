Return-Path: <SRS0=zvGf=KJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB0BC433ED
	for <xen-devel@archiver.kernel.org>; Fri, 14 May 2021 09:47:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE72D60FF2
	for <xen-devel@archiver.kernel.org>; Fri, 14 May 2021 09:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE72D60FF2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.127300.239227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhUPP-0001lt-1f; Fri, 14 May 2021 09:47:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127300.239227; Fri, 14 May 2021 09:47:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhUPO-0001lm-Ue; Fri, 14 May 2021 09:47:02 +0000
Received: by outflank-mailman (input) for mailman id 127300;
 Fri, 14 May 2021 09:47:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lhUPN-0001lg-A2
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 09:47:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lhUPF-0005nD-GL; Fri, 14 May 2021 09:46:53 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lhUPF-0003jG-8l; Fri, 14 May 2021 09:46:53 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=cZpQbTQXGNTxggqBXwDi/oxJiHwv6QXPFqV8J+YrORg=; b=O0FQzyBRmLTcNrGqPpB4q8uelP
	N2ZVE7CwiH030S3nD6xZ5pLK+KbmvAY6kYq8/nTpXFKO1n/0LXGcs1VwftQ6X3g4vTLV3fJgVb2i2
	syJN23WYBIXMgfl2VtcovvIwnhWLJibqnXnw3384jliqdKHj5bIcnBQfcyDCkRRu2N8o=;
Subject: Re: [PATCH v2 4/5] xen: Add files needed for minimal riscv build
To: Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
References: <cover.1620965208.git.connojdavis@gmail.com>
 <c5d130b06de3d724921488387f1743d7996aac11.1620965208.git.connojdavis@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a5fd6d72-3a02-4c12-4021-bf06d0eeb174@xen.org>
Date: Fri, 14 May 2021 10:46:49 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <c5d130b06de3d724921488387f1743d7996aac11.1620965208.git.connojdavis@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Connor,

On 14/05/2021 05:17, Connor Davis wrote:
> Add the minimum code required to get xen to build with
> XEN_TARGET_ARCH=riscv64. It is minimal in the sense that every file and
> function added is required for a successful build, given the .config
> generated from riscv64_defconfig. The function implementations are just
> stubs; actual implmentations will need to be added later.

Thank you for the contribution. This is quite a large patch to review. 
Could you consider to split in smaller one (I think Stefano suggested 
one per header file or group of headers)? This would help to review and 
find whether some bits can be moved in common.

I would be happy to help moving some of the pieces.

> 
> Signed-off-by: Connor Davis <connojdavis@gmail.com>
> ---
>   config/riscv64.mk                        |   7 +
>   xen/Makefile                             |   8 +-
>   xen/arch/riscv/Kconfig                   |  54 ++++
>   xen/arch/riscv/Kconfig.debug             |   0
>   xen/arch/riscv/Makefile                  |  57 ++++
>   xen/arch/riscv/README.source             |  19 ++
>   xen/arch/riscv/Rules.mk                  |  13 +
>   xen/arch/riscv/arch.mk                   |   7 +
>   xen/arch/riscv/configs/riscv64_defconfig |  12 +
>   xen/arch/riscv/delay.c                   |  16 +
>   xen/arch/riscv/domain.c                  | 144 +++++++++
>   xen/arch/riscv/domctl.c                  |  36 +++
>   xen/arch/riscv/guestcopy.c               |  57 ++++
>   xen/arch/riscv/head.S                    |   6 +
>   xen/arch/riscv/irq.c                     |  78 +++++
>   xen/arch/riscv/lib/Makefile              |   1 +
>   xen/arch/riscv/lib/find_next_bit.c       | 284 +++++++++++++++++

I quickly skimmed through the code and I think some of the file can be 
made common such as this one.

[...]

> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
> index 1708c36964..fd0b75677c 100644
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -60,6 +60,7 @@ void arch_vcpu_destroy(struct vcpu *v);
>   int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned offset);
>   void unmap_vcpu_info(struct vcpu *v);
>   
> +struct xen_domctl_createdomain;

This is needed because?

>   int arch_domain_create(struct domain *d,
>                          struct xen_domctl_createdomain *config);
>   
> 

Cheers,

-- 
Julien Grall

