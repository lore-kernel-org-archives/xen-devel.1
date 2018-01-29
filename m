From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/3] x86/hvm: Improvements to external users
 of decode_register()
Date: Mon, 29 Jan 2018 04:12:19 -0700
Message-ID: <5A6F0FA302000078001A3500@prv-mh.provo.novell.com>
References: <1516972600-26262-1-git-send-email-andrew.cooper3@citrix.com>
 <1516972600-26262-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1516972600-26262-3-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjAxLjE4IGF0IDE0OjE2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gKiBSZW5hbWUgdG8gZGVjb2RlX2dwcigpIHRvIGJlIG1vcmUgc3BlY2lmaWMgYXMgdG8g
aXRzIHB1cnBvc2UKPiAqIERyb3AgdGhlIGhpZ2hieXRlIGVuY29kaW5nIGhhbmRsaW5nLCBhcyB1
c2VycyBjYXJlLCBhbmQgaXQgdW5saWtlbHkgdGhhdAoKIi4uLiBhcyB1c2VycyBkb24ndCBjYXJl
LCBhbmQgaXQncyAuLi4iIG9yICIuLi4gYXMgbm8gdXNlcnMgY2FyZSwgYW5kIGl0J3MKLi4uIj8K
Cj4gQEAgLTYwMSwxNCArNjA5LDIzIEBAIGludCB4ODZfZW11bGF0ZV93cmFwcGVyKAo+ICAjZGVm
aW5lIHg4Nl9lbXVsYXRlIHg4Nl9lbXVsYXRlX3dyYXBwZXIKPiAgI2VuZGlmCj4gIAo+ICsvKiBN
YXAgR1BScyBieSBNb2RSTSBlbmNvZGluZyB0byB0aGVpciBvZmZzZXQgd2l0aGluIHN0cnVjdCBj
cHVfdXNlcl9yZWdzLiAqLwo+ICtleHRlcm4gY29uc3QgdWludDhfdCBjcHVfdXNlcl9yZWdzX2dw
cl9vZmZzZXRzW1g4Nl9OUl9HUFJTXTsKCk9rYXksIHRoaXMgZXhwbGFpbnMgd2h5IHlvdSBkb24n
dCB3YW50IHRoaXMgYXJyYXkgaW5zaWRlIHRoZQpmdW5jdGlvbi4KCldpdGggdGhlIGRlc2NyaXB0
aW9uIHN1aXRhYmx5IGNvcnJlY3RlZApSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
