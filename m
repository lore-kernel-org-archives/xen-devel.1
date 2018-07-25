From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 1/2] x86/efi: move the logic to detect PE
 build support
Date: Wed, 25 Jul 2018 15:38:43 +0200
Message-ID: <20180725133843.xux2ieegh5qkhwxq@mac.bytemobile.com>
References: <20180718102733.15253-1-roger.pau@citrix.com>
 <20180718102733.15253-2-roger.pau@citrix.com>
 <20180725124828.GH4642@olila.i.net-space.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=oa/l=kj=citrix.com=prvs=737a33581=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fiK0D-0002pY-F1
 for xen-devel@lists.xenproject.org; Wed, 25 Jul 2018 13:38:53 +0000
Content-Disposition: inline
In-Reply-To: <20180725124828.GH4642@olila.i.net-space.pl>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Daniel Kiper <daniel.kiper@oracle.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMjUsIDIwMTggYXQgMDI6NDg6MjhQTSArMDIwMCwgRGFuaWVsIEtpcGVyIHdy
b3RlOgo+IE9uIFdlZCwgSnVsIDE4LCAyMDE4IGF0IDEyOjI3OjMyUE0gKzAyMDAsIFJvZ2VyIFBh
dSBNb25uZSB3cm90ZToKPiA+IFNvIHRoYXQgaXQgY2FuIGJlIHVzZWQgYnkgb3RoZXIgY29tcG9u
ZW50cyBhcGFydCBmcm9tIHRoZSBlZmkgc3BlY2lmaWMKPiA+IGNvZGUuIEJ5IG1vdmluZyB0aGUg
ZGV0ZWN0aW9uIGNvZGUgY3JlYXRpbmcgYSBkdW1teSBlZmkvZGlzYWJsZWQgZmlsZQo+ID4gY2Fu
IGJlIGF2b2lkZWQuCj4gPgo+ID4gVGhpcyBpcyByZXF1aXJlZCBzbyB0aGF0IHRoZSBjb25kaXRp
b25hbCB1c2VkIHRvIGRlZmluZSB0aGUgZWZpIHN5bWJvbAo+ID4gaW4gdGhlIGxpbmtlciBzY3Jp
cHQgY2FuIGJlIHJlbW92ZWQgYW5kIGluc3RlYWQgdGhlIGRlZmluaXRpb24gb2YgdGhlCj4gPiBl
Zmkgc3ltYm9sIGNhbiBiZSBndWFyZGVkIHVzaW5nIHRoZSBwcmVwcm9jZXNzb3IuCj4gPgo+ID4g
VGhlIG1vdGl2YXRpb24gYmVoaW5kIHRoaXMgY2hhbmdlIGlzIHRvIGJlIGFibGUgdG8gYnVpbGQg
WGVuIHVzaW5nIGxsZAo+ID4gKHRoZSBMTFZNIGxpbmtlciksIHRoYXQgYXQgbGVhc3Qgb24gdmVy
c2lvbiA2LjAuMCBkb2Vzbid0IHdvcmsKPiA+IHByb3Blcmx5IHdpdGggYSBERUZJTkVEIGJlaW5n
IHVzZWQgaW4gYSBjb25kaXRpb25hbCBleHByZXNzaW9uOgo+ID4KPiA+IGxkICAgIC1tZWxmX3g4
Nl82NF9mYnNkICAtVCB4ZW4ubGRzIC1OIHByZWxpbmsubyAtLWJ1aWxkLWlkPXNoYTEgXAo+ID4g
ICAgIC9yb290L3NyYy94ZW4veGVuL2NvbW1vbi9zeW1ib2xzLWR1bW15Lm8gLW8gL3Jvb3Qvc3Jj
L3hlbi94ZW4vLnhlbi1zeW1zLjAKPiA+IGxkOiBlcnJvcjogeGVuLmxkczoyMzM6IHN5bWJvbCBu
b3QgZm91bmQ6IGVmaQo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiAKPiBUaGlzIHBhdGNoIGRvZXMgbW9yZSB0aGFuIHN1YmplY3Qgc2F5cy4g
U28sIHBsZWFzZSBzcGxpdCB0aGlzIHBhdGNoIGludG8KPiAyIHBhcnRzLiBPbmUgd2hpY2ggcmVh
bGx5IG1vdmVzIHRoZSBkZXRlY3Rpb24gbG9naWMgYW5kIHRoZSBzZWNvbmQgd2hpY2gKPiByZXBs
YWNlcyBERUZJTkVEKCkgd2l0aCAjaWZkZWYuCgpJdCdzIG5vdCBwb3NzaWJsZSB0byBwbGFjZSB0
aGUgd2hvbGUgY29udGVudHMgb2YgdGhlIHBhdGNoIGluIGEKc3ViamVjdCBsaW5lLCB0aGF0J3Mg
d2h5IHRoZXJlJ3MgYWxzbyBhIGNvbW1pdCBtZXNzYWdlIHRoYXQgSSB0aGluawpjb3JyZWN0bHkg
ZXhwbGFpbnMgZXZlcnl0aGluZyBkb25lIGluIHRoZSBwYXRjaC4KCklNTyBqdXN0IGhhdmluZyBh
IHBhdGNoIHRvIGNoYW5nZSB0aGUgREVGSU5FRCB0byBhbiBpZmRlZiBpcyBxdWl0ZQpwb2ludGxl
c3MsIGl0J3MgYmV0dGVyIHRvIHN3aXRjaCBpdCBoZXJlIHRvZ2V0aGVyIHdpdGggdGhlIGNoYW5n
ZSB0aGF0CmFjdHVhbGx5IGludHJvZHVjZXMgdGhlIGRlZmluZSBpdHNlbGYuCgpUaGFua3MsIFJv
Z2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
