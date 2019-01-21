From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 1/3] x86/pvh-dom0: Remove unnecessary function
 pointer call from modify_identity_mmio()
Date: Mon, 21 Jan 2019 15:37:19 +0000
Message-ID: <1548085041-23786-2-git-send-email-andrew.cooper3@citrix.com>
References: <1548085041-23786-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1548085041-23786-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RnVuY3Rpb24gcG9pbnRlciBjYWxscyBhcmUgZmFyIG1vcmUgZXhwZW5zaXZlIGluIGEgcG9zdC1T
cGVjdHJlIHdvcmxkLCBhbmQKdGhpcyBvbmUgZG9lc24ndCBuZWVkIHRvIGJlLgoKTm8gZnVuY3Rp
b25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6
IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0t
CiB4ZW4vYXJjaC94ODYvaHZtL2RvbTBfYnVpbGQuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvaHZtL2RvbTBfYnVpbGQuYyBiL3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jCmluZGV4
IDMwM2M0NGIuLjUxY2Y0OTAgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWls
ZC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jCkBAIC03OSw4ICs3OSw4IEBA
IHN0YXRpYyBpbnQgX19pbml0IG1vZGlmeV9pZGVudGl0eV9tbWlvKHN0cnVjdCBkb21haW4gKmQs
IHVuc2lnbmVkIGxvbmcgcGZuLAogCiAgICAgZm9yICggOyA7ICkKICAgICB7Ci0gICAgICAgIHJj
ID0gKG1hcCA/IG1hcF9tbWlvX3JlZ2lvbnMgOiB1bm1hcF9tbWlvX3JlZ2lvbnMpCi0gICAgICAg
ICAgICAgKGQsIF9nZm4ocGZuKSwgbnJfcGFnZXMsIF9tZm4ocGZuKSk7CisgICAgICAgIHJjID0g
bWFwID8gICBtYXBfbW1pb19yZWdpb25zKGQsIF9nZm4ocGZuKSwgbnJfcGFnZXMsIF9tZm4ocGZu
KSkKKyAgICAgICAgICAgICAgICAgOiB1bm1hcF9tbWlvX3JlZ2lvbnMoZCwgX2dmbihwZm4pLCBu
cl9wYWdlcywgX21mbihwZm4pKTsKICAgICAgICAgaWYgKCByYyA9PSAwICkKICAgICAgICAgICAg
IGJyZWFrOwogICAgICAgICBpZiAoIHJjIDwgMCApCi0tIAoyLjEuNAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
