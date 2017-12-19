From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH v2 1/3] x86/crashkernel: avoid Xen image
 when looking for module/crashkernel position
Date: Tue, 19 Dec 2017 23:20:49 +0100
Message-ID: <20171219222049.GM4531@olila.local.net-space.pl>
References: <1512383070-26450-1-git-send-email-daniel.kiper@oracle.com>
 <1512383070-26450-2-git-send-email-daniel.kiper@oracle.com>
 <5A292F3F0200007800195757@prv-mh.provo.novell.com>
 <20171207153937.GU16962@olila.local.net-space.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=vfyl=dp=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1eRQG1-0007B0-8Y
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2017 22:21:05 +0000
Content-Disposition: inline
In-Reply-To: <20171207153937.GU16962@olila.local.net-space.pl>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: andrew.cooper3@citrix.com, eric.devolder@oracle.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBEZWMgMDcsIDIwMTcgYXQgMDQ6Mzk6MzdQTSArMDEwMCwgRGFuaWVsIEtpcGVyIHdy
b3RlOgo+IE9uIFRodSwgRGVjIDA3LCAyMDE3IGF0IDA0OjA4OjMxQU0gLTA3MDAsIEphbiBCZXVs
aWNoIHdyb3RlOgo+ID4gPj4+IE9uIDA0LjEyLjE3IGF0IDExOjI0LCA8ZGFuaWVsLmtpcGVyQG9y
YWNsZS5jb20+IHdyb3RlOgo+ID4gPiAtLS0gYS94ZW4vYXJjaC94ODYvc2V0dXAuYwo+ID4gPiAr
KysgYi94ZW4vYXJjaC94ODYvc2V0dXAuYwo+ID4gPiBAQCAtNjUzLDcgKzY1Myw3IEBAIHZvaWQg
X19pbml0IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgbWJpX3ApCj4gPiA+ICAg
ICAgbW9kdWxlX3QgKm1vZCA9IChtb2R1bGVfdCAqKV9fdmEobWJpLT5tb2RzX2FkZHIpOwo+ID4g
PiAgICAgIHVuc2lnbmVkIGxvbmcgbnJfcGFnZXMsIHJhd19tYXhfcGFnZSwgbW9kdWxlc19oZWFk
cm9vbSwgKm1vZHVsZV9tYXA7Cj4gPiA+ICAgICAgaW50IGksIGosIGU4MjBfd2FybiA9IDAsIGJ5
dGVzID0gMDsKPiA+ID4gLSAgICBib29sIGFjcGlfYm9vdF90YWJsZV9pbml0X2RvbmUgPSBmYWxz
ZTsKPiA+ID4gKyAgICBib29sIGFjcGlfYm9vdF90YWJsZV9pbml0X2RvbmUgPSBmYWxzZSwgeGVu
X3JlbG9jYXRlZCA9IGZhbHNlOwo+ID4KPiA+IEkgZG9uJ3Qgc2VlIGEgbmVlZCBmb3IgdGhlIHhl
bl8gcHJlZml4IGhlcmUgLSB3aXRoIHRoYXQgZHJvcHBlZAo+ID4gKHdoaWNoIEkgZ3Vlc3MgY291
bGQgYmUgZG9uZSB3aGlsZSBjb21taXR0aW5nKQo+ID4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KPgo+IEkgYW0gT0sgd2l0aCB0aGF0IGNoYW5nZS4gR28gYWhl
YWQuLi4KCkkgaGF2ZSBzZWVuIHRoYXQgeW91IGhhdmUgYXBwbGllZCB0aGlzLiBHcmVhdCEgSSBo
YXZlIGp1c3QgcmVhbGl6ZWQKdGhhdCB0aGlzIHBhdGNoIGFsc28gZml4ZWQgYW5vdGhlciBpc3N1
ZSB3aGljaCB3ZSBkaXNjb3ZlcmVkIGEgZmV3CmRheXMgYWdvLiBNYWNoaW5lcyB3aXRoIGxlc3Mg
dGhhbiA0IEdpQiByZWJvb3RlZCBteXN0ZXJpb3VzbHkgaWYgWGVuCndhcyBsb2FkZWQgd2l0aCBN
dWx0aWJvb3QyIGFuZCByZWxvY2F0ZWQgYnkgdGhlIGJvb3Rsb2FkZXIuIFRoaXMKaGFwcGVuZWQg
YmVjYXVzZSByZWxvY2F0b3IgY2hvc2VuIHRvIHJlbG9jYXRlIGUuZy4gZG9tMCBrZXJuZWwgb3Zl
cgp0aGUgWGVuIGltYWdlLiBUaGUgcHJvYmxlbSBkb2VzIG5vdCBhcHBlYXIgaWYgWGVuIGlzIGxv
YWRlZCB3aXRoCk11bHRpYm9vdCBwcm90b2NvbC4gVGhpcyBoYXBwZW5zIGJlY2F1c2UgZW5kIG9m
IFJBTSByZWdpb24gKGUpIG9jY3VwaWVkCmJ5IFhlbiBpcyB1cGRhdGVkIGJ5IFhlbiByZWxvY2F0
aW9uIGNvZGUuIFNvLCBvbmUgc2hvdCBhbmQgdHdvIGJ1Z3MKa2lsbGVkIGF0IG9uY2UhIE5pY2Uh
CgpEYW5pZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
