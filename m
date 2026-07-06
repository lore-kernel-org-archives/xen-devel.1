Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB14C43458
	for <xen-devel@archiver.kernel.org>; Mon,  6 Jul 2026 17:49:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1355774.1610535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgnQz-0000Ee-Fx; Mon, 06 Jul 2026 17:48:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355774.1610535; Mon, 06 Jul 2026 17:48:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgnQz-0000EX-Cz; Mon, 06 Jul 2026 17:48:45 +0000
Received: by outflank-mailman (input) for mailman id 1355774;
 Mon, 06 Jul 2026 17:48:44 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vishal.moola@gmail.com>) id 1wgnQy-0000ER-Bf
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 17:48:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgnQx-0035tY-LZ
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 19:48:43 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a4bea57-bab6-0a2a0a5309dd-0a2a4504a030-22
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 19:48:43 +0200
Received: from [209.85.216.47] (helo=mail-pj1-f47.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a4bea7a-a01d-0a2a45040019-d155d82fe547-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 19:48:43 +0200
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-38125cebfdaso4435704a91.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 10:48:43 -0700 (PDT)
Received: from fedora ([2601:644:937c:6c90:6d4e:7b2d:4a39:fb0c])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3812801e8d6sm5515562a91.12.2026.07.06.10.48.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 10:48:40 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="In-Reply-To:Content-Disposition:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783360121; x=1783964921; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jHIujCKTOGPNugTb5N8DODxujrY7RJkaEbg7hUbcIIA=;
        b=aI2bD7BpUC+6e+iecmjhkZRQ5//M5a6ob9zPKO0NL4TSzUDfxj58T2r9pscpf8TmJK
         U8GG+EYclYVa7ck/A1mY9kGXfZuOgBM1sXdSgOwj39Cj01ygdgQVIJl2ClvvpomnD+DQ
         0INnDYUXBZGnrYAwwz6Ho0OGGePTBG3wQi2lRn7FdxR80tmC5KTl4hWF2MQJ2uRtI+/t
         VgGEu5k7J9NJ6xGcr/yld+novp7+qZqV71vjnDBr7zm4F3MQJzuGZyWHWMs2s6bHtBt8
         rbyRdnZSBrGWs+yDPgnZslTN1FMiwCQ25XvB1PrHG1n9bNOqH04K77/1mtrEqmKBhQZK
         2x/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360121; x=1783964921;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jHIujCKTOGPNugTb5N8DODxujrY7RJkaEbg7hUbcIIA=;
        b=CeBlKAxeXCpjuA5IxnBnboGXOkoFHZfSNuw4LR9+uUtcqlxA5crGxdBatT4U6phTAh
         8OJhP9Wwg/8jlV5KXSiEfEpXFWeECoYYFqI/tpfE9rX9ZWxew1QL+hwlqebRYBOrC7bK
         iHcb4gMIzjZ/xIHwsK3Oaq1FpFatqlrZIK1zK/ximePYuNhFzuaGQFdwI/q3wbXKLBJm
         Gpby/RKnISs37WsCw5t/H3wWwNFIew4Lqhmeo0GKUdCUJbjpiMjkX2HYLvxD0AJ3REv4
         4kveryTGvJcyeNfZvD/9jjYYR8Y5NlOuWv56tRg78SrVmq37x2P1wCY0jmWfK++wOkOR
         LzCQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro4cKamoHotqVnaJJW5TxGFesN2V/N63m4Ik3b4kN//czpKHKiTzsHp9NU9kT7wpaOGqptFa/0pwY0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzNolzph7lGNQHpc1/fOf0awEj9O1SlYVmdBYfQWtyMQopKRUqH
	NbO/FuGhnYsMFLtUOtfY2CcTuKDCKByYzh6AAU46G6+mACW3HW8LwY/5
X-Gm-Gg: AfdE7cnHakCa0B9K5FJikE9bfKhgc4WRfu6pRxSX+jokEDxqTXuLQC6Aza88G7ujroM
	Rit6VnWp+a5ckdpVgIvzj6IZ3tCj0L5Mjl+dAK4MCpw3iM6QWgePlp5sB5pA17zdLu7o8254Dpg
	waDKwDcZot80Wjzl0JrXhTgPW131jhEj5I0wG2LoPiXi8JcBQTaAUoi6+XTc4D3PODNFu7Hlmyt
	Ra2Sx2wemyiOUJsFix8yfPmFeV7haKi6PcnB8G+JmsMbEj9fzA0TVwDnYUWdg3mVcZqXwAwOj8D
	hmQHSq10qlltmBlpCMZakiln94XM+KFEIB64tBLoanKaaXdXbI6VBxD2J81aEOucoZwSnAWAFZi
	HRhErZYnki9Jx08xXkxdK+/LraNtRKhKgcW0qRshCtkwvfYFzgLzwjFjx2ykJHXrtd83vBCIL/C
	3cMuioYkZd5xq6ixf0h2683k+5VB7f3d8234xzE+oyALRI
X-Received: by 2002:a17:90b:3f88:b0:37f:9ce1:cda4 with SMTP id 98e67ed59e1d1-38759019fc1mr1587029a91.26.1783360121520;
        Mon, 06 Jul 2026 10:48:41 -0700 (PDT)
Date: Mon, 6 Jul 2026 10:48:38 -0700
From: Vishal Moola <vishal.moola@gmail.com>
To: Dave Hansen <dave.hansen@intel.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, x86@kernel.org
Cc: Mike Rapoport <rppt@kernel.org>, Lu Baolu <baolu.lu@linux.intel.com>,
	xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 0/9] Convert x86 pgd_lists to ptdescs
Message-ID: <akvqdoZI-jCn3lrk@fedora>
References: <20260629185742.126987-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629185742.126987-1-vishal.moola@gmail.com>
X-purgate-ID: tlsNG-ebf023/1783360123-2E95B1CC-7252B663/0/0
X-purgate-type: clean
X-purgate-size: 2224

On Mon, Jun 29, 2026 at 11:57:33AM -0700, Vishal Moola wrote:
> This continues the ptdesc conversions for x86[1]. This is a necessary step
> in preparation for the separate allocation of ptdescs from struct page.
> Once ptdescs are not wrappers, the pgd_list should be used to find our
> ptdesc, not page.
> 
> In fact, after patch 4 we can successfully boot a 32-bit x86 kernel
> that separately allocates ptdescs.
> 
> All of the patches are rather straightforward, I just kept them split up
> for ease of review. There are no intended functional changes as ptdescs
> are currently still wrappers around struct page.
> 
> [1] https://lore.kernel.org/linux-mm/20260211195233.368497-1-vishal.moola@gmail.com/
> 
> ----------------
> 
> v2:
>   - Collect Review tags
>   - Rebase on 7.2-rc1
> 
> I've compiled and booted both 64 and 32 bit on a kernel with separately
> allocated ptdescs. I ensured the codepaths were hit for all the changes
> except Xen.
> 
> This applies cleanly to 7.2-rc1. Dave, can you please take this through
> the x86 mm tree?

Hi Dave, will you take this through your tree? Let me know if there
are any changes you'd like to see, or if you'd rather this go through
some other tree.

> Vishal Moola (9):
>   x86/mm/pat: Use IS_ENABLED() instead of ifdef
>   x86/mm/pat: Convert __set_pmd_pte() to ptdescs
>   x86/mm/pat: Convert collapse_pmd_page() to ptdescs
>   x86/mm: Convert arch_sync_kernel_mappings() to ptdescs
>   x86/mm: Convert sync_global_pgds_l5() to ptdescs
>   x86/mm: Convert sync_global_pgds_l4() to ptdescs
>   x86/mm: Convert pgd_page_get_mm() to ptdescs
>   x86/xen: Convert xen_mm_pin_all() to ptdescs
>   x86/xen: Convert xen_mm_unpin_all() to ptdescs
> 
>  arch/x86/include/asm/pgtable.h       |  2 +-
>  arch/x86/include/asm/pgtable_types.h |  2 +-
>  arch/x86/mm/fault.c                  |  8 ++++----
>  arch/x86/mm/init_64.c                | 16 ++++++++--------
>  arch/x86/mm/pat/set_memory.c         | 17 ++++++++---------
>  arch/x86/mm/pgtable.c                |  4 ++--
>  arch/x86/xen/mmu_pv.c                | 22 +++++++++++-----------
>  7 files changed, 35 insertions(+), 36 deletions(-)
> 
> -- 
> 2.54.0
> 

