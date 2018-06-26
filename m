From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.11 v2 2/3] x86: guard against #NM
Date: Tue, 26 Jun 2018 11:22:28 +0100
Message-ID: <1b16e94e-71d2-4a01-f78d-fa5359c48c7a@citrix.com>
References: <5B31DC2702000078001CDBEC@prv1-mh.provo.novell.com>
 <5B31DF0502000078001CDC14@prv1-mh.provo.novell.com>
 <cbd9d68d-47db-e947-14a5-ff3f43490af0@citrix.com>
 <5B320E0402000078001CDE9C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=a3a5=jm=citrix.com=prvs=7081fe03c=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fXl7P-0002gR-Mh
 for xen-devel@lists.xenproject.org; Tue, 26 Jun 2018 10:22:39 +0000
In-Reply-To: <5B320E0402000078001CDE9C@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMDYvMTggMTA6NTcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Cj4+PiArICAgICAgICAgICAg
ICAgIF9wKHJlZ3MtPnJpcCksIF9wKHJlZ3MtPnJpcCksIF9wKGZpeHVwKSk7Cj4+PiArICAgICAg
ICAvKgo+Pj4gKyAgICAgICAgICogV2UgbXVzdG4ndCBjb21lIGhlcmUsIGJ1dCBmb3IgcmVsZWFz
ZSBidWlsZHMgaGF2ZSB0aGUgcmVjb3ZlcnkKPj4gIldlIHNob3VsZG4ndCBiZSBhYmxlIHRvIHJl
YWNoIGhlcmUuLi4iCj4gV2VsbCwgb2theSAtIEkgZGlkIGNvbnNpZGVyIHRoaXMgd2Vha2VyIHdv
cmRpbmcsIGJ1dCBoYWQgb3B0ZWQgZm9yIHRoZQo+IHN0cm9uZ2VyIG9uZSB0aGVuLgoKIm11c3Ru
J3QiIGlzbid0IHRoZSBpbnRlbmRlZCBwaHJhc2luZyBoZXJlLCBhbHRob3VnaCBJJ20gaGF2aW5n
IGEgdmVyeQpoYXJkIHRpbWUgdHJ5aW5nIHRvIGRlc2NyaWJlIHRoZSBkaWZmZXJlbmNlIHZzICJz
aG91bGRuJ3QgYmUgYWJsZSB0byIgaW4KdGhpcyBjb250ZXh0LgoKQnkgdGhlIHRpbWUgcGVvcGxl
IGFyZSBwb2tpbmcgYXJvdW5kIGluIHRoaXMgY29kZSwgdGhlICJtdXN0bid0IiBoYXMKY2xlYXJs
eSBiZWVuIHZpb2xhdGVkLCB3aGVyZWFzIHRoZSAic2hvdWxkbid0IGJlIGFibGUgdG8iIGlzIGFj
Y2VwdGluZwpvZiB0aGUgZmFjdCB0aGF0IHdlIGhhdmUgZ290IGhlcmUsIGFuZCBzb21ldGhpbmcg
cHJldmlvdXNseSBoYXMgZ29uZSB3cm9uZy4KCkkgcmVhbGlzZSB0aGlzIGlzIHByb2JhYmx5IGEg
dmVyeSB1bmhlbHBmdWwgZGVzY3JpcHRpb24uCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
