From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v3 1/9] mm: Introduce new vm_insert_range API
Date: Fri, 7 Dec 2018 21:10:00 +0000
Message-ID: <67495f8f-2092-e42d-321e-5216c346513f__48208.355488214$1544217025$gmane$org@arm.com>
References: <20181206183945.GA20932@jordon-HP-15-Notebook-PC>
 <53bbc095-c9f5-5d6a-6e50-6e060d17eb68@arm.com>
 <20181207171116.GA29923@bombadil.infradead.org>
 <CAFqt6zYCWOK-uS85GqCzcgT=+YKn1nBrRPq+M9y6eJjmXEKH+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAFqt6zYCWOK-uS85GqCzcgT=+YKn1nBrRPq+M9y6eJjmXEKH+g@mail.gmail.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Souptick Joarder <jrdr.linux@gmail.com>, Matthew Wilcox <willy@infradead.org>
Cc: Michal Hocko <mhocko@suse.com>, Heiko Stuebner <heiko@sntech.de>, Peter Zijlstra <peterz@infradead.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Linux-MM <linux-mm@kvack.org>, linux1394-devel@lists.sourceforge.net, Marek Szyprowski <m.szyprowski@samsung.com>, Stephen Rothwell <sfr@canb.auug.org.au>, oleksandr_andrushchenko@epam.com, joro@8bytes.org, Russell King - ARM Linux <linux@armlinux.org.uk>, iommu@lists.linux-foundation.org, airlied@linux.ie, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, treding@nvidia.com, linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>, pawel@osciak.com, Rik van Riel <riel@surriel.com>, rppt@linux.vnet.ibm.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>, mchehab@kernel.org, iamjoonsoo.kim@lge.com, vbabka@suse.cz, Juergen Gross <jgross@suse.com>, hjc@rock-chips.com, xen-devel@li
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOC0xMi0wNyA3OjI4IHBtLCBTb3VwdGljayBKb2FyZGVyIHdyb3RlOgo+IE9uIEZyaSwg
RGVjIDcsIDIwMTggYXQgMTA6NDEgUE0gTWF0dGhldyBXaWxjb3ggPHdpbGx5QGluZnJhZGVhZC5v
cmc+IHdyb3RlOgo+Pgo+PiBPbiBGcmksIERlYyAwNywgMjAxOCBhdCAwMzozNDo1NlBNICswMDAw
LCBSb2JpbiBNdXJwaHkgd3JvdGU6Cj4+Pj4gK2ludCB2bV9pbnNlcnRfcmFuZ2Uoc3RydWN0IHZt
X2FyZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgYWRkciwKPj4+PiArICAgICAgICAgICAg
ICAgICAgIHN0cnVjdCBwYWdlICoqcGFnZXMsIHVuc2lnbmVkIGxvbmcgcGFnZV9jb3VudCkKPj4+
PiArewo+Pj4+ICsgICB1bnNpZ25lZCBsb25nIHVhZGRyID0gYWRkcjsKPj4+PiArICAgaW50IHJl
dCA9IDAsIGk7Cj4+Pgo+Pj4gU29tZSBvZiB0aGUgc2l0ZXMgYmVpbmcgcmVwbGFjZWQgd2VyZSBl
ZmZlY3RpdmVseSBlbnN1cmluZyB0aGF0IHZtYSBhbmQKPj4+IHBhZ2VzIHdlcmUgbXV0dWFsbHkg
Y29tcGF0aWJsZSBhcyBhbiBpbml0aWFsIGNvbmRpdGlvbiAtIHdvdWxkIGl0IGJlIHdvcnRoCj4+
PiBhZGRpbmcgc29tZXRoaW5nIGhlcmUgZm9yIHJvYnVzdG5lc3MsIGUuZy46Cj4+Pgo+Pj4gKyAg
ICAgaWYgKHBhZ2VfY291bnQgIT0gdm1hX3BhZ2VzKHZtYSkpCj4+PiArICAgICAgICAgICAgIHJl
dHVybiAtRU5YSU87Cj4+Cj4+IEkgdGhpbmsgd2Ugd2FudCB0byBhbGxvdyB0aGlzIHRvIGJlIHVz
ZWQgdG8gcG9wdWxhdGUgcGFydCBvZiBhIFZNQS4KPj4gU28gcGVyaGFwczoKPj4KPj4gICAgICAg
ICAgaWYgKHBhZ2VfY291bnQgPiB2bWFfcGFnZXModm1hKSkKPj4gICAgICAgICAgICAgICAgICBy
ZXR1cm4gLUVOWElPOwo+IAo+IE9rLCBUaGlzIGNhbiBiZSBhZGRlZC4KPiAKPiBJIHRoaW5rIFBh
dGNoIFsyLzldIGlzIHRoZSBvbmx5IGxlZnRvdmVyIHBsYWNlIHdoZXJlIHRoaXMKPiBjaGVjayBj
b3VsZCBiZSByZW1vdmVkLgoKUmlnaHQsIDkvOSBjb3VsZCBhbHNvIGhhdmUgcmVsaWVkIG9uIG15
IHN0cmljdGVyIGNoZWNrIGhlcmUsIGJ1dCBzaW5jZSAKaXQncyByZWFsbHkgdGVzdGluZyB3aGV0
aGVyIGl0IGFjdHVhbGx5IG1hbmFnZWQgdG8gYWxsb2NhdGUgdm1hX3BhZ2VzKCkgCndvcnRoIG9m
IHBhZ2VzIGVhcmxpZXIsIE1hdHRoZXcncyBtb3JlIGxlbmllbnQgdmVyc2lvbiB3b24ndCBoZWxw
IGZvciAKdGhhdCBvbmUuIChXaHkgcHJpdmNtZF9idWZfbW1hcCgpIGRvZXNuJ3QgY2xlYW4gdXAg
YW5kIHJldHVybiBhbiBlcnJvciAKYXMgc29vbiBhcyB0aGF0IGFsbG9jYXRpb24gbG9vcCBmYWls
cywgd2l0aG91dCB0YWtpbmcgdGhlIG11dGV4IHVuZGVyIAp3aGljaCBpdCBzdGlsbCBkb2VzIGEg
YnVuY2ggbW9yZSBwb2ludGxlc3Mgd29yayB0byBvbmx5IHVuZG8gaXQgYWdhaW4sIAppcyBhIG1p
bmQtYm9nZ2xpbmcgbXlzdGVyeSwgYnV0IHRoYXQncyBub3Qgb3VyIHByb2JsZW0gaGVyZS4uLikK
ClJvYmluLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
