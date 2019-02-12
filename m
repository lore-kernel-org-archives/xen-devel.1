From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12 V3] x86/altp2m: fix
 HVMOP_altp2m_set_domain_state race
Date: Tue, 12 Feb 2019 04:05:59 -0700
Message-ID: <5C62A8970200007800215D70@prv1-mh.provo.novell.com>
References: <1549876422-22274-1-git-send-email-rcojocaru@bitdefender.com>
 <5C614A1B02000078002158A5@prv1-mh.provo.novell.com>
 <b0b1da0b-f888-912b-48ed-8322b9091779@bitdefender.com>
 <2806b8c2-ae3c-6f45-9c5c-dead9235ca83@bitdefender.com>
 <5C61A9DF0200007800215ABD@prv1-mh.provo.novell.com>
 <9943d2b7-5aae-1e1b-0593-5028416c3681@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gtVt9-00054i-Kl
 for xen-devel@lists.xenproject.org; Tue, 12 Feb 2019 11:06:07 +0000
In-Reply-To: <9943d2b7-5aae-1e1b-0593-5028416c3681@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjAyLjE5IGF0IDExOjExLCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gT24gMi8xMS8xOSA2OjU5IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gUGx1cyBJIGNh
bid0IHNlZSBwMm1fc3dpdGNoX3ZjcHVfYWx0cDJtX2J5X2lkKCkgY2FsbGVkIGZvcgo+PiBhbnkg
SFZNT1BfYWx0cDJtXyogYXQgYWxsLiBPbmUgb2YgdGhlIGFjdHVhbCBjYWxsZXJzIGlzIGd1YXJk
ZWQKPj4gYnkgYWx0cDJtX2FjdGl2ZSgpLCBidXQgdGhlIG90aGVyIGlzbid0Lgo+IAo+IEFjdHVh
bGx5IEkgc2VlIHRoYXQgYm90aCBwbGFjZXMgYXJlIGd1YXJkZWQgYnkgYWx0cDJtX2FjdGl2ZSgp
Lgo+IAo+IEluIHAybS5jIHdlIGhhdmU6Cj4gCj4gMjMxMiB2b2lkIHAybV9hbHRwMm1fY2hlY2so
c3RydWN0IHZjcHUgKnYsIHVpbnQxNl90IGlkeCkKPiAyMzEzIHsKPiAyMzE0ICAgICBpZiAoIGFs
dHAybV9hY3RpdmUodi0+ZG9tYWluKSApCj4gMjMxNSAgICAgICAgIHAybV9zd2l0Y2hfdmNwdV9h
bHRwMm1fYnlfaWQodiwgaWR4KTsKPiAyMzE2IH0KPiAKPiBhbmQgaW4gdm14LmM6Cj4gCj4gMjIy
NSBzdGF0aWMgaW50IHZteF92Y3B1X2VtdWxhdGVfdm1mdW5jKGNvbnN0IHN0cnVjdCBjcHVfdXNl
cl9yZWdzICpyZWdzKQo+IDIyMjYgewo+IDIyMjcgICAgIGludCByYyA9IFg4NkVNVUxfRVhDRVBU
SU9OOwo+IDIyMjggICAgIHN0cnVjdCB2Y3B1ICpjdXJyID0gY3VycmVudDsKPiAyMjI5Cj4gMjIz
MCAgICAgaWYgKCAhY3B1X2hhc192bXhfdm1mdW5jICYmIGFsdHAybV9hY3RpdmUoY3Vyci0+ZG9t
YWluKSAmJgo+IDIyMzEgICAgICAgICAgcmVncy0+ZWF4ID09IDAgJiYKPiAyMjMyICAgICAgICAg
IHAybV9zd2l0Y2hfdmNwdV9hbHRwMm1fYnlfaWQoY3VyciwgcmVncy0+ZWN4KSApCj4gMjIzMyAg
ICAgICAgIHJjID0gWDg2RU1VTF9PS0FZOwo+IDIyMzQKPiAyMjM1ICAgICByZXR1cm4gcmM7Cj4g
MjIzNiB9Cj4gCj4gaGVyZSB0aGVyZSdzIGFuICImJiBhbHRwMm1fYWN0aXZlKGN1cnItPmRvbWFp
bikiIGluIHRoZSBpZigpLgoKT2gsIHNvIEkgbXVzdCBoYXZlIG92ZXJsb29rZWQgb25lIG9mIHRo
ZSB0d28sIHNvcnJ5LgoKPiBTbyBJIHN1cHBvc2UgaW4gb3VyIHNjZW5hcmlvIGFsbCB0aGF0J3Mg
bmVlZGVkIGl0IGEgc2ltaWxhciBjaGVjayBoZXJlOgo+IAo+IDQ2MzYgICAgIGNhc2UgSFZNT1Bf
YWx0cDJtX3N3aXRjaF9wMm06Cj4gNDYzNyAgICAgICAgIHJjID0gcDJtX3N3aXRjaF9kb21haW5f
YWx0cDJtX2J5X2lkKGQsIGEudS52aWV3LnZpZXcpOwo+IDQ2MzggICAgICAgICBicmVhazsKPiAK
PiBmb3IgdGhlIG90aGVyIGZ1bmN0aW9uLCBwMm1fc3dpdGNoX2RvbWFpbl9hbHRwMm1fYnlfaWQo
KS4KPiAKPiBVbmxlc3MgSSdtIG1pc3Npbmcgc29tZXRoaW5nLgoKUGVyaGFwcy4gUXVlc3Rpb24g
aXMgd2hldGhlciBvdXRzaWRlIG9mIHlvdXIgc2NlbmFyaW8gc2ltaWxhciBjaGVja3MKYXJlIG1p
c3NpbmcgZWxzZXdoZXJlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
