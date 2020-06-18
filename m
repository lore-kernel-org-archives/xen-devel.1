Return-Path: <SRS0=CsTU=77=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4FF6C433E0
	for <xen-devel@archiver.kernel.org>; Thu, 18 Jun 2020 12:40:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 725E520663
	for <xen-devel@archiver.kernel.org>; Thu, 18 Jun 2020 12:40:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q+r8Lo3L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 725E520663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jltqN-0007qK-Sq; Thu, 18 Jun 2020 12:40:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FPuN=77=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jltqM-0007qA-Q6
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 12:40:34 +0000
X-Inumbo-ID: e6f3ac20-b160-11ea-b7bb-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e6f3ac20-b160-11ea-b7bb-bc764e2007e4;
 Thu, 18 Jun 2020 12:40:34 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id t194so5480975wmt.4
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2020 05:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bt9px4pOf6S5pZhscAwBoRnbAk0cS6+u8RkZG2zxoYM=;
 b=Q+r8Lo3LYB21wWuycSLZ8ESK1Pdp+XXcrGFB4P+U3fIEtDEiLpl3p4fxwGYMZ8KNru
 CTt2NXZTuO2QKDzwmU9eDGeRBYMr95Xuy701A4F6uF0BTkLzVc8wdj5lfHxf3YIsr0zl
 XfWe2057DseiMvKJ1sUy9S3rBaOBkOKO8I4Ow+aOsE2GbO+FBt0SpYE4dnVJx/CzhOF+
 fhdNJYMrymK5IOcfrm+ukTLIU1i83fOewrIurtubWhEQZDct1cgOm0O4cLgaFa24mCF5
 /uqLdNvBquZfDu6jTTn+Fe53E7aftteWKG5DyLb+LE8KUgLoWVoQkORepsM+M+dFIuU8
 o2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bt9px4pOf6S5pZhscAwBoRnbAk0cS6+u8RkZG2zxoYM=;
 b=bgslk9zZMv4pZGLl2n1mzw+yyrTqVYvzHYz7lpC9fF2Gih8EhXpRRIW5M6jeRGdxQo
 Z6J3YO+Lo2+PZzaiypcvFRzt6ff1Ozn2qOsliPXE3k8u72tFDnqZQvqmnrIM0X0mvWJh
 ouEChXRvpy51akjsMAsX7V6YmCzVIq2VqtDSdIlm5kr/ZIqlrA4AMjgVu9YWz1jftN4n
 uGLAIhR3aKzJ7un9L3kTuGvoz2HSOXOFmCoQpRXTbhooHmQ5yXNLSzCx9aKitOH6wG63
 ZyJ0gr9SOWpXLvj1mmtXZZ61QDQVSA72ES8QgweVjwO38mUOo+F81GIxpKCa6fgYG/Hj
 aGJw==
X-Gm-Message-State: AOAM531X93Q85NaffbWvspe+msojNjL5EDi+yFZdFzsYqJ3lRpu9V3h3
 QqGwzAz/yPhdDozhcNz2i6VgI7EjEwmPzviEx4Y=
X-Google-Smtp-Source: ABdhPJyEzw4cb/NQnyfBzVR3Lv4bcUy5bFtXj2r/kHdAodvdz3FPx8CgVFAw27J/db/vbINEilpERyGuTb05y2h8tJY=
X-Received: by 2002:a05:600c:2294:: with SMTP id
 20mr4056159wmf.51.1592484033356; 
 Thu, 18 Jun 2020 05:40:33 -0700 (PDT)
MIME-Version: 1.0
References: <3555e16baa9e1909dbefaaab04330694135c9021.1592410065.git.tamas.lengyel@intel.com>
 <d63e00e0-0097-c37e-ba9d-ac9340192dfb@suse.com>
In-Reply-To: <d63e00e0-0097-c37e-ba9d-ac9340192dfb@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Thu, 18 Jun 2020 06:39:57 -0600
Message-ID: <CABfawhngJT0cFJfNxoa9H6qvPEF1nNO9m9PrrbRgQsA5Z0Jc6g@mail.gmail.com>
Subject: Re: [PATCH v2 for-4.14] x86/vmx: use P2M_ALLOC in vmx_load_pdptrs
 instead of P2M_UNSHARE
To: Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jun 18, 2020 at 12:31 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 17.06.2020 18:19, Tamas K Lengyel wrote:
> > While forking VMs running a small RTOS system (Zephyr) a Xen crash has been
> > observed due to a mm-lock order violation while copying the HVM CPU context
> > from the parent. This issue has been identified to be due to
> > hap_update_paging_modes first getting a lock on the gfn using get_gfn. This
> > call also creates a shared entry in the fork's memory map for the cr3 gfn. The
> > function later calls hap_update_cr3 while holding the paging_lock, which
> > results in the lock-order violation in vmx_load_pdptrs when it tries to unshare
> > the above entry when it grabs the page with the P2M_UNSHARE flag set.
> >
> > Since vmx_load_pdptrs only reads from the page its usage of P2M_UNSHARE was
> > unnecessary to start with. Using P2M_ALLOC is the appropriate flag to ensure
> > the p2m is properly populated and to avoid the lock-order violation we
> > observed.
>
> Using P2M_ALLOC is not going to address the original problem though
> afaict: You may hit the mem_sharing_fork_page() path that way, and
> via nominate_page() => __grab_shared_page() => mem_sharing_page_lock()
> you'd run into a lock order violation again.

Note that the nominate_page you see in that path is for the parent VM.
The paging lock is not taken for the parent VM thus nominate_page
succeeds without any issues any time fork_page is called. There is no
nominate_page called for the client domain as there is nothing to
nominate when plugging a hole.

Tamas

