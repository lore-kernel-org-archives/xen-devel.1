From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 1/9] mm: Introduce new vm_insert_range API
Date: Fri, 16 Nov 2018 08:59:28 -0800
Message-ID: <b54491c4-c119-6e83-93ae-d0df7fc165a1__18710.5112629526$1542387543$gmane$org@infradead.org>
References: <20181115154530.GA27872@jordon-HP-15-Notebook-PC>
 <9655a12e-bd3d-aca2-6155-38924028eb5d@infradead.org>
 <CAFqt6zbLjtDab3Bz67trbnQRQdutvgA=YvAFhoW4bxsg657mGQ@mail.gmail.com>
 <20181116064049.GA5320@bombadil.infradead.org>
 <CAFqt6zbL1tu4VWtZ5Wz-BgbOS+M2GJziMj958_h_ri4Th3n9bQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAFqt6zbL1tu4VWtZ5Wz-BgbOS+M2GJziMj958_h_ri4Th3n9bQ@mail.gmail.com>
Content-Language: en-US
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

T24gMTEvMTYvMTggMTI6MTUgQU0sIFNvdXB0aWNrIEpvYXJkZXIgd3JvdGU6Cj4gT24gRnJpLCBO
b3YgMTYsIDIwMTggYXQgMTI6MTEgUE0gTWF0dGhldyBXaWxjb3ggPHdpbGx5QGluZnJhZGVhZC5v
cmc+IHdyb3RlOgo+Pgo+PiBPbiBGcmksIE5vdiAxNiwgMjAxOCBhdCAxMTowMDozMEFNICswNTMw
LCBTb3VwdGljayBKb2FyZGVyIHdyb3RlOgo+Pj4gT24gVGh1LCBOb3YgMTUsIDIwMTggYXQgMTE6
NDQgUE0gUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+IHdyb3RlOgo+Pj4+IE9u
IDExLzE1LzE4IDc6NDUgQU0sIFNvdXB0aWNrIEpvYXJkZXIgd3JvdGU6Cj4+Pj4gV2hhdCBpcyB0
aGUgb3Bwb3NpdGUgb2Ygdm1faW5zZXJ0X3JhbmdlKCkgb3IgZXZlbiBvZiB2bV9pbnNlcnRfcGFn
ZSgpPwo+Pj4+IG9yIGlzIHRoZXJlIG5vIG5lZWQgZm9yIHRoYXQ/Cj4+Pgo+Pj4gVGhlcmUgaXMg
bm8gb3Bwb3NpdGUgZnVuY3Rpb24gb2Ygdm1faW5zZXJ0X3JhbmdlKCkgLyB2bV9pbnNlcnRfcGFn
ZSgpLgo+Pj4gTXkgdW5kZXJzdGFuZGluZyBpcywgaW4gY2FzZSBvZiBhbnkgZXJyb3IsIG1tYXAg
aGFuZGxlcnMgd2lsbCByZXR1cm4gdGhlCj4+PiBlcnIgdG8gdXNlciBwcm9jZXNzIGFuZCB1c2Vy
IHNwYWNlIHdpbGwgZGVjaWRlIHRoZSBuZXh0IGFjdGlvbi4gU28gbmV4dAo+Pj4gdGltZSB3aGVu
IG1tYXAgaGFuZGxlciBpcyBnZXR0aW5nIGludm9rZWQgaXQgd2lsbCBtYXAgZnJvbSB0aGUgYmVn
aW5uaW5nLgo+Pj4gQ29ycmVjdCBtZSBpZiBJIGFtIHdyb25nLgo+Pgo+PiBUaGUgb3Bwb3NpdGUg
ZnVuY3Rpb24sIEkgc3VwcG9zZSwgaXMgdW5tYXBfcmVnaW9uKCkuCj4+Cj4+Pj4gcy9uby4vbnVt
YmVyLwo+Pj4KPj4+IEkgZGlkbid0IGdldCBpdCA/Pwo+Pgo+PiBUaGlzIGlzIGEgJ3NlZCcgZXhw
cmVzc2lvbi4gICdzJyBpcyB0aGUgJ3N1YnN0aXR1dGUnIGNvbW1hbmQ7IHRoZSAvCj4+IGlzIGEg
c2VwYXJhdG9yLCAnbm8uJyBpcyB3aGF0IHlvdSB3cm90ZSwgYW5kICdudW1iZXInIGlzIHdoYXQg
UmFuZHkKPj4gaXMgcmVjb21tZW5kaW5nIGluc3RlYWQuCj4gCj4gT2suIFdpbGwgY2hhbmdlIGl0
IGluIHYyLgoKVGhhbmtzLgoKPj4+Pj4gKyAgICAgZm9yIChpID0gMDsgaSA8IHBhZ2VfY291bnQ7
IGkrKykgewo+Pj4+PiArICAgICAgICAgICAgIHJldCA9IHZtX2luc2VydF9wYWdlKHZtYSwgdWFk
ZHIsIHBhZ2VzW2ldKTsKPj4+Pj4gKyAgICAgICAgICAgICBpZiAocmV0IDwgMCkKPj4+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4+Pj4KPj4+PiBGb3IgYSBub24tdHJpdmlh
bCB2YWx1ZSBvZiBwYWdlX2NvdW50Ogo+Pj4+IElzIGl0IGEgcHJvYmxlbSBpZiB2bV9pbnNlcnRf
cGFnZSgpIHN1Y2NlZWRzIGZvciBzZXZlcmFsIHBhZ2VzCj4+Pj4gYW5kIHRoZW4gZmFpbHM/Cj4+
Pgo+Pj4gTm8sIGl0IHdpbGwgYmUgY29uc2lkZXJlZCBhcyB0b3RhbCBmYWlsdXJlIGFuZCBtbWFw
IGhhbmRsZXIgd2lsbCByZXR1cm4KPj4+IHRoZSBlcnIgdG8gdXNlciBzcGFjZS4KPj4KPj4gSSB0
aGluayB3aGF0IFJhbmR5IG1lYW5zIGlzICJXaGF0IGhhcHBlbnMgdG8gdGhlIGluc2VydGVkIHBh
Z2VzPyIgYW5kCj4+IHRoZSBhbnN3ZXIgaXMgdGhhdCBtbWFwX3JlZ2lvbigpIGp1bXBzIHRvIHRo
ZSAndW5tYXBfYW5kX2ZyZWVfdm1hJwo+PiBsYWJlbCwgd2hpY2ggaXMgYW4gYWNjdXJhdGUgbmFt
ZS4KCndoaWNoIHNheXM6CgoJLyogVW5kbyBhbnkgcGFydGlhbCBtYXBwaW5nIGRvbmUgYnkgYSBk
ZXZpY2UgZHJpdmVyLiAqLwoJdW5tYXBfcmVnaW9uKG1tLCB2bWEsIHByZXYsIHZtYS0+dm1fc3Rh
cnQsIHZtYS0+dm1fZW5kKTsKCmFuZCB0aGF0IGlzIHdoYXQgSSB3YXMgbWlzc2luZy4gIFRoYW5r
cy4KCj4gU29ycnkgZm9yIGluY29ycmVjdCB1bmRlcnN0YW5kaW5nIG9mIHRoZSBxdWVzdGlvbi4K
Ck5vIHByb2JsZW0uCgoKLS0gCn5SYW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
