From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86: suppress sync when XPTI is disabled for a
 domain
Date: Wed, 23 May 2018 08:24:47 -0600
Message-ID: <5B0579AF02000078001C51CB@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=f/rg=ik=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fLV0a-0000XL-UL
 for xen-devel@lists.xenproject.org; Wed, 23 May 2018 14:44:56 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Tm93IHRoYXQgd2UgaGF2ZSBhIHBlci1kb21haW4gZmxhZyB3ZSBjYW4gYW5kIHNob3VsZCBjb250
cm9sIHN5bmMtaW5nIGluCmEgbW9yZSBmaW5lIGdyYWluZWQgbWFubmVyOiBPbmx5IGRvbWFpbnMg
aGF2aW5nIFhQVEkgZW5hYmxlZCBuZWVkIHRoZQpzeW5jIHRvIG9jY3VyLgoKU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2FyY2gveDg2L21t
LmMKKysrIGIveGVuL2FyY2gveDg2L21tLmMKQEAgLTM3NjUsNyArMzc2NSw3IEBACiAgICAgICAg
ICAgICAgICAgICAgICAgICBicmVhazsKICAgICAgICAgICAgICAgICAgICAgcmMgPSBtb2RfbDRf
ZW50cnkodmEsIGw0ZV9mcm9tX2ludHB0ZShyZXEudmFsKSwgbWZuLAogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjbWQgPT0gTU1VX1BUX1VQREFURV9QUkVTRVJWRV9BRCwg
dik7Ci0gICAgICAgICAgICAgICAgICAgIGlmICggIXJjICYmICFjcHVfaGFzX25vX3hwdGkgKQor
ICAgICAgICAgICAgICAgICAgICBpZiAoICFyYyAmJiB2LT5kb21haW4tPmFyY2gucHZfZG9tYWlu
LnhwdGkgKQogICAgICAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgICAgICBi
b29sIGxvY2FsX2luX3VzZSA9IGZhbHNlOwogCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
