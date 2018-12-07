From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 1/2] x86emul: fix vector-length check for
 AVX512F scalar fused-multiply-add insns
Date: Fri, 07 Dec 2018 04:17:59 -0700
Message-ID: <5C0A56E7020000780020401C@prv1-mh.provo.novell.com>
References: <5C0A55780200007800204012@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=I1NN=OQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gVE8z-0003OX-79
 for xen-devel@lists.xenproject.org; Fri, 07 Dec 2018 11:18:05 +0000
In-Reply-To: <5C0A55780200007800204012@prv1-mh.provo.novell.com>
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

VGhlIGNoZWNrIG5lZWRzIHRvIGhhcHBlbiB3aGVuZXZlciBFVkVYLmIgaXMgY2xlYXIsIG5vdCBq
dXN0IGluIHRoZQptZW1vcnkgb3BlcmFuZCBjYXNlLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4
Nl9lbXVsYXRlLmMKKysrIGIveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMK
QEAgLTg1MjYsMTEgKzg1MjYsOSBAQCB4ODZfZW11bGF0ZSgKICAgICBjYXNlIFg4NkVNVUxfT1BD
X0VWRVhfNjYoMHgwZjM4LCAweGJkKTogLyogdmZubWFkZDIzMXN7cyxkfSB4bW0vbWVtLHhtbSx4
bW17a30gKi8KICAgICBjYXNlIFg4NkVNVUxfT1BDX0VWRVhfNjYoMHgwZjM4LCAweGJmKTogLyog
dmZubXN1YjIzMXN7cyxkfSB4bW0vbWVtLHhtbSx4bW17a30gKi8KICAgICAgICAgaG9zdF9hbmRf
dmNwdV9tdXN0X2hhdmUoYXZ4NTEyZik7Ci0gICAgICAgIGlmICggZWEudHlwZSA9PSBPUF9NRU0g
KQotICAgICAgICB7Ci0gICAgICAgICAgICBnZW5lcmF0ZV9leGNlcHRpb25faWYoZXZleC5iciwg
RVhDX1VEKTsKKyAgICAgICAgZ2VuZXJhdGVfZXhjZXB0aW9uX2lmKGVhLnR5cGUgIT0gT1BfUkVH
ICYmIGV2ZXguYnIsIEVYQ19VRCk7CisgICAgICAgIGlmICggIWV2ZXguYnIgKQogICAgICAgICAg
ICAgYXZ4NTEyX3ZsZW5fY2hlY2sodHJ1ZSk7Ci0gICAgICAgIH0KICAgICAgICAgZ290byBzaW1k
X3ptbTsKIAogICAgIGNhc2UgWDg2RU1VTF9PUEMoMHgwZjM4LCAweGM4KTogICAgIC8qIHNoYTFu
ZXh0ZSB4bW0vbTEyOCx4bW0gKi8KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
