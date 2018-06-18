From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v4 5/9] xen/gntdev: Allow mappings for DMA
 buffers
Date: Mon, 18 Jun 2018 09:17:08 +0300
Message-ID: <b78ab715-f117-77d3-d54e-8a078b8319e7__41250.0530052513$1529302572$gmane$org@epam.com>
References: <20180615062753.9229-1-andr2000@gmail.com>
 <20180615062753.9229-6-andr2000@gmail.com>
 <e892748a-c268-9622-e568-4c361366bce1@epam.com>
 <b9c3f740-dea1-638b-49d9-60cf5880619d@suse.com>
 <38f10738-63b6-89ce-07a8-7791b2a7e4dc@epam.com>
 <03e078b0-62a3-5d11-987b-7472f841c44d@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jri7=je=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1fUnTg-00059f-Vw
 for xen-devel@lists.xenproject.org; Mon, 18 Jun 2018 06:17:25 +0000
In-Reply-To: <03e078b0-62a3-5d11-987b-7472f841c44d@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, konrad.wilk@oracle.com, dongwon.kim@intel.com, matthew.d.roper@intel.com, Sumit Semwal <sumit.semwal@linaro.org>
Cc: daniel.vetter@intel.com
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTYvMjAxOCAxMjowNyBBTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDA2LzE1
LzIwMTggMDI6NTAgQU0sIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+PiBPbiAwNi8x
NS8yMDE4IDA5OjQ2IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4gT24gMTUvMDYvMTggMDg6
MzIsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+Pj4+IFBsZWFzZSBub3RlLCB0aGF0
IHRoaXMgd2lsbCBuZWVkIGEgY2hhbmdlIChhdHRhY2hlZCkgd2hpbGUKPj4+PiBhcHBseWluZyB0
byB0aGUgbWFpbmxpbmUga2VybmVsIGJlY2F1c2Ugb2YgQVBJIGNoYW5nZXMgWzFdLgo+Pj4+Cj4+
Pj4gVW5mb3J0dW5hdGVseSwgY3VycmVudCBYZW4gdGlwIGtlcm5lbCB0cmVlIGlzIHY0LjE3LXJj
NSBiYXNlZCwKPj4+PiBzbyBJIGNhbm5vdCBtYWtlIHRoZSBjaGFuZ2UgaW4gdGhpcyBwYXRjaCBu
b3cuCj4+PiBJIGRvbid0IHNlZSBhbnkgY2hhbmNlIHRoaXMgc2VyaWVzIGNvdWxkIGdvIGludG8g
NC4xOCwgYXMgdGhlIG1lcmdlCj4+PiB3aW5kb3cgaXMganVzdCBjbG9zaW5nLiBTbyBwbGVhc2Ug
cG9zdCB0aGUgcGF0Y2ggYmFzZWQgb24gY3VycmVudAo+Pj4gTGludXggbWFzdGVyIG9mIHRvcnZh
bGRzL2xpbnV4LmdpdAo+PiBPaywgSSdsbCB3YWl0IGZvciBhbnkgY29tbWVudHMvci1iJ3MgYW5k
IHRoZW4gcmViYXNlIHRvCj4+IHRvcnZhbGRzL2xpbnV4LmdpdCBhbmQgcHVzaCB2NT8KPiBBcyBJ
IG1lbnRpb25lZCBlYXJsaWVyLCBJIHdvdWxkIHZlcnkgbXVjaCBsaWtlIGF0IGxlYXN0IGEgcmV2
aWV3IG9mIHRoZQo+IG5ldyBpbnRlcmZhY2VzIGJ5IHNvbWVvbmUgbW9yZSBrbm93bGVkZ2VhYmxl
IHRoYW4gbWUuCkkgYW0gYWRkaW5nICJETUEgQlVGRkVSIFNIQVJJTkcgRlJBTUVXT1JLIiBtYWlu
dGFpbmVyIHRvIHRoZSBsaXN0LgpTdW1pdCwgY291bGQgcGxlYXNlIGhlbHAgcmV2aWV3aW5nIHRo
aXM/IFRoZSB3aG9sZSB3b3JrIGhlcmUKaXMgdG8gYWRkIGRtYS1idWYgdG8gWGVuJ3MgZ3JhbnQg
ZGV2aWNlIGRyaXZlci4KCkludGVsIGNvdWxkIHByb2JhYmx5IGFsc28gc2F5IGNvdXBsZSBvZiB3
b3JkcyBhcyB0aGV5IGFsc28KbWlnaHQgcmUtdXNlIHRoaXMgd29yay4KPgo+PiBCVFcsIGlzIHRo
ZXJlIGFueSBwbGFuIHRvIHJlYmFzZSBYZW4gdGlwIGtlcm5lbD8KPgo+IEl0IGlzIHR5cGljYWxs
eSByZWJhc2VkIHRvIHJjNSBvciByNiwgYXQgd2hpY2ggcG9pbnQgcGF0Y2hlcyBmb3IgdGhlCj4g
bmV4dCBtZXJnZSB3aW5kb3cgYXJlIGFwcGxpZWQuCj4KPiAtYm9yc2kKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
