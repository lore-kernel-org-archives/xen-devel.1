Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F336C282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 15:00:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E894217D7
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 15:00:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l0bJ3T+M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E894217D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGm2R-0004X6-Vu; Wed, 17 Apr 2019 14:59:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O1DL=ST=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hGm2R-0004X1-0K
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 14:59:51 +0000
X-Inumbo-ID: 724413df-6121-11e9-92d7-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 724413df-6121-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 14:59:49 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id r24so22797061ljg.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2019 07:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=p2lAENNE7eNjg9BPeIqSv7dIBC+etg7jchcmQiwMVPY=;
 b=l0bJ3T+Myq60XvpOEZ1FOF2gWEVSJb4FV9ZoAQ7XixNvJe8oRdLimve5um71GbRCzw
 Prc8TcCNYXQy8uZPSUgOvzt4JAq8tPKVlkAYnCAE3r0cJYsEY0dohyR3XnnJOXntHkbv
 Ae8b5z/KOfeo+DxNcdM8zVq/PHg/3BiImkdPn1x2k3klTycP09nlLHTTxr1czvwDwel+
 i4d2oayj3vmxnvmSvUQFMM/r2oEp7pmHcqy58Z73G2NjjC3OuRZ4LIjuUgNItZ5AMPCA
 b+rFn/ZQgxIpII67Xnd/YmJg8tkOlvigUerInJIpvfTe9lh58YekLH5xmkTlLbjwht7W
 91uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=p2lAENNE7eNjg9BPeIqSv7dIBC+etg7jchcmQiwMVPY=;
 b=bGuQm4vedk2NTaLfLiFB5zkdFJJbREyuB4jAbbCiMNcgkAoB4buyee48gA2XoVHmqW
 7Jya25Wh36jq1u2Ld/hdANVI4NKyiitQeZT3S1frb961md0GI8xTHVwOSkgi1gbZTQ6Z
 q/hb56GzXEzA1JnpAGCf89TpEmDzNYuNrjYf+8kFMnJ/jwljj1DgS36DFQVw+8iuEOlF
 pBitS8ht6NJ3X/15t4j9IJgOPH2gV8P+6Nyx/hIGjt0ZVccbEam1fUEaA/g+h1GH99V0
 BfiZ4kfFBWTO3/g//o1CLmbVYIXj1z3W6YVwv9ty9rlaXVFSeIokFZzpyacTXmK4lYFR
 DjAg==
X-Gm-Message-State: APjAAAVsduTMBaOsBHAIXSKgxsAk1lw5h4TDwCwQQeCYuGapug30dldw
 3e3AYRRoVAXTLI5B8u2bjLOK4LlZ3aI=
X-Google-Smtp-Source: APXvYqxJx/UuVGO0exSoyalJcplg1G5FEegBPTEbHzQI1QFWNVdnKcChV+SzhrjgisXN+LXHAiSy0w==
X-Received: by 2002:a2e:1245:: with SMTP id t66mr48230249lje.18.1555513188122; 
 Wed, 17 Apr 2019 07:59:48 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id u8sm950273lfi.83.2019.04.17.07.59.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 17 Apr 2019 07:59:47 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 17 Apr 2019 17:59:30 +0300
Message-Id: <1555513175-7596-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [PATCH V4 0/5] Renesas Stout board support (R-Car Gen2)
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
Message-ID: <20190417145930.5eRgqPnElD5kkPnpkv57VhKSegrTOtiuCMbPlviqaeE@z>

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKSGksIGFsbC4KClRoZSBwdXJwb3NlIG9mIHRoaXMgcGF0Y2ggc2VyaWVzIGlzIHRvIGFkZCBy
ZXF1aXJlZCBzdXBwb3J0IHRvIGJlIGFibGUgdG8gcnVuClhlbiBvbiBSZW5lc2FzIFN0b3V0IGJv
YXJkIFsxXSB3aGljaCB1c2VzIFNDSUZBIGNvbXBhdGlibGUgVUFSVCBhcyBhIGNvbnNvbGUKaW50
ZXJmYWNlLgoKQWN0dWFsbHkgWGVuIGFscmVhZHkgaGFzIHN1cHBvcnQgZm9yIFNDSUYgY29tcGF0
aWJsZSBVQVJUcyB3aGljaCBhcmUgdXNlZCBvbgpSZW5lc2FzIExhZ2VyIChSLUNhciBHZW4yKSwg
U2FsdmF0b3ItWCwgSDNVTENCL00zVUxDQiAoUi1DYXIgR2VuMykgYW5kIG90aGVyCmRldmVsb3Bt
ZW50IGJvYXJkcy4gU28gdGhpcyBwYXRjaCBzZXJpZXMgZXh0ZW5kcyBleGlzdGluZyBzdXBwb3J0
IHRvIGJlIGFibGUKdG8gaGFuZGxlIGJvdGggaW50ZXJmYWNlcy4KCi0tLS0tLS0tLS0KCkN1cnJl
bnQgcGF0Y2ggc2VyaWVzIGlzIGJhc2VkIG9uIHRoZSBmb2xsb3dpbmcgY29tbWl0IDFjNjUwNDE2
MzU5NWQ0NWU0N2EwMTc1MDMxOGMyYjdiNTA1NDFjYmUKYW5kIHRlc3RlZCBvbiBTdG91dCAoQVJN
MzIpIGFuZCBIM1VMQ0IgKEFSTTY0KSBib2FyZHMuCgpZb3UgY2FuIGZpbmQgY3VycmVudCBwYXRj
aCBzZXJpZXMgaGVyZToKcmVwbzogaHR0cHM6Ly9naXRodWIuY29tL290eXNoY2hlbmtvMS94ZW4u
Z2l0IGJyYW5jaDogc3RvdXRfdXBzdHJlYW0yCgpZb3UgY2FuIGZpbmQgcHJldmlvdXMgZGlzY3Vz
c2lvbnMgaGVyZToKW1YxXSBodHRwczovL3d3dy5tYWlsLWFyY2hpdmUuY29tL3hlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tc2cyMTA1OC5odG1sCltWMl0gaHR0cHM6Ly93d3cubWFpbC1h
cmNoaXZlLmNvbS94ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcvbXNnMzc1MTguaHRtbApb
VjNdIGh0dHBzOi8vd3d3Lm1haWwtYXJjaGl2ZS5jb20veGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnL21zZzQyNDkzLmh0bWwKCi0tLS0tLS0tLS0KCkluIG9yZGVyIHRvIHJ1biBYZW4gb24g
U3RvdXQgYm9hcmQgeW91IG5lZWQgIlBTQ0ktZW5hYmxlZCIgVS1Cb290IChub3QgdXBzdGVhbWVk
IHlldCkuCllvdSBjYW4gZmluZCBjb3JyZXNwb25kaW5nIHBhdGNoZXMgZm9yIFUtQm9vdCBoZXJl
OgpodHRwOi8vdS1ib290LjEwOTEyLm43Lm5hYmJsZS5jb20vUEFUQ0gtMC0zLVBTQ0ktc3VwcG9y
dC1mb3ItcjhhNzc5MC1Tb0MtTGFnZXItU3RvdXQtYm9hcmRzLXRkMzU3MzUyLmh0bWwKCkhhdmUg
YSBwbGFuIHRvIHVwZGF0ZSBYZW4gV2lraSByZWdhcmRpbmcgdGhpcyBib2FyZC4KClsxXSBodHRw
czovL2VsaW51eC5vcmcvUi1DYXIvQm9hcmRzL1N0b3V0CgpPbGVrc2FuZHIgVHlzaGNoZW5rbyAo
NSk6CiAgeGVuL2FybTogQ2xhcmlmeSB1c2FnZSBvZiBlYXJseXByaW50ayBmb3IgTGFnZXIgYm9h
cmQKICB4ZW4vYXJtOiBkcml2ZXJzOiBzY2lmOiBFeHRlbmQgZHJpdmVyIHRvIGhhbmRsZSBvdGhl
ciBpbnRlcmZhY2VzCiAgeGVuL2FybTogZHJpdmVyczogc2NpZjogQWRkIHN1cHBvcnQgZm9yIFND
SUZBIGNvbXBhdGlibGUgVUFSVHMKICB4ZW4vYXJtOiBFeHRlbmQgU0NJRiBlYXJseSBwcmluayBj
b2RlIHRvIGhhbmRsZSBvdGhlciBpbnRlcmZhY2VzCiAgeGVuL2FybTogQWRkIGVhcmx5IHByaW50
ayBzdXBwb3J0IGZvciBTQ0lGQSBjb21wYXRpYmxlIFVBUlRzCgogZG9jcy9taXNjL2FybS9lYXJs
eS1wcmludGsudHh0ICAgIHwgICA4ICsrLQogeGVuL2FyY2gvYXJtL1J1bGVzLm1rICAgICAgICAg
ICAgIHwgICA3ICsrCiB4ZW4vYXJjaC9hcm0vYXJtMzIvZGVidWctc2NpZi5pbmMgfCAgMjIgKysr
KystLQogeGVuL2RyaXZlcnMvY2hhci9zY2lmLXVhcnQuYyAgICAgIHwgMTMxICsrKysrKysrKysr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tCiB4ZW4vaW5jbHVkZS9hc20tYXJtL3NjaWYtdWFy
dC5oICAgfCAgNDQgKysrKysrKysrKystLQogNSBmaWxlcyBjaGFuZ2VkLCAxNjMgaW5zZXJ0aW9u
cygrKSwgNDkgZGVsZXRpb25zKC0pCgotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
