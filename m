From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] xen/pirq: fix error path cleanup when
	binding MSIs
Date: Wed, 28 Feb 2018 09:57:36 -0500
Message-ID: <a4e23dd6-a013-772f-3167-cf4fd92c21e7__38404.0635465228$1519829717$gmane$org@oracle.com>
References: <20180228091903.99889-1-roger.pau@citrix.com>
 <1519809769.4965.26.camel@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ivaa=fw=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1er39b-0006dO-KX
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2018 14:56:23 +0000
In-Reply-To: <1519809769.4965.26.camel@amazon.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Shah, Amit" <aams@amazon.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Cc: "jgross@suse.com" <jgross@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjgvMjAxOCAwNDoyMiBBTSwgU2hhaCwgQW1pdCB3cm90ZToKPiBPbiBNaSwgMjAxOC0w
Mi0yOCBhdCAwOToxOSArMDAwMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+PiBDdXJyZW50IGNs
ZWFudXAgaW4gdGhlIGVycm9yIHBhdGggb2YgeGVuX2JpbmRfcGlycV9tc2lfdG9faXJxIGlzCj4+
IHdyb25nLiBGaXJzdCBvZiBhbGwgdGhlcmUncyBhbiBvZmYtYnktb25lIGluIHRoZSBjbGVhbnVw
IGxvb3AsIHdoaWNoCj4+IGNhbiBsZWFkIHRvIHVuYmluZGluZyB3cm9uZyBJUlFzLgo+Pgo+PiBT
ZWNvbmRseSBJUlFzIG5vdCBib3VuZCB3b24ndCBiZSBmcmVlZCwgdGh1cyBsZWFraW5nIElSUSBu
dW1iZXJzLgo+Pgo+PiBOb3RlIHRoYXQgdGhlcmUncyBubyBuZWVkIHRvIGRpZmZlcmVudGlhdGUg
YmV0d2VlbiBib3VuZCBhbmQgdW5ib3VuZAo+PiBJUlFzIHdoZW4gZnJlZWluZyB0aGVtLCBfX3Vu
YmluZF9mcm9tX2lycSB3aWxsIGRlYWwgd2l0aCBib3RoIG9mIHRoZW0KPj4gY29ycmVjdGx5Lgo+
Pgo+PiBGaXhlczogNDg5MmM5YjRhZGE5ZjkgKCJ4ZW46IGFkZCBzdXBwb3J0IGZvciBNU0kgbWVz
c2FnZSBncm91cHMiKQo+PiBSZXBvcnRlZC1ieTogSG9vbWFuIE1pcmhhZGkgPG1pcmhhZGloQGFt
YXpvbi5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPgo+PiAtLS0KPj4gQ2M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5
QG9yYWNsZS5jb20+Cj4+IENjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+IENj
OiBBbWl0IFNoYWggPGFhbXNAYW1hem9uLmNvbT4KPj4gQ0M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmcKPj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+PiAtLS0KPj4gwqBkcml2
ZXJzL3hlbi9ldmVudHMvZXZlbnRzX2Jhc2UuYyB8IDQgKystLQo+PiDCoDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3hlbi9ldmVudHMvZXZlbnRzX2Jhc2UuYwo+PiBiL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVu
dHNfYmFzZS5jCj4+IGluZGV4IGIyNDFiZmE1MjljZS4uMTU5ZmFmMTI2OWZiIDEwMDY0NAo+PiAt
LS0gYS9kcml2ZXJzL3hlbi9ldmVudHMvZXZlbnRzX2Jhc2UuYwo+PiArKysgYi9kcml2ZXJzL3hl
bi9ldmVudHMvZXZlbnRzX2Jhc2UuYwo+PiBAQCAtNzYzLDggKzc2Myw4IEBAIGludCB4ZW5fYmlu
ZF9waXJxX21zaV90b19pcnEoc3RydWN0IHBjaV9kZXYgKmRldiwKPj4gc3RydWN0IG1zaV9kZXNj
ICptc2lkZXNjLAo+PiDCoAltdXRleF91bmxvY2soJmlycV9tYXBwaW5nX3VwZGF0ZV9sb2NrKTsK
Pj4gwqAJcmV0dXJuIGlycTsKPj4gwqBlcnJvcl9pcnE6Cj4+IC0JZm9yICg7IGkgPj0gMDsgaS0t
KQo+PiAtCQlfX3VuYmluZF9mcm9tX2lycShpcnEgKyBpKTsKPj4gKwl3aGlsZSAobnZlYy0tKQo+
PiArCQlfX3VuYmluZF9mcm9tX2lycShpcnEgKyBudmVjKTsKPj4gwqAJbXV0ZXhfdW5sb2NrKCZp
cnFfbWFwcGluZ191cGRhdGVfbG9jayk7Cj4+IMKgCXJldHVybiByZXQ7Cj4+IMKgfQo+IFJldmll
d2VkLWJ5OiBBbWl0IFNoYWggPGFhbXNAYW1hem9uLmNvbT4KClJldmlld2VkLWJ5OiBCb3JpcyBP
c3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
