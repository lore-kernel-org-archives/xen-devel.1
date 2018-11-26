From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 2/6] vpci: fix deferral of long operations
Date: Mon, 26 Nov 2018 04:26:49 -0700
Message-ID: <5BFBD87902000078001FFE6A@prv1-mh.provo.novell.com>
References: <20181120160153.45259-1-roger.pau@citrix.com>
 <20181120160153.45259-3-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aZgN=OF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gRF2X-0000ox-2a
 for xen-devel@lists.xenproject.org; Mon, 26 Nov 2018 11:26:57 +0000
In-Reply-To: <20181120160153.45259-3-roger.pau@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjExLjE4IGF0IDE3OjAxLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEN1cnJlbnQgbG9naWMgdG8gaGFuZGxlIGxvbmcgcnVubmluZyBvcGVyYXRpb25zIGlzIGZsYXdl
ZCBiZWNhdXNlIGl0Cj4gZG9lc24ndCBwcmV2ZW50IHRoZSBndWVzdCB2Y3B1IGZyb20gcnVubmlu
Zy4gRml4IHRoaXMgYnkgcmFpc2luZyBhCj4gc2NoZWR1bGVyIHNvZnRpcnEgd2hlbiBwcmVlbXB0
aW9uIGlzIHJlcXVpcmVkLCBzbyB0aGF0IHRoZSBkb19zb2Z0aXJxCj4gY2FsbCBpbiB0aGUgZ3Vl
c3QgZW50cnkgcGF0aCBwZXJmb3JtcyBhIHJlc2NoZWR1bGluZy4gQWxzbyBtb3ZlIHRoZQo+IGNh
bGwgdG8gdnBjaV9wcm9jZXNzX3BlbmRpbmcgaW50byBoYW5kbGVfaHZtX2lvX2NvbXBsZXRpb24s
IHRvZ2V0aGVyCj4gd2l0aCB0aGUgSU9SRVEgY29kZSB0aGF0IGhhbmRsZXMgcGVuZGluZyBJTyBp
bnN0cnVjdGlvbnMuCj4gCj4gTm90ZSB0aGF0IGEgc2NoZWR1bGVyIHNvZnRpcnEgaXMgYWxzbyBy
YWlzZWQgd2hlbiB0aGUgbG9uZyBydW5uaW5nCj4gb3BlcmF0aW9uIGlzIHF1ZXVlZCBpbiBvcmRl
ciB0byBwcmV2ZW50IHRoZSBndWVzdCB2Y3B1IGZyb20gcmVzdW1pbmcKPiBleGVjdXRpb24uCj4g
Cj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgp3aXRoIG9uZSBy
ZW1hcms6Cgo+IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMKPiArKysgYi94ZW4vZHJp
dmVycy92cGNpL2hlYWRlci5jCj4gQEAgLTE4NCw2ICsxODQsMTEgQEAgc3RhdGljIHZvaWQgZGVm
ZXJfbWFwKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBwY2lfZGV2ICpwZGV2LAo+ICAgICAgY3Vy
ci0+dnBjaS5tZW0gPSBtZW07Cj4gICAgICBjdXJyLT52cGNpLmNtZCA9IGNtZDsKPiAgICAgIGN1
cnItPnZwY2kucm9tX29ubHkgPSByb21fb25seTsKPiArICAgIC8qCj4gKyAgICAgKiBSYWlzZSBh
IHNjaGVkdWxlciBzb2Z0aXJxIGluIG9yZGVyIHRvIHByZXZlbnQgdGhlIGd1ZXN0IGZyb20gcmVz
dW1pbmcKPiArICAgICAqIGV4ZWN1dGlvbiB3aXRoIHBlbmRpbmcgbWFwcGluZyBvcGVyYXRpb25z
LgoKLi4uLCB0byB0cmlnZ2VyIHRoZSBpbnZvY2F0aW9uIG9mIHZwY2lfcHJvY2Vzc19wZW5kaW5n
KCkuCgpJZiB5b3UgZG9uJ3QgbWluZCBJIGNhbiBhZGQgdGhpcyAob3Igc29tZXRoaW5nIHNpbWls
YXIgaWYgeW91CmRpc2xpa2UgdGhpcyB3b3JkaW5nKSB3aGlsZSBjb21taXR0aW5nLgoKSmFuCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
