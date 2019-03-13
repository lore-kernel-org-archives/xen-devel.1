From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-next 3/9] xen/x86: Use mfn_to_gfn rather
 than mfn_to_gmfn
Date: Wed, 13 Mar 2019 08:45:56 -0600
Message-ID: <5C8917A4020000780021E2EE@prv1-mh.provo.novell.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-4-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GbKp=RQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h458r-0000yP-4p
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 14:46:01 +0000
In-Reply-To: <20190218113600.9540-4-julien.grall@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjAyLjE5IGF0IDEyOjM1LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IG1mbl90b19nZm4gYW5kIG1mbl90b19nbWZuIGFyZSBkb2luZyBleGFjdGx5IHRoZSBzYW1lIGV4
Y2VwdCB0aGUgZm9ybWVyCj4gaXMgdXNpbmcgbWZuX3QuCj4gCj4gRnVydGhlcm1vcmUsIHRoZSBu
YW1pbmcgb2YgdGhlIGZvcm1lciBpcyBtb3JlIGNvbnNpc3RlbnQgd2l0aCB0aGUKPiBjdXJyZW50
IG5hbWluZyBzY2hlbWUgKEdGTi9NRk4pLiBTbyB1c2UgcmVwbGFjZSBtZm5fdG9fZ21mbiB3aXRo
Cj4gbWZuX3RvX2dmbiBpbiB4ODYgY29kZS4KPiAKPiBObyBmdW5jdGlvbmFsIGNoYW5nZXMuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkZ1
bmRhbWVudGFsbHkgSSdtIGZpbmUgd2l0aCB0aGlzIGNoYW5nZSwgYnV0IGJlZm9yZSBtYWtpbmcg
aXRzIHVzZQptb3JlIHdpZGUtc3ByZWFkLCB3b3VsZG4ndCBpdCBiZSBiZXR0ZXIgdG8gbWFrZSBt
Zm5fdG9fZ2ZuKCkKZnVsbHkgdHlwZS1zYWZlLCBpLmUuIGhhdmUgaXQgYWxzbyByZXR1cm4gZ2Zu
X3Q/IFRoZXJlIGFyZW4ndCB0aGF0Cm1hbnkgdXNlcyBvZiB0aGUgZnVuY3Rpb24ganVzdCB5ZXQs
IGFuZCBkb2luZyB0aGUgY29udmVyc2lvbiBub3cKd291bGQgc2F2ZSB1cyBmcm9tIGhhdmluZyB0
byB0b3VjaCBhbGwgcGxhY2VzIHlvdSBub3cgY2hhbmdlCnlldCBhbm90aGVyIHRpbWUuCgpKYW4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
