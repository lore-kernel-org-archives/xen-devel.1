Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6C3C5AC67
	for <xen-devel@archiver.kernel.org>; Sun,  9 Aug 2026 01:04:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1386894.1628456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wsrxU-0005uA-Ii; Sun, 09 Aug 2026 01:04:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1386894.1628456; Sun, 09 Aug 2026 01:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wsrxU-0005u2-Ds; Sun, 09 Aug 2026 01:04:12 +0000
Received: by outflank-mailman (input) for mailman id 1386894;
 Sun, 09 Aug 2026 01:04:12 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wsrxT-0005tw-VG
 for xen-devel@lists.xenproject.org; Sun, 09 Aug 2026 01:04:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wsrxS-00DY1u-Mm
 for xen-devel@lists.xenproject.org; Sun, 09 Aug 2026 03:04:10 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a77d1f4-2eae-0a2a0a5409dd-0a2a4501d6f6-16
 for <xen-devel@lists.xenproject.org>; Sun, 09 Aug 2026 03:04:10 +0200
Received: from [209.85.128.182] (helo=mail-yw1-f182.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a77d208-5984-0a2a45010019-d15580b6a9da-3
 for <xen-devel@lists.xenproject.org>; Sun, 09 Aug 2026 03:04:09 +0200
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-81e6f2ee60bso46448447b3.1
 for <xen-devel@lists.xenproject.org>; Sat, 08 Aug 2026 18:04:09 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1786237448; cv=none;
        d=google.com; s=arc-20260327;
        b=U9DIo9+dqt2Bo0uacPSOf4OmnTbwhmIzG+r3MXzkhj1U/jv8fq9S59LbA2tSz/Nr7x
         yc00w1C6N7mpjUXJke0V6VcCpLa0Dl33FwbyxvGp2mbfCU6G5i9pWQnX2pC5eWLpcwVB
         wc+5h6OVFZWr3QS7oxgIXbtdF+b1BytR35MCxY8ez9NYQksGO7dntuHmNhtrLxZCHXgA
         XP46mldXpjn6dCetfk2wkcYZXS0egeKx3uM5oY4KYbJObNKmR/q+gKFVN9MEzCTYgRb4
         u6oQWxhpoo8blkkvz7Etg/oPJVGgTFUTO0cHaDXrT8gQLI4CMiC1k6Phrd2dg/EhyAr6
         40rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/ooYtvOl/yrpSWjC6UMdC3vC8WtM8ahkSkG9Lt94FP0=;
        fh=A7KicbXY4441il0jhjM7233yohb6a4hGn+JPZkGjASc=;
        b=HCK0nIn5dJIsqxCNBoaCl+Tbypf+sjRDvFCSDbPxPu5ykw+h/ZcoqtVbBFsgXejD4c
         CPCpYMPnthSOt1hnNs6eZJgW3FA+qkkgs0pLefGNa82nvKSBaD+C1v+gOjS1yk45ZUzR
         5PaTI5PRx+B6pjX9rOnJXYfgxmuLyHXqVmg5CZG9wt2Ty+3Mr+KA3CGOEVy8Fl4T9WE2
         oA+OxqobnJf5R2P+dFKRGTFzKZAn7x2dwb1cc0GIxFvyXqNOFeYQHe1ax7jp3cXse2sX
         sigGL1V6hr4VOybs9X8oVIgOkfGUohHqDaMwXTsOWPo1FCvrsMR2PXQbNWn/LbpwDIZ3
         Nz2A==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786237448; x=1786842248; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ooYtvOl/yrpSWjC6UMdC3vC8WtM8ahkSkG9Lt94FP0=;
        b=JeUTH5XoBZ/8ZEH8/whm25A9Cze3n3Fqy0k7Z+RmtnMrkWUHUSdrIbnPfV3KTftY7K
         xVAPplCVzLln0l3RXqeTCUWoeq4MsBOB/VMZZlbTdjTGY+L0CpNdJhmP/Sdd4nuny+Mo
         BQ+bskDzHm0AfaVYyccg/9prXeRohhF0/a/SvZegFH584mijtaAN3UVFSIt6c7TRaI7t
         +ykxN1fxkB2KKeqVDkJ4BoQhSSy0PpKH+CxlJPo6+6isW2J/QB4NFDtosFSd/gwDy3bi
         udnFD6FzdptL+BDec750YXG3HQxk0FTF3p2vBzQ3E1XnoL/E0R+OQ9tPvVxjTKmoqXVC
         Z2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786237448; x=1786842248;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/ooYtvOl/yrpSWjC6UMdC3vC8WtM8ahkSkG9Lt94FP0=;
        b=Tw0sDXPXqmE74RqGS3jaNS/MxuCNq96ZXQ6m3eKlisUMVCgpSIbJXYZb2pCgdYjaKJ
         o2G4A481ncBSCT0CZ89P65E1GOy7PdzK68m+6bwI2mslvD7GO9oiUfkEejk234QAKBK4
         vsEzoAm8LJlZz1Tf586oeNz7wAe2XPg8jCA86olwKSGUIdk8R+iX/4o3SkrSkLq1l2F9
         eRozKbrDPjctouAmg7Mj0nGtRqheaBB4RTjdwzHIhOamcnWhFnKU8nh20ZEkImh36O4N
         x//bkaPUecI7LlIwsoUgz5K03yC2p4on1o7QWhWPiIGhsGNKkjkh6Hz89evq4oEGYHD3
         LgoQ==
X-Gm-Message-State: AOJu0Yzmrtvks2fmnCChHfSuYu2lSCgUruxVt9uhtBHqdCSihKNQzJ6N
	BgKtLNt9b62+zW7tt1adW3F/g3wnPEBU+YmUdALSMqe1VVvtmvalhjG7qQmNkr1PW/PFUWlniTK
	F7usyGLpI5WiekhpTzjLbgX8GhMd86CQ=
X-Gm-Gg: AR+sD13FmIxRxODsp5dFvVLlmN+1kFlAEnsuqzrfjNej/zDgAbKzPwH8h7pjJeaheW+
	yOrRWKCv2BEG18DD8iDuoY1sXBf0t4IPo5+TYJ5InmwTEKAVFrmJNO4TUGyBDRGt5pym1BKkANu
	xWAwvuFJD1D4tYzDYBs0ApwEg0/5qC6PZqpEcgEuvGZ02fIBLORft2aTCG/atrayGJeyuC/y5QU
	fS/F5yBzm1wQZk21QSd1H3/SyN+dOpAOMJA2jrakW+injrn3NYvz+dUecweHRBzw7CbPW4J7QKX
	hUYR4sIZXmos2h7SjxwesZzrIaOc5nn45upXmYRpys+nMoCN4vmBc/0Bu0Lp6redA5rrFZsRuth
	s
X-Received: by 2002:a05:690c:d84:b0:826:9d78:a0cf with SMTP id
 00721157ae682-8269d78a480mr35873217b3.9.1786237448260; Sat, 08 Aug 2026
 18:04:08 -0700 (PDT)
MIME-Version: 1.0
References: <1786138121.8631fc262581453bbf619ec5b2062170.19fde20d3e4000e099@vates.tech>
In-Reply-To: <1786138121.8631fc262581453bbf619ec5b2062170.19fde20d3e4000e099@vates.tech>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Sun, 9 Aug 2026 02:03:53 +0100
X-Gm-Features: AUfX_mx9bSVYxMwwHMrbKF5yAn2YZdvWOCF1zck5pvGNc3a3_Tsf6-V73c6L2Ok
Message-ID: <CAHt6W4dEqeaO9Q2u0n4CLN=hvi8T-_XedHC_tmrdYgC6sMGmjw@mail.gmail.com>
Subject: Re: [PATCH] public/xen.h: Update comment on mmu_update sub-command
 size and PTE alignment
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Kevin Lampis <kevin.lampis@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-d62444/1786237449-BE867757-15D9DBB8/0/0
X-purgate-type: clean
X-purgate-size: 4229

On Fri, 7 Aug 2026 at 22:29, Teddy Astie <teddy.astie@vates.tech> wrote:
>
> HYPERVISOR_mmu_update passes a set of request, where each request has a pointer
> to the PTE along with a sub-command.
>
> The PTE alignment padding is used to transport the sub-command while the rest
> is used as a address to a PTE entry. The current documentation state that the

"an address"

> 2 first bits are used for sub-command, hence the other ones for PTE which
> imply here a 4-bytes alignment on PTEs.
>
> On PV64 and PV32-PAE guests, all pagetable PTEs are 8-bytes aligned, hence
> off-by-4 PTEs addresses are always incorrect. Non-PAE PV32 guests used
> "legacy pagetables" which had 4-byte aligned PTEs. However, support had
> been completely removed since Xen 4.0, and were only available when Xen was

"was only available"

> built in 32-bits non-PAE mode [1].
>
> Current Xen logic behave as if 3 bits are used as sub-command, thus all

"behaves"

> off-by-4 PTEs are actually rejected as being unknown sub-commands.
>
> Adjust the documentation to match the current logic implemented in Xen,
> also expanding the documented sub-command parameter to 3 bits.
>
> [1] 84d54d5d8b31 ("i386: Remove non-PAE hypervisor build target.")
>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> This happens to be a complete rewording of [2]. I'm not sure what to do exactly
> regarding the signed-off.
>

You should use them both.

> CC: Kevin Lampis <kevin.lampis@citrix.com>
> This now expanded sub-command field can be used for your "unmap_page_range optimisation"
> series to avoid having to introduce a new dedicated hypercall.
>
> [2] https://lore.kernel.org/xen-devel/20260528075539.10209-3-frediano.ziglio@cloud.com/
>
>  xen/include/public/xen.h | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
> index 2149b8dd38..b4fef2c5ba 100644
> --- a/xen/include/public/xen.h
> +++ b/xen/include/public/xen.h
> @@ -218,16 +218,16 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
>   *                     x == 0 => PFD == DOMID_SELF
>   *                     x != 0 => PFD == x - 1
>   *
> - * Sub-commands: ptr[1:0] specifies the appropriate MMU_* command.
> + * Sub-commands: ptr[2:0] specifies the appropriate MMU_* command.
>   * -------------
> - * ptr[1:0] == MMU_NORMAL_PT_UPDATE:
> + * ptr[2:0] == MMU_NORMAL_PT_UPDATE:
>   * Updates an entry in a page table belonging to PFD. If updating an L1 table,
>   * and the new table entry is valid/present, the mapped frame must belong to
>   * FD. If attempting to map an I/O page then the caller assumes the privilege
>   * of the FD.
>   * FD == DOMID_IO: Permit /only/ I/O mappings, at the priv level of the caller.
>   * FD == DOMID_XEN: Map restricted areas of Xen's heap space.
> - * ptr[:2]  -- Machine address of the page-table entry to modify.
> + * ptr[:3]  -- Machine address of the page-table entry to modify.
>   * val      -- Value to write.
>   *
>   * There also certain implicit requirements when using this hypercall. The
> @@ -264,17 +264,17 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
>   * mentioned above. The argument is MMUEXT_UNPIN_TABLE for all levels and the
>   * pagetable MUST not be in use (meaning that the cr3 is not set to it).
>   *
> - * ptr[1:0] == MMU_MACHPHYS_UPDATE:
> + * ptr[2:0] == MMU_MACHPHYS_UPDATE:
>   * Updates an entry in the machine->pseudo-physical mapping table.
> - * ptr[:2]  -- Machine address within the frame whose mapping to modify.
> + * ptr[:3]  -- Machine address within the frame whose mapping to modify.
>   *             The frame must belong to the FD, if one is specified.
>   * val      -- Value to write into the mapping entry.
>   *
> - * ptr[1:0] == MMU_PT_UPDATE_PRESERVE_AD:
> + * ptr[2:0] == MMU_PT_UPDATE_PRESERVE_AD:
>   * As MMU_NORMAL_PT_UPDATE above, but A/D bits currently in the PTE are ORed
>   * with those in @val.
>   *
> - * ptr[1:0] == MMU_PT_UPDATE_NO_TRANSLATE:
> + * ptr[2:0] == MMU_PT_UPDATE_NO_TRANSLATE:
>   * As MMU_NORMAL_PT_UPDATE above, but @val is not translated though FD
>   * page tables.
>   *

Frediano

