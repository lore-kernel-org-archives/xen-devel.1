From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/mm: Drop preemptible signal through
 {get, put}_page_type*()
Date: Tue, 28 Aug 2018 10:07:08 -0600
Message-ID: <5B85732C02000078001E2B2D@prv1-mh.provo.novell.com>
References: <1535470556-8595-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1535470556-8595-1-git-send-email-andrew.cooper3@citrix.com>
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

Pj4+IE9uIDI4LjA4LjE4IGF0IDE3OjM1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQEAgLTYyNywxMCArNjI2LDEwIEBAIHN0YXRpYyBpbnQgZ2V0X3BhZ2VfYW5kX3R5cGVf
ZnJvbV9tZm4oCj4gICAgICAgICAgIHVubGlrZWx5KCFnZXRfcGFnZV9mcm9tX21mbihtZm4sIGQp
KSApCj4gICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gIAo+IC0gICAgcmMgPSBfZ2V0X3BhZ2Vf
dHlwZShwYWdlLCB0eXBlLCBwcmVlbXB0aWJsZSk7Cj4gKyAgICByYyA9IF9nZXRfcGFnZV90eXBl
KHBhZ2UsIHR5cGUpOwo+ICAKPiAgICAgIGlmICggdW5saWtlbHkocmMpICYmIHBhcnRpYWwgPj0g
MCAmJgo+IC0gICAgICAgICAoIXByZWVtcHRpYmxlIHx8IHBhZ2UgIT0gY3VycmVudC0+YXJjaC5v
bGRfZ3Vlc3RfdGFibGUpICkKPiArICAgICAgICAgcGFnZSAhPSBjdXJyZW50LT5hcmNoLm9sZF9n
dWVzdF90YWJsZSApCj4gICAgICAgICAgcHV0X3BhZ2UocGFnZSk7CgpJZiBwcmVlbXB0aWJpbGl0
eSBpcyBub3cgdGllZCB0byB0aGUgdHlwZSwgaG93IGNhbiB0aGlzIHBhcnQgb2YgdGhlCmNvbmRp
dGlvbiBnbyBhd2F5IGFsdG9nZXRoZXIgaGVyZT8gQXQgbGVhc3QgSSBkaWRuJ3QgdW5kZXJzdGFu
ZAp0aGUgZGVzY3JpcHRpb24gdG8gbWVhbiBldmVyeXRoaW5nIGlzIG1lYW50IHRvIGJlY29tZQpw
cmVlbXB0aWJsZS4KClNhbWUgZWxzZXdoZXJlLiBQbGVhc2UgY2xhcmlmeS4KCkphbgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
