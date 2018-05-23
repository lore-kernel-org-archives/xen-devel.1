From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 03/13] xen/arm: setup: Check errata for boot
 CPU later on
Date: Wed, 23 May 2018 14:34:42 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1805231434360.15101@sstabellini-ThinkPad-X260>
References: <20180522174254.27551-1-julien.grall@arm.com>
 <20180522174254.27551-4-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=oc3e=ik=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fLbPC-0008P3-BX
 for xen-devel@lists.xenproject.org; Wed, 23 May 2018 21:34:46 +0000
In-Reply-To: <20180522174254.27551-4-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, andre.przywara@arm.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAyMiBNYXkgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFNvbWUgZXJyYXRhIHdp
bGwgcmVseSBvbiB0aGUgU01DQ0MgdmVyc2lvbiB3aGljaCBpcyBkZXRlY3RlZCBieQo+IHBzY2lf
aW5pdCgpLgo+IAo+IFRoaXMgaXMgcGFydCBvZiBYU0EtMjYzLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpSZXZpZXdlZC1ieTogU3RlZmFu
byBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKPiAtLS0KPiAgeGVuL2FyY2gv
YXJtL3NldHVwLmMgfCA4ICsrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9zZXR1cC5j
IGIveGVuL2FyY2gvYXJtL3NldHVwLmMKPiBpbmRleCAxZDZmNmJmMzdlLi5hYzkzZGU0Nzg2IDEw
MDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9zZXR1cC5jCj4gKysrIGIveGVuL2FyY2gvYXJtL3Nl
dHVwLmMKPiBAQCAtMTcxLDggKzE3MSw2IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBwcm9jZXNzb3Jf
aWQodm9pZCkKPiAgICAgIH0KPiAgCj4gICAgICBwcm9jZXNzb3Jfc2V0dXAoKTsKPiAtCj4gLSAg
ICBjaGVja19sb2NhbF9jcHVfZXJyYXRhKCk7Cj4gIH0KPiAgCj4gIHZvaWQgZHRfdW5yZXNlcnZl
ZF9yZWdpb25zKHBhZGRyX3QgcywgcGFkZHJfdCBlLAo+IEBAIC03NzksNiArNzc3LDEyIEBAIHZv
aWQgX19pbml0IHN0YXJ0X3hlbih1bnNpZ25lZCBsb25nIGJvb3RfcGh5c19vZmZzZXQsCj4gICAg
ICBwcmludGsoWEVOTE9HX0lORk8gIlNNUDogQWxsb3dpbmcgJXUgQ1BVc1xuIiwgY3B1cyk7Cj4g
ICAgICBucl9jcHVfaWRzID0gY3B1czsKPiAgCj4gKyAgICAvKgo+ICsgICAgICogU29tZSBlcnJh
dGEgcmVsaWVzIG9uIFNNQ0NDIHZlcnNpb24gd2hpY2ggaXMgZGV0ZWN0ZWQgYnkgcHNjaV9pbml0
KCkKPiArICAgICAqIChjYWxsZWQgZnJvbSBzbXBfaW5pdF9jcHVzKCkpLgo+ICsgICAgICovCj4g
KyAgICBjaGVja19sb2NhbF9jcHVfZXJyYXRhKCk7Cj4gKwo+ICAgICAgaW5pdF94ZW5fdGltZSgp
Owo+ICAKPiAgICAgIGdpY19pbml0KCk7Cj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
