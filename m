Return-Path: <SRS0=aHxP=YC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78116C47404
	for <xen-devel@archiver.kernel.org>; Wed,  9 Oct 2019 14:20:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45D9C20B7C
	for <xen-devel@archiver.kernel.org>; Wed,  9 Oct 2019 14:20:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Un/6iF44"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45D9C20B7C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iICpK-0007TR-98; Wed, 09 Oct 2019 14:20:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5Wiy=YC=gmail.com=joculator@srs-us1.protection.inumbo.net>)
 id 1iICpI-0007TA-Mt
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 14:20:28 +0000
X-Inumbo-ID: eeb3f100-ea9f-11e9-80e3-bc764e2007e4
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eeb3f100-ea9f-11e9-80e3-bc764e2007e4;
 Wed, 09 Oct 2019 14:20:24 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id r2so1796909lfn.8
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2019 07:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qM44EJGVuGB1UjO/9duOt6HnkcTEDzfeyY6UzBKj3FE=;
 b=Un/6iF44gxYHdhnvoIMFE7xhLweq4Cpqr1Ek6gMT4TXMQDA5J1MoKZvouf1Sq0/HGz
 /IJwiW4H9JY1+T1bkGhl7fROxutkVkgPg6ydStZIaKR7MjqI0RK17r12+CNEXQUu2Nsv
 tdGg6aNLKn+zuUi6UiIS/yQnhytQY4Gl8AiuXggph3NdgO0QBwYp0NbPxZYvmM2ALPQP
 LA7ey3tMkSinzLVOqF3ONZoGrB16VoqqW92pEy3ppteOZ2orE6UMcooTtweMo+UoAgN2
 wBEpHIXATLYFcFDJc9da3ERxxrrOzgfqVHi3zJhi3WeviG8tCMBNE7jKi7aMTNJyE19L
 l5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qM44EJGVuGB1UjO/9duOt6HnkcTEDzfeyY6UzBKj3FE=;
 b=URQf1KiAUa1Hq4buPpJgu6iAtuyMJ9e51evhkb4P66B6CcyXdqNjgr7AIlHpuBC104
 G6YW7IAZCREwLxNoB5TjGxs4lFdQgK+m7/xQldO0NBfJ3nYewCVlKZeExfnWHWyl7jzG
 CvMV4GgNRLTBqwGxhhQ5qR/wTYvThKCh3ICf9vxKTO3NLhsnB+niOAi0mPMCFXgMa5uB
 neMRJnErFRN3k7ipXTDpq4tYAtFNp4L8pTEFeLXFJZUIbRLQkUEP89Szq0GtneXx6bXB
 vlH7rdl9XgNXuNxEWtL9zdngiJeLdmYUZWZBCqgykmCSJ5Y9teox1MPNBGL8VzJlrJH9
 0t6w==
X-Gm-Message-State: APjAAAULPv7eXuUSVF5/D98GCrzieaKicc5alvEsd59NmCPxOvH3bhPB
 n35c4ZLtKolp6sxd0WGspS5wzV1dSsY=
X-Google-Smtp-Source: APXvYqwP4vcqw88gzfbBPZX491PzH/EzJJe0rsHT1fp0auFub5xYXGLjyjlPihaGIvHLdo4jBy7Vlw==
X-Received: by 2002:ac2:5542:: with SMTP id l2mr2220612lfk.119.1570630822990; 
 Wed, 09 Oct 2019 07:20:22 -0700 (PDT)
Received: from EPUAKYIW0594.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id i142sm526702lfi.5.2019.10.09.07.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 07:20:22 -0700 (PDT)
From: Artem Mygaiev <joculator@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  9 Oct 2019 17:20:15 +0300
Message-Id: <5eec779f850fec88caeb67a090a25092792689ba.1570628924.git.artem_mygaiev@epam.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1570628924.git.artem_mygaiev@epam.com>
References: <cover.1570628924.git.artem_mygaiev@epam.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/3] Consistent use for lock variable
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
Cc: Artem Mygaiev <artem_mygaiev@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Artem Mygaiev <joculator@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4uIGZvciBib3RoIGxvY2sgYW5kIHVubG9jawoKQ292ZXJpdHktSUQ6IDEzODE4NDAKU2lnbmVk
LW9mZi1ieTogQXJ0ZW0gTXlnYWlldiA8YXJ0ZW1fbXlnYWlldkBlcGFtLmNvbT4KLS0tCiB4ZW4v
eHNtL2ZsYXNrL2F2Yy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL3hzbS9mbGFzay9hdmMuYyBiL3hlbi94c20v
Zmxhc2svYXZjLmMKaW5kZXggODdlYTM4YjdhMC4uM2E5NTA3ZjYyYSAxMDA2NDQKLS0tIGEveGVu
L3hzbS9mbGFzay9hdmMuYworKysgYi94ZW4veHNtL2ZsYXNrL2F2Yy5jCkBAIC0zMjAsNyArMzIw
LDcgQEAgc3RhdGljIGlubGluZSBpbnQgYXZjX3JlY2xhaW1fbm9kZSh2b2lkKQogICAgICAgICBo
ZWFkID0gJmF2Y19jYWNoZS5zbG90c1todmFsdWVdOwogICAgICAgICBsb2NrID0gJmF2Y19jYWNo
ZS5zbG90c19sb2NrW2h2YWx1ZV07CiAKLSAgICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJmF2Y19j
YWNoZS5zbG90c19sb2NrW2h2YWx1ZV0sIGZsYWdzKTsKKyAgICAgICAgc3Bpbl9sb2NrX2lycXNh
dmUobG9jaywgZmxhZ3MpOwogICAgICAgICByY3VfcmVhZF9sb2NrKCZhdmNfcmN1X2xvY2spOwog
ICAgICAgICBobGlzdF9mb3JfZWFjaF9lbnRyeShub2RlLCBuZXh0LCBoZWFkLCBsaXN0KQogICAg
ICAgICB7Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
