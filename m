From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/6] x86/shadow: Switch
 shadow_domain.has_fast_mmio_entries to bool
Date: Fri, 17 Aug 2018 06:57:29 -0600
Message-ID: <5B76C63902000078001DF6C8@prv1-mh.provo.novell.com>
References: <1534358077-24700-1-git-send-email-andrew.cooper3@citrix.com>
 <1534358077-24700-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1534358077-24700-4-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Tim Deegan <tim@xen.org>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjA4LjE4IGF0IDIwOjM0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2L21tL3NoYWRvdy9tdWx0aS5jCj4gKysrIGIveGVuL2Fy
Y2gveDg2L21tL3NoYWRvdy9tdWx0aS5jCj4gQEAgLTU2Myw4ICs1NjMsNyBAQCBfc2hfcHJvcGFn
YXRlKHN0cnVjdCB2Y3B1ICp2LAo+ICAgICAgewo+ICAgICAgICAgIC8qIEd1ZXN0IGwxZSBtYXBz
IGVtdWxhdGVkIE1NSU8gc3BhY2UgKi8KPiAgICAgICAgICAqc3AgPSBzaF9sMWVfbW1pbyh0YXJn
ZXRfZ2ZuLCBnZmxhZ3MpOwo+IC0gICAgICAgIGlmICggIWQtPmFyY2gucGFnaW5nLnNoYWRvdy5o
YXNfZmFzdF9tbWlvX2VudHJpZXMgKQo+IC0gICAgICAgICAgICBkLT5hcmNoLnBhZ2luZy5zaGFk
b3cuaGFzX2Zhc3RfbW1pb19lbnRyaWVzID0gMTsKPiArICAgICAgICBkLT5hcmNoLnBhZ2luZy5z
aGFkb3cuaGFzX2Zhc3RfbW1pb19lbnRyaWVzID0gdHJ1ZTsKCkFyZSB5b3Ugc3VyZSB0aGUgaWYo
KSBpc24ndCBpbnRlbnRpb25hbGx5IHRoZXJlIHRvIGF2b2lkIGRpcnR5aW5nIGEKY2FjaGVsaW5l
IHdoZW4gdGhlIHZhbHVlIGlzIGFscmVhZHkgYXMgaW50ZW5kZWQ/CgpKYW4KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
