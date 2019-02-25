From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/xstate: Don't special case feature
 collection
Date: Mon, 25 Feb 2019 10:01:25 -0700
Message-ID: <5C741F65020000780021A03F@prv1-mh.provo.novell.com>
References: <1551107027-1089-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1551107027-1089-1-git-send-email-andrew.cooper3@citrix.com>
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

Pj4+IE9uIDI1LjAyLjE5IGF0IDE2OjAzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2L2NwdS9jb21tb24uYwo+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9jcHUvY29tbW9uLmMKPiBAQCAtNDE0LDYgKzQxNCwxMCBAQCBzdGF0aWMgdm9pZCBnZW5lcmlj
X2lkZW50aWZ5KHN0cnVjdCBjcHVpbmZvX3g4NiAqYykKPiAgCQkJICAgICZjLT54ODZfY2FwYWJp
bGl0eVtjcHVmZWF0X3dvcmQoWDg2X0ZFQVRVUkVfRlNHU0JBU0UpXSwKPiAgCQkJICAgICZjLT54
ODZfY2FwYWJpbGl0eVtjcHVmZWF0X3dvcmQoWDg2X0ZFQVRVUkVfUEtVKV0sCj4gIAkJCSAgICAm
Yy0+eDg2X2NhcGFiaWxpdHlbY3B1ZmVhdF93b3JkKFg4Nl9GRUFUVVJFX0FWWDUxMl80Vk5OSVcp
XSk7Cj4gKwlpZiAoIGMtPmNwdWlkX2xldmVsID49IDB4ZCApCj4gKwkJY3B1aWRfY291bnQoMHhk
LCAxLAo+ICsJCQkgICAgJmMtPng4Nl9jYXBhYmlsaXR5W2NwdWZlYXRfd29yZChYODZfRkVBVFVS
RV9YU0FWRU9QVCldLAo+ICsJCQkgICAgJnRtcCwgJnRtcCwgJnRtcCk7CgpJIHRoaW5rIHRoaXMg
ZmlsZSBpcyBzdGlsbCB0cnlpbmcgdG8gYmUgTGludXggc3R5bGUsIHdpdGggYSBjb3VwbGUgb2YK
dmlvbGF0aW9ucy4gSSBkbyBub3RpY2UgdGhhdCB0aGUgaW1tZWRpYXRlbHkgcHJlY2VkaW5nIGlm
KCkgaXMKdGhlIHNhbWUgc3R5bGUgYXMgdGhlIG9uZSB5b3UgYWRkLCBidXQgSSB0aGluayBpdCB3
b3VsZCBiZQptb3JlIGNvbnNpc3RlbnQgdG8gb21pdCB0aGUgYmxhbmtzIGltbWVkaWF0ZWx5IGlu
c2lkZSB0aGUKcGFyZW50aGVzZXMgaGVyZS4gRWl0aGVyIHdheSwKQWNrZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkkgdGFrZSBpdCB0aGF0IHlvdSdyZSBpbnRlbnRpb25h
bGx5IHVzaW5nIDB4ZCBpbiBmYXZvciBvZgpYU1RBVEVfQ1BVSUQ/CgpBcyBhbiBhc2lkZSBJIHdv
bmRlciB3aHkgd2UgaGF2ZSBjcHVpZF9jb3VudF9lYngoKSwgYnV0Cm5vdCBlLmcuIGNwdWlkX2Nv
dW50X2VheCgpIGFzIHdvdWxkIGhhdmUgYmVlbiB1c2VmdWwgaGVyZS4KCkphbgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
