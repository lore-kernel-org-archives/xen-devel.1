Return-Path: <SRS0=fknR=JX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E4AC433ED
	for <xen-devel@archiver.kernel.org>; Mon, 26 Apr 2021 07:49:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA7BF608FC
	for <xen-devel@archiver.kernel.org>; Mon, 26 Apr 2021 07:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA7BF608FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.117479.223400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lavzZ-0006Em-P0; Mon, 26 Apr 2021 07:49:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117479.223400; Mon, 26 Apr 2021 07:49:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lavzZ-0006Ef-Lt; Mon, 26 Apr 2021 07:49:17 +0000
Received: by outflank-mailman (input) for mailman id 117479;
 Mon, 26 Apr 2021 07:49:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+oD=JX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lavzY-0006Ea-CQ
 for xen-devel@lists.xenproject.org; Mon, 26 Apr 2021 07:49:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c2fc105-64e5-429a-9c02-0b7d03a9dbee;
 Mon, 26 Apr 2021 07:49:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8AAECB005;
 Mon, 26 Apr 2021 07:49:14 +0000 (UTC)
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
X-Inumbo-ID: 3c2fc105-64e5-429a-9c02-0b7d03a9dbee
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619423354; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q6Z72miestu9ihm0WvJW4RRO+RGPuGjuzeLPySU/wqc=;
	b=OR88A73DBSRXH32WiuIQ4bxGU27R4iJI5c5n2OCdK6heV0mFSL/3LDqt6KJMUWZcvFSHB8
	vdBMLga/14TczSoLLPGC8JBf4El2tWkSxU22viBdUXes2VGUXxKlv77xjDxMTc1EMG97Aa
	DzUBrOZGT7+qOJE3bQkEgjkEVIoshaY=
Subject: Re: [PATCH v2] x86/oprofile: remove compat accessors usage from
 backtrace
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210423143755.12189-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e2f1f3a6-ca54-7459-c60e-ff02e6857b17@suse.com>
Date: Mon, 26 Apr 2021 09:49:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210423143755.12189-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23.04.2021 16:37, Roger Pau Monne wrote:
> Remove the unneeded usage of the compat layer to copy frame pointers
> from guest address space. Instead just use raw_copy_from_guest.
> 
> While there drop the checks for the accessibility of one struct
> frame_head beyond the current one: it's not clear why it's needed and
> all the hypnoses point to dropping such check being harmless. The

DYM "hypotheses"?

> worse that could happen is that a failure happens later if data past
> frame_head is attempted to be fetched, albeit I'm not able to spot any
> such access.
> 
> Also drop the explicit truncation of the head pointer in the 32bit
> case as all callers already pass a zero extended value. The first
> value being rsp from the guest registers,

While I know I'm guilty of splitting hair saying so, I'd like to point
out that I'm unaware of guarantees that the upper halves of GPRs are
zero after a switch from compat to 64-bit mode. With this I'm also
unconvinced there are guarantees that the %rsp stored into a stack
frame is actually guaranteed to be zero-extended. Nevertheless I'm not
meaning this remark to keep the change from going in as is - for all
practical purposes what you say is presumably true.

What I would consider nice though is if the two remaining if() could
be corrected for coding style: Adjacent code is already inconsistent,
so taking the opportunity to move it a little in the right direction
would seem desirable to me. (I would suggest doing so myself while
committing, but because I don't fully agree with dropping the 2-frame
checks described further up without properly understanding why they're
there, I'd like to not put my name on this change in any way, not even
just as committer. But I guess Andrew or Wei or whoever ends up
committing this could do so, as long as they agree of course.)

Jan

> and further calls will use ebp from frame_head_32bit struct.
> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> Changes since v2:
>  - Expand commit message.
> ---
>  xen/arch/x86/oprofile/backtrace.c | 26 +++-----------------------
>  1 file changed, 3 insertions(+), 23 deletions(-)
> 
> diff --git a/xen/arch/x86/oprofile/backtrace.c b/xen/arch/x86/oprofile/backtrace.c
> index bd5d1b0f6ce..45f7fb65fa2 100644
> --- a/xen/arch/x86/oprofile/backtrace.c
> +++ b/xen/arch/x86/oprofile/backtrace.c
> @@ -20,7 +20,6 @@ struct __packed frame_head {
>      unsigned long ret;
>  };
>  typedef struct frame_head frame_head_t;
> -DEFINE_XEN_GUEST_HANDLE(frame_head_t);
>  
>  struct __packed frame_head_32bit {
>      uint32_t ebp;
> @@ -43,7 +42,6 @@ dump_hypervisor_backtrace(struct vcpu *vcpu, const struct frame_head *head,
>      return head->ebp;
>  }
>  
> -#ifdef CONFIG_COMPAT
>  static inline int is_32bit_vcpu(struct vcpu *vcpu)
>  {
>      if (is_hvm_vcpu(vcpu))
> @@ -51,7 +49,6 @@ static inline int is_32bit_vcpu(struct vcpu *vcpu)
>      else
>          return is_pv_32bit_vcpu(vcpu);
>  }
> -#endif
>  
>  static struct frame_head *
>  dump_guest_backtrace(struct vcpu *vcpu, const struct frame_head *head,
> @@ -59,34 +56,17 @@ dump_guest_backtrace(struct vcpu *vcpu, const struct frame_head *head,
>  {
>      frame_head_t bufhead;
>  
> -#ifdef CONFIG_COMPAT
>      if ( is_32bit_vcpu(vcpu) )
>      {
> -        DEFINE_COMPAT_HANDLE(frame_head32_t);
> -        __compat_handle_const_frame_head32_t guest_head =
> -            { .c = (unsigned long)head };
>          frame_head32_t bufhead32;
>  
> -        /* Also check accessibility of one struct frame_head beyond */
> -        if (!compat_handle_okay(guest_head, 2))
> -            return 0;
> -        if (__copy_from_compat(&bufhead32, guest_head, 1))
> +        if (raw_copy_from_guest(&bufhead32, head, sizeof(bufhead32)))
>              return 0;
>          bufhead.ebp = (struct frame_head *)(unsigned long)bufhead32.ebp;
>          bufhead.ret = bufhead32.ret;
>      }
> -    else
> -#endif
> -    {
> -        XEN_GUEST_HANDLE_PARAM(const_frame_head_t) guest_head =
> -            const_guest_handle_from_ptr(head, frame_head_t);
> -
> -        /* Also check accessibility of one struct frame_head beyond */
> -        if (!guest_handle_okay(guest_head, 2))
> -            return 0;
> -        if (__copy_from_guest(&bufhead, guest_head, 1))
> -            return 0;
> -    }
> +    else if (raw_copy_from_guest(&bufhead, head, sizeof(bufhead)))
> +        return 0;
>      
>      if (!xenoprof_add_trace(vcpu, bufhead.ret, mode))
>          return 0;
> 


