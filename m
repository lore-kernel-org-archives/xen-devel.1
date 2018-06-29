From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH] Debian preseed: Disable security
 archive for jessie arm64
Date: Fri, 29 Jun 2018 12:34:59 +0100
Message-ID: <1530272099-26468-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gksc=jp=citrix.com=prvs=7118c3a32=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fYrgA-0001sM-3g
 for xen-devel@lists.xenproject.org; Fri, 29 Jun 2018 11:35:06 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Julien Grall <julien.grall@linaro.org>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

amVzc2llIGFybTY0IGlzIG91dCBvZiBzZWN1cml0eSBzdXBwb3J0LCBzZWUKICBodHRwczovL3dp
a2kuZGViaWFuLm9yZy9MVFMKYW5kIHRoZSBzZWN1cml0eSBhcmNoaXZlIGF0CiAgaHR0cDovL3Nl
Y3VyaXR5LmRlYmlhbi5vcmcvZGlzdHMvamVzc2llL3VwZGF0ZXMvbWFpbi9iaW5hcnktYXJtNjQK
aXMgZ29uZS4gIFRoaXMgY2F1c2VzIGF1dG9pbnN0YWxsYXRpb24gdG8gZmFpbC4gIFdlIGRvbid0
IHJlYWxseSBjYXJlCm11Y2ggYWJvdXQgdGhlIGxhY2sgb2Ygc2VjdXJpdHkgc3VwcG9ydCwgc28g
b3ZlcnJpZGUgdGhlIHNldCBvZiBgYXB0CnNlcnZpY2VzJy4KCkkgaGF2ZSB0ZXN0ZWQgdGhhdCB0
aGlzIGNhbiBvbmNlIGFnYWluIG5vdyBpbnN0YWxsIG9uIGFybTY0IG9uIG9uZSBvZgp0aGUgbGF4
dG9ucy4gIEJlY2F1c2UgY3VycmVudGx5IGFsbCBhcm02NCB0ZXN0cyBhcmUgYnJva2VuLCBhbmQg
dGhpcwpjaGFuZ2UgYWZmZWN0cyBvbmx5IGFybTY0LCBJIHdpbGwgZm9yY2UgcHVzaCBpdCByaWdo
dCBhd2F5LgoKQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGxpbmFyby5vcmc+CkNDOiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+ClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29u
IDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIE9zc3Rlc3QvRGViaWFuLnBtIHwgNSAr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL09zc3Rl
c3QvRGViaWFuLnBtIGIvT3NzdGVzdC9EZWJpYW4ucG0KaW5kZXggNGM5OGMyYS4uYzY4NTgyNSAx
MDA2NDQKLS0tIGEvT3NzdGVzdC9EZWJpYW4ucG0KKysrIGIvT3NzdGVzdC9EZWJpYW4ucG0KQEAg
LTkyOSw2ICs5MjksMTEgQEAgRU5ECiBkLWkgbWlycm9yL3N1aXRlIHN0cmluZyAkc3VpdGUKIEVO
RAogCisgICAgJHByZXNlZWQgLj0gPDwnRU5EJworZC1pIGFwdC1zZXR1cC9zZXJ2aWNlcy1zZWxl
Y3QgbXVsdGlzZWxlY3QgdXBkYXRlcworRU5ECisgICAgICAgIGlmICRzdWl0ZSA9fiBtL2plc3Np
ZS8gJiYgJHJ7YXJjaH0gZXEgJ2FybTY0JzsKKwogICAgICRwcmVzZWVkIC49IDw8IkVORCI7CiAK
ICMjIyBFTkQgT0YgREVCSUFOIFBSRVNFRUQgQkFTRQotLSAKMi4xLjQKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
