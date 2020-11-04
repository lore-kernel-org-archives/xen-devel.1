Return-Path: <SRS0=nsPS=EK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4A70C4742C
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2020 17:20:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12ED220782
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2020 17:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12ED220782
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.19430.44613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaMRk-0003xd-KJ; Wed, 04 Nov 2020 17:19:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19430.44613; Wed, 04 Nov 2020 17:19:44 +0000
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
	id 1kaMRk-0003xW-HN; Wed, 04 Nov 2020 17:19:44 +0000
Received: by outflank-mailman (input) for mailman id 19430;
 Wed, 04 Nov 2020 17:19:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kZ++=EK=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kaMRi-0003xQ-Fj
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 17:19:42 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9695d997-d724-4e72-8dee-6c549aab909a;
 Wed, 04 Nov 2020 17:19:41 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 0A4HJSw0001780
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 4 Nov 2020 12:19:34 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 0A4HJSsS001779;
 Wed, 4 Nov 2020 09:19:28 -0800 (PST) (envelope-from ehem)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=kZ++=EK=m5p.com=ehem@srs-us1.protection.inumbo.net>)
	id 1kaMRi-0003xQ-Fj
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 17:19:42 +0000
X-Inumbo-ID: 9695d997-d724-4e72-8dee-6c549aab909a
Received: from mailhost.m5p.com (unknown [74.104.188.4])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 9695d997-d724-4e72-8dee-6c549aab909a;
	Wed, 04 Nov 2020 17:19:41 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 0A4HJSw0001780
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Wed, 4 Nov 2020 12:19:34 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.15.2/8.15.2/Submit) id 0A4HJSsS001779;
	Wed, 4 Nov 2020 09:19:28 -0800 (PST)
	(envelope-from ehem)
Date: Wed, 4 Nov 2020 09:19:28 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v2] tools/python: pass more -rpath-link options to ld
Message-ID: <20201104171928.GA1647@mattapan.m5p.com>
References: <8cf8cfa9-2b0c-123a-2d23-8932e61085fa@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8cf8cfa9-2b0c-123a-2d23-8932e61085fa@suse.com>

On Wed, Nov 04, 2020 at 03:57:49PM +0100, Jan Beulich wrote:
> --- a/tools/python/Makefile
> +++ b/tools/python/Makefile
> @@ -8,19 +8,21 @@ PY_CFLAGS = $(CFLAGS) $(PY_NOOPT_CFLAGS)
>  PY_LDFLAGS = $(SHLIB_LDFLAGS) $(APPEND_LDFLAGS)
>  INSTALL_LOG = build/installed_files.txt
>  
> +setup.py = CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDSHARED="$(CC)" LDFLAGS="$(PY_LDFLAGS)" \
> +           SHLIB_libxenctrl="$(SHLIB_libxenctrl)" \
> +           SHLIB_libxenguest="$(SHLIB_libxenguest)" \
> +           SHLIB_libxenstore="$(SHLIB_libxenstore)" \
> +           $(PYTHON) setup.py
> +
>  .PHONY: build
>  build:
> -	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDSHARED="$(CC)" LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) setup.py build
> +	$(setup.py) build
>  
>  .PHONY: install
>  install:
>  	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
> -
> -	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDSHARED="$(CC)" \
> -		LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) setup.py install \
> -		--record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
> +	$(setup.py) install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
>  		--root="$(DESTDIR)" --force
> -
>  	$(INSTALL_PYTHON_PROG) scripts/convert-legacy-stream $(DESTDIR)$(LIBEXEC_BIN)
>  	$(INSTALL_PYTHON_PROG) scripts/verify-stream-v2 $(DESTDIR)$(LIBEXEC_BIN)

Shouldn't similar work of moving all the environment variable settings to
a $(setup.py) variable be done for tools/pygrub/Makefile?

tools/python/Makefile and tools/pygrub/Makefile are presently quite
similar and keeping them similar seems a Good Idea(tm).


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



