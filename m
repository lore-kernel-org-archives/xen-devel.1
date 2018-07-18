From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/2] x86/xstate: Fixes and improvements to
 xsetbv handling
Date: Wed, 18 Jul 2018 13:30:51 +0100
Message-ID: <1531917053-695-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QW5kcmV3IENvb3BlciAoMik6CiAgeDg2L3hzdGF0ZTogVXNlIHRoZSBDUFVJRCBwb2xpY3kgaW4g
dmFsaWRfeGNyMCgpLCByYXRoZXIgdGhhbiBhbGxvd2luZyBhbGwgZmVhdHVyZXMKICB4ODYveHN0
YXRlOiBNYWtlIGVycm9ycyBpbiB4c3RhdGUgY2FsY3VsYXRpb25zIG1vcmUgb2J2aW91cyBieSBj
cmFzaGluZyB0aGUgZG9tYWluCgogeGVuL2FyY2gveDg2L2RvbWN0bC5jICAgICAgICB8ICAyICst
CiB4ZW4vYXJjaC94ODYvaHZtL2h2bS5jICAgICAgIHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni94c3Rh
dGUuYyAgICAgICAgfCAzNyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tCiB4
ZW4vaW5jbHVkZS9hc20teDg2L3hzdGF0ZS5oIHwgIDUgKysrLS0KIDQgZmlsZXMgY2hhbmdlZCwg
MzQgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgotLSAKMi4xLjQKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
