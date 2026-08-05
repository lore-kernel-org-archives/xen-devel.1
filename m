Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42737C55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 22:42:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383946.1627040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrkK0-0004IO-58; Wed, 05 Aug 2026 22:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383946.1627040; Wed, 05 Aug 2026 22:42:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrkK0-0004IH-1F; Wed, 05 Aug 2026 22:42:48 +0000
Received: by outflank-mailman (input) for mailman id 1383946;
 Wed, 05 Aug 2026 22:42:47 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wrkJz-0004IA-6w
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 22:42:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrkJx-00GIdT-Vw
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 00:42:45 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a73bc64-2eae-0a2a0a5409dd-0a2a450b81b2-4
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 00:42:45 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a73bc64-b7e8-0a2a450b0019-888fbc335273-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 00:42:45 +0200
Received: by mx.zohomail.com with SMTPS id 1785969752886426.49762714455005;
 Wed, 5 Aug 2026 15:42:32 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=zoho header.d=apertussolutions.com header.i="dpsmith@apertussolutions.com" header.h="Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:Content-Type:Content-Transfer-Encoding"
ARC-Seal: i=1; a=rsa-sha256; t=1785969756; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OtjRAeOB3W63X7nJO+6k23SAistada/5vTpF/PZIMtgwD0YaABmYuUFYNVKXvyjtj+v4i0gHXlWU7sa7o3/fssc1cGFO0grBBW1JO4csYdGIEwYQgRGmWhxHHVktQ4mbOE8TEvT008gqkc20LumRDKHW2/n4BXRJ1bOKABumwU8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785969756; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lruKykF7Bez3AHxlAg46tPNe7nOSsS4PSeVZZpQY56U=; 
	b=SUs/P0uuFq+gnC2gKkL2KfEZF9eLXnAQiHvjmv7tVVL4t3B016Sc6QzrT3Q3es5Y3AUeqqU++Mt221etNFzIgf1LXOe0V5wuizGE8/1UeXgx8i4GIVU2+XVECsKEXr3PM4q2weadv0A0uZ6WZ4PnD+3b+Pc8QhtBRz6rzWlWJXM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785969756;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=lruKykF7Bez3AHxlAg46tPNe7nOSsS4PSeVZZpQY56U=;
	b=GClTKLDY4y3an7YY3lUOwM//tackaflunC+/xBpeSNvDPPNtwEPjNSJMHBEO1fJ8
	W11o17NJBMs0lRsijG0OfCzyHQDVd3JI/qTp6YbtgvSR8AC9xSlGE7GFUOhjiVNxOCf
	cBbga1ufKeBK/7iTE2VYHhQB/sstHRZ8jGF6r4Go=
Message-ID: <e93eab10-7c96-4898-a5f6-8ced35a72bd2@apertussolutions.com>
Date: Wed, 5 Aug 2026 18:42:36 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/24] XSM: suppress hypercall when XSM=n
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <b533ed9f-1ea8-4d27-8420-2159ccd27cc8@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <b533ed9f-1ea8-4d27-8420-2159ccd27cc8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-42698a/1785969765-AB8D19EA-98C82AB8/0/0
X-purgate-type: clean
X-purgate-size: 3089

On 7/28/26 9:20 AM, Jan Beulich wrote:
> This can be easily done in hypercall-defs.c, thus avoiding the need to
> dive into xsm/ when building Xen, just to add code which does what is done
> for an absent hypercall handler anyway (returning -ENOSYS).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -458,7 +458,7 @@ CFLAGS += -I$(objtree)/arch/$(SRCARCH)/i
>   ALL_OBJS-y                := common/built_in.o
>   ALL_OBJS-y                += drivers/built_in.o
>   ALL_OBJS-y                += lib/built_in.o
> -ALL_OBJS-y                += xsm/built_in.o
> +ALL_OBJS-$(CONFIG_XSM)    += xsm/built_in.o
>   ALL_OBJS-y                += arch/$(SRCARCH)/built_in.o
>   ALL_OBJS-$(CONFIG_CRYPTO) += crypto/built_in.o
>   
> --- a/xen/include/hypercall-defs.c
> +++ b/xen/include/hypercall-defs.c
> @@ -119,7 +119,9 @@ prefix: do PREFIX_compat
>   xen_version(int cmd, void *arg)
>   vcpu_op(int cmd, unsigned int vcpuid, void *arg)
>   sched_op(int cmd, void *arg)
> +#ifdef CONFIG_XSM
>   xsm_op(void *op)
> +#endif
>   callback_op(int cmd, const void *arg)
>   #ifdef CONFIG_ARGO
>   argo_op(unsigned int cmd, void *arg1, void *arg2, unsigned long arg3, unsigned long arg4)
> @@ -264,7 +266,9 @@ set_segment_base                   do:2
>   #ifdef CONFIG_PV
>   mmuext_op                          compat:2 do:2     compat   do       -
>   #endif
> +#ifdef CONFIG_XSM
>   xsm_op                             compat   do       compat   do       do
> +#endif
>   nmi_op                             compat   do       -        -        -
>   sched_op                           compat   do       compat   do       do
>   callback_op                        compat   do       -        -        -
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -437,6 +437,8 @@ static XSM_INLINE int xsm_hypfs_op(XSM_D
>   }
>   #endif
>   
> +#ifdef CONFIG_XSM
> +
>   static XSM_INLINE long xsm_do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
>   {
>       return -ENOSYS;
> @@ -449,6 +451,8 @@ static XSM_INLINE int xsm_do_compat_op(X
>   }
>   #endif
>   
> +#endif /* CONFIG_XSM */
> +
>   static XSM_INLINE char *xsm_show_irq_sid(int irq)
>   {
>       return NULL;
> --- a/xen/xsm/Makefile
> +++ b/xen/xsm/Makefile
> @@ -1,6 +1,6 @@
>   obj-y += xsm_core.o
> -obj-$(CONFIG_XSM) += xsm_policy.o
> -obj-$(CONFIG_XSM) += dummy.o
> +obj-y += xsm_policy.o
> +obj-y += dummy.o
>   obj-$(CONFIG_XSM_SILO) += silo.o
>   
>   obj-$(CONFIG_XSM_FLASK) += flask/
> --- a/xen/xsm/xsm_core.c
> +++ b/xen/xsm/xsm_core.c
> @@ -18,8 +18,6 @@
>   #include <xen/hypercall.h>
>   #include <xsm/xsm.h>
>   
> -#ifdef CONFIG_XSM
> -
>   #ifdef CONFIG_MULTIBOOT
>   #include <asm/bootinfo.h>
>   #include <asm/setup.h>
> @@ -216,8 +214,6 @@ bool __init has_xsm_magic(paddr_t start)
>   }
>   #endif
>   
> -#endif
> -
>   long do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
>   {
>       return xsm_do_xsm_op(op);
> 

Acked-by: Daniel P. Smith <dpsmith@apertussolution.com>

