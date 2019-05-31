From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 2/2] dom_cow is needed for mem-sharing only
Date: Fri, 31 May 2019 10:52:52 +0100
Message-ID: <f8edeb03-b223-e723-0b02-9ca565fe8055@arm.com>
References: <5CF0F33A0200007800233D8F@prv1-mh.provo.novell.com>
 <5CF0F5700200007800233DB4@prv1-mh.provo.novell.com>
 <f78f627c-753f-a162-14a1-b193908f673a@arm.com>
 <5CF0F8BE0200007800233DE3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2tza=T7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hWeDZ-0005Z1-Dn
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 09:52:57 +0000
In-Reply-To: <5CF0F8BE0200007800233DE3@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiA1LzMxLzE5IDEwOjQ5IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAzMS4w
NS4xOSBhdCAxMTo0MiwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gT24gNS8zMS8x
OSAxMDozNSBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4v
bW0uaAo+Pj4gKysrIGIveGVuL2luY2x1ZGUveGVuL21tLmgKPj4+IEBAIC02NDQsNiArNjQ0LDkg
QEAgc3RhdGljIGlubGluZSB2b2lkIGZpbHRlcmVkX2ZsdXNoX3RsYl9tYQo+Pj4gICAgCj4+PiAg
ICAvKiBQcml2YXRlIGRvbWFpbiBzdHJ1Y3RzIGZvciBET01JRF9YRU4sIERPTUlEX0lPLCBldGMu
ICovCj4+PiAgICBleHRlcm4gc3RydWN0IGRvbWFpbiAqZG9tX3hlbiwgKmRvbV9pbywgKmRvbV9j
b3c7Cj4+Cj4+IERvbid0IHlvdSB3YW50IHRvIHByb3RlY3QgZG9tX2NvdyB3aXRoICIjaWZkZWYg
Q09ORklHX0hBU19NRU1fU0hBUklORyI/Cj4gCj4gVGhlcmUncyBubyBuZWVkIHRvIHdpdGggLi4u
Cj4gCj4+PiArI2lmbmRlZiBDT05GSUdfSEFTX01FTV9TSEFSSU5HCj4+PiArIyBkZWZpbmUgZG9t
X2NvdyBOVUxMCj4+PiArI2VuZGlmCj4gCj4gLi4uIHRoaXMsIGFuZCB0aGlzIHdheSB0aGVyZSdz
IGxlc3MgY2x1dHRlciBvdmVyYWxsLgoKSSBhbSBhbGwgZm9yIGF2b2lkaW5nIGNsdXR0ZXJpbmcg
YnV0IG5vdCBhdCB0aGUgZXhwZW5zZSBvZiBtYWtpbmcgdGhlIApjb2RlIGxlc3MgaW50dWl0aXZl
LiBJbiB0aGlzIGNhc2UsIEkgd291bGQgcHJlZmVyIHRoZSBkZWNsZXJhdGlvbiAKZG9tX2NvdyB0
byBiZSBndWFyZGVkLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
