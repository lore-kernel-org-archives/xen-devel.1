Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98280C9830E
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2026 07:43:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1433450.1654014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA0Zz-0000je-6S; Fri, 25 Sep 2026 07:42:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1433450.1654014; Fri, 25 Sep 2026 07:42:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA0Zz-0000jX-3J; Fri, 25 Sep 2026 07:42:47 +0000
Received: by outflank-mailman (input) for mailman id 1433450;
 Fri, 25 Sep 2026 07:42:45 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <error27@gmail.com>) id 1xA0Zx-0000jR-4M
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 07:42:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xA0Zw-00C1CK-AC
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 09:42:44 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <error27@gmail.com>)
 id 6ab625f0-e002-0a2a0a5209dd-0a2a4505b3c2-8
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 09:42:44 +0200
Received: from [74.125.225.99] (helo=mail-wr2-f35.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <error27@gmail.com>)
 id 6ab625f4-4cb1-0a2a45050019-4a7de163b555-3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 09:42:44 +0200
Received: by mail-wr2-f35.google.com with SMTP id
 ffacd0b85a97d-4888129c46eso71623f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 00:42:44 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a355d96sm5487752f8f.17.2026.09.25.00.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 00:42:42 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790322164; x=1790926964; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zWr1PMB3Rc/UXhUDgKdBkp20G3Gj5KQDsYg0EGVPPQM=;
        b=Gq8KI+HJYmPyhA0AEhws913JPzo7un0XnnScprSSTRA4I7AUbW/4s6wNZNJzpBNwIS
         xcEDO5sHTLnRl5+N3SK9auf8kt9DZ30PdlqeXlTskKo1YPM3amj092f/MaUXEjA/QihL
         C9jQf1I2QLUmkOhObXermqnheTwOcc0t/JKoYr8xWtEPCAE9MG4E5B7O+dGgbMn1wKOE
         5AkJ9dd02QoRC4KUfofYDbdsIJr1RLF+ge6Zj/lm1DqyeIOhLVMDoEqSYf3wL9Th0YIl
         QoVq7QRStfs+vKuLoCMPRE8FSILwuxltQpAlRq1Og/YzW3J/XtKKFRsoqJOsw4wGLkow
         yUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790322164; x=1790926964;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zWr1PMB3Rc/UXhUDgKdBkp20G3Gj5KQDsYg0EGVPPQM=;
        b=geJFfk4JQtUibMzDqmhWKQutCvQ+3F6uaJ1t2V+XSaw42ISIU4tdnY25B25ky5bR4G
         8FPPmu/YiucDocEKSxlrQj3uqu4NhSwqnkraaG/3QhHXeS6+6qv0zhO/jvj8Uz+YpYL3
         7Pesbmi9+24gf8kqHqM/cN9ahmH8G+L3QJ5J+z0BPlTUPVb3WwZ2Egf+SeiDMaEJrvmn
         tIYkS4GWmgOccz/+PMoBjoPPxh7U8H9IVQakH+rxQDGJ8/UTTembVE/IT/DCEDxG8xeX
         PVCs3beRQtuH1ivgy0m6waOc33Iu/atjJTzOLLULsAN+Q2HYIjD0CCpBROcS+z/+SGup
         Jvjw==
X-Forwarded-Encrypted: i=1; AKwUvBzE3wutvs2piQcDVbs974a1oJjwZKeaUVWC2eTU8vCobGyogWBOnlw43hYTtIbcTE+DtEn5mTHaQio=@lists.xenproject.org
X-Gm-Message-State: AFuF++l6Z7UAnnXkfRb1dPgdVerxES6PPWeKu7HSMiaJCUrClOJtw7nv
	T/Y9KO54ln2uxX1CKEgGKiPKOgnq/RBfid2zoN0WaeT0ovOpFhR4ZQ1x
X-Gm-Gg: AYBFou3lIfQiyK2h5NAMeCgtl/fkg4XN6DASqI7gBuMNLNoklvsqVITNuQqHfHXw8lE
	pHluCsJZ7MGwxq4gKodGMUvi/CPpGGEsYeUcYjhbU5a4HrQAu1d0hH5y7wbuRePZkpPOvuBFP14
	g/lSMUhEhbFpLOsfKpnv33jWK8psTKvBhbqTfHB8xNKHl4DxnC7cuNYVwhHTgorYCOLwEzDZFWz
	KsxRJnKXs6r9Mju9HQSIo34QFsTQPw6GE671MLWaiDk70LP/TBNw17XXZHQkW3tDbRRpY6JToe3
	y+LawZYaLOT+dfoOJ12dBgDOykYlT7lufllB+/jXgE64cq+LvNbvrElYrU4wL4tME/L3RZHgrYQ
	5yid258w3a+Eq1/ejUPup6Uq8Usx7GCqs6zIigDVdT9dLHqFrtgTaXElAigKl0Bx2/E0YWoteUQ
	xaAC33lNXh2K3DDFWUq2Sb/jh3ypOhAZLepXFzBHPeGfNC2D9hmXfLEOlszZezZ27ll34=
X-Received: by 2002:a05:6000:4103:b0:488:7496:15b5 with SMTP id ffacd0b85a97d-48874961605mr5882933f8f.47.1790322163538;
        Fri, 25 Sep 2026 00:42:43 -0700 (PDT)
Date: Fri, 25 Sep 2026 10:42:38 +0300
From: Dan Carpenter <error27@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild@lists.linux.dev, kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: drivers/xen/gntdev.c:817 gntdev_get_page() warn: mask and shift
 to zero: expr='(addr & ~(~((1 << 12) - 1))) >> 12'
Message-ID: <arYl7m87hzxROT86@stanley.mountain>
References: <202609241805.VsLzGPLn-lkp@intel.com>
 <94cbe491-1b32-47ec-a9b5-bed69bc4d52c@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94cbe491-1b32-47ec-a9b5-bed69bc4d52c@app.fastmail.com>
X-purgate-ID: tlsNG-c201ff/1790322164-73CB82A1-939E235D/0/0
X-purgate-type: clean
X-purgate-size: 1311

On Fri, Sep 25, 2026 at 08:43:54AM +0200, Arnd Bergmann wrote:
> On Thu, Sep 24, 2026, at 21:39, Dan Carpenter wrote:
> 
> >    489                          return -EFAULT;
> >    490                  break;
> >    491          case 2:
> >    492                  if (copy_from_user(&m, udata, sizeof(struct 
> > privcmd_mmapbatch_v2)))
> >    493                          return -EFAULT;
> >    494                  /* Returns per-frame error code in m.err. */
> >    495                  if (!access_ok(m.err, m.num * (sizeof(*m.err))))
> >                                               ^^^^^^^^^^^^^^^^^^^^^^^
> > These integer overflow bugs are from 2012, but I guess your patch 
> > exposed
> > the arm32 build to the zero day bot.  The bugs only affect 32bit 
> > systems.
> 
> Right, the randconfig came up with an ARMv6 Xen build, which was not
> possible before my patch. I'm sure this was reported for other configs
> before and just showed up as introduced by my patch here.
> 
> This is clearly a bug but it does look harmless to me, as it only
> results in the userspace corrupting itself when passing invalid
> data.

In ancient times, these access_ok() overflows were a much bigger deal.
Easy to solve with a size_mul(m.num, sizeof(*m.err)).

regards,
dan carpenter

