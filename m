Return-Path: <SRS0=q1ly=3F=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99BFAC33CB3
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jan 2020 16:02:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 734F9207FF
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jan 2020 16:02:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 734F9207FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is7aq-00088C-4b; Thu, 16 Jan 2020 16:02:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1is7ao-000881-Oi
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 16:01:58 +0000
X-Inumbo-ID: 828a9062-3879-11ea-876f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 828a9062-3879-11ea-876f-12813bfff9fa;
 Thu, 16 Jan 2020 16:01:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A055CB25F0;
 Thu, 16 Jan 2020 16:01:52 +0000 (UTC)
To: Tamas K Lengyel <tamas.lengyel@intel.com>
References: <cover.1578503483.git.tamas.lengyel@intel.com>
 <c3756e62bdfc25d69e72c055875f48f674de04bc.1578503483.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f1a55c64-781d-d457-ba9b-152b65824d71@suse.com>
Date: Thu, 16 Jan 2020 17:01:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <c3756e62bdfc25d69e72c055875f48f674de04bc.1578503483.git.tamas.lengyel@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 10/18] x86/mem_sharing: Replace
 MEM_SHARING_DEBUG with gdprintk
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDEuMjAyMCAxODoxNCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IEBAIC00OTQsMTkg
KzQ5MSwxOSBAQCBzdGF0aWMgaW50IGF1ZGl0KHZvaWQpCj4gICAgICAgICAgLyogSWYgd2UgY2Fu
J3QgbG9jayBpdCwgaXQncyBkZWZpbml0ZWx5IG5vdCBhIHNoYXJlZCBwYWdlICovCj4gICAgICAg
ICAgaWYgKCAhbWVtX3NoYXJpbmdfcGFnZV9sb2NrKHBnKSApCj4gICAgICAgICAgewo+IC0gICAg
ICAgICAgICBNRU1fU0hBUklOR19ERUJVRygKPiAtICAgICAgICAgICAgICAgICJtZm4gJWx4IGlu
IGF1ZGl0IGxpc3QsIGJ1dCBjYW5ub3QgYmUgbG9ja2VkICglbHgpIVxuIiwKPiAtICAgICAgICAg
ICAgICAgIG1mbl94KG1mbiksIHBnLT51LmludXNlLnR5cGVfaW5mbyk7Cj4gLSAgICAgICAgICAg
IGVycm9ycysrOwo+IC0gICAgICAgICAgICBjb250aW51ZTsKPiArICAgICAgICAgICAgZ2Rwcmlu
dGsoWEVOTE9HX0VSUiwKPiArICAgICAgICAgICAgICAgICAgICAgIm1mbiAlbHggaW4gYXVkaXQg
bGlzdCwgYnV0IGNhbm5vdCBiZSBsb2NrZWQgKCVseCkhXG4iLAo+ICsgICAgICAgICAgICAgICAg
ICAgICBtZm5feChtZm4pLCBwZy0+dS5pbnVzZS50eXBlX2luZm8pOwo+ICsgICAgICAgICAgIGVy
cm9ycysrOwo+ICsgICAgICAgICAgIGNvbnRpbnVlOwoKVGhlcmUgbG9va3MgdG8gYmUgb25lIHNw
YWNlIHRvbyBsaXR0bGUgb24gdGhlc2UgbGFzdCB0d28gbGluZXMgYW5kIC4uLgoKPiBAQCAtNTE0
LDI0ICs1MTEsMjQgQEAgc3RhdGljIGludCBhdWRpdCh2b2lkKQo+ICAgICAgICAgIC8qIENoZWNr
IHRoZSBwYWdlIG93bmVyLiAqLwo+ICAgICAgICAgIGlmICggcGFnZV9nZXRfb3duZXIocGcpICE9
IGRvbV9jb3cgKQo+ICAgICAgICAgIHsKPiAtICAgICAgICAgICAgTUVNX1NIQVJJTkdfREVCVUco
Im1mbiAlbHggc2hhcmVkLCBidXQgd3Jvbmcgb3duZXIgJXBkIVxuIiwKPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgbWZuX3gobWZuKSwgcGFnZV9nZXRfb3duZXIocGcpKTsKPiAtICAg
ICAgICAgICAgZXJyb3JzKys7Cj4gKyAgICAgICAgICAgICAgIGdkcHJpbnRrKFhFTkxPR19FUlIs
ICJtZm4gJWx4IHNoYXJlZCwgYnV0IHdyb25nIG93bmVyICglaHUpIVxuIiwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgbWZuX3gobWZuKSwgcGFnZV9nZXRfb3duZXIocGcpLT5kb21haW5faWQp
Owo+ICsgICAgICAgICAgICAgICBlcnJvcnMrKzsKCi4uLiBhIGZldyB0b28gbWFueSBoZXJlIGFu
ZCAuLi4KCj4gICAgICAgICAgfQo+ICAKPiAgICAgICAgICAvKiBDaGVjayB0aGUgbTJwIGVudHJ5
ICovCj4gICAgICAgICAgaWYgKCAhU0hBUkVEX00yUChnZXRfZ3Bmbl9mcm9tX21mbihtZm5feCht
Zm4pKSkgKQo+ICAgICAgICAgIHsKPiAtICAgICAgICAgICAgTUVNX1NIQVJJTkdfREVCVUcoIm1m
biAlbHggc2hhcmVkLCBidXQgd3JvbmcgbTJwIGVudHJ5ICglbHgpIVxuIiwKPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgbWZuX3gobWZuKSwgZ2V0X2dwZm5fZnJvbV9tZm4obWZuX3go
bWZuKSkpOwo+IC0gICAgICAgICAgICBlcnJvcnMrKzsKPiArICAgICAgICAgICAgICAgZ2Rwcmlu
dGsoWEVOTE9HX0VSUiwgIm1mbiAlbHggc2hhcmVkLCBidXQgd3JvbmcgbTJwIGVudHJ5ICglbHgp
IVxuIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgbWZuX3gobWZuKSwgZ2V0X2dwZm5fZnJv
bV9tZm4obWZuX3gobWZuKSkpOwo+ICsgICAgICAgICAgICAgICBlcnJvcnMrKzsKCi4uLiBoZXJl
LgoKQWxzbyBwbGVhc2Ugc3dpdGNoIHRvIHRoZSAlcGQgZm9ybWF0IGZvciBkb21haW4gSURzIHlv
dSBsb2cKYW55d2hlcmUgaGVyZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
