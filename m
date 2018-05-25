From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/5] x86: move definition of struct
 cpuid_leaf to cpuid.h
Date: Fri, 25 May 2018 07:05:18 -0600
Message-ID: <5B080A0E02000078001C5EED@prv1-mh.provo.novell.com>
References: <20180524160522.757-1-wei.liu2@citrix.com>
 <20180524160522.757-2-wei.liu2@citrix.com>
 <5B07F87402000078001C5E96@prv1-mh.provo.novell.com>
 <20180525120309.6j743pvgwucldvxp@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=uj/n=im=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fMD2R-00082B-68
 for xen-devel@lists.xenproject.org; Fri, 25 May 2018 13:45:47 +0000
In-Reply-To: <20180525120309.6j743pvgwucldvxp@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjA1LjE4IGF0IDE0OjAzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gRnJpLCBNYXkgMjUsIDIwMTggYXQgMDU6NTA6MTJBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAyNC4wNS4xOCBhdCAxODowNSwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+PiA+IFRoaXMgaXMgYSBzdGVwIHRvd2FyZHMgY29uc29saWRhdGluZyByZWxldmFudCBk
YXRhIHN0cnVjdHVyZXMgYW5kCj4+ID4gZGVmaW5lcyB0byBvbmUgbG9jYXRpb24uCj4+IAo+PiBT
b3J0IG9mIGNvbnRyYXJ5IHRvIHdoYXQgdGhlIHBhdGNoIGRvZXMgLSBpdCBjb252ZXJ0cyBvbmUg
aW5zdGFuY2Ugb2YgdGhlCj4+IHN0cnVjdHVyZSB0byB0d28gb2YgdGhlbS4KPiAKPiBCdXQgaXNu
J3QgdGhpcyB0ZXN0IGhhcm5lc3MgYW4gZXhjZXB0aW9uIHRvIGhvdyB0aGluZ3MgYXJlIG5vcm1h
bGx5Cj4gZG9uZT8gSSBkb24ndCB0aGluayB4ODYgaW5zbiBlbXVsYXRvciBpcyBhcyBzdGFuZGFs
b25lIGFzIG90aGVyCj4gY29tcG9uZW50cy4KCkZBT0Q6IEkgZG9uJ3QgcmVhbGx5IG1pbmQgdGhl
IG1vdmVtZW50LiBJIGRvIHRoaW5rLCB0aG91Z2gsIHRoYXQgdGhlCmRlc2NyaXB0aW9uIGRvZXNu
J3QgbWF0Y2ggd2hhdCB0aGUgcGF0Y2ggZG9lcy4KCj4gSSBuZXZlciB1bmRlcnN0b29kIHdoeSBj
cHVpZF9sZWFmIHdhcyBwdXQgaW50byB4ODZfZW11bGF0ZS5oIGluIHRoZQo+IGZpcnN0IHBsYWNl
LiBJIHRyaWVkIHRvIGNvbnZlcnQgaXQgdG8gdXNlIGNwdWlkLmggYnV0IHRoYXQgb3BlbmVkIGFu
Cj4gZXZlbiBiaWdnZXIgY2FuIG9mIHdvcm1zLgoKSSBndWVzcyB0aGF0J3MgdGhlIHJlYXNvbiB5
b3UncmUgbG9va2luZyBmb3IuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
