From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v3 1/4] x86/mem_sharing: reorder when pages
 are unlocked and released
Date: Mon, 29 Apr 2019 09:41:13 -0600
Message-ID: <CABfawhnxZA5+FXj5uRb59sJ9RGm71uC0MHv4=J5PGfejXiX2qg@mail.gmail.com>
References: <20190426172138.14669-1-tamas@tklengyel.com>
 <5CC711DC020000780022A111@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NplV=S7=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hL8Pj-0000Xm-EV
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 15:41:55 +0000
Received: by mail-wm1-f47.google.com with SMTP id y197so16511753wmd.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2019 08:41:51 -0700 (PDT)
In-Reply-To: <5CC711DC020000780022A111@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBcHIgMjksIDIwMTkgYXQgOTowMSBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gPj4+IE9uIDI2LjA0LjE5IGF0IDE5OjIxLCA8dGFtYXNAdGtsZW5n
eWVsLmNvbT4gd3JvdGU6Cj4gPiBAQCAtOTk5LDYgKzk5NiwxMCBAQCBzdGF0aWMgaW50IHNoYXJl
X3BhZ2VzKHN0cnVjdCBkb21haW4gKnNkLCBnZm5fdCBzZ2ZuLCBzaHJfaGFuZGxlX3Qgc2gsCj4g
PiAgICAgIG1lbV9zaGFyaW5nX3BhZ2VfdW5sb2NrKHNlY29uZHBnKTsKPiA+ICAgICAgbWVtX3No
YXJpbmdfcGFnZV91bmxvY2soZmlyc3RwZyk7Cj4gPgo+ID4gKyAgICBCVUdfT04oIXB1dF9jb3Vu
dCk7Cj4gPiArICAgIHdoaWxlICggcHV0X2NvdW50LS0gKQo+ID4gKyAgICAgICAgcHV0X3BhZ2Vf
YW5kX3R5cGUoY3BhZ2UpOwo+ID4gKwo+ID4gICAgICAvKiBGcmVlIHRoZSBjbGllbnQgcGFnZSAq
Lwo+ID4gICAgICBpZih0ZXN0X2FuZF9jbGVhcl9iaXQoX1BHQ19hbGxvY2F0ZWQsICZjcGFnZS0+
Y291bnRfaW5mbykpCj4gPiAgICAgICAgICBwdXRfcGFnZShjcGFnZSk7Cj4KPiBJZiB0aGlzIHdh
cyB0byBoYXBwZW4gYmVmb3JlIGFsbCB0aGUgcHV0X3BhZ2VfYW5kX3R5cGUoKSBjYWxscywKPiB3
b3VsZG4ndCBpdCByZW5kZXIgdW5uZWNlc3NhcnkgdGhlIGV4dHJhIGdldF9wYWdlKCkvcHV0X3Bh
Z2UoKQo+IGFyb3VuZCB0aGlzIGNvZGUgcmVnaW9uPwoKSXQgd291bGQgLSBJIGFscmVhZHkgc2Vu
dCBhIHZlcnNpb24gb2YgdGhlIHBhdGNoIGluIHRoYXQgZm9ybSBidXQKdGhlcmUgd2FzIHVuZWFz
ZSBleHByZXNzZWQgYnkgR2VvcmdlIGdvaW5nIHRoYXQgcm91dGUgYmVjYXVzZSBvZiB0aGUKY29t
cGxleGl0eSBvZiB0aGUgY29kZSBhbmQgaW4gaGlzIHZpZXcgaXQncyB0aGUgc2FmZSBiZXQgdG8g
a2VlcCB0aGUKZXh0cmEgcmVmZXJlbmNlcy4gSSB0aGluayB0aGUgb3ZlcmhlYWQgb2YgZ3JhYmJp
bmcgdGhlIGV4dHJhCnJlZmVyZW5jZXMgaXMgbmVnbGlnaWJsZSBlbm91Z2ggdGhhdCBJJ20gbm90
IGdvaW5nIHRvIGFyZ3VlIG92ZXIgaXQuCgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
