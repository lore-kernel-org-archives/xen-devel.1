From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH RFC] tools/libxl: Switch Arm guest type to
 PVH
Date: Mon, 2 Jul 2018 16:55:12 +0100
Message-ID: <20180702155512.743jlbunrkgtcp4i@citrix.com>
References: <20180625130814.29771-1-julien.grall@arm.com>
 <20180625131956.ehoocvdnaser3rfn@citrix.com>
 <8c3d0d5c-3953-3514-54b7-4cf4896b5df2@arm.com>
 <20180625162839.3l3njsov75tvwacj@mac.bytemobile.com>
 <23345.6832.106103.997622@mariner.uk.xensource.com>
 <20180626064917.wasgl6de6x6o3toi@mac.bytemobile.com>
 <cd3006a9-0ee4-ffc6-dccc-fe47d64c6a58@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <cd3006a9-0ee4-ffc6-dccc-fe47d64c6a58@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: sstabellini@kernel.org, Wei Liu <wei.liu2@citrix.com>, andrew.cooper3@citrix.com, xen-devel@lists.xen.org, Ian Jackson <ian.jackson@citrix.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKdWwgMDIsIDIwMTggYXQgMDM6MTM6MzhQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IAo+IAo+IE9uIDA2LzI2LzIwMTggMDc6NDkgQU0sIFJvZ2VyIFBhdSBNb25uw6kgd3Jv
dGU6Cj4gPiBPbiBNb24sIEp1biAyNSwgMjAxOCBhdCAwNTozOToxMlBNICswMTAwLCBJYW4gSmFj
a3NvbiB3cm90ZToKPiA+ID4gUm9nZXIgUGF1IE1vbm7DqSB3cml0ZXMgKCJSZTogW1BBVENIIFJG
Q10gdG9vbHMvbGlieGw6IFN3aXRjaCBBcm0gZ3Vlc3QgdHlwZSB0byBQVkgiKToKPiA+ID4gPiBJ
TU8gSSB3b3VsZCByZW1vdmUgdGhlICd0eXBlJyBvcHRpb24gZnJvbSB4bC5jZmcgKHNvIHRoYXQg
aXQncwo+ID4gPiA+IGJhc2ljYWxseSBpZ25vcmVkKSBpbiB0aGUgQVJNIGNhc2UgYW5kIGZvcmNl
IGl0IGludGVybmFsbHkgdG8gUFZIIChpZgo+ID4gPiA+IHRoYXQncyB0aGUgYmVzdCByb3V0ZSBm
b3IgY3VycmVudCBBUk0gZ3Vlc3RzKS4KPiA+ID4gCj4gPiA+IFdoYXQgYWJvdXQgbGlidmlydCB1
c2VycyA/ICBJIGhhdmVuJ3Qgc2VlbiB3aGF0IGEgbGlidmlydCBYZW4gQVJNCj4gPiA+IGd1ZXN0
IGNvbmZpZyBsb29rcyBsaWtlIGJ1dCB3ZSBuZWVkIHRvIG1lYWsgc3VyZSB0aGF0IGV4aXN0aW5n
IGd1ZXN0cwo+ID4gPiBkb24ndCBicmVhay4KPiA+IAo+ID4gRm9yIGxpdmJpcnQgKG9yIHVzZXJz
IG9mIGxpYnhsIGxpYnJhcnkpIHdlIGNvdWxkIGZvcmNlIHRoZSB0eXBlIHRvCj4gPiBwdmgsIHJl
Z2FyZGxlc3Mgb2YgdGhlIHZhbHVlIHNldCBieSB0aGUgY2xpZW50LCBidXQgSSBndWVzcyB0aGF0
IHdvdWxkCj4gPiBtYWtlIGFkZGluZyB0eXBlcyBsYXRlciBvbiBxdWl0ZSBjb21wbGljYXRlZC4K
PiAKPiBJIGFtIGZhaXJseSBjb25maWRlbnQgd2Ugd2lsbCBuZXZlciBoYXZlIFBWIGd1ZXN0IG9u
IEFybS4gU28gb25lIHNvbHV0aW9uCj4gd291bGQgYmUgdG8gYWxpYXMgUFYgdG8gUFZIIGZvciBB
cm0uIFRoaXMgc3RpbGwgZ2l2ZSB1cyB0aGUgbGliZXJ0eSB0byBhZGQKPiBtb3JlIGd1ZXN0IHR5
cGUgaW4gdGhlIGZ1dHVyZS4KPiAKPiBBbnkgb3BpbmlvbnM/CgpZZXMsIHdlIGNvdWxkIG1ha2Ug
UFYgc3lub255bSB0byBQVkggKGJ1dCBkb24ndCB0YWxrIGFib3V0IGl0LCBzaW5jZSBYZW4KQXJt
IG5ldmVyIGVtcGhhc2lzZXMgaXQgZ3Vlc3QgdHlwZSkuICBXaGF0ZXZlciBuZXcgZ3Vlc3QgdHlw
ZSB3ZSdyZQpnb2luZyB0byBhZGQgY2FuJ3QgYmUgY2FsbGVkIFBWIG9yIFBWSC4gSSBkb24ndCB0
aGluayB0aGF0IHdvdWxkIGJlIGEKYmlnIHByb2JsZW0gLS0gaWYgeW91IHdhbnQgYSBkaWZmZXJl
bnQgZ3Vlc3QgdHlwZSwgeW91IGRlZmluaXRlbHkgd2FudCBhCmRpZmZlcmVudCBuYW1lLgoKV2Vp
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
