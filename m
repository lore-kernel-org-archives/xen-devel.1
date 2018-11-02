From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] x86: put vcpumask_to_pcpumask under CONFIG_PV
Date: Fri, 2 Nov 2018 19:28:51 +0000
Message-ID: <20181102192851.733-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=1awx=nn=citrix.com=prvs=837bb29b5=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gIf7m-0001ie-VK
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 19:28:55 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBmdW5jdGlvbiBpcyB1c2VkIGJ5IFBWIGNvZGUgb25seS4gVGhpcyBpc3N1ZSBpcyBkaXNj
b3ZlcmVkIGJ5CmNsYW5nIGJ1aWxkLgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvbW0uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9tbS5jIGIveGVuL2FyY2gveDg2L21tLmMKaW5kZXggZjk2Njc4ZjQ2ZC4uMDFlYzZhYTJiZiAx
MDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tLmMKKysrIGIveGVuL2FyY2gveDg2L21tLmMKQEAg
LTMwNTcsNiArMzA1Nyw3IEBAIGludCBuZXdfZ3Vlc3RfY3IzKG1mbl90IG1mbikKICNlbmRpZgog
fQogCisjaWZkZWYgQ09ORklHX1BWCiBzdGF0aWMgaW5saW5lIGludCB2Y3B1bWFza190b19wY3B1
bWFzaygKICAgICBzdHJ1Y3QgZG9tYWluICpkLCBYRU5fR1VFU1RfSEFORExFX1BBUkFNKGNvbnN0
X3ZvaWQpIGJtYXAsIGNwdW1hc2tfdCAqcG1hc2spCiB7CkBAIC0zMDk5LDcgKzMxMDAsNiBAQCBz
dGF0aWMgaW5saW5lIGludCB2Y3B1bWFza190b19wY3B1bWFzaygKICAgICB9CiB9CiAKLSNpZmRl
ZiBDT05GSUdfUFYKIHN0YXRpYyBzdHJ1Y3QgZG9tYWluICpnZXRfcGdfb3duZXIoZG9taWRfdCBk
b21pZCkKIHsKICAgICBzdHJ1Y3QgZG9tYWluICpwZ19vd25lciA9IE5VTEwsICpjdXJyID0gY3Vy
cmVudC0+ZG9tYWluOwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
