From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH v2 02/18] loader/linux: support passing rsdp
 address via boot params
Date: Thu, 18 Oct 2018 17:01:02 +0200
Message-ID: <20181018150102.GD5225@olila.i.net-space.pl>
References: <20181009110317.6022-1-jgross@suse.com>
 <20181009110317.6022-3-jgross@suse.com>
 <20181018141323.GB4549@olila.i.net-space.pl>
 <7e26afb1-8319-9224-aba7-f4e047444818@suse.com>
 <20181018143033.GF4549@olila.i.net-space.pl>
 <49a5d095-4425-f0a8-1a79-cc1284824908@suse.com>
 <20181018144825.GB5225@olila.i.net-space.pl>
 <8e1acf51-e5de-c068-d446-d6011a60fbe9@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <8e1acf51-e5de-c068-d446-d6011a60fbe9@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: hans@knorrie.org, grub-devel@gnu.org, phcoder@gmail.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBPY3QgMTgsIDIwMTggYXQgMDQ6NTM6MDFQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBPbiAxOC8xMC8yMDE4IDE2OjQ4LCBEYW5pZWwgS2lwZXIgd3JvdGU6Cj4gPiBPbiBU
aHUsIE9jdCAxOCwgMjAxOCBhdCAwNDozNjoyOFBNICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3Rl
Ogo+ID4+IE9uIDE4LzEwLzIwMTggMTY6MzAsIERhbmllbCBLaXBlciB3cm90ZToKPiA+Pj4gT24g
VGh1LCBPY3QgMTgsIDIwMTggYXQgMDQ6MTg6MjZQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90
ZToKPiA+Pj4+IE9uIDE4LzEwLzIwMTggMTY6MTMsIERhbmllbCBLaXBlciB3cm90ZToKPiA+Pj4+
PiBPbiBUdWUsIE9jdCAwOSwgMjAxOCBhdCAwMTowMzowMVBNICswMjAwLCBKdWVyZ2VuIEdyb3Nz
IHdyb3RlOgo+ID4+Pj4+PiBYZW4gUFZIIGd1ZXN0cyB3aWxsIGhhdmUgdGhlIFJTRFAgYXQgYW4g
YXJiaXRyYXJ5IGFkZHJlc3MuIFN1cHBvcnQgdGhhdAo+ID4+Pj4+PiBieSBwYXNzaW5nIHRoZSBS
U0RQIGFkZHJlc3MgdmlhIHRoZSBib290IHBhcmFtZXRlcnMgdG8gTGludXguCj4gPj4+Pj4+Cj4g
Pj4+Pj4+IFRoZSBuZXcgcHJvdG9jb2wgdmVyc2lvbiAyLjE0IHJlcXVpcmVzIHRvIHNldCB2ZXJz
aW9uIHRvIDB4ODAwMCBvcmVkCj4gPj4+Pj4+IHdpdGggdGhlIGFjdHVhbGx5IHVzZSBwcm90b2Nv
bCB2ZXJzaW9uICh0aGUgbWluaW11bSBvZiB0aGUga2VybmVsCj4gPj4+Pj4+IHN1cHBsaWVkIHBy
b3RvY29sIHZlcnNpb24gYW5kIHRoZSBncnViMiBzdXBwb3J0ZWQgcHJvdG9jb2wgdmVyc2lvbikK
PiA+Pj4+Pj4gaWYgMi4xNCBvciBoaWdoZXIgYXJlIGluIGVmZmVjdC4KPiA+Pj4+Pj4KPiA+Pj4+
Pj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+ID4+Pj4+
PiAtLS0KPiA+Pj4+Pj4gVjI6IGFkZCBvcmluZyAweDgwMDAgdG8gdmVyc2lvbiBmaWVsZAo+ID4+
Pj4+PiAtLS0KPiA+Pj4+Pj4gIGdydWItY29yZS9sb2FkZXIvaTM4Ni9saW51eC5jIHwgOSArKysr
KysrKysKPiA+Pj4+Pj4gIGluY2x1ZGUvZ3J1Yi9pMzg2L2xpbnV4LmggICAgIHwgNSArKysrLQo+
ID4+Pj4+PiAgMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
Cj4gPj4+Pj4+Cj4gPj4+Pj4+IGRpZmYgLS1naXQgYS9ncnViLWNvcmUvbG9hZGVyL2kzODYvbGlu
dXguYyBiL2dydWItY29yZS9sb2FkZXIvaTM4Ni9saW51eC5jCj4gPj4+Pj4+IGluZGV4IDRlYWI1
NWEyZC4uZjk2MzA5NDc2IDEwMDY0NAo+ID4+Pj4+PiAtLS0gYS9ncnViLWNvcmUvbG9hZGVyL2kz
ODYvbGludXguYwo+ID4+Pj4+PiArKysgYi9ncnViLWNvcmUvbG9hZGVyL2kzODYvbGludXguYwo+
ID4+Pj4+PiBAQCAtMzUsNiArMzUsNyBAQAo+ID4+Pj4+PiAgI2luY2x1ZGUgPGdydWIvaTE4bi5o
Pgo+ID4+Pj4+PiAgI2luY2x1ZGUgPGdydWIvbGliL2NtZGxpbmUuaD4KPiA+Pj4+Pj4gICNpbmNs
dWRlIDxncnViL2xpbnV4Lmg+Cj4gPj4+Pj4+ICsjaW5jbHVkZSA8Z3J1Yi9tYWNoaW5lL2tlcm5l
bC5oPgo+ID4+Pj4+Cj4gPj4+Pj4gUHJvYmFibHkgdGhpcyBjaGFuZ2UgYmVsb25ncyB0byBhbm90
aGVyIHBhdGNoLgo+ID4+Pj4KPiA+Pj4+IEkgZG9uJ3QgdGhpbmsgc28uCj4gPj4+Cj4gPj4+IFlv
dSBkbyBub3QgYWRkIGFueXRoaW5nIHRvIHRoaXMgaGVhZGVyIGhlcmUgYW5kIG91dCBvZiB0aGUg
Ymx1ZSB5b3UKPiA+Pj4gaW5jbHVkZSBpdCBpbiB0aGlzIGZpbGUuIFNvLCB3aHkgaXQgaXMgbmVl
ZGVkIGhlcmU/Cj4gPj4KPiA+PiBBaCwgbm93IEkgc2VlIHlvdXIgcHJvYmxlbS4KPiA+Pgo+ID4+
IG1hY2hpbmUva2VybmVsLmggd2lsbCBiZSB0aGUgaGVhZGVyIHdoaWNoIGV2ZW50dWFsbHkgZGVm
aW5lcwo+ID4+IEdSVUJfS0VSTkVMX1VTRV9SU0RQX0FERFIuCj4gPgo+ID4gU28sIHBsZWFzZSBt
b3ZlIHRoaXMgdG8gdGhlIHByb3BlciBwYXRjaC4KPgo+IE9rYXksIGlmIHlvdSBsaWtlIHRoYXQg
YmV0dGVyLgoKWWVzLCBJIHdpbGwuIFRoYW5rcyEKCkRhbmllbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
