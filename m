From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v9 07/11] x86/boot: Calculate the most
 appropriate BTI mitigation to use
Date: Fri, 19 Jan 2018 05:06:40 -0700
Message-ID: <5A61ED6002000078001A0584@prv-mh.provo.novell.com>
References: <1516290370-14958-1-git-send-email-andrew.cooper3@citrix.com>
 <1516290370-14958-8-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1516290370-14958-8-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjAxLjE4IGF0IDE2OjQ2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQEAgLTEyNCw3ICsxODYsMjEgQEAgdm9pZCBfX2luaXQgaW5pdF9zcGVjdWxhdGlvbl9t
aXRpZ2F0aW9ucyh2b2lkKQo+ICAgICAgICAgICAgICAgKi8KPiAgICAgICAgICAgICAgaWYgKCBj
cHVfaGFzX2xmZW5jZV9kaXNwYXRjaCApCj4gICAgICAgICAgICAgICAgICB0aHVuayA9IFRIVU5L
X0xGRU5DRTsKPiArICAgICAgICAgICAgLyoKPiArICAgICAgICAgICAgICogT24gSW50ZWwgaGFy
ZHdhcmUsIHdlJ2QgbGlrZSB0byB1c2UgcmV0cG9saW5lIGluIHByZWZlcmVuY2UgdG8KPiArICAg
ICAgICAgICAgICogSUJSUywgYnV0IG9ubHkgaWYgaXQgaXMgc2FmZSBvbiB0aGlzIGhhcmR3YXJl
Lgo+ICsgICAgICAgICAgICAgKi8KPiArICAgICAgICAgICAgZWxzZSBpZiAoIGJvb3RfY3B1X2hh
cyhYODZfRkVBVFVSRV9JQlJTQikgKQo+ICsgICAgICAgICAgICB7Cj4gKyAgICAgICAgICAgICAg
ICBpZiAoIHJldHBvbGluZV9zYWZlKCkgKQo+ICsgICAgICAgICAgICAgICAgICAgIHRodW5rID0g
VEhVTktfUkVUUE9MSU5FOwo+ICsgICAgICAgICAgICAgICAgZWxzZQo+ICsgICAgICAgICAgICAg
ICAgICAgIGlicnMgPSB0cnVlOwo+ICsgICAgICAgICAgICB9CgpJIHRoaW5rIEkgaGFkIGFza2Vk
IGFib3V0IHRoaXMgcGllY2Ugb2YgY29kZSBiZWZvcmUsIGJ1dCBtYXliZSBub3QKdGhlIHNhbWUg
SSdtIG5vdGljaW5nIG5vdzogV2h5IGlzIHVzaW5nIHJldHBvbGluZSBkZXBlbmRlbnQgdXBvbgpJ
QlJTQj8gSS5lLiB3aHkgbm90CgogICAgICAgICAgICBlbHNlIGlmICggcmV0cG9saW5lX3NhZmUo
KSApCiAgICAgICAgICAgICAgICB0aHVuayA9IFRIVU5LX1JFVFBPTElORTsKICAgICAgICAgICAg
ZWxzZSBpZiAoIGJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9JQlJTQikgKQogICAgICAgICAgICAg
ICAgaWJycyA9IHRydWU7Cgo/CgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
