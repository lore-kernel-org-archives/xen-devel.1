Return-Path: <SRS0=2tZV=6L=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD4BC54FD0
	for <xen-devel@archiver.kernel.org>; Mon, 27 Apr 2020 13:20:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 269D82064C
	for <xen-devel@archiver.kernel.org>; Mon, 27 Apr 2020 13:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 269D82064C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT3g0-0001Aj-PJ; Mon, 27 Apr 2020 13:20:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R4Dr=6L=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jT3fz-0001Ae-3N
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 13:19:59 +0000
X-Inumbo-ID: cab1314a-8889-11ea-b07b-bc764e2007e4
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cab1314a-8889-11ea-b07b-bc764e2007e4;
 Mon, 27 Apr 2020 13:19:58 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id v8so16969wma.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2020 06:19:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=SpZYwT0NHxT5rnUVIzIdlq47W3ArxQiY9+1sf5kBekg=;
 b=GSNHGRevoqrQMh1/nIKRrYuGQxQrARTftXFyZ5tiG2U35aOET9H8g/pN3qlCvOSSNk
 UPfbt0U+pBqek46K9BEfpD9URxwpUm/F5beHUyXciuE+NhejPauNU0b+N1zl04Hmx+v6
 ksubtrU+fc8wj/msg4KSEfCeyyTyotxky/wKfXAqp6At5SU5KA3m5Za5VE45x7o1oEZ3
 O0ZTj2pOTd9JgUTOamnxnM5ukQA4hWX//c0423WMmR0WhI9wxDlLH1IpgHhOX4GaI+tJ
 glz4kOSWA1ukV8hLJKLJfSvm5cfn0cdUBgLouKPTbvg63X1rxgYHyNW81RI/MyURNCiS
 zF+w==
X-Gm-Message-State: AGi0PuauvxXkF/yyY8/BV5w4JoANW37pYW+nh/YGt8+j5M6Cqk1vfBYP
 pu4MNRETBtyPWMX1HfD3lMQ=
X-Google-Smtp-Source: APiQypJzZ95E02qae4Hy8mtG8raa8tBypLV8WSL8JLAGhiSz4EhJY+0YuMZszu6mfBSOrnF6n7E3sA==
X-Received: by 2002:a1c:7d4b:: with SMTP id y72mr26905153wmc.11.1587993597744; 
 Mon, 27 Apr 2020 06:19:57 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id h1sm16355648wme.42.2020.04.27.06.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 06:19:57 -0700 (PDT)
Date: Mon, 27 Apr 2020 13:19:55 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/IST: Fix comment about stack layout
Message-ID: <20200427131955.tqcnjdppinr4oopk@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20200427131702.13991-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200427131702.13991-1-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Apr 27, 2020 at 02:17:02PM +0100, Andrew Cooper wrote:
> This was an oversight in c/s 5d37af364dc "x86/traps: Use an Interrupt Stack
> Table for #DB" which introduced the #DB IST to begin with.
> 
> Reported-by: Jan Beulich <JBeulich@suse.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Wei Liu <wl@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/include/asm-x86/current.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/include/asm-x86/current.h b/xen/include/asm-x86/current.h
> index 0b47485337..39c2c6cbf8 100644
> --- a/xen/include/asm-x86/current.h
> +++ b/xen/include/asm-x86/current.h
> @@ -18,7 +18,7 @@
>   * 6 - Primary stack
>   * 5 - Optionally not present (MEMORY_GUARD)
>   * 4 - Unused; optionally not present (MEMORY_GUARD)
> - * 3 - Unused; optionally not present (MEMORY_GUARD)
> + * 3 -  DB IST stack

There seems to be an extraneous space before "DB".

Wei.

>   * 2 - MCE IST stack
>   * 1 - NMI IST stack
>   * 0 - Double Fault IST stack
> -- 
> 2.11.0
> 

