From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 7/7] amd/pvh: enable ACPI C1E disable
 quirk on PVH Dom0
Date: Mon, 29 Oct 2018 08:19:20 -0600
Message-ID: <5BD716E802000078001F5D60@prv1-mh.provo.novell.com>
References: <20181019152021.64607-1-roger.pau@citrix.com>
 <20181019152021.64607-8-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=m5uw=nj=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gH8O7-0004YC-L2
 for xen-devel@lists.xenproject.org; Mon, 29 Oct 2018 14:19:27 +0000
In-Reply-To: <20181019152021.64607-8-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjEwLjE4IGF0IDE3OjIwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5jCj4gKysrIGIveGVuL2FyY2gveDg2L2h2
bS9zdm0vc3ZtLmMKPiBAQCAtMTI3Miw2ICsxMjcyLDI0IEBAIHZvaWQgc3ZtX2hvc3Rfb3N2d19p
bml0KCkKPiAgICAgIHNwaW5fdW5sb2NrKCZvc3Z3X2xvY2spOwo+ICB9Cj4gIAo+ICtzdGF0aWMg
aW50IGFjcGlfYzFlX3F1aXJrKGludCBkaXIsIHVuc2lnbmVkIGludCBwb3J0LCB1bnNpZ25lZCBp
bnQgYnl0ZXMsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgKnZhbCkKPiAr
ewo+ICsgICAgQVNTRVJUKGJ5dGVzID09IDEgJiYgcG9ydCA9PSBhY3BpX3NtaV9jbWQpOwo+ICsK
PiArICAgIGlmICggZGlyID09IElPUkVRX1JFQUQgKQo+ICsgICAgewo+ICsgICAgICAgICp2YWwg
PSBpbmIocG9ydCk7Cj4gKyAgICAgICAgcmV0dXJuIFg4NkVNVUxfT0tBWTsKPiArICAgIH0KPiAr
Cj4gKyAgICBvdXRiKCp2YWwsIHBvcnQpOwo+ICsgICAgaWYgKCAqdmFsID09IGFjcGlfZW5hYmxl
X3ZhbHVlICkKPiArICAgICAgIG9uX2VhY2hfY3B1KGFtZF9kaXNhYmxlX2MxZSwgTlVMTCwgMSk7
Cj4gKwo+ICsgICAgcmV0dXJuIFg4NkVNVUxfT0tBWTsKPiArfQoKTm90aGluZyBpbiBoZXJlIG5v
ciAuLi4KCj4gQEAgLTEyODQsNiArMTMwMiw5IEBAIHN0YXRpYyBpbnQgc3ZtX2RvbWFpbl9pbml0
aWFsaXNlKHN0cnVjdCBkb21haW4gKmQpCj4gIAo+ICAgICAgc3ZtX2d1ZXN0X29zdndfaW5pdChk
KTsKPiAgCj4gKyAgICBpZiAoIGFtZF9hY3BpX2MxZV9xdWlyayApCj4gKyAgICAgICAgcmVnaXN0
ZXJfcG9ydGlvX2hhbmRsZXIoZCwgYWNwaV9zbWlfY21kLCAxLCBhY3BpX2MxZV9xdWlyayk7Cgou
Li4gdGhlIHJlZ2lzdHJhdGlvbiBoZXJlIHJlc3RyaWN0cyB0aGlzIHRvIERvbTAuCgpKYW4KCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
