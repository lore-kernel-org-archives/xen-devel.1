Return-Path: <SRS0=Vf37=J7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EAB8C433ED
	for <xen-devel@archiver.kernel.org>; Tue,  4 May 2021 13:08:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E980611AE
	for <xen-devel@archiver.kernel.org>; Tue,  4 May 2021 13:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E980611AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ens-lyon.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.122353.230750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldumm-0000W4-8E; Tue, 04 May 2021 13:08:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122353.230750; Tue, 04 May 2021 13:08:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldumm-0000Vx-55; Tue, 04 May 2021 13:08:24 +0000
Received: by outflank-mailman (input) for mailman id 122353;
 Tue, 04 May 2021 13:08:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c7IS=J7=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1lduml-0000Vs-8l
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 13:08:23 +0000
Received: from hera.aquilenet.fr (unknown [185.233.100.1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b62c44fc-f32a-4f59-ac2a-6e7c51da99a1;
 Tue, 04 May 2021 13:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 4673DAF;
 Tue,  4 May 2021 15:08:21 +0200 (CEST)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N_alPIsPs8l7; Tue,  4 May 2021 15:08:20 +0200 (CEST)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id D5F2240;
 Tue,  4 May 2021 15:08:15 +0200 (CEST)
Received: from samy by begin with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1ldumc-00FpLS-U6; Tue, 04 May 2021 15:08:14 +0200
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
X-Inumbo-ID: b62c44fc-f32a-4f59-ac2a-6e7c51da99a1
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Tue, 4 May 2021 15:08:14 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/9] stubom: newlib: Enable C99 formats for %z
Message-ID: <20210504130814.ztkdptd2p4xxtc6i@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210504124842.220445-1-jandryuk@gmail.com>
 <20210504124842.220445-4-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210504124842.220445-4-jandryuk@gmail.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 4673DAF
X-Spamd-Result: default: False [-2.50 / 15.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 HAS_ORG_HEADER(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 FREEMAIL_TO(0.00)[gmail.com];
	 RCVD_NO_TLS_LAST(0.10)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MID_RHS_NOT_FQDN(0.50)[];
	 BAYES_HAM(-3.00)[100.00%]

Jason Andryuk, le mar. 04 mai 2021 08:48:36 -0400, a ecrit:
> vtpmmgr was changed to print size_t with the %z modifier, but newlib
> isn't compiled with %z support.  So you get output like:
> 
> root seal: zu; sector of 13: zu
> root: zu v=zu
> itree: 36; sector of 112: zu
> group: zu v=zu id=zu md=zu
> group seal: zu; 5 in parent: zu; sector of 13: zu
> vtpm: zu+zu; sector of 48: zu
> 
> Enable the C99 formats in newlib so vtpmmgr prints the numeric values.
> 
> Fixes 9379af08ccc0 "stubdom: vtpmmgr: Correctly format size_t with %z
> when printing."
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> I haven't tried, but the other option would be to cast size_t and avoid
> %z.  Since this seems to be the only mini-os use of %z, that may be
> better than building a larger newlib.

The size difference will be very small. I believe we prefer to have a
working %z rather than getting surprised to see it non-working.

> ---
>  stubdom/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/stubdom/Makefile b/stubdom/Makefile
> index 90d9ffcd9f..c6de5f68ae 100644
> --- a/stubdom/Makefile
> +++ b/stubdom/Makefile
> @@ -105,7 +105,7 @@ cross-newlib: $(NEWLIB_STAMPFILE)
>  $(NEWLIB_STAMPFILE): mk-headers-$(XEN_TARGET_ARCH) newlib-$(NEWLIB_VERSION)
>  	mkdir -p newlib-$(XEN_TARGET_ARCH)
>  	( cd newlib-$(XEN_TARGET_ARCH) && \
> -	  CC_FOR_TARGET="$(CC) $(TARGET_CPPFLAGS) $(TARGET_CFLAGS) $(NEWLIB_CFLAGS)" AR_FOR_TARGET=$(AR) LD_FOR_TARGET=$(LD) RANLIB_FOR_TARGET=$(RANLIB) ../newlib-$(NEWLIB_VERSION)/configure --prefix=$(CROSS_PREFIX) --verbose --target=$(GNU_TARGET_ARCH)-xen-elf --enable-newlib-io-long-long --disable-multilib && \
> +	  CC_FOR_TARGET="$(CC) $(TARGET_CPPFLAGS) $(TARGET_CFLAGS) $(NEWLIB_CFLAGS)" AR_FOR_TARGET=$(AR) LD_FOR_TARGET=$(LD) RANLIB_FOR_TARGET=$(RANLIB) ../newlib-$(NEWLIB_VERSION)/configure --prefix=$(CROSS_PREFIX) --verbose --target=$(GNU_TARGET_ARCH)-xen-elf --enable-newlib-io-long-long --enable-newlib-io-c99-formats --disable-multilib && \
>  	  $(MAKE) DESTDIR= && \
>  	  $(MAKE) DESTDIR= install )
>  
> -- 
> 2.30.2
> 

