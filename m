From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH RFC 0/3] hpet: add support for level triggered
	interrupts
Date: Fri, 23 Feb 2018 13:27:40 +0000
Message-ID: <20180223132743.59804-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=nm5i=fr=citrix.com=prvs=5854f5d22=roger.pau@srs-us1.protection.inumbo.net>)
 id 1epDOG-00009b-Hx
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2018 13:27:56 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpUaGlzIHNlcmllcyBhZGQgc3VwcG9ydCBmb3IgbGV2ZWwgdHJpZ2dlcmVkIEhQRVQg
aW50ZXJydXB0cywgd2hpY2ggYXJlCm1hbmRhdG9yeSBhY2NvcmRpbmcgdG8gdGhlIHNwZWMuCgpG
aXJzdCBwYXRjaCBpcyBhIGNoYW5nZSBmb3IgdnB0IGluIG9yZGVyIHRvIGV4ZWN1dGUgdGhlIHRp
bWVyCmNhbGxiYWNrcyBldmVuIGlmIHRoZSBpbnRlcnJ1cHQgaXMgbm90IGluamVjdGVkIGJlY2F1
c2UgdGhlIElSUSBpcwptYXNrZWQuIFNlY29uZCBwYXRjaCBpbXBsZW1lbnRzIHN1cHBvcnQgZm9y
IGxldmVsIHRyaWdnZXJlZCBpbnRlcnJ1cHRzCmluIEhQRVQgYW5kIGZpbmFsbHkgcGF0Y2ggMyBp
cyBmb3IgWFRGIGluIG9yZGVyIHRvIGFkZCBhIGJhc2ljIEhQRVQKZnVuY3Rpb25hbGl0eSB0ZXN0
LgoKVGhlIHdob2xlIHNlcmllcyBpcyBSRkMgYmVjYXVzZSBJJ3ZlIG1haW5seSB0ZXN0ZWQgaXQg
dXNpbmcgdGhlIFhURgp0ZXN0IHByb3ZpZGVkIGluIHBhdGNoIDMuIEFsc28gaXQgc2xpZ2h0bHkg
Y2hhbmdlcyAoZml4ZXMpIHRoZQpiZWhhdmlvciBvZiBvdGhlciB0aW1lcnMgYmVjYXVzZSBjYWxs
YmFja3MgYXJlIG5vdyBhbHdheXMgZXhlY3V0ZWQuCgpUaGFua3MsIFJvZ2VyLgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
