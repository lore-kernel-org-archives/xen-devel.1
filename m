Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB2FC55175
	for <xen-devel@archiver.kernel.org>; Sun,  2 Aug 2026 14:59:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1380872.1624574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqXeQ-0001lo-UU; Sun, 02 Aug 2026 14:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1380872.1624574; Sun, 02 Aug 2026 14:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqXeQ-0001lf-RQ; Sun, 02 Aug 2026 14:58:54 +0000
Received: by outflank-mailman (input) for mailman id 1380872;
 Sun, 02 Aug 2026 14:58:52 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wqXeO-0001kH-OI
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 14:58:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqXeO-00EkCO-3x
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 16:58:52 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a6f5aa6-e002-0a2a0a5209dd-0a2a4504e618-40
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 16:58:52 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a6f5b2a-b57f-0a2a45040019-888fbc33528f-3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 16:58:51 +0200
Received: by mx.zohomail.com with SMTPS id 1785682725347102.55751453144865;
 Sun, 2 Aug 2026 07:58:45 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=zoho header.d=apertussolutions.com header.i="dpsmith@apertussolutions.com" header.h="Message-ID:Date:MIME-Version:Subject:To:From:In-Reply-To:Content-Type:Content-Transfer-Encoding"
ARC-Seal: i=1; a=rsa-sha256; t=1785682729; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=B19UDRc0SzbXVQDRZUNSVL4UsnJxj34lfr68VKa7JyhXd0TNQYun/s3jYF4VXnpKTCQ298mxoh8s7PhIhI0vfl/zOLSDJA0m5/LPjdAJyhSrMsAIEN2+LujRCZfUg+6j7xCHEekoLHi8sCvKI9aJ6inRlwihu7h1z2NAf/r3uOw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785682729; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=REvUedEfGalwFIovbtEDV+JDqejvcYhtg35ytkXdVpc=; 
	b=iut2fLazBw/vKWIM5I+TY18Yoy84paB96TVtRakN770ciFdsypzWbjrbJTc9DdrZ29G+tN/ruASZ1B6el+fpfddG8oxGDmDhu6/AXFvW9eD3mVY72QgXnDMUHjfZiRFcgPfgAlaWACDLcJxuhpp6eZpMpAHofQBOpXT8ulQIJMw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785682729;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=REvUedEfGalwFIovbtEDV+JDqejvcYhtg35ytkXdVpc=;
	b=fTt9kgy9TUpKvDiOzOYS6va+k7lu7zY6vL+qX4HSNeajG6dip+6qDbayCJjkAG32
	BJuY/aoKYYHZaosQgYn744Vh/LVtlOVVqV9suqMpZuUH5rmySNQyRGNb775jlDJ7WVl
	PZeWxb+6z15ZYjbdm1htD5VnScTqrrSD10PLnNaA=
Message-ID: <2eb2dc6c-6a12-4f62-9966-2945c7468ad8@apertussolutions.com>
Date: Sun, 2 Aug 2026 10:58:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/24] XSM: make .hvm_altp2mhvm_op() hook dependent upon
 ALTP2M=y
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <5250093e-174f-4d2d-b19b-95a314b38469@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <5250093e-174f-4d2d-b19b-95a314b38469@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-ebf023/1785682732-51ED6B50-40D95FD7/0/0
X-purgate-type: clean
X-purgate-size: 1892

On 7/28/26 9:16 AM, Jan Beulich wrote:
> It's unreachable / dead otherwise.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -583,6 +583,7 @@ static XSM_INLINE int cf_check xsm_hvm_p
>       return xsm_default_action(action, current->domain, d);
>   }
>   
> +#ifdef CONFIG_ALTP2M
>   static XSM_INLINE int cf_check xsm_hvm_altp2mhvm_op(
>       XSM_DEFAULT_ARG struct domain *d, uint64_t mode, uint32_t op)
>   {
> @@ -602,6 +603,7 @@ static XSM_INLINE int cf_check xsm_hvm_a
>           return -EPERM;
>       }
>   }
> +#endif /* CONFIG_ALTP2M */
>   
>   #ifdef CONFIG_VM_EVENT
>   static XSM_INLINE int cf_check xsm_mem_access(XSM_DEFAULT_ARG struct domain *d)
> --- a/xen/include/xsm/hooks.h
> +++ b/xen/include/xsm/hooks.h
> @@ -106,7 +106,11 @@ XSM_HOOK(int, hypfs_op)
>   
>   XSM_HOOK(int, hvm_param, struct domain *, unsigned long)
>   XSM_HOOK(int, hvm_param_altp2mhvm, struct domain *)
> +
> +#ifdef CONFIG_ALTP2M
>   XSM_HOOK(int, hvm_altp2mhvm_op, struct domain *, uint64_t, uint32_t)
> +#endif
> +
>   XSM_HOOK(int, get_vnumainfo, struct domain *)
>   
>   #ifdef CONFIG_VM_EVENT
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -1393,6 +1393,7 @@ static int cf_check flask_hvm_param_altp
>       return current_has_perm(d, SECCLASS_HVM, HVM__ALTP2MHVM);
>   }
>   
> +#ifdef CONFIG_ALTP2M
>   static int cf_check flask_hvm_altp2mhvm_op(struct domain *d, uint64_t mode, uint32_t op)
>   {
>       /*
> @@ -1416,6 +1417,7 @@ static int cf_check flask_hvm_altp2mhvm_
>   
>       return current_has_perm(d, SECCLASS_HVM, HVM__ALTP2MHVM_OP);
>   }
> +#endif /* CONFIG_ALTP2M */
>   
>   #ifdef CONFIG_VM_EVENT
>   static int cf_check flask_mem_access(struct domain *d)
> 

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

