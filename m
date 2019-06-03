From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2] xen/swiotlb: don't initialize swiotlb
 twice on arm64
Date: Mon, 3 Jun 2019 19:16:22 -0400
Message-ID: <25ba38d9-3b9a-a748-714a-25ed207ce090@oracle.com>
References: <alpine.DEB.2.21.1905281546410.16734@sstabellini-ThinkPad-T480s>
 <4cfc2555-8933-b036-7068-470c388a665f@oracle.com>
 <alpine.DEB.2.21.1906031124300.14041@sstabellini-ThinkPad-T480s>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=e1yZ=UC=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1hXwCt-0002If-MR
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 23:17:35 +0000
In-Reply-To: <alpine.DEB.2.21.1906031124300.14041@sstabellini-ThinkPad-T480s>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, Julien.Grall@arm.com, konrad.wilk@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gNi8zLzE5IDI6MjUgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBPbiBUdWUsIDI4
IE1heSAyMDE5LCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+IE9uIDUvMjgvMTkgNjo0OCBQTSwg
U3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+Pj4gRnJvbTogU3RlZmFubyBTdGFiZWxsaW5pIDxz
dGVmYW5vc0B4aWxpbnguY29tPgo+Pj4KPj4+IE9uIGFybTY0IHN3aW90bGIgaXMgb2Z0ZW4gKG5v
dCBhbHdheXMpIGFscmVhZHkgaW5pdGlhbGl6ZWQgYnkgbWVtX2luaXQuCj4+PiBXZSBkb24ndCB3
YW50IHRvIGluaXRpYWxpemUgaXQgdHdpY2UsIHdoaWNoIHdvdWxkIHRyaWdnZXIgYSBzZWNvbmQK
Pj4+IG1lbW9yeSBhbGxvY2F0aW9uLiBNb3Jlb3ZlciwgdGhlIHNlY29uZCBtZW1vcnkgcG9vbCBp
cyB0eXBpY2FsbHkgbWFkZSBvZgo+Pj4gaGlnaCBwYWdlcyBhbmQgZW5kcyB1cCByZXBsYWNpbmcg
dGhlIG9yaWdpbmFsIG1lbW9yeSBwb29sIG9mIGxvdyBwYWdlcy4KPj4+IEFzIGEgc2lkZSBlZmZl
Y3Qgb2YgdGhpcyBjaGFuZ2UsIGl0IGlzIHBvc3NpYmxlIHRvIGhhdmUgbG93IHBhZ2VzIGluCj4+
PiBzd2lvdGxiLXhlbiBvbiBhcm02NC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0
YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+Cj4+IEhhcyB0aGlzIGJlZW4gdGVzdGVkIG9u
IHg4Nj8KPiBZZXMsIEkgbWFuYWdlZCB0byB0ZXN0IGl0IHVzaW5nIFFFTVUuIFRoZXJlIGFyZSBu
byBlZmZlY3RzIG9uIHg4NiwgYXMKPiB0aGUgY2hlY2sgaW9fdGxiX3N0YXJ0ICE9IDAgcmV0dXJu
cyBmYWxzZS4KCkkgd29uZGVyIHRob3VnaCB3aGV0aGVyIHRoaXMgaXMgYWx3YXlzIHRoZSBjYXNl
LsKgIFdoZW4gd2UgYXJlIGNhbGxlZApmcm9tIHBjaV94ZW5fc3dpb3RsYl9pbml0X2xhdGUoKSBm
b3IgZXhhbXBsZS4KCgotYm9yaXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
