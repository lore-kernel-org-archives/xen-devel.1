From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 02/18] loader/linux: support passing rsdp
 address via boot params
Date: Thu, 18 Oct 2018 16:53:01 +0200
Message-ID: <8e1acf51-e5de-c068-d446-d6011a60fbe9@suse.com>
References: <20181009110317.6022-1-jgross@suse.com>
 <20181009110317.6022-3-jgross@suse.com>
 <20181018141323.GB4549@olila.i.net-space.pl>
 <7e26afb1-8319-9224-aba7-f4e047444818@suse.com>
 <20181018143033.GF4549@olila.i.net-space.pl>
 <49a5d095-4425-f0a8-1a79-cc1284824908@suse.com>
 <20181018144825.GB5225@olila.i.net-space.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181018144825.GB5225@olila.i.net-space.pl>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Daniel Kiper <daniel.kiper@oracle.com>
Cc: hans@knorrie.org, grub-devel@gnu.org, phcoder@gmail.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMTAvMjAxOCAxNjo0OCwgRGFuaWVsIEtpcGVyIHdyb3RlOgo+IE9uIFRodSwgT2N0IDE4
LCAyMDE4IGF0IDA0OjM2OjI4UE0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDE4
LzEwLzIwMTggMTY6MzAsIERhbmllbCBLaXBlciB3cm90ZToKPj4+IE9uIFRodSwgT2N0IDE4LCAy
MDE4IGF0IDA0OjE4OjI2UE0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4gT24gMTgv
MTAvMjAxOCAxNjoxMywgRGFuaWVsIEtpcGVyIHdyb3RlOgo+Pj4+PiBPbiBUdWUsIE9jdCAwOSwg
MjAxOCBhdCAwMTowMzowMVBNICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+Pj4gWGVu
IFBWSCBndWVzdHMgd2lsbCBoYXZlIHRoZSBSU0RQIGF0IGFuIGFyYml0cmFyeSBhZGRyZXNzLiBT
dXBwb3J0IHRoYXQKPj4+Pj4+IGJ5IHBhc3NpbmcgdGhlIFJTRFAgYWRkcmVzcyB2aWEgdGhlIGJv
b3QgcGFyYW1ldGVycyB0byBMaW51eC4KPj4+Pj4+Cj4+Pj4+PiBUaGUgbmV3IHByb3RvY29sIHZl
cnNpb24gMi4xNCByZXF1aXJlcyB0byBzZXQgdmVyc2lvbiB0byAweDgwMDAgb3JlZAo+Pj4+Pj4g
d2l0aCB0aGUgYWN0dWFsbHkgdXNlIHByb3RvY29sIHZlcnNpb24gKHRoZSBtaW5pbXVtIG9mIHRo
ZSBrZXJuZWwKPj4+Pj4+IHN1cHBsaWVkIHByb3RvY29sIHZlcnNpb24gYW5kIHRoZSBncnViMiBz
dXBwb3J0ZWQgcHJvdG9jb2wgdmVyc2lvbikKPj4+Pj4+IGlmIDIuMTQgb3IgaGlnaGVyIGFyZSBp
biBlZmZlY3QuCj4+Pj4+Pgo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgo+Pj4+Pj4gLS0tCj4+Pj4+PiBWMjogYWRkIG9yaW5nIDB4ODAwMCB0byB2
ZXJzaW9uIGZpZWxkCj4+Pj4+PiAtLS0KPj4+Pj4+ICBncnViLWNvcmUvbG9hZGVyL2kzODYvbGlu
dXguYyB8IDkgKysrKysrKysrCj4+Pj4+PiAgaW5jbHVkZS9ncnViL2kzODYvbGludXguaCAgICAg
fCA1ICsrKystCj4+Pj4+PiAgMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4+Pj4+Pgo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2dydWItY29yZS9sb2FkZXIvaTM4
Ni9saW51eC5jIGIvZ3J1Yi1jb3JlL2xvYWRlci9pMzg2L2xpbnV4LmMKPj4+Pj4+IGluZGV4IDRl
YWI1NWEyZC4uZjk2MzA5NDc2IDEwMDY0NAo+Pj4+Pj4gLS0tIGEvZ3J1Yi1jb3JlL2xvYWRlci9p
Mzg2L2xpbnV4LmMKPj4+Pj4+ICsrKyBiL2dydWItY29yZS9sb2FkZXIvaTM4Ni9saW51eC5jCj4+
Pj4+PiBAQCAtMzUsNiArMzUsNyBAQAo+Pj4+Pj4gICNpbmNsdWRlIDxncnViL2kxOG4uaD4KPj4+
Pj4+ICAjaW5jbHVkZSA8Z3J1Yi9saWIvY21kbGluZS5oPgo+Pj4+Pj4gICNpbmNsdWRlIDxncnVi
L2xpbnV4Lmg+Cj4+Pj4+PiArI2luY2x1ZGUgPGdydWIvbWFjaGluZS9rZXJuZWwuaD4KPj4+Pj4K
Pj4+Pj4gUHJvYmFibHkgdGhpcyBjaGFuZ2UgYmVsb25ncyB0byBhbm90aGVyIHBhdGNoLgo+Pj4+
Cj4+Pj4gSSBkb24ndCB0aGluayBzby4KPj4+Cj4+PiBZb3UgZG8gbm90IGFkZCBhbnl0aGluZyB0
byB0aGlzIGhlYWRlciBoZXJlIGFuZCBvdXQgb2YgdGhlIGJsdWUgeW91Cj4+PiBpbmNsdWRlIGl0
IGluIHRoaXMgZmlsZS4gU28sIHdoeSBpdCBpcyBuZWVkZWQgaGVyZT8KPj4KPj4gQWgsIG5vdyBJ
IHNlZSB5b3VyIHByb2JsZW0uCj4+Cj4+IG1hY2hpbmUva2VybmVsLmggd2lsbCBiZSB0aGUgaGVh
ZGVyIHdoaWNoIGV2ZW50dWFsbHkgZGVmaW5lcwo+PiBHUlVCX0tFUk5FTF9VU0VfUlNEUF9BRERS
Lgo+IAo+IFNvLCBwbGVhc2UgbW92ZSB0aGlzIHRvIHRoZSBwcm9wZXIgcGF0Y2guCgpPa2F5LCBp
ZiB5b3UgbGlrZSB0aGF0IGJldHRlci4KCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
