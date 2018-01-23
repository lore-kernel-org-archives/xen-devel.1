From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 0/4] x86: reduce Meltdown band-aid overhead a
 little further
Date: Tue, 23 Jan 2018 03:33:01 -0700
Message-ID: <5A671D6D02000078001A17B7@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=2ufb=es=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1edvt9-0006QR-Rt
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2018 10:33:11 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

UHJlcmVxOiB4ODY6IHNsaWdodGx5IHJlZHVjZSBNZWx0ZG93biBiYW5kLWFpZCBvdmVyaGVhZAoo
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE4
LTAxL21zZzAxNjA5Lmh0bWwpCgpUaGUgb3ZlcmFsbCBlZmZlY3Qgb2YgdGhpcyBzZXJpZXMgaXMg
c21hbGxlciB0aGFuIHRoYXQgb2YgdGhlIHNpbmdsZQpwYXRjaCBhYm92ZSAodXAgdG8gMSUgaW4g
bXkgbWVhc3VyZW1lbnRzLCBidXQgYWdhaW4gaW5zdGVhZApvZiB0aGUgYWxtb3N0IDQwJSBsb3Nz
IG9mIHBlcmZvcm1hbmNlIEdlb3JnZSBoYXMgc2VlbiB0aGF0CnN5c3RlbSBzaG93ZWQgYSAxMC0x
MyUgZGVjbGluZSAib25seSIpLCBidXQgcGVyaGFwcyBzdGlsbCB3b3J0aApjb25zaWRlcmluZy4K
CjE6IHJlbW92ZSBDUiByZWFkcyBmcm9tIGV4aXQtdG8tZ3Vlc3QgcGF0aAoyOiBlbGltaW5hdGUg
bW9zdCBYUFRJIGVudHJ5L2V4aXQgY29kZSB3aGVuIGl0J3Mgbm90IGluIHVzZQozOiByZS1vcmdh
bml6ZSB0b2dnbGVfZ3Vlc3RfKigpCjQ6IGF2b2lkIGRvdWJsZSBDUjMgcmVsb2FkIHdoZW4gc3dp
dGNoaW5nIHRvIGd1ZXN0IHVzZXIgbW9kZQoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
