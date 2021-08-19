Return-Path: <SRS0=TguT=NK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71BEEC432BE
	for <xen-devel@archiver.kernel.org>; Thu, 19 Aug 2021 17:26:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B6AA6023D
	for <xen-devel@archiver.kernel.org>; Thu, 19 Aug 2021 17:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B6AA6023D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.169006.308698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGloE-0002RG-Eb; Thu, 19 Aug 2021 17:26:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169006.308698; Thu, 19 Aug 2021 17:26:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGloE-0002R9-Bf; Thu, 19 Aug 2021 17:26:30 +0000
Received: by outflank-mailman (input) for mailman id 169006;
 Thu, 19 Aug 2021 17:26:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGloC-0002Qz-Vc
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 17:26:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGloC-0005LV-Tl
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 17:26:28 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGloC-0007qt-Ss
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 17:26:28 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mGlo8-0002Td-25; Thu, 19 Aug 2021 18:26:24 +0100
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=BxlUTqQy1yJjFFwoI2PJ6s0WmdJI+g8nOLKxA2htUt4=; b=MlHxo69742594POU5LyMH66f6W
	hDip1zfA3/kyiJzszTVM4RKi3iVkleSIOwSal7poLYseUXMAMFCt3IyhDAqgeOBCHvyZhh3YRMpml
	HBbIhXPaDExLqlCDp2UqloRMu/yTnwTgY5oeWAEozOwe3xQhNtWRX+5eujMHSOk9mCBE=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24862.37951.763056.429447@mariner.uk.xensource.com>
Date: Thu, 19 Aug 2021 18:26:23 +0100
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jane Malalane <jane.malalane@citrix.com>,
    Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] libs/guest: Move the guest ABI check earlier into
 xc_dom_parse_image()
In-Reply-To: <51d8928b-34cc-d74c-4833-a7124d61a7cb@citrix.com>
References: <20210817151924.6674-1-jane.malalane@citrix.com>
	<51d8928b-34cc-d74c-4833-a7124d61a7cb@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: [PATCH] libs/guest: Move the guest ABI check earlier into xc_dom_parse_image()"):
> On 17/08/2021 16:19, Jane Malalane wrote:
> > Xen may not support 32-bit PV guest for a number of reasons (lack of
> > CONFIG_PV32, explicit pv=no-32 command line argument, or implicitly
> > due to CET being enabled) and advertises this to the toolstack via the
> > absence of xen-3.0-x86_32p ABI.
> >
> > Currently, when trying to boot a 32-bit PV guest, the ABI check is too
> > late and the build explodes in the following manner yielding an
> > unhelpful error message:
> >
> >   xc: error: panic: xg_dom_boot.c:121: xc_dom_boot_mem_init: can't allocate low memory for domain: Out of memory
> >   libxl: error: libxl_dom.c:586:libxl__build_dom: xc_dom_boot_mem_init failed: Operation not supported
> >   libxl: error: libxl_create.c:1573:domcreate_rebuild_done: Domain 1:cannot (re-)build domain: -3
> >   libxl: error: libxl_domain.c:1182:libxl__destroy_domid: Domain 1:Non-existant domain
> >   libxl: error: libxl_domain.c:1136:domain_destroy_callback: Domain 1:Unable to destroy guest
> >   libxl: error: libxl_domain.c:1063:domain_destroy_cb: Domain 1:Destruction of domain failed
> >
> > Move the ABI check earlier into xc_dom_parse_image() along with other
> > ELF-note feature checks.  With this adjustment, it now looks like
> > this:
> >
> >   xc: error: panic: xg_dom_boot.c:88: xc_dom_compat_check: guest type xen-3.0-x86_32p not supported by xen kernel, sorry: Invalid kernel
> >   libxl: error: libxl_dom.c:571:libxl__build_dom: xc_dom_parse_image failed
> >   domainbuilder: detail: xc_dom_release: called
> >   libxl: error: libxl_create.c:1573:domcreate_rebuild_done: Domain 11:cannot (re-)build domain: -3
> >   libxl: error: libxl_domain.c:1182:libxl__destroy_domid: Domain 11:Non-existant domain
> >   libxl: error: libxl_domain.c:1136:domain_destroy_callback: Domain 11:Unable to destroy guest
> >   libxl: error: libxl_domain.c:1063:domain_destroy_cb: Domain 11:Destruction of domain failed
> >
> > Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
> 
> FWIW, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> The net behaviour of `xl create` is still not great (the -3 in
> particular is ESRCH looking for qemu which isn't remotely relevant), but
> at least with this change, you get "guest type xen-3.0-x86_32p not
> supported by xen" out of libxc which is the root cause of the failure.

Acked-by: Ian Jackson <iwj@xenproject.org>

