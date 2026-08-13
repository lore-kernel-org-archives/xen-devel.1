Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BBAC5CFDB
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 21:18:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390469.1630839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wucoq-0000e6-5y; Thu, 13 Aug 2026 21:18:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390469.1630839; Thu, 13 Aug 2026 21:18:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wucoq-0000do-1c; Thu, 13 Aug 2026 21:18:32 +0000
Received: by outflank-mailman (input) for mailman id 1390469;
 Thu, 13 Aug 2026 21:18:31 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MYTl=GG=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1wucop-0000dA-3n; Thu, 13 Aug 2026 21:18:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wucoo-00EBEX-4T; Thu, 13 Aug 2026 23:18:30 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <SRS0=MYTl=GG=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 6a7e3478-e002-0a2a0a5209dd-0a2a4509c816-34
 for <multiple-recipients>; Thu, 13 Aug 2026 23:18:30 +0200
Received: from [140.77.166.138] (helo=sonata.ens-lyon.org)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <SRS0=MYTl=GG=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 6a7e34a5-be1a-0a2a45090019-8c4da68ac932-3
 for <multiple-recipients>; Thu, 13 Aug 2026 23:18:29 +0200
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 78800A03D6;
 Thu, 13 Aug 2026 23:18:29 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Biosfp3CpO7b; Thu, 13 Aug 2026 23:18:29 +0200 (CEST)
Received: from end (127.106.204.77.rev.sfr.net [77.204.106.127])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 2ABFAA027F;
 Thu, 13 Aug 2026 23:18:29 +0200 (CEST)
Received: from samy by end with local (Exim 4.99.4)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1wucoh-00000003dtV-1E53; Thu, 13 Aug 2026 23:18:23 +0200
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
	t=1786655909; bh=eUm/BKILMvafmrYaAKy7p85VbQYkTASxN3IRiK88RCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O7Nyy3Zu6kR+j1p4jHFpbmgUkRh6di5+NZQm+LZqghGXRNyB1PtS2w6GqqJ/KHX1w
	 bXmqWvdmM1E6Hk6mEJgFLbfIuv2nk/9DgO4BI3BrVp/Ipq7jvXvBFfJbCdFXA4Ogl/
	 VAmynStpYlZ3jFWv+L7gj6CCHG8YRLzwLJi18IkBzBLacXo+V0en3NMAI7oNpoXYoO
	 BgJFeGNJBiGJhl9uxAwNTpPi5N3aK/Vi10MA/KNR1Q/EGDWoNZW7u37UTvPq3CoUie
	 zFX5UAL9P1eSsq4yene0VCj9rSR3M5dKqT5GpXY+I36LE+AYBt65MFMIMBVcqqKVqb
	 comsu6HoYYRew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ens-lyon.org; s=dkim;
	t=1786655909; bh=eUm/BKILMvafmrYaAKy7p85VbQYkTASxN3IRiK88RCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O7Nyy3Zu6kR+j1p4jHFpbmgUkRh6di5+NZQm+LZqghGXRNyB1PtS2w6GqqJ/KHX1w
	 bXmqWvdmM1E6Hk6mEJgFLbfIuv2nk/9DgO4BI3BrVp/Ipq7jvXvBFfJbCdFXA4Ogl/
	 VAmynStpYlZ3jFWv+L7gj6CCHG8YRLzwLJi18IkBzBLacXo+V0en3NMAI7oNpoXYoO
	 BgJFeGNJBiGJhl9uxAwNTpPi5N3aK/Vi10MA/KNR1Q/EGDWoNZW7u37UTvPq3CoUie
	 zFX5UAL9P1eSsq4yene0VCj9rSR3M5dKqT5GpXY+I36LE+AYBt65MFMIMBVcqqKVqb
	 comsu6HoYYRew==
Date: Thu, 13 Aug 2026 23:18:23 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Subject: Re: [MINI-OS PATCH] build: don't add -lm -lpci -lz to APP_LDLIBS
Message-ID: <an40n9t6ut_3eNUe@end>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
References: <20260813143536.3607406-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260813143536.3607406-1-jgross@suse.com>
Organization: I am not organized
X-purgate-ID: tlsNG-bad1c0/1786655910-BDEC6034-117D67ED/0/0
X-purgate-type: clean
X-purgate-size: 967

Juergen Gross, le jeu. 13 août 2026 16:35:36 +0200, a ecrit:
> libm, libpci and libz are not always needed, so don't add them to
> APP_LDLIBS just because libc is selected.
> 
> In case they will be needed by someone, they should be added via a
> dedicated CONFIG option.
> 
> Note that none of the currently supported Xen stubdoms is using them.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Agreed,

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  Makefile | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index a64913a..7510d5d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -164,9 +164,6 @@ ifeq ($(CONFIG_LIBXENMANAGE),y)
>  APP_LDLIBS += -L$(MANAGE_PATH) -whole-archive -lxenmanage -no-whole-archive
>  LIBS += $(MANAGE_PATH)/libxenmanage.a
>  endif
> -APP_LDLIBS += -lpci
> -APP_LDLIBS += -lz
> -APP_LDLIBS += -lm
>  LDLIBS += -lc
>  endif
>  
> -- 
> 2.55.0
> 

