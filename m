From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 1/6] x86/mm: Use mfn_eq()/mfn_add() rather
 than opencoded variations
Date: Thu, 16 Aug 2018 18:07:34 +0200
Message-ID: <20180816160734.vigx4jhne3npxvat@mac>
References: <1534358077-24700-1-git-send-email-andrew.cooper3@citrix.com>
 <1534358077-24700-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1534358077-24700-2-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBdWcgMTUsIDIwMTggYXQgMDc6MzQ6MzJQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBVc2UgbDFlX2dldF9tZm4oKSBpbiBwbGFjZSBvZiBsMWVfZ2V0X3BmbigpIHdoZW4g
YXBwbGljYWJsZSwgYW5kIGZpeCB1cCBzdHlsZQo+IG9uIGFmZmVjdGVkIGxpbmVzLgo+IAo+IEZv
ciBzaF9yZW1vdmVfc2hhZG93X3ZpYV9wb2ludGVyKCksIG1hcF9kb21haW5fcGFnZSgpIGlzIGd1
YXJhbnRlZWQgdG8gc3VjY2VlZAo+IHNvIHRoZXJlIGlzIG5vIG5lZWQgdG8gQVNTRVJUKCkgaXRz
IHN1Y2Nlc3MuICBUaGlzIGFsbG93cyB0aGUgcG9pbnRlcgo+IGFyaXRobWV0aWMgdG8gZm9sZGVk
IGludG8gdGhlIHByZXZpb3VzIGV4cHJlc3Npb24sIGFuZCBmb3IgdmFkZHIgdG8gYmUKPiBwcm9w
ZXJseSB0eXBlZCBhcyBsMV9wZ2VudHJ5X3QsIGF2b2lkaW5nIHRoZSBjYXN0IGluIGwxZV9nZXRf
bWZuKCkuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCldpdGggb25lIGNoYW5nZToKCj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvbXVsdGkuYyBiL3hlbi9hcmNoL3g4
Ni9tbS9zaGFkb3cvbXVsdGkuYwo+IGluZGV4IDAyMWFlMjUuLjBkNzRjMDEgMTAwNjQ0Cj4gLS0t
IGEveGVuL2FyY2gveDg2L21tL3NoYWRvdy9tdWx0aS5jCj4gKysrIGIveGVuL2FyY2gveDg2L21t
L3NoYWRvdy9tdWx0aS5jCj4gQEAgLTk2MCw3ICs5NjAsOCBAQCBzdGF0aWMgaW50IHNoYWRvd19z
ZXRfbDRlKHN0cnVjdCBkb21haW4gKmQsCj4gICAgICB7Cj4gICAgICAgICAgLyogV2UgbG9zdCBh
IHJlZmVyZW5jZSB0byBhbiBvbGQgbWZuLiAqLwo+ICAgICAgICAgIG1mbl90IG9zbDNtZm4gPSBz
aGFkb3dfbDRlX2dldF9tZm4ob2xkX3NsNGUpOwo+IC0gICAgICAgIGlmICggKG1mbl94KG9zbDNt
Zm4pICE9IG1mbl94KHNoYWRvd19sNGVfZ2V0X21mbihuZXdfc2w0ZSkpKQo+ICsKPiArICAgICAg
ICBpZiAoIG1mbl9lcShvc2wzbWZuLCBzaGFkb3dfbDRlX2dldF9tZm4obmV3X3NsNGUpKQoKSSB0
aGluayB0aGlzIHNob3VsZCBiZSAhbWZuX2VxLgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
