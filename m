From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 09/11] pci: add vpci hooks for device
 addition/removal
Date: Fri, 28 Sep 2018 09:48:24 -0600
Message-ID: <5BAE4D4802000078001ECFC2@prv1-mh.provo.novell.com>
References: <20180717094830.54806-1-roger.pau@citrix.com>
 <20180717094830.54806-10-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ucvl=mk=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g5v0J-0003BN-Jm
 for xen-devel@lists.xenproject.org; Fri, 28 Sep 2018 15:48:31 +0000
In-Reply-To: <20180717094830.54806-10-roger.pau@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA3LjE4IGF0IDExOjQ4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jCj4gKysrIGIveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvcGNpLmMKPiBAQCAtNzY4LDYgKzc2OCwxMyBAQCBpbnQgcGNpX2FkZF9kZXZp
Y2UodTE2IHNlZywgdTggYnVzLCB1OCBkZXZmbiwKPiAgICAgICAgICAgICAgZ290byBvdXQ7Cj4g
ICAgICAgICAgfQo+ICAKPiArICAgICAgICByZXQgPSB2cGNpX2FkZF9oYW5kbGVycyhwZGV2KTsK
PiArICAgICAgICBpZiAoIHJldCApCj4gKyAgICAgICAgewo+ICsgICAgICAgICAgICBwZGV2LT5k
b21haW4gPSBOVUxMOwo+ICsgICAgICAgICAgICBnb3RvIG91dDsKPiArICAgICAgICB9Cj4gKwo+
ICAgICAgICAgIGxpc3RfYWRkKCZwZGV2LT5kb21haW5fbGlzdCwgJmhhcmR3YXJlX2RvbWFpbi0+
YXJjaC5wZGV2X2xpc3QpOwo+ICAgICAgfQo+ICAgICAgZWxzZQo+IEBAIC04MTIsNiArODE5LDcg
QEAgaW50IHBjaV9yZW1vdmVfZGV2aWNlKHUxNiBzZWcsIHU4IGJ1cywgdTggZGV2Zm4pCj4gICAg
ICBsaXN0X2Zvcl9lYWNoX2VudHJ5ICggcGRldiwgJnBzZWctPmFsbGRldnNfbGlzdCwgYWxsZGV2
c19saXN0ICkKPiAgICAgICAgICBpZiAoIHBkZXYtPmJ1cyA9PSBidXMgJiYgcGRldi0+ZGV2Zm4g
PT0gZGV2Zm4gKQo+ICAgICAgICAgIHsKPiArICAgICAgICAgICAgdnBjaV9yZW1vdmVfZGV2aWNl
KHBkZXYpOwo+ICAgICAgICAgICAgICByZXQgPSBpb21tdV9yZW1vdmVfZGV2aWNlKHBkZXYpOwo+
ICAgICAgICAgICAgICBpZiAoIHBkZXYtPmRvbWFpbiApCj4gICAgICAgICAgICAgICAgICBsaXN0
X2RlbCgmcGRldi0+ZG9tYWluX2xpc3QpOwoKVGhlc2Ugc2hvdWxkIGhhdmUgYmVlbiBoZXJlIGV2
ZW4gd2l0aG91dCBTUi1JT1YgaW4gbWluZCwgYXMgd2UgZG9uJ3QKZ3VhcmFudGVlIHRvIGZpbmQg
YWxsIGRldmljZXMgZHVyaW5nIG91ciBib290IHRpbWUgc2Nhbi4gRG9lcyB0aGlzIGhhdmUKYW55
IGRlcGVuZGVuY2llcyBvbiB0aGUgZWFybGllciBwYXRjaGVzIGluIHRoZSBzZXJpZXM/IElmIG5v
dCwgSSB0aGluayBpdApzaG91bGQgZ28gaW4gYXMgc29vbiBhcyBpdCdzIHJlYWR5LCBpbmRlcGVu
ZGVudCBvZiB0aGUgcmVzdCBvZiB0aGlzIHNlcmllcy4KCkhvd2V2ZXIsIGVycm9yIGhhbmRsaW5n
IGluIHRoZSAiYWRkIiBjYXNlIGxvb2tzIHdyb25nOgppb21tdV9hZGRfZGV2aWNlKCkgZWl0aGVy
IG5lZWRzIHVuZG9pbmcsIG9yIHlvdXIgY2FsbCBzaG91bGQgYmUgZG9uZQplYXJsaWVyIChhbmQg
aXRzIGVmZmVjdHMgdW5kb25lIGluIGNhc2UgaW9tbXVfYWRkX2RldmljZSgpIGZhaWxzKS4KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
