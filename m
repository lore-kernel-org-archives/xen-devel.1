Return-Path: <SRS0=1HVP=DA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9229AC2D0A8
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2020 13:07:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A97C20708
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2020 13:07:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="t3YwjeR2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A97C20708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL4Tk-0007AP-Mv; Wed, 23 Sep 2020 13:06:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mqUk=DA=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kL4Ti-0007AJ-VA
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 13:06:35 +0000
X-Inumbo-ID: bfcae466-f538-4cbc-b2d9-3c2cee915e3b
Received: from mail-wr1-x429.google.com (unknown [2a00:1450:4864:20::429])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bfcae466-f538-4cbc-b2d9-3c2cee915e3b;
 Wed, 23 Sep 2020 13:06:33 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id k15so20948171wrn.10
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2020 06:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=W4Lp2zc7O+fRQPuUm5aYAPfYNrVDAHwL/NEgezMJEYI=;
 b=t3YwjeR26/h8gmuLCSC+cjZx7gKDJTrxweWmC0H/K+be2dUwyfaeFisRl+V1xUeYW/
 yBxgri7zNojrqi4aDvhq0rU78ob4jXpHy9UJyfIIZAzr7hph/bprG+LR7GDcd0rk2BMZ
 AFbQN537NkRzu5Z+IvxP4ZMAvjNLq2OMIHJcmYRPt+Iu9atxb7KP1UpbNxjeIY4EMlKy
 jB3FqjaNfPgF5zVFRydn+MT1q/rSlusmtr2R0/L1NQHQ3f1NAS/r/jz5zCxc+4SVQKvV
 PrJPRB27sertSqTSBLfVbLtzoLFCjbh0kLe5V8qjimxdZaum32Pjg9IBjHo6HdkCCu7w
 ipyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=W4Lp2zc7O+fRQPuUm5aYAPfYNrVDAHwL/NEgezMJEYI=;
 b=enbxniTYwnVqdOf0Vg6b+e/2nUfnm4wrECtKsVgNM90gb8/rAqe+dbHgKZdoXe9yio
 a0su+5pKwkwKJ3TXIc/eKB0XASErlGiRzbQfCIzn2GvjAbCGukxoEnqiSE/pK/Hm3iUC
 sgcnu++4nWKcvCl4xW9GFqKJkuQAsVTetORBnWCRlX+6PNGAVzCzU9/bsTrz2emzqQdB
 iqyvdiofK1K5RFvLkZscdV/hb3nt4nBDZq9KTuIGUtJHjQlS/cigaAUEgQ+DPoPSwSfT
 N020y7fu7HVqdnIqoYeICQy79XZiA7RZLEItJRoWmAP1zTr7ftdYWzJ2nRYFhcrhQAIl
 9how==
X-Gm-Message-State: AOAM531bmbyj9XjFkvvumoUqXQth+LmnUISVfiuAfY5zijCDC5fhJc8d
 0uLkleNKLxj0f+LtUYzhG3E=
X-Google-Smtp-Source: ABdhPJw3Y3dAEfCAxSs+XomAOXhxAYBMd2U5U11CGAK5lVmm528v8U5zqlsvBFwJWjFOKAd9Oz7+IA==
X-Received: by 2002:adf:f14f:: with SMTP id y15mr737656wro.69.1600866392711;
 Wed, 23 Sep 2020 06:06:32 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id m4sm32028908wro.18.2020.09.23.06.06.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Sep 2020 06:06:31 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Anthony PERARD'" <anthony.perard@citrix.com>,
 <xen-devel@lists.xenproject.org>
Cc: "'Ian Jackson'" <iwj@xenproject.org>,
	"'Wei Liu'" <wl@xen.org>
References: <20200923110323.1980725-1-anthony.perard@citrix.com>
In-Reply-To: <20200923110323.1980725-1-anthony.perard@citrix.com>
Subject: RE: [XEN PATCH] tools: Fix configure of upstream QEMU
Date: Wed, 23 Sep 2020 14:06:30 +0100
Message-ID: <010401d691aa$5b7265e0$125731a0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQGWZTsLom/YDVkOIftE3qmKrCtQR6n2ighQ
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Anthony PERARD <anthony.perard@citrix.com>
> Sent: 23 September 2020 12:03
> To: xen-devel@lists.xenproject.org
> Cc: Paul Durrant <paul@xen.org>; Anthony PERARD <anthony.perard@citrix.com>; Ian Jackson
> <iwj@xenproject.org>; Wei Liu <wl@xen.org>
> Subject: [XEN PATCH] tools: Fix configure of upstream QEMU
> 
> QEMU as recently switch its build system to use meson and the
> ./configure step with meson is more restrictive that the step used to
> be, most installation path wants to be within prefix, otherwise we
> have this error message:
> 
>     ERROR: The value of the 'datadir' option is '/usr/share/qemu-xen' which must be a subdir of the
> prefix '/usr/lib/xen'.
> 
> In order to workaround the limitation, we will set prefix to the same
> one as for the rest of Xen installation, and set all the other paths.
> 
> For reference, a thread in qemu-devel:
>     "configure with datadir outside of --prefix fails with meson"
>     https://lore.kernel.org/qemu-devel/20200918133012.GH2024@perard.uk.xensource.com/t/
> 
> And an issue in meson:
>     "artificial limitation of directories (forced to be in prefix)"
>     https://github.com/mesonbuild/meson/issues/2561
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 

Tested-by: Paul Durrant <paul@xen.org>


