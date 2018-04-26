From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 5/7] doc: correct livepatch.markdown syntax
Date: Thu, 26 Apr 2018 18:06:23 +0200
Message-ID: <2c3f975e-24f6-8f8c-b35e-a24af2000165@suse.com>
References: <20180424064459.23645-1-jgross@suse.com>
 <20180424064459.23645-6-jgross@suse.com>
 <20180426151237.GA9659@char.us.oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=thde=hp=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fBjPe-0001MT-G1
 for xen-devel@lists.xenproject.org; Thu, 26 Apr 2018 16:06:26 +0000
In-Reply-To: <20180426151237.GA9659@char.us.oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, tim@xen.org, ross.lagerwall@citrix.com, jbeulich@suse.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMDQvMTggMTc6MTIsIEtvbnJhZCBSemVzenV0ZWsgV2lsayB3cm90ZToKPiBPbiBUdWUs
IEFwciAyNCwgMjAxOCBhdCAwODo0NDo1N0FNICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+
PiAibWFrZSAtQyBkb2NzIGFsbCIgZmFpbHMgZHVlIHRvIGluY29ycmVjdCBtYXJrZG93biBzeW50
YXggaW4KPj4gbGl2ZXBhdGNoLm1hcmtkb3duLiBDb3JyZWN0IGl0Lgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+IC0tLQo+PiAgZG9jcy9taXNj
L2xpdmVwYXRjaC5tYXJrZG93biB8IDU4OSArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgMjcyIGluc2VydGlvbnMoKyksIDMxNyBk
ZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RvY3MvbWlzYy9saXZlcGF0Y2gubWFya2Rv
d24gYi9kb2NzL21pc2MvbGl2ZXBhdGNoLm1hcmtkb3duCj4+IGluZGV4IDU0YTZiODUwY2IuLmYz
YzEzMjBlNWEgMTAwNjQ0Cj4+IC0tLSBhL2RvY3MvbWlzYy9saXZlcGF0Y2gubWFya2Rvd24KPj4g
KysrIGIvZG9jcy9taXNjL2xpdmVwYXRjaC5tYXJrZG93bgo+PiBAQCAtODksMzMgKzg5LDI2IEBA
IEFzIGV4YW1wbGUgd2Ugd2lsbCBhc3N1bWUgdGhlIGh5cGVydmlzb3IgZG9lcyBub3QgaGF2ZSBY
U0EtMTMyIChzZWUKPj4gIDRmZjM0NDlmMGU5ZDE3NWNlYjk1NTFkM2YyYWVjYjU5MjczZjYzOWQp
IGFuZCB3ZSB3b3VsZCBsaWtlIHRvIGJpbmFyeSBwYXRjaAo+PiAgdGhlIGh5cGVydmlzb3Igd2l0
aCBpdC4gVGhlIG9yaWdpbmFsIGNvZGUgbG9va3MgYXMgc286Cj4+ICAKPj4gLTxwcmU+Cj4+IC0g
ICA0OCA4OSBlMCAgICAgICAgICAgICAgICAgIG1vdiAgICAlcnNwLCVyYXggIAo+PiAtICAgNDgg
MjUgMDAgODAgZmYgZmYgICAgICAgICBhbmQgICAgJDB4ZmZmZmZmZmZmZmZmODAwMCwlcmF4ICAK
Pj4gLTwvcHJlPgo+PiArICAgICAgIDQ4IDg5IGUwICAgICAgICAgICAgICAgICAgbW92ICAgICVy
c3AsJXJheCAgCj4+ICsgICAgICAgNDggMjUgMDAgODAgZmYgZmYgICAgICAgICBhbmQgICAgJDB4
ZmZmZmZmZmZmZmZmODAwMCwlcmF4ICAKPj4gIAo+PiAgd2hpbGUgdGhlIG5ldyBwYXRjaGVkIGh5
cGVydmlzb3Igd291bGQgYmU6Cj4+ICAKPj4gLTxwcmU+Cj4+IC0gICA0OCBjNyA0NSBiOCAwMCAw
MCAwMCAwMCAgIG1vdnEgICAkMHgwLC0weDQ4KCVyYnApICAKPj4gLSAgIDQ4IGM3IDQ1IGMwIDAw
IDAwIDAwIDAwICAgbW92cSAgICQweDAsLTB4NDAoJXJicCkgIAo+PiAtICAgNDggYzcgNDUgYzgg
MDAgMDAgMDAgMDAgICBtb3ZxICAgJDB4MCwtMHgzOCglcmJwKSAgCj4+IC0gICA0OCA4OSBlMCAg
ICAgICAgICAgICAgICAgIG1vdiAgICAlcnNwLCVyYXggIAo+PiAtICAgNDggMjUgMDAgODAgZmYg
ZmYgICAgICAgICBhbmQgICAgJDB4ZmZmZmZmZmZmZmZmODAwMCwlcmF4ICAKPj4gLTwvcHJlPgo+
PiArICAgICAgIDQ4IGM3IDQ1IGMwIDAwIDAwIDAwIDAwICAgbW92cSAgICQweDAsLTB4NDAoJXJi
cCkgIAo+IAo+IEhvdyBjb21lIHlvdSBkZWxldGVkOgo+IAo+IDQ4IGM3IDQ1IGI4IDAwIDAwIDAw
IDAwICAgbW92cSAgICQweDAsLTB4NDgoJXJicCkKPiA/Cj4gCj4gSXQgaXMgT0ssIGJ1dCBJIGFt
IGp1c3QgY3VyaW91cy4KCk9oLCBzb3JyeS4gVGhhbmtzIGZvciBub3RpY2luZy4gSSdsbCBhZGQg
aXQgYmFjay4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
