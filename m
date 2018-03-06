From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/3] tests/x86emul: Fix register corruption in
	the test harness
Date: Tue, 6 Mar 2018 20:24:49 +0000
Message-ID: <1520367892-15055-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIG1haW4gYnVnZml4IGlzIGluIHBhdGNoIDIuICBQYXRjaCAzIGlzIHNvbWUgZXh0cmEgZGVi
dWdnaW5nIGRldmVsb3BlZAp3aGlsZSBpbnZlc3RpZ2F0aW5nIHRoZSBpc3N1ZS4KCkFuZHJldyBD
b29wZXIgKDMpOgogIHRlc3RzL3g4NmVtdWw6IEhlbHBlcnMgdG8gc2F2ZSBhbmQgcmVzdG9yZSBG
UFUgc3RhdGUKICB0ZXN0cy94ODZlbXVsOiBTYXZlIGFuZCByZXN0b3JlIEZQVSBzdGF0ZSBpbiB0
aGUgZW11bGF0b3IgY2FsbGJhY2tzCiAgdGVzdHMveDg2ZW11bDogSW1wcm92ZSB0aGUgdXRpbGl0
eSBvZiB2ZXJib3NlIG1vZGUKCiB0b29scy90ZXN0cy94ODZfZW11bGF0b3IvdGVzdF94ODZfZW11
bGF0b3IuYyB8IDE4NSArKysrKysrKysrKysrKysrKysrKysrKy0tLS0KIHRvb2xzL3Rlc3RzL3g4
Nl9lbXVsYXRvci94ODYtZW11bGF0ZS5jICAgICAgIHwgIDcwICsrKysrKysrLS0KIHRvb2xzL3Rl
c3RzL3g4Nl9lbXVsYXRvci94ODYtZW11bGF0ZS5oICAgICAgIHwgICA0ICsKIDMgZmlsZXMgY2hh
bmdlZCwgMjIyIGluc2VydGlvbnMoKyksIDM3IGRlbGV0aW9ucygtKQoKLS0gCjIuMS40CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
