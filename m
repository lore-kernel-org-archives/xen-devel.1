Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F50C606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 07:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=2B2KZMnD
Received: from list by lists.xenproject.org with outflank-mailman.1458954.1671032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK9Ln-0007sA-EE; Fri, 23 Oct 2026 07:06:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458954.1671032; Fri, 23 Oct 2026 07:06:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK9Ln-0007s3-BM; Fri, 23 Oct 2026 07:06:03 +0000
Received: by outflank-mailman (input) for mailman id 1458954;
 Fri, 23 Oct 2026 07:06:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xK9Ll-0007rt-Js
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 07:06:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xK9Ll-00000009504-26RG;
 Fri, 23 Oct 2026 07:06:01 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xK9Ll-00000001CuC-0GkG;
 Fri, 23 Oct 2026 07:06:01 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=br+qS364HHKSB/jSJ6eMmP9fQ9dH7eEayqVZcTWzhdg=; b=2B2KZMnDruCZ7JUCKEWRbLpd0E
	3Kc1XFGP1wbie5f+Gs3Rf6bxc5BbEqyM6gVr5+K5F/bL1RCB4ujw3YTv8xOK1ENwOEVPahB+u8vcW
	EcA9y3f1wFPuRVWLX5ox+PDk6QpeOK+8/8j3pBfTGCWmWQr1702re3ptEGwHl25lXlRE=;
Date: Fri, 23 Oct 2026 09:05:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: George Dunlap <gwd@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v4 02/30] x86/mm: refuse to promote an L4 while the
 domain has no vCPU
Message-ID: <atsHU5ywFeNb0TlZ@Mac.lan>
References: <20261019-asi-hvm-v4-0-b68b66652266@xenproject.org>
 <20261019-asi-hvm-v4-2-b68b66652266@xenproject.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261019-asi-hvm-v4-2-b68b66652266@xenproject.org>
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 08:42:33PM +0100, George Dunlap wrote:
> init_xen_l4_slots() puts the domain's per-domain L3 in slot 260 of the
> L4s it fills.  Since fcf91ce9de66 ("x86/pv: don't populate the GDT/LDT
> L3 slot at domain creation") a PV domain gets that L3 with its first
> vCPU (pv_create_gdt_ldt_l1tab()).  Only mapcache_domain_init() makes it
> earlier, with the domain, and release builds skip that unless memory
> hotplug is enabled or the host's memory reaches past the part of the
> directmap PV guests can see.  So in release builds on most hosts, an L4
> promoted before XEN_DOMCTL_max_vcpus has created the domain's vCPUs gets
> a slot 260 entry made from a NULL page (0x803e900000000063), pointing
> far beyond the host's memory.

Won't it be more reliable long term to instead return an error from
init_xen_l4_slots() when the per-domain L3 page is not present?

It does seem like PV vCPU creation could change yet again in a way
that the per-domain L3 is not allocated there, and then the check
added in this patch will be moot.  If we need the per-domain
page-table to be allocated by this point, let's test for that, not
indirectly testing whether vCPU 0 has been created.

I also wonder, this is for PV only, but I assume for correctness
purposes we should do the same check for HVM monitor tables also?

Thanks, Roger.

