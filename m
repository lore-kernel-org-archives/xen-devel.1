From: Mirela Simonovic <mirela.simonovic@aggios.com>
Subject: Re: [PATCH 5/7] xen/arm: Remove __initdata and __init
 to enable CPU hotplug
Date: Thu, 12 Apr 2018 14:50:52 +0200
Message-ID: <CAKPH-NjPCqAxsG4NiU2rrxGN3xLP9gzKiHHSiexpO6Oo6HCzWg@mail.gmail.com>
References: <20180411131927.27083-1-mirela.simonovic@aggios.com>
 <20180411131927.27083-6-mirela.simonovic@aggios.com>
 <alpine.DEB.2.10.1804111648180.3304@sstabellini-ThinkPad-X260>
 <c2411a64-831a-4492-5335-db3632147d05@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <c2411a64-831a-4492-5335-db3632147d05@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Xen Devel <xen-devel@lists.xen.org>, Davorin Mista <dm@aggios.com>, julien.grall@arm.org
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiBUaHUsIEFwciAxMiwgMjAxOCBhdCAxMTowMyBBTSwgSnVsaWVuIEdyYWxsIDxqdWxp
ZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4gSGksCj4KPiBPbiAxMi8wNC8xOCAwMTowNywgU3Rl
ZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+Pgo+PiBPbiBXZWQsIDExIEFwciAyMDE4LCBNaXJlbGEg
U2ltb25vdmljIHdyb3RlOgo+Pj4KPj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vc21wYm9v
dC5jIGIveGVuL2FyY2gvYXJtL3NtcGJvb3QuYwo+Pj4gaW5kZXggNTY2NmVmY2QzYS4uZDE1ZWE4
ZGY1ZSAxMDA2NDQKPj4+IC0tLSBhL3hlbi9hcmNoL2FybS9zbXBib290LmMKPj4+ICsrKyBiL3hl
bi9hcmNoL2FybS9zbXBib290LmMKPj4+IEBAIC01Miw4ICs1Miw4IEBAIG5vZGVtYXNrX3QgX19y
ZWFkX21vc3RseSBub2RlX29ubGluZV9tYXAgPSB7IHsgWzBdID0KPj4+IDFVTCB9IH07Cj4+PiAg
IHN0YXRpYyB1bnNpZ25lZCBjaGFyIF9faW5pdGRhdGEgY3B1MF9ib290X3N0YWNrW1NUQUNLX1NJ
WkVdCj4+PiAgICAgICAgICBfX2F0dHJpYnV0ZV9fKChfX2FsaWduZWRfXyhTVEFDS19TSVpFKSkp
Owo+Pj4gICAtLyogSW5pdGlhbCBib290IGNwdSBkYXRhICovCj4+PiAtc3RydWN0IGluaXRfaW5m
byBfX2luaXRkYXRhIGluaXRfZGF0YSA9Cj4+PiArLyogQm9vdCBjcHUgZGF0YSAqLwo+Pj4gK3N0
cnVjdCBpbml0X2luZm8gaW5pdF9kYXRhID0KPj4+ICAgewo+Pj4gICAgICAgLnN0YWNrID0gY3B1
MF9ib290X3N0YWNrLAo+Pj4gICB9Owo+Pgo+Pgo+PiBEb24ndCB5b3UgYWxzbyB3YW50IHRvIHJl
bW92ZSBfX2luaXRkYXRhIGZyb20gY3B1MF9ib290X3N0YWNrPwo+CgpTb21laG93IEkgZGlkbid0
IG9ic2VydmUgdGhpcyBhcyBhIHByb2JsZW0uLi4gQWZ0ZXIgdGFraW5nIGEgZGVlcGVyCmxvb2sg
bm93IEkgdW5kZXJzdGFuZCB0aGF0IHNlY29uZGFyeSBDUFVzIHJldXNlIHRoaXMgc3RhY2sgdG8g
Ym9vdC4gU28KSSBhZ3JlZSwgX19pbml0ZGF0YSBmcm9tIGNwdTBfYm9vdF9zdGFjayBzaG91bGQg
YmUgcmVtb3ZlZC4KCj4KPiBJIGFtIG5vdCBzdXJlIGFib3V0IHRoaXMuIFdoZW4geW91IGdvIGlk
bGUsIHlvdSBjb3VsZCByZS11c2UgdGhlCj4gaWRsZV92Y3B1WzBdLT5hcmNoLnN0YWNrLiBTbyB5
b3Ugc2F2ZSAxMksgaW4gcmVzaWRlbnQgbWVtb3J5Lgo+CgpJJ20gbm90IHN1cmUgSSBmb2xsb3cg
dGhpcywgbWF5YmUgU3RlZmFubyBjYW4gY29tbWVudC4KClRoYW5rcywKTWlyZWxhCgo+IENoZWVy
cywKPgo+IC0tCj4gSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
