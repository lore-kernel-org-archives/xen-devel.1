From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86: make arch_set_info_guest() match comments
 in load_segments()
Date: Tue, 10 Jul 2018 04:13:30 -0600
Message-ID: <5B4486CA02000078001D2907@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xfjl=j2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fcpeH-0006mZ-Cl
 for xen-devel@lists.xenproject.org; Tue, 10 Jul 2018 10:13:33 +0000
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

Rm9yIGJvdGggZnNfYmFzZSBhbmQgZ3NfYmFzZV91c2VyLCB0aGVyZSBhcmUgY29tbWVudHMgc2F5
aW5nICJUaGlzIGNhbgpvbmx5IGJlIG5vbi16ZXJvIGlmIHNlbGVjdG9yIGlzIE5VTEwuIiBXaGls
ZSBzYXZlX3NlZ21lbnRzKCkgZW5zdXJlcwp0aGlzLCBzbyBmYXIgYXJjaF9zZXRfaW5mb19ndWVz
dCgpIGRpZG4ndC4gTWFrZSBiZWhhdmlvciBjb25zaXN0ZW50CihhdHRhY2hpbmcgY29tbWVudHMg
aWRlbnRpY2FsIHRvIHRob3NlIGluIHNhdmVfc2VnbWVudHMoKSkuCgpTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vYXJjaC94ODYvZG9tYWlu
LmMKKysrIGIveGVuL2FyY2gveDg2L2RvbWFpbi5jCkBAIC05MzAsOSArOTMwLDEzIEBAIGludCBh
cmNoX3NldF9pbmZvX2d1ZXN0KAogICAgIGlmICggIWNvbXBhdCApCiAgICAgewogICAgICAgICB2
LT5hcmNoLnB2X3ZjcHUuc3lzY2FsbF9jYWxsYmFja19laXAgPSBjLm5hdC0+c3lzY2FsbF9jYWxs
YmFja19laXA7Ci0gICAgICAgIHYtPmFyY2gucHZfdmNwdS5mc19iYXNlID0gYy5uYXQtPmZzX2Jh
c2U7CisgICAgICAgIC8qIG5vbi1udWwgc2VsZWN0b3Iga2lsbHMgZnNfYmFzZSAqLworICAgICAg
ICB2LT5hcmNoLnB2X3ZjcHUuZnNfYmFzZSA9CisgICAgICAgICAgICAhKHYtPmFyY2gudXNlcl9y
ZWdzLmZzICYgfjMpID8gYy5uYXQtPmZzX2Jhc2UgOiAwOwogICAgICAgICB2LT5hcmNoLnB2X3Zj
cHUuZ3NfYmFzZV9rZXJuZWwgPSBjLm5hdC0+Z3NfYmFzZV9rZXJuZWw7Ci0gICAgICAgIHYtPmFy
Y2gucHZfdmNwdS5nc19iYXNlX3VzZXIgPSBjLm5hdC0+Z3NfYmFzZV91c2VyOworICAgICAgICAv
KiBub24tbnVsIHNlbGVjdG9yIGtpbGxzIGdzX2Jhc2VfdXNlciAqLworICAgICAgICB2LT5hcmNo
LnB2X3ZjcHUuZ3NfYmFzZV91c2VyID0KKyAgICAgICAgICAgICEodi0+YXJjaC51c2VyX3JlZ3Mu
Z3MgJiB+MykgPyBjLm5hdC0+Z3NfYmFzZV91c2VyIDogMDsKICAgICB9CiAgICAgZWxzZQogICAg
IHsKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
