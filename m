From: "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH] xen/x86: fix linker script to work with lld
Date: Thu, 28 Jun 2018 23:35:24 -0600
Message-ID: <5B35C51C02000078001350BF@prv1-mh.provo.novell.com>
References: <20180628153809.50172-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=gccx=jp=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fYm48-0007oC-Gj
 for xen-devel@lists.xenproject.org; Fri, 29 Jun 2018 05:35:28 +0000
In-Reply-To: <20180628153809.50172-1-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: roger.pau@citrix.com, daniel.kiper@oracle.com
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IDA2LzI4LzE4IDU6Mzgg
UE0gPj4+Cj5sbGQgKHRoZSBsbHZtIGxpbmtlcikgaGFzIHNvbWUgaXNzdWVzIHdpdGggWGVuIGxp
bmtlciBzY3JpcHQuIEl0Cj5kb2Vzbid0IHVuZGVyc3RhbmQgJ3x8JyBpbiBhc3NlcnQgZXhwcmVz
c2lvbnM6Cj4KPmxkICAgIC1tZWxmX3g4Nl82NF9mYnNkICAtVCB4ZW4ubGRzIC1OIHByZWxpbmsu
byAtLWJ1aWxkLWlkPXNoYTEgXAo+L3Jvb3Qvc3JjL3hlbi94ZW4vY29tbW9uL3N5bWJvbHMtZHVt
bXkubyAtbyAvcm9vdC9zcmMveGVuL3hlbi8ueGVuLXN5bXMuMAo+bGQ6IGVycm9yOiB4ZW4ubGRz
OjI2MDogbWFsZm9ybWVkIG51bWJlcjogfAo+Pj4+IEFTU0VSVChfX2ltYWdlX2Jhc2VfXyA+ICgo
KCgoKCgoKDI2MSA+PiA4KSAqIDB4ZmZmZjAwMDAwMDAwMDAwMCkgfCAoMjYxIDw8IDM5KSkpICsg
KCgxIDw8IDM5KSAvIDIpKSArICg2NCA8PCAzMCkpICsgKDEgPDwgMzApKSArICgxIDw8IDMwKSkp
IHx8Cj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KPgo+QW5kIGRvZXNuJ3Qgd29y
ayBwcm9wZXJseSB3aXRoIHRoZSAnREVGSU5FRChmb28pID8gZm9vIDogLi4uJwo+ZXhwcmVzc2lv
bjoKPgo+bGQgICAgLW1lbGZfeDg2XzY0X2Zic2QgIC1UIHhlbi5sZHMgLU4gcHJlbGluay5vIC0t
YnVpbGQtaWQ9c2hhMSBcCj4vcm9vdC9zcmMveGVuL3hlbi9jb21tb24vc3ltYm9scy1kdW1teS5v
IC1vIC9yb290L3NyYy94ZW4veGVuLy54ZW4tc3ltcy4wCj5sZDogZXJyb3I6IHhlbi5sZHM6MjMz
OiBzeW1ib2wgbm90IGZvdW5kOiBlZmkKPgo+Rml4IHRoZSBmaXJzdCBpc3N1ZSBieSB1c2luZyAn
fCcgaW5zdGVhZCBvZiAnfHwnLCBhbmQgdGhlIHNlY29uZCBvbmUKPmJ5IGRlZmluaW5nIHRoZSBl
Zmkgc3ltYm9sIGJhc2VkIG9uIHRoZSBFRkkgZGVmaW5lIChsaWtlIGl0IHdhcyBkb25lCj5wcmlv
ciB0byBjb21taXQgYjE5OWM0NGFmYSkuCgpIbW0sIHRoZSBzZWNvbmQgb25lIGlzIGEgZGlyZWN0
IHJldmVydCBvZiB0aGUgb3JpZ2luYWwgY29tbWl0J3MgaHVuay4gVGhlcmUgbXVzdApoYXZlIGJl
ZW4gYSByZWFzb24gZm9yIERhbmllbCB0byBjaGFuZ2UgaXQsIGFuZCBoZW5jZSB1bmRvaW5nIGl0
IG1pZ2h0IGJyZWFrIHdoYXQKaGUgd2FudHMgbmVlZHMuIFlvdSBzaG91bGQgaGF2ZSBDYy1lZCBo
aW0gcmlnaHQgYXdheS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
