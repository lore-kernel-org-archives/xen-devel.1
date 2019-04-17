Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F19C282DC
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 15:00:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF927217D7
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 15:00:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G4zsPqqH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF927217D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGm2Z-0004Z1-Ht; Wed, 17 Apr 2019 14:59:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O1DL=ST=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hGm2Y-0004YC-3u
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 14:59:58 +0000
X-Inumbo-ID: 7637ba27-6121-11e9-92d7-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7637ba27-6121-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 14:59:56 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id v22so22735180lje.9
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2019 07:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=OmOgL02dvpS19ASKNLZ4vp7Da8zd0cLebcIPv5YiIL4=;
 b=G4zsPqqHde0INSI4jfI98Kj8vz3Nq+OSbHTop/Z/zEg185wz0knBQH5m8pA2uMZB5K
 hTKwQSpbk8Thyb7SZyrLlWDLDNXmYhXRKGjJFnHxAQuWa+M8KnRo2lQXfeTdnvmQijmV
 PF4GQfJJ8+nTQJC+gC101kcuRaoDoHPao2K981grTyp3ROLAbK9hg9Iydywjb7SzXpn8
 +OltZIPjSNPzXrd32cXlnLsLmajWR26/OwApy+4Z4kEceEadwhpohQjQcBxQngoV7tZB
 9nbTDWPkhVz9i4XCdIaXu/4fBp4s++Zqy+SeMD+pbdh6FbbF9NC4GZNGj8k7l/go0d+G
 7Onw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=OmOgL02dvpS19ASKNLZ4vp7Da8zd0cLebcIPv5YiIL4=;
 b=sRUT4ErBOqvTWCBGmWlc0OwzBXCROLBasTdP0UNvBTV8mHgFT8px0cIpAqJb7w1qae
 W+anYU9wbop/uuxrds265yYwXFqXSfxxhJXLsjpDJmT4gGeRDCx2C7MtDepKS5dJ/kiF
 gdJ59Zz9/UiCa9XJPq5C3q7WtG2OollEONWacccti1OG/F3ZpQOnPfptBCBwuwubpZX3
 qIQuXRC9ji+VTy5V2AQUgd6/G+JkhYVpLaXi0IjL30KF5K+YP97xPvwAHZfJcbJQ21hL
 d1SId/XRJUob3LMY4fIVkf4qHgnuVIwDJLOYNv7QRxW1pceL+A4zh0VM98rAy6SMIXPu
 Smgg==
X-Gm-Message-State: APjAAAWOIY12+0AfixXPMqC0qFbTxzSjZo9v9rgRTBWPPz65JjMsNf0z
 j/cd3MBicpcm2VF2QFxWfwFRiIqrV5I=
X-Google-Smtp-Source: APXvYqzgizrBpaNQ0r1ua62Y4cgkqbnkOJWBZyclskb4RcKlBnZ9lODpZ21e66PBXUOxWwtQYIvzgQ==
X-Received: by 2002:a2e:88c1:: with SMTP id a1mr6942011ljk.78.1555513195016;
 Wed, 17 Apr 2019 07:59:55 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id u8sm950273lfi.83.2019.04.17.07.59.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 17 Apr 2019 07:59:54 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 17 Apr 2019 17:59:35 +0300
Message-Id: <1555513175-7596-6-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555513175-7596-1-git-send-email-olekstysh@gmail.com>
References: <1555513175-7596-1-git-send-email-olekstysh@gmail.com>
Subject: [Xen-devel] [PATCH V4 5/5] xen/arm: Add early printk support for
 SCIFA compatible UARTs
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 sstabellini@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417145935.ic_Sa7qM1t7aJEgsESJNkPNz-z94laplgCBsRHrQe64@z>

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKVGhpcyBwYXRjaCBtYWtlcyBwb3NzaWJsZSB0byB1c2UgZXhpc3RpbmcgZWFybHkgcHJpbmsg
Y29kZQpmb3IgUmVuZXNhcyAiU3RvdXQiIGJvYXJkIGJhc2VkIG9uIFItQ2FyIEgyIFNvQyAoU0NJ
RkEpLgoKVGhlICJFQVJMWV9QUklOVEtfVkVSU0lPTiIgZm9yIHRoYXQgYm9hcmQgc2hvdWxkIGJl
ICdBJzoKQ09ORklHX0VBUkxZX1BSSU5USz1zY2lmLDB4ZTZjNDAwMDAsQQoKU2lnbmVkLW9mZi1i
eTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgpD
QzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCi0tLQogICAgQ2hhbmdlcyBp
biB2MzoKICAgICAgICAtIEl0IHdhcyBkZWNpZGVkIG5vdCB0byBpbnRyb2R1Y2UgbmV3IGRlYnVn
LXNjaWZhLmluYwogICAgICAgICAgZm9yIGhhbmRsaW5nIFNDSUZBIGludGVyZmFjZSwgYnV0IHRv
IGV4dGVuZCBleGlzdGluZwogICAgICAgICAgZGVidWctc2NpZi5pbmMgZm9yIGhhbmRsaW5nIGJv
dGggaW50ZXJmYWNlcy4KICAgICAgICAgIFRoaXMgcGF0Y2ggaXMgYSByZXN1bHQgb2Ygc3BsaXR0
aW5nIGFuIGluaXRpYWwgcGF0Y2gKICAgICAgICAgICJ4ZW4vYXJtOiBBZGQgU0NJRkEgVUFSVCBz
dXBwb3J0IGZvciBlYXJseSBwcmludGsiCiAgICAgICAgICBhbmQgb25seSBhZGRzIGEgc3VwcG9y
dC4KCiAgICBDaGFuZ2VzIGluIHY0OgogICAgICAgIC0gRHJvcCBTQ0lGKEEpIGZyb20gY29tbWVu
dHMKLS0tCiB4ZW4vYXJjaC9hcm0vYXJtMzIvZGVidWctc2NpZi5pbmMgfCA5ICsrKysrKy0tLQog
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vYXJtMzIvZGVidWctc2NpZi5pbmMgYi94ZW4vYXJjaC9hcm0vYXJt
MzIvZGVidWctc2NpZi5pbmMKaW5kZXggYThkMmVhZS4uM2YwMWM5MCAxMDA2NDQKLS0tIGEveGVu
L2FyY2gvYXJtL2FybTMyL2RlYnVnLXNjaWYuaW5jCisrKyBiL3hlbi9hcmNoL2FybS9hcm0zMi9k
ZWJ1Zy1zY2lmLmluYwpAQCAtMSw3ICsxLDcgQEAKIC8qCiAgKiB4ZW4vYXJjaC9hcm0vYXJtMzIv
ZGVidWctc2NpZi5pbmMKICAqCi0gKiBTQ0lGIHNwZWNpZmljIGRlYnVnIGNvZGUKKyAqIFNDSUYo
QSkgc3BlY2lmaWMgZGVidWcgY29kZQogICoKICAqIE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVr
c2FuZHIudHlzaGNoZW5rb0BnbG9iYWxsb2dpYy5jb20+CiAgKiBDb3B5cmlnaHQgKEMpIDIwMTQs
IEdsb2JhbGxvZ2ljLgpAQCAtMjIsMTAgKzIyLDEzIEBACiAjaWZkZWYgRUFSTFlfUFJJTlRLX1ZF
UlNJT05fTk9ORQogI2RlZmluZSBTVEFUVVNfUkVHICAgIFNDSUZfU0NGU1IKICNkZWZpbmUgVFhf
RklGT19SRUcgICBTQ0lGX1NDRlREUgorI2VsaWYgRUFSTFlfUFJJTlRLX1ZFUlNJT05fQQorI2Rl
ZmluZSBTVEFUVVNfUkVHICAgIFNDSUZBX1NDQVNTUgorI2RlZmluZSBUWF9GSUZPX1JFRyAgIFND
SUZBX1NDQUZURFIKICNlbmRpZgogCiAvKgotICogU0NJRiBVQVJUIHdhaXQgVUFSVCB0byBiZSBy
ZWFkeSB0byB0cmFuc21pdAorICogV2FpdCBVQVJUIHRvIGJlIHJlYWR5IHRvIHRyYW5zbWl0CiAg
KiByYjogcmVnaXN0ZXIgd2hpY2ggY29udGFpbnMgdGhlIFVBUlQgYmFzZSBhZGRyZXNzCiAgKiBy
Yzogc2NyYXRjaCByZWdpc3RlcgogICovCkBAIC0zNyw3ICs0MCw3IEBACiAuZW5kbQogCiAvKgot
ICogU0NJRiBVQVJUIHRyYW5zbWl0IGNoYXJhY3RlcgorICogVUFSVCB0cmFuc21pdCBjaGFyYWN0
ZXIKICAqIHJiOiByZWdpc3RlciB3aGljaCBjb250YWlucyB0aGUgVUFSVCBiYXNlIGFkZHJlc3MK
ICAqIHJ0OiByZWdpc3RlciB3aGljaCBjb250YWlucyB0aGUgY2hhcmFjdGVyIHRvIHRyYW5zbWl0
CiAgKi8KLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
