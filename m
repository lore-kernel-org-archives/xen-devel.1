From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86emul/fuzz: add a state sanitization
 function
Date: Mon, 01 Apr 2019 06:05:24 -0600
Message-ID: <5CA1FE84020000780022396D@prv1-mh.provo.novell.com>
References: <5C9E31960200007800222DDF@prv1-mh.provo.novell.com>
 <5CA1C1CE02000078002236C0@prv1-mh.provo.novell.com>
 <1CB7DE24-AC0B-4E46-818C-97DC2F753C87@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uvFD=SD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hAvgz-00009I-Lh
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 12:05:33 +0000
In-Reply-To: <1CB7DE24-AC0B-4E46-818C-97DC2F753C87@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: george.dunlap@citrix.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjA0LjE5IGF0IDEyOjQ0LCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPj4gT24gQXByIDEsIDIwMTksIGF0IDg6NDYgQU0sIEphbiBCZXVsaWNoIDxKQmV1bGljaEBz
dXNlLmNvbT4gd3JvdGU6Cj4+ICsvKgo+PiArICogQ2FsbCB0aGlzIGZ1bmN0aW9uIGZyb20gaG9v
a3MgcG90ZW50aWFsbHkgYWx0ZXJpbmcgbWFjaGluZSBzdGF0ZSBpbnRvCj4+ICsgKiBzb21ldGhp
bmcgdGhhdCdzIG5vdCBhcmNoaXRlY3R1cmFsbHkgdmFsaWQsIHlldCB3aGljaCAtIGFzIHBlciBh
Ym92ZSAtCj4+ICsgKiB0aGUgZW11bGF0b3IgcmVsaWVzIG9uLgo+PiArICovCj4+ICtzdGF0aWMg
Ym9vbCBzYW5pdGl6ZV9zdGF0ZShzdHJ1Y3QgeDg2X2VtdWxhdGVfY3R4dCAqY3R4dCkKPj4gK3sK
Pj4gKyAgICBjb25zdCBzdHJ1Y3QgZnV6el9zdGF0ZSAqcyA9IGN0eHQtPmRhdGE7Cj4+ICsgICAg
Y29uc3Qgc3RydWN0IGZ1enpfY29ycHVzICpjID0gcy0+Y29ycHVzOwo+PiArICAgIGNvbnN0IHN0
cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzID0gJmMtPnJlZ3M7Cj4+ICsKPj4gKyAgICBpZiAoIGxv
bmdfbW9kZV9hY3RpdmUoY3R4dCkgJiYgIShjLT5jclswXSAmIFg4Nl9DUjBfUEcpICkKPj4gKyAg
ICAgICAgcmV0dXJuIGZhbHNlOwo+PiArCj4+ICsgICAgaWYgKCAoYy0+Y3JbMF0gJiBYODZfQ1Iw
X1BHKSAmJiAhKGMtPmNyWzBdICYgWDg2X0NSMF9QRSkgKQo+PiArICAgICAgICByZXR1cm4gZmFs
c2U7Cj4+ICsKPj4gKyAgICBpZiAoIChyZWdzLT5yZmxhZ3MgJiBYODZfRUZMQUdTX1ZNKSAmJgo+
PiArICAgICAgICAgKGMtPnNlZ21lbnRzW3g4Nl9zZWdfY3NdLmRiIHx8IGMtPnNlZ21lbnRzW3g4
Nl9zZWdfc3NdLmRiKSApCj4+ICsgICAgICAgIHJldHVybiBmYWxzZTsKPj4gKwo+PiArICAgIHJl
dHVybiB0cnVlOwo+PiArfQo+IAo+IFNvcnJ5LCBJIGRpZG7igJl0IHJlYWQgdGhpcyBmdW5jdGlv
biB2ZXJ5IHdlbGwgb24gRnJpZGF5LiAgSXTigJlzIG5vdCBhY3R1YWxseSAKPiBkb2luZyBhbnkg
c2FuaXRhdGlvbjsgcmF0aGVyLCBpdOKAmXMgY2hlY2tpbmcgd2hldGhlciB0aGUgc3RhdGUgaXMg
Cj4gYXJjaGl0ZWN0dXJhbGx5IHZhbGlkLiAgT3IgbW9yZSBwcmVjaXNlbHk6IGl04oCZcyBjaGVj
a2luZyB3aGV0aGVyIHRoZSAKPiBlbXVsYXRvcidzIGFzc3VtcHRpb25zIGFib3V0IHRoZSBzdGF0
ZSBzdGlsbCBob2xkLgo+IAo+IGNoZWNrX3N0YXRlPyAgc2FuaXR5X2NoZWNrX3N0YXRlPyAgCgpI
bW0sIHllcyAtIGluaXRpYWxseSBJIHdhcyBtZWFuaW5nIHRvIGFsdGVyIHN0YXRlLCBhbmQgdGhl
biBJIGRlY2lkZWQKZGlmZmVyZW50bHkgYnV0IGRpZG4ndCBjaGFuZ2UgdGhlIG5hbWUuIEknbGwg
Z28gd2l0aCBjaGVja19zdGF0ZSgpLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
