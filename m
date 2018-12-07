From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: Re: [PATCH v3 1/9] mm: Introduce new vm_insert_range API
Date: Sat, 8 Dec 2018 03:18:49 +0530
Message-ID: <CAFqt6zbuT3mhLCSas=EO38NW+M4KAARKeBpMqDz6xwkVbw=FGA__27993.0584751584$1544219039$gmane$org@mail.gmail.com>
References: <20181206183945.GA20932@jordon-HP-15-Notebook-PC>
 <53bbc095-c9f5-5d6a-6e50-6e060d17eb68@arm.com>
 <20181207171116.GA29923@bombadil.infradead.org>
 <CAFqt6zYCWOK-uS85GqCzcgT=+YKn1nBrRPq+M9y6eJjmXEKH+g@mail.gmail.com>
 <67495f8f-2092-e42d-321e-5216c346513f@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <67495f8f-2092-e42d-321e-5216c346513f@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: robin.murphy@arm.com
Cc: Michal Hocko <mhocko@suse.com>, Heiko Stuebner <heiko@sntech.de>, Peter Zijlstra <peterz@infradead.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Linux-MM <linux-mm@kvack.org>, linux1394-devel@lists.sourceforge.net, Marek Szyprowski <m.szyprowski@samsung.com>, Stephen Rothwell <sfr@canb.auug.org.au>, oleksandr_andrushchenko@epam.com, joro@8bytes.org, Russell King - ARM Linux <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, airlied@linux.ie, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, treding@nvidia.com, linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>, pawel@osciak.com, Rik van Riel <riel@surriel.com>, iommu@lists.linux-foundation.org, rppt@linux.vnet.ibm.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>, mchehab@kernel.org, iamjoonsoo.kim@lge.com, vbabka@suse.cz, Juergen Gross <jgross@suse.>
List-Id: xen-devel@lists.xenproject.org

T24gU2F0LCBEZWMgOCwgMjAxOCBhdCAyOjQwIEFNIFJvYmluIE11cnBoeSA8cm9iaW4ubXVycGh5
QGFybS5jb20+IHdyb3RlOgo+Cj4gT24gMjAxOC0xMi0wNyA3OjI4IHBtLCBTb3VwdGljayBKb2Fy
ZGVyIHdyb3RlOgo+ID4gT24gRnJpLCBEZWMgNywgMjAxOCBhdCAxMDo0MSBQTSBNYXR0aGV3IFdp
bGNveCA8d2lsbHlAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gPj4KPiA+PiBPbiBGcmksIERlYyAw
NywgMjAxOCBhdCAwMzozNDo1NlBNICswMDAwLCBSb2JpbiBNdXJwaHkgd3JvdGU6Cj4gPj4+PiAr
aW50IHZtX2luc2VydF9yYW5nZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQg
bG9uZyBhZGRyLAo+ID4+Pj4gKyAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcGFnZSAqKnBhZ2Vz
LCB1bnNpZ25lZCBsb25nIHBhZ2VfY291bnQpCj4gPj4+PiArewo+ID4+Pj4gKyAgIHVuc2lnbmVk
IGxvbmcgdWFkZHIgPSBhZGRyOwo+ID4+Pj4gKyAgIGludCByZXQgPSAwLCBpOwo+ID4+Pgo+ID4+
PiBTb21lIG9mIHRoZSBzaXRlcyBiZWluZyByZXBsYWNlZCB3ZXJlIGVmZmVjdGl2ZWx5IGVuc3Vy
aW5nIHRoYXQgdm1hIGFuZAo+ID4+PiBwYWdlcyB3ZXJlIG11dHVhbGx5IGNvbXBhdGlibGUgYXMg
YW4gaW5pdGlhbCBjb25kaXRpb24gLSB3b3VsZCBpdCBiZSB3b3J0aAo+ID4+PiBhZGRpbmcgc29t
ZXRoaW5nIGhlcmUgZm9yIHJvYnVzdG5lc3MsIGUuZy46Cj4gPj4+Cj4gPj4+ICsgICAgIGlmIChw
YWdlX2NvdW50ICE9IHZtYV9wYWdlcyh2bWEpKQo+ID4+PiArICAgICAgICAgICAgIHJldHVybiAt
RU5YSU87Cj4gPj4KPiA+PiBJIHRoaW5rIHdlIHdhbnQgdG8gYWxsb3cgdGhpcyB0byBiZSB1c2Vk
IHRvIHBvcHVsYXRlIHBhcnQgb2YgYSBWTUEuCj4gPj4gU28gcGVyaGFwczoKPiA+Pgo+ID4+ICAg
ICAgICAgIGlmIChwYWdlX2NvdW50ID4gdm1hX3BhZ2VzKHZtYSkpCj4gPj4gICAgICAgICAgICAg
ICAgICByZXR1cm4gLUVOWElPOwo+ID4KPiA+IE9rLCBUaGlzIGNhbiBiZSBhZGRlZC4KPiA+Cj4g
PiBJIHRoaW5rIFBhdGNoIFsyLzldIGlzIHRoZSBvbmx5IGxlZnRvdmVyIHBsYWNlIHdoZXJlIHRo
aXMKPiA+IGNoZWNrIGNvdWxkIGJlIHJlbW92ZWQuCj4KPiBSaWdodCwgOS85IGNvdWxkIGFsc28g
aGF2ZSByZWxpZWQgb24gbXkgc3RyaWN0ZXIgY2hlY2sgaGVyZSwgYnV0IHNpbmNlCj4gaXQncyBy
ZWFsbHkgdGVzdGluZyB3aGV0aGVyIGl0IGFjdHVhbGx5IG1hbmFnZWQgdG8gYWxsb2NhdGUgdm1h
X3BhZ2VzKCkKPiB3b3J0aCBvZiBwYWdlcyBlYXJsaWVyLCBNYXR0aGV3J3MgbW9yZSBsZW5pZW50
IHZlcnNpb24gd29uJ3QgaGVscCBmb3IKPiB0aGF0IG9uZS4KCgooV2h5IHByaXZjbWRfYnVmX21t
YXAoKSBkb2Vzbid0IGNsZWFuIHVwIGFuZCByZXR1cm4gYW4gZXJyb3IKPiBhcyBzb29uIGFzIHRo
YXQgYWxsb2NhdGlvbiBsb29wIGZhaWxzLCB3aXRob3V0IHRha2luZyB0aGUgbXV0ZXggdW5kZXIK
PiB3aGljaCBpdCBzdGlsbCBkb2VzIGEgYnVuY2ggbW9yZSBwb2ludGxlc3Mgd29yayB0byBvbmx5
IHVuZG8gaXQgYWdhaW4sCj4gaXMgYSBtaW5kLWJvZ2dsaW5nIG15c3RlcnksIGJ1dCB0aGF0J3Mg
bm90IG91ciBwcm9ibGVtIGhlcmUuLi4pCgpJIHRoaW5rIHNvbWUgY2xlYW4gdXAgY2FuIGJlIGRv
bmUgaGVyZSBpbiBhIHNlcGFyYXRlIHBhdGNoLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
