From: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH 3/3] machine: Use shorter format for
 GlobalProperty arrays
Date: Tue, 8 Jan 2019 11:21:09 +0100
Message-ID: <20190108112109.41a93a75.cohuck@redhat.com>
References: <20190107193020.21744-1-ehabkost@redhat.com>
 <20190107193020.21744-4-ehabkost@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F+WJ=PQ=redhat.com=cohuck@srs-us1.protection.inumbo.net>)
 id 1ggoVe-00024y-4f
 for xen-devel@lists.xenproject.org; Tue, 08 Jan 2019 10:21:22 +0000
In-Reply-To: <20190107193020.21744-4-ehabkost@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, David Gibson <david@gibson.dropbear.id.au>, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAgNyBKYW4gMjAxOSAxNzozMDoyMCAtMDIwMApFZHVhcmRvIEhhYmtvc3QgPGVoYWJr
b3N0QHJlZGhhdC5jb20+IHdyb3RlOgoKPiBJbnN0ZWFkIG9mIHZlcmJvc2UgYXJyYXlzIHdpdGgg
NCBsaW5lcyBmb3IgZWFjaCBlbnRyeSwgbWFrZSBlYWNoCj4gZW50cnkgdGFrZSBvbmx5IG9uZSBs
aW5lLiAgVGhpcyBtYWtlcyBsb25nIGFycmF5cyB0aGF0IGNvdWxkbid0Cj4gZml0IGluIHRoZSBz
Y3JlZW4gYmVjb21lIHNob3J0IGFuZCByZWFkYWJsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBFZHVh
cmRvIEhhYmtvc3QgPGVoYWJrb3N0QHJlZGhhdC5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvaHcvaTM4
Ni9wYy5oICAgICAgIHwgIDE4ICstCj4gIGh3L2NvcmUvbWFjaGluZS5jICAgICAgICAgIHwgMzM4
ICsrKystLS0tLS0tLS0tLS0tCj4gIGh3L2kzODYvcGMuYyAgICAgICAgICAgICAgIHwgNzIwICsr
KysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgaHcvaTM4Ni9wY19waWl4LmMg
ICAgICAgICAgfCAxOTIgKystLS0tLS0tLQo+ICBody9wcGMvc3BhcHIuYyAgICAgICAgICAgICB8
ICA3MiArLS0tCj4gIGh3L3MzOTB4L3MzOTAtdmlydGlvLWNjdy5jIHwgIDc1ICstLS0KPiAgaHcv
eGVuL3hlbi1jb21tb24uYyAgICAgICAgfCAgMTggKy0KPiAgNyBmaWxlcyBjaGFuZ2VkLCAyNjUg
aW5zZXJ0aW9ucygrKSwgMTE2OCBkZWxldGlvbnMoLSkKPiAKCiguLi4pCgo+IGRpZmYgLS1naXQg
YS9ody9zMzkweC9zMzkwLXZpcnRpby1jY3cuYyBiL2h3L3MzOTB4L3MzOTAtdmlydGlvLWNjdy5j
Cj4gaW5kZXggYzczNzUwNzA1My4uODExZmRmOTEzZCAxMDA2NDQKPiAtLS0gYS9ody9zMzkweC9z
MzkwLXZpcnRpby1jY3cuYwo+ICsrKyBiL2h3L3MzOTB4L3MzOTAtdmlydGlvLWNjdy5jCgooLi4u
KQoKPiBAQCAtODEwLDE1ICs3OTgsOCBAQCBzdGF0aWMgdm9pZCBjY3dfbWFjaGluZV8yXzZfY2xh
c3Nfb3B0aW9ucyhNYWNoaW5lQ2xhc3MgKm1jKQo+ICB7Cj4gICAgICBTMzkwQ2N3TWFjaGluZUNs
YXNzICpzMzkwbWMgPSBTMzkwX01BQ0hJTkVfQ0xBU1MobWMpOwo+ICAgICAgc3RhdGljIEdsb2Jh
bFByb3BlcnR5IGNvbXBhdFtdID0gewo+IC0gICAgICAgIHsKPiAtICAgICAgICAgICAgLmRyaXZl
ciAgID0gVFlQRV9TMzkwX0lQTCwKPiAtICAgICAgICAgICAgLnByb3BlcnR5ID0gImlwbGJleHRf
bWlncmF0aW9uIiwKPiAtICAgICAgICAgICAgLnZhbHVlICAgID0gIm9mZiIsCj4gLSAgICAgICAg
fSwgewo+IC0gICAgICAgICAgICAuZHJpdmVyICAgPSBUWVBFX1ZJUlRVQUxfQ1NTX0JSSURHRSwK
PiAtICAgICAgICAgICAgLnByb3BlcnR5ID0gImNzc19kZXZfcGF0aCIsCj4gLSAgICAgICAgICAg
IC52YWx1ZSAgICA9ICJvZmYiLAo+IC0gICAgICAgIH0sCj4gKyAgICAgICAgeyBUWVBFX1MzOTBf
SVBMLCAiaXBsYmV4dF9taWdyYXRpb24iLCAib2ZmIiwgfSwKPiArICAgICAgICAgeyBUWVBFX1ZJ
UlRVQUxfQ1NTX0JSSURHRSwgImNzc19kZXZfcGF0aCIsICJvZmYiLCB9LAoKVGhlIGluZGVudGF0
aW9uIGxvb2tzIG9mZiBoZXJlLgoKPiAgICAgIH07Cj4gIAo+ICAgICAgczM5MG1jLT5yaV9hbGxv
d2VkID0gZmFsc2U7CgooLi4uKQoKV2l0aCBvciB3aXRob3V0IGFsaWdubWVudDoKClJldmlld2Vk
LWJ5OiBDb3JuZWxpYSBIdWNrIDxjb2h1Y2tAcmVkaGF0LmNvbT4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
