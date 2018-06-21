From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 1/4] TestSupport: Rename
 package_install_cmd to package_install_cmd\b/pkg_manager_install_cmd_line
Date: Thu, 21 Jun 2018 15:09:17 +0100
Message-ID: <1529590160-25104-2-git-send-email-ian.jackson@eu.citrix.com>
References: <1529590160-25104-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=g66k=jh=citrix.com=prvs=70384805a=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fW0HM-0001dm-2n
 for xen-devel@lists.xenproject.org; Thu, 21 Jun 2018 14:09:40 +0000
In-Reply-To: <1529590160-25104-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

ICBnaXQtbHMtZmlsZXMgfCB4YXJncyBwZXJsIC1pfiAtcGUgJ3MvXGJwYWNrYWdlX2luc3RhbGxf
Y21kXGIvcGtnX21hbmFnZXJfaW5zdGFsbF9jbWRfbGluZS9nJwoKU2lnbmVkLW9mZi1ieTogSWFu
IEphY2tzb24gPElhbi5KYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogT3NzdGVzdC9UZXN0U3Vw
cG9ydC5wbSB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL09zc3Rlc3QvVGVzdFN1cHBvcnQucG0gYi9Pc3N0ZXN0
L1Rlc3RTdXBwb3J0LnBtCmluZGV4IDEzNWNkYTMuLmZmZjNjNWIgMTAwNjQ0Ci0tLSBhL09zc3Rl
c3QvVGVzdFN1cHBvcnQucG0KKysrIGIvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbQpAQCAtNTI1LDcg
KzUyNSw3IEBAIHN1YiB0YXJnZXRfcHV0ZmlsZV9yb290ICgkJCQkOyQpIHsKICAgICB0cHV0Zmls
ZWV4KCdyb290JywgQF8pOwogfQogCi1zdWIgcGFja2FnZV9pbnN0YWxsX2NtZCAoJDskKSB7Citz
dWIgcGtnX21hbmFnZXJfaW5zdGFsbF9jbWRfbGluZSAoJDskKSB7CiAgICAgbXkgKCRobywgJG5v
cmVjKSA9IEBfOwogICAgIG15IEBjbWQ7CiAKQEAgLTU0MiwxMyArNTQyLDEzIEBAIHN1YiBwYWNr
YWdlX2luc3RhbGxfY21kICgkOyQpIHsKIH0KIHN1YiB0YXJnZXRfaW5zdGFsbF9wYWNrYWdlcyAo
JEApIHsKICAgICBteSAoJGhvLCBAcGFja2FnZXMpID0gQF87Ci0gICAgbXkgQGNtZCA9IHBhY2th
Z2VfaW5zdGFsbF9jbWQoJGhvKTsKKyAgICBteSBAY21kID0gcGtnX21hbmFnZXJfaW5zdGFsbF9j
bWRfbGluZSgkaG8pOwogCiAgICAgdGFyZ2V0X2NtZF9yb290KCRobywiQGNtZCBAcGFja2FnZXMi
LCAzMDAwKTsKIH0KIHN1YiB0YXJnZXRfaW5zdGFsbF9wYWNrYWdlc19ub3JlYyAoJEApIHsKICAg
ICBteSAoJGhvLCBAcGFja2FnZXMpID0gQF87Ci0gICAgbXkgQGNtZCA9IHBhY2thZ2VfaW5zdGFs
bF9jbWQoJGhvLCAxKTsKKyAgICBteSBAY21kID0gcGtnX21hbmFnZXJfaW5zdGFsbF9jbWRfbGlu
ZSgkaG8sIDEpOwogCiAgICAgdGFyZ2V0X2NtZF9yb290KCRobywiQGNtZCBAcGFja2FnZXMiLCAz
MDAwKTsKIH0KLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
