From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 03/13] xen/arm: setup: Check errata for boot
 CPU later on
Date: Fri, 25 May 2018 20:51:31 +0100
Message-ID: <903bccf0-ceb7-d184-2b6c-c44afbf223a0@arm.com>
References: <20180522174254.27551-1-julien.grall@arm.com>
 <20180522174254.27551-4-julien.grall@arm.com>
 <alpine.DEB.2.10.1805231434360.15101@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kanw=iq=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fNcKE-0007bE-Hf
 for xen-devel@lists.xenproject.org; Tue, 29 May 2018 10:57:58 +0000
In-Reply-To: <alpine.DEB.2.10.1805231434360.15101@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andre.przywara@arm.com
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDA1LzIzLzIwMTggMTA6MzQgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3
cm90ZToKPiBPbiBUdWUsIDIyIE1heSAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IFNvbWUg
ZXJyYXRhIHdpbGwgcmVseSBvbiB0aGUgU01DQ0MgdmVyc2lvbiB3aGljaCBpcyBkZXRlY3RlZCBi
eQo+PiBwc2NpX2luaXQoKS4KPj4KPj4gVGhpcyBpcyBwYXJ0IG9mIFhTQS0yNjMuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4KPiBSZXZp
ZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKVGhh
bmsgeW91IGZvciB0aGUgcmV2aWV3LiBPbiBhbiBpbnRlcm5hbCByZXZpZXcgQW5kcmUncyBzdWdn
ZXN0ZWQgdG8gCm1vdmUgcHNjaV9pbml0KCkgb3V0c2lkZSBzbXBfaW5pdF9jcHVzKCkuIFNvbWV0
aGluZyBsaWtlOgoKICAgIHByb2Nlc3Nvcl9pZCgpOwoKICAgICAvKiBOZWVkIFBTQ0kgdmVyc2lv
biBmb3IgZmlybXdhcmUgYmFzZWQgZXJyYXRhIHdvcmthcm91bmRzICovCiAgICAgcHNjaV9pbml0
KCk7CgogICAgIGNoZWNrX2xvY2FsX2NwdV9lcnJhdGEoKTsKCiAgICAgc21wX2luaXRfY3B1cygp
OwoKSSBhbSB3b25kZXJpbmcgd2hldGhlciBpdCB3b3VsZCBiZSBjbGVhcmVyIHRvIGhhdmUuIFdo
YXQgZG8geW91IHRoaW5rPwoKQ2hlZXJzLAoKPiAKPj4gLS0tCj4+ICAgeGVuL2FyY2gvYXJtL3Nl
dHVwLmMgfCA4ICsrKysrKy0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9zZXR1cC5jIGIv
eGVuL2FyY2gvYXJtL3NldHVwLmMKPj4gaW5kZXggMWQ2ZjZiZjM3ZS4uYWM5M2RlNDc4NiAxMDA2
NDQKPj4gLS0tIGEveGVuL2FyY2gvYXJtL3NldHVwLmMKPj4gKysrIGIveGVuL2FyY2gvYXJtL3Nl
dHVwLmMKPj4gQEAgLTE3MSw4ICsxNzEsNiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcHJvY2Vzc29y
X2lkKHZvaWQpCj4+ICAgICAgIH0KPj4gICAKPj4gICAgICAgcHJvY2Vzc29yX3NldHVwKCk7Cj4+
IC0KPj4gLSAgICBjaGVja19sb2NhbF9jcHVfZXJyYXRhKCk7Cj4+ICAgfQo+PiAgIAo+PiAgIHZv
aWQgZHRfdW5yZXNlcnZlZF9yZWdpb25zKHBhZGRyX3QgcywgcGFkZHJfdCBlLAo+PiBAQCAtNzc5
LDYgKzc3NywxMiBAQCB2b2lkIF9faW5pdCBzdGFydF94ZW4odW5zaWduZWQgbG9uZyBib290X3Bo
eXNfb2Zmc2V0LAo+PiAgICAgICBwcmludGsoWEVOTE9HX0lORk8gIlNNUDogQWxsb3dpbmcgJXUg
Q1BVc1xuIiwgY3B1cyk7Cj4+ICAgICAgIG5yX2NwdV9pZHMgPSBjcHVzOwo+PiAgIAo+PiArICAg
IC8qCj4+ICsgICAgICogU29tZSBlcnJhdGEgcmVsaWVzIG9uIFNNQ0NDIHZlcnNpb24gd2hpY2gg
aXMgZGV0ZWN0ZWQgYnkgcHNjaV9pbml0KCkKPj4gKyAgICAgKiAoY2FsbGVkIGZyb20gc21wX2lu
aXRfY3B1cygpKS4KPj4gKyAgICAgKi8KPj4gKyAgICBjaGVja19sb2NhbF9jcHVfZXJyYXRhKCk7
Cj4+ICsKPj4gICAgICAgaW5pdF94ZW5fdGltZSgpOwo+PiAgIAo+PiAgICAgICBnaWNfaW5pdCgp
Owo+PiAtLSAKPj4gMi4xMS4wCj4+CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
