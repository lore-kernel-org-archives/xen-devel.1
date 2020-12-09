Return-Path: <SRS0=Zv5g=FN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA5FC433FE
	for <xen-devel@archiver.kernel.org>; Wed,  9 Dec 2020 12:03:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F26523B6C
	for <xen-devel@archiver.kernel.org>; Wed,  9 Dec 2020 12:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F26523B6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alien8.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.48200.85220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmyBg-0000iz-Lg; Wed, 09 Dec 2020 12:03:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48200.85220; Wed, 09 Dec 2020 12:03:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmyBg-0000is-IR; Wed, 09 Dec 2020 12:03:16 +0000
Received: by outflank-mailman (input) for mailman id 48200;
 Wed, 09 Dec 2020 12:03:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bdKt=FN=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1kmyBe-0000in-4Y
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 12:03:14 +0000
Received: from mail.skyhub.de (unknown [5.9.137.197])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8576c31-d14e-45e3-8af7-24df90f1ea39;
 Wed, 09 Dec 2020 12:03:12 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0f480029f89b316a92fa4b.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0f:4800:29f8:9b31:6a92:fa4b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7B28D1EC0118;
 Wed,  9 Dec 2020 13:03:11 +0100 (CET)
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
X-Inumbo-ID: c8576c31-d14e-45e3-8af7-24df90f1ea39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1607515391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MkDF2BGW53pllBVxbrp35zb7hHGQHDWR/sD7dvFz1IY=;
	b=HEfZeiKQCt2C7bZJNE6U0ObntUyi1mhN9sU2Pi4U4OH50xzO7goM8aBTpCO/vHZW/T20UL
	gCvwseWgnBUqsp6rixMDsQe46s2seaCU7GZWJG73Sb5KWEHRfSUOdQYEOF8C/pR3Li6VPM
	DksKCjaHWoiL91XA/+XuLCu+FKdjEN8=
Date: Wed, 9 Dec 2020 13:03:07 +0100
From: Borislav Petkov <bp@alien8.de>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, peterz@infradead.org, luto@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2 07/12] x86: add new features for paravirt patching
Message-ID: <20201209120307.GB18203@zn.tnic>
References: <20201120114630.13552-1-jgross@suse.com>
 <20201120114630.13552-8-jgross@suse.com>
 <20201208184315.GE27920@zn.tnic>
 <2510752e-5d3d-f71c-8a4c-a5d2aae0075e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2510752e-5d3d-f71c-8a4c-a5d2aae0075e@suse.com>

On Wed, Dec 09, 2020 at 08:30:53AM +0100, Jürgen Groß wrote:
> Hey, I already suggested to use ~FEATURE for that purpose (see
> https://lore.kernel.org/lkml/f105a63d-6b51-3afb-83e0-e899ea40813e@suse.com/

Great minds think alike!

:-P

> I'd rather make the syntax:
> 
> ALTERNATIVE_TERNARY <initial-code> <feature> <code-for-feature-set>
>                                              <code-for-feature-unset>
> 
> as this ...

Sure, that is ok too.

> ... would match perfectly to this interpretation.

Yap.

> Hmm, using flags is an alternative (pun intended :-) ).

LOL!

Btw, pls do check how much the vmlinux size of an allyesconfig grows
with this as we will be adding a byte per patch site. Not that it would
matter too much - the flags are a long way a comin'. :-)

> No, this is needed for non-Xen cases, too (especially pv spinlocks).

I see.

> > Can you give an example here pls why the paravirt patching needs to run
> > first?
> 
> Okay.

I meant an example for me to have a look at. :)

If possible pls.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

