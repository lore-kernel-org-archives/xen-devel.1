Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871BCC55171
	for <xen-devel@archiver.kernel.org>; Sun,  2 Aug 2026 15:56:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1380929.1624618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqYXP-0004Xw-0z; Sun, 02 Aug 2026 15:55:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1380929.1624618; Sun, 02 Aug 2026 15:55:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqYXO-0004Xp-Ud; Sun, 02 Aug 2026 15:55:42 +0000
Received: by outflank-mailman (input) for mailman id 1380929;
 Sun, 02 Aug 2026 15:55:41 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wqYXN-0004Xi-4d
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 15:55:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqYXM-004wkr-31
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 17:55:40 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a6f6811-2eae-0a2a0a5409dd-0a2a4502e798-20
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 17:55:40 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a6f687a-6ca4-0a2a45020019-888fbc3352c0-3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 17:55:39 +0200
Received: by mx.zohomail.com with SMTPS id 1785686126692449.7937048040851;
 Sun, 2 Aug 2026 08:55:26 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1785686130; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=femSRGpdtG1BdsSysSvXCjllA1p3DfbD2+gwqZf5uNIuoycZlm3/bX3TcQC2dW3bokA0PEsssCvVjtVFi+0YzXjzqSym8rCp/sMbg36e7LwZu4QXwuGG42TFBtOCPA+OkCcC1AJdWrFnX3ynRJbge2zfjCClHkqa059l7s6yH6w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785686130; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ei3nv7dzYgzxJ0zw1X14Ri/+yYhgMiX6VePRG6aHTzo=; 
	b=YXmRxHxjFX8ACwZRrOppyKhrHb5RXSLVz3XMS/RLtI2Z7Nd5IK5RuHpwhp6KWU6oW93gaiFMDei2nyk/nSmBpjIU8n48v14GoDorIaN3B3Y//LT86boQQBI7z8zRIuIl9UJ+f8zJdDWUAoY/unbJds5DIPk0VTyEqc5M+YtI9Xc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785686130;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Ei3nv7dzYgzxJ0zw1X14Ri/+yYhgMiX6VePRG6aHTzo=;
	b=AohwUeyxTP2qY3/F4Xuw5AfjejshtKyhD3UD33nc4WVw73Dj/lTaG9dN8jkzo8Qm
	naXs7+2VDhJMw4WqNpPRjM0Jl9wiSFObQzum9X+dDROOZhreHilrrY6Tq+Ses/h9Ksz
	bmDeejVIsYQ3GnHLeiJ+xcI/u5TnPtcp8IQ5LVNA=
Message-ID: <4531d02a-3a37-4c57-ba17-32034ba08cf9@apertussolutions.com>
Date: Sun, 2 Aug 2026 11:55:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/24] x86/mm: get_page_from_l1e() is PV-or-shadow-only
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <07e90200-95b5-413f-9259-7f0481d36521@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <07e90200-95b5-413f-9259-7f0481d36521@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-720697/1785686140-F34BE2AC-A92D1B94/0/0
X-purgate-type: clean
X-purgate-size: 3700

On 7/28/26 9:18 AM, Jan Beulich wrote:
> Otherwise the function is unreachable, violating MISRA C:2012 rule 2.1.
> With the function compiled out, its dedicated XSM hook also becomes
> unreachable, so it is similarly guarded.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> It feels suspicious that the .priv_mapping() check is used for HVM guests
> in shadow mode, but not for ones in HAP mode.
> 


I believe a hint to it is laying in the comment,

  /*
   * Let privileged domains transfer the right to map their target
   * domain's pages. This is used to allow stub-domain pvfb export to
   * dom0, until pvfb supports granted mappings. At that time this
   * minor hack can go away.
   */

Correct me if I am wrong, but get_page_from_l1e() is only used by PV and 
HVM + Shadow. When in HVM + HAP is mapping a guest page, it is done 
through p2m_get_foreign() which will then be covered by 
xsm_map_gmfn_foreign(). So only HVM + Shadow can hit TARGET_HACK check.

I think the question is how to address the TARGET_HACK situation.

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -837,6 +837,8 @@ static int cf_check print_mmio_emul_rang
>   }
>   #endif
>   
> +#if defined(CONFIG_PV) || defined(CONFIG_SHADOW_PAGING)
> +
>   /*
>    * get_page_from_l1e returns:
>    *   0  => success (page not present also counts as such)
> @@ -1038,6 +1040,8 @@ get_page_from_l1e(
>       return -EBUSY;
>   }
>   
> +#endif /* CONFIG_PV || CONFIG_SHADOW_PAGING */
> +

Would it also not be prudent to #ifdef out the declaration in asm/mm.h?

>   /*
>    * The following flags are used to specify behavior of various get and
>    * put commands.  The first is also stored in page->partial_flags to
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -705,12 +705,14 @@ static XSM_INLINE int cf_check xsm_updat
>   
>   #endif /* CONFIG_PV */
>   
> +#if defined(CONFIG_PV) || defined(CONFIG_SHADOW_PAGING)
>   static XSM_INLINE int cf_check xsm_priv_mapping(
>       XSM_DEFAULT_ARG struct domain *d, struct domain *t)
>   {
>       XSM_ASSERT_ACTION(XSM_TARGET);
>       return xsm_default_action(action, d, t);
>   }
> +#endif
>   
>   static XSM_INLINE int cf_check xsm_ioport_permission(
>       XSM_DEFAULT_ARG struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
> --- a/xen/include/xsm/hooks.h
> +++ b/xen/include/xsm/hooks.h
> @@ -141,7 +141,9 @@ XSM_HOOK(int, mmu_update, struct domain
>   XSM_HOOK(int, mmuext_op, struct domain *, struct domain *)
>   XSM_HOOK(int, update_va_mapping, struct domain *, struct domain *, l1_pgentry_t)
>   #endif /* CONFIG_PV */
> +#if defined(CONFIG_PV) || defined(CONFIG_SHADOW_PAGING)
>   XSM_HOOK(int, priv_mapping, struct domain *, struct domain *)
> +#endif
>   XSM_HOOK(int, ioport_permission, struct domain *, uint32_t, uint32_t, uint8_t)
>   XSM_HOOK(int, ioport_mapping, struct domain *, uint32_t, uint32_t, uint8_t)
>   XSM_HOOK(int, pmu_op, struct domain *, unsigned int)
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -1828,10 +1828,12 @@ static int cf_check flask_update_va_mapp
>   
>   #endif /* CONFIG_PV */
>   
> +#if defined(CONFIG_PV) || defined(CONFIG_SHADOW_PAGING)
>   static int cf_check flask_priv_mapping(struct domain *d, struct domain *t)
>   {
>       return domain_has_perm(d, t, SECCLASS_MMU, MMU__TARGET_HACK);
>   }
> +#endif
>   
>   static int cf_check flask_pmu_op(struct domain *d, unsigned int op)
>   {
> 

I think it would be a good defensive approach to condition out the 
header declaration. Otherwise,

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>


