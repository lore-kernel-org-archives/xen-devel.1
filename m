Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB62C10F13
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 21:07:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E273320821
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 21:07:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="qL6xvSyS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E273320821
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGVIn-0002ot-HR; Tue, 16 Apr 2019 21:07:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VklA=SS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hGVIm-0002oo-LZ
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 21:07:36 +0000
X-Inumbo-ID: a7fd23d1-608b-11e9-92d7-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a7fd23d1-608b-11e9-92d7-bc764e045a96;
 Tue, 16 Apr 2019 21:07:35 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3556B20868;
 Tue, 16 Apr 2019 21:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555448854;
 bh=Q/1KmPjuRf5VBabLBrRTbwZLiwtccMy355zZJLqH9DQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=qL6xvSySfjdzzDgi4a0lxyfDahTlK27amPYKwOyk5KnMpUIJORHgZhJHblv8+2p+Y
 kIjyZvQA2pHSwytPBvtqoLNnc5QHw8uF5HIHv0NAcog7QnGvh62QxPUxo7YgYCr40e
 +binFpGpdD256M+pVwxkPNA731/9xw6HgcVZTZEs=
Date: Tue, 16 Apr 2019 14:07:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190319232753.26521-1-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.10.1904161406550.1370@sstabellini-ThinkPad-X260>
References: <20190319232753.26521-1-julien.grall@arm.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/arm64: head: Combine lsl and str
 instructions in a single one
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190416210733.C8fbE9UKflAXZT7bitqbK1Wo_uaMNrnj1pMeo8N9Nxs@z>

T24gVHVlLCAxOSBNYXIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEZyb206IEp1bGllbiBH
cmFsbCA8anVsaWVuLmdyYWxsQGxpbmFyby5vcmc+Cj4gCj4gV2UgY2FuIG9wdGltaXplIGEgYml0
IHRoZSBhc3NlbWJseSBjb2RlIGJ5IGNvbWJpbmluZyB0aGUgMiBpbnN0cnVjdGlvbnMKPiBpbiBh
IHNpbmdsZSBvbmUuIFRoaXMgbGlrZWx5IG5vdCBnb2luZyB0byBtYWtlIHRoZSBjb2RlIGZhc3Rl
ciwgYnV0Cj4gbGlrZWx5IG1ha2UgZWFzaWVyIHRvIHJlYWQgdGhlIGFzc2VtYmx5Lgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGxpbmFyby5vcmc+CgpSZXZp
ZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKCj4g
LS0tCj4gIHhlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgfCAxMiArKysrLS0tLS0tLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFk
LlMKPiBpbmRleCAwYjdmNmU3ZjkyLi40NTg5YTM3ODc0IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNo
L2FybS9hcm02NC9oZWFkLlMKPiArKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4gQEAg
LTQxOCw4ICs0MTgsNyBAQCBza2lwX2JzczoKPiAgCj4gICAgICAgICAgbW92ICAgeDMsICNQVF9Q
VCAgICAgICAgICAgICAvKiB4MiA6PSB0YWJsZSBtYXAgb2YgYm9vdF9maXJzdF9pZCAqLwo+ICAg
ICAgICAgIG9yciAgIHgyLCB4MiwgeDMgICAgICAgICAgICAgLyogICAgICAgKyByaWdodHMgZm9y
IGxpbmVhciBQVCAqLwo+IC0gICAgICAgIGxzbCAgIHgxLCB4MSwgIzMgICAgICAgICAgICAgLyog
eDEgOj0gU2xvdCBvZmZzZXQgKi8KPiAtICAgICAgICBzdHIgICB4MiwgW3g0LCB4MV0KPiArICAg
ICAgICBzdHIgICB4MiwgW3g0LCB4MSwgbHNsICMzXQo+ICAKPiAgICAgICAgICBsb2FkX3BhZGRy
IHg0LCBib290X2ZpcnN0X2lkCj4gIAo+IEBAIC00MjgsOCArNDI3LDcgQEAgc2tpcF9ic3M6Cj4g
ICAgICAgICAgbW92ICAgeDMsICNQVF9NRU0gICAgICAgICAgICAvKiB4MiA6PSBTZWN0aW9uIG1h
cCAqLwo+ICAgICAgICAgIG9yciAgIHgyLCB4MiwgeDMKPiAgICAgICAgICBhbmQgICB4MSwgeDEs
ICNMUEFFX0VOVFJZX01BU0sgLyogeDEgOj0gU2xvdCBvZmZzZXQgKi8KPiAtICAgICAgICBsc2wg
ICB4MSwgeDEsICMzCj4gLSAgICAgICAgc3RyICAgeDIsIFt4NCwgeDFdICAgICAgICAgICAvKiBN
YXBwaW5nIG9mIHBhZGRyKHN0YXJ0KSAqLwo+ICsgICAgICAgIHN0ciAgIHgyLCBbeDQsIHgxLCBs
c2wgIzNdICAgLyogTWFwcGluZyBvZiBwYWRkcihzdGFydCkgKi8KPiAgICAgICAgICBtb3YgICB4
MjUsICMxICAgICAgICAgICAgICAgIC8qIHgyNSA6PSBpZGVudGl0eSBtYXAgbm93IGluIHBsYWNl
ICovCj4gIAo+ICAxOiAgICAgIC8qIFNldHVwIGJvb3RfZmlyc3Q6ICovCj4gQEAgLTQ1MCw4ICs0
NDgsNyBAQCBza2lwX2JzczoKPiAgICAgICAgICBsc2wgICB4MiwgeDIsICNGSVJTVF9TSElGVCAg
IC8qIEJhc2UgYWRkcmVzcyBmb3IgMUdCIG1hcHBpbmcgKi8KPiAgICAgICAgICBtb3YgICB4Mywg
I1BUX01FTSAgICAgICAgICAgIC8qIHgyIDo9IFNlY3Rpb24gbWFwICovCj4gICAgICAgICAgb3Jy
ICAgeDIsIHgyLCB4Mwo+IC0gICAgICAgIGxzbCAgIHgxLCB4MSwgIzMgICAgICAgICAgICAgLyog
eDEgOj0gU2xvdCBvZmZzZXQgKi8KPiAtICAgICAgICBzdHIgICB4MiwgW3g0LCB4MV0gICAgICAg
ICAgIC8qIENyZWF0ZSBtYXBwaW5nIG9mIHBhZGRyKHN0YXJ0KSovCj4gKyAgICAgICAgc3RyICAg
eDIsIFt4NCwgeDEsIGxzbCAjM10gICAvKiBDcmVhdGUgbWFwcGluZyBvZiBwYWRkcihzdGFydCkq
Lwo+ICAgICAgICAgIG1vdiAgIHgyNSwgIzEgICAgICAgICAgICAgICAgLyogeDI1IDo9IGlkZW50
aXR5IG1hcCBub3cgaW4gcGxhY2UgKi8KPiAgCj4gIDE6ICAgICAgLyogU2V0dXAgYm9vdF9zZWNv
bmQ6ICovCj4gQEAgLTQ3Myw4ICs0NzAsNyBAQCBza2lwX2JzczoKPiAgICAgICAgICBsc2wgICB4
MiwgeDIsICNTRUNPTkRfU0hJRlQgIC8qIEJhc2UgYWRkcmVzcyBmb3IgMk1CIG1hcHBpbmcgKi8K
PiAgICAgICAgICBtb3YgICB4MywgI1BUX01FTSAgICAgICAgICAgIC8qIHgyIDo9IFNlY3Rpb24g
bWFwICovCj4gICAgICAgICAgb3JyICAgeDIsIHgyLCB4Mwo+IC0gICAgICAgIGxzbCAgIHgxLCB4
MSwgIzMgICAgICAgICAgICAgLyogeDEgOj0gU2xvdCBvZmZzZXQgKi8KPiAtICAgICAgICBzdHIg
ICB4MiwgW3g0LCB4MV0gICAgICAgICAgIC8qIENyZWF0ZSBtYXBwaW5nIG9mIHBhZGRyKHN0YXJ0
KSovCj4gKyAgICAgICAgc3RyICAgeDIsIFt4NCwgeDEsIGxzbCAjM10gICAvKiBDcmVhdGUgbWFw
cGluZyBvZiBwYWRkcihzdGFydCkqLwo+ICAgICAgICAgIG1vdiAgIHgyNSwgIzEgICAgICAgICAg
ICAgICAgLyogeDI1IDo9IGlkZW50aXR5IG1hcCBub3cgaW4gcGxhY2UgKi8KPiAgCj4gIDE6ICAg
ICAgLyogU2V0dXAgYm9vdF90aGlyZDogKi8KPiAtLSAKPiAyLjExLjAKPiAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
