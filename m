From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH-for-4.11] xpti: fix bug in double fault
 handling
Date: Mon, 23 Apr 2018 06:46:10 -0600
Message-ID: <5ADDD59202000078001BD914@prv1-mh.provo.novell.com>
References: <20180423113702.11000-1-jgross@suse.com>
 <5ADDCD7802000078001BD8E4@suse.com>
 <2f5c0a24-0973-ff01-dec9-08dc446c4e42@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jo30=hm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fAarJ-0005ja-AY
 for xen-devel@lists.xenproject.org; Mon, 23 Apr 2018 12:46:17 +0000
In-Reply-To: <2f5c0a24-0973-ff01-dec9-08dc446c4e42@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjA0LjE4IGF0IDE0OjIyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAy
My8wNC8xOCAxNDoxMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDIzLjA0LjE4IGF0IDEz
OjM3LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+IC0tLSBhL3Rvb2xzL2Zpcm13YXJlL3hl
bi1kaXIvc2hpbS5jb25maWcKPj4+ICsrKyBiL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvc2hpbS5j
b25maWcKPj4+IEBAIC0xLDYgKzEsNiBAQAo+Pj4gICMKPj4+ICAjIEF1dG9tYXRpY2FsbHkgZ2Vu
ZXJhdGVkIGZpbGU7IERPIE5PVCBFRElULgo+Pj4gLSMgWGVuL3g4NiA0LjExLXVuc3RhYmxlIENv
bmZpZ3VyYXRpb24KPj4+ICsjIFhlbi94ODYgNC4xMS1yYyBDb25maWd1cmF0aW9uCj4+PiAgIwo+
Pj4gIENPTkZJR19YODZfNjQ9eQo+Pj4gIENPTkZJR19YODY9eQo+PiAKPj4gU3RyYXkgY2hhbmdl
Pwo+IAo+IE9oLCB0aGF0IG9uZSBhZ2Fpbi4gU29ycnkuIE1heWJlIHdlIHNob3VsZCByZWFsbHkg
dGFrZSBteSByZWxhdGVkCj4gcGF0Y2ggdG8gYXZvaWQgaXNzdWVzIGxpa2UgdGhpcyBvbmUuCgpJ
IGFncmVlLCBidXQgSSdtIG5vdCBhIG1haW50YWluZXIgb2YgdGhlIGZpbGUuCgpKYW4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
