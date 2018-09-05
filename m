From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 06/13] optee: add domain contexts
Date: Wed, 5 Sep 2018 15:18:37 +0100
Message-ID: <385e6e61-5c03-0715-e4d9-3f19f7d11cdc@citrix.com>
References: <1535993677-20816-1-git-send-email-volodymyr_babchuk@epam.com>
 <1535993677-20816-7-git-send-email-volodymyr_babchuk@epam.com>
 <75f20a4a-60db-8a83-62da-2515b88b0ed9@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <75f20a4a-60db-8a83-62da-2515b88b0ed9@arm.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, xen-devel@lists.xenproject.org, xen-devel@lists.xen.org
Cc: tee-dev@lists.linaro.org, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDkvMTggMTU6MTAsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSwKPgo+IE9uIDA5LzAz
LzIwMTggMDU6NTQgUE0sIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+PiBPUC1URUUgbWVkaXRv
ciBuZWVkcyB0byBzdG9yZSBwZXItZG9tYWluIGNvbnRleHQsIGFzIHdpbGwgYmUgc2Vlbgo+Cj4g
cy9tZWRpdG9yL21lZGlhdG9yLwo+Cj4+IGluIHRoZSBuZXh0IHBhdGNoZXMuIEF0IHRoaXMgbW9t
ZW50IGl0IHN0b3JlcyBvbmx5IHJlZmVyZW5jZSB0byBkb21haW4uCj4+Cj4+IFRoaXMgYWxsb3dz
IHVzIHRvIGZpbHRlciBvdXQgY2FsbHMgZnJvbSBkb21haW5zIHRoYXQgYXJlIG5vdCBhbGxvd2Vk
Cj4+IHRvIHdvcmsgd2l0aCBPUC1URUUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFZvbG9keW15ciBC
YWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4KPj4gLS0tCj4+IMKgIHhlbi9hcmNo
L2FybS90ZWUvb3B0ZWUuYyB8IDY2Cj4+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNjYgaW5zZXJ0aW9ucygrKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3RlZS9vcHRlZS5jIGIveGVuL2FyY2gvYXJt
L3RlZS9vcHRlZS5jCj4+IGluZGV4IDQ4YmZmNWQuLmM4OTVhOTkgMTAwNjQ0Cj4+IC0tLSBhL3hl
bi9hcmNoL2FybS90ZWUvb3B0ZWUuYwo+PiArKysgYi94ZW4vYXJjaC9hcm0vdGVlL29wdGVlLmMK
Pj4gQEAgLTE5LDYgKzE5LDE0IEBACj4+IMKgICNpbmNsdWRlIDxhc20vdGVlL29wdGVlX21zZy5o
Pgo+PiDCoCAjaW5jbHVkZSA8YXNtL3RlZS9vcHRlZV9zbWMuaD4KPj4gwqAgK3N0cnVjdCBkb21h
aW5fY3R4IHsKPgo+IEkgd291bGQgcHJlZmVyIGlmIHRoZSBzdHJ1Y3R1cmUgaGFzIG9wdGVlIGlu
IGl0cyBuYW1lIHN1Y2ggYXMKPiBvcHRlZV9kb21haW4uCj4KPiBXZSBhbHNvIHRlbmQgdG8gYWJi
cmV2aWF0ZSBjb250ZXh0IGluIFhlbiB1c2luZyB0aGUgY3R4dC4KCkknZCBhcmd1ZSB0aGF0ICJj
dHgiIGlzIHRoZSBiZXR0ZXIgd2F5IG9mIGFiYnJldmlhdGluZyBjb250ZXh0LsKgIEl0J3MKZmFy
IG1vcmUgdXN1YWwsIGFuZCBlYXNpZXIgdG8gdHlwZS7CoCAoVGhhdCBzYWlkLCBvcHRlZV9kb21h
aW4gd291bGQgYmUKdGhlIG1vc3QgY29uc2lzdGVudCBuYW1lIHdpdGggdGhlIHJlc3Qgb2YgdGhl
IGNvZGViYXNlIGluIHRoaXMgY2FzZSkKCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
