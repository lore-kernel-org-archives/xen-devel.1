Return-Path: <SRS0=S1vZ=DZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF7F9C433DF
	for <xen-devel@archiver.kernel.org>; Sun, 18 Oct 2020 19:01:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B4F322264
	for <xen-devel@archiver.kernel.org>; Sun, 18 Oct 2020 19:01:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qhWiWAYm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B4F322264
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.8550.22831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUDuk-0007As-Ax; Sun, 18 Oct 2020 19:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8550.22831; Sun, 18 Oct 2020 19:00:18 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUDuk-0007Al-7k; Sun, 18 Oct 2020 19:00:18 +0000
Received: by outflank-mailman (input) for mailman id 8550;
 Sun, 18 Oct 2020 19:00:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I16y=DZ=infradead.org=willy@srs-us1.protection.inumbo.net>)
 id 1kUDui-0007Ag-0P
 for xen-devel@lists.xenproject.org; Sun, 18 Oct 2020 19:00:17 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a83ab8c-2f22-4553-874c-7741e9241a5b;
 Sun, 18 Oct 2020 19:00:11 +0000 (UTC)
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kUDuB-0007Wk-NT; Sun, 18 Oct 2020 18:59:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=I16y=DZ=infradead.org=willy@srs-us1.protection.inumbo.net>)
	id 1kUDui-0007Ag-0P
	for xen-devel@lists.xenproject.org; Sun, 18 Oct 2020 19:00:17 +0000
X-Inumbo-ID: 5a83ab8c-2f22-4553-874c-7741e9241a5b
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5a83ab8c-2f22-4553-874c-7741e9241a5b;
	Sun, 18 Oct 2020 19:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=q0BhqrN3gbd6Z80uxUuHxnuOGNa3MQpvn/ujKpbjoKc=; b=qhWiWAYm9fZ2KNDR/Yk3WeXFl4
	HF2RciAjYHBQMCf3sjKhvFkXSfibnOaNYa7rSxO4GAjMdOb5lKFie8w5W48ySlrw8CCYSSnOZO0Xg
	5v+vzHZ7K/VxCxY2aBAso6UvZLXpaapi00aBgR18RXogoXyWfK3p9m9265NrgW55bmABmFf/ljB+D
	9Af5uL1UZOzL5n8T3eza+cGiO5HDs2I27gnorvuwnA1XSsP05jdLks+n6C8PrE6p/2IOOkRu9s0Qf
	2gQIITEDGF8BYWCD3hQsOGqb9beW/Q62vFU/IQef0kDvAQTCEweywjgtWsVjiKxR3wbF0iuVRtPwK
	m1h79KbA==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUDuB-0007Wk-NT; Sun, 18 Oct 2020 18:59:43 +0000
Date: Sun, 18 Oct 2020 19:59:43 +0100
From: Matthew Wilcox <willy@infradead.org>
To: trix@redhat.com
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	clang-built-linux@googlegroups.com, linux-iio@vger.kernel.org,
	nouveau@lists.freedesktop.org, storagedev@microchip.com,
	dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, keyrings@vger.kernel.org,
	linux-mtd@lists.infradead.org, ath10k@lists.infradead.org,
	MPT-FusionLinux.pdl@broadcom.com,
	linux-stm32@st-md-mailman.stormreply.com,
	usb-storage@lists.one-eyed-alien.net,
	linux-watchdog@vger.kernel.org, devel@driverdev.osuosl.org,
	linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-nvdimm@lists.01.org, amd-gfx@lists.freedesktop.org,
	linux-acpi@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
	industrypack-devel@lists.sourceforge.net, linux-pci@vger.kernel.org,
	spice-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-nfc@lists.01.org,
	linux-pm@vger.kernel.org, linux-can@vger.kernel.org,
	linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-amlogic@lists.infradead.org,
	openipmi-developer@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org,
	patches@opensource.cirrus.com, bpf@vger.kernel.org,
	ocfs2-devel@oss.oracle.com, linux-power@fi.rohmeurope.com
Subject: Re: [Ocfs2-devel] [RFC] treewide: cleanup unreachable breaks
Message-ID: <20201018185943.GM20115@casper.infradead.org>
References: <20201017160928.12698-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201017160928.12698-1-trix@redhat.com>

On Sat, Oct 17, 2020 at 09:09:28AM -0700, trix@redhat.com wrote:
> clang has a number of useful, new warnings see
> https://urldefense.com/v3/__https://clang.llvm.org/docs/DiagnosticsReference.html__;!!GqivPVa7Brio!Krxz78O3RKcB9JBMVo_F98FupVhj_jxX60ddN6tKGEbv_cnooXc1nnBmchm-e_O9ieGnyQ$ 

Please get your IT department to remove that stupidity.  If you can't,
please send email from a non-Red Hat email address.

I don't understand why this is a useful warning to fix.  What actual
problem is caused by the code below?

> return and break
> 
>  	switch (c->x86_vendor) {
>  	case X86_VENDOR_INTEL:
>  		intel_p5_mcheck_init(c);
>  		return 1;
> -		break;

Sure, it's unnecessary, but it's not masking a bug.  It's not unclear.
Why do we want to enable this warning?


