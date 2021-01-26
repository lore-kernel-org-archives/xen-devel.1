Return-Path: <SRS0=12TN=G5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 857DFC433E0
	for <xen-devel@archiver.kernel.org>; Tue, 26 Jan 2021 09:26:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F5E52310E
	for <xen-devel@archiver.kernel.org>; Tue, 26 Jan 2021 09:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F5E52310E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.74683.134216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4KcR-0005qz-TN; Tue, 26 Jan 2021 09:26:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74683.134216; Tue, 26 Jan 2021 09:26:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4KcR-0005qs-QH; Tue, 26 Jan 2021 09:26:39 +0000
Received: by outflank-mailman (input) for mailman id 74683;
 Tue, 26 Jan 2021 09:26:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4KcQ-0005qn-2n
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 09:26:38 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f22f3059-de63-45cc-9248-0f25ac108d61;
 Tue, 26 Jan 2021 09:26:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8AFB7B2D0;
 Tue, 26 Jan 2021 09:26:36 +0000 (UTC)
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
X-Inumbo-ID: f22f3059-de63-45cc-9248-0f25ac108d61
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611653196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ppa+Lefu1bTCFH1tnB4mK9B+zZeHA7P4414UVqpUMWI=;
	b=CkUNcauTSKv7uQgq16Kj+6bntYKodLjb1qjfeDSOGbMMtL4pdaelPP/L+7VzH+ggk3Dc4a
	8HR30BNbzcUTwoIjcAulaUYRK1mhwgWfvRBBRAS2Dbl0pXb6cS+Hpfq3vURV+BlEUHTH5c
	t+Qu+5UUKaMDoVK/dolplva+SKXN764=
Subject: Re: [PATCH v4 2/2] xen: add (EXPERT) to one-line descriptions when
 appropriate
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefano.stabellini@xilinx.com>,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, iwj@xenproject.org,
 julien@xen.org, wl@xen.org, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.2101251321420.20638@sstabellini-ThinkPad-T480s>
 <20210125212747.26676-2-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <61899bf7-dbd0-dd38-473f-b0a88cb6e87a@suse.com>
Date: Tue, 26 Jan 2021 10:26:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210125212747.26676-2-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.01.2021 22:27, Stefano Stabellini wrote:
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -103,7 +103,7 @@ config HVM
>  	  If unsure, say Y.
>  
>  config XEN_SHSTK
> -	bool "Supervisor Shadow Stacks"
> +	bool "Supervisor Shadow Stacks (EXPERT)"
>  	depends on HAS_AS_CET_SS && EXPERT
>  	default y
>  	---help---

I agree with this addition, but I'm afraid I'm at least uncertain
about all the other ones made here, where ...

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -12,7 +12,7 @@ config CORE_PARKING
>  	bool
>  
>  config GRANT_TABLE
> -	bool "Grant table support" if EXPERT
> +	bool "Grant table support (EXPERT)" if EXPERT
>  	default y

... like e.g. here, it's only the prompt that's conditional. IOW
like with the respective uses of UNSUPPORTED in some of the Arm
changes in patch 1, especially when the option's default is "yes"
it's not the feature that is an expert one, but its turning off
is considered an expert change. Which I don't think should be
expressed this way.

Jan

