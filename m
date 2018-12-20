From: Pu Wen <puwen@hygon.cn>
Subject: [PATCH 13/15] x86/xstate: Add Hygon Dhyana support
Date: Thu, 20 Dec 2018 21:15:38 +0800
Message-ID: <824969aace3e80e2909f600fa40e4e3713e25d96.1545284932.git.puwen@hygon.cn>
References: <cover.1545284932.git.puwen@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VrHp=O5=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1gZyBE-0002Y0-0W
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 13:16:00 +0000
In-Reply-To: <cover.1545284932.git.puwen@hygon.cn>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Pu Wen <puwen@hygon.cn>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIEh5Z29uIERoeWFuYSBDUFUgZG9uJ3Qgc2F2ZS9yZXN0b3JlIEZEUC9GSVAvRk9QIHVubGVz
cyBhbiBleGNlcHRpb24KaXMgcGVuZGluZy4gU28gYWRkIHN1cHBvcnQgZm9yIGl0IGluIHRoZSBm
dW5jdGlvbiB4cnN0b3IuCgpTaWduZWQtb2ZmLWJ5OiBQdSBXZW4gPHB1d2VuQGh5Z29uLmNuPgot
LS0KIHhlbi9hcmNoL3g4Ni94c3RhdGUuYyB8IDUgKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3hz
dGF0ZS5jIGIveGVuL2FyY2gveDg2L3hzdGF0ZS5jCmluZGV4IDE1ZWRkNWQuLjk2MjE3N2YgMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni94c3RhdGUuYworKysgYi94ZW4vYXJjaC94ODYveHN0YXRl
LmMKQEAgLTM2OSw3ICszNjksNyBAQCB2b2lkIHhyc3RvcihzdHJ1Y3QgdmNwdSAqdiwgdWludDY0
X3QgbWFzaykKICAgICB1bnNpZ25lZCBpbnQgZmF1bHRzLCBwcmV2X2ZhdWx0czsKIAogICAgIC8q
Ci0gICAgICogQU1EIENQVXMgZG9uJ3Qgc2F2ZS9yZXN0b3JlIEZEUC9GSVAvRk9QIHVubGVzcyBh
biBleGNlcHRpb24KKyAgICAgKiBBTUQgb3IgSHlnb24gQ1BVcyBkb24ndCBzYXZlL3Jlc3RvcmUg
RkRQL0ZJUC9GT1AgdW5sZXNzIGFuIGV4Y2VwdGlvbgogICAgICAqIGlzIHBlbmRpbmcuIENsZWFy
IHRoZSB4ODcgc3RhdGUgaGVyZSBieSBzZXR0aW5nIGl0IHRvIGZpeGVkCiAgICAgICogdmFsdWVz
LiBUaGUgaHlwZXJ2aXNvciBkYXRhIHNlZ21lbnQgY2FuIGJlIHNvbWV0aW1lcyAwIGFuZAogICAg
ICAqIHNvbWV0aW1lcyBuZXcgdXNlciB2YWx1ZS4gQm90aCBzaG91bGQgYmUgb2suIFVzZSB0aGUg
RlBVIHNhdmVkCkBAIC0zNzcsNyArMzc3LDggQEAgdm9pZCB4cnN0b3Ioc3RydWN0IHZjcHUgKnYs
IHVpbnQ2NF90IG1hc2spCiAgICAgICovCiAgICAgaWYgKCAobWFzayAmIHB0ci0+eHNhdmVfaGRy
LnhzdGF0ZV9idiAmIFg4Nl9YQ1IwX0ZQKSAmJgogICAgICAgICAgIShwdHItPmZwdV9zc2UuZnN3
ICYgfnB0ci0+ZnB1X3NzZS5mY3cgJiAweDAwM2YpICYmCi0gICAgICAgICBib290X2NwdV9kYXRh
Lng4Nl92ZW5kb3IgPT0gWDg2X1ZFTkRPUl9BTUQgKQorICAgICAgICAgKGJvb3RfY3B1X2RhdGEu
eDg2X3ZlbmRvciA9PSBYODZfVkVORE9SX0FNRCB8fAorICAgICAgICAgIGJvb3RfY3B1X2RhdGEu
eDg2X3ZlbmRvciA9PSBYODZfVkVORE9SX0hZR09OKSApCiAgICAgICAgIGFzbSB2b2xhdGlsZSAo
ICJmbmNsZXhcblx0IiAgICAgICAgLyogY2xlYXIgZXhjZXB0aW9ucyAqLwogICAgICAgICAgICAg
ICAgICAgICAgICAiZmZyZWUgJSVzdCg3KVxuXHQiIC8qIGNsZWFyIHN0YWNrIHRhZyAqLwogICAg
ICAgICAgICAgICAgICAgICAgICAiZmlsZGwgJTAiICAgICAgICAgIC8qIGxvYWQgdG8gY2xlYXIg
c3RhdGUgKi8KLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
