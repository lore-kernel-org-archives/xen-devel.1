From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 19/23] x86: PIT emulation is common to
 both PV and HVM
Date: Tue, 28 Aug 2018 08:36:37 -0600
Message-ID: <5B855DF502000078001E29FD@prv1-mh.provo.novell.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <3c651e5f60a496e3e5661f60bd7e913dab2b05a0.1535285866.git-series.wei.liu2@citrix.com>
 <5B8535B302000078001E28EB@prv1-mh.provo.novell.com>
 <20180828131954.sszmpjeuhy4ulqpv@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=k/hy=ll=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fuf6n-0005vt-Sv
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 14:36:41 +0000
In-Reply-To: <20180828131954.sszmpjeuhy4ulqpv@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjA4LjE4IGF0IDE1OjE5LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVHVlLCBBdWcgMjgsIDIwMTggYXQgMDU6NDQ6NTFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAyNi4wOC4xOCBhdCAxNDoxOSwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+PiA+IE1vdmUgdGhlIGZpbGUgdG8geDg2IGNvbW1vbiBjb2RlIGFuZCBjaGFuZ2UgaXRz
IG5hbWUgdG8gZW11bC1pODI1NC5jLgo+PiA+IAo+PiA+IFB1dCBIVk0gb25seSBjb2RlIHVuZGVy
IENPTkZJR19IVk0gb3IgaXNfaHZtX2RvbWFpbi4KPj4gPiAKPj4gPiBTaWduZWQtb2ZmLWJ5OiBX
ZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+PiA+IC0tLQo+PiA+IHYyOiBtb3ZlIHRoZSB3
aG9sZSBmaWxlLgo+PiA+IC0tLQo+PiA+ICB4ZW4vYXJjaC94ODYvTWFrZWZpbGUgICAgIHwgICAx
ICstCj4+ID4gIHhlbi9hcmNoL3g4Ni9lbXVsLWk4MjU0LmMgfCA2MDkgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrLQo+PiA+ICB4ZW4vYXJjaC94ODYvaHZtL01ha2VmaWxl
IHwgICAxICstCj4+ID4gIHhlbi9hcmNoL3g4Ni9odm0vaTgyNTQuYyAgfCA1OTcgKy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+ID4gIDQgZmlsZXMgY2hhbmdlZCwgNjEw
IGluc2VydGlvbnMoKyksIDU5OCBkZWxldGlvbnMoLSkKPj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IHhlbi9hcmNoL3g4Ni9lbXVsLWk4MjU0LmMKPj4gPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IHhlbi9h
cmNoL3g4Ni9odm0vaTgyNTQuYwo+PiAKPj4gT24gdGhlIGFzc3VtcHRpb24gdGhhdCB0aGUgY2hh
bmdlcyB0byB0aGUgZmlsZSBhcmUgb25seSBDT05GSUdfSFZNCj4+IGFkZGl0aW9ucwo+IAo+IE5v
IG9ubHkgdGhhdC4gVGhlcmUgYXJlIGEgZmV3IGlzX2h2bV9kb21haW4gY2FsbHMgYXMgd2VsbC4K
PiAKPj4gQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBEb2Vz
IHRoaXMgc3RpbGwgc3RhbmQ/CgpZZXMsIGFsYmVpdCBsb29raW5nIGF0IHRoZSBmdWxsIGRpZmYg
b2YgdGhlIGZpbGVzIEknbSB0aGVuIGEgbGl0dGxlCnB1enpsZWQgYWJvdXQgaXNfaHZtX2RvbWFp
bigpIHVzZXM6IFdoeSBkb2VzIHBpdF9sb2FkX2NvdW50KCkKbmVlZCBhbiAjaWZkZWYgYWRkZWQg
YXQgYWxsLCB3aXRoIHRoZSBpc19odm1fdmNwdSgpIGNoZWNrCnJpZ2h0IGJlZm9yZSBpdD8KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
