From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 4/5] amd/iommu: assign iommu devices to
 Xen
Date: Wed, 14 Nov 2018 06:53:58 -0700
Message-ID: <5BEC28F602000078001FC035@prv1-mh.provo.novell.com>
References: <20181114115740.1050-1-roger.pau@citrix.com>
 <20181114115740.1050-5-roger.pau@citrix.com>
 <6ea6b76d-3ea8-de3a-0a43-a60b4c9b9f3b@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=etbn=nz=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gMvcJ-0002mw-Ou
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 13:54:03 +0000
In-Reply-To: <6ea6b76d-3ea8-de3a-0a43-a60b4c9b9f3b@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjExLjE4IGF0IDEzOjMzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTQvMTEvMjAxOCAxMTo1NywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+PiBBTUQg
SU9NTVUgZGV2aWNlcyBhcmUgZXhwb3NlZCBvbiB0aGUgUENJIGJ1cywgYW5kIHRodXMgYXJlIGFz
c2lnbmVkIGJ5Cj4+IGRlZmF1bHQgdG8gdGhlIGhhcmR3YXJlIGRvbWFpbi4gVGhpcyBjYW4gY2F1
c2UgaXNzdWVzIGJlY2F1c2UgdGhlCj4+IElPTU1VIGRldmljZXMgYXJlIG5vdCBiZWhpbmQgYW4g
SU9NTVUsIGFuZCBjb25jZXB0dWFsbHkgaXQncyBhbHNvIHdyb25nCj4+IHRvIGdpdmUgdGhlIGhh
cmR3YXJlIGRvbWFpbiBvd25lcnNoaXAgb2YgdGhvc2UgZGV2aWNlcyBzaW5jZSB0aGV5IGFyZQo+
PiBpbiB1c2UgYnkgWGVuLgo+Pgo+PiBGaXggdGhpcyBieSBhc3NpZ25pbmcgdGhlIFBDSSBJT01N
VSBkZXZpY2VzIHRvIFhlbi4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gCj4gVGhpcyBpcyB1bmZvcnR1bmF0ZWx5IGEgc3ltcHRv
bSBvZiBtdWNoIG1vcmUgYmFzaWMgYnVnIGluIFhlbi4KPiAKPiBQYXJ0aWN1bGFybHkgb24gcmVj
ZW50IHNlcnZlciBwYXJ0cywgdGhlcmUgYXJlIG1hbnkgUENJIGRldmljZXMgd2hpY2gKPiByZXBy
ZXNlbnQgcHJvY2Vzc29yIGludGVybmFscyBhbmQgYXJlbid0IHNhZmUgdG8gZ2l2ZSBldmVuIHRv
IGRvbTAuCgpXZWxsLCB5ZXMsIHNvbWUgcGVyaGFwcy4KCj4gVGhlcmUgc2hvdWxkIGJlIGEgd2hp
dGVsaXN0IG9mIGRldmljZXMgd2UgY29uc2lkZXIgc2FmZSwgbm90IGEgYmxhY2tsaXN0Cj4gb2Yg
dGhvc2Ugd2Uga25vdyB0byBiZSB1bnNhZmUuCgpTdWNoIGFuIGFwcHJvYWNoIHdvdWxkLCBJJ20g
YWZyYWlkLCBiZSB3b3JrYWJsZSBvbmx5IGlmIHZlbmRvcnMKKHBybylhY3RpdmVseSBjb21tdW5p
Y2F0ZWQgcHJvcGVydGllcyBhbmQgZGV2aWNlIElEcywgc3VjaCB0aGF0CndlIHdvdWxkIG5vdCBj
b25zdGFudGx5IGxhZyBiZWhpbmQgd2hhdCdzIG9uIHRoZSBtYXJrZXQuCgpKYW4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
