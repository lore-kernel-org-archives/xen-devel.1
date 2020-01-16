Return-Path: <SRS0=q1ly=3F=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33131C33CAF
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jan 2020 19:58:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0018E2072B
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jan 2020 19:58:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOoD2oy0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0018E2072B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isBHC-0005Vj-1o; Thu, 16 Jan 2020 19:57:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Je7C=3F=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1isBHA-0005Ve-Km
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 19:57:56 +0000
X-Inumbo-ID: 7c7d2cb6-389a-11ea-ac27-bc764e2007e4
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c7d2cb6-389a-11ea-ac27-bc764e2007e4;
 Thu, 16 Jan 2020 19:57:55 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id 15so16533780lfr.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2020 11:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3Epgq7CGlmH0NNlNXlaNOdD7rsIthbfaoqbV1bHADQg=;
 b=HOoD2oy0lMF3o2NBEmPK5BGHrfwHFOkvIJMFxNxO7M9XIlWI4MMrkGzcwUdlKgFnga
 ny2H/Kqko61lgnmPvcWB7BRlBUJM4Oahlr2FfA0Dy07Mewzw+XGPex9pq7R/tKP3tqyz
 1EB5AXy0z7YW7ciW9/FqiJJ2HKQCAzPcrj7Wc5PsAfjBRdC+XByLqXZ9C2BtBA4BdZ4e
 BkEJwfoNxCiew66uTTepXRpzwOwKP1kI6dFKtfkVGz4OuLn9WywSMyhatmB7qfXcmmbV
 N+hid0ZRB8Y1Sx7gLooqhYAfirwc+2QFgE6XRjozAkz2obIMPvEehg5UcKAPwrLnWgNg
 JKjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3Epgq7CGlmH0NNlNXlaNOdD7rsIthbfaoqbV1bHADQg=;
 b=D+hsWJfu47/o3b4VogiNwtwu0a8WdIX0NeZYCJ96F3Z/errhP/BMmPwQ/O9iQcpSFH
 tmF819Gx4bvikqeGFl1aQSOT/xtkoB/4i97p50lHI7dnxtNQaZl+IEyJRH1ZFCsm2rhT
 VPYNscpZ3A4iqQOEy2jMRgqeTGj8J33Xt+kqhdTjFFhbT3fsW6BiWEXCciTbwfUHawuK
 JcX1gI6pusF/I2EIP+ozF7b16pt0eDxVV1kCIXJETcs6ZKxfkvEu/trOZ/ZimJMr2sy/
 0XMgFhNh3AGeUBW55oY4UFH+hoh2IzC4Yo4UBxnlXzqmdYj4UijCmUCLpvtUcZq7mbse
 KJ0Q==
X-Gm-Message-State: APjAAAXP1TzKD5rC0Gc5FX+6kI+aSB3xrFtRXCmfharn0OdgnB5FquC4
 vS6ikmOy24HTct88GrXgN30X/Szf9VwPHQL4rTc=
X-Google-Smtp-Source: APXvYqy3uqEovgXnJ5WRxiOR/wmB68SBcqRBzUpp5r4NjHKNW+Tst7rk5tD7po/lpQhduwWZDsc+sK/JYTvfsg0E/r4=
X-Received: by 2002:a19:c648:: with SMTP id w69mr3292739lff.44.1579204674854; 
 Thu, 16 Jan 2020 11:57:54 -0800 (PST)
MIME-Version: 1.0
References: <20200114181345.27565-1-roger.pau@citrix.com>
In-Reply-To: <20200114181345.27565-1-roger.pau@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 16 Jan 2020 14:57:43 -0500
Message-ID: <CAKf6xpsw9heQ+33F9o0-=A5jEq4d7ehke8sfikD23o87FHOubw@mail.gmail.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [Xen-devel] [PATCH] x86/hvmloader: align BAR position to 4K
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMTQsIDIwMjAgYXQgMToxNiBQTSBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPiB3cm90ZToKPgo+IFdoZW4gcGxhY2luZyBCQVJzIHdpdGggc2l6ZXMgc21h
bGxlciB0aGFuIDRLIG11bHRpcGxlIEJBUnMgY2FuIGVuZAo+IHVwIG1hcHBlZCB0byB0aGUgc2Ft
ZSBndWVzdCBwaHlzaWNhbCBhZGRyZXNzLCBhbmQgdGh1cyB3b24ndCB3b3JrCj4gY29ycmVjdGx5
Lgo+Cj4gQWxpZ24gYWxsIEJBUnMgcGxhY2VtZW50IHRvIDRLIGluIGh2bWxvYWRlciB0byBwcmV2
ZW50IHN1Y2gKPiBvdmVybGFwcGluZy4KPgo+IE5vdGUgdGhhdCB0aGUgZ3Vlc3QgY2FuIHN0aWxs
IG1vdmUgdGhlIEJBUnMgYXJvdW5kIGFuZCBjcmVhdGUgdGhpcwo+IGNvbGxpc2lvbnMsIGFuZCB0
aGF0IEJBUnMgbm90IGZpbGxpbmcgdXAgYSBwaHlzaWNhbCBwYWdlIG1pZ2h0IGxlYWsKPiBhY2Nl
c3MgdG8gb3RoZXIgTU1JTyByZWdpb25zIHBsYWNlZCBpbiB0aGUgc2FtZSBob3N0IHBoeXNpY2Fs
IHBhZ2UuCj4KPiBUaGlzIGlzIGhvd2V2ZXIgbm8gd29yc2UgdGhhbiB3aGF0J3MgY3VycmVudGx5
IGRvbmUsIGFuZCBoZW5jZSBzaG91bGQKPiBiZSBjb25zaWRlcmVkIGFuIGltcHJvdmVtZW50IG92
ZXIgdGhlIGN1cnJlbnQgc3RhdGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClRlc3RlZC1ieTogSmFzb24gQW5kcnl1ayA8amFuZHJ5
dWtAZ21haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
