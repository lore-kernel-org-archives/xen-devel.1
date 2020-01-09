Return-Path: <SRS0=KXiY=26=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE56C282DD
	for <xen-devel@archiver.kernel.org>; Thu,  9 Jan 2020 20:09:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B642A20656
	for <xen-devel@archiver.kernel.org>; Thu,  9 Jan 2020 20:09:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=kojedz.in header.i=@kojedz.in header.b="XC7K3sAS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B642A20656
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=kojedz.in
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipe7O-0005Af-5P; Thu, 09 Jan 2020 20:09:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Dp4R=26=kojedz.in=richard@srs-us1.protection.inumbo.net>)
 id 1ipe7N-0005Aa-JZ
 for xen-devel@lists.xen.org; Thu, 09 Jan 2020 20:09:21 +0000
X-Inumbo-ID: e9cc99e8-331b-11ea-b89f-bc764e2007e4
Received: from pi.kojedz.in (unknown [2a01:be00:10:201:0:80:0:1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e9cc99e8-331b-11ea-b89f-bc764e2007e4;
 Thu, 09 Jan 2020 20:09:17 +0000 (UTC)
Received: from webmail.srv.kojedz.in (pi.kojedz.in
 [IPv6:2a01:be00:10:201:0:80:0:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: richard@kojedz.in)
 by pi.kojedz.in (Postfix) with ESMTPSA id 16338A16B;
 Thu,  9 Jan 2020 21:09:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kojedz.in; s=mail;
 t=1578600555; bh=0/9/IU4iyl6d2BYp01TEs0gtf5nDPAxIHj6Huup21R8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=XC7K3sASG28D+JMJQUxFuMXwW9695u3Ux+VoEWBrbQDwURSdnLo+ze0He0MVYZSBq
 boHYjKDMpeOIw/vvjsk5s75ZxfIJeOf5fdezFMttw1wovZonSJ6Z0ZmDQKL5Fd7w5K
 nYyex6GqyNxk1AR5HXqkIltlNq7noYsQ5dmSNSqaHFFRRI1CSgEmvemfCxZkWIsm6n
 /swBQtFgNJSx4ZAFCh/VcTfqAcfpPPIdOU7HyQklU8y/j1PCIduVAjZIhqgtGsQOji
 UvhcHVScVRL5pYt44lBnPnL5WBiCWl55ijah8IUcDxRrYgul0hWsVfzxNBVHP8Ex9S
 Wb0s98DzYc6imL8jPhnabXmZmEOT29MsnlWY4T1UFWRwhnDfkp21qpXU0YTqMYKs+f
 7XGzA345AKPag5RgmeqmBY7zziq3p4nj0HfbhHmgwnNeQYtrtKWJPg7N8Scet8jbI2
 pXQKC+wjJT3gfp6XYnN38za1fxqlTTBPGiiEkgs671IhzxXkiNVgDUlfl9OkR3BZ/E
 y/TWbL260peGMXWW13/QitD1JOEwt6HZMHwPbKEktNKuJgCW01fymqlVh+vdp43fUe
 1o70iL7mB8ORcIe9plRbfx//APsAqNdW1is5Q+qfh4xuZV8R+MVNbJBwpJc6ZoWXAy
 KaWsKNe7+NCXHOKxivrRsYjQ=
MIME-Version: 1.0
Date: Thu, 09 Jan 2020 21:09:14 +0100
From: Richard Kojedzinszky <richard@kojedz.in>
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <44c4fb96-6d5a-c10f-9659-06ed48617b91@citrix.com>
References: <58431af1ddf1e33711c9850c715cd9cb@kojedz.in>
 <44c4fb96-6d5a-c10f-9659-06ed48617b91@citrix.com>
Message-ID: <752a8e49b2d47526f5942d3427a4feb4@kojedz.in>
X-Sender: richard@kojedz.in
User-Agent: Roundcube Webmail/1.3.8
Subject: Re: [Xen-devel] [BUG] xenstat_vcpu_ns returns invalid value
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
Cc: xen-devel@lists.xen.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

MjAyMC0wMS0wOSAyMDo1MCBpZMWRcG9udGJhbiBBbmRyZXcgQ29vcGVyIGV6dCDDrXJ0YToKPiBP
biAwOS8wMS8yMDIwIDE5OjQwLCBSaWNoYXJkIEtvamVkemluc3preSB3cm90ZToKPj4gRGVhciBY
ZW4gRGV2cywKPj4gCj4+IGNvbW1pdCAyNTI5Yzg1MGVhNDhmMDM2NzI3Y2EyZjE0OGNhZWQ4OTM5
MTMxMWI4IGludHJvZHVjZXMgdGhlCj4+IFhFTl9SVU5TVEFURV9VUERBVEUgbWFya2VyIGJpdCwg
d2hpY2ggaXMgbm90IGhhbmRsZWQgaW4KPj4gdmNwdV9ydW5zdGF0ZV9nZXQoKSBpbiB4ZW4vY29t
bW9uL3NjaGVkdWxlLmMuIFJlbGV2YW50IGNvZGU6Cj4+IAo+PiDCoMKgwqAgZGVsdGEgPSBOT1co
KSAtIHJ1bnN0YXRlLT5zdGF0ZV9lbnRyeV90aW1lOwo+PiDCoMKgwqAgaWYgKCBkZWx0YSA+IDAg
KQo+PiDCoMKgwqDCoMKgwqDCoCBydW5zdGF0ZS0+dGltZVtydW5zdGF0ZS0+c3RhdGVdICs9IGRl
bHRhOwo+IAo+IFRoYXQgd2FzIGZvdW5kIGFuZCBmaXhlZCBhIHdoaWxlIGFnby7CoCBjL3MgZjI4
YzRjNGMxMCAic2NoZWQ6IGRvbid0IGxldAo+IFhFTl9SVU5TVEFURV9VUERBVEUgbGVhayBpbnRv
IHZjcHVfcnVuc3RhdGVfZ2V0KCkiLgo+IAo+IE5vIGNoYW5nZXMgaW4gdXNlcnNwYWNlIHNob3Vs
ZCBiZSBuZWNlc3NhcnksIGFsdGhvdWdoIHlvdSBtaWdodCBuZWVkIHRvCj4gcGVzdGVyIHlvdXIg
ZGlzdHJvIGZvciBiYWNrcG9ydHMuCj4gCj4gfkFuZHJldwoKSGksCgpUaGFua3MgZm9yIHRoZSBx
dWljayByZXBseSwKClRoZW4sIGFzIGl0IGlzIGp1c3QgYSBsZWFrLCB1bnRpbCBhIGJhY2twb3J0
IGFycml2ZXMgdG8gbXkgZGlzdHJvLCBJIGNhbiAKbWFzayBvdXQgdGhhdCBiaXQgZnJvbSB0aGUg
cmVzdWx0cyB3aXRoIG5vIG90aGVyIHNpZGUtZWZmZWN0cywgYW0gSSAKcmlnaHQ/CgpSZWdhcmRz
LApSaWNoYXJkIEtvamVkemluc3preQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
