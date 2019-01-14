From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v5 16/24] hw: acpi: Fix memory hotplug AML
 generation error
Date: Mon, 14 Jan 2019 13:35:37 -0500
Message-ID: <20190114133455-mutt-send-email-mst@kernel.org>
References: <20181105014047.26447-1-sameo@linux.intel.com>
 <20181105014047.26447-17-sameo@linux.intel.com>
 <20181108152341.68e5a147@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Obrf=PW=redhat.com=mst@srs-us1.protection.inumbo.net>)
 id 1gj75N-0002da-Pz
 for xen-devel@lists.xenproject.org; Mon, 14 Jan 2019 18:35:45 +0000
Content-Disposition: inline
In-Reply-To: <20181108152341.68e5a147@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Yang Zhong <yang.zhong@intel.com>, Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMDgsIDIwMTggYXQgMDM6MjM6NDFQTSArMDEwMCwgSWdvciBNYW1tZWRvdiB3
cm90ZToKPiBPbiBNb24sICA1IE5vdiAyMDE4IDAyOjQwOjM5ICswMTAwCj4gU2FtdWVsIE9ydGl6
IDxzYW1lb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+IAo+ID4gRnJvbTogWWFuZyBaaG9uZyA8
eWFuZy56aG9uZ0BpbnRlbC5jb20+Cj4gPiAKPiA+IFdoZW4gdXNpbmcgdGhlIGdlbmVyYXRlZCBt
ZW1vcnkgaG90cGx1ZyBBTUwsIHRoZSBpYXNsCj4gPiBjb21waWxlciB3b3VsZCBnaXZlIHRoZSBm
b2xsb3dpbmcgZXJyb3I6Cj4gPiAKPiA+IGRzZHQuZHNsIDI2NjogUmV0dXJuIChNT1NUIChfVUlE
LCBBcmcwLCBBcmcxLCBBcmcyKSkKPiA+IEVycm9yIDYwODAgLSBDYWxsZWQgbWV0aG9kIHJldHVy
bnMgbm8gdmFsdWUgXgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBZYW5nIFpob25nIDx5YW5nLnpo
b25nQGludGVsLmNvbT4KPiBSZXZpZXdlZC1ieTogSWdvciBNYW1tZWRvdiA8aW1hbW1lZG9AcmVk
aGF0LmNvbT4KPiAKPiBJIHN1Z2dlc3QgdG8gcHV0IHRoaXMgcGF0Y2ggYXQgdGhlIGJlZ2lubmlu
ZyBvZiB0aGUgc2VyaWVzCj4gYmVmb3JlIHJlZmVyZW5jZSB0YWJsZXMgaW4gdGVzdCBhcmUgdXBk
YXRlZC4KClNhbXVlbCBob3cgYWJvdXQgYSBzZXBhcmF0ZSBzbWFsbCBzZXJpZXMgd2l0aCBqdXN0
IGJ1Z2ZpeGVzCmZvciBzdGFydGVycz8KCgo+ID4gLS0tCj4gPiAgaHcvYWNwaS9tZW1vcnlfaG90
cGx1Zy5jIHwgMTAgKysrKystLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KyksIDUgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9ody9hY3BpL21lbW9yeV9o
b3RwbHVnLmMgYi9ody9hY3BpL21lbW9yeV9ob3RwbHVnLmMKPiA+IGluZGV4IGRiMmM0ZGY5NjEu
Ljg5M2ZjMmJkMjcgMTAwNjQ0Cj4gPiAtLS0gYS9ody9hY3BpL21lbW9yeV9ob3RwbHVnLmMKPiA+
ICsrKyBiL2h3L2FjcGkvbWVtb3J5X2hvdHBsdWcuYwo+ID4gQEAgLTY4NiwxNSArNjg2LDE1IEBA
IHZvaWQgYnVpbGRfbWVtb3J5X2hvdHBsdWdfYW1sKEFtbCAqdGFibGUsIHVpbnQzMl90IG5yX21l
bSwKPiA+ICAKPiA+ICAgICAgICAgICAgICBtZXRob2QgPSBhbWxfbWV0aG9kKCJfT1NUIiwgMywg
QU1MX05PVFNFUklBTElaRUQpOwo+ID4gICAgICAgICAgICAgIHMgPSBNRU1PUllfU0xPVF9PU1Rf
TUVUSE9EOwo+ID4gLSAgICAgICAgICAgIGFtbF9hcHBlbmQobWV0aG9kLCBhbWxfcmV0dXJuKGFt
bF9jYWxsNCgKPiA+IC0gICAgICAgICAgICAgICAgcywgYW1sX25hbWUoIl9VSUQiKSwgYW1sX2Fy
ZygwKSwgYW1sX2FyZygxKSwgYW1sX2FyZygyKQo+ID4gLSAgICAgICAgICAgICkpKTsKPiA+ICsg
ICAgICAgICAgICBhbWxfYXBwZW5kKG1ldGhvZCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IGFtbF9jYWxsNChzLCBhbWxfbmFtZSgiX1VJRCIpLCBhbWxfYXJnKDApLAo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGFtbF9hcmcoMSksIGFtbF9hcmcoMikpKTsKPiA+ICAg
ICAgICAgICAgICBhbWxfYXBwZW5kKGRldiwgbWV0aG9kKTsKPiA+ICAKPiA+ICAgICAgICAgICAg
ICBtZXRob2QgPSBhbWxfbWV0aG9kKCJfRUowIiwgMSwgQU1MX05PVFNFUklBTElaRUQpOwo+ID4g
ICAgICAgICAgICAgIHMgPSBNRU1PUllfU0xPVF9FSkVDVF9NRVRIT0Q7Cj4gPiAtICAgICAgICAg
ICAgYW1sX2FwcGVuZChtZXRob2QsIGFtbF9yZXR1cm4oYW1sX2NhbGwyKAo+ID4gLSAgICAgICAg
ICAgICAgICAgICAgICAgcywgYW1sX25hbWUoIl9VSUQiKSwgYW1sX2FyZygwKSkpKTsKPiA+ICsg
ICAgICAgICAgICBhbWxfYXBwZW5kKG1ldGhvZCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IGFtbF9jYWxsMihzLCBhbWxfbmFtZSgiX1VJRCIpLCBhbWxfYXJnKDApKSk7Cj4gPiAgICAgICAg
ICAgICAgYW1sX2FwcGVuZChkZXYsIG1ldGhvZCk7Cj4gPiAgCj4gPiAgICAgICAgICAgICAgYW1s
X2FwcGVuZChkZXZfY29udGFpbmVyLCBkZXYpOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
