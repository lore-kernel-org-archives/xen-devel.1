From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 03/10] xen/arm: Implement CPU_OFF PSCI
 call (physical interface)
Date: Mon, 23 Apr 2018 18:15:07 +0100
Message-ID: <7f30e4c2-85f8-74b0-9b9b-918ae4e8d027@arm.com>
References: <20180420122513.27292-1-mirela.simonovic@aggios.com>
 <20180420122513.27292-4-mirela.simonovic@aggios.com>
 <1e2b3afb-6276-9b16-4ef5-a923b407871b@arm.com>
 <CAKPH-NhZj=rDysGJrfx=4wxgdZiduzpCcDiHuyJgz0-rrqiXqw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAKPH-NhZj=rDysGJrfx=4wxgdZiduzpCcDiHuyJgz0-rrqiXqw@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mirela Simonovic <mirela.simonovic@aggios.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Xen Devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyMy8wNC8xOCAxODoxMiwgTWlyZWxhIFNpbW9ub3ZpYyB3cm90ZToKPiBPbiBNb24sIEFw
ciAyMywgMjAxOCBhdCAxOjIxIFBNLCBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29t
PiB3cm90ZToKPj4gT24gMjAvMDQvMTggMTM6MjUsIE1pcmVsYSBTaW1vbm92aWMgd3JvdGU6Cj4+
PiArICAgIGlmICggZXJybm8gKQo+Pj4gKyAgICAgICAgcGFuaWMoIlBTQ0kgY3B1IG9mZiBmYWls
ZWQgZm9yIENQVSVkIGVycj0lZFxuIiwKPj4+IGdldF9wcm9jZXNzb3JfaWQoKSwKPj4+ICsgICAg
ICAgICAgICAgIGVycm5vKTsKPj4+ICt9Cj4+PiArCj4+PiAgICB2b2lkIGNhbGxfcHNjaV9zeXN0
ZW1fb2ZmKHZvaWQpCj4+PiAgICB7Cj4+PiAgICAgICAgaWYgKCBwc2NpX3ZlciA+IFBTQ0lfVkVS
U0lPTigwLCAxKSApCj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3NtcGJvb3QuYyBiL3hl
bi9hcmNoL2FybS9zbXBib290LmMKPj4+IGluZGV4IGIyMTE2ZjBkMmQuLjFjYTNkNjMyNjEgMTAw
NjQ0Cj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vc21wYm9vdC5jCj4+PiArKysgYi94ZW4vYXJjaC9h
cm0vc21wYm9vdC5jCj4+PiBAQCAtMzk1LDYgKzM5NSw5IEBAIHZvaWQgc3RvcF9jcHUodm9pZCkK
Pj4+ICAgICAgICAvKiBNYWtlIHN1cmUgdGhlIHdyaXRlIGhhcHBlbnMgYmVmb3JlIHdlIHNsZWVw
IGZvcmV2ZXIgKi8KPj4+ICAgICAgICBkc2Ioc3kpOwo+Pj4gICAgICAgIGlzYigpOwo+Pj4gKyAg
ICBpZiAoIHN5c3RlbV9zdGF0ZSA9PSBTWVNfU1RBVEVfc3VzcGVuZCApCj4+Cj4+Cj4+IEkgZG9u
J3QgdGhpbmsgdGhpcyBzaG91bGQgYmUgY2FsbCBvbmx5IG9uIHN1c3BlbmQvcmVzdW1lLiBTeXN0
ZW0gc2h1dGRvd24KPj4gY291bGQgYWxzbyBiZW5lZml0IG9mIFBTQ0kgQ1BVIG9mZi4gVGhpcyBp
cyBhbHNvIHBhdmluZyB0aGUgd2F5IHRvIG1vcmUgdXNlCj4+IGNhc2Ugb2YgdHVybmluZyBvZmYg
YSBDUFUuCj4gCj4gT2ssIGJ1dCB0aGVuIHdlIGRvIG5lZWQgdG8gY2hlY2sgZm9yIFBTQ0kgdmVy
c2lvbiBoZXJlLgoKT3IgaW5zaWRlIGNhbGxfcHNjaV9vZmYgdG8gbWF0Y2ggdGhlIG90aGVyIHBz
Y2lfKiBmdW5jdGlvbnMuIEhvd2V2ZXIsIAp5b3Ugc3RpbGwgbmVlZCB0byBjaGVjayB0aGUgUFND
SSB2ZXJzaW9uIGluIHRoZSBzdXNwZW5kIGNvZGUgdG8gZGVueSBhbnkgCnN1c3BlbmQvcmVzdW1l
IGZ1bmN0aW9uYWxseSBvbiBwbGF0Zm9ybSB3aXRob3V0IFBTQ0kgQ1BVIG9mZiBzdXBwb3J0LgoK
Q2hlZXJzLAotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
