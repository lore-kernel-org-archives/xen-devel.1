Return-Path: <SRS0=HZRB=CF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E63C433E1
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2020 10:30:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C80B62078A
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2020 10:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C80B62078A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBFB2-0005sL-Rk; Thu, 27 Aug 2020 10:30:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBFB1-0005sG-Ey
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 10:30:39 +0000
X-Inumbo-ID: c0ffe559-9b1f-4ef2-a301-b65c2d4a5e13
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c0ffe559-9b1f-4ef2-a301-b65c2d4a5e13;
 Thu, 27 Aug 2020 10:30:38 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id o4so4864210wrn.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 03:30:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Qd42ZVjHsjDermZ8REdrSBMXFlC6vrXppad9tl4L5qo=;
 b=EpGaVh4Orq32awIDj83rhlvKz8m4soQYDmtZiYu9GQ39y+hstdciF89S51wn8WbEwR
 P1O2S5WogFTRnentCBuC2b0RFCnKWchGV6kTV7OJRoQbo51p4o5+zMZTF8ajFwEW9K7n
 KjtRUZCENoYzYRLAKyL/VwjwDKyna5I4Ail0Owf1gKxODBr9zkqGSCe5YNWjh1XvFHWw
 zDVjJDjOgMZ+ec7SZs0jK2fKIAuM2z7y4mmgHWjDbNxtZbJLUszol0O16J7vEgRhRXx2
 XUY7XMLrXNi+JYg/p00FxJoOyMIF0LBpwuoUm3XirSxMscDK+PkpxOpgrnlSfQdrIPKS
 YALA==
X-Gm-Message-State: AOAM532W5miw+3VDGhPq3GHczn2hA6V8q6iJdumLLVrZhtw7YJTICQMj
 Pxec+G3q8stfDfwORziGcJ8=
X-Google-Smtp-Source: ABdhPJxmd5UVT/p6KWrQpAmKkp7i+d9UJ5w1SpwD6eLmWIQc+N7uVZK8N80uUL2/X5ezAhrT+zW+cQ==
X-Received: by 2002:a5d:51c3:: with SMTP id n3mr20011296wrv.104.1598524237386; 
 Thu, 27 Aug 2020 03:30:37 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id f6sm5381754wro.5.2020.08.27.03.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 03:30:36 -0700 (PDT)
Date: Thu, 27 Aug 2020 10:30:35 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 09/38] tools: drop explicit path specifications for
 qemu build
Message-ID: <20200827103035.3edzulgiwkyatbbc@liuwe-devbox-debian-v2>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-10-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823093519.18386-10-jgross@suse.com>
User-Agent: NeoMutt/20180716
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Looks fine to me

Cc Anthony in case he has any objection.

On Sun, Aug 23, 2020 at 11:34:50AM +0200, Juergen Gross wrote:
> Since more than three years now qemu is capable to set the needed
> include and library paths for the Xen libraries via pkg-config.
> 
> So drop the specification of those paths in tools/Makefile. This will
> enable to move libxenctrl away from tools/libxc, as qemu's configure
> script has special treatment of this path.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  tools/Makefile | 26 +-------------------------
>  1 file changed, 1 insertion(+), 25 deletions(-)
> 
> diff --git a/tools/Makefile b/tools/Makefile
> index 198b239edc..7c9f9fc900 100644
> --- a/tools/Makefile
> +++ b/tools/Makefile
> @@ -245,32 +245,8 @@ subdir-all-qemu-xen-dir: qemu-xen-dir-find
>  		-DXC_WANT_COMPAT_GNTTAB_API=1 \
>  		-DXC_WANT_COMPAT_MAP_FOREIGN_API=1 \
>  		-DXC_WANT_COMPAT_DEVICEMODEL_API=1 \
> -		-I$(XEN_ROOT)/tools/include \
> -		-I$(XEN_ROOT)/tools/libs/toolcore/include \
> -		-I$(XEN_ROOT)/tools/libs/toollog/include \
> -		-I$(XEN_ROOT)/tools/libs/evtchn/include \
> -		-I$(XEN_ROOT)/tools/libs/gnttab/include \
> -		-I$(XEN_ROOT)/tools/libs/foreignmemory/include \
> -		-I$(XEN_ROOT)/tools/libs/devicemodel/include \
> -		-I$(XEN_ROOT)/tools/libxc/include \
> -		-I$(XEN_ROOT)/tools/xenstore/include \
> -		-I$(XEN_ROOT)/tools/xenstore/compat/include \
>  		$(EXTRA_CFLAGS_QEMU_XEN)" \
> -		--extra-ldflags="-L$(XEN_ROOT)/tools/libxc \
> -		-L$(XEN_ROOT)/tools/xenstore \
> -		-L$(XEN_ROOT)/tools/libs/toolcore \
> -		-L$(XEN_ROOT)/tools/libs/evtchn \
> -		-L$(XEN_ROOT)/tools/libs/gnttab \
> -		-L$(XEN_ROOT)/tools/libs/foreignmemory \
> -		-L$(XEN_ROOT)/tools/libs/devicemodel \
> -		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/toolcore \
> -		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/toollog \
> -		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/evtchn \
> -		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/gnttab \
> -		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/call \
> -		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/foreignmemory \
> -		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/devicemodel \
> -		$(QEMU_UPSTREAM_RPATH)" \
> +		--extra-ldflags="$(QEMU_UPSTREAM_RPATH)" \
>  		--bindir=$(LIBEXEC_BIN) \
>  		--datadir=$(SHAREDIR)/qemu-xen \
>  		--localstatedir=$(localstatedir) \
> -- 
> 2.26.2
> 

