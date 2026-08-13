Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89706C5CFEB
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 13:00:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390007.1630579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuV2g-0006Wy-VU; Thu, 13 Aug 2026 13:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390007.1630579; Thu, 13 Aug 2026 13:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuV2g-0006Wr-RU; Thu, 13 Aug 2026 13:00:18 +0000
Received: by outflank-mailman (input) for mailman id 1390007;
 Thu, 13 Aug 2026 13:00:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MYTl=GG=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1wuV2f-0006Wl-4r
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 13:00:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuV2e-00ALGa-Hn
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 15:00:16 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <SRS0=MYTl=GG=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 6a7dbfd9-bab6-0a2a0a5309dd-0a2a4508e752-46
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 15:00:16 +0200
Received: from [140.77.166.138] (helo=sonata.ens-lyon.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <SRS0=MYTl=GG=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 6a7dbfe0-f659-0a2a45080019-8c4da68ad59c-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 15:00:16 +0200
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id CDF19A017F;
 Thu, 13 Aug 2026 15:00:15 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cOvAuh6-fCEF; Thu, 13 Aug 2026 15:00:15 +0200 (CEST)
Received: from end (144.105.204.77.rev.sfr.net [77.204.105.144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 6F159A017E;
 Thu, 13 Aug 2026 15:00:15 +0200 (CEST)
Received: from samy by end with local (Exim 4.99.4)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1wuV2c-00000003c1A-0bBL; Thu, 13 Aug 2026 15:00:14 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=dkim header.d=ens-lyon.org header.i="@ens-lyon.org" header.h="Date:From:To:Cc:Subject:References:In-Reply-To"; dkim=pass header.s=dkim header.d=ens-lyon.org header.i="@ens-lyon.org" header.h="Date:From:To:Cc:Subject:References:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ens-lyon.org; s=dkim;
	t=1786626015; bh=kzaD9UzPodCXgkww/e8Ygm7kqHXy/jA1wRppLTsEiQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hm7j4elDc4QEEssDYs1zmeKzsqMPUsl/nfJhtYndlt7PCb7W1I0rLP9XxMFp+MvKx
	 6oeFvNvtwuMbjbCQXE7BqGoQCN4hxc0VneXygKwkKhlrFdROafbb0xVN3hFsOG2CXK
	 7er4BQGHxrmxrfAlhp6k/abxJjoRVOwf6UAd8TZWZ8f8EDtvsdBCJlqRGYHjNMePGa
	 QZiPNLVN75DKyq9jzaHi1xeYnh4ij/D4GUV272pf7lAQa0QEJ2aef+KNy//i4DFpJ3
	 bX7gC8/lGKk68pK0YVE2OVAM6vV8/n0hQHzMmtY+5qVtYMpBqjbAc7LaBaek3SWe2+
	 Ju1VriP1uSE9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ens-lyon.org; s=dkim;
	t=1786626015; bh=kzaD9UzPodCXgkww/e8Ygm7kqHXy/jA1wRppLTsEiQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hm7j4elDc4QEEssDYs1zmeKzsqMPUsl/nfJhtYndlt7PCb7W1I0rLP9XxMFp+MvKx
	 6oeFvNvtwuMbjbCQXE7BqGoQCN4hxc0VneXygKwkKhlrFdROafbb0xVN3hFsOG2CXK
	 7er4BQGHxrmxrfAlhp6k/abxJjoRVOwf6UAd8TZWZ8f8EDtvsdBCJlqRGYHjNMePGa
	 QZiPNLVN75DKyq9jzaHi1xeYnh4ij/D4GUV272pf7lAQa0QEJ2aef+KNy//i4DFpJ3
	 bX7gC8/lGKk68pK0YVE2OVAM6vV8/n0hQHzMmtY+5qVtYMpBqjbAc7LaBaek3SWe2+
	 Ju1VriP1uSE9g==
Date: Thu, 13 Aug 2026 15:00:14 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 0/5] stubdom: remove grub-pv
Message-ID: <an2_3vPMvBFFtMW-@end>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
References: <20260720081833.4122182-1-jgross@suse.com>
 <f8481120-00c5-411e-ad66-38ff550bdd47@suse.com>
 <anz6XwsWjoNeHBxY@end>
 <2f2cc724-92d8-476d-bd85-5529fb365389@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f2cc724-92d8-476d-bd85-5529fb365389@suse.com>
Organization: I am not organized
X-purgate-ID: tlsNG-c1860d/1786626016-CFED287B-A28234F0/0/0
X-purgate-type: clean
X-purgate-size: 5999

Jan Beulich, le jeu. 13 août 2026 07:54:39 +0200, a ecrit:
> On 13.08.2026 00:57, Samuel Thibault wrote:
> > Juergen Gross, le mer. 12 août 2026 10:16:58 +0200, a ecrit:
> >> Any feedback?
> > 
> > I'm fine with it: grub0.9x is really old, grub2 works alright in my use
> > cases and is maintained.
> 
> Was this perhaps meant to be / include an Acked-by: ?

Yes, it is an

Acked-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Thanks

> Jan
> 
> >> On 20.07.26 10:18, Juergen Gross wrote:
> >>> The grub-pv stubdoms (32- and 64-bit) are disabled by default since
> >>> several years now.
> >>>
> >>> Remove them in order to enable removing quite some more code from Xen.
> >>> In case someone is really depending on grub-pv, they can easily take it
> >>> from an older Xen build, as there is no Xen version dependency in
> >>> grub-pv (a version built 3 years ago has been tested to still work
> >>> with current 4.23 staging Xen).
> >>>
> >>> Note that after this series has been committed, some additional
> >>> cleanup is possible by removing stubdom libpci and zlib support, but
> >>> this will require a modification of Mini-OS depending on these patches.
> >>>
> >>> Changes in V2:
> >>> - moved one hunk from patch 2 to patch 1
> >>>
> >>> Juergen Gross (5):
> >>>    stubdom: remove support for grub-pv
> >>>    stubdom: remove support for building in 32-bit mode
> >>>    stubdom: remove building of libxenguest and libxenctrl
> >>>    docs: remove stale stubdom entries from stubdom.txt
> >>>    tools/libxenguest: remove Mini-OS specific parts
> >>>
> >>>   Makefile                                      |    6 -
> >>>   config/Stubdom.mk.in                          |    3 -
> >>>   docs/misc/stubdom.txt                         |   69 -
> >>>   stubdom/.gitignore                            |    1 -
> >>>   stubdom/Makefile                              |   69 +-
> >>>   stubdom/configure                             |   65 -
> >>>   stubdom/configure.ac                          |    2 -
> >>>   stubdom/grub.patches/00cvs                    | 1022 -----
> >>>   stubdom/grub.patches/10graphics.diff          | 2297 -----------
> >>>   stubdom/grub.patches/11graphics-keyboard.diff |   13 -
> >>>   stubdom/grub.patches/20print_func.diff        |   52 -
> >>>   stubdom/grub.patches/30savedefault.diff       |  186 -
> >>>   .../grub.patches/40ext3_256byte_inode.diff    |  114 -
> >>>   stubdom/grub.patches/50fs_fulldisk.diff       |   72 -
> >>>   stubdom/grub.patches/60ext4.diff              |  474 ---
> >>>   stubdom/grub.patches/61btrfs.diff             | 3499 -----------------
> >>>   stubdom/grub.patches/70compiler_warnings.diff |   45 -
> >>>   stubdom/grub.patches/99minios                 | 1570 --------
> >>>   stubdom/grub/Makefile                         |   88 -
> >>>   stubdom/grub/boot-x86_32.S                    |  112 -
> >>>   stubdom/grub/boot-x86_64.S                    |  108 -
> >>>   stubdom/grub/config.h                         |   12 -
> >>>   stubdom/grub/kexec.c                          |  434 --
> >>>   stubdom/grub/mini-os.c                        |  771 ----
> >>>   stubdom/grub/mini-os.h                        |    7 -
> >>>   stubdom/grub/minios.cfg                       |    4 -
> >>>   stubdom/grub/osdep.h                          |   30 -
> >>>   tools/libs/guest/Makefile.common              |   15 -
> >>>   tools/libs/guest/xg_dom_decompress_unsafe.c   |   48 -
> >>>   tools/libs/guest/xg_dom_decompress_unsafe.h   |   28 -
> >>>   .../guest/xg_dom_decompress_unsafe_bzip2.c    |   14 -
> >>>   .../libs/guest/xg_dom_decompress_unsafe_lz4.c |   39 -
> >>>   .../guest/xg_dom_decompress_unsafe_lzma.c     |   14 -
> >>>   .../guest/xg_dom_decompress_unsafe_lzo1x.c    |   44 -
> >>>   .../libs/guest/xg_dom_decompress_unsafe_xz.c  |   46 -
> >>>   .../guest/xg_dom_decompress_unsafe_zstd.c     |   44 -
> >>>   36 files changed, 1 insertion(+), 11416 deletions(-)
> >>>   delete mode 100644 stubdom/grub.patches/00cvs
> >>>   delete mode 100644 stubdom/grub.patches/10graphics.diff
> >>>   delete mode 100644 stubdom/grub.patches/11graphics-keyboard.diff
> >>>   delete mode 100644 stubdom/grub.patches/20print_func.diff
> >>>   delete mode 100644 stubdom/grub.patches/30savedefault.diff
> >>>   delete mode 100644 stubdom/grub.patches/40ext3_256byte_inode.diff
> >>>   delete mode 100644 stubdom/grub.patches/50fs_fulldisk.diff
> >>>   delete mode 100644 stubdom/grub.patches/60ext4.diff
> >>>   delete mode 100644 stubdom/grub.patches/61btrfs.diff
> >>>   delete mode 100644 stubdom/grub.patches/70compiler_warnings.diff
> >>>   delete mode 100644 stubdom/grub.patches/99minios
> >>>   delete mode 100644 stubdom/grub/Makefile
> >>>   delete mode 100644 stubdom/grub/boot-x86_32.S
> >>>   delete mode 100644 stubdom/grub/boot-x86_64.S
> >>>   delete mode 100644 stubdom/grub/config.h
> >>>   delete mode 100644 stubdom/grub/kexec.c
> >>>   delete mode 100644 stubdom/grub/mini-os.c
> >>>   delete mode 100644 stubdom/grub/mini-os.h
> >>>   delete mode 100644 stubdom/grub/minios.cfg
> >>>   delete mode 100644 stubdom/grub/osdep.h
> >>>   delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe.c
> >>>   delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe.h
> >>>   delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_bzip2.c
> >>>   delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_lz4.c
> >>>   delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_lzma.c
> >>>   delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_lzo1x.c
> >>>   delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_xz.c
> >>>   delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_zstd.c
> >>>
> >>
> > 
> > 
> > 
> > 
> > 
> > 
> 

-- 
Samuel
Fatal Error: Found [MS-Windows] System -> Repartitioning Disk for Linux...
(By cbbrown@io.org, Christopher Browne)

