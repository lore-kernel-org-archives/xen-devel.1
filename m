From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/HVM: correct an inverted check in
 hvm_load()
Date: Wed, 1 Aug 2018 17:08:28 +0100
Message-ID: <0576d10c-4590-c925-4a03-ab455b0ad1f3@citrix.com>
References: <5B61D38002000078001DA043@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bzmx=kq=citrix.com=prvs=744b97e16=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fktgW-0001Qd-Ns
 for xen-devel@lists.xenproject.org; Wed, 01 Aug 2018 16:09:12 +0000
In-Reply-To: <5B61D38002000078001DA043@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDgvMTggMTY6MzYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IENsZWFybHkgd2Ugd2FudCB0
byBwdXQgYSB2Q1BVIHRvIHNsZWVwIGlmIGl0IGlzIF9ub3RfIGFscmVhZHkgZG93bi4KPgo+IFNp
Z25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAtLS0KPiBUQkQ6
IFNpbmNlIHRoZSBmbGF3IGFwcGFyZW50bHkgbmV2ZXIgbWF0dGVyZWQsIEkgaW1wbHkgdGhhdCB0
aGUgZnVuY3Rpb24KPiAgICAgIGlzIG5ldmVyIGNhbGxlZCB3aXRoIGFueSB2Q1BVIHVwLiBIZW5j
ZSBhbiBhbHRlcm5hdGl2ZSBtaWdodCBiZSB0bwo+ICAgICAgc2ltcGx5IHJldHVybiBhbiBlcnJv
ciBpZiBhIHZDUFUgZG9lc24ndCBoYXZlIFZQRl9kb3duIHNldC4KCldpdGggUmVtdXMvQ09MTywg
d2Ugc2hvdWxkIGhpdCB0aGlzIHBhdGggd2l0aCBhbiB1cCB2Q1BVIG9uIGV2ZXJ5Cml0ZXJhdGlv
biBhZnRlciB0aGUgZmlyc3QuwqAgR2l2ZW4gdGhpcyBidWcsIEknbSBzdHJ1Z2dsaW5nIHRvIHNl
ZSBob3cgaXQKd29ya3MgYXQgYWxsLgoKfkFuZHJldwoKPgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9o
dm0vc2F2ZS5jCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9zYXZlLmMKPiBAQCAtMjY4LDcgKzI2
OCw3IEBAIGludCBodm1fbG9hZChzdHJ1Y3QgZG9tYWluICpkLCBodm1fZG9tYWkKPiAgCj4gICAg
ICAvKiBEb3duIGFsbCB0aGUgdmNwdXM6IHdlIG9ubHkgcmUtZW5hYmxlIHRoZSBvbmVzIHRoYXQg
aGFkIHN0YXRlIHNhdmVkLiAqLwo+ICAgICAgZm9yX2VhY2hfdmNwdShkLCB2KQo+IC0gICAgICAg
IGlmICggdGVzdF9hbmRfc2V0X2JpdChfVlBGX2Rvd24sICZ2LT5wYXVzZV9mbGFncykgKQo+ICsg
ICAgICAgIGlmICggIXRlc3RfYW5kX3NldF9iaXQoX1ZQRl9kb3duLCAmdi0+cGF1c2VfZmxhZ3Mp
ICkKPiAgICAgICAgICAgICAgdmNwdV9zbGVlcF9ub3N5bmModik7Cj4gIAo+ICAgICAgZm9yICgg
OyA7ICkKPgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
