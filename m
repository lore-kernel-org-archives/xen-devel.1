Return-Path: <SRS0=vb+Z=HG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F517C433E0
	for <xen-devel@archiver.kernel.org>; Thu,  4 Feb 2021 11:39:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EAE664F44
	for <xen-devel@archiver.kernel.org>; Thu,  4 Feb 2021 11:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EAE664F44
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.81269.149874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7cyW-0005eK-DF; Thu, 04 Feb 2021 11:39:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81269.149874; Thu, 04 Feb 2021 11:39:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7cyW-0005eD-A5; Thu, 04 Feb 2021 11:39:04 +0000
Received: by outflank-mailman (input) for mailman id 81269;
 Thu, 04 Feb 2021 11:39:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7cyU-0005dL-O4
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 11:39:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7cyU-0001eV-NH
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 11:39:02 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7cyU-0005Tg-Md
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 11:39:02 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l7cyR-0007qR-Eb; Thu, 04 Feb 2021 11:38:59 +0000
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
	bh=Bt5R+eZiexMfpDbKqjOZJnSlNakCvj1WeCRJGb7Yh4w=; b=2uzbtOCn7Q7mF7hQ9NVBZG6YB3
	ypB5Un8BgLBNMzNnoJacYwrc/hERhdcaUsWDiLy/wYG/ZOJ6P5c2whGZ/o7OsoWnWMkBBTPEigB85
	x5W0FOmAm3IJJiD3YpxcllLuwI74rhTcKQnJX/IMRvSfPWf/lCjuuZNovFBG+gPuj0f8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24603.56531.218802.368677@mariner.uk.xensource.com>
Date: Thu, 4 Feb 2021 11:38:59 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Jan Beulich <jbeulich@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.15] x86/efi: enable MS ABI attribute on clang
In-Reply-To: <20210203175805.86465-1-roger.pau@citrix.com>
References: <20210203175805.86465-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH for-4.15] x86/efi: enable MS ABI attribute on clang"):
> Or else the EFI service calls will use the wrong calling convention.
> 
> The __ms_abi__ attribute is available on all supported versions of
> clang.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Cc: Ian Jackson <iwj@xenproject.org>
> 
> Without this a Xen built with clang won't be able to correctly use the
> EFI services, leading to weird messages from the firmware and crashes.
> The impact of this fix for GCC users is exactly 0, and will fix the
> build on clang.

Reviewed-by: Ian Jackson <iwj@xenproject.org>

> The biggest fallout from this could be using the attribute on a
> compiler that doesn't support it, which would translate into a build
> failure, but the gitlab tests have shown no issues.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Thanks for the thorough attention to the release question in your
mails.  You're making my work very easy :-).

Ian.

