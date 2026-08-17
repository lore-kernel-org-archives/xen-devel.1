Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 262D2C5B572
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 07:30:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392535.1631496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvrnd-0001IU-Em; Mon, 17 Aug 2026 07:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392535.1631496; Mon, 17 Aug 2026 07:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvrnd-0001I7-BL; Mon, 17 Aug 2026 07:30:25 +0000
Received: by outflank-mailman (input) for mailman id 1392535;
 Mon, 17 Aug 2026 07:30:23 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MkDe=GK=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1wvrnb-0001I1-L4
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 07:30:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvrna-007bzz-Ks
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 09:30:22 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <SRS0=MkDe=GK=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 6a82b888-8faa-0a2a0a5109dd-0a2a4501d222-24
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 09:30:22 +0200
Received: from [140.77.166.138] (helo=sonata.ens-lyon.org)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <SRS0=MkDe=GK=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 6a82b88e-5984-0a2a45010019-8c4da68a984a-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 09:30:22 +0200
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id EAA43A1AB6;
 Mon, 17 Aug 2026 09:30:21 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1G9Lepkvo8Yi; Mon, 17 Aug 2026 09:30:21 +0200 (CEST)
Received: from end (lfbn-orl-1-1611-126.w90-107.abo.wanadoo.fr
 [90.107.165.126])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 9B5E5A0176;
 Mon, 17 Aug 2026 09:30:21 +0200 (CEST)
Received: from samy by end with local (Exim 4.99.4)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1wvrnZ-0000000BrZ1-0pUi; Mon, 17 Aug 2026 09:30:21 +0200
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
	t=1786951822; bh=FnxL0SCDI1us44bkr5Es65JQS1FP9jHcif92WAvg7Gg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BjGTCX0zEnL52Mz+T0RAzcFdiRZXYk6a9gfa9iyAQVUgjIjAmr0+YmxhI+EdTgo7F
	 sZ6yFSWVSHG521naqt550ZwoqOM1yQa9atuSLOBcUYavJz6jfovO4LPkQG0QC5pc7I
	 oAxCX9VXynLw+lkOdlcjH+THMGs8uxyt/2HhwRshRrL9Zjq81ssn3kbeiz6dgvao4S
	 iOhj0zWxxLizT6NuiDBu9aYUg5AjRihWVN4zpAeBjuA6voIef7npBB8EIYennRar8E
	 l6RjzsDDbjIE0Ww14zSNKl/n2nZGMjzpYdI8IJBvGfCUhzlnftRNWvCKaRAgYMTwTA
	 mNWFPE9JMYhrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ens-lyon.org; s=dkim;
	t=1786951821; bh=FnxL0SCDI1us44bkr5Es65JQS1FP9jHcif92WAvg7Gg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TNWHUNV6LT69EF8RzJ1wsLHu0KsQIQ6GFev+P1NQB2Afx7UPNGii4UDqlKKL0UhK1
	 XJE1aUheqBHf9L6ShzlR30mvMrz5gMFm5GTYNBhswaLPM7/bdhlTdtTQbD+XjoXLU0
	 Q+j0v2ykAYzr6p8aJBK5uf4pEs3E65NZfHPfdy8zwqrgD0EmqXs7agzZ/H8A/kug4+
	 hMs5NDSsHg+lv+r6725ETtsjs/rSQMv9xC94kWe0dE9DXFCPfbL7N29jrAKv8fvDot
	 9YGYpXpmBGQNu5T2hQIPiBckh39Inyqh1QkavjJltcnt94ftqDPYuFylRZXGGaD/n1
	 XQmnL4aN31lww==
Date: Mon, 17 Aug 2026 09:30:21 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 3/4] stubdom: remove build of zlib
Message-ID: <aoK4jSY6RUOXrZbl@end>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
References: <20260817071843.114898-1-jgross@suse.com>
 <20260817071843.114898-4-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260817071843.114898-4-jgross@suse.com>
Organization: I am not organized
X-purgate-ID: tlsNG-d62444/1786951822-BDE78757-2C62515B/0/0
X-purgate-type: clean
X-purgate-size: 4949

Juergen Gross, le lun. 17 août 2026 09:18:42 +0200, a ecrit:
> The last users of zlib for stubdoms have been removed.
> 
> Remove zlib from the stubdom build system, too.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  config/Stubdom.mk.in |  3 ---
>  stubdom/.gitignore   |  1 -
>  stubdom/Makefile     | 24 +-----------------------
>  stubdom/configure    | 15 ---------------
>  stubdom/configure.ac |  1 -
>  5 files changed, 1 insertion(+), 43 deletions(-)
> 
> diff --git a/config/Stubdom.mk.in b/config/Stubdom.mk.in
> index b90eaee75a..dc0a3b54b3 100644
> --- a/config/Stubdom.mk.in
> +++ b/config/Stubdom.mk.in
> @@ -11,9 +11,6 @@ STUBDOM_TARGETS     := @STUBDOM_TARGETS@
>  STUBDOM_BUILD       := @STUBDOM_BUILD@
>  STUBDOM_INSTALL     := @STUBDOM_INSTALL@
>  
> -ZLIB_VERSION        := @ZLIB_VERSION@
> -ZLIB_URL            := @ZLIB_URL@
> -
>  NEWLIB_VERSION      := @NEWLIB_VERSION@
>  NEWLIB_URL          := @NEWLIB_URL@
>  
> diff --git a/stubdom/.gitignore b/stubdom/.gitignore
> index 8c6dc00f83..e5d5744361 100644
> --- a/stubdom/.gitignore
> +++ b/stubdom/.gitignore
> @@ -29,4 +29,3 @@
>  /vtpm/vtpm_manager.h
>  /xenstore
>  /xenstorepvh
> -/zlib-*
> diff --git a/stubdom/Makefile b/stubdom/Makefile
> index f542a4295a..8830deebce 100644
> --- a/stubdom/Makefile
> +++ b/stubdom/Makefile
> @@ -102,26 +102,6 @@ $(NEWLIB_STAMPFILE): mk-headers-$(XEN_TARGET_ARCH) newlib-$(NEWLIB_VERSION)
>  	  $(MAKE) DESTDIR= && \
>  	  $(MAKE) DESTDIR= install )
>  
> -############
> -# Cross-zlib
> -############
> -
> -zlib-$(ZLIB_VERSION).tar.gz:
> -	$(FETCHER) $@ $(ZLIB_URL)/$@
> -
> -zlib-$(XEN_TARGET_ARCH): zlib-$(ZLIB_VERSION).tar.gz 
> -	tar xzf $<
> -	mv zlib-$(ZLIB_VERSION) $@
> -
> -ZLIB_STAMPFILE=$(CROSS_ROOT)/$(GNU_TARGET_ARCH)-xen-elf/lib/libz.a
> -.PHONY: cross-zlib
> -cross-zlib: $(ZLIB_STAMPFILE)
> -$(ZLIB_STAMPFILE): zlib-$(XEN_TARGET_ARCH) $(NEWLIB_STAMPFILE)
> -	( cd $< && \
> -	  CFLAGS="$(TARGET_CPPFLAGS) $(TARGET_CFLAGS)" CC=$(CC) ./configure --prefix=$(CROSS_PREFIX)/$(GNU_TARGET_ARCH)-xen-elf && \
> -	  $(MAKE) DESTDIR= libz.a && \
> -	  $(MAKE) DESTDIR= install )
> -
>  ######
>  # lwIP
>  ######
> @@ -222,7 +202,7 @@ cross-tpmemu: $(TPMEMU_STAMPFILE)
>  #######
>  
>  .PHONY: $(CROSS_ROOT)
> -$(CROSS_ROOT): cross-newlib cross-zlib
> +$(CROSS_ROOT): cross-newlib
>  
>  #######
>  # libraries under tools/libs
> @@ -449,7 +429,6 @@ clean:
>  crossclean: clean
>  	rm -fr $(CROSS_ROOT)
>  	rm -fr newlib-$(XEN_TARGET_ARCH)
> -	rm -fr zlib-$(XEN_TARGET_ARCH)
>  	rm -fr libs-$(XEN_TARGET_ARCH)
>  	rm -fr xenstore xenstorepvh
>  	rm -fr gmp-$(XEN_TARGET_ARCH)
> @@ -471,7 +450,6 @@ patchclean: crossclean
>  .PHONY: downloadclean
>  downloadclean: patchclean
>  	rm -f newlib-$(NEWLIB_VERSION).tar.gz
> -	rm -f zlib-$(ZLIB_VERSION).tar.gz
>  	rm -f gmp-$(GMP_VERSION).tar.bz2
>  	rm -f tpm_emulator-$(TPMEMU_VERSION).tar.gz
>  	rm -f lwip-$(LWIP_VERSION).tar.gz
> diff --git a/stubdom/configure b/stubdom/configure
> index f3d63dceff..1a5687d32b 100755
> --- a/stubdom/configure
> +++ b/stubdom/configure
> @@ -634,8 +634,6 @@ LWIP_VERSION
>  LWIP_URL
>  NEWLIB_VERSION
>  NEWLIB_URL
> -ZLIB_VERSION
> -ZLIB_URL
>  INSTALL_DATA
>  INSTALL_SCRIPT
>  INSTALL_PROGRAM
> @@ -722,7 +720,6 @@ CFLAGS
>  LDFLAGS
>  LIBS
>  CPPFLAGS
> -ZLIB_URL
>  NEWLIB_URL
>  LWIP_URL
>  GMP_URL
> @@ -1372,7 +1369,6 @@ Some influential environment variables:
>    LIBS        libraries to pass to the linker, e.g. -l<library>
>    CPPFLAGS    (Objective) C/C++ preprocessor flags, e.g. -I<include dir> if
>                you have headers in a nonstandard directory <include dir>
> -  ZLIB_URL    Download url for zlib
>    NEWLIB_URL  Download url for newlib
>    LWIP_URL    Download url for lwip
>    GMP_URL     Download url for libgmp
> @@ -4023,17 +4019,6 @@ fi
>  # Stubdom libraries version and url setup
>  
>  
> -if test "x$ZLIB_URL" = "x"
> -then :
> -
> -	ZLIB_URL=\$\(XEN_EXTFILES_URL\)
> -fi
> -ZLIB_VERSION="1.2.3"
> -
> -
> -
> -
> -
>  if test "x$NEWLIB_URL" = "x"
>  then :
>  
> diff --git a/stubdom/configure.ac b/stubdom/configure.ac
> index d3d2a840d3..34a47c95e1 100644
> --- a/stubdom/configure.ac
> +++ b/stubdom/configure.ac
> @@ -38,7 +38,6 @@ AC_PROG_INSTALL
>  AX_DEPENDS_PATH_PROG([vtpm], [CMAKE], [cmake])
>  
>  # Stubdom libraries version and url setup
> -AX_STUBDOM_LIB([ZLIB], [zlib], [1.2.3])
>  AX_STUBDOM_LIB([NEWLIB], [newlib], [1.16.0], [https://sourceware.org/ftp/newlib])
>  AX_STUBDOM_LIB([LWIP], [lwip], [1.3.0], [https://download.savannah.gnu.org/releases/lwip])
>  AX_STUBDOM_LIB([GMP], [libgmp], [4.3.2], [https://gmplib.org/download/gmp/archive])
> -- 
> 2.55.0
> 

-- 
Samuel
Accroche-toi au terminal, j'enlève le shell...
 -+- nojhan -+-

