From: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v5 16/24] hw: acpi: Fix memory hotplug AML
 generation error
Date: Thu, 8 Nov 2018 15:23:41 +0100
Message-ID: <20181108152341.68e5a147@redhat.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
 <20181105014047.26447-17-sameo@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=aooe=nt=redhat.com=imammedo@srs-us1.protection.inumbo.net>)
 id 1gKlDr-0007Uq-7C
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 14:23:51 +0000
In-Reply-To: <20181105014047.26447-17-sameo@linux.intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: Yang Zhong <yang.zhong@intel.com>, Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAgNSBOb3YgMjAxOCAwMjo0MDozOSArMDEwMApTYW11ZWwgT3J0aXogPHNhbWVvQGxp
bnV4LmludGVsLmNvbT4gd3JvdGU6Cgo+IEZyb206IFlhbmcgWmhvbmcgPHlhbmcuemhvbmdAaW50
ZWwuY29tPgo+IAo+IFdoZW4gdXNpbmcgdGhlIGdlbmVyYXRlZCBtZW1vcnkgaG90cGx1ZyBBTUws
IHRoZSBpYXNsCj4gY29tcGlsZXIgd291bGQgZ2l2ZSB0aGUgZm9sbG93aW5nIGVycm9yOgo+IAo+
IGRzZHQuZHNsIDI2NjogUmV0dXJuIChNT1NUIChfVUlELCBBcmcwLCBBcmcxLCBBcmcyKSkKPiBF
cnJvciA2MDgwIC0gQ2FsbGVkIG1ldGhvZCByZXR1cm5zIG5vIHZhbHVlIF4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBZYW5nIFpob25nIDx5YW5nLnpob25nQGludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IEln
b3IgTWFtbWVkb3YgPGltYW1tZWRvQHJlZGhhdC5jb20+CgpJIHN1Z2dlc3QgdG8gcHV0IHRoaXMg
cGF0Y2ggYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUgc2VyaWVzCmJlZm9yZSByZWZlcmVuY2UgdGFi
bGVzIGluIHRlc3QgYXJlIHVwZGF0ZWQuCgo+IC0tLQo+ICBody9hY3BpL21lbW9yeV9ob3RwbHVn
LmMgfCAxMCArKysrKy0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2h3L2FjcGkvbWVtb3J5X2hvdHBsdWcuYyBi
L2h3L2FjcGkvbWVtb3J5X2hvdHBsdWcuYwo+IGluZGV4IGRiMmM0ZGY5NjEuLjg5M2ZjMmJkMjcg
MTAwNjQ0Cj4gLS0tIGEvaHcvYWNwaS9tZW1vcnlfaG90cGx1Zy5jCj4gKysrIGIvaHcvYWNwaS9t
ZW1vcnlfaG90cGx1Zy5jCj4gQEAgLTY4NiwxNSArNjg2LDE1IEBAIHZvaWQgYnVpbGRfbWVtb3J5
X2hvdHBsdWdfYW1sKEFtbCAqdGFibGUsIHVpbnQzMl90IG5yX21lbSwKPiAgCj4gICAgICAgICAg
ICAgIG1ldGhvZCA9IGFtbF9tZXRob2QoIl9PU1QiLCAzLCBBTUxfTk9UU0VSSUFMSVpFRCk7Cj4g
ICAgICAgICAgICAgIHMgPSBNRU1PUllfU0xPVF9PU1RfTUVUSE9EOwo+IC0gICAgICAgICAgICBh
bWxfYXBwZW5kKG1ldGhvZCwgYW1sX3JldHVybihhbWxfY2FsbDQoCj4gLSAgICAgICAgICAgICAg
ICBzLCBhbWxfbmFtZSgiX1VJRCIpLCBhbWxfYXJnKDApLCBhbWxfYXJnKDEpLCBhbWxfYXJnKDIp
Cj4gLSAgICAgICAgICAgICkpKTsKPiArICAgICAgICAgICAgYW1sX2FwcGVuZChtZXRob2QsCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgYW1sX2NhbGw0KHMsIGFtbF9uYW1lKCJfVUlEIiksIGFt
bF9hcmcoMCksCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFtbF9hcmcoMSks
IGFtbF9hcmcoMikpKTsKPiAgICAgICAgICAgICAgYW1sX2FwcGVuZChkZXYsIG1ldGhvZCk7Cj4g
IAo+ICAgICAgICAgICAgICBtZXRob2QgPSBhbWxfbWV0aG9kKCJfRUowIiwgMSwgQU1MX05PVFNF
UklBTElaRUQpOwo+ICAgICAgICAgICAgICBzID0gTUVNT1JZX1NMT1RfRUpFQ1RfTUVUSE9EOwo+
IC0gICAgICAgICAgICBhbWxfYXBwZW5kKG1ldGhvZCwgYW1sX3JldHVybihhbWxfY2FsbDIoCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgcywgYW1sX25hbWUoIl9VSUQiKSwgYW1sX2FyZygwKSkp
KTsKPiArICAgICAgICAgICAgYW1sX2FwcGVuZChtZXRob2QsCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgYW1sX2NhbGwyKHMsIGFtbF9uYW1lKCJfVUlEIiksIGFtbF9hcmcoMCkpKTsKPiAgICAg
ICAgICAgICAgYW1sX2FwcGVuZChkZXYsIG1ldGhvZCk7Cj4gIAo+ICAgICAgICAgICAgICBhbWxf
YXBwZW5kKGRldl9jb250YWluZXIsIGRldik7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
