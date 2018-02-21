From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC 03/10] x86/passthrough: io.c is used for HVM
	only
Date: Wed, 21 Feb 2018 21:46:54 +0000
Message-ID: <20180221214701.1646-4-wei.liu2@citrix.com>
References: <20180221214701.1646-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=igdh=fp=citrix.com=prvs=5836394aa=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eocEE-0001g1-G9
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2018 21:47:06 +0000
In-Reply-To: <20180221214701.1646-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tClRoaXMgZmls
ZSBoYXMgYSBmZXcgZnVuY3Rpb25zIHRoYXQgYXJlIGNhbGxlZCBpbiBvdGhlciBwbGFjZXMuIFdl
IG5lZWQKdG8gcHJvdmlkZSBzdHVicyBmb3IgdGhlbSBhdCBzb21lIHBvaW50LiBDdXJyZW50bHkg
dGhlIGRlY2xhcmF0aW9ucwphcmUgaW4gZGlmZmVyZW50IHBsYWNlcy4gV2hhdCBpcyB0aGUgcHJl
ZmVycmVkIG5hbWUgLyBsb2NhdGlvbiBmb3IgdGhlCnN0dWJzPwotLS0KIHhlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL3g4Ni9NYWtlZmlsZSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L3g4Ni9NYWtlZmlsZSBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9NYWtlZmlsZQppbmRl
eCAwYTIxYjYwYjVhLi4wMjY1OWJkOWY1IDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC94ODYvTWFrZWZpbGUKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L01ha2Vm
aWxlCkBAIC0yLDYgKzIsNiBAQCBzdWJkaXIteSArPSB2dGQKIHN1YmRpci15ICs9IGFtZAogCiBv
YmoteSArPSBhdHMubwotb2JqLXkgKz0gaW8ubworb2JqLSQoQ09ORklHX0hWTSkgKz0gaW8ubwog
b2JqLXkgKz0gaW9tbXUubwogb2JqLXkgKz0gcGNpLm8KLS0gCjIuMTEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
