From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 04/11] x86: Fix calculation of %dr6/7
 reserved bits
Date: Wed, 6 Jun 2018 17:49:12 +0200
Message-ID: <20180606154912.ifx66ozivglgwy6d@MacBook-Pro-de-Roger.local>
References: <1528120755-17455-1-git-send-email-andrew.cooper3@citrix.com>
 <1528120755-17455-5-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1528120755-17455-5-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKdW4gMDQsIDIwMTggYXQgMDI6NTk6MDhQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9odm0uYyBiL3hlbi9hcmNoL3g4
Ni9odm0vaHZtLmMKPiBpbmRleCAxMDQxNWU2Li43ZmRkYWUxIDEwMDY0NAo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9odm0vaHZtLmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCj4gQEAgLTk3
Nyw2ICs5NzcsNyBAQCB1bnNpZ25lZCBsb25nIGh2bV9jcjRfZ3Vlc3RfdmFsaWRfYml0cyhjb25z
dCBzdHJ1Y3QgZG9tYWluICpkLCBib29sIHJlc3RvcmUpCj4gIAo+ICBzdGF0aWMgaW50IGh2bV9s
b2FkX2NwdV9jdHh0KHN0cnVjdCBkb21haW4gKmQsIGh2bV9kb21haW5fY29udGV4dF90ICpoKQo+
ICB7Cj4gKyAgICBjb25zdCBzdHJ1Y3QgY3B1aWRfcG9saWN5ICpjcCA9IGQtPmFyY2guY3B1aWQ7
Cj4gICAgICBpbnQgdmNwdWlkOwo+ICAgICAgc3RydWN0IHZjcHUgKnY7Cj4gICAgICBzdHJ1Y3Qg
aHZtX2h3X2NwdSBjdHh0Owo+IEBAIC0xMTU0LDggKzExNTUsOCBAQCBzdGF0aWMgaW50IGh2bV9s
b2FkX2NwdV9jdHh0KHN0cnVjdCBkb21haW4gKmQsIGh2bV9kb21haW5fY29udGV4dF90ICpoKQo+
ICAgICAgdi0+YXJjaC5kZWJ1Z3JlZ1sxXSA9IGN0eHQuZHIxOwo+ICAgICAgdi0+YXJjaC5kZWJ1
Z3JlZ1syXSA9IGN0eHQuZHIyOwo+ICAgICAgdi0+YXJjaC5kZWJ1Z3JlZ1szXSA9IGN0eHQuZHIz
Owo+IC0gICAgdi0+YXJjaC5kZWJ1Z3JlZ1s2XSA9IGN0eHQuZHI2Owo+IC0gICAgdi0+YXJjaC5k
ZWJ1Z3JlZ1s3XSA9IGN0eHQuZHI3Owo+ICsgICAgdi0+YXJjaC5kZWJ1Z3JlZ1s2XSA9IGFkanVz
dF9kcjZfcnN2ZChjdHh0LmRyNiwgY3AtPmZlYXQucnRtKTsKPiArICAgIHYtPmFyY2guZGVidWdy
ZWdbN10gPSBhZGp1c3RfZHI3X3JzdmQoY3R4dC5kcjcsIGNwLT5mZWF0LnJ0bSk7CgpJIGRvbid0
IGtub3cgbXVjaCwgYnV0IGlmIHRoZSB2YWx1ZSBpbiBkcjYvZHI3IGlzIGNoYW5nZWQgZnJvbSB0
aGUgb25lCmluIHRoZSBwcm92aWRlZCBjb250ZXh0LCB3b24ndCB0aGUgZ3Vlc3QgZXhwZXJpZW5j
ZSBpc3N1ZXM/CgpXb24ndCBpdCBiZSBiZXR0ZXIgdG8gcGxhaW4gcmVmdXNlIHRvIGxvYWQgYSBj
b250ZXh0IHRoYXQgaGFzCnVuc3VwcG9ydGVkIERSNi83IHZhbHVlcz8KClRoYW5rcywgUm9nZXIu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
