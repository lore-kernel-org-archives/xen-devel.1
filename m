From: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v5 18/24] hw: i386: Export the
 MADT build method
Date: Fri, 16 Nov 2018 10:27:35 +0100
Message-ID: <20181116102735.7e506760__9169.66726440496$1542360467$gmane$org@redhat.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
 <20181105014047.26447-19-sameo@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h+8c=N3=redhat.com=imammedo@srs-us1.protection.inumbo.net>)
 id 1gNaPi-0003b4-1J
 for xen-devel@lists.xenproject.org; Fri, 16 Nov 2018 09:27:46 +0000
In-Reply-To: <20181105014047.26447-19-sameo@linux.intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org, xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAgNSBOb3YgMjAxOCAwMjo0MDo0MSArMDEwMApTYW11ZWwgT3J0aXogPHNhbWVvQGxp
bnV4LmludGVsLmNvbT4gd3JvdGU6Cgo+IEl0IGlzIGdvaW5nIHRvIGJlIHVzZWQgYnkgdGhlIFBD
IG1hY2hpbmUgdHlwZSBhcyB0aGUgTUFEVCB0YWJsZSBidWlsZGVyCj4gbWV0aG9kIGFuZCB0aHVz
IG5lZWRzIHRvIGJlIGV4cG9ydGVkIG91dHNpZGUgb2YgYWNwaS1idWlsZC5jCj4gCj4gQWxzbywg
bm93IHRoYXQgdGhlIGdlbmVyaWMgYnVpbGRfbWFkdCgpIEFQSSBpcyBleHBvcnRlZCwgd2UgaGF2
ZSB0bwo+IHJlbmFtZSB0aGUgQVJNIHN0YXRpYyBvbmUgaW4gb3JkZXIgdG8gYXZvaWQgYnVpbGQg
dGltZSBjb25mbGljdHMuCj4gCj4gUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOp
IDxwaGlsbWRAcmVkaGF0LmNvbT4KPiBUZXN0ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOp
IDxwaGlsbWRAcmVkaGF0LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgT3J0aXogPHNhbWVv
QGxpbnV4LmludGVsLmNvbT4KPiAtLS0KPiAgaW5jbHVkZS9ody9pMzg2L2FjcGkuaCAgIHwgMjgg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBody9hcm0vdmlydC1hY3BpLWJ1aWxkLmMg
fCAgNCArKy0tCj4gIGh3L2kzODYvYWNwaS1idWlsZC5jICAgICB8ICA0ICsrLS0KPiAgMyBmaWxl
cyBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgaW5jbHVkZS9ody9pMzg2L2FjcGkuaAo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2h3L2kzODYvYWNwaS5oIGIvaW5jbHVkZS9ody9pMzg2L2FjcGkuaAo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uYjdhODg3MTExZAo+IC0tLSAvZGV2L251bGwKPiAr
KysgYi9pbmNsdWRlL2h3L2kzODYvYWNwaS5oClsuLi5dCgo+ICsvKiBBQ1BJIE1BRFQgKE11bHRp
cGxlIEFQSUMgRGVzY3JpcHRpb24gVGFibGUpIGJ1aWxkIG1ldGhvZCAqLwo+ICt2b2lkIGJ1aWxk
X21hZHQoR0FycmF5ICp0YWJsZV9kYXRhLCBCSU9TTGlua2VyICpsaW5rZXIsCj4gKyAgICAgICAg
ICAgICAgICBNYWNoaW5lU3RhdGUgKm1zLCBBY3BpQ29uZmlndXJhdGlvbiAqY29uZik7Cj4gKwo+
ICsjZW5kaWYKPiBkaWZmIC0tZ2l0IGEvaHcvYXJtL3ZpcnQtYWNwaS1idWlsZC5jIGIvaHcvYXJt
L3ZpcnQtYWNwaS1idWlsZC5jCj4gaW5kZXggYjVlMTY1NTQzYS4uYjAzNTRjNWYwMyAxMDA2NDQK
PiAtLS0gYS9ody9hcm0vdmlydC1hY3BpLWJ1aWxkLmMKPiArKysgYi9ody9hcm0vdmlydC1hY3Bp
LWJ1aWxkLmMKPiBAQCAtNTY0LDcgKzU2NCw3IEBAIGJ1aWxkX2d0ZHQoR0FycmF5ICp0YWJsZV9k
YXRhLCBCSU9TTGlua2VyICpsaW5rZXIsIFZpcnRNYWNoaW5lU3RhdGUgKnZtcykKPiAgCj4gIC8q
IE1BRFQgKi8KPiAgc3RhdGljIHZvaWQKPiAtYnVpbGRfbWFkdChHQXJyYXkgKnRhYmxlX2RhdGEs
IEJJT1NMaW5rZXIgKmxpbmtlciwgVmlydE1hY2hpbmVTdGF0ZSAqdm1zKQo+ICt2aXJ0X2J1aWxk
X21hZHQoR0FycmF5ICp0YWJsZV9kYXRhLCBCSU9TTGlua2VyICpsaW5rZXIsIFZpcnRNYWNoaW5l
U3RhdGUgKnZtcykKPiAgewpZb3UgYXJlIG1vdmluZyBidWlsZF9tYWR0KCkgaW50byB4ODYgc3Bl
Y2lmaWMgaGVhZGVyIGkzODYvYWNwaS5oCnNvIHF1ZXN0aW9uIGlzIHdoeSBkbyB5b3UgdG91Y2gg
QVJNIHZhcmlhbnQgYXQgYWxsPwoKWy4uLl0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
