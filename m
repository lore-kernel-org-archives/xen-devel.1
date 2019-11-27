Return-Path: <SRS0=ShNj=ZT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16342C432C0
	for <xen-devel@archiver.kernel.org>; Wed, 27 Nov 2019 11:57:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D86F62053B
	for <xen-devel@archiver.kernel.org>; Wed, 27 Nov 2019 11:57:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c9G1qwIz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D86F62053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZvwz-00069g-SS; Wed, 27 Nov 2019 11:57:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BwCA=ZT=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1iZvwy-00069O-FT
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 11:57:40 +0000
X-Inumbo-ID: 1c7780c8-110d-11ea-83b8-bc764e2007e4
Received: from mail-il1-x142.google.com (unknown [2607:f8b0:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c7780c8-110d-11ea-83b8-bc764e2007e4;
 Wed, 27 Nov 2019 11:57:39 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id y16so13256909iln.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2019 03:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:message-id:date
 :cc:to; bh=Ay4NYmrhyuBBDKywNY9l215NzMkY5yzkbbVLM013qG0=;
 b=c9G1qwIz1Wj8iG98R/yBIgAnbBwBuGmafTEKX4yar7xG69/dijJwWyJdXyAQR9+Gzu
 6NaVhXKAsv54aZ4F6wisSMr4K/Yu9FIeD/ggQVlGlYqNwfUA2BVwY8GSvMgpgtnAdfD6
 4gFkj57AizfX6icIew9cNvFCwFmngKwm7QiNFwu/x9pUZVHpuMNORRLyAMe+dels1wfc
 JgKNXVS8Ye20N6uhhM7iTQnZgmly3Yk4VUgDl+bC1D7x9W2oKCSnoilg6Xg0riUytUer
 yg45+At/8ax2owLUzv7HTDpDVmyQmFZwFx36oWG59iyVv5WsiyXVmXoni7PhPk71FPfC
 OGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:message-id:date:cc:to;
 bh=Ay4NYmrhyuBBDKywNY9l215NzMkY5yzkbbVLM013qG0=;
 b=RSZCO/P49HuwXJRubxjIo5KGhO+lfoWEBIP3NAR+mJtoI6AT+cVahOK8jCSod0qHYz
 6e3Gqs52pt4Z/07vME44enTB892j01Vu+JAXmleOlLmIsQUYP2UjjbcBfZeWe9oHUdff
 YzZ3LKprQKesxqndwitcipeAjUoDHJp87jgtVUz6goSHhvgRemcDdEQta9s3fiIVb4lw
 Q2rSh4XNJqlM9Re3p8zjVFHyC8Jho05NCpNWi8vMnMOp+3SG2+SVCMeQZdttKdAYHgP7
 kDfUIg+pp+fgyOz+o9YE7DYXKfexFdF9C8W3+Ezy39cnFDINP7pa4cntIRogrxvmkt4n
 arMQ==
X-Gm-Message-State: APjAAAV+IkO5tV9+E1skiQzQwt7FXpcssMvOZgB/ysx5bsjcDXkv4Qu4
 ohsqTUyeZTPQsGvXH6RQFSE=
X-Google-Smtp-Source: APXvYqyKqxwiofb+1UvftOAsHYMb7xo1S1QkZQhWpnCHuC9si3AGpigzPfah0EvFKu6cyzYbU5jXZw==
X-Received: by 2002:a92:660e:: with SMTP id a14mr44545997ilc.235.1574855859439; 
 Wed, 27 Nov 2019 03:57:39 -0800 (PST)
Received: from [100.64.72.114] ([173.245.215.240])
 by smtp.gmail.com with ESMTPSA id n3sm4306199ilm.74.2019.11.27.03.57.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2019 03:57:38 -0800 (PST)
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Message-Id: <D59740EE-F12A-4222-9E26-1E789BA6DE73@gmail.com>
Date: Wed, 27 Nov 2019 06:57:37 -0500
To: Jan Beulich <JBeulich@suse.com>
X-Mailer: iPad Mail (17B111)
Subject: Re: [Xen-devel] UEFI support on Dell boxes (was: Re: Status of 4.13)
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Lars Kurth <lars.kurth@citrix.com>, Roman Shaposhnik <roman@zededa.com>,
 =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

77u/T24gTm92IDI3LCAyMDE5LCBhdCAwNDoxNiwgSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2Uu
Y29tPiB3cm90ZToKPiAKPiDvu79PbiAyNi4xMS4yMDE5IDIyOjIwLCBSaWNoIFBlcnNhdWQgd3Jv
dGU6Cj4+IEFzIGFuIGludGVybWVkaWF0ZSBzdGVwLCBjb3VsZCB3ZSBoYXZlIGFuIHVtYnJlbGxh
IG9wdC1pbgo+PiBLY29uZmlnIG9wdGlvbiAoQ09ORklHX0VGSV9OT05TUEVDX0NPTVBBVElCSUxJ
VFk/KSB0aGF0Cj4+IGVuYWJsZXMgbXVsdGlwbGUgRUZJIG9wdGlvbnMgZm9yIG1heGltdW0gaGFy
ZHdhcmUgY29tcGF0aWJpbGl0eT8KPj4gRm9yIHRoaXMgdGhyZWFkIGFuZCBYZW4gNC4xMywgdGhh
dCB3b3VsZCBiZQo+PiBFRklfU0VUX1ZJUlRVQUxfQUREUkVTU19NQVAgYW5kIGVmaT1hdHRyPXVj
LiAgSWYgbW9yZQo+PiBvcHRpb25zL3F1aXJrcyBhcmUgYWRkZWQgaW4gdGhlIGZ1dHVyZSwgZG93
bnN0cmVhbXMgdXNpbmcKPj4gRUZJX05PTlNQRUNfQ09NUEFUSUJJTElUWSB3b3VsZCBnZXQgdGhl
bSBieSBkZWZhdWx0Lgo+IAo+IFdoaWxlIEkgZG9uJ3QgcGFydGljdWxhcmx5IGxpa2UgaXQsIEkn
ZCBiZSBva2F5IHdpdGggaGF2aW5nIHN1Y2gKPiBhbiBvcHRpb24sIHByb3ZpZGVkIGl0IGRvZXNu
J3QgaGFtcGVyIGNvZGUgcmVhZGFiaWxpdHkgdG9vIG11Y2guCj4gSG93ZXZlciAtIHdoeSB3b3Vs
ZCB5b3Ugc3RvcCBhdCB0aG9zZSB0d28gdGhpbmdzPyBXaHkgbm90IGFsc28KPiBleGNsdWRlIHJl
Ym9vdCB0aHJvdWdoIFVFRkkgKGFzIGluZGljYXRlZCBieSBBbmRyZXcpLCBvciB1c2Ugb2YKPiBy
dW50aW1lIHNlcnZpY2VzIGFzIGEgd2hvbGU/IFdoYXQgYWJvdXQgL21hcGJzPyBUaGUgZnVuZGFt
ZW50YWwKPiBwcm9ibGVtIEkgc2VlIGhlcmUgcmVhbGx5IGlzIC0gd2hlcmUgd291bGQgd2UgZHJh
dyB0aGUgbGluZT8KCklmIHdlIHRha2UgdGhpcyB0aHJlYWQgYXMgYW4gZXhhbXBsZSwgYSBtaWRk
bGUgZ3JvdW5kIHdhcyBmb3VuZCBhbW9uZyBkZXZlbG9wZXJzIG1vdGl2YXRlZCB0byBtYWludGFp
biB0aGUgd29ya2Fyb3VuZHMgZm9yIGRvd25zdHJlYW0gcHJvamVjdHMgd2l0aCBhZmZlY3RlZCBo
YXJkd2FyZS4gIFF1YmVzLCBFVkUgJiBPcGVuWFQgYXJlIHVzZWQgb24gZWRnZS9jbGllbnQgZGV2
aWNlcyB0aGF0IG9mdGVuIGhhdmUgKHJlbGF0aXZlIHRvIHNlcnZlcnMpIGEgc2hvcnRlciBsaWZl
dGltZSwgd2l0aCBtb3JlIGRldmljZSBjaHVybiBhbmQgc3VwcG9ydCBjb3N0cy4gCgpUaGVzZSB0
d28gaW5pdGlhbCBvcHRpb25zIHdvdWxkIGFkZHJlc3MgY3VycmVudCBwYWluIHBvaW50cyBhbmQg
ZW5hYmxlIHRoZSB1c2Ugb2YgdXBzdHJlYW0gWGVuICsgRUZJIFJTIG9uIG1vcmUgZGV2aWNlcywg
ZS5nLiBmb3IgT1RBIHVwZGF0ZXMgd2l0aCBmb3J3YXJkLXNlYWxlZCBpbnRlZ3JpdHkgbWVhc3Vy
ZW1lbnRzLiAgVGhlIGxpbmUgY291bGQgY2hhbmdlIGlmIG1vcmUgZG93bnN0cmVhbXMgYWRvcHQg
dGhlIG9wdGlvbiBhbmQvb3IgbmV3IGRldmljZXMgYXBwZWFyIHRoYXQgaGF2ZSBib3RoIGN1c3Rv
bWVyIGFkb3B0aW9uIGFuZCBwcm9ibGVtYXRpYyBmaXJtd2FyZSBiZWhhdmlvci4KClJpY2gKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
