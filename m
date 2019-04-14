Return-Path: <SRS0=9rT6=SQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13C5AC10F13
	for <xen-devel@archiver.kernel.org>; Sun, 14 Apr 2019 06:34:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9B92206BA
	for <xen-devel@archiver.kernel.org>; Sun, 14 Apr 2019 06:34:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dz0JB7NW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9B92206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hFYiB-0000dU-2o; Sun, 14 Apr 2019 06:33:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=F7+S=SQ=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1hFYi9-0000dP-8Z
 for xen-devel@lists.xenproject.org; Sun, 14 Apr 2019 06:33:53 +0000
X-Inumbo-ID: 44836bb0-5e7f-11e9-92d7-bc764e045a96
Received: from mail-pf1-x442.google.com (unknown [2607:f8b0:4864:20::442])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 44836bb0-5e7f-11e9-92d7-bc764e045a96;
 Sun, 14 Apr 2019 06:33:51 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id w25so7046442pfi.9
 for <xen-devel@lists.xenproject.org>; Sat, 13 Apr 2019 23:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=owxNVnAJ4MtRR0omIw5jro2IGQnbvI8ArzcKNr9mPso=;
 b=Dz0JB7NW/lCU/VkDuQPIK4bvZATA0BRM7CjhfZQXwg80Kp0UzI6HsmE1Bl7ehEEz7Y
 iWDqEkRFTP1+OWxmFR1lUzwhTuPwKs1+slOu/f0Awvzx+SCjmBPl1xjHkYNL8g3WZJ2g
 qyZF0mn2TCwamtufSJhbGAs36doMaPi38+9PpI7Ah6ZGxeL3TiSPK/eC6lUh8Eh6u6Na
 R4NMslMI221hWvaQclYdYdDucDKz7ITCR0gocufQsKKlA7sCrDv/QIrkzRRf+LDK/mKm
 x+dThqojo2C0ZqFsOTwMPjVuSqPVJ6GAuAGNVAI4pcNjubls35+yJ7pQSLvBSv/pHZiQ
 yjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=owxNVnAJ4MtRR0omIw5jro2IGQnbvI8ArzcKNr9mPso=;
 b=O5uCcwjWhesr9XCyuly2nN0T2KNJUwyrMnSbvigTFbAl9s5/UphGu+2tcX7DY5Ewvv
 J+1z2SkA2b0ENB9c8g3byU6HFNIx26lpWHW3qOmoZis/XldGzAjDdhfrRntz3lOVw5fh
 ilP+HjiSEhzNEtEabqYqBpVn2pl6bQfC46y3LbrFxmuJWbEVOgJMb06vx0bhYjTSZW2o
 f3S8LwwNnadGMGkXf26UQMYoYQsyf4niXY11mXYS7uvNer5R5iKLAaMnLe1oeS6vT7ra
 omb6kjOTqz8wv5RyxT5t8j0z7ONZKgHjyCruwj6GdlZyADwq5E8LOuAGMWa3fDastv6d
 X9Kw==
X-Gm-Message-State: APjAAAUwtTr9KFS1Vow9P+Dgy2DP7Rwbi+9sr0unlk+RV4tDRaULCb8a
 xfqaRXxm6BU+t3cUT1mDtpMrtVDD
X-Google-Smtp-Source: APXvYqxhGpYt3+XaAt6Jj+rug7G73OyOphTm+0iRLf/ZlIC9bcCjidP+7zxj9dozNXkki5mFdt0NIA==
X-Received: by 2002:aa7:9193:: with SMTP id x19mr68781326pfa.108.1555223630537; 
 Sat, 13 Apr 2019 23:33:50 -0700 (PDT)
Received: from localhost.localdomain ([223.190.30.100])
 by smtp.gmail.com with ESMTPSA id i15sm64574212pfd.162.2019.04.13.23.33.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 13 Apr 2019 23:33:49 -0700 (PDT)
From: Amit Singh Tomar <amittomer25@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Sun, 14 Apr 2019 12:03:31 +0530
Message-Id: <1555223611-10263-1-git-send-email-amittomer25@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [PATCH v3] xen/arm: Add Amlogic Meson SoCs earlyprintk
 support
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
Cc: andre.przywara@arm.com, julien.grall@arm.com, sstabellini@kernel.org,
 Amit Singh Tomar <amittomer25@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190414063331.62NcgWjUI-xYLvPLO3qNQulwluIgA8Lp-pfQWQlnLUA@z>

VGhpcyBwYXRjaCBhZGRzIGVhcmx5cHJpbnRrIHN1cHBvcnQgZm9yIEFtbG9naWMgTWVzb24gU29D
IGJhc2VkCmJvYXJkcy4KCkl0IHJlbGllcyBvbiBmaXJtd2FyZVsxXSB0byBpbml0aWFsaXplIHRo
ZSBVQVJULgoKVGVzdGVkIFdpdGg6CiBodHRwOi8vd2lraS5mcmllbmRseWFybS5jb20vd2lraS9p
bmRleC5waHAvTmFub1BpX0syCgpbMV06IGh0dHBzOi8vZ2l0aHViLmNvbS9BUk0tc29mdHdhcmUv
YXJtLXRydXN0ZWQtZmlybXdhcmUvYmxvYi9tYXN0ZXIvZHJpdmVycy9tZXNvbi9jb25zb2xlL2Fh
cmNoNjQvbWVzb25fY29uc29sZS5TI0w5MgoKU2lnbmVkLW9mZi1ieTogQW1pdCBTaW5naCBUb21h
ciA8YW1pdHRvbWVyMjVAZ21haWwuY29tPgotLS0KQ2hhbmdlcyBzaW5jZSB2MjoKCiAgICAgICAg
KiBBZGRlZCB0aGUgY29tbWl0IG1lc3NhZ2UgdGhhdCB0YWxrcyBhYm91dAogICAgICAgICAgdWFy
dCBpbml0aWFsaXphdGlvbi4KICAgIAogICAgICAgICogQWRkZWQgZHVtbXkgZWFybHlfdWFydF9p
bml0IGZ1bmN0aW9uLgoKQ2hhbmdlcyBzaW5jZSB2MToKCiAgICAgICAgKiBGaXhlZCBjb2Rpbmcg
c3R5bGUgaXNzdWUuCiAgICAgICAgKiBVbmRvbmUgY2hhbmdlcyBpbiBlYXJseS1wcmludGsudHh0
LgoKQ2hhbmdlcyBzaW5jZSBSRkM6CgogICAgICAgICogUmVwbGFjZWQgTERSSCB3aXRoIExEUiwg
d2l0aCB0aGlzIHRoZXJlCiAgICAgICAgICBpcyBubyBzY2F0dGVyZWQgb3V0cHV0IG9uIGNvbnNv
bGUgbm93LgogICAgICAgICogVXNlZCB0Ym56IGluc3RlYWQgb2YgdHN0IGFuZCBiLm5lLgogICAg
ICAgICogVXNlZCBBTUxfIHByZWZpeCBhZ2FpbnN0IHJlZ2lzdGVyIG5hbWVzLgotLS0KIHhlbi9h
cmNoL2FybS9hcm02NC9kZWJ1Zy1tZXNvbi5pbmMgfCA1NSArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDU1IGluc2VydGlvbnMoKykKIGNyZWF0
ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC9hcm0vYXJtNjQvZGVidWctbWVzb24uaW5jCgpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L2RlYnVnLW1lc29uLmluYyBiL3hlbi9hcmNoL2FybS9h
cm02NC9kZWJ1Zy1tZXNvbi5pbmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4u
ZTFhOGZhOAotLS0gL2Rldi9udWxsCisrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9kZWJ1Zy1tZXNv
bi5pbmMKQEAgLTAsMCArMSw1NSBAQAorLyoKKyAqIHhlbi9hcmNoL2FybS9hcm02NC9kZWJ1Zy1t
ZXNvbi5pbmMKKyAqCisgKiBNRVNPTiBzcGVjaWZpYyBkZWJ1ZyBjb2RlLgorICoKKyAqIENvcHly
aWdodCAoYykgMjAxOSwgQW1pdCBTaW5naCBUb21hciA8YW1pdHRvbWVyMjVAZ21haWwuY29tPi4K
KyAqCisgKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1
dGUgaXQgYW5kL29yCisgKiBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIGFuZCBjb25kaXRpb25z
IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMKKyAqIExpY2Vuc2UsIHZlcnNpb24gMiwgYXMgcHVi
bGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24uCisgKgorICogVGhpcyBwcm9n
cmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCisg
KiBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJy
YW50eSBvZgorICogTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQ
VVJQT1NFLiAgU2VlIHRoZSBHTlUKKyAqIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUg
ZGV0YWlscy4KKyAqCisgKiBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBH
TlUgR2VuZXJhbCBQdWJsaWMKKyAqIExpY2Vuc2UgYWxvbmcgd2l0aCB0aGlzIHByb2dyYW07IElm
IG5vdCwgc2VlIDxodHRwOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4KKyAqLworCisjZGVmaW5l
IEFNTF9VQVJUX1dGSUZPX1JFRyAgICAgIDB4MDAKKyNkZWZpbmUgQU1MX1VBUlRfU1RBVFVTX1JF
RyAgICAgMHgwYworCisjZGVmaW5lIEFNTF9VQVJUX1RYX0ZJRk9fRlVMTCAgIDIxCisKKy5tYWNy
byBlYXJseV91YXJ0X2luaXQgeGIsIGMKKy8qIFVhcnQgaGFzIGFscmVhZHkgYmVlbiBpbml0aWFs
aXplZCBieSBGaXJtd2FyZSwgZm9yIGluc3RhbmNlIGJ5IFRGLUEgKi8KKy5lbmRtCisKKy8qCisg
KiBNRVNPTiBVQVJUIHdhaXQgVUFSVCB0byBiZSByZWFkeSB0byB0cmFuc21pdAorICogeGI6IHJl
Z2lzdGVyIHdoaWNoIGNvbnRhaW5zIHRoZSBVQVJUIGJhc2UgYWRkcmVzcworICogYzogc2NyYXRj
aCByZWdpc3RlcgorICovCisubWFjcm8gZWFybHlfdWFydF9yZWFkeSB4YiBjCisxOgorICAgICAg
ICBsZHIgICAgIHdcYywgW1x4YiwgI0FNTF9VQVJUX1NUQVRVU19SRUddICAgICAgICAvKiBzdGF0
dXMgcmVnaXN0ZXIgKi8KKyAgICAgICAgdGJueiAgICB3XGMsICNBTUxfVUFSVF9UWF9GSUZPX0ZV
TEwsIDFiICAgICAgICAgLyogQ2hlY2sgVFhGSUZPIEZVTEwgYml0ICovCisuZW5kbQorCisvKgor
ICogTUVTT04gVUFSVCB0cmFuc21pdCBjaGFyYWN0ZXIKKyAqIHhiOiByZWdpc3RlciB3aGljaCBj
b250YWlucyB0aGUgVUFSVCBiYXNlIGFkZHJlc3MKKyAqIHd0OiByZWdpc3RlciB3aGljaCBjb250
YWlucyB0aGUgY2hhcmFjdGVyIHRvIHRyYW5zbWl0CisgKi8KKy5tYWNybyBlYXJseV91YXJ0X3Ry
YW5zbWl0IHhiIHd0CisgICAgICAgIHN0ciAgICBcd3QsIFtceGIsICNBTUxfVUFSVF9XRklGT19S
RUddCisuZW5kbQorCisvKgorICogTG9jYWwgdmFyaWFibGVzOgorICogbW9kZTogQVNNCisgKiBp
bmRlbnQtdGFicy1tb2RlOiBuaWwKKyAqIEVuZDoKKyAqLwotLSAKMi43LjQKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
