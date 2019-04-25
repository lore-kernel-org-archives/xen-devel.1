From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/3] xen/swiotlb: fix condition for calling
 xen_destroy_contiguous_region()
Date: Thu, 25 Apr 2019 10:55:33 +0200
Message-ID: <38c2907c-2749-e66c-1279-7d74bc20bc35__12773.438314774$1556182587$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IMsy=S3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hJaAL-0008Gz-Lz
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 08:55:37 +0000
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
IHRoaW5rIHlvdXIgdHJhbnNmb3JtYXRpb24gaXMgY29ycmVjdC4gRXZlbiB3b3JzZSwgYm90aAo+
IHBhcnRzIG9mIHRoZSBjb25kaXRpb24gaW4geGVuX3N3aW90bGJfZnJlZV9jb2hlcmVudCgpIGFj
dCBvbiBhbgo+IGFkZHJlc3MgdGhhdCBpcyB0aGUgX3Jlc3VsdF8gb2YgdGhlIHByaW9yCj4geGVu
X2NyZWF0ZV9jb250aWd1b3VzX3JlZ2lvbigpLCBpLmUuIHRoZSBhZGRyZXNzIHNob3VsZCBhbHdh
eXMKPiBtYXRjaCBfYm90aF8gY3JpdGVyaWEgYW55d2F5LiBXaGVyZWFzIHdoYXQgeW91IHJlYWxs
eSB3YW50IGlzCj4gdW5kbyB0aGUgeGVuX2NyZWF0ZV9jb250aWd1b3VzX3JlZ2lvbigpIG9ubHkg
d2hlbiBpdCBhY3R1YWxseQo+IHdhcyBjYWxsZWQuIE90aGVyd2lzZSB5b3UgYWxzbyBzaGF0dGVy
IGNvbnRpZ3VvdXMgYWxsb2NhdGlvbnMKPiB0aGF0IHdlcmUgY29udGlndW91cyBhbHJlYWR5IGZv
ciBvdGhlciByZWFzb25zIChwZXJoYXBzIGp1c3QKPiBsdWNrKS4KClllcywgdGhhdCBpcyB3aGF0
IHBhdGNoIDMgZG9lcy4KCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
