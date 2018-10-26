From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 03/16] x86: make traps.c build with
 !CONFIG_PV
Date: Fri, 26 Oct 2018 10:02:19 -0600
Message-ID: <5BD33A8B02000078001F5578@prv1-mh.provo.novell.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
 <d378cf29afda47cd5f5ead07e8f2ae3e98910e41.1539959287.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=n7n6=ng=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gG4Z8-0006bA-2u
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 16:02:26 +0000
In-Reply-To: <d378cf29afda47cd5f5ead07e8f2ae3e98910e41.1539959287.git-series.wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjEwLjE4IGF0IDE2OjI4LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
QEAgLTEzMzcsOCArMTMzOSwxNSBAQCBzdGF0aWMgaW50IGZpeHVwX3BhZ2VfZmF1bHQodW5zaWdu
ZWQgbG9uZyBhZGRyLCBzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykKPiAgICAgIHsKPiAgICAg
ICAgICBpZiAoICEocmVncy0+ZXJyb3JfY29kZSAmIChQRkVDX3VzZXJfbW9kZSB8IFBGRUNfcmVz
ZXJ2ZWRfYml0KSkgJiYKPiAgICAgICAgICAgICAgIChhZGRyID49IEdEVF9MRFRfVklSVF9TVEFS
VCkgJiYgKGFkZHIgPCBHRFRfTERUX1ZJUlRfRU5EKSApCj4gKyAgICAgICAgewo+ICsjaWZkZWYg
Q09ORklHX1BWCj4gICAgICAgICAgICAgIHJldHVybiBoYW5kbGVfZ2R0X2xkdF9tYXBwaW5nX2Zh
dWx0KAo+ICAgICAgICAgICAgICAgICAgYWRkciAtIEdEVF9MRFRfVklSVF9TVEFSVCwgcmVncyk7
Cj4gKyNlbHNlCj4gKyAgICAgICAgICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOwoKSSdtIG5vdCBj
b252aW5jZWQ6IEEgYnVnZ3kgYWNjZXNzIHRvIHRoaXMgcmFuZ2Ugc2hvdWxkIGxlYWQgdG8KYW4g
dW5oYW5kbGVkICNQRiwgbm90IGFuIGFzc2VydGlvbiBmYWlsdXJlLgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
