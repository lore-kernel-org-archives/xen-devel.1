From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 4.9 and older] VMX: allow migration of guests
 with SSBD enabled
Date: Fri, 23 Nov 2018 01:29:39 -0700
Message-ID: <5BF7BA7302000078001FF399@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=WXFQ=OC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gQ6qL-0003df-6Y
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 08:29:41 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGJhY2twb3J0IG9mIGNkNTMwMjNkZjkgKCJ4ODYvbXNyOiBWaXJ0dWFsaXNlIE1TUl9TUEVD
X0NUUkwuU1NCRCBmb3IKZ3Vlc3RzIHRvIHVzZSIpIGRpZCBub3QgbWlycm9yIHRoZSBQViBzaWRl
IGNoYW5nZSBpbnRvIHRoZSBIVk0gKFZNWC0Kc3BlY2lmaWMpIGNvZGUgcGF0aC4KClNpZ25lZC1v
ZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9hcmNoL3g4
Ni9odm0vdm14L3ZteC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jCkBAIC05Nzgs
NyArOTgxLDggQEAgc3RhdGljIGludCB2bXhfbG9hZF9tc3Ioc3RydWN0IHZjcHUgKnYsCiAgICAg
ICAgICAgICAgKiBpZ25vcmVkKSB3aGVuIFNUSUJQIGlzbid0IGVudW1lcmF0ZWQgaW4gaGFyZHdh
cmUuCiAgICAgICAgICAgICAgKi8KICAgICAgICAgICAgIGVsc2UgaWYgKCBjdHh0LT5tc3JbaV0u
dmFsICYKLSAgICAgICAgICAgICAgICAgICAgICB+KFNQRUNfQ1RSTF9JQlJTIHwgU1BFQ19DVFJM
X1NUSUJQKSApCisgICAgICAgICAgICAgICAgICAgICAgfihTUEVDX0NUUkxfSUJSUyB8IFNQRUNf
Q1RSTF9TVElCUCB8CisgICAgICAgICAgICAgICAgICAgICAgICAodi0+ZG9tYWluLT5hcmNoLmNw
dWlkLT5mZWF0LnNzYmQgPyBTUEVDX0NUUkxfU1NCRCA6IDApKSApCiAgICAgICAgICAgICAgICAg
ZXJyID0gLUVOWElPOwogICAgICAgICAgICAgZWxzZQogICAgICAgICAgICAgICAgIHYtPmFyY2gu
c3BlY19jdHJsID0gY3R4dC0+bXNyW2ldLnZhbDsKCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
