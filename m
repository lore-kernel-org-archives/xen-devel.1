From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86: suppress sync when XPTI is disabled
 for a domain
Date: Thu, 24 May 2018 00:04:32 -0600
Message-ID: <5B0655F002000078001C5657@prv1-mh.provo.novell.com>
References: <5B0579AF02000078001C51CB@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=y5hq=il=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fLjMb-0000UQ-Pe
 for xen-devel@lists.xenproject.org; Thu, 24 May 2018 06:04:37 +0000
In-Reply-To: <5B0579AF02000078001C51CB@prv1-mh.provo.novell.com>
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjA1LjE4IGF0IDE2OjI0LCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+IE5v
dyB0aGF0IHdlIGhhdmUgYSBwZXItZG9tYWluIGZsYWcgd2UgY2FuIGFuZCBzaG91bGQgY29udHJv
bCBzeW5jLWluZyBpbgo+IGEgbW9yZSBmaW5lIGdyYWluZWQgbWFubmVyOiBPbmx5IGRvbWFpbnMg
aGF2aW5nIFhQVEkgZW5hYmxlZCBuZWVkIHRoZQo+IHN5bmMgdG8gb2NjdXIuCj4gCj4gU2lnbmVk
LW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9tbS5jCj4gKysrIGIveGVuL2FyY2gveDg2L21tLmMKPiBAQCAtMzc2NSw3ICszNzY1
LDcgQEAKPiAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICAgICAgICAg
ICAgICAgcmMgPSBtb2RfbDRfZW50cnkodmEsIGw0ZV9mcm9tX2ludHB0ZShyZXEudmFsKSwgbWZu
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNtZCA9PSBNTVVfUFRf
VVBEQVRFX1BSRVNFUlZFX0FELCB2KTsKPiAtICAgICAgICAgICAgICAgICAgICBpZiAoICFyYyAm
JiAhY3B1X2hhc19ub194cHRpICkKPiArICAgICAgICAgICAgICAgICAgICBpZiAoICFyYyAmJiB2
LT5kb21haW4tPmFyY2gucHZfZG9tYWluLnhwdGkgKQoKSSd2ZSBtZWFud2hpbGUgcmVhbGl6ZWQg
dGhhdCBpbnN0ZWFkIG9mIHYtPmRvbWFpbiB0aGlzIHdvdWxkIGJldHRlciBiZQpwdF9kb20gLSBJ
IHRha2UgaXQgdGhhdCB0aGlzIGRvZXNuJ3QgaW52YWxpZGF0ZSB5b3VyIFItYi4KCkphbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
