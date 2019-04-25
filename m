Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C244C43219
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 14:50:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86E072088F
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 14:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86E072088F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJfhT-0005jJ-4x; Thu, 25 Apr 2019 14:50:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tBju=S3=citrix.com=prvs=011b478a6=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1hJfhR-0005jD-Sz
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 14:50:09 +0000
X-Inumbo-ID: 6b14b796-6769-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6b14b796-6769-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 14:50:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,394,1549929600"; d="scan'208";a="84403707"
To: Jan Beulich <JBeulich@suse.com>
References: <1556019478-10835-1-git-send-email-igor.druzhinin@citrix.com>
 <5CC1B6930200007800229160@prv1-mh.provo.novell.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <3def1b27-f676-0fdf-1895-f44066466af9@citrix.com>
Date: Thu, 25 Apr 2019 15:50:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CC1B6930200007800229160@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/mtrr: recalculate P2M type for domains
 with iocaps
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425145004.e_aUhZGy3twu0zXqIGOndBj-bKpJN9o_QL_CiIbWGdo@z>

T24gMjUvMDQvMjAxOSAxNDozMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjMuMDQuMTkg
YXQgMTM6MzcsIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPiB3cm90ZToKPj4gVGhpcyBjaGFu
Z2UgcmVmbGVjdHMgdGhlIGxvZ2ljIGluIGVwdGVfZ2V0X2VudHJ5X2VtdCgpIGFuZCBhbGxvd3MK
Pj4gY2hhbmdlcyBpbiBndWVzdCBNVFRScyB0byBiZSByZWZsZWN0ZWQgaW4gRVBUIGZvciBkb21h
aW5zIGhhdmluZwo+PiBkaXJlY3QgYWNjZXNzIHRvIGNlcnRhaW4gaGFyZHdhcmUgbWVtb3J5IHJl
Z2lvbnMgYnV0IHdpdGhvdXQgSU9NTVUKPj4gY29udGV4dCBhc3NpZ25lZCAoZS5nLiBYZW5HVCku
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRy
aXguY29tPgo+IAo+IEZ1bmRhbWVudGFsbHkgSSdtIGhhcHB5IHRvIGdldCBib3RoIGluIHN5bmMs
IHNvCj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBC
dXQgSSBoYXZlIGEgcXVlc3Rpb246Cj4gCj4+ICB2b2lkIG1lbW9yeV90eXBlX2NoYW5nZWQoc3Ry
dWN0IGRvbWFpbiAqZCkKPj4gIHsKPj4gLSAgICBpZiAoIGhhc19pb21tdV9wdChkKSAmJiBkLT52
Y3B1ICYmIGQtPnZjcHVbMF0gKQo+PiArICAgIGlmICggKGhhc19pb21tdV9wdChkKSB8fCBjYWNo
ZV9mbHVzaF9wZXJtaXR0ZWQoZCkpICYmIGQtPnZjcHUgJiYgZC0+dmNwdVswXSApCj4+ICAgICAg
ewo+PiAgICAgICAgICBwMm1fbWVtb3J5X3R5cGVfY2hhbmdlZChkKTsKPj4gICAgICAgICAgZmx1
c2hfYWxsKEZMVVNIX0NBQ0hFKTsKPiAKPiBXb3VsZG4ndCBjYWNoZV9mbHVzaF9wZXJtaXR0ZWQo
KSBhbG9uZSBzdWZmaWNlLCBib3RoIGhlcmUgYW5kCj4gdGhlcmU/IEV2ZW4gaWYgYW55b25lIHdh
cyB0byBwYXNzLXRocm91Z2ggYSBkZXZpY2Ugd2l0aG91dCBhbnkKPiBNTUlPIG9yIEkvTyBwb3J0
IEJBUiwgdGhlIG1lbW9yeSB0eXBlICh3aGljaCBpcyBhIENQVSBzaWRlCj4gdGhpbmcgb25seSwg
aS5lLiBkb2Vzbid0IGFmZmVjdCBETUEgYnkgdGhlIGRldmljZSkgc2hvdWxkbid0Cj4gbWF0dGVy
IGluIHRoYXQgY2FzZSAobGVhdmluZyBhc2lkZSB0aGUgZmFjdCB0aGF0IGEgQkFSLWxlc3MKPiBk
ZXZpY2UgaXMgdW5saWtlbHkgdG8gYmUgRE1BLWNhcGFibGUsIHVubGVzcyB0aGUgcHJvZ3JhbW1p
bmcKPiBvZiB0aGUgRE1BIG9wZXJhdGlvbnMgd2FzIHRvIGhhcHBlbiB0aHJvdWdoIHZlbmRvciBz
cGVjaWZpYwo+IGNvbmZpZyBzcGFjZSBhY2Nlc3NlcykuCj4gCgpJIGRvbid0IHRoaW5rIGl0J3Mg
Y29ycmVjdCBpbiBjYXNlIG9mIEVQVCBzaGFyaW5nIHdpdGggSU9NTVUgYXMgdGhlCnNlY3Rpb24g
My42LjUgb2YgVlQtZCBzcGVjIGltcGxpZXMgdGhlcmUgaXMgZGlyZWN0IGVmZmVjdCBvZiBjYWNo
aW5nCmluZm9ybWF0aW9uIHByZXNlbnQgaW4gSU9NTVUgcGFnZSB0YWJsZSBvbiBkZXZpY2UgYWNj
ZXNzZXMgd2l0aGluCnByb2Nlc3NvciBjb2hlcmVuY3kgZG9tYWluLiBTbyBldmVuIGluIGNhc2Ug
dGhlcmUgYXJlIG5vIEJBUnMgcGFzc2VkIHRvCnRoZSBkb21haW4sIGRyaXZlcnMgaW5zaWRlIGl0
IGFuZCBkZXZpY2VzIG9wZXJhdGlvbiBvbiBpdHMgbWVtb3J5IGNvdWxkCnN0aWxsIGhhdmUgYXNz
dW1wdGlvbnMgb24gZGV2aWNlIG1lbW9yeSBhY2Nlc3MgcHJvcGVydGllcy4KCklnb3IKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
