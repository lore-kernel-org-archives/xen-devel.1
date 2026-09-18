Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF103C982DA
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 13:42:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1425429.1649375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7YqZ-00047C-5f; Fri, 18 Sep 2026 13:41:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1425429.1649375; Fri, 18 Sep 2026 13:41:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7YqZ-000474-29; Fri, 18 Sep 2026 13:41:47 +0000
Received: by outflank-mailman (input) for mailman id 1425429;
 Fri, 18 Sep 2026 13:41:46 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peterx@redhat.com>) id 1x7YqY-00046y-0c
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 13:41:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7YqW-00H3bU-Py
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 15:41:44 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peterx@redhat.com>)
 id 6aad3f96-8faa-0a2a0a5109dd-0a2a450cc534-6
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 15:41:44 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peterx@redhat.com>)
 id 6aad3f97-f479-0a2a450c0019-aa0a817cb93b-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 15:41:44 +0200
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-1SauZwYKM9iiP2SvQtFw5Q-1; Fri, 18 Sep 2026 09:41:41 -0400
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93a0b66ecd9so102336485a.2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 06:41:41 -0700 (PDT)
Received: from localhost ([2605:8d80:6cca:5143:ebc:a1f4:364f:cf43])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93be0efd37bsm141509485a.38.2026.09.18.06.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 06:41:38 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789738903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fA+YtUCi0+i0hv6NQ/TTYdlAyqtE/zN8XZqq/DhWBp0=;
	b=drTdKTH0xRN5Sew06FAoEOEwM921o3pV5nvd5gb0O2ndIM+PwnkvXJlK0wxgrZoodjqe+r
	qMg3NAnzOSWjvzSuTm3+uv+2bTDg1c4v/RxXJxXe3+xke+9ERnzNM6gQ0ONCRms3Vq4gbk
	vXqg4Ea+Q2vEht9u42PP8p1qmDgA2z0=
X-MC-Unique: 1SauZwYKM9iiP2SvQtFw5Q-1
X-Mimecast-MFC-AGG-ID: 1SauZwYKM9iiP2SvQtFw5Q_1789738901
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738901; x=1790343701;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fA+YtUCi0+i0hv6NQ/TTYdlAyqtE/zN8XZqq/DhWBp0=;
        b=V2xbH8TKHcj/qxEkgKZ+m1iMdpMSf/rZI/Qd4Y4477C8RC6OiByc5Odo7lcxUCGyNd
         X0RL6jDEg/DUJV8cXV8urGQY7Xnnui/kyVWVCUrOWliZALNerrRLK/4Cb5XjkVx71l/7
         7XtQNZCAqVtMmVr8owXgU5VcWLn1rlsf12UzjsbQQud4p58YUqFp2QKkv+TxDOnY4fWQ
         2LeOOQsL/ArWt6mkUEy4jbFSb4T6SF8bdTaQnLR2uJYP20qrnPUNGVTC5XMXRry/awY4
         sx01UhXEpZdzQ0268OYXUl5qXi2c32JCYFIMqLk369wD09QmwlVAkMqGsXb2YrE6QahG
         wjLg==
X-Forwarded-Encrypted: i=1; AKwUvBxdMG4OQUvTsj+fqWsbtuTSlRu7haP6eS1Hw34bEK/V6Oz63+jh0plAX+Dy8GlW8yN0419GMLGgiPg=@lists.xenproject.org
X-Gm-Message-State: AFuF++luDD+JlQXqucBdVRKeC/XV8JJKsL14XqzfRpGtvYMPa/DNHDxt
	lyU2ieZxd2tothX9ZuyHf86pF35Bxo5XkyK+jUAFslS+BGDQu/g4QmLpsnvY9uTxWROffBio2ZK
	P6hd+OtW7DwDygR+pjZl37ejrPatTeB+teoDsL0J64SThHBsr/JB1Jif44pk6rXUFJSy8
X-Gm-Gg: AYBFou0YaOlRQ/i3/B9kq2Qx69Slz2Z08RKIQ8OifKEvRXnVvltC7MKPG5eDZLhKglE
	1eAVttK1R5pMziezcfapzLKUTMbNWsLt+5q8miZ4z/Xloug/fG0r/+tgKGeLzuHkCQ0tphy/vpO
	LLl2jhv9SjrwRlDWIdMjTg/rq38PNWyDptg/gV0gF/k1cZpLevkE40Eyp7quhWlOdFzMOiu6gxk
	+XL47HdRN6RR3mQiVvcMZYwWIxGGrsbahD+5GkXMcmLKiwwRAM8gBU4UQABsWpyYm1/TAtk+IVN
	8gO3XN6jxJjnSfbKjT8O3cc45n+9CT7yG7rWmyhdZHHsaJZrFguYUQ6Y1sEEs3E3crKPRzE=
X-Received: by 2002:a05:620a:44d4:b0:939:a45b:76ee with SMTP id af79cd13be357-93bdc70bf55mr372481885a.23.1789738900964;
        Fri, 18 Sep 2026 06:41:40 -0700 (PDT)
X-Received: by 2002:a05:620a:44d4:b0:939:a45b:76ee with SMTP id af79cd13be357-93bdc70bf55mr372473185a.23.1789738900043;
        Fri, 18 Sep 2026 06:41:40 -0700 (PDT)
Date: Fri, 18 Sep 2026 09:41:36 -0400
From: Peter Xu <peterx@redhat.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PULL 04/11] xen-mapcache: Remove 32bit support
Message-ID: <aq0_kJXNWJv_rjzh@zhexu-thinkpadt14gen5.rmtcaon.csb>
References: <20260918113926.831204-1-peterx@redhat.com>
 <20260918113926.831204-5-peterx@redhat.com>
 <0bf76f4f-8762-4e28-9964-479400e8ec76@citrix.com>
MIME-Version: 1.0
In-Reply-To: <0bf76f4f-8762-4e28-9964-479400e8ec76@citrix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KKwNbS9kMepvI91Jk-fFWhUfEHrQWmcFHGxiH74flUY_1789738901
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-purgate-ID: tlsNG-d25034/1789738904-012C8A5B-6EA0E32C/0/0
X-purgate-type: clean
X-purgate-size: 2657

On Fri, Sep 18, 2026 at 02:14:26PM +0100, Ross Lagerwall wrote:
> On 9/18/26 12:39 PM, Peter Xu wrote:
> > QEMU has switched to 64bit-only hosts for all system emulations.
> > 
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > Link: https://lore.kernel.org/r/20260818172012.3052821-5-peterx@redhat.com
> > Cc: Stefano Stabellini <sstabellini@kernel.org>
> > Cc: Anthony PERARD <anthony@xenproject.org>
> > Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> > Cc: xen-devel@lists.xenproject.org
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >   hw/xen/xen-mapcache.c | 12 ++----------
> >   1 file changed, 2 insertions(+), 10 deletions(-)
> > 
> > diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> > index 85cf0cf359..e30c07c2ee 100644
> > --- a/hw/xen/xen-mapcache.c
> > +++ b/hw/xen/xen-mapcache.c
> > @@ -26,11 +26,7 @@
> >   #include <xenevtchn.h>
> >   #include <xengnttab.h>
> > -#if HOST_LONG_BITS == 32
> > -#  define MCACHE_MAX_SIZE     (1UL<<31) /* 2GB Cap */
> > -#else
> > -#  define MCACHE_MAX_SIZE     (1UL<<35) /* 32GB Cap */
> > -#endif
> > +#define MCACHE_MAX_SIZE     (1UL << 35) /* 32GB Cap */
> >   /* This is the size of the virtual address space reserve to QEMU that will not
> >    * be use by MapCache.
> > @@ -151,11 +147,7 @@ void xen_map_cache_init(phys_offset_to_gaddr_t f, void *opaque)
> >           exit(EXIT_FAILURE);
> >       }
> > -    if (HOST_LONG_BITS == 32) {
> > -        bucket_shift = 16;
> > -    } else {
> > -        bucket_shift = 20;
> > -    }
> > +    bucket_shift = 20;
> >       if (geteuid() == 0) {
> >           rlimit_as.rlim_cur = RLIM_INFINITY;
> 
> Using a local variable here to store a constant is a bit weird and its only use
> is to be stored as MapCache.bucket_shift and MapCache.bucket_size which are
> effectively constant. Not sure why this isn't just a couple of #defines at the
> top and used everywhere bucket_shift and bucket_size is needed. Perhaps that is
> further cleanup to be done separately...

True..

It's my bad not noticing that relevant people were not properly copied when
sending the patches; I thought each patch will have its own set of CC from
get_maintainers.pl, but it didn't actually work and I didn't notice.  I
only notice it when I was just to send a pull, hence added Cc: explicitly
at least in the pull sent, feeling that these changes are mostly cosmotic
and safe.

It'll be great if this can be done separately, makes me easier.  If there's
any strong feeling on any of the changes, please speak and then I'll redo
the work.

Thanks,

-- 
Peter Xu


