From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 49/60] xen/sched: reject switching smt
 on/off with core scheduling active
Date: Tue, 28 May 2019 13:52:00 +0200
Message-ID: <180b9637-f922-902b-add5-9a32e275d0a9@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-50-jgross@suse.com>
 <5CED1F030200007800233129@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=31/0=T4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hVaeD-0001M1-El
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 11:52:05 +0000
In-Reply-To: <5CED1F030200007800233129@prv1-mh.provo.novell.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDUvMjAxOSAxMzo0NCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjguMDUuMTkg
YXQgMTI6MzMsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiAtLS0gYS94ZW4vYXJjaC94ODYv
c3lzY3RsLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L3N5c2N0bC5jCj4+IEBAIC0yMDAsNyArMjAw
LDggQEAgbG9uZyBhcmNoX2RvX3N5c2N0bCgKPj4gIAo+PiAgICAgICAgICBjYXNlIFhFTl9TWVND
VExfQ1BVX0hPVFBMVUdfU01UX0VOQUJMRToKPj4gICAgICAgICAgY2FzZSBYRU5fU1lTQ1RMX0NQ
VV9IT1RQTFVHX1NNVF9ESVNBQkxFOgo+PiAtICAgICAgICAgICAgaWYgKCAhY3B1X2hhc19odHQg
fHwgYm9vdF9jcHVfZGF0YS54ODZfbnVtX3NpYmxpbmdzIDwgMiApCj4+ICsgICAgICAgICAgICBp
ZiAoICFjcHVfaGFzX2h0dCB8fCBib290X2NwdV9kYXRhLng4Nl9udW1fc2libGluZ3MgPCAyIHx8
Cj4+ICsgICAgICAgICAgICAgICAgIHNjaGVkX2Rpc2FibGVfc210X3N3aXRjaGluZyApCj4+ICAg
ICAgICAgICAgICB7Cj4+ICAgICAgICAgICAgICAgICAgcmV0ID0gLUVPUE5PVFNVUFA7Cj4+ICAg
ICAgICAgICAgICAgICAgYnJlYWs7Cj4gCj4gSSdtIG5vdCBjb252aW5jZWQgLUVPUE5PVFNVUFAg
aXMgYW4gYXBwcm9wcmlhdGUgZXJyb3IgY29kZSBmb3IKPiB0aGlzIG5ldyBjYXNlLiAtRVBFUk0s
IC1FQUNDRVMsIG9yIC1FSU8gd291bGQgYWxsIHNlZW0gbW9yZQo+IGFwcHJvcHJpYXRlIHRvIG1l
IChhbmQgcGVyaGFwcyB0aGVyZSBhcmUgZnVydGhlciBvbmVzKS4KCkkgdGhpbmsgLUVJTyBvciAt
RUJVU1kgd291bGQgYmUgdGhlIGJlc3QgZml0LgoKPiAKPj4gLS0tIGEveGVuL2NvbW1vbi9zY2hl
ZHVsZS5jCj4+ICsrKyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwo+PiBAQCAtNTcsNiArNTcsNyBA
QCBpbnRlZ2VyX3BhcmFtKCJzY2hlZF9yYXRlbGltaXRfdXMiLCBzY2hlZF9yYXRlbGltaXRfdXMp
Owo+PiAgCj4+ICAvKiBOdW1iZXIgb2YgdmNwdXMgcGVyIHN0cnVjdCBzY2hlZF91bml0LiAqLwo+
PiAgc3RhdGljIHVuc2lnbmVkIGludCBzY2hlZF9ncmFudWxhcml0eSA9IDE7Cj4+ICtib29sIHNj
aGVkX2Rpc2FibGVfc210X3N3aXRjaGluZzsKPiAKPiBfX3JlYWRfbW9zdGx5IChwZXJoYXBzIGFs
c28gdGhlIHByZS1leGlzdGluZyB2YXJpYWJsZSBpbiBjb250ZXh0KT8KClllcywgY2FuIGRvLgoK
Ckp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
