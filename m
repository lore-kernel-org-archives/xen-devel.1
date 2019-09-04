Return-Path: <SRS0=pR42=W7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7303CC3A5A8
	for <xen-devel@archiver.kernel.org>; Wed,  4 Sep 2019 17:26:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42C5D2087E
	for <xen-devel@archiver.kernel.org>; Wed,  4 Sep 2019 17:26:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lYlW7E+I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42C5D2087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5Z2a-0000Vr-SK; Wed, 04 Sep 2019 17:25:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bAUX=W7=gmail.com=dpsmith.dev@srs-us1.protection.inumbo.net>)
 id 1i5Z2Z-0000Vm-Kw
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 17:25:55 +0000
X-Inumbo-ID: 0d0287de-cf39-11e9-a337-bc764e2007e4
Received: from mail-ot1-x32e.google.com (unknown [2607:f8b0:4864:20::32e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d0287de-cf39-11e9-a337-bc764e2007e4;
 Wed, 04 Sep 2019 17:25:55 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id 97so18565293otr.4
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2019 10:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vQ1U4p2LoFVy5zsjFNweApsjfU1o3VT77htcmCCSCO8=;
 b=lYlW7E+IhJJ+tQIPMrCVNJMXLmuIhD0MT+5QYThdZkqRq5xIqGcVzSKM26jVEwUl2N
 RMs9br5id1Z6sNQ6Py6cGQVHz2R6uxD0WgFqOT2cYn4gDsl4Gy9WTGgNE8WQRDNfNscK
 LiSh05laMZuhlslaI4/vke6emz2HFzzigwCAlZ7Oow21l9s/gmNrpb6JkNjhBg5Q8i2d
 jdnqzRcvTQWTAr+Abk6x2pdRiLFbNcbPzVtQJRMGdRXeAHwQmNHf5fY396uJzGgIyo7r
 tcw9T7eQzUkh3xDtR9I9u0pSQfHEo6wGxBXdF/CpftXo2IjcE5XJA5ua9ZZcvJmgRHiS
 WCWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vQ1U4p2LoFVy5zsjFNweApsjfU1o3VT77htcmCCSCO8=;
 b=Nw3+5cuOCibzAgfoaeNVueBO2y7aiR97uMPeFFvaM7LJ2a9biZg2mw4R/3tJ9Z4F2V
 nF1U9x/jgnACuwr2rW6okbtoue/tHS3Z9zJ8P+EdQl+gRIzs8tCDNpi7TJ4rBRGJ6Pdj
 so6onkK93EYjAsr5VRj8YqwkJDdpCMV8/Ddb0QVh/HxgUswdGTfr+ZH1FpapvZFpERzN
 DmQtpQjKZk64e8WNuSb9pptKIvoFMmb+b6S39CwncjK0xXzPT3X5ZZ9KFOMId00KjE8l
 +6C1yKBh4WKLIG8jsm3Ih82sluuNPXWL31Ud1wpGAcFkM38vpKTtgLW/bHQ1NRrt9t+2
 1D1w==
X-Gm-Message-State: APjAAAXvoaTOZi5W1mqE+3DEVo3w6PZVgLnqWnxTpuRd492xlAGwv+Nk
 zEez/9mjgrlcczWcBsF8BEVTxrM5ejujAJ2ZNwY=
X-Google-Smtp-Source: APXvYqzHZRuEiu78m92HUfCT46JMZXdHMlTcVYCPeBldTEcVWGrN2qxFyJTFgIqz985RCzWLI2nbseGophx1HpMalGE=
X-Received: by 2002:a9d:61d3:: with SMTP id h19mr13336598otk.325.1567617954720; 
 Wed, 04 Sep 2019 10:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <CADAP9AWJ46Oh=b-1K1hTNnkD=0DTYtYGX4L7VQp51QBaQCeYNw@mail.gmail.com>
 <2e2293bc-4187-3fe8-52d6-96f709ae4c3c@suse.com>
In-Reply-To: <2e2293bc-4187-3fe8-52d6-96f709ae4c3c@suse.com>
From: Daniel Smith <dpsmith.dev@gmail.com>
Date: Wed, 4 Sep 2019 13:26:29 -0400
Message-ID: <CADAP9AVJqfBGNBQVE-4ztA7Tjdwf0Y9GC-P=jwkx8sTM98BzVw@mail.gmail.com>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [Xen-devel] Running xenstored in Linux stubdom
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgNCwgMjAxOSBhdCAxMjoxMiBQTSBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gVGhlIHN0dWJkb20gZ2V0cyBhbiBldmVudCBjaGFubmVsIHRvIHVz
ZSBmb3IgZG9tMCB4ZW5ic3RvcmUgY29ubmVjdGlvbgo+IHZpYSBjb21tYW5kbGluZSBwYXJhbWV0
ZXIgKCItLWV2ZW50IDxldmVudC1ucj4iKS4gVGhpcyBuZWVkcyB0byBiZSB1c2VkCj4gaW4gdGhl
IHN0dWJkb20gZm9yIHNldHRpbmcgdXAgdGhlIGNvbW11bmljYXRpb24gcGF0aC4KPgo+Cj4gSnVl
cmdlbgoKSGkgSnVlcmdlbiwKClRoYW5rcyBmb3IgdGhlIHF1aWNrIHJlc3BvbnNlISB0cmFjaW5n
IHRocm91Z2ggeGVuc3RvcmVkLCBsb29rcyBsaWtlCnRoYXQgZmxhZyBzZXRzIHRoZSB2YXJpYWJs
ZSBkb20wX2V2ZW50IHdoaWNoIGlzIG9ubHkgdXNlZCBpbiB0aGUKeGVuc3RvcmVkX21pbmlvcy5j
IGFzIHRoZSByZXR1cm4gdmFsdWUgdG8gdGhlIHhlbmJ1c19ldnRjaG4oKSBjYWxsLiBJCmNvdWxk
IG5haXZlbHkgc2hvcnQgY2lyY3VpdCB4ZW5idXNfZXZ0Y2huKCkgdW5kZXIgeGVuc3RvcmVkX3Bv
c2l4LmMgdG8KcmV0dXJuIGltbWVkaWF0ZWx5IGlmIGRvbTBfZXZlbnQgaGFzIGJlZW4gc2V0LiBJ
ZiB0aGF0IHdvcmtzLCBJIHdvdWxkCmJlIGdsYWQgdG8gc3VibWl0IGl0IGJhY2sgdXBzdHJlYW0g
aWYgdGhlcmUgaXMgaW50ZXJlc3QgaW4KaW5jb3Jwb3JhdGluZyBpdC4KClRoYW5rcyBhZ2FpbiEK
RGFuaWVsIFAuIFNtaXRoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
