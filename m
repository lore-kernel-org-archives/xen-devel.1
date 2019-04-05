Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0FF9C4360F
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 03:51:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8190217D7
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 03:51:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sDLJtFmj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8190217D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCFsq-0003U1-9V; Fri, 05 Apr 2019 03:51:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I6Nd=SH=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1hCFso-0003Tw-JF
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 03:51:14 +0000
X-Inumbo-ID: 0e52e116-5756-11e9-92d7-bc764e045a96
Received: from mail-ot1-x333.google.com (unknown [2607:f8b0:4864:20::333])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0e52e116-5756-11e9-92d7-bc764e045a96;
 Fri, 05 Apr 2019 03:51:13 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id u15so4381204otq.10
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2019 20:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nN9/DL+QbGWqTYdzeLQqa/9gC8F19pFASh5zTbmnMNM=;
 b=sDLJtFmjxryerNukEpLb6YMMs1/pKXU/y2baKcigvyuletvw75irJWxMIM2kF5IZho
 ZBUcUnjcQML7Rl3nC3/X+n+NYfYEYqJNVh9FqYOtg5EJRCQmEvu8ftFnaIO2sBeuB1ug
 R09VUGzK8V5vFutHlMYxHSgDxktYFzvM31LBz6Mjy5jKqeMWsYbA6W22LeoBfBC/VXNN
 /7Fw+BDvyJEnB+OwaTt7Iz7aoBvgizYpZpXEOwvp8yt9pWCv2feZp/ZJ5lFUg6IiPXFW
 FUI6q+DtGQ6dwrNH9maBA93Mb9oP+n+S7WU8i/EilQuYi4xrHPZPPGcrYsr392YsxIfu
 AHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nN9/DL+QbGWqTYdzeLQqa/9gC8F19pFASh5zTbmnMNM=;
 b=sKwlmqTzYtcrKnt8NPQsH0XwsFEcTdboGBFsbfBlyFtiHbTuC6xCAS5xZgc1M/iZS2
 Vl0U2OwfmmwQJ2BumkwZuHF4INenwLoRV6F2koS6r4t5uvfwFsZvsW1R1P+/jooqOz5I
 /rX53mrK3LCJx9DOtRkwRDjEgZHq+vJCdXz91Cs+G0PwpQTkcub1zccrW0I3OypqAZ3s
 RFg/tis0PUlC+1eFgKVoLV5LLGa689aL3SbB11JK/TKcoTMpgsI8LAVTmDOUGrGRFDYD
 pBPOyFUlFjk6VvdpZuF1SEocAgI698IUHJq8Q8aEbDwOQ5gSCGw53lQf+dq75tGNJCGu
 OalA==
X-Gm-Message-State: APjAAAUh7ZoQRqkoGxa/PgZneLwkuELzthf+hn19xxPftL+Bmrh6pcuF
 tfO8LZNw2Wg+QNkr/SfBGgg42G38yuKjDmd6LBjUnwcZi44=
X-Google-Smtp-Source: APXvYqzScgHIz49bUOuXJyCAb5puXdccw4V1B3P5F3aK2RZqQLugCz4128WM4wdiTlDspWJ+KEG9VQDSmO9RYSsxcTw=
X-Received: by 2002:a05:6830:1cb:: with SMTP id
 r11mr2653433ota.302.1554436272879; 
 Thu, 04 Apr 2019 20:51:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190404170722.4492-1-anthony.perard@citrix.com>
In-Reply-To: <20190404170722.4492-1-anthony.perard@citrix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Apr 2019 10:51:01 +0700
Message-ID:
 <CAFEAcA8RUYXrFM0vFBh+Om_60g3SW0RZDGC7UT6UQ26mk3uJjQ@mail.gmail.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [Xen-devel] [PULL 0/2] xen queue for 4.0-rc3
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
Cc: "open list:X86" <xen-devel@lists.xenproject.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190405035101.CCGGRNzpdJ47-Zdj7oMmV8kgLhyeoY5rkqcdWuLg3pM@z>

T24gRnJpLCA1IEFwciAyMDE5IGF0IDAwOjA3LCBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJh
cmRAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29t
bWl0IGY0YjM3MTcxMzc4YjBiMTc4MjU3MDA2MGMzNDExYTUwNDM3NWQxYmM6Cj4KPiAgIE1lcmdl
IHJlbW90ZS10cmFja2luZyBicmFuY2ggJ3JlbW90ZXMvY29odWNrL3RhZ3MvczM5MHgtMjAxOTA0
MDMnIGludG8gc3RhZ2luZyAoMjAxOS0wNC0wMyAxMzoxMzozMCArMDEwMCkKPgo+IGFyZSBhdmFp
bGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+Cj4gICBodHRwczovL3hlbmJpdHMueGVu
Lm9yZy9naXQtaHR0cC9wZW9wbGUvYXBlcmFyZC9xZW11LWRtLmdpdCB0YWdzL3B1bGwteGVuLTIw
MTkwNDA0Cj4KPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gMmJjZDA1Y2YyNGE3ZGUz
NGU3ZTI2NTI0N2MwMTA5NzdlNDNmNDBiYzoKPgo+ICAgeGVuLWJsb2NrOiBzY2FsZSBzZWN0b3Ig
YmFzZWQgcXVhbnRpdGllcyBjb3JyZWN0bHkgKDIwMTktMDQtMDQgMTg6MDA6MDcgKzAxMDApCj4K
PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCj4gWGVuIHF1ZXVlCj4KPiB4ZW4tYmxvY2sgZml4ZXMKPgo+IC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBQ
YXVsIER1cnJhbnQgKDIpOgo+ICAgICAgIHhlbi1ibG9jazogb25seSBhZHZlcnRpemUgZGlzY2Fy
ZCB0byB0aGUgZnJvbnRlbmQgd2hlbiBpdCBpcyBlbmFibGVkLi4uCj4gICAgICAgeGVuLWJsb2Nr
OiBzY2FsZSBzZWN0b3IgYmFzZWQgcXVhbnRpdGllcyBjb3JyZWN0bHkKPgpBcHBsaWVkLCB0aGFu
a3MuCgpQbGVhc2UgdXBkYXRlIHRoZSBjaGFuZ2Vsb2cgYXQgaHR0cHM6Ly93aWtpLnFlbXUub3Jn
L0NoYW5nZUxvZy80LjAKZm9yIGFueSB1c2VyLXZpc2libGUgY2hhbmdlcy4KCi0tIFBNTQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
