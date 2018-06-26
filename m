From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH for-4.11 v2 0/3] x86: XSA-267 follow-up
Date: Tue, 26 Jun 2018 00:24:39 -0600
Message-ID: <5B31DC2702000078001CDBEC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=x7n8=jm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fXhPD-00077Z-MH
 for xen-devel@lists.xenproject.org; Tue, 26 Jun 2018 06:24:47 +0000
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

VGhlIGZpcnN0IHBhdGNoIGFsb25lIHNob3VsZCBiZSBzdWZmaWNpZW50IHRvIGFkZHJlc3MgYW4g
aXNzdWUgd2l0aCB0aGUKWFNBLTI2NyBjaGFuZ2VzLCBjYXVzaW5nIGEgQlVHX09OKCkgdG8gYmUg
dHJpZ2dlcmVkLiBUaGUgb3RoZXIgdHdvCnBhdGNoZXMgd291bGQsIGFmYWljdCwgZWFjaCBpbmRp
dmlkdWFsbHkgYWxzbyBoYXZlIGF2b2lkZWQgdGhlIGlzc3VlLApoZW5jZSBJJ20gYWxzbyBpbmNs
dWRpbmcgdGhlbSBoZXJlLiBXaGlsZSB0aGUgZmlyc3QgcGF0Y2ggb2J2aW91c2x5IGlzCmEgc3Ry
b25nIGNhbmRpZGF0ZSBmb3IgNC4xMSwgdGhlIGxhdHRlciB0d28gYXJlIGNhbmRpZGF0ZXMgdG9v
IGltbzsgYXQKbGVhc3QgSSBjb25zaWRlciB0aGVtIGJhY2twb3J0aW5nIGNhbmRpZGF0ZXMgKGFs
YmVpdCwgdG8gYmUgY2xlYXIsIHBhdGNoCjIgaXMgdXNlZnVsIG9ubHkgYXMgZmFyIGJhY2sgYXMg
d2UgaGF2ZSBleGNlcHRpb24gcmVjb3ZlcnkgYXR0YWNoZWQKdG8gZW11bGF0b3Igc3R1YnMsIGku
ZS4gbm8gZmFydGhlciB0aGFuIDQuOSkuCgoxOiB4ODYvSFZNOiBkb24ndCBjYXVzZSAjTk0gdG8g
YmUgcmFpc2VkIGluIFhlbgoyOiB4ODY6IGd1YXJkIGFnYWluc3QgI05NCjM6IFZNWDogY2hlY2sg
aG9zdCBDUjAgYmVmb3JlIGVudGVyaW5nIGd1ZXN0CgpKYW4KCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
