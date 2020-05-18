Return-Path: <SRS0=XBwx=7A=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 967E0C433DF
	for <xen-devel@archiver.kernel.org>; Mon, 18 May 2020 07:36:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61D6F20715
	for <xen-devel@archiver.kernel.org>; Mon, 18 May 2020 07:36:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U5os+9nU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61D6F20715
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaaK4-0000mh-NM; Mon, 18 May 2020 07:36:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VSjt=7A=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jaaK3-0000mc-Qc
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 07:36:27 +0000
X-Inumbo-ID: 48134f14-98da-11ea-ae69-bc764e2007e4
Received: from mail-wm1-x32d.google.com (unknown [2a00:1450:4864:20::32d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 48134f14-98da-11ea-ae69-bc764e2007e4;
 Mon, 18 May 2020 07:36:27 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id w64so9053593wmg.4
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 00:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=Ut3zX0lDMhHI/3kiw2RPgl+dTpiWvlQB1KHO6HQQWCo=;
 b=U5os+9nUp3Xx1p9nFGD+1FZWuEGYQkKIGMP9ZwW4MVjcSwd5+g4ZBiiJfZR2YoxJ93
 265Puo2xTEO8cgSlOTqKB7gNVUVOqY66JnEwn+4bEtZQyWsGWkV0GxqvsD+ufsICO79N
 TBds4spzzCdgNAyqVuk5aBquwm3oS6BPDgmqrSM9ltTcoTGw9SBdrTZXei7yKCMT4l45
 GLVhGIOvON4p5OVXqEWZyw0SDs2WtyC0PTD2/u5SXzlb+mdST6pAJQSeG3VpTFcrMkIg
 2mbUTAGBMFBS5YeHJ5Lhc+rM+ErTVGQxqymRcH1nXEjZPVHYFfG1IRvpjVXhamIcdFwh
 MsQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=Ut3zX0lDMhHI/3kiw2RPgl+dTpiWvlQB1KHO6HQQWCo=;
 b=qOlCvqsyf4AMWa8BrfBDWy/JKKSG+wl9783eRmPC7crwLgB/w83OO8F87NI3lChex3
 TYc7GsKLphcEeXSLgpveUN51CKet7QSQmB2rQSTnPLyNoE4rSmdPbfigtvDUYlrz3HmU
 zOSJ2co8F/C0BDoiERM1ieSM9tg5m1bYMrW0eHpeoTgbYmjSmX6nc6yRCpeoE6A9cUaB
 x8j+5wJMIGze1IVz9KPCVjsc7rEULjwXVub11sosSLEOSlHn7M/Lkf+so9BXRYNW+oJI
 Jv43F+/eozrZyMYxplnSP0jy1YDpJywHo6cBhgeQzFNw8tHiK7qPsocUjY/u/C2xoJpU
 8Ubg==
X-Gm-Message-State: AOAM533Hbx3zubRv6H48Q9BXo9g1RQyFYmIRL5iNvNobwN2jtHa5v/wK
 VY8FCmqj0UXpweX9mNWX84M=
X-Google-Smtp-Source: ABdhPJz5151iXuXnbhr+BkTmNro4ZbFKb32igu3sxSzvnU54Zrf480MKLOH9k6iFx0b1I5ZmK5i8+Q==
X-Received: by 2002:a1c:c38b:: with SMTP id t133mr17496082wmf.31.1589787386275; 
 Mon, 18 May 2020 00:36:26 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id r11sm16070057wro.15.2020.05.18.00.36.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 May 2020 00:36:25 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Manuel Bouyer'" <bouyer@antioche.eu.org>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>
References: <20200515202912.GA11714@antioche.eu.org>
 <d623cd12-4024-82ba-7388-21f606e1a0bd@citrix.com>
 <20200515210629.GA10976@antioche.eu.org>
 <b1dfc07d-bf0f-da26-79f0-8cf93952689e@citrix.com>
 <20200515215335.GA9991@antioche.eu.org>
 <d22b6b7c-9d1c-4cfb-427a-ca6f440a9b08@citrix.com>
 <20200517173259.GA7285@antioche.eu.org>
 <20200517175607.GA8793@antioche.eu.org>
In-Reply-To: <20200517175607.GA8793@antioche.eu.org>
Subject: RE: IOCTL_PRIVCMD_MMAPBATCH on Xen 4.13.0
Date: Mon, 18 May 2020 08:36:24 +0100
Message-ID: <000a01d62ce7$093b7f50$1bb27df0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGWX+AZzwLaymDWSfMLMVZAbnMTPQIii/0tAVvecg8AeYK6jgI07lBRAkhrFd0CPbsL8AESTYVIqM7iRZA=
Content-Language: en-gb
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
Reply-To: paul@xen.org
Cc: xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Manuel Bouyer
> Sent: 17 May 2020 18:56
> To: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: xen-devel@lists.xenproject.org
> Subject: Re: IOCTL_PRIVCMD_MMAPBATCH on Xen 4.13.0
> 
> On Sun, May 17, 2020 at 07:32:59PM +0200, Manuel Bouyer wrote:
> > I've been looking a bit deeper in the Xen kernel.
> > The mapping is failed in ./arch/x86/mm/p2m.c:p2m_get_page_from_gfn(),
> >         /* Error path: not a suitable GFN at all */
> > 	if ( !p2m_is_ram(*t) && !p2m_is_paging(*t) && !p2m_is_pod(*t) ) {
> > 	    gdprintk(XENLOG_ERR, "p2m_get_page_from_gfn2: %d is_ram %ld is_paging %ld is_pod %ld\n", *t,
> p2m_is_ram(*t), p2m_is_paging(*t), p2m_is_pod(*t) );
> > 	    return NULL;
> > 	}
> >
> > *t is 4, which translates to p2m_mmio_dm
> >
> > it looks like p2m_get_page_from_gfn() is not ready to handle this case
> > for dom0.
> 
> And so it looks like I need to implement osdep_xenforeignmemory_map_resource()
> for NetBSD
> 

It would be a good idea but you shouldn't have to. Also, qemu-trad won't use it even if it is there.

  Paul


