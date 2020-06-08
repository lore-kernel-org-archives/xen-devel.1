Return-Path: <SRS0=2oDP=7V=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BFBEC433E0
	for <xen-devel@archiver.kernel.org>; Mon,  8 Jun 2020 15:36:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E371D206C3
	for <xen-devel@archiver.kernel.org>; Mon,  8 Jun 2020 15:36:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Enqy1cZh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E371D206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiJow-0000Ud-8w; Mon, 08 Jun 2020 15:36:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9p0X=7V=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jiJou-0000UN-FA
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 15:36:16 +0000
X-Inumbo-ID: ca25e8c6-a99d-11ea-9ad7-bc764e2007e4
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca25e8c6-a99d-11ea-9ad7-bc764e2007e4;
 Mon, 08 Jun 2020 15:36:15 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id p5so17874573wrw.9
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 08:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=AAdcvwLZEYI8tW/dlfliX8u319uzIusm9C4VQdniWLg=;
 b=Enqy1cZh2wmktILWp2+F+fSHFRTeMrWYTkRpE25+gqstDsFsQoYN8plq8Wu2xQ2rrY
 svCf1QXbmKtY4TgzpH30TkmVAh25nB69q9N6JsO+GVpo2NDx5t9MG2GPcq3eSmd3svrr
 88X9jCGUX9SlKRY+jrDNOgd5wDf0Nkgb3s1VRHNoihS9rJK5f968yXKzr08w2N3j4or5
 b8fV3qbQec6Zu9wUGuGewroJJWFDhut5oG+GcuU04h0WPkkgJ29s4ODXV2H4nqf42Ebu
 5eRs5UN+JNL0uj79Bkx+fUWo01JFWYYi1iajU4fQVvUTaVnAdMsvr0Ag8oLWrlzPcfhn
 pTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=AAdcvwLZEYI8tW/dlfliX8u319uzIusm9C4VQdniWLg=;
 b=fkTI0UsW4sCENIRXPUPqjVzDrk4s9Y0dXpZIqx2bnIfhPnZO1RbCnP0Lk6vHuATOHO
 7RfMGhxn4qGvO7ycD5iP+QmCQ+uEmaZ/D25B9wyGHdDQhFt8+Vpj+ZgyQrWtdRDsbaBt
 jnV/oKvqP2t0XcKuSWlppAA8uC+lOsGseDrUCFp53P3VzNVDjdbcCxDVepFXGaG7Hwzd
 Zp7uVKTht2NAJ8C1db444VlylO9zHgUJ5rGkDDaRmRPg9GNoVO8FSp5f7Ih1wY2rhJ2X
 G/IxVJOdlEzOA/l19eq0QQZXPCsv0+7nmyEcQ0pFAD5/qqjibYRov5szPJtZLy/Qpj01
 6HCA==
X-Gm-Message-State: AOAM531qTyLCG0bzwDpz296TmKShymlg2b++Q4s8wsi3fGFzeQDmPyid
 vwlBco92cIt08mKMqTeNSD4=
X-Google-Smtp-Source: ABdhPJz6CXkJXj542mRPT43Ybb+edrNpkeRNN3qtZNX0B2y5pLf6Fg0U57N0sM+FBaIAne0+pfRb0A==
X-Received: by 2002:adf:ee47:: with SMTP id w7mr23643932wro.171.1591630575092; 
 Mon, 08 Jun 2020 08:36:15 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id m24sm22418930wmi.14.2020.06.08.08.36.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jun 2020 08:36:14 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Ian Jackson'" <ian.jackson@citrix.com>
References: <20200529111945.21394-1-ian.jackson@eu.citrix.com>	<005401d635ac$90bf9510$b23ebf30$@xen.org>	<24273.3201.443254.296963@mariner.uk.xensource.com>
 <24286.23167.134656.772769@mariner.uk.xensource.com>
In-Reply-To: <24286.23167.134656.772769@mariner.uk.xensource.com>
Subject: RE: [OSSTEST PATCH v2 00/49] Switch to Debian buster (= Debian stable)
Date: Mon, 8 Jun 2020 16:36:13 +0100
Message-ID: <004701d63daa$8b507990$a1f16cb0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQH6xReBsxPpGuE++Yl5QcE4sAtmFQJToowUAPtJVU4ByVZJkKhdCLKg
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
Cc: xen-devel@lists.xenproject.org, committers@xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Ian Jackson <ian.jackson@citrix.com>
> Sent: 08 June 2020 16:34
> To: paul@xen.org
> Cc: xen-devel@lists.xenproject.org; committers@xenproject.org
> Subject: RE: [OSSTEST PATCH v2 00/49] Switch to Debian buster (= Debian stable)
> 
> Ian Jackson writes ("RE: [OSSTEST PATCH v2 00/49] Switch to Debian buster (= Debian stable)"):
> > Paul Durrant writes ("RE: [OSSTEST PATCH v2 00/49] Switch to Debian buster (= Debian stable)"):
> > > I assume we can revert if things go badly wrong and being able to commission more machines would
> seem to be quite beneficial at this
> > > stage.
> >
> > Thanks for your opinion.
> >
> > It would be possible to revert the final switch, yes.  Most of the
> > other changes are supposed to work with stretch too.
> >
> > I haven't done a test run with the new code, but the old version of
> > Debian.  I will do that.  That will give confidence that we could, in
> > fact, revert things.
> 
> I have now done this and it resulted in one bugfix.
> 
> So if you are still content to go ahead I would like to push this
> series to osstest's own self-push-gate now.
> 

Yes, I am content to go ahead.

  Paul


