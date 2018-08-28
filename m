From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 19/23] x86: PIT emulation is common to
 both PV and HVM
Date: Tue, 28 Aug 2018 15:48:07 +0100
Message-ID: <20180828144807.hv2ifgcn6pchmebk@citrix.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <3c651e5f60a496e3e5661f60bd7e913dab2b05a0.1535285866.git-series.wei.liu2@citrix.com>
 <5B8535B302000078001E28EB@prv1-mh.provo.novell.com>
 <20180828131954.sszmpjeuhy4ulqpv@citrix.com>
 <5B855DF502000078001E29FD@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ardv=ll=citrix.com=prvs=7715574d5=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fufHv-0007DJ-7h
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 14:48:11 +0000
Content-Disposition: inline
In-Reply-To: <5B855DF502000078001E29FD@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBdWcgMjgsIDIwMTggYXQgMDg6MzY6MzdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI4LjA4LjE4IGF0IDE1OjE5LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBUdWUsIEF1ZyAyOCwgMjAxOCBhdCAwNTo0NDo1MUFNIC0wNjAwLCBKYW4gQmV1
bGljaCB3cm90ZToKPiA+PiA+Pj4gT24gMjYuMDguMTggYXQgMTQ6MTksIDx3ZWkubGl1MkBjaXRy
aXguY29tPiB3cm90ZToKPiA+PiA+IE1vdmUgdGhlIGZpbGUgdG8geDg2IGNvbW1vbiBjb2RlIGFu
ZCBjaGFuZ2UgaXRzIG5hbWUgdG8gZW11bC1pODI1NC5jLgo+ID4+ID4gCj4gPj4gPiBQdXQgSFZN
IG9ubHkgY29kZSB1bmRlciBDT05GSUdfSFZNIG9yIGlzX2h2bV9kb21haW4uCj4gPj4gPiAKPiA+
PiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gPj4gPiAt
LS0KPiA+PiA+IHYyOiBtb3ZlIHRoZSB3aG9sZSBmaWxlLgo+ID4+ID4gLS0tCj4gPj4gPiAgeGVu
L2FyY2gveDg2L01ha2VmaWxlICAgICB8ICAgMSArLQo+ID4+ID4gIHhlbi9hcmNoL3g4Ni9lbXVs
LWk4MjU0LmMgfCA2MDkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+
ID4+ID4gIHhlbi9hcmNoL3g4Ni9odm0vTWFrZWZpbGUgfCAgIDEgKy0KPiA+PiA+ICB4ZW4vYXJj
aC94ODYvaHZtL2k4MjU0LmMgIHwgNTk3ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQo+ID4+ID4gIDQgZmlsZXMgY2hhbmdlZCwgNjEwIGluc2VydGlvbnMoKyksIDU5OCBk
ZWxldGlvbnMoLSkKPiA+PiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gveDg2L2VtdWwt
aTgyNTQuYwo+ID4+ID4gIGRlbGV0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC94ODYvaHZtL2k4MjU0
LmMKPiA+PiAKPiA+PiBPbiB0aGUgYXNzdW1wdGlvbiB0aGF0IHRoZSBjaGFuZ2VzIHRvIHRoZSBm
aWxlIGFyZSBvbmx5IENPTkZJR19IVk0KPiA+PiBhZGRpdGlvbnMKPiA+IAo+ID4gTm8gb25seSB0
aGF0LiBUaGVyZSBhcmUgYSBmZXcgaXNfaHZtX2RvbWFpbiBjYWxscyBhcyB3ZWxsLgo+ID4gCj4g
Pj4gQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+IAo+ID4gRG9l
cyB0aGlzIHN0aWxsIHN0YW5kPwo+IAo+IFllcywgYWxiZWl0IGxvb2tpbmcgYXQgdGhlIGZ1bGwg
ZGlmZiBvZiB0aGUgZmlsZXMgSSdtIHRoZW4gYSBsaXR0bGUKPiBwdXp6bGVkIGFib3V0IGlzX2h2
bV9kb21haW4oKSB1c2VzOiBXaHkgZG9lcyBwaXRfbG9hZF9jb3VudCgpCj4gbmVlZCBhbiAjaWZk
ZWYgYWRkZWQgYXQgYWxsLCB3aXRoIHRoZSBpc19odm1fdmNwdSgpIGNoZWNrCj4gcmlnaHQgYmVm
b3JlIGl0PwoKQmVjYXVzZSBpZiBJIGRvbid0IGRvIHRoYXQgd2UgZ2V0ICJkZWZpbmVkIGJ1dCBu
b3QgdXNlZCIgd2FybmluZ3MuCgpXZWkuCgo+IAo+IEphbgo+IAo+IAo+IAo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gWGVuLWRldmVsIG1haWxpbmcg
bGlzdAo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
