From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/HVM: correct an inverted check in
 hvm_load()
Date: Thu, 02 Aug 2018 00:02:59 -0600
Message-ID: <5B629E9302000078001DA1B2@prv1-mh.provo.novell.com>
References: <5B61D38002000078001DA043@prv1-mh.provo.novell.com>
 <0576d10c-4590-c925-4a03-ab455b0ad1f3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=zvpq=kr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fl6hS-0000wy-Rm
 for xen-devel@lists.xenproject.org; Thu, 02 Aug 2018 06:03:02 +0000
In-Reply-To: <0576d10c-4590-c925-4a03-ab455b0ad1f3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjA4LjE4IGF0IDE4OjA4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDEvMDgvMTggMTY6MzYsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBDbGVhcmx5IHdl
IHdhbnQgdG8gcHV0IGEgdkNQVSB0byBzbGVlcCBpZiBpdCBpcyBfbm90XyBhbHJlYWR5IGRvd24u
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4g
LS0tCj4+IFRCRDogU2luY2UgdGhlIGZsYXcgYXBwYXJlbnRseSBuZXZlciBtYXR0ZXJlZCwgSSBp
bXBseSB0aGF0IHRoZSBmdW5jdGlvbgo+PiAgICAgIGlzIG5ldmVyIGNhbGxlZCB3aXRoIGFueSB2
Q1BVIHVwLiBIZW5jZSBhbiBhbHRlcm5hdGl2ZSBtaWdodCBiZSB0bwo+PiAgICAgIHNpbXBseSBy
ZXR1cm4gYW4gZXJyb3IgaWYgYSB2Q1BVIGRvZXNuJ3QgaGF2ZSBWUEZfZG93biBzZXQuCj4gCj4g
V2l0aCBSZW11cy9DT0xPLCB3ZSBzaG91bGQgaGl0IHRoaXMgcGF0aCB3aXRoIGFuIHVwIHZDUFUg
b24gZXZlcnkKPiBpdGVyYXRpb24gYWZ0ZXIgdGhlIGZpcnN0LiAgR2l2ZW4gdGhpcyBidWcsIEkn
bSBzdHJ1Z2dsaW5nIHRvIHNlZSBob3cgaXQKPiB3b3JrcyBhdCBhbGwuCgpXZWxsLCB0aGF0IHdv
dWxkIHJ1bGUgb3V0IHRoZSBhbHRlcm5hdGl2ZSBzdWdnZXN0aW9uLCBidXQgc2luY2UKdGhpcyBp
cyBuZWl0aGVyIGFuIGFjayBub3IgYSBuYWsgLSB3aGF0IGRvIHlvdSBzdWdnZXN0IHdlIGRvPwoK
SmFuCgo+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3NhdmUuYwo+PiArKysgYi94ZW4vYXJjaC94
ODYvaHZtL3NhdmUuYwo+PiBAQCAtMjY4LDcgKzI2OCw3IEBAIGludCBodm1fbG9hZChzdHJ1Y3Qg
ZG9tYWluICpkLCBodm1fZG9tYWkKPj4gIAo+PiAgICAgIC8qIERvd24gYWxsIHRoZSB2Y3B1czog
d2Ugb25seSByZS1lbmFibGUgdGhlIG9uZXMgdGhhdCBoYWQgc3RhdGUgc2F2ZWQuICovCj4+ICAg
ICAgZm9yX2VhY2hfdmNwdShkLCB2KQo+PiAtICAgICAgICBpZiAoIHRlc3RfYW5kX3NldF9iaXQo
X1ZQRl9kb3duLCAmdi0+cGF1c2VfZmxhZ3MpICkKPj4gKyAgICAgICAgaWYgKCAhdGVzdF9hbmRf
c2V0X2JpdChfVlBGX2Rvd24sICZ2LT5wYXVzZV9mbGFncykgKQo+PiAgICAgICAgICAgICAgdmNw
dV9zbGVlcF9ub3N5bmModik7Cj4+ICAKPj4gICAgICBmb3IgKCA7IDsgKQo+Pgo+PgoKCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
