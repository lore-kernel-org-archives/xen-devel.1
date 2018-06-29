From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86/HPET: drop useless check
Date: Fri, 29 Jun 2018 07:11:29 -0600
Message-ID: <5B36300102000078001CF273@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=gccx=jp=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fYtBS-0000zh-Kl
 for xen-devel@lists.xenproject.org; Fri, 29 Jun 2018 13:11:30 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Q29tbWl0IDllMDUxYTg0MGQgKCJ4ODYvaHBldDogSW1wcm92ZSBoYW5kbGluZyBvZiB0aW1lcl9k
ZWFkbGluZSIpCnJlbW92ZWQgYWxsIGNvZGUgYmV0d2VlbiBmb3JfZWFjaF9jcHUoKSBhbmQgY3B1
bWFza190ZXN0X2NwdSgpLApyZW5kZXJpbmcgdGhlIGxhdHRlciBwb2ludGxlc3MuCgpTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vYXJjaC94
ODYvaHBldC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9ocGV0LmMKQEAgLTE4NywxMiArMTg3LDcgQEAg
YWdhaW46CiAgICAgLyogZmluZCBhbGwgZXhwaXJlZCBldmVudHMgKi8KICAgICBmb3JfZWFjaF9j
cHUoY3B1LCBjaC0+Y3B1bWFzaykKICAgICB7Ci0gICAgICAgIHNfdGltZV90IGRlYWRsaW5lOwot
Ci0gICAgICAgIGlmICggIWNwdW1hc2tfdGVzdF9jcHUoY3B1LCBjaC0+Y3B1bWFzaykgKQotICAg
ICAgICAgICAgY29udGludWU7Ci0KLSAgICAgICAgZGVhZGxpbmUgPSBBQ0NFU1NfT05DRShwZXJf
Y3B1KHRpbWVyX2RlYWRsaW5lLCBjcHUpKTsKKyAgICAgICAgc190aW1lX3QgZGVhZGxpbmUgPSBB
Q0NFU1NfT05DRShwZXJfY3B1KHRpbWVyX2RlYWRsaW5lLCBjcHUpKTsKIAogICAgICAgICBpZiAo
IGRlYWRsaW5lIDw9IG5vdyApCiAgICAgICAgICAgICBfX2NwdW1hc2tfc2V0X2NwdShjcHUsICZt
YXNrKTsKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
