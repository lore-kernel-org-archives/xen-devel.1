Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 627C7C10F13
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 10:15:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32FEE20880
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 10:15:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e8UD44wv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32FEE20880
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDRIs-0003lz-0t; Mon, 08 Apr 2019 10:15:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=agIW=SK=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hDRIr-0003ln-KY
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 10:15:01 +0000
X-Inumbo-ID: 2a4344e4-59e7-11e9-92d7-bc764e045a96
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2a4344e4-59e7-11e9-92d7-bc764e045a96;
 Mon, 08 Apr 2019 10:15:00 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id j89so10711178ljb.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2019 03:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=QSuXxKsaItfUzaVOHVzutYslnSdDrbNwF/uMShg7UE4=;
 b=e8UD44wv/lhp4KkD4MuhhctYwbjyrm8Tjii5vOwZvBzSVp5iveQ5/zF4rHxBztwOGy
 RB0kuexE3YCLsVyEtDJI04sP1K0Y198DFLohAbpHN215uH76PUp1I4BKFS10DQP8cesj
 92E20UmwfumldV8FZzzoEIzcUhLZz3assapgNk1M60A+SIrouOTxiuPfQlP16+qFIo/C
 Di3MhdsbNTMWVwaLG6oYzDEUI5JmcP4cvFwgoByD+4xHf7Mvz47h1McmcPm+Zem1X0aM
 Dh4KObEHfN+kh87+YuOmIQkvxdhAvj35Deq+mrx1QqpXdwSI1dh1rS/fWRkZ1alokSgz
 7TGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=QSuXxKsaItfUzaVOHVzutYslnSdDrbNwF/uMShg7UE4=;
 b=i2e++fdVPhqisCgZWS5938sLpdtLo+l8sxmijbgoatjisH79KN6BZtGPIF+IPrXOIs
 2GD6ngkLM185IJEo476x/+Mbby1/LgT0UB+t/ke+EiC9JkLgOVUKYUDxWqoyZ5V9VvFd
 w5k4JKp6ez3M0YkiKProKFXejQJvo0aVBmwA692aD0Af35vVbdHSAxY4hLWXQWqG1JFQ
 K4iOGQu42Y5PhaJVa9/YiEfHhMviGa/DF32gkj4rtBC80wkdC4+XrVt7+KV4xq7iPW4o
 cTsHovvp/gHkt7MHKKtrhvK8qYxy9l7xWAcBDbEYIBZj2k+lVgnf5fonuRpCSEHdbPlt
 mLDw==
X-Gm-Message-State: APjAAAVpqVmYuiSEz9cV570mSFuGzbMhsd5Imw3sZ1MVJv7Tksxkh6Lm
 /I6BUmkdc2n9AXeYq50M2SyYPD/JAPM=
X-Google-Smtp-Source: APXvYqzbIjX6QIulv5Q8/M6+zgL0cO4MZ7rcW8ZlD98TrrQxeTFlB23GeXNwdU/D+1jMPNMEaMmcXg==
X-Received: by 2002:a2e:12c4:: with SMTP id 65mr14975930ljs.141.1554718498474; 
 Mon, 08 Apr 2019 03:14:58 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id x30sm6275717ljd.38.2019.04.08.03.14.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 08 Apr 2019 03:14:57 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  8 Apr 2019 13:14:44 +0300
Message-Id: <1554718489-11318-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [PATCH V3 0/5] Renesas Stout board support (R-Car Gen2)
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
Message-ID: <20190408101444.WEOS5SdKHM3i0e-cXb08y1CedFXwbgRxcirM_Gy3TCA@z>

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
Z2l0IGJyYW5jaDogc3RvdXRfdXBzdHJlYW0xCgpZb3UgY2FuIGZpbmQgcHJldmlvdXMgZGlzY3Vz
c2lvbnMgaGVyZToKW1YxXSBodHRwczovL3d3dy5tYWlsLWFyY2hpdmUuY29tL3hlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tc2cyMTA1OC5odG1sCltWMl0gaHR0cHM6Ly93d3cubWFpbC1h
cmNoaXZlLmNvbS94ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcvbXNnMzc1MTguaHRtbAoK
LS0tLS0tLS0tLQoKSW4gb3JkZXIgdG8gcnVuIFhlbiBvbiBTdG91dCBib2FyZCB5b3UgbmVlZCAi
UFNDSS1lbmFibGVkIiBVLUJvb3QgKG5vdCB1cHN0ZWFtZWQgeWV0KS4KWW91IGNhbiBmaW5kIGNv
cnJlc3BvbmRpbmcgcGF0Y2hlcyBmb3IgVS1Cb290IGhlcmU6Cmh0dHA6Ly91LWJvb3QuMTA5MTIu
bjcubmFiYmxlLmNvbS9QQVRDSC0wLTMtUFNDSS1zdXBwb3J0LWZvci1yOGE3NzkwLVNvQy1MYWdl
ci1TdG91dC1ib2FyZHMtdGQzNTczNTIuaHRtbAoKSGF2ZSBhIHBsYW4gdG8gdXBkYXRlIFhlbiBX
aWtpIHJlZ2FyZGluZyB0aGlzIGJvYXJkLgoKWzFdIGh0dHBzOi8vZWxpbnV4Lm9yZy9SLUNhci9C
b2FyZHMvU3RvdXQKCk9sZWtzYW5kciBUeXNoY2hlbmtvICg1KToKICB4ZW4vYXJtOiBDbGFyaWZ5
IHVzYWdlIG9mIGVhcmx5cHJpbnRrIGZvciBMYWdlciBib2FyZAogIHhlbi9hcm06IGRyaXZlcnM6
IHNjaWY6IEV4dGVuZCBkcml2ZXIgdG8gaGFuZGxlIG90aGVyIGludGVyZmFjZXMKICB4ZW4vYXJt
OiBkcml2ZXJzOiBzY2lmOiBBZGQgc3VwcG9ydCBmb3IgU0NJRkEgY29tcGF0aWJsZSBVQVJUcwog
IHhlbi9hcm06IEV4dGVuZCBTQ0lGIGVhcmx5IHByaW5rIGNvZGUgdG8gaGFuZGxlIG90aGVyIGlu
dGVyZmFjZXMKICB4ZW4vYXJtOiBBZGQgZWFybHkgcHJpbnRrIHN1cHBvcnQgZm9yIFNDSUZBIGNv
bXBhdGlibGUgVUFSVHMKCiBkb2NzL21pc2MvYXJtL2Vhcmx5LXByaW50ay50eHQgICAgfCAgIDIg
Ky0KIHhlbi9hcmNoL2FybS9SdWxlcy5tayAgICAgICAgICAgICB8ICAgNyArKwogeGVuL2FyY2gv
YXJtL2FybTMyL2RlYnVnLXNjaWYuaW5jIHwgIDIyICsrKystLQogeGVuL2RyaXZlcnMvY2hhci9z
Y2lmLXVhcnQuYyAgICAgIHwgMTM3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tCiB4ZW4vaW5jbHVkZS9hc20tYXJtL3NjaWYtdWFydC5oICAgfCAgNDQgKysrKysrKysrKy0t
CiA1IGZpbGVzIGNoYW5nZWQsIDE2MyBpbnNlcnRpb25zKCspLCA0OSBkZWxldGlvbnMoLSkKCi0t
IAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
