Return-Path: <SRS0=r6zo=T4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9926FC072B1
	for <xen-devel@archiver.kernel.org>; Tue, 28 May 2019 13:45:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70BAB2054F
	for <xen-devel@archiver.kernel.org>; Tue, 28 May 2019 13:45:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rn0GToMD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70BAB2054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVcPC-0002eN-Lo; Tue, 28 May 2019 13:44:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Gtxi=T4=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hVcPB-0002eI-2C
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 13:44:41 +0000
X-Inumbo-ID: bd3a2f3e-814e-11e9-8980-bc764e045a96
Received: from mail-wr1-x42b.google.com (unknown [2a00:1450:4864:20::42b])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bd3a2f3e-814e-11e9-8980-bc764e045a96;
 Tue, 28 May 2019 13:44:40 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id s17so20309976wru.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 May 2019 06:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BhNTfBDDshuS6xDk046GTnxrEoefdQBFiIx9WhVsPfU=;
 b=rn0GToMDcSfhavSci2AtUTuWFzX2aIxMZ9HkKlrQ8zLoktgt1Z7nJWBiQu7jKjaZnC
 BtDYAKDp6WgU/3DzO0IkgO/TElusXlyGpjclosxIm/FDqeBsy9cOyC2XZ72+OzRPdZrt
 HwEYNoiHz9rM9pUZIJj+llJeaiX+ock3R6939hFhHKlAKfmfKdYIWfYpE1L454nXFv8c
 0E9wso7ByUy6kpKLSBtbyCJtWnF6Z5xwNLFeILnR0PGjOIBaYyf45Bsmfix4+HeEuU4V
 YbOYbD6M7bazUSWk8L0evyMoNA+H5a/EzDV0JhHsbLDjauTcWez9Nq0w+VV54ZwuSaVD
 Srtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BhNTfBDDshuS6xDk046GTnxrEoefdQBFiIx9WhVsPfU=;
 b=BTa65UMn2s4A1IBbHdEE1KtKwtC6MrLWhTZSKaXyieepsCPVRAEkJYwyT16THNkfNP
 FSbWC+ZdaPWkmiJOQT44vPPTRSkgE2GdSuiA9YKbrvN3uPEF9y3R2lUlQL53ZQbouJ0P
 TkbifptT5TN6fl8E3xHzXCJt3PpjIxu3qmX36QNpdZwDOiHCbodmWSdcr+Ue3EMMYTc+
 yMqNkmTlaSBhqf9Icu0/wylKfDLr+40mmfj5pBAdM5xlP0QhMnMpoVrJYpal7VENr9xW
 B1xkKSTKabNo6oAhSnXNuj2aNEyHuwQuywr4PjidCQwz+pQrcl87la+g4PI/BY4Y6CqO
 s/SA==
X-Gm-Message-State: APjAAAXjsUMmfnV92l+L98eVDvVUKKrgxjlQfpz8GVXxKXVVnGe6YcFL
 0ruJ1cwIQAGr5GguU0nGSgOzzDgEdi79Gm0+wwxC5w==
X-Google-Smtp-Source: APXvYqwnQD+2r71ghHne6meUqPIZ3MLayeOHd/6J0YmBnlwMAoUagapZWdUyKuN79xe74yaHsQOudT0w2LsGKeza+gU=
X-Received: by 2002:adf:ed44:: with SMTP id u4mr18340487wro.242.1559051078640; 
 Tue, 28 May 2019 06:44:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190528105457.2305-1-jgross@suse.com>
In-Reply-To: <20190528105457.2305-1-jgross@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Tue, 28 May 2019 07:44:01 -0600
Message-ID:
 <CABfawhnMVFrpwc8tc_cPtCFD+he6X79PZZ-LtHQ0d0Jcwv58LA@mail.gmail.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [Xen-devel] [ANNOUNCE] Xen 4.13 Development Update
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190528134401.ebBDgSXkhBtFz2ApYUG-TGfY4NmWovJwZoXZawvnXqI@z>

PiAqICBJbXByb3ZlbWVudHMgdG8gZG9tYWluIGNyZWF0aW9uICh2MikKPiAgIC0gIEFuZHJldyBD
b29wZXIKCkhpIEFuZHJldywKY291bGQgeW91IHBvaW50IG1lIHRvIGEgZ2l0IGJyYW5jaCB3aGVy
ZSB5b3UgaGF2ZSB0aGlzIHdvcms/IEknbQpleHBlcmltZW50aW5nIHdpdGggc29tZSBzdHVmZiBh
bmQgd291bGQgbGlrZSB0byBzZWUgd2hhdCB5b3VyIHdvcmsgaW4KdGhpcyBhcmVhIHRvdWNoZXMu
CgpUaGFua3MsClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
