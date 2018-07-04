From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 01/13] libx86: Introduce libx86/cpuid.h
Date: Wed, 04 Jul 2018 07:57:30 -0600
Message-ID: <5B3CD24A02000078001D1156@prv1-mh.provo.novell.com>
References: <1530651326-5320-1-git-send-email-andrew.cooper3@citrix.com>
 <1530651326-5320-2-git-send-email-andrew.cooper3@citrix.com>
 <5B3C838C02000078001D0E0E@prv1-mh.provo.novell.com>
 <12cff264-ae47-75b6-602c-6b867aea49ad@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <12cff264-ae47-75b6-602c-6b867aea49ad@citrix.com>
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjA3LjE4IGF0IDE0OjAzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDQvMDcvMTggMDk6MjEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwMy4w
Ny4xOCBhdCAyMjo1NSwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gLS0t
IGEvdG9vbHMvaW5jbHVkZS9NYWtlZmlsZQo+Pj4gKysrIGIvdG9vbHMvaW5jbHVkZS9NYWtlZmls
ZQo+Pj4gQEAgLTIxLDYgKzIxLDkgQEAgeGVuLy5kaXI6Cj4+PiAgCWxuIC1zZiAkKGFkZHByZWZp
eCAkKFhFTl9ST09UKS94ZW4vaW5jbHVkZS94ZW4vLGxpYmVsZi5oIGVsZnN0cnVjdHMuaCkgeGVu
L2xpYmVsZi8KPj4+ICAJbG4gLXMgLi4veGVuLWZvcmVpZ24geGVuL2ZvcmVpZ24KPj4+ICAJbG4g
LXNmICQoWEVOX1JPT1QpL3hlbi9pbmNsdWRlL2FjcGkgYWNwaQo+Pj4gK2lmZXEgKCQoQ09ORklH
X1g4NikseSkKPj4+ICsJbG4gLXNmICQoWEVOX1JPT1QpL3hlbi9pbmNsdWRlL3hlbi9saWJ4ODYg
eGVuL2xpYng4Ngo+Pj4gK2VuZGlmCj4+IFdoeSBub3Qgc2V0IHRoZSBpbmNsdWRlIHBhdGggc3Vp
dGFibHk/Cj4gCj4gQmVjYXVzZSB0aGlzIGlzIGhvdyBldmVyeXRoaW5nIGVsc2UgaXMgY3VycmVu
dGx5IGRvbmUuICBJZiB3ZSB3YW50IHRvCj4gY2hhbmdlIGhvdyB0b29scyBnZXQgdGhlaXIgaHlw
ZXJ2aXNvciBoZWFkZXIgZmlsZXMsIHRoYXQgc2hvdWxkIGJlCj4gaW5kZXBlbmRlbnQgd29yay4K
CkhvdyB0aGlzIGdldHMgZG9uZSBoZXJlIGhhcyBubyBkaXJlY3QgaW1wbGljYXRpb25zIG9uIHBy
ZS1leGlzdGluZwptZWNoYW5pc21zLgoKPj4gQW5kIG90aGVyd2lzZSwgd2hhdCBoYXJtIHdvdWxk
IHRoZXJlIGJlIGluc3RhbGxpbmcgdGhlIGxpbmsgYWxzbyB3aGVuIAo+IHRhcmdldGluZyBBUk0/
Cj4gCj4gSSdtIGZhaXJseSBzdXJlIHRoZSBBUk0gZm9sayB3b3VsZCBvYmplY3QgdG8gaGF2aW5n
IGxpYng4NiBsaW5rZWQgaW50bwo+IHRoZWlyIHRvb2xzLgoKIkxpbmtlZCBpbnRvIiBpcyBhbWJp
Z3VvdXMgaW4gdGhpcyBjb250ZXh0IC0gdGhlIHByZXNlbmNlIG9mIHRoZSBoZWFkZXJzCmRvZXMg
LSBhZmFpY3QgLSBub3QgaW1wbHkgYW55IGNvZGUgdG8gYXBwZWFyIGluIGFuIEFSTSBidWlsZCBv
ZiB0aGUgdG9vbHMuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
