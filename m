Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81D5C5AD5A
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 22:58:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389339.1630112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuHtD-00083M-Me; Wed, 12 Aug 2026 22:57:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389339.1630112; Wed, 12 Aug 2026 22:57:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuHtD-000838-HK; Wed, 12 Aug 2026 22:57:39 +0000
Received: by outflank-mailman (input) for mailman id 1389339;
 Wed, 12 Aug 2026 22:57:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SB+v=GF=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1wuHtC-000832-Qm
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 22:57:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuHtC-007Skv-7c
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 00:57:38 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <SRS0=SB+v=GF=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 6a7cfa60-2eae-0a2a0a5409dd-0a2a4503a602-4
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 00:57:38 +0200
Received: from [140.77.166.138] (helo=sonata.ens-lyon.org)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <SRS0=SB+v=GF=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 6a7cfa61-fae8-0a2a45030019-8c4da68a975a-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 00:57:38 +0200
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 8CB78A01BB;
 Thu, 13 Aug 2026 00:57:37 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vm75nda-YOVW; Thu, 13 Aug 2026 00:57:37 +0200 (CEST)
Received: from end (27.107.204.77.rev.sfr.net [77.204.107.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 2CAA8A019C;
 Thu, 13 Aug 2026 00:57:37 +0200 (CEST)
Received: from samy by end with local (Exim 4.99.4)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1wuHt9-00000003UIZ-3pZ6; Thu, 13 Aug 2026 00:57:35 +0200
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
	t=1786575457; bh=K2N/W4F9O6aeQyoVQqNuuZgVgn+TvaMQdX1XBtYLZtY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A9uFERs+m/7aYQEcIu7tCCaZgZFaQqvKgBC/jWQJwgh0zMCU/Te/E1pZfFDent98q
	 NoNtCW3YLfLzPZZe6WqrV5zkm3NIHQhJCtDVPqfa+6iNKjIIYKeAOmcb5Q4xGbc3Po
	 2RtXiJ8t+x/43hNF3FYcHSpCmuxGIrvonfo3cTRlEGwxjCtqflW/ghpyU2Wz8Py6Ho
	 f2fS/1XQcVpYTyau9P/GQ4fZCT902m0AGUbztzgGcy20KmCrz+1LXXJNXr0h9tqHD5
	 zE3+4YWG3dTaqHo5NFlRXXwiVpe2vfO+Y2aBMbOgETKDDiGG8pXNxUwpR7tWcgTLfT
	 1AEHfLbFekCOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ens-lyon.org; s=dkim;
	t=1786575457; bh=K2N/W4F9O6aeQyoVQqNuuZgVgn+TvaMQdX1XBtYLZtY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A9uFERs+m/7aYQEcIu7tCCaZgZFaQqvKgBC/jWQJwgh0zMCU/Te/E1pZfFDent98q
	 NoNtCW3YLfLzPZZe6WqrV5zkm3NIHQhJCtDVPqfa+6iNKjIIYKeAOmcb5Q4xGbc3Po
	 2RtXiJ8t+x/43hNF3FYcHSpCmuxGIrvonfo3cTRlEGwxjCtqflW/ghpyU2Wz8Py6Ho
	 f2fS/1XQcVpYTyau9P/GQ4fZCT902m0AGUbztzgGcy20KmCrz+1LXXJNXr0h9tqHD5
	 zE3+4YWG3dTaqHo5NFlRXXwiVpe2vfO+Y2aBMbOgETKDDiGG8pXNxUwpR7tWcgTLfT
	 1AEHfLbFekCOA==
Date: Thu, 13 Aug 2026 00:57:35 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 0/5] stubdom: remove grub-pv
Message-ID: <anz6XwsWjoNeHBxY@end>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
References: <20260720081833.4122182-1-jgross@suse.com>
 <f8481120-00c5-411e-ad66-38ff550bdd47@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f8481120-00c5-411e-ad66-38ff550bdd47@suse.com>
Organization: I am not organized
X-purgate-ID: tlsNG-33051d/1786575458-6F8C54E9-14F71FC6/0/0
X-purgate-type: clean
X-purgate-size: 5728

Hello,

Juergen Gross, le mer. 12 août 2026 10:16:58 +0200, a ecrit:
> Any feedback?

I'm fine with it: grub0.9x is really old, grub2 works alright in my use
cases and is maintained.

With thanks,
Samuel

> On 20.07.26 10:18, Juergen Gross wrote:
> > The grub-pv stubdoms (32- and 64-bit) are disabled by default since
> > several years now.
> > 
> > Remove them in order to enable removing quite some more code from Xen.
> > In case someone is really depending on grub-pv, they can easily take it
> > from an older Xen build, as there is no Xen version dependency in
> > grub-pv (a version built 3 years ago has been tested to still work
> > with current 4.23 staging Xen).
> > 
> > Note that after this series has been committed, some additional
> > cleanup is possible by removing stubdom libpci and zlib support, but
> > this will require a modification of Mini-OS depending on these patches.
> > 
> > Changes in V2:
> > - moved one hunk from patch 2 to patch 1
> > 
> > Juergen Gross (5):
> >    stubdom: remove support for grub-pv
> >    stubdom: remove support for building in 32-bit mode
> >    stubdom: remove building of libxenguest and libxenctrl
> >    docs: remove stale stubdom entries from stubdom.txt
> >    tools/libxenguest: remove Mini-OS specific parts
> > 
> >   Makefile                                      |    6 -
> >   config/Stubdom.mk.in                          |    3 -
> >   docs/misc/stubdom.txt                         |   69 -
> >   stubdom/.gitignore                            |    1 -
> >   stubdom/Makefile                              |   69 +-
> >   stubdom/configure                             |   65 -
> >   stubdom/configure.ac                          |    2 -
> >   stubdom/grub.patches/00cvs                    | 1022 -----
> >   stubdom/grub.patches/10graphics.diff          | 2297 -----------
> >   stubdom/grub.patches/11graphics-keyboard.diff |   13 -
> >   stubdom/grub.patches/20print_func.diff        |   52 -
> >   stubdom/grub.patches/30savedefault.diff       |  186 -
> >   .../grub.patches/40ext3_256byte_inode.diff    |  114 -
> >   stubdom/grub.patches/50fs_fulldisk.diff       |   72 -
> >   stubdom/grub.patches/60ext4.diff              |  474 ---
> >   stubdom/grub.patches/61btrfs.diff             | 3499 -----------------
> >   stubdom/grub.patches/70compiler_warnings.diff |   45 -
> >   stubdom/grub.patches/99minios                 | 1570 --------
> >   stubdom/grub/Makefile                         |   88 -
> >   stubdom/grub/boot-x86_32.S                    |  112 -
> >   stubdom/grub/boot-x86_64.S                    |  108 -
> >   stubdom/grub/config.h                         |   12 -
> >   stubdom/grub/kexec.c                          |  434 --
> >   stubdom/grub/mini-os.c                        |  771 ----
> >   stubdom/grub/mini-os.h                        |    7 -
> >   stubdom/grub/minios.cfg                       |    4 -
> >   stubdom/grub/osdep.h                          |   30 -
> >   tools/libs/guest/Makefile.common              |   15 -
> >   tools/libs/guest/xg_dom_decompress_unsafe.c   |   48 -
> >   tools/libs/guest/xg_dom_decompress_unsafe.h   |   28 -
> >   .../guest/xg_dom_decompress_unsafe_bzip2.c    |   14 -
> >   .../libs/guest/xg_dom_decompress_unsafe_lz4.c |   39 -
> >   .../guest/xg_dom_decompress_unsafe_lzma.c     |   14 -
> >   .../guest/xg_dom_decompress_unsafe_lzo1x.c    |   44 -
> >   .../libs/guest/xg_dom_decompress_unsafe_xz.c  |   46 -
> >   .../guest/xg_dom_decompress_unsafe_zstd.c     |   44 -
> >   36 files changed, 1 insertion(+), 11416 deletions(-)
> >   delete mode 100644 stubdom/grub.patches/00cvs
> >   delete mode 100644 stubdom/grub.patches/10graphics.diff
> >   delete mode 100644 stubdom/grub.patches/11graphics-keyboard.diff
> >   delete mode 100644 stubdom/grub.patches/20print_func.diff
> >   delete mode 100644 stubdom/grub.patches/30savedefault.diff
> >   delete mode 100644 stubdom/grub.patches/40ext3_256byte_inode.diff
> >   delete mode 100644 stubdom/grub.patches/50fs_fulldisk.diff
> >   delete mode 100644 stubdom/grub.patches/60ext4.diff
> >   delete mode 100644 stubdom/grub.patches/61btrfs.diff
> >   delete mode 100644 stubdom/grub.patches/70compiler_warnings.diff
> >   delete mode 100644 stubdom/grub.patches/99minios
> >   delete mode 100644 stubdom/grub/Makefile
> >   delete mode 100644 stubdom/grub/boot-x86_32.S
> >   delete mode 100644 stubdom/grub/boot-x86_64.S
> >   delete mode 100644 stubdom/grub/config.h
> >   delete mode 100644 stubdom/grub/kexec.c
> >   delete mode 100644 stubdom/grub/mini-os.c
> >   delete mode 100644 stubdom/grub/mini-os.h
> >   delete mode 100644 stubdom/grub/minios.cfg
> >   delete mode 100644 stubdom/grub/osdep.h
> >   delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe.c
> >   delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe.h
> >   delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_bzip2.c
> >   delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_lz4.c
> >   delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_lzma.c
> >   delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_lzo1x.c
> >   delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_xz.c
> >   delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_zstd.c
> > 
> 






-- 
Samuel
 RR> Ce que je cherche à démontrer, c'est qu'il est injuste de faire
 RR> l'amalgame entre du bulk mail et du courrier non-solicité très ciblé
 un suppositoire non reclamé, meme tres bien ciblé, reste un suppositoire.
 -+-OS in : Guide du Neuneu d'Usenet - Plein le cul de la pub à neuneu -+-

