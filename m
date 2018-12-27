From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 0/4] x86/shim: minor fixes to the pv-shim mode
Date: Thu, 27 Dec 2018 16:56:10 +0100
Message-ID: <20181227155614.42292-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wa+V=PE=citrix.com=prvs=8928ed1c0=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gcY1F-0006Bj-Nl
 for xen-devel@lists.xenproject.org; Thu, 27 Dec 2018 15:56:21 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpUaGlzIHNlcmllcyBpbmNsdWRlcyBzb21lIG1pc2NlbGxhbmVvdXMgZml4ZXMgZm9y
IHRoZSBwdi1zaGltIG1vZGUsCnNwZWNpYWxseSByZWdhcmRpbmcgdGhlIGhhbmRsaW5nIG9mIHRo
ZSBtZW1vcnkgbWFwLgoKVGhhbmtzLCBSb2dlci4KClJvZ2VyIFBhdSBNb25uZSAoNCk6CiAgeDg2
L2U4MjA6IGludHJvZHVjZSBhIGZ1bmN0aW9uIHRvIHJlbW92ZSByYW5nZXMgZnJvbSBlODIwCiAg
eDg2L2U4MjA6IGRvIG5vdCBmaXh1cCBtZW1tYXAgaW4gY29weV9lODIwX21hcAogIHg4Ni9lODIw
OiBhc3N1bWUgbWVtbWFwIHByb3ZpZGVkIHdoZW4gYm9vdGVkIGFzIGEgWGVuIGd1ZXN0IGlzIGNv
cnJlY3QKICB4ODYvc2hpbTogb25seSBtYXJrIHNwZWNpYWwgcGFnZXMgYXMgUkFNIGluIHB2c2hp
bSBtb2RlCgogeGVuL2FyY2gveDg2L2U4MjAuYyAgICAgICAgICAgICB8IDg3ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKy0tLS0tLQogeGVuL2FyY2gveDg2L2d1ZXN0L3hlbi5jICAgICAgICB8
IDQyIC0tLS0tLS0tLS0tLS0tLS0KIHhlbi9hcmNoL3g4Ni9wdi9zaGltLmMgICAgICAgICAgfCA0
MyArKysrKysrKysrKysrKysrCiB4ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyAgICAgICAgIHwgIDQg
Ky0KIHhlbi9pbmNsdWRlL2FzbS14ODYvZTgyMC5oICAgICAgfCAgMiArCiB4ZW4vaW5jbHVkZS9h
c20teDg2L2d1ZXN0L3hlbi5oIHwgMTMgLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvcHYvc2hp
bS5oICAgfCAxMiArKysrKwogNyBmaWxlcyBjaGFuZ2VkLCAxMzAgaW5zZXJ0aW9ucygrKSwgNzMg
ZGVsZXRpb25zKC0pCgotLSAKMi4xNy4yIChBcHBsZSBHaXQtMTEzKQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
