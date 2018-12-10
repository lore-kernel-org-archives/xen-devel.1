From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86emul: permit SAE for V{,U}COMIS{S,D}
Date: Mon, 10 Dec 2018 04:32:41 -0700
Message-ID: <5C0E4ED902000078002049CB@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gWJnr-0006XH-2F
 for xen-devel@lists.xenproject.org; Mon, 10 Dec 2018 11:32:47 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGF2eDUxMl92bGVuX2NoZWNrKCkgaW52b2NhdGlvbiBuZWVkcyB0byBiZSBjb25kaXRpb25h
bC4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBh
L3hlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jCisrKyBiL3hlbi9hcmNoL3g4
Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jCkBAIC02MTc5LDcgKzYxNzksOCBAQCB4ODZfZW11
bGF0ZSgKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBldmV4LncgIT0gZXZleC5wZngp
LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRVhDX1VEKTsKICAgICAgICAgaG9zdF9h
bmRfdmNwdV9tdXN0X2hhdmUoYXZ4NTEyZik7Ci0gICAgICAgIGF2eDUxMl92bGVuX2NoZWNrKHRy
dWUpOworICAgICAgICBpZiAoICFldmV4LmJyICkKKyAgICAgICAgICAgIGF2eDUxMl92bGVuX2No
ZWNrKHRydWUpOwogICAgICAgICBnZXRfZnB1KFg4NkVNVUxfRlBVX3ptbSk7CiAKICAgICAgICAg
b3BjID0gaW5pdF9ldmV4KHN0dWIpOwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
