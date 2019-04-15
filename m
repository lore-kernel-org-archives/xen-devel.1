From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v2 1/2] x86/mem_sharing: reorder when pages
 are unlocked and released
Date: Mon, 15 Apr 2019 09:31:21 -0600
Message-ID: <CABfawhnkt8i5VYEp2ySes9oBc6=pvrU-vcQ7G0UiuVNpW+g1QQ@mail.gmail.com>
References: <20190412194712.1602-1-tamas@tklengyel.com>
 <3c3ff047-5026-8b4a-c980-822fb730eaea@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t1d2=SR=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hG3b2-0002s1-3s
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 15:32:36 +0000
Received: by mail-wr1-f49.google.com with SMTP id y13so22578797wrd.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2019 08:32:04 -0700 (PDT)
In-Reply-To: <3c3ff047-5026-8b4a-c980-822fb730eaea@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBcHIgMTUsIDIwMTkgYXQgOToyMSBBTSBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVu
bGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gNC8xMi8xOSA4OjQ3IFBNLCBUYW1hcyBLIExl
bmd5ZWwgd3JvdGU6Cj4gPiBQYXRjaCAwNTAyZTBhZGFlMiAieDg2OiBjb3JyZWN0IGluc3RhbmNl
cyBvZiBQR0NfYWxsb2NhdGVkIGNsZWFyaW5nIiBpbnRyb2R1Y2VkCj4gPiBncmFiYmluZyBleHRy
YSByZWZlcmVuY2VzIGZvciBwYWdlcyB0aGF0IGRyb3AgcmVmZXJlbmNlcyB0aWVkIHRvIFBHQ19h
bGxvY2F0ZWQuCj4gPiBIb3dldmVyLCB0aGUgd2F5IHRoZXNlIGV4dHJhIHJlZmVyZW5jZXMgd2Vy
ZSBncmFiYmVkIHdlcmUgaW5jb3JyZWN0LCByZXN1bHRpbmcKPiA+IGluIGJvdGggc2hhcmVfcGFn
ZXMgYW5kIHVuc2hhcmVfcGFnZXMgZmFpbGluZy4KPgo+IFdoeT8gIElzIGNkIG5vdCB0aGUgb3du
ZXIgb2YgdGhlIHBhZ2U/CgpJdCdzIG5vdCwgZG9tX2NvdyBpcy4KCj4gPiBAQCAtMTAwMiw3ICs5
OTQsMTAgQEAgc3RhdGljIGludCBzaGFyZV9wYWdlcyhzdHJ1Y3QgZG9tYWluICpzZCwgZ2ZuX3Qg
c2dmbiwgc2hyX2hhbmRsZV90IHNoLAo+ID4gICAgICAvKiBGcmVlIHRoZSBjbGllbnQgcGFnZSAq
Lwo+ID4gICAgICBpZih0ZXN0X2FuZF9jbGVhcl9iaXQoX1BHQ19hbGxvY2F0ZWQsICZjcGFnZS0+
Y291bnRfaW5mbykpCj4gPiAgICAgICAgICBwdXRfcGFnZShjcGFnZSk7Cj4gPiAtICAgIHB1dF9w
YWdlKGNwYWdlKTsKPiA+ICsKPiA+ICsgICAgQVNTRVJUKHB1dF9jb3VudCk7Cj4gPiArICAgIHdo
aWxlICggcHV0X2NvdW50LS0gKQo+ID4gKyAgICAgICAgcHV0X3BhZ2VfYW5kX3R5cGUoY3BhZ2Up
Owo+Cj4gSSBkb24ndCB0aGluayB0aGlzIGlzIGluIHRoZSBzcGlyaXQgb2YgdGhlIGZpeCBpbiAw
NTAyZTBhZGFlMjsgdGhlIGlkZWEKPiB0aGVyZSBzZWVtcyB0byBoYXZlIGJlZW4gdG8gbWFrZSBz
dXJlIHRoYXQgY3BhZ2UgYmVsb25ncyB0byB0aGUgcmlnaHQKPiBkb21haW4sIGFuZCB0aGF0IHRo
ZSBvd25lcnNoaXAgZG9lc24ndCBjaGFuZ2UuICBJZiBzdWNoIGEgcmFjZSAvIG1pc3Rha2UKPiB3
ZXJlIHBvc3NpYmxlIGJlZm9yZSB0aGF0IGNoYW5nZSwgc3VjaCBhIHJhY2UgLyBtaXN0YWtlIHdv
dWxkIGJlCj4gcG9zc2libGUgYWZ0ZXIgdGhpcyBjaGFuZ2UsIHdvdWxkbid0IGl0PwoKSSBkb24n
dCBoYXZlIGFuIGFuc3dlciB0byB5b3VyIHF1ZXN0aW9uLiBBRkFJVSB0aGlzIGlzIGp1c3QgdG8g
ZW5zdXJlCnRoYXQgdGhlIHBhZ2UgaXNuJ3QgZHJvcHBlZCBiZWZvcmUgdGVzdF9hbmRfY2xlYXJf
Yml0IGlzIHVzZWQgb24gdGhlCnBhZ2UuCgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
