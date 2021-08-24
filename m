Return-Path: <SRS0=P/U6=NP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9DDFC4338F
	for <xen-devel@archiver.kernel.org>; Tue, 24 Aug 2021 12:53:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 758806127B
	for <xen-devel@archiver.kernel.org>; Tue, 24 Aug 2021 12:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 758806127B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.171334.312649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIVvW-00042N-TJ; Tue, 24 Aug 2021 12:53:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171334.312649; Tue, 24 Aug 2021 12:53:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIVvW-00042G-Pj; Tue, 24 Aug 2021 12:53:14 +0000
Received: by outflank-mailman (input) for mailman id 171334;
 Tue, 24 Aug 2021 12:53:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mIVvW-000428-8w
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 12:53:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIVvV-0003PG-Cj; Tue, 24 Aug 2021 12:53:13 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIVvV-0006YQ-70; Tue, 24 Aug 2021 12:53:13 +0000
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
	bh=1XTh++1M2EAMxs6u6Xdtw0nMNd7YVsTSaDp7PyfIePg=; b=gKlpz/VpAUHXcla6EJXsdLwjpJ
	sOCp7HYypOVM/tzcuFuw6MY9FJPIXSpBjECVsCVyXrpzm4cwsp+Cs+gEjSuZqhgzNBsBKBHxQ4FLd
	Mr5/9ERXu3GP/lfniZ3XogUKaoh1LGZ6w3qkYoypnuUrDbxMTWrzKHJr53e0R4JFqhNA=;
Subject: Re: [XEN PATCH v7 12/51] build: avoid building arm/arm/*/head.o twice
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-13-anthony.perard@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3152a1d5-3185-1d9c-8949-39015c73bbe4@xen.org>
Date: Tue, 24 Aug 2021 13:53:11 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210824105038.1257926-13-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Anthony,

On 24/08/2021 11:49, Anthony PERARD wrote:
> head.o is been built twice, once because it is in $(ALL_OBJS) and a
> second time because it is in $(extra-y) and thus it is rebuilt when
> building "arch/arm/built_in.o".
> 
> Fix this by adding a dependency of "head.o" on the directory
> "arch/arm/".
> 
> Also, we should avoid building object that are in subdirectories, so
> move the declaration in there. This doesn't change anything as
> "arch/arm/built_in.o" depends on "arch/arm/$subarch/built_in.o" which
> depends on $(extra-y), so we still need to depend on
> "arch/arm/built_in.o".

head.o as to be right at the beginning of the binary. Will this still be 
guaranteed with this change?

Cheers,

> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>   xen/arch/arm/Makefile       | 7 ++++++-
>   xen/arch/arm/arm32/Makefile | 1 +
>   xen/arch/arm/arm64/Makefile | 2 ++
>   3 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 3d0af8ebc93c..cc90d9796e6e 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -64,7 +64,6 @@ obj-$(CONFIG_SBSA_VUART_CONSOLE) += vpl011.o
>   obj-y += vsmc.o
>   obj-y += vpsci.o
>   obj-y += vuart.o
> -extra-y += $(TARGET_SUBARCH)/head.o
>   
>   extra-y += xen.lds
>   
> @@ -76,6 +75,12 @@ endif
>   
>   ALL_OBJS := $(TARGET_SUBARCH)/head.o $(ALL_OBJS)
>   
> +# head.o is built by descending into the sub-directory, depends on the part of
> +# $(ALL_OBJS) that will eventually recurse into $(TARGET_SUBARCH)/ and build
> +# head.o
> +$(TARGET_SUBARCH)/head.o: $(BASEDIR)/arch/arm/built_in.o
> +$(TARGET_SUBARCH)/head.o: ;
> +
>   ifdef CONFIG_LIVEPATCH
>   all_symbols = --all-symbols
>   ifdef CONFIG_FAST_SYMBOL_LOOKUP
> diff --git a/xen/arch/arm/arm32/Makefile b/xen/arch/arm/arm32/Makefile
> index 96105d238307..3040eabce3ad 100644
> --- a/xen/arch/arm/arm32/Makefile
> +++ b/xen/arch/arm/arm32/Makefile
> @@ -11,3 +11,4 @@ obj-y += smpboot.o
>   obj-y += traps.o
>   obj-y += vfp.o
>   
> +extra-y += head.o
> diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
> index 40642ff57494..0bb284dedab2 100644
> --- a/xen/arch/arm/arm64/Makefile
> +++ b/xen/arch/arm/arm64/Makefile
> @@ -13,3 +13,5 @@ obj-y += smpboot.o
>   obj-y += traps.o
>   obj-y += vfp.o
>   obj-y += vsysreg.o
> +
> +extra-y += head.o
> 

-- 
Julien Grall

