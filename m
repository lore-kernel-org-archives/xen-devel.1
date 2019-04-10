Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 838E8C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 16:27:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F6F0206DF
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 16:27:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JY5xEVgZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F6F0206DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEG4A-0000MA-PX; Wed, 10 Apr 2019 16:27:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7gEf=SM=linaro.org=ard.biesheuvel@srs-us1.protection.inumbo.net>)
 id 1hEG49-0000M3-HX
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 16:27:13 +0000
X-Inumbo-ID: 7e6af8dd-5bad-11e9-92d7-bc764e045a96
Received: from mail-io1-xd43.google.com (unknown [2607:f8b0:4864:20::d43])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7e6af8dd-5bad-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 16:27:12 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id v4so2694605ioj.5
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2019 09:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qWmg/3LCnbwFwJsKOwOcqdhI2LZeB6nH0oe80xU4WNU=;
 b=JY5xEVgZUkmeMuYZo6oxBOKS6+e1RJfoKJJysV4bzbLWOjkVOT07ZfMek6QyZJOVYf
 ACYEKQ7I3XrWyEiZ2qMB8xbwaiWpxayEV30V/FV6cspRwKWJ+7iuXzsihGv9i99bjCKJ
 ckQhaqp1kNpHjZLEEcH8dpG84V4EDQUOVyTm06tihKj+hfkm933aNoRH//92BRrH67P1
 UNpQDHmHL3lx3PV+L2sPpZTABfrPZfjqSS0ILNGx89PWu3lv8O/Eync8iF1DuTHQzffy
 ZJR1PiilU9YhmEdvT30TlzwNY8lgAxRtxAwEeQJ5BDu/hGQtKLKET6j7xc0V9HXx6SzE
 QjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qWmg/3LCnbwFwJsKOwOcqdhI2LZeB6nH0oe80xU4WNU=;
 b=p3gjmY2cIBYl8HeihpU0PvGLiQ3D/6rTHqycxghX8q3dOxTh6pW7KvOqXp78lsF04x
 2emnaxAErUePRlPZGc+9unPvyvGyzsj4rzPWXJLjLITNN4J+NIh9Z0Rk6Kqfieup5x3B
 fF7xC3l0f1AGF7tBy8fpLQbTQYxGTSLX9wfy8kmijLP7F7z3De6uTC9jtrkKk/SG2+az
 0YovSUh9DanH7jw6OtRHxzncxnKKdhO1QfM7WtMY6QiBaEOygYSvILoyZIMEbCszDI7I
 k1RfjaC23m4IcxBH25IiEToYn4fw9OQpoGR3INPotzadPD3q7q1FjOZrVyM1dKsaritZ
 1OgA==
X-Gm-Message-State: APjAAAU06z9n4aRaqwgzcihQ6pG0Uj2X4bbTSpG7oR5QGcTFZhWX9ZGn
 cG0q7BlkJOp/TxJYU3t9Zvp3y0j/5tLyi7kQil9hOA==
X-Google-Smtp-Source: APXvYqxSFjuppHHHtohkcJoYDHryseturFvYtjvY8AGXgWv517e8+Fzrz4cVRovG37ZxFhU70x7GdW72pCpZ+ZYcqbs=
X-Received: by 2002:a5d:840d:: with SMTP id i13mr22030031ion.186.1554913631686; 
 Wed, 10 Apr 2019 09:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-3-anthony.perard@citrix.com>
 <155488970861.20447.12525571872411959890@jljusten-skl>
 <a3e5b97c-6dc7-788f-99a8-769e37f3a8d5@redhat.com>
In-Reply-To: <a3e5b97c-6dc7-788f-99a8-769e37f3a8d5@redhat.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Wed, 10 Apr 2019 09:27:02 -0700
Message-ID:
 <CAKv+Gu_6KwiNVJgUZ=p1fLaQZXm3qyqb3FkZi2=7q3tbtt3QnQ@mail.gmail.com>
To: edk2-devel-groups-io <devel@edk2.groups.io>,
 Laszlo Ersek <lersek@redhat.com>
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v2 02/31] OvmfPkg: Create
 platform XenOvmf
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410162702.HOvGDXNSSceNEQnuqCHLnnrQwrxe3YIhmEh5zlVaHHc@z>

T24gV2VkLCAxMCBBcHIgMjAxOSBhdCAwNzoyNywgTGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0
LmNvbT4gd3JvdGU6Cj4KPiBPbiAwNC8xMC8xOSAxMTo0OCwgSm9yZGFuIEp1c3RlbiB3cm90ZToK
PiA+IE9uIDIwMTktMDQtMDkgMDQ6MDg6MTUsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+ID4+IFRo
aXMgaXMgYSBjb3B5IG9mIE92bWZYNjQsIHJlbW92aW5nIFZpcnRJTyBhbmQgc29tZSBTTU0uCj4g
Pj4KPiA+PiBUaGlzIG5ldyBwbGF0Zm9ybSB3aWxsIGJlIGNoYW5nZWQgdG8gbWFrZSBpdCB3b3Jr
cyBvbiB0d28gdHlwZXMgb2YgWGVuCj4gPj4gZ3Vlc3Q6IEhWTSBhbmQgUFZILgo+ID4+Cj4gPj4g
Q29tcGFyZSB0byBPdm1mWDY0LCB0aGlzIHBhdGNoOgo+ID4+Cj4gPj4gLSBjaGFuZ2VkOiBQTEFU
Rk9STV9HVUlELCBPVVRQVVRfRElSRUNUT1JZLCBGTEFTSF9ERUZJTklUSU9OCj4gPj4gLSByZW1v
dmVkOiBWaXJ0aW9MaWIgY2xhc3MgcmVzb2x1dGlvbgo+ID4+IC0gcmVtb3ZlZDogYWxsIFVFRklf
RFJJVkVSIG1vZHVsZXMgZm9yIHZpcnRpbyBkZXZpY2VzCj4gPj4gLSByZW1vdmVkOiBEWEVfU01N
X0RSSVZFUiBhbmQgU01NX0NPUkUgbGliIGNsYXNzIHJlc29sdXRpb25zCj4gPj4gLSByZW1vdmVk
OiBEWEVfU01NX0RSSVZFUiBhbmQgU01NX0NPUkUgRkRGIHJ1bGVzCj4gPj4gLSByZW1vdmVkOiBF
dmVyeXRoaW5nIHJlbGF0ZWQgdG8gU01NX1JFUVVJUkU9PXRydWUKPiA+PiAtIHJlbW92ZWQ6IEV2
ZXJ5dGhpbmcgcmVsYXRlZCB0byBTRUNVUkVfQk9PVF9FTkFCTEU9PXRydWUKPiA+PiAtIHJlbW92
ZWQ6IEV2ZXJ5dGhpbmcgcmVsYXRlZCB0byBUUE0yX0VOQUJMRT09dHJ1ZQo+ID4+IC0gY2hhbmdl
ZDogUGNkUGNpRGlzYWJsZUJ1c0VudW1lcmF0aW9uIGR5bmFtaWMgZGVmYXVsdCBmbGlwcGVkIHRv
IFRSVUUKPiA+PiAtIGNoYW5nZWQ6IGRlZmF1bHQgRkRfU0laRV9JTl9LQiB0byAyTS4KPiA+Pgo+
ID4+IENvbnRyaWJ1dGVkLXVuZGVyOiBUaWFub0NvcmUgQ29udHJpYnV0aW9uIEFncmVlbWVudCAx
LjEKPiA+PiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0
cml4LmNvbT4KPiA+PiAtLS0KPiA+PiAgT3ZtZlBrZy97T3ZtZlBrZ1g2NC5kc2MgPT4gWGVuT3Zt
Zi5kc2N9ICAgICB8IDIwMiArLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4KPiA+IEkgZ3Vlc3Mgd2Ug
YWxsIHdhbnQgb3VyIG5hbWUgdG8gYmUgZmlyc3QgOiksIGJ1dCBPdm1mWGVuIHNlZW1zIG1vcmUK
PiA+IGxpa2UgdGhlIHBhdHRlcm4gdGhhdCBlZGsyIHVzZXMgd2hlbiBtYWtpbmcgc3ViLXBsYXRm
b3Jtcy4KPiA+Cj4gPiBBbHNvLCBpbiBzb21lIGNhc2VzIHdlJ3ZlIHVzZWQgIWlmZGVmIHR5cGUg
dGhpbmdzIHRvIGtlZXAgZHNjIGFuZCBmZGYKPiA+IGZpbGVzIGNvbW1vbi4gV291bGQgdGhhdCBu
b3QgYmUgd29ya2FibGUgaGVyZT8gTWF5YmUgaXQgd291bGQgZ2V0IHRvbwo+ID4gdWdseS4gOlwK
Pgo+IEkndmUgYmVlbiBoYXBweSB3aXRoIGEgc2ltaWxhciBYZW48LT5RRU1VIHNwbGl0IHVuZGVy
IEFybVZpcnRQa2cuCj4gRHVwbGljYXRpb25zIGluIHVwZGF0ZXMgYXJlIHVzdWFsbHkgbm90IGEg
aHVnZSBidXJkZW4sIGFuZCBrZWVwaW5nIHRoZQo+IGZpbGVzIHNlcGFyYXRlIGhhcyBwcm92ZWQg
dmVyeSBoZWxwZnVsIGZvciBkZXRlcm1pbmluZwo+IG1haW50YWluZXIvcmV2aWV3ZXIvdGVzdGVy
IHJlc3BvbnNpYmlsaXR5Lgo+Cj4gPiBJdCBjb3VsZCBoZWxwIHRvIHByZXZlbnQgaGF2aW5nIHRv
IHN5bmMgZHNjIGNoYW5nZXMgYWNyb3NzLCBhbmQKPiA+IHByZXZlbnQgY2hhbmdlcyBmcm9tIGJl
aW5nIG9taXR0ZWQgZm9yIFhlbiBvbiBhY2NpZGVudC4KPgo+IFRydWUsIGJ1dCBpbiBteSBleHBl
cmllbmNlIHRoYXQncyBiZWVuIHRoZSBzbWFsbGVyIHByb2JsZW0uIFRoZSBsYXJnZXIKPiBwcm9i
bGVtIGhhcyBiZWVuIG1vZGlmeWluZyBYZW4gc3R1ZmYgaW4gdW5pbnRlbmRlZCB3YXlzICg9IHJl
Z3Jlc3NpbmcKPiBYZW4pLCBiZWNhdXNlIHdlIGNhbid0IHRlc3QgKG9yIGRvbid0IGV2ZW4gbm90
aWNlKSB0aGUgWGVuLXNpZGUKPiBpbXBsaWNhdGlvbnMgb2YgY2hhbmdlcyBtYWRlIHRvIGNvbW1v
biBzb3VyY2UuCj4KPiBQZXJzb25hbGx5IEkgcHJlZmVyIGFub3RoZXIgKERTQyArIEZERikgcGFp
ciB1bmRlciBPdm1mUGtnIChiZXlvbmQgdGhlCj4gdGhyZWUgd2UgYWxyZWFkeSBoYXZlKSB0byBh
bm90aGVyIGxheWVyIG9mIChjb25kaXRpb25hbD8pIGluY2x1ZGVzLiBUaGUKPiAhaWYncyB0aGF0
IGFyZSBiZWluZyBlbGltaW5hdGVkIGluIHRoaXMgWGVuLWN1c3RvbWl6ZWQgY29weSAoaS5lLiwg
aW4KPiB0aGlzIHBhdGNoKSBhcmUgY29tcGxleCBlbm91Z2ggYWxyZWFkeSA6KQo+Cj4gLi4uIEl0
J3Mgbm90IHRoYXQgSSAqZ2VuZXJhbGx5KiBwcmVmZXIgZHVwbGljYXRpb247IGFzIHlvdSBzYXks
IHdlIGRvCj4gaGF2ZSBhIG51bWJlciBvZiAhaW5jbHVkZXMgYWxyZWFkeS4gSSBkbyBwcmVmZXIg
ZHVwbGljYXRpb24gc3BlY2lmaWNhbGx5Cj4gZm9yIFhlbiB2cy4gUUVNVSBob3dldmVyLgo+Cgor
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
