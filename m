Return-Path: <SRS0=X6vN=4Q=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA99C3F2D2
	for <xen-devel@archiver.kernel.org>; Fri, 28 Feb 2020 11:15:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28583246A3
	for <xen-devel@archiver.kernel.org>; Fri, 28 Feb 2020 11:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28583246A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7dbw-0001pm-NA; Fri, 28 Feb 2020 11:15:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7dbu-0001ph-QW
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 11:15:14 +0000
X-Inumbo-ID: 9735554a-5a1b-11ea-83b0-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9735554a-5a1b-11ea-83b0-bc764e2007e4;
 Fri, 28 Feb 2020 11:15:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 89FB2AC37;
 Fri, 28 Feb 2020 11:15:12 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200228093334.36586-1-roger.pau@citrix.com>
 <20200228093334.36586-3-roger.pau@citrix.com>
 <12c75d73-cc89-9b8c-011a-b6e11f6cf58d@suse.com>
 <20200228103131.GU24458@Air-de-Roger.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <694efd6e-91cc-6a31-dded-0af339af4bef@suse.com>
Date: Fri, 28 Feb 2020 12:15:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200228103131.GU24458@Air-de-Roger.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 2/2] x86: add accessors for scratch cpu
 mask
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDIuMjAyMCAxMTozMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBGcmksIEZl
YiAyOCwgMjAyMCBhdCAxMToxNjo1NUFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MjguMDIuMjAyMCAxMDozMywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4gKyAgICAvKgo+Pj4g
KyAgICAgKiBEdWUgdG8gcmVlbnRyYW5jeSBzY3JhdGNoIGNwdW1hc2sgY2Fubm90IGJlIHVzZWQg
aW4gSVJRLCAjTUMgb3IgI05NSQo+Pj4gKyAgICAgKiBjb250ZXh0Lgo+Pj4gKyAgICAgKi8KPj4+
ICsgICAgQlVHX09OKGluX2lycSgpIHx8IGluX21jZV9oYW5kbGVyKCkgfHwgaW5fbm1pX2hhbmRs
ZXIoKSk7Cj4+PiArCj4+PiArICAgIGlmICggdXNlICYmIHVubGlrZWx5KHRoaXNfY3B1KHNjcmF0
Y2hfY3B1bWFza191c2UpKSApCj4+PiArICAgIHsKPj4+ICsgICAgICAgIHByaW50aygic2NyYXRj
aCBDUFUgbWFzayBhbHJlYWR5IGluIHVzZSBieSAlcHMgKCVwKVxuIiwKPj4+ICsgICAgICAgICAg
ICAgICB0aGlzX2NwdShzY3JhdGNoX2NwdW1hc2tfdXNlKSwgdGhpc19jcHUoc2NyYXRjaF9jcHVt
YXNrX3VzZSkpOwo+Pgo+PiBXaHkgdGhlIHJhdyAlcCBhcyB3ZWxsPyBXZSBkb24ndCBkbyBzbyBl
bHNld2hlcmUsIEkgdGhpbmsuIFllcywKPj4gaXQncyBkZWJ1Z2dpbmcgY29kZSBvbmx5LCBidXQg
SSB3b25kZXIgYW55d2F5Lgo+IAo+IEkgdXNlIGFkZHIybGluZSB0byBmaW5kIHRoZSBvZmZlbmRp
bmcgbGluZSwgYW5kIGl0J3MgbXVjaCBlYXNpZXIgdG8gZG8KPiBzbyBpZiB5b3UgaGF2ZSB0aGUg
YWRkcmVzcyBkaXJlY3RseSwgcmF0aGVyIHRoYW4gaGF2aW5nIHRvIHVzZSBubSBpbgo+IG9yZGVy
IHRvIGZpZ3VyZSBvdXQgdGhlIGFkZHJlc3Mgb2YgdGhlIHN5bWJvbCBhbmQgdGhlbiBhZGQgdGhl
IG9mZnNldC4KPiAKPiBNYXliZSBJJ20gbWlzc2luZyBzb21lIG90aGVyIHdheSB0byBkbyB0aGlz
IG1vcmUgZWFzaWx5PwoKSW4gc3VjaCBhIGNhc2Ugd2UgbWF5IHdhbnQgdG8gY29uc2lkZXIgbWFr
aW5nICVwcyAoYW5kICVwUykKcHJpbnQgYSBoZXggcHJlc2VudGF0aW9uIG5leHQgdG8gdGhlIGRl
Y29kZWQgb25lLCBpbiBkZWJ1ZwpidWlsZHMgYXQgbGVhc3QuIEFuZHJldywgdGhvdWdodHM/IChU
aGVyZSBtYXkgYmUgY2FzZXMgd2hlcmUKdGhpcyBpcyBub3Qgd2FudGVkLCBiaXQgaWYgd2UgbWFk
ZSB0aGlzIGEgZGVidWcgbW9kZSBvbmx5CmZlYXR1cmUsIEkgdGhpbmsgaXQgd291bGRuJ3QgZG8g
dG9vIG11Y2ggaGFybS4pCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
