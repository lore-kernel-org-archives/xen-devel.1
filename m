From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 15/15] xen/arm: traps: Move the
 implementation of GUEST_BUG_ON in traps.h
Date: Mon, 20 Aug 2018 15:02:48 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1808201502360.16354@sstabellini-ThinkPad-X260>
References: <20180716172712.20294-1-julien.grall@arm.com>
 <20180716172712.20294-16-julien.grall@arm.com>
 <alpine.DEB.2.10.1808141442070.15066@sstabellini-ThinkPad-X260>
 <1a6b5113-3ad5-50e2-1c0f-b9d532ec0b81@arm.com>
 <alpine.DEB.2.10.1808161112430.16354@sstabellini-ThinkPad-X260>
 <CAEC2CxoFP2PvitM1TM2XYk6j1=a8W+DDqrBYTNB5Q74FvMLZYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=1y+9=ld=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1frsGE-00010Q-Cw
 for xen-devel@lists.xenproject.org; Mon, 20 Aug 2018 22:02:54 +0000
In-Reply-To: <CAEC2CxoFP2PvitM1TM2XYk6j1=a8W+DDqrBYTNB5Q74FvMLZYQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@linaro.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAyMCBBdWcgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gVGh1LCAxNiBBdWcgMjAxOCwgMTk6MTcgU3RlZmFubyBTdGFiZWxsaW5pLCA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gICAgICAgT24gVGh1LCAxNiBBdWcgMjAxOCwgSnVs
aWVuIEdyYWxsIHdyb3RlOgo+ICAgICAgID4gSGkgU3RlZmFubywKPiAgICAgICA+Cj4gICAgICAg
PiBPbiAwOC8xNC8yMDE4IDEwOjQzIFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gICAg
ICAgPiA+IE9uIE1vbiwgMTYgSnVsIDIwMTgsIEp1bGllbiBHcmFsbCB3cm90ZToKPiAgICAgICA+
ID4gPiBHVUVTVF9CVUdfT04gbWF5IGJlIHVzZWQgaW4gb3RoZXIgZmlsZXMgZG9pbmcgZ3Vlc3Qg
ZW11bGF0aW9uLgo+ICAgICAgID4gPiA+Cj4gICAgICAgPiA+ID4gU2lnbmVkLW9mZi1ieTogSnVs
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAbGluYXJvLm9yZz4KPiAgICAgICA+ID4KPiAgICAgICA+
ID4gR2l2ZW4gdGhhdCBHVUVTVF9CVUdfT04gaXMgbm90IGFjdHVhbGx5IHVzZWQgaW4gYW55IG90
aGVyIGZpbGVzIGluIHRoaXMKPiAgICAgICA+ID4gcGF0Y2ggc2VyaWVzLCBJIGFzc3VtZSB5b3Ug
YXJlIHJlZmVycmluZyB0byBvbmUgb2YgeW91ciBmdXR1cmUgc2VyaWVzPwo+ICAgICAgID4KPiAg
ICAgICA+IEl0IGlzIGdvaW5nIHRvIGJlIHVzZWQgbGF0ZXIuIEhvd2V2ZXIsIEkgZG9uJ3QgcmVh
bGx5IHJlZmVyIHRvIGFueSBzZXJpZXMgaW4KPiAgICAgICA+IHBhcnRpY3VsYXIuIEl0IGlzIGp1
c3QgdGhhdCB0aGlzIG1hY3JvcyBjb3VsZCBiZSBoZWxwZnVsIGluIGFueSBlbXVsYXRpb24gY29k
ZQo+ICAgICAgID4gdG8gY2F0Y2ggd2hhdCB3ZSB0aGluayBpcyBhIGludmFsaWQgYXJjaGl0ZWN0
dXJhbCBiZWhhdmlvci4KPiAKPiAgICAgICBJdCBpcyBvbmx5IHRoYXQgYSBjb25jcmV0ZSB1c2Ut
Y2FzZSBoZWxwcy4gVGhlIGlkZWEgb2YgbW92aW5nCj4gICAgICAgR1VFU1RfQlVHX09OIGlzIGdv
b2QsIGJ1dCB3aGVyZSB0bz8gRm9yIGluc3RhbmNlLCB3b3VsZG4ndCBpdCBiZSBiZXR0ZXIKPiAg
ICAgICB0byBtb3ZlIGl0IHRvIGd1ZXN0X2FjY2Vzcy5oPyBJIGFtIGp1c3QgdHJ5aW5nIHRvIHBv
aW50IHRvIGFuIGV4aXN0aW5nCj4gICAgICAgaGVhZGVyIHdoaWNoIGlzIG1vcmUgd2lkZWx5IHVz
ZWQgYWNyb3NzIHRoZSBlbXVsYXRvcnMgKHZwbDAxMSwKPiAgICAgICB2Z2ljLXYzLWl0cy5jLCBo
dm0uYywgLi4uKQo+IAo+IAo+IERlZmluaXRlbHkgbm90IGluIGd1ZXN0X2FjY2Vzcy5oIG9yIGFu
eSB3aWRlciBpbiBpbmNsdWRlcy4gSWYgeW91IGxvb2sgYXQgdGhlIGltcGxlbWVudGF0aW9uIGFu
ZCBkb2N1bWVudGF0aW9uLCBpdCB3aWxsIGNyYXNoIHRoZQo+IGh5cGVydmlzb3IgYmVjYXVzZSB0
aGUgZ29hbCBpcyB0byBjYXRjaCBoYXJkd2FyZSBidWcgb3IgbWlzdW5kZXJzdGFuZGluZyBvZiB0
aGUgc3BlYy4gVGhpcyBpcyBub3QgbWVhbnQgdG8gYmUgdXNlZCBpbiBlbXVsYXRpb24uCj4gV2Ug
c2hvdWxkIG5vdCBjcmFzaCB0aGUgZ3Vlc3QvaHlwZXJ2aXNvciBpbiBiYWQgYmVoYXZpb3IgYnV0
IGluamVjdCBhbiBleGNlcHRpb24uCj4gCj4gU28gdHJhcC5oIGlzIHRoZSBiZXN0IHBsYWNlcyBm
b3IgaXQgYXMgaGFyZHdhcmUgdHJhcCBhcmUgbm93IHNwbGl0IGFjY3JvcyBtdWx0aXBsZXMgZmls
ZXMuCgpPSwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
