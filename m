From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC 08/49] xen/sched: use new sched_item
 instead of vcpu in scheduler interfaces
Date: Sat, 30 Mar 2019 11:24:29 +0100
Message-ID: <bcbe39bc-fc79-d401-13fc-69bf34ffa17d@suse.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <20190329150934.17694-9-jgross@suse.com>
 <4570eeac-64a8-f424-28df-883347c69f15@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EaPS=SB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hABAA-0002Fe-QU
 for xen-devel@lists.xenproject.org; Sat, 30 Mar 2019 10:24:34 +0000
In-Reply-To: <4570eeac-64a8-f424-28df-883347c69f15@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Robert VanVossen <robert.vanvossen@dornerworks.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Josh Whitehead <josh.whitehead@dornerworks.com>, Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDMvMjAxOSAxOTo0MiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyOS8wMy8yMDE5
IDE1OjA4LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9z
Y2hlZHVsZS5jIGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCj4+IGluZGV4IDZiNWQ0NTQ2MzAuLmQx
YTk1ODE0M2EgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYwo+PiArKysgYi94
ZW4vY29tbW9uL3NjaGVkdWxlLmMKPj4gQEAgLTI1Niw2ICsyNTYsNyBAQCBzdGF0aWMgdm9pZCBz
Y2hlZF9zcGluX3VubG9ja19kb3VibGUoc3BpbmxvY2tfdCAqbG9jazEsIHNwaW5sb2NrX3QgKmxv
Y2syLAo+PiAgaW50IHNjaGVkX2luaXRfdmNwdShzdHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQgaW50
IHByb2Nlc3NvcikKPj4gIHsKPj4gICAgICBzdHJ1Y3QgZG9tYWluICpkID0gdi0+ZG9tYWluOwo+
PiArICAgIHN0cnVjdCBzY2hlZF9pdGVtIGl0ZW0gPSB7IC52Y3B1ID0gdiB9Owo+PiAgCj4+ICAg
ICAgdi0+cHJvY2Vzc29yID0gcHJvY2Vzc29yOwo+PiAgCj4+IEBAIC0yNjcsNyArMjY4LDcgQEAg
aW50IHNjaGVkX2luaXRfdmNwdShzdHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQgaW50IHByb2Nlc3Nv
cikKPj4gICAgICBpbml0X3RpbWVyKCZ2LT5wb2xsX3RpbWVyLCBwb2xsX3RpbWVyX2ZuLAo+PiAg
ICAgICAgICAgICAgICAgdiwgdi0+cHJvY2Vzc29yKTsKPj4gIAo+PiAtICAgIHYtPnNjaGVkX3By
aXYgPSBTQ0hFRF9PUChkb21fc2NoZWR1bGVyKGQpLCBhbGxvY192ZGF0YSwgdiwKPj4gKyAgICB2
LT5zY2hlZF9wcml2ID0gU0NIRURfT1AoZG9tX3NjaGVkdWxlcihkKSwgYWxsb2NfdmRhdGEsICZp
dGVtLAo+PiAgICAgICAgICAgICAgICAgICAgICAgZC0+c2NoZWRfcHJpdik7Cj4gCj4gSSByZWFs
aXNlIHRoaXMgaXMgcGVyaGFwcyBhbiBvdmVyLXRoZS10b3AgcmVxdWVzdCwgYnV0IGNhbiB3ZSBz
ZWUgYWJvdXQKPiBkb2luZyBtb3JlIGhlcmU/Cj4gCj4gU0NIRURfT1AoKSBpcyBhIHRob3JvdWdo
bHkgb2JqZWN0aW9uYWJsZSBwaWVjZSBvZiBvYmZ1c2NhdGlvbiwgd2hpY2gKPiBicmVha3MgY3Nj
b3BlL2N0YWdzIGFuZCBhbHNvIHJlc3VsdHMgaW4gZXNwZWNpYWxseSBwb29yIGNvZGUgZ2VuZXJh
dGlvbi4KPiAKPiBHaXZlbiB0aGF0IHdlIGFyZSBjaGFuZ2luZyB0aGUgaW50ZXJmYWNlIGFueXdh
eSBhbmQgdG91Y2hpbmcgYWxsCj4gY29kZXBhdGhzLCB3b3VsZCB5b3UgbWluZCBhbHNvIGFkZGlu
ZyBzdGF0aWMgaW5saW5lIHdyYXBwZXJzIGxpa2UgSQo+IHN0YXJ0ZWQgd2l0aCAzNDBlZGMzID8K
Ck9rYXksIEknbGwgZG8gdGhhdC4KCj4gVEJILCBJJ20gZXZlbiBoYXBweSB0byBnaXZlIHRoaXMg
YSBnbyBhbmQgZ2l2ZSB5b3UgdGhlIGJhY2sgdGhlCj4gcmVzdWx0aW5nIHRyZWUsIGlmIHlvdSdk
IHByZWZlci4KCkkgdGhpbmsgaXRzIGlzIGVhc2llciB0byBkbyBpdCBteXNlbGYsIGFzIEknbSB0
b3VjaGluZyBuZWFybHkgYWxsIG9mCnRoZSBjYWxsIHNpdGVzIGFueXdheS4KCgpKdWVyZ2VuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
