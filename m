From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 0/2] x86/xstate: Fixes and improvements to
 xsetbv handling
Date: Thu, 19 Jul 2018 12:44:41 +0100
Message-ID: <1532000683-23429-1-git-send-email-andrew.cooper3@citrix.com>
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

QW5kcmV3IENvb3BlciAoMik6CiAgeDg2L3hzdGF0ZTogVXNlIGEgZ3Vlc3RzIENQVUlEIHBvbGlj
eSwgcmF0aGVyIHRoYW4gYWxsb3dpbmcgYWxsIGZlYXR1cmVzCiAgeDg2L3hzdGF0ZTogTWFrZSBl
cnJvcnMgaW4geHN0YXRlIGNhbGN1bGF0aW9ucyBtb3JlIG9idmlvdXMgYnkgY3Jhc2hpbmcgdGhl
IGRvbWFpbgoKIHhlbi9hcmNoL3g4Ni9kb21jdGwuYyAgICAgICAgfCAgMiArLQogeGVuL2FyY2gv
eDg2L2h2bS9odm0uYyAgICAgICB8ICAyICstCiB4ZW4vYXJjaC94ODYveHN0YXRlLmMgICAgICAg
IHwgMzcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQogeGVuL2luY2x1ZGUv
YXNtLXg4Ni94c3RhdGUuaCB8ICA1ICsrKy0tCiA0IGZpbGVzIGNoYW5nZWQsIDM2IGluc2VydGlv
bnMoKyksIDEwIGRlbGV0aW9ucygtKQoKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
