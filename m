From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 19/23] x86: PIT emulation is common to
 both PV and HVM
Date: Tue, 28 Aug 2018 15:51:51 +0100
Message-ID: <36619222-2197-0cd2-dbdc-7ad95f0094ca@citrix.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <3c651e5f60a496e3e5661f60bd7e913dab2b05a0.1535285866.git-series.wei.liu2@citrix.com>
 <5B8535B302000078001E28EB@prv1-mh.provo.novell.com>
 <20180828131954.sszmpjeuhy4ulqpv@citrix.com>
 <5B855DF502000078001E29FD@prv1-mh.provo.novell.com>
 <20180828144807.hv2ifgcn6pchmebk@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qctd=ll=citrix.com=prvs=771e299fc=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fufM2-00081s-N4
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 14:52:26 +0000
In-Reply-To: <20180828144807.hv2ifgcn6pchmebk@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDgvMTggMTU6NDgsIFdlaSBMaXUgd3JvdGU6Cj4gT24gVHVlLCBBdWcgMjgsIDIwMTgg
YXQgMDg6MzY6MzdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDI4LjA4LjE4
IGF0IDE1OjE5LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBPbiBUdWUsIEF1ZyAy
OCwgMjAxOCBhdCAwNTo0NDo1MUFNIC0wNjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+PiBP
biAyNi4wOC4xOCBhdCAxNDoxOSwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4+PiBN
b3ZlIHRoZSBmaWxlIHRvIHg4NiBjb21tb24gY29kZSBhbmQgY2hhbmdlIGl0cyBuYW1lIHRvIGVt
dWwtaTgyNTQuYy4KPj4+Pj4KPj4+Pj4gUHV0IEhWTSBvbmx5IGNvZGUgdW5kZXIgQ09ORklHX0hW
TSBvciBpc19odm1fZG9tYWluLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3
ZWkubGl1MkBjaXRyaXguY29tPgo+Pj4+PiAtLS0KPj4+Pj4gdjI6IG1vdmUgdGhlIHdob2xlIGZp
bGUuCj4+Pj4+IC0tLQo+Pj4+PiAgeGVuL2FyY2gveDg2L01ha2VmaWxlICAgICB8ICAgMSArLQo+
Pj4+PiAgeGVuL2FyY2gveDg2L2VtdWwtaTgyNTQuYyB8IDYwOSArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKystCj4+Pj4+ICB4ZW4vYXJjaC94ODYvaHZtL01ha2VmaWxlIHwg
ICAxICstCj4+Pj4+ICB4ZW4vYXJjaC94ODYvaHZtL2k4MjU0LmMgIHwgNTk3ICstLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4+PiAgNCBmaWxlcyBjaGFuZ2VkLCA2MTAg
aW5zZXJ0aW9ucygrKSwgNTk4IGRlbGV0aW9ucygtKQo+Pj4+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IHhlbi9hcmNoL3g4Ni9lbXVsLWk4MjU0LmMKPj4+Pj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCB4ZW4v
YXJjaC94ODYvaHZtL2k4MjU0LmMKPj4+PiBPbiB0aGUgYXNzdW1wdGlvbiB0aGF0IHRoZSBjaGFu
Z2VzIHRvIHRoZSBmaWxlIGFyZSBvbmx5IENPTkZJR19IVk0KPj4+PiBhZGRpdGlvbnMKPj4+IE5v
IG9ubHkgdGhhdC4gVGhlcmUgYXJlIGEgZmV3IGlzX2h2bV9kb21haW4gY2FsbHMgYXMgd2VsbC4K
Pj4+Cj4+Pj4gQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4+IERv
ZXMgdGhpcyBzdGlsbCBzdGFuZD8KPj4gWWVzLCBhbGJlaXQgbG9va2luZyBhdCB0aGUgZnVsbCBk
aWZmIG9mIHRoZSBmaWxlcyBJJ20gdGhlbiBhIGxpdHRsZQo+PiBwdXp6bGVkIGFib3V0IGlzX2h2
bV9kb21haW4oKSB1c2VzOiBXaHkgZG9lcyBwaXRfbG9hZF9jb3VudCgpCj4+IG5lZWQgYW4gI2lm
ZGVmIGFkZGVkIGF0IGFsbCwgd2l0aCB0aGUgaXNfaHZtX3ZjcHUoKSBjaGVjawo+PiByaWdodCBi
ZWZvcmUgaXQ/Cj4gQmVjYXVzZSBpZiBJIGRvbid0IGRvIHRoYXQgd2UgZ2V0ICJkZWZpbmVkIGJ1
dCBub3QgdXNlZCIgd2FybmluZ3MuCgooaG9wZWZ1bGx5KSBub3Qgd2l0aCB0aGUgbmV3ZXIgaXNf
aHZtX3ZjcHUoKSB3aGljaCBldmFsdWF0ZXMgaXRzCmFyZ3VtZW50cyBwcm9wZXJseS4KCn5BbmRy
ZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
