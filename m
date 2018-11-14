From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 09/18] xen/arm: Add rcu_barrier() before
 enabling non-boot CPUs on resume
Date: Wed, 14 Nov 2018 14:29:30 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1811141428250.302@sstabellini-ThinkPad-X260>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-10-git-send-email-mirela.simonovic@aggios.com>
 <01d74200-63a3-e529-dabf-d393261e7e0c@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UKUJ=NZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gN3fB-0001Zx-MP
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 22:29:33 +0000
In-Reply-To: <01d74200-63a3-e529-dabf-d393261e7e0c@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xen.org, dm@aggios.com, saeed.nowshadi@xilinx.com, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, stefano.stabellini@xilinx.com, Mirela Simonovic <mirela.simonovic@aggios.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAxNCBOb3YgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDEy
LzExLzIwMTggMTE6MzAsIE1pcmVsYSBTaW1vbm92aWMgd3JvdGU6Cj4gPiBUaGUgcmN1X2JhcnJp
ZXIoKSBoYXMgdG8gYmUgYWRkZWQgdG8gZW5zdXJlIHRoYXQgdGhlIHBlciBjcHUgYXJlYSBpcwo+
ID4gZnJlZWQgYmVmb3JlIGEgbm9uLWJvb3QgQ1BVIHRyaWVzIHRvIGluaXRpYWxpemUgaXQgKF9m
cmVlX3BlcmNwdV9hcmVhKCkKPiA+IGhhcyB0byBiZSBjYWxsZWQgYmVmb3JlIHRoZSBpbml0X3Bl
cmNwdV9hcmVhKCkpLiBUaGlzIHNjZW5hcmlvIG9jY3Vycwo+ID4gd2hlbiBub24tYm9vdCBDUFVz
IGFyZSBob3QtdW5wbHVnZ2VkIG9uIHN1c3BlbmQgYW5kIGhvdHBsdWdnZWQgb24gcmVzdW1lLgo+
IAo+IEZyb20gdGhlIGRlc2NyaXB0aW9uLCB0aGlzIGlzIGEgYnVnIGludHJvZHVjZWQgYnkgdGhl
IHByZXZpb3VzIHBhdGNoLiBTbwo+IHNob3VsZCBtZXJnZWQgaW4gaXQuCiAKSXQgbWFrZXMgc2Vu
c2UgdG8gc3F1YXNoIHRoaXMgcGF0Y2ggdG9nZXRoZXIgd2l0aCBwYXRjaCAjOC4KCgo+IFRoZSBj
b21taXQgbWVzc2FnZSB3aWxsIGFsc28gbmVlZCB0byBleHBsYWluIHdoeSB0aGUgcmN1X2JhcnJp
ZXIoKSBpcwo+IHJlcXVpcmVkLgo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNaXJlbGEgU2ltb25vdmlj
IDxtaXJlbGEuc2ltb25vdmljQGFnZ2lvcy5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBTYWVlZCBO
b3dzaGFkaSA8c2FlZWQubm93c2hhZGlAeGlsaW54LmNvbT4KPiA+IC0tLQo+ID4gICB4ZW4vYXJj
aC9hcm0vc3VzcGVuZC5jIHwgMSArCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3N1c3BlbmQuYyBiL3hlbi9hcmNo
L2FybS9zdXNwZW5kLmMKPiA+IGluZGV4IGRhZTFiMWY3ZDYuLjhlOGU1MzFkNjEgMTAwNjQ0Cj4g
PiAtLS0gYS94ZW4vYXJjaC9hcm0vc3VzcGVuZC5jCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vc3Vz
cGVuZC5jCj4gPiBAQCAtMTMzLDYgKzEzMyw3IEBAIHN0YXRpYyBsb25nIHN5c3RlbV9zdXNwZW5k
KHZvaWQgKmRhdGEpCj4gPiAgICAgICBzeXN0ZW1fc3RhdGUgPSBTWVNfU1RBVEVfcmVzdW1lOwo+
ID4gICAgIHJlc3VtZV9ub25ib290X2NwdXM6Cj4gPiArICAgIHJjdV9iYXJyaWVyKCk7Cj4gPiAg
ICAgICBlbmFibGVfbm9uYm9vdF9jcHVzKCk7Cj4gPiAgICAgICB0aGF3X2RvbWFpbnMoKTsKPiA+
ICAgICAgIHN5c3RlbV9zdGF0ZSA9IFNZU19TVEFURV9hY3RpdmU7Cj4gPiAKPiAKPiAtLSAKPiBK
dWxpZW4gR3JhbGwKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
