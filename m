Return-Path: <SRS0=5oJc=HV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9938C433DB
	for <xen-devel@archiver.kernel.org>; Fri, 19 Feb 2021 16:59:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 763F06024A
	for <xen-devel@archiver.kernel.org>; Fri, 19 Feb 2021 16:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 763F06024A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.87001.163856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD97W-0004X9-Fg; Fri, 19 Feb 2021 16:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87001.163856; Fri, 19 Feb 2021 16:59:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD97W-0004X2-Cb; Fri, 19 Feb 2021 16:59:10 +0000
Received: by outflank-mailman (input) for mailman id 87001;
 Fri, 19 Feb 2021 16:59:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TOKe=HV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lD97U-0004Wx-B0
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 16:59:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c6d8442-b99e-46c0-b691-6267cd3f6abc;
 Fri, 19 Feb 2021 16:59:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C9219ABAE;
 Fri, 19 Feb 2021 16:59:06 +0000 (UTC)
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
X-Inumbo-ID: 9c6d8442-b99e-46c0-b691-6267cd3f6abc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613753946; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/41fLRFKZgMwwDxZ8eIofzB3e4gTmyzT+VBjdn1TFZg=;
	b=S2XvL8JLpeQxjJVY+ZuY5HAl6XDfgAVlGLYRdTgVAebhlr67uTLeqVcBJGYc7SU6UkNMKc
	J1m/ecfAHz2nTLGP5vp/ojLMt4N80LGuutUFsc/Ld7SjzMIpExFff7+WCxOomVKPwIAHaX
	7TpZ9eIPCS0njFlrRsiOt5dOUIn68qo=
Subject: Re: [PATCH v2] VMX: use a single, global APIC access page
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <a895386d-db14-2743-d8f9-09f9509a510a@suse.com>
Message-ID: <dcada8be-a91d-87f0-c579-30f3c7e3607e@suse.com>
Date: Fri, 19 Feb 2021 17:59:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <a895386d-db14-2743-d8f9-09f9509a510a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.02.2021 17:45, Jan Beulich wrote:
> The address of this page is used by the CPU only to recognize when to
> access the virtual APIC page instead. No accesses would ever go to this
> page. It only needs to be present in the (CPU) page tables so that
> address translation will produce its address as result for respective
> accesses.
> 
> By making this page global, we also eliminate the need to refcount it,
> or to assign it to any domain in the first place.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Avoid insertion when !has_vlapic(). Split off change to
>     p2m_get_iommu_flags().
> ---
> Hooking p2m insertion onto arch_domain_creation_finished() isn't very
> nice, but I couldn't find any better hook (nor a good place where to
> introduce a new one). In particular there look to be no hvm_funcs hooks
> being used on a domain-wide basis (except for init/destroy of course).
> I did consider connecting this to the setting of HVM_PARAM_IDENT_PT, but
> considered this no better, the more that the tool stack could be smarter
> and avoid setting that param when not needed.

While this patch was triggered not just by Julien's observation of
the early p2m insertion being a problem, but also many earlier
times of running into this odd code, it is - especially at this
stage - perhaps a possible option to split the change into just
the movement of the set_mmio_p2m_entry() invocation and all the
rest, in order to defer that rest until after 4.15.

Jan

