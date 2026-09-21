Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7405C982DE
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 08:54:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427174.1649798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8Zmg-0002Kq-5c; Mon, 21 Sep 2026 08:53:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427174.1649798; Mon, 21 Sep 2026 08:53:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8Zmg-0002Kj-32; Mon, 21 Sep 2026 08:53:58 +0000
Received: by outflank-mailman (input) for mailman id 1427174;
 Mon, 21 Sep 2026 08:53:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x8Zmf-0002Kd-Bd
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 08:53:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x8Zmd-008rqg-2i;
 Mon, 21 Sep 2026 08:53:56 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x8Zme-002r2m-0y;
 Mon, 21 Sep 2026 08:53:56 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=j9P5IzcnsxyRAqDpvNcnpBgNxEYwl4pMZd6R+JZ9D/4=; b=r19DQLbGWTcCMulgr2xxfE+TM/
	lNBxVn9zBF7oojKwuuP3Jptv4iTyKBjhz1Hkch38vbuutb6KQ0KD7Z7gelexyIlit+WAL7LIfwpPB
	lbK9XglMAU5MQlEqKZjEcKxuQ0UtYJ1vmGwC+6CRLS0bLhfSUISiq0lo08BM922JsXdE=;
Date: Mon, 21 Sep 2026 10:53:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 1/4] x86/pagewalk: avoid ACCESS_ONCE() in compound
 literals
Message-ID: <arDwnYVNISIAey3B@macbook.local>
References: <db6f62c4-0631-43d0-a501-9667af6242ec@suse.com>
 <efc7a7ef-c22b-4b7d-ab5c-88dcca19f76b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <efc7a7ef-c22b-4b7d-ab5c-88dcca19f76b@suse.com>

On Thu, Sep 03, 2026 at 01:51:28PM +0200, Jan Beulich wrote:
> Compound literals are also covered by Misra C:2012 rule 13.1
> ("Initializer lists shall not contain persistent side effects"), and
> (sadly?) that rule also applies to lists with just a single element, or
> more generally with just a single side effect. Use intermediate variables
> to overcome this as well as ACCESS_ONCE()'s restriction to be usable on
> scalar types only.
> 
> No functional change intended.
> 
> Fixes: 0345b835dc97 ("x86/pagewalk: Read guest PTEs with ACCESS_ONCE()")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/mm/guest_walk.c
> +++ b/xen/arch/x86/mm/guest_walk.c
> @@ -129,7 +129,9 @@ guest_walk_tables(const struct vcpu *v,
>              guest_l4_table_offset(va) * sizeof(gw->l4e);
>      if ( !hvmemul_read_cache(v, l4gpa, &gw->l4e, sizeof(gw->l4e)) )
>      {
> -        gw->l4e = (guest_l4e_t){ ACCESS_ONCE(l4p[guest_l4_table_offset(va)].l4) };
> +        guest_intpte_t l4e = ACCESS_ONCE(l4p[guest_l4_table_offset(va)].l4);
> +
> +        gw->l4e = (guest_l4e_t){ l4e };

Did you consider using the l4e_from_intpte() and similar helpers here
and below?

Thanks, Roger.

