From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH] x86/acpi: process softirqs while printing CPU
	ACPI data
Date: Wed, 24 Jan 2018 10:14:40 +0000
Message-ID: <20180124101440.80750-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=rcjb=et=citrix.com=prvs=555701784=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eeI55-0001TL-QR
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 10:14:59 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T3IgZWxzZSB0aGUgd2F0Y2hkb2cgdHJpZ2dlcnMgb24gYm94ZXMgd2l0aCBhIGh1Z2UgbnVtYmVy
IG9mIENQVXMKClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgpSZXBvcnRlZC1ieTogU2ltb24gQ3Jvd2UgPHNpbW9uLmNyb3dlQGNpdHJpeC5jb20+
Ci0tLQpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvYWNwaS9jcHVf
aWRsZS5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvYWNwaS9jcHVfaWRsZS5jIGIveGVuL2FyY2gveDg2L2FjcGkvY3B1
X2lkbGUuYwppbmRleCBjYjFjNWRhMzZjLi5iYWQyNzg1ZTM3IDEwMDY0NAotLS0gYS94ZW4vYXJj
aC94ODYvYWNwaS9jcHVfaWRsZS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9hY3BpL2NwdV9pZGxlLmMK
QEAgLTM1Miw3ICszNTIsMTAgQEAgc3RhdGljIHZvaWQgZHVtcF9jeCh1bnNpZ25lZCBjaGFyIGtl
eSkKICAgICBwcmludGsoIiclYycgcHJlc3NlZCAtPiBwcmludGluZyBBQ1BJIEN4IHN0cnVjdHVy
ZXNcbiIsIGtleSk7CiAgICAgZm9yX2VhY2hfb25saW5lX2NwdSAoIGNwdSApCiAgICAgICAgIGlm
IChwcm9jZXNzb3JfcG93ZXJzW2NwdV0pCisgICAgICAgIHsKICAgICAgICAgICAgIHByaW50X2Fj
cGlfcG93ZXIoY3B1LCBwcm9jZXNzb3JfcG93ZXJzW2NwdV0pOworICAgICAgICAgICAgcHJvY2Vz
c19wZW5kaW5nX3NvZnRpcnFzKCk7CisgICAgICAgIH0KIH0KIAogc3RhdGljIGludCBfX2luaXQg
Y3B1X2lkbGVfa2V5X2luaXQodm9pZCkKLS0gCjIuMTUuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
