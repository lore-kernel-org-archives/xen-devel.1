From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 06/45] xen/arm: gic: Split the field
 state in gic_lr in 2 fields active and pending
Date: Fri, 16 Mar 2018 15:52:21 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1803161551500.15548@sstabellini-ThinkPad-X260>
References: <20180315203050.19791-1-andre.przywara@linaro.org>
 <20180315203050.19791-7-andre.przywara@linaro.org>
 <alpine.DEB.2.10.1803161430460.15548@sstabellini-ThinkPad-X260>
 <1a63a8f2-2844-ee73-5e48-4323226c86c1@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=gl3y=gg=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ewyD8-0003Rw-4K
 for xen-devel@lists.xenproject.org; Fri, 16 Mar 2018 22:52:30 +0000
In-Reply-To: <1a63a8f2-2844-ee73-5e48-4323226c86c1@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>, Andre Przywara <andre.przywara@linaro.org>, Andre Przywara <andre.przywara@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAxNiBNYXIgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDE2LzAzLzIwMTgg
MjE6MzQsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IE9uIFRodSwgMTUgTWFyIDIwMTgs
IEFuZHJlIFByenl3YXJhIHdyb3RlOgo+ID4gPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5n
cmFsbEBhcm0uY29tPgo+ID4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9naWMu
aCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vZ2ljLmgKPiA+ID4gaW5kZXggZGFlYzUxNDk5Yy4uYzMy
ODYxZDRmYSAxMDA2NDQKPiA+ID4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9naWMuaAo+ID4g
PiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL2dpYy5oCj4gPiA+IEBAIC0yMDksNyArMjA5LDgg
QEAgc3RydWN0IGdpY19sciB7Cj4gPiA+ICAgICAgLyogVmlydHVhbCBJUlEgKi8KPiA+ID4gICAg
ICB1aW50MzJfdCB2aXJxOwo+ID4gPiAgICAgIHVpbnQ4X3QgcHJpb3JpdHk7Cj4gPiA+IC0gICB1
aW50OF90IHN0YXRlOwo+ID4gPiArICAgYm9vbCBhY3RpdmU7Cj4gPiA+ICsgICBib29sIHBlbmRp
bmc7Cj4gPiA+ICAgICAgYm9vbCBod19zdGF0dXM7Cj4gPiA+ICAgfTsKPiA+IAo+ID4gSSBsaWtl
IHRoZSByZWFkYWJpbGl0eSBidXQgZGlzbGlrZSB0aGUgaW5jcmVhc2UgbWVtb3J5IHVzYWdlLiBJ
IHdvdWxkCj4gPiBoYXZlIGtlcHQgYSBzaW5nbGUgdWludDhfdCBhbmQgSSB3b3VsZCBoYXZlIHVz
ZWQgc3RhdHVzIGZsYWdzIGFzIGFuCj4gPiBhcHByb2FjaCwgbWF5YmUgSSB3b3VsZCBoYXZlIGlt
cHJvdmVkIG9uIHRob3NlIGZsYWdzLgo+IAo+IFdoeSBpcyB0aGF0IGltcG9ydGFudD8gZ2ljX2xy
IHdpbGwgb25seSBiZSBhbGxvY2F0ZWQgb24gdGhlIHN0YWNrLi4uCgpZb3UgYXJlIHJpZ2h0LCBz
byBpdCBpcyBldmVuIGxlc3MgaW1wb3J0YW50IHRoYW4gSSB0aG91Z2h0LgoKQWNrZWQtYnk6IFN0
ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
