Return-Path: <SRS0=12TN=G5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 003ADC433E6
	for <xen-devel@archiver.kernel.org>; Tue, 26 Jan 2021 09:22:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8083D23104
	for <xen-devel@archiver.kernel.org>; Tue, 26 Jan 2021 09:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8083D23104
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.74677.134203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4KYe-0005eU-7a; Tue, 26 Jan 2021 09:22:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74677.134203; Tue, 26 Jan 2021 09:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4KYe-0005eN-4J; Tue, 26 Jan 2021 09:22:44 +0000
Received: by outflank-mailman (input) for mailman id 74677;
 Tue, 26 Jan 2021 09:22:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4KYc-0005eI-T4
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 09:22:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af954f1d-e2a4-4e54-bfe2-9bcb164a01cf;
 Tue, 26 Jan 2021 09:22:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 21EDFB28A;
 Tue, 26 Jan 2021 09:22:41 +0000 (UTC)
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
X-Inumbo-ID: af954f1d-e2a4-4e54-bfe2-9bcb164a01cf
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611652961; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2n908zCMUmsX5D88epOQn6BELj2i2fxn4jBnqXTdEDQ=;
	b=ErseDTWxPSXm3eQfjrnjUkJyZ1SOcMqixEuSfzgDZ0UxmlpkaeLUQIUr50tW79tdjAwAxT
	plJS9LjlBJYtsC99y8FzeWEdoKtgXQe7+d4Vt9argz5P2acl/7hMTP4Fnh2gLSLJt8+6TM
	EYAifTfkvvsigFOKmDPb6Adu3gzOT88=
Subject: Re: [PATCH v4 1/2] xen: EXPERT clean-up and introduce UNSUPPORTED
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefano.stabellini@xilinx.com>,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, iwj@xenproject.org,
 julien@xen.org, wl@xen.org, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.2101251321420.20638@sstabellini-ThinkPad-T480s>
 <20210125212747.26676-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bbdbb0d2-24d7-4e46-1303-706c6c3036c3@suse.com>
Date: Tue, 26 Jan 2021 10:22:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210125212747.26676-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.01.2021 22:27, Stefano Stabellini wrote:
> A recent thread [1] has exposed a couple of issues with our current way
> of handling EXPERT.
> 
> 1) It is not obvious that "Configure standard Xen features (expert
> users)" is actually the famous EXPERT we keep talking about on xen-devel
> 
> 2) It is not obvious when we need to enable EXPERT to get a specific
> feature
> 
> In particular if you want to enable ACPI support so that you can boot
> Xen on an ACPI platform, you have to enable EXPERT first. But searching
> through the kconfig menu it is really not clear (type '/' and "ACPI"):
> nothing in the description tells you that you need to enable EXPERT to
> get the option.
> 
> So this patch makes things easier by doing two things:
> 
> - introduce a new kconfig option UNSUPPORTED which is clearly to enable
>   UNSUPPORTED features as defined by SUPPORT.md
> 
> - change EXPERT options to UNSUPPORTED where it makes sense: keep
>   depending on EXPERT for features made for experts
> 
> - tag unsupported features by adding (UNSUPPORTED) to the one-line
>   description
> 
> - clarify the EXPERT one-line description
> 
> [1] https://marc.info/?l=xen-devel&m=160333101228981
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Non-Arm bits
Reviewed-by: Jan Beulich <jbeulich@suse.com>
However, I have questions on the Arm ones (sorry for not noticing
earlier, as I assume it was this way before already):

> @@ -77,7 +77,7 @@ config SBSA_VUART_CONSOLE
>  	  SBSA Generic UART implements a subset of ARM PL011 UART.
>  
>  config ARM_SSBD
> -	bool "Speculative Store Bypass Disable" if EXPERT
> +	bool "Speculative Store Bypass Disable (UNSUPPORTED)" if UNSUPPORTED
>  	depends on HAS_ALTERNATIVE
>  	default y
>  	help
> @@ -87,7 +87,7 @@ config ARM_SSBD
>  	  If unsure, say Y.
>  
>  config HARDEN_BRANCH_PREDICTOR
> -	bool "Harden the branch predictor against aliasing attacks" if EXPERT
> +	bool "Harden the branch predictor against aliasing attacks (UNSUPPORTED)" if UNSUPPORTED
>  	default y
>  	help
>  	  Speculation attacks against some high-performance processors rely on

Both of these default to y and have their _prompt_
conditional upon EXPERT. Which means only an expert can turn them
_off_. Which doesn't make it look like these are unsupported? Or
if anything, turning them off is unsupported?

Jan

