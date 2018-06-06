From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 6/9] xen/gntdev: Add initial support for
 dma-buf UAPI
Date: Wed, 6 Jun 2018 17:32:02 -0400
Message-ID: <7c73fae9-2dac-f3e8-bad8-0dadb73ad7af__40251.0265158073$1528320439$gmane$org@oracle.com>
References: <20180601114132.22596-1-andr2000@gmail.com>
 <20180601114132.22596-7-andr2000@gmail.com>
 <29c1f1fb-2d52-e3df-adce-44fdee135413@oracle.com>
 <d2bbda68-af74-58b1-36a6-d8af47ad8beb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=c6s6=iy=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fQfyj-0005by-AB
 for xen-devel@lists.xenproject.org; Wed, 06 Jun 2018 21:28:25 +0000
In-Reply-To: <d2bbda68-af74-58b1-36a6-d8af47ad8beb@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, jgross@suse.com, konrad.wilk@oracle.com
Cc: daniel.vetter@intel.com, matthew.d.roper@intel.com, dongwon.kim@intel.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDYvMjAxOCAwNTowNiBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4g
T24gMDYvMDQvMjAxOCAxMTo0OSBQTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+PiBPbiAwNi8w
MS8yMDE4IDA3OjQxIEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKCj4+ICtzdHJ1
Y3QgZ250ZGV2X2RtYWJ1Zl9leHBvcnRfYXJncyB7Cj4+ICvCoMKgwqAgaW50IGR1bW15Owo+PiAr
fTsKPj4KPj4gUGxlYXNlIGRlZmluZSB0aGUgZnVsbCBzdHJ1Y3R1cmUgKGF0IGxlYXN0IHdoYXQg
eW91IGhhdmUgaW4gdGhlIG5leHQKPj4gcGF0Y2gpIGhlcmUuCj4gT2ssIHdpbGwgZGVmaW5lIHdo
YXQgSSBoYXZlIGluIHRoZSBuZXh0IHBhdGNoLCBidXQgd29uJ3QKPiBpbml0aWFsaXplIGFueXRo
aW5nIHVudGlsIHRoZSBuZXh0IHBhdGNoLiBXaWxsIHRoaXMgd29yayBmb3IgeW91PwoKU3VyZSwg
SSBqdXN0IGRpZG4ndCBzZWUgdGhlIG5lZWQgZm9yIHRoZSBkdW1teSBhcmd1bWVudCB0aGF0IHlv
dSByZW1vdmUKbGF0ZXIuCgo+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL2dudGRldi5j
IGIvZHJpdmVycy94ZW4vZ250ZGV2LmMKPj4+IGluZGV4IDk4MTNmYzQ0MGM3MC4uN2Q1OGRmYjNl
NWU4IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy94ZW4vZ250ZGV2LmMKPj4+ICsrKyBiL2RyaXZl
cnMveGVuL2dudGRldi5jCj4+IC4uLgo+Pgo+Pj4gwqAgKyNpZmRlZiBDT05GSUdfWEVOX0dOVERF
Vl9ETUFCVUYKPj4gVGhpcyBjb2RlIGJlbG9uZ3MgaW4gZ250ZGV2LWRtYWJ1Zi5jLgo+IFRoZSBy
ZWFzb24gSSBoYXZlIHRoaXMgY29kZSBoZXJlIGlzIHRoYXQgaXQgaXMgaGVhdmlseQo+IHRpZWQg
dG8gZ250ZGV2J3MgaW50ZXJuYWwgZnVuY3Rpb25hbGl0eSwgZS5nLiBtYXAvdW5tYXAuCj4gSSBk
byBub3Qgd2FudCB0byBleHRlbmQgZ250ZGV2J3MgQVBJLCBzbyBnbnRkZXYtZG1hYnVmIGNhbgo+
IGFjY2VzcyB0aGVzZS4gV2hhdCBpcyBtb3JlIGRtYS1idWYgZG9lc24ndCBuZWVkIHRvIGtub3cg
YWJvdXQKPiBtYXBzIGRvbmUgYnkgZ250ZGV2IGFzIHRoZXJlIGlzIG5vIHVzZSBvZiB0aGF0IGlu
Zm9ybWF0aW9uCj4gaW4gZ250ZGV2LWRtYWJ1Zi4gU28sIGl0IHNlZW1zIG1vcmUgbmF0dXJhbGx5
IHRvIGhhdmUKPiBkbWEtYnVmJ3MgcmVsYXRlZCBtYXAvdW5tYXAgY29kZSB3aGVyZSBpdCBpczog
aW4gZ250ZGV2LgoKU29ycnksIEkgZG9uJ3QgZm9sbG93LiBXaHkgd291bGQgdGhpcyByZXF1aXJl
IGV4dGVuZGluZyB0aGUgQVBJPyBJdCdzCmp1c3QgbW92aW5nIHJvdXRpbmVzIHRvIGEgZGlmZmVy
ZW50IGZpbGUgdGhhdCBpcyBsaW5rZWQgdG8gdGhlIHNhbWUgbW9kdWxlLgoKU2luY2UgdGhpcyBp
cyB1bmRlciBDT05GSUdfWEVOX0dOVERFVl9ETUFCVUYgdGhlbiB3aHkgc2hvdWxkbid0IGl0IGJl
IGluCmdudGRldi1kbWFidWYuYz8gSW4gbXkgdmlldyB0aGF0J3MgdGhlIGZpbGUgd2hlcmUgYWxs
IGRtYS1yZWxhdGVkCiJzdHVmZiIgbGl2ZXMuCgoKLWJvcmlzCgoKLWJvcmlzCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
