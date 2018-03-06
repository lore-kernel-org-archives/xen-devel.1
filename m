From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 4/3] tests/x86emul: Save and restore FPU state
	in the middle of emulation
Date: Tue, 6 Mar 2018 20:37:08 +0000
Message-ID: <1520368628-17371-1-git-send-email-andrew.cooper3@citrix.com>
References: <1520367892-15055-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1520367892-15055-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VXNpbmcgbGliYyBmdW5jdGlvbnMgaW4gdGhlIG1pZGRsZSBvZiBlbXVsYXRpb24gbWF5IGNvcnJ1
cHQgRlBVIHN0YXRlLiAgU2F2ZQphbmQgcmVzdG9yZSBGUFUgc3RhdGUgYXJvdW5kIHRoZSBwcm9n
cmVzcyBtYXJrZXIgd2hpY2ggaXMgdGhlIG9ubHkgY3VycmVudApsaWJjIGZ1bmN0aW9uIG9uIHRo
ZSBzdWNjZXNzIHBhdGguCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4K
LS0tCiB0b29scy90ZXN0cy94ODZfZW11bGF0b3IvdGVzdF94ODZfZW11bGF0b3IuYyB8IDUgKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90b29scy90
ZXN0cy94ODZfZW11bGF0b3IvdGVzdF94ODZfZW11bGF0b3IuYyBiL3Rvb2xzL3Rlc3RzL3g4Nl9l
bXVsYXRvci90ZXN0X3g4Nl9lbXVsYXRvci5jCmluZGV4IDZlMjQ2MzcuLjg5NGE0NGMgMTAwNjQ0
Ci0tLSBhL3Rvb2xzL3Rlc3RzL3g4Nl9lbXVsYXRvci90ZXN0X3g4Nl9lbXVsYXRvci5jCisrKyBi
L3Rvb2xzL3Rlc3RzL3g4Nl9lbXVsYXRvci90ZXN0X3g4Nl9lbXVsYXRvci5jCkBAIC0zNDkxLDcg
KzM0OTEsMTIgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQogICAgICAgICAgICAg
ICAgIHJlZ3MuZWlwIDwgKHVuc2lnbmVkIGxvbmcpcmVzICsgYmxvYnNbal0uc2l6ZSApCiAgICAg
ICAgIHsKICAgICAgICAgICAgIGlmICggKGkrKyAmIDgxOTEpID09IDAgKQorICAgICAgICAgICAg
eworICAgICAgICAgICAgICAgIGVtdWxfc2F2ZV9mcHVfc3RhdGUoKTsKICAgICAgICAgICAgICAg
ICBwcmludGYoIi4iKTsKKyAgICAgICAgICAgICAgICBlbXVsX3Jlc3RvcmVfZnB1X3N0YXRlKCk7
CisgICAgICAgICAgICB9CisKICAgICAgICAgICAgIHJjID0geDg2X2VtdWxhdGUoJmN0eHQsICZl
bXVsb3BzKTsKICAgICAgICAgICAgIGlmICggcmMgIT0gWDg2RU1VTF9PS0FZICkKICAgICAgICAg
ICAgIHsKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
