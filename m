Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54CCFC10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 23:19:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1ABD920656
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 23:19:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/Uiq77v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1ABD920656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGAsQ-0006MC-AJ; Mon, 15 Apr 2019 23:19:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tpG6=SR=gmail.com=pryorm09@srs-us1.protection.inumbo.net>)
 id 1hGAsO-0006M7-Jd
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 23:19:00 +0000
X-Inumbo-ID: d8ea07b1-5fd4-11e9-92d7-bc764e045a96
Received: from mail-it1-x133.google.com (unknown [2607:f8b0:4864:20::133])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d8ea07b1-5fd4-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 23:18:59 +0000 (UTC)
Received: by mail-it1-x133.google.com with SMTP id k64so6017426itb.5
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2019 16:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=yXjOQpy3imZdaXSApCFELOzUjdnOrBm+pMLiDvswA2g=;
 b=H/Uiq77vGFrg+IpoXzStBux6tT0laigukfOE0jq3duyxDk7mgimd2ZmjlZ7L9ZD/g+
 om9GnwxpW4G97tJpsco2ljggzhFPcetP63XGcYqcTqaydHXTlWkfKjz1BRButHyxPFAZ
 67rg0LTT0dpyTNlDkDDTOU2Q8ueIdBxbMsZm4Aydo+R1bp/e/uyiNIQQm29BwpcqdDkH
 1OUwpIYFmR4rh2eKOcdcosiU/iTSxtczVKQOuA902uT0cNEC+xfthIfWo7xqjSJBVIoX
 wuni3/VsLNy7BbO4PTgFfy2BhsmdDo4axlILrYtbeW2cGuNuoPFiaJtv95jcK0mGKFwE
 b92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=yXjOQpy3imZdaXSApCFELOzUjdnOrBm+pMLiDvswA2g=;
 b=UAT1NGWXCdZgXgU6sUwSqXo+tcCF8n6aF7dfto4cmgAqKyZqJ43wRBcVx3e2xavu0E
 XYo1vbIKrkwpYuI6MvFf0sAgC6/zLt8/4tnCTeoB1zAtbfsjl5fIPCGgM5R0cJyzXnMf
 Zju0X7HPagOSCPXNDhAPSIkhyJvoKBcFDqOEWUtwm+0PH1/7ri/auz/SUOSlWM90V1xk
 ZgqW/i/7NT3NuKUzOGmt0/1I7usDDPGsNstjGkgdoq+CRUFcU4NIBKz20iV+xjEnR+AK
 oSEAca6YdhJ3N+qoW4H7KdpS5SFUsDkL/Ardvl/AO/NZIdUWlnUnN/GbQIFIxMapVDky
 YU3Q==
X-Gm-Message-State: APjAAAWgzScts2ybD6PT0zJEWUp0LKTDf4UaxJ7OF9m2B+wGNv2eu9yq
 VbqMacLCM1JzGkaSp7OZynaFBUopO3ylJ7Eiv2C0lQ==
X-Google-Smtp-Source: APXvYqxcZZCy5L4StszBd7xz6yHgVIfBMkmnRYriPhFGDvnby/puEPNGUeV/YfoeJsxNgqaiLjqPX3IJ8hwGgSaGdVA=
X-Received: by 2002:a24:eb17:: with SMTP id h23mr22903773itj.35.1555370338396; 
 Mon, 15 Apr 2019 16:18:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6638:19c:0:0:0:0 with HTTP; Mon, 15 Apr 2019 16:18:57
 -0700 (PDT)
From: Pry Mar <pryorm09@gmail.com>
Date: Mon, 15 Apr 2019 16:18:57 -0700
Message-ID:
 <CAHnBbQ8u+MywkV4+qmxhkA8216knGhGZjcy1Sz6Ukv3=PJZmXQ@mail.gmail.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: [Xen-devel] booting domU guest as pvh works in xen-4.11.1 but fails
 in 4.12
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415231857.m1Cuf9mdoj5u34yefcPwTjYQqFyUDKe2p_iMYBQz808@z>

SGVsbG8sCgpodHRwczovL3Bhc3RlLmRlYmlhbi5uZXQvMTA3NzcxOC8KCkkgZ2V0IGEga2VybmVs
IHBhbmljIGFzIHNob3duIGluIHRoZSBwYXN0ZSBhYm92ZSBubyBtYXR0ZXIgaG93IEkKbGF1bmNo
IHB2aCwgd2l0aCBib290bG9hZGVyIChweWdydWIpLCBrZXJuZWwgZGlyZWN0ICg0LjE4KyksIG9y
CnB2Z3J1YjIgKGkzODYteGVuX3B2aCBzdXBwb3J0KS4KClRoZSBkb20wIGhlcmUgaXMgdWIxODA0
LCBrZXJuZWwtNC4xOCwgYW5kIHhlbi00LjEyIHdpdGggZGViaWFuCnBhY2thZ2VzIChzZWxmIGJ1
aWx0KS4KfiQgc3VkbyBkcGtnIC1sIHwgZ3JlcCAtUCAneGVufHFlbXUnIHwgZ3JlcCAnXmlpJwpp
aSAgbGlieGVuLTQuMTI6YW1kNjQgICAgICA0LjEyLjAtMSt1YjE4dTA0LjEgICAgICAgICAgICAg
ICAgYW1kNjQKICAgUHVibGljIGxpYnMgZm9yIFhlbgppaSAgbGlieGVuc3RvcmUzLjA6YW1kNjQg
IDQuMTIuMC0xK3ViMTh1MDQuMSAgICAgICAgICAgICAgICBhbWQ2NAogIFhlbnN0b3JlIGNvbW11
bmljYXRpb25zIGxpYnJhcnkgZm9yIFhlbgppaSAgbGlieGVudG9vbGNvcmUxOmFtZDY0ICA0LjEy
LjAtMSt1YjE4dTA0LjEgICAgICAgICAgICAgICAgYW1kNjQKICAgaGVscGVyIGZvciBxZW11ICYg
bGlieGVuc3RvcmUKaWkgIHFlbXV1ICAgICAzLjEuMC0xK3ViMTh1MDQuMSAgICAgICAgICAgICAg
ICAgYW1kNjQKcWVtdS1zeXN0ZW0taTM4NiAoMy4xLjAveGVuLTQuMTIpIHdpdGggOXBmcyBzdXBw
b3J0CmlpICB4ZW4taHlwZXJ2aXNvci00LjEyLWFtZDY0ICAgICAgICAgICAgIDQuMTIuMC0xK3Vi
MTh1MDQuMQogICAgIGFtZDY0ICAgICAgICBYZW4gSHlwZXJ2aXNvciBvbiBBTUQ2NAppaSAgeGVu
LXV0aWxzLTQuMTIgICAgICAgICAgICAgICAgICAgICAgICA0LjEyLjAtMSt1YjE4dTA0LjEKICAg
ICBhbWQ2NCAgICAgICAgWEVOIGFkbWluaXN0cmF0aXZlIHRvb2xzCmlpICB4ZW4tdXRpbHMtY29t
bW9uICAgICAgICAgICAgICAgICAgICAgIDQuMTIuMC0xK3ViMTh1MDQuMQogICAgIGFsbCAgICAg
ICAgICBYZW4gYWRtaW5pc3RyYXRpdmUgdG9vbHMgLSBjb21tb24gZmlsZXMKaWkgIHhlbi12aXJi
cjAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMC4xLTIKICAgICBhbGwgICAgICAgICAgU2V0
dXAgYSB2aXJicjAgYnJpZGdlIGFuZCBkbnNtYXNxIG9uIGEKaWkgIHhlbnN0b3JlLXV0aWxzICAg
ICAgICAgICAgICAgICAgICAgICAgNC4xMi4wLTErdWIxOHUwNC4xCiAgICAgYW1kNjQgICAgICAg
IFhlbnN0b3JlIGNvbW1hbmQgbGluZSB1dGlsaXRpZXMgZm9yIFhlbgoKVGhlIHNhbWUgeGwgY29u
ZmlnIGFuZCBncnViIGNvbmZpZyB3b3JrcyBpbiB4ZW4tNC4xMS4xLiBJJ3ZlIHNlYXJjaGVkCmZv
ciBhbnkgbmV3IG9wdGlvbnMgaW4geGwuY2ZnIHRoYXQgY291bGQgaW5mbHVlbmNlIHRoaXMsIGJ1
dCBub3RoaW5nCmNhdGNoZXMgbXkgZXllLgoKSSBnZXQgdGhlIHNhbWUgZG1lc2cgaW4gb3RoZXIg
Ym9vdCBtZXRob2RzLCBidXQgdGhlIGkzODYteGVuX3B2aCBzdHlsZQp5aWVsZHMgbW9yZSBpbmZv
IGF0IHRoZSBlbmQuIFRoZSAoZmlyZS1taXNzbGUpIGdydWIgc2NyaXB0IGlzIHByb3ZpZGVkCkhh
bnMgdmFuIEtyYW5lbmJ1cmcgLgoKQmVmb3JlIHRoZSBpbml0cmQgdW5wYWNrcyBJIHNlZSBtYW55
IGVycm9ycyAobGluZSAyMDEgb2YgcGFzdGUpOgpmdXNlIGluaXQgbW9kcHJvYmUgdHJhcCBpbnZh
bGlkIG9wY29kZSBpcDo3Zjc5N2RjN2JiOTUKCkJ1dCBsYXRlciB0aGUgeGVuX25ldGZyb250IGFu
ZCB4ZW5fYmxrZnJvbnQgZHJpdmVycyBsb2FkIGZpbmUgYW5kIHRoZW4KdHJvdWJsZSBzdGFydHMu
CgpQcnlNYXI1NiwKIyN4ZW4tcGFja2FnaW5nIG9uIEZyZWVub2RlIElSQwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
