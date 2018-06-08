From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 05/11] x86/emul: Unfold %cr4.de handling in
 x86emul_read_dr()
Date: Fri, 08 Jun 2018 10:16:27 -0600
Message-ID: <5B1AABDB02000078001C99AB@prv1-mh.provo.novell.com>
References: <1528120755-17455-1-git-send-email-andrew.cooper3@citrix.com>
 <1528120755-17455-6-git-send-email-andrew.cooper3@citrix.com>
 <5B17EDC302000078001C8CEF@prv1-mh.provo.novell.com>
 <9c946051-d617-fbc3-4086-bf37cb0a184a@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <9c946051-d617-fbc3-4086-bf37cb0a184a@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjA2LjE4IGF0IDE4OjAzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDYvMDYvMTggMTU6MjAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwNC4w
Ni4xOCBhdCAxNTo1OSwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gTm8g
ZnVuY3Rpb25hbCBjaGFuZ2UgKGFzIGN1cnItPmFyY2guZGVidWdyZWdbNV0gaXMgemVybyB3aGVu
IERFIGlzIGNsZWFyKSwgCj4gYnV0Cj4+PiB0aGlzIGNoYW5nZSBzaW1wbGlmaWVzIHRoZSBmb2xs
b3dpbmcgcGF0Y2guCj4+IEEgY29tbWVudCB0byB0aGlzIGVmZmVjdCB3b3VsZCBiZSBoZWxwZnVs
IC4uLgo+Pgo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlLmMKPj4+ICsrKyBiL3hl
bi9hcmNoL3g4Ni94ODZfZW11bGF0ZS5jCj4+PiBAQCAtMTAxLDIzICsxMDEsMjkgQEAgaW50IHg4
NmVtdWxfcmVhZF9kcih1bnNpZ25lZCBpbnQgcmVnLCB1bnNpZ25lZCBsb25nIAo+ICp2YWwsCj4+
PiAgICAgIHN3aXRjaCAoIHJlZyApCj4+PiAgICAgIHsKPj4+ICAgICAgY2FzZSAwIC4uLiAzOgo+
Pj4gLSAgICBjYXNlIDY6Cj4+PiAgICAgICAgICAqdmFsID0gY3Vyci0+YXJjaC5kZWJ1Z3JlZ1ty
ZWddOwo+Pj4gICAgICAgICAgYnJlYWs7Cj4+PiAgCj4+PiArICAgIGNhc2UgNDoKPj4+ICsgICAg
ICAgIGlmICggY3Vyci0+YXJjaC5wdl92Y3B1LmN0cmxyZWdbNF0gJiBYODZfQ1I0X0RFICkKPj4+
ICsgICAgICAgICAgICBnb3RvIHVkX2ZhdWx0Owo+Pj4gKwo+Pj4gKyAgICAgICAgLyogRmFsbHRo
cm91Z2ggKi8KPj4+ICsgICAgY2FzZSA2Ogo+Pj4gKyAgICAgICAgKnZhbCA9IGN1cnItPmFyY2gu
ZGVidWdyZWdbNl07Cj4+PiArICAgICAgICBicmVhazsKPj4+ICsKPj4+ICsgICAgY2FzZSA1Ogo+
Pj4gKyAgICAgICAgaWYgKCBjdXJyLT5hcmNoLnB2X3ZjcHUuY3RybHJlZ1s0XSAmIFg4Nl9DUjRf
REUgKQo+Pj4gKyAgICAgICAgICAgIGdvdG8gdWRfZmF1bHQ7Cj4+PiArCj4+PiArICAgICAgICAv
KiBGYWxsdGhyb3VnaCAqLwo+Pj4gICAgICBjYXNlIDc6Cj4+PiAgICAgICAgICAqdmFsID0gKGN1
cnItPmFyY2guZGVidWdyZWdbN10gfAo+Pj4gICAgICAgICAgICAgICAgICBjdXJyLT5hcmNoLmRl
YnVncmVnWzVdKTsKPj4gLi4uIHNvbWV3aGVyZSBhYm92ZSBoZXJlLiBXaXRoIHRoYXQKPj4gQWNr
ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBFdmVuIGluIGxpZ2h0
IG9mIHRoZSByZW5hbWUgdHVybmluZyB0aGlzIGludG8KPiAKPiAqdmFsID0gY3Vyci0+YXJjaC5k
cjcgfCBjdXJyLT5hcmNoLnB2X3ZjcHUuZHI3X2VtdWw7Cj4gCj4gPwoKSW5kZWVkLCB0aGUgbGF0
ZXIgYWRqdXN0bWVudCBtYWtlcyBhIGNvbW1lbnQgcHJldHR5IHBvaW50bGVzcy4KCkphbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
