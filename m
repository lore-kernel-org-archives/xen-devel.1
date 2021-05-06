Return-Path: <SRS0=KcDw=KB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99966C433ED
	for <xen-devel@archiver.kernel.org>; Thu,  6 May 2021 13:09:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46AA2610EA
	for <xen-devel@archiver.kernel.org>; Thu,  6 May 2021 13:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46AA2610EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.123517.232957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ledl5-0007M5-51; Thu, 06 May 2021 13:09:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123517.232957; Thu, 06 May 2021 13:09:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ledl5-0007Ly-2A; Thu, 06 May 2021 13:09:39 +0000
Received: by outflank-mailman (input) for mailman id 123517;
 Thu, 06 May 2021 13:09:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EnkQ=KB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ledl3-0007Ls-Io
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 13:09:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ab39dffb-6bf9-4a90-9513-ba8c7dd6bb01;
 Thu, 06 May 2021 13:09:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9CC25AE39;
 Thu,  6 May 2021 13:09:35 +0000 (UTC)
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
X-Inumbo-ID: ab39dffb-6bf9-4a90-9513-ba8c7dd6bb01
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620306575; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HY+Dmj9Nv1eHRXrLW69Mj3Wx9sD2RlBHWbfeyc7i/wY=;
	b=TeWCR5omn409NuJ3KxhPf9MgweeMukJ49BbF8dFQG/oTF6eKItFGh7gQg+vuoFp2xIE/+v
	Hl+xYtLBve933/Tu8Rzaqo8JUMkP1QcBateBqot6h1qOsdQLejapvBHTnmtW9WF3II9vI8
	Gx9TmbR9yI4y5pFzfAIj4mTiJA/P3VU=
Subject: Re: [PATCH v2] SUPPORT.md: Un-shimmed 32-bit PV guests are no longer
 supported
To: George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jann Horn <jannh@google.com>
References: <20210506124752.65844-1-george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <acd695c1-dc04-4606-5212-5fd993e355b1@suse.com>
Date: Thu, 6 May 2021 15:09:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210506124752.65844-1-george.dunlap@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06.05.2021 14:47, George Dunlap wrote:
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -55,7 +55,7 @@ config PV
>  config PV32
>  	bool "Support for 32bit PV guests"
>  	depends on PV
> -	default y
> +	default PV_SHIM
>  	select COMPAT
>  	---help---
>  	  The 32bit PV ABI uses Ring1, an area of the x86 architecture which
> @@ -67,7 +67,10 @@ config PV32
>  	  reduction, or performance reasons.  Backwards compatibility can be
>  	  provided via the PV Shim mechanism.
>  
> -	  If unsure, say Y.
> +	  Note that outside of PV Shim, 32-bit PV guests are not security
> +	  supported anymore.
> +
> +	  If unsure, use the default setting.

Alongside this I wonder whether we should also default opt_pv32 to false
then, unless running in shim mode.

Jan

