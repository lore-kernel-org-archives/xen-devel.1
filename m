From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] VMX: make vmx_read_guest_msr() cope with
 callers not checking its return value
Date: Wed, 15 Aug 2018 05:34:04 -0600
Message-ID: <5B740FAC02000078001DE559@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=e0/s=k6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fpu41-0003az-Dh
 for xen-devel@lists.xenproject.org; Wed, 15 Aug 2018 11:34:09 +0000
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

SXQgdG9vayB0aWxsIHRoZSA0LjUgYmFja3BvcnRzIG9mIHRoZSBMMVRGIHByZXJlcXMgdGhhdCBn
Y2MgOC4yIGZpbmFsbHkKbm90aWNlZCB0aGF0IHRoZSB2UE1VIGNhbGxlcnMsIG5vdCBjaGVja2lu
ZyB0aGUgZnVuY3Rpb24ncyByZXR1cm4gdmFsdWUsCm1heSBjb25zdW1lIHVuaW5pdGlhbGl6ZWQg
ZGF0YS4gR3VhcmQgYWdhaW5zdCB0aGlzIGJ5IHN0b3JpbmcgemVybyBvbgp0aGUgZXJyb3IgcGF0
aC4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBh
L3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZteC92bWNzLmgKKysrIGIveGVuL2luY2x1ZGUvYXNt
LXg4Ni9odm0vdm14L3ZtY3MuaApAQCAtNTg2LDcgKzU4NiwxMCBAQCBzdGF0aWMgaW5saW5lIGlu
dCB2bXhfcmVhZF9ndWVzdF9tc3IoY29uCiAgICAgY29uc3Qgc3RydWN0IHZteF9tc3JfZW50cnkg
KmVudCA9IHZteF9maW5kX21zcih2LCBtc3IsIFZNWF9NU1JfR1VFU1QpOwogCiAgICAgaWYgKCAh
ZW50ICkKKyAgICB7CisgICAgICAgICp2YWwgPSAwOwogICAgICAgICByZXR1cm4gLUVTUkNIOwor
ICAgIH0KIAogICAgICp2YWwgPSBlbnQtPmRhdGE7CiAKCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
