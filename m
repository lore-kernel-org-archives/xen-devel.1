Return-Path: <SRS0=9rT6=SQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8312FC10F13
	for <xen-devel@archiver.kernel.org>; Sun, 14 Apr 2019 16:35:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50C4A2084D
	for <xen-devel@archiver.kernel.org>; Sun, 14 Apr 2019 16:35:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKRQeYjp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50C4A2084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hFi6O-00043P-Co; Sun, 14 Apr 2019 16:35:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=F7+S=SQ=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1hFi6N-00043K-Cu
 for xen-devel@lists.xenproject.org; Sun, 14 Apr 2019 16:35:31 +0000
X-Inumbo-ID: 515d6c4a-5ed3-11e9-92d7-bc764e045a96
Received: from mail-oi1-x243.google.com (unknown [2607:f8b0:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 515d6c4a-5ed3-11e9-92d7-bc764e045a96;
 Sun, 14 Apr 2019 16:35:30 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id j132so11868146oib.2
 for <xen-devel@lists.xenproject.org>; Sun, 14 Apr 2019 09:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/Tb7aCRhxl9X6A1fUTWRbFpwjH/RraGUZ6i0ZEoBJSY=;
 b=eKRQeYjpytCqHJmcf1qgXhgQUamcOkDagEeY+vMQ5kXTfQsL/4sWrkcIm56l7/oSdw
 SRCZ1gnzqdJmh9ZDW9oWixvkWrJXjR8NR+4EJcv/VVk6SND9B5TvUAPs2mGQDwsmXo/P
 aCIjlR7RoCTEtzFT6tkUhEc8DrVcdqTpJzyruCWmzGwcevbXSFih2uiatX4QPtuHW/wK
 mDPmi6E6gRk1zSX20GvcTGOcCh0o9dvN08Wi6jepJ8tjTZwSlM6l/YyVSrTME1J0Xu5+
 DinxQM0SOGC1r9GnRyfDOAzxGa7SIeUUqI5g6Bfof4gQ7ZYqvzg1JEtdZKHgVc18rh9x
 GOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Tb7aCRhxl9X6A1fUTWRbFpwjH/RraGUZ6i0ZEoBJSY=;
 b=Ea7bEdLpj95xHsXHJQGT3e4IPzFhY5fEPz7J9m+QAg3x9W04GVBOZ9setwI+W5MtQl
 MI8x1Jz0WIpT1Lvccv7wnV7oWakk7z7aYc0oOvSnrD1qR3OwXoUS2Rv3KOM5tsum4dhD
 qHkBkTHrNMhwqBMNUzxyYQXnz5anwXUpEs5Spd+1z2cF4vLjA7dhbY30pX/AqiZe53xX
 PEjmaJQ8FzPCo81kr3+1uex95mTRkZ7EooMLpYXv2IL+lG3bgULe+eAyaXvuQY/wg1l5
 GTqEpYqHD5xoCboJZol4MyviuumDcr2VUNYD2gKwtnLF76pTy6w/JxAFPSCOgK55lfiE
 O1WA==
X-Gm-Message-State: APjAAAX+zmpXnF+EpzNSZw+VGcSTJONt7IqeOJ3x02uU3m3y6bGwo/OB
 1e9GXtiDdHLYaxwnh3hFtU0jnQ0GrurqnYFDr+g=
X-Google-Smtp-Source: APXvYqzK2BA1ehh+5DpN2Wc59L1kBN1YVQZGYB/iK7ovzV0FjckJsNb6iVSNJfYjzpaVJA6FEyMOo8hx0zEluFFOMrE=
X-Received: by 2002:aca:b4c6:: with SMTP id d189mr17297499oif.83.1555259730314; 
 Sun, 14 Apr 2019 09:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <1555223611-10263-1-git-send-email-amittomer25@gmail.com>
 <7e3b90ce-d4ea-d1ba-2c39-f5920e12d73b@arm.com>
In-Reply-To: <7e3b90ce-d4ea-d1ba-2c39-f5920e12d73b@arm.com>
From: Amit Tomer <amittomer25@gmail.com>
Date: Sun, 14 Apr 2019 22:05:17 +0530
Message-ID:
 <CABHD4K8MExLnsP3rk4WyB0UvP7+mo2kH+Fd0mKWo9-K8J=w62Q@mail.gmail.com>
To: Julien Grall <julien.grall@arm.com>
Subject: Re: [Xen-devel] [PATCH v3] xen/arm: Add Amlogic Meson SoCs
 earlyprintk support
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190414163517.10Y4q-6GCP_7zrErIfo0XMjCMJ4f73v2XJ-ZBUc1gpw@z>

SGVsbG8sCgo+IERvIGFsbCB0aGUgZmlybXdhcmUgZXhpc3RpbmcgZm9yIHRoaXMgcGxhdGZvcm0g
aW5pdGlhbGl6ZSB0aGUgVUFSVD8KClUtYm9vdCBkb2VzIGFsc28gaW5pdGlhbGl6ZSB0aGUgdWFy
dCBmb3IgdGhpcyBwbGF0Zm9ybS4KaHR0cHM6Ly9naXRodWIuY29tL3UtYm9vdC91LWJvb3QvYmxv
Yi9tYXN0ZXIvZHJpdmVycy9zZXJpYWwvc2VyaWFsX21lc29uLmMjTDQ0CgpUaGFua3MsCi1BbWl0
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
