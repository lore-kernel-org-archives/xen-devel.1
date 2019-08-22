Return-Path: <SRS0=fjei=WS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D5A4C3A5A1
	for <xen-devel@archiver.kernel.org>; Thu, 22 Aug 2019 17:37:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A38120856
	for <xen-devel@archiver.kernel.org>; Thu, 22 Aug 2019 17:37:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvyETiUf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A38120856
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0r1l-00042u-VB; Thu, 22 Aug 2019 17:37:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hGY0=WS=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1i0r1k-00042p-KT
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 17:37:36 +0000
X-Inumbo-ID: 8728273e-c503-11e9-b95f-bc764e2007e4
Received: from mail-wr1-x429.google.com (unknown [2a00:1450:4864:20::429])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8728273e-c503-11e9-b95f-bc764e2007e4;
 Thu, 22 Aug 2019 17:37:35 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id y8so6182620wrn.10
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2019 10:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cPle2rN9oJbDBSyltOrZ22og5rT7PTCWcsYdG9SJtDw=;
 b=dvyETiUf4XkFY3qgVA6E/PU5v584NSott8Q/ggNHG2k1Ah404f422aft5Y+HpI1ai8
 A9HCCnTJqqTF3opE+F7p6R/DeeGzumalKeOGOejoabof3PtvMaEE02HlsfNbE7hi9AS0
 0htcJBAAOttJYwFfutqmx3ejIIpkifdoNqIwhhoC9RWb4k8GuIx0ilgrbcZoNSW0mTir
 UGfXwUFEbGqmlRrP9xhIffbNhVNIdaKAl2ABQdR8J1XQS0BJztx5haY7CKqg3tEjINHE
 6wbfdY2UBNAYAzYL5uJWvY4rLpHp5rUQpUlFqQ1/AhXk1AGY1ExCkKTrzFdQNdiKCR/P
 2fBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cPle2rN9oJbDBSyltOrZ22og5rT7PTCWcsYdG9SJtDw=;
 b=JEkCKDdLlKtWTWjfFl/t7l23TRU3EgvAICEqEUyU/ELPrU63QRXeIZ2Q5EQt03iOlp
 8CbmJqz7BnGXIvzWtzgBgxO021pCjo0xkhHJS9FYNSOjC05OrHMOkT2HJwVz8rNaihhd
 KGgz3Z6K8o/XAs60Q/sOVt7sT9JaSI9g3NqMeRQdaiMxGwoKcVSPJ8unB+ZGg3bzRaU0
 jssoF640+QYNpKTL3PbH6s70kYEAIZ+u3f2IeFCYdhUGfvF/P523L2UnZwGLoCEdJYWA
 HNsOVuaRMOx87fHAQHc2N47Bx1sWrbVebarKg/xQ9EvHPeZDGTTHPlRaLmWsvZbj8xAR
 sEbQ==
X-Gm-Message-State: APjAAAUiovElLt1kj2YiWHYwxY54TQ0ILdXl+88MhW0+wHfQswDv5fjv
 taemkBFJwjTFyRtHtUhLNRuxvAk+ev5jLpREmaM=
X-Google-Smtp-Source: APXvYqwEMhoER9oK0AosQUh7MOeIQbb0Wu8rktr1HFOs+G22Gd00DXH1oqgJkwis6DMsmj11d4RiS99su5U57+xhgIw=
X-Received: by 2002:a5d:5543:: with SMTP id g3mr119461wrw.166.1566495455058;
 Thu, 22 Aug 2019 10:37:35 -0700 (PDT)
MIME-Version: 1.0
References: <15a4c482-1207-1d8a-fd2a-dc4f25956c27@cs.rochester.edu>
 <79c7b71f-0b61-2799-4a79-644536a9c891@citrix.com>
 <d55da430-0d73-8a92-73e7-99e1aa70680c@cs.rochester.edu>
 <5b190182-4938-52b4-eeb2-df77224711c3@citrix.com>
In-Reply-To: <5b190182-4938-52b4-eeb2-df77224711c3@citrix.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Thu, 22 Aug 2019 11:36:58 -0600
Message-ID: <CABfawh=DKeQoMoxJ-6sRozzybQm9TriHBmoyE1FeHh50fqiwRQ@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] More questions about Xen memory layout/usage,
 access to guest memory
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Johnson,
 Ethan" <ejohns48@cs.rochester.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiA+IEkndmUgZm91bmQgYSBudW1iZXIgb2YgZmlsZXMgaW4gdGhlIFhlbiBzb3VyY2UgdHJlZSB3
aGljaCBzZWVtIHRvIGJlCj4gPiByZWxhdGVkIHRvIGluc3RydWN0aW9uL3g4NiBwbGF0Zm9ybSBl
bXVsYXRpb246Cj4gPgo+ID4gYXJjaC94ODYveDg2X2VtdWxhdGUuYwo+ID4gYXJjaC94ODYvaHZt
L2VtdWxhdGUuYwo+ID4gYXJjaC94ODYvaHZtL3ZteC9yZWFsbW9kZS5jCj4gPiBhcmNoL3g4Ni9o
dm0vc3ZtL2VtdWxhdGUuYwo+ID4gYXJjaC94ODYvcHYvZW11bGF0ZS5jCj4gPiBhcmNoL3g4Ni9w
di9lbXVsLXByaXYtb3AuYwo+ID4gYXJjaC94ODYveDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuYwo+
ID4KPiA+IFRoZSBsYXN0IG9mIHRoZXNlLCBpbiBwYXJ0aWN1bGFyLCBsb29rcyBlc3BlY2lhbGx5
IGhhaXJ5IChpdCBzZWVtcyB0bwo+ID4gc3VwcG9ydCBlbXVsYXRpb24gb2YgZXNzZW50aWFsbHkg
dGhlIGVudGlyZSB4ODYgaW5zdHJ1Y3Rpb24gc2V0IHRocm91Z2gKPiA+IGEgcXVpdGUgaW1wcmVz
c2l2ZSBlZGlmaWNlIG9mIHN3aXRjaCBzdGF0ZW1lbnRzKS4KPgo+IExvdmVseSwgaXNuJ3QgaXQu
ICBGb3IgSW50cm9zcGVjdGlvbiwgd2UgbmVlZCB0byBiZSBhYmxlIHRvIGVtdWxhdGUgYW4KPiBp
bnN0cnVjdGlvbiB3aGljaCB0b29rIGEgcGVybWlzc2lvbiBmYXVsdCAoaW5jbHVkaW5nIE5vIEV4
ZWN1dGUpLCB3YXMKPiBzZW50IHRvIHRoZSBhbmFseXNpcyBlbmdpbmUsIGFuZCBkZWVtZWQgb2sg
dG8gY29udGludWUuCgpUaGF0J3Mgbm90IGEgcmVxdWlyZW1lbnQgZm9yIGludHJvc3BlY3Rpb24g
YW5kIEkgZmluZCB0aGF0IGtpbmQgb2YgdXNlCm9mIHRoZSBlbXVsYXRpb24gdmVyeSBoYWlyeSwg
ZXNwZWNpYWxseSBmb3IgYW55dGhpbmcgc2VjdXJpdHkgcmVsYXRlZC4KSU1ITyBpdCdzIG5vdGhp
bmcgbW9yZSB0aGVuIGEgY29udmVuaWVudCBoYWNrLgoKVGFtYXMKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
