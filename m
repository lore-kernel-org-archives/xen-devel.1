From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/3] xen/swiotlb: fix condition for calling
 xen_destroy_contiguous_region()
Date: Thu, 25 Apr 2019 11:03:02 +0200
Message-ID: <32d173a2-4b8c-909e-89fc-68ed9fb2fa02__38539.4529833988$1556183035$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IMsy=S3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hJaHa-0000kL-Bo
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 09:03:06 +0000
References: =?UTF-8?B?PDIwMTkwNDIzMTA1NDU3LjE3NTAy77+9Me+/vWpncm9zc0BzdXNl?=
 =?UTF-8?Q?=2ecom=3e_=3c20190423105457=2e17502-2-jgross=40suse=2ecom=3e_=3c5?=
 =?UTF-8?Q?CC175950200007800228E80=40suse=2ecom=3e?=
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, lkml <linux-kernel@vger.kernel.org>, stable@vger.kernel.org, iommu@lists.linux-foundation.org, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDQvMjAxOSAxMDo1MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjMuMDQuMTkg
YXQgMTI6NTQsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiAtLS0gYS9kcml2ZXJzL3hlbi9z
d2lvdGxiLXhlbi5jCj4+ICsrKyBiL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMKPj4gQEAgLTM2
MCw4ICszNjAsOCBAQCB4ZW5fc3dpb3RsYl9mcmVlX2NvaGVyZW50KHN0cnVjdCBkZXZpY2UgKmh3
ZGV2LCBzaXplX3Qgc2l6ZSwgdm9pZCAqdmFkZHIsCj4+ICAJLyogQ29udmVydCB0aGUgc2l6ZSB0
byBhY3R1YWxseSBhbGxvY2F0ZWQuICovCj4+ICAJc2l6ZSA9IDFVTCA8PCAob3JkZXIgKyBYRU5f
UEFHRV9TSElGVCk7Cj4+ICAKPj4gLQlpZiAoKChkZXZfYWRkciArIHNpemUgLSAxIDw9IGRtYV9t
YXNrKSkgfHwKPj4gLQkgICAgcmFuZ2Vfc3RyYWRkbGVzX3BhZ2VfYm91bmRhcnkocGh5cywgc2l6
ZSkpCj4+ICsJaWYgKChkZXZfYWRkciArIHNpemUgLSAxIDw9IGRtYV9tYXNrKSAmJgo+PiArCSAg
ICAhV0FSTl9PTihyYW5nZV9zdHJhZGRsZXNfcGFnZV9ib3VuZGFyeShwaHlzLCBzaXplKSkpCj4+
ICAJCXhlbl9kZXN0cm95X2NvbnRpZ3VvdXNfcmVnaW9uKHBoeXMsIG9yZGVyKTsKPiAKPiBPbiB0
aGUgYWxsb2NhdGlvbiBzaWRlIHdlIGhhdmUKPiAKPiAJaWYgKCgoZGV2X2FkZHIgKyBzaXplIC0g
MSA8PSBkbWFfbWFzaykpICYmCj4gCSAgICAhcmFuZ2Vfc3RyYWRkbGVzX3BhZ2VfYm91bmRhcnko
cGh5cywgc2l6ZSkpCj4gCQkqZG1hX2hhbmRsZSA9IGRldl9hZGRyOwo+IAllbHNlIHsKPiAJCWlm
ICh4ZW5fY3JlYXRlX2NvbnRpZ3VvdXNfcmVnaW9uKHBoeXMsIG9yZGVyLAo+IAkJCQkJCSBmbHM2
NChkbWFfbWFzayksIGRtYV9oYW5kbGUpICE9IDApIHsKPiAJCQl4ZW5fZnJlZV9jb2hlcmVudF9w
YWdlcyhod2Rldiwgc2l6ZSwgcmV0LCAoZG1hX2FkZHJfdClwaHlzLCBhdHRycyk7Cj4gCQkJcmV0
dXJuIE5VTEw7Cj4gCQl9Cj4gCX0KPiAKPiB3aGljaCBpcyAoYXMgZmFyIGFzIHRoZSBmdW5jdGlv
biBjYWxsIGlzIGNvbmNlcm5lZCkKPiAKPiAJaWYgKChkZXZfYWRkciArIHNpemUgLSAxID4gZG1h
X21hc2spIHx8Cj4gCSAgICByYW5nZV9zdHJhZGRsZXNfcGFnZV9ib3VuZGFyeShwaHlzLCBzaXpl
KSkKPiAJCXhlbl9jcmVhdGVfY29udGlndW91c19yZWdpb24oLi4uKTsKPiAKPiBTbyBJIGRvbid0
IHRoaW5rIHlvdXIgdHJhbnNmb3JtYXRpb24gaXMgY29ycmVjdC4KCkkga25vdyB0aGF0IEkgbW9k
aWZpZWQgdGhlIGNvbmRpdGlvbi4gQ2FsbGluZwp4ZW5fZGVzdHJveV9jb250aWd1b3VzX3JlZ2lv
bigpIGZvciBhIG5vbi1jb250aWd1b3VzIHJlZ2lvbiBpcwpkZXN0cnVjdGl2ZSwgc28gd2UgaGF2
ZSB0byBhdm9pZCBpdCBpbiBhbnkgY2FzZS4KCkkgY291bGQgYmUgdGFsa2VkIGludG8gbW92aW5n
IGJvdGggdGVzdHMgaW50byB0aGUgV0FSTl9PTigpLCBob3dldmVyLgoKCkp1ZXJnZW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
