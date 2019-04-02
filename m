From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/3] x86/smt: Runtime SMT controls
Date: Tue, 2 Apr 2019 20:57:25 +0100
Message-ID: <1554235048-3373-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBpcyBzb21lIHdvcmsgd2hpY2ggd2FzIGRpc2N1c3NlZCBmb3IgTDFURiBhbmQgbmV2ZXIg
Z290IGZpbmlzaGVkLgpUZXN0aW5nIGZvciB0aGlzIHdvcmsgaXMgd2hhdCBkaXNjb3ZlcmVkIHRo
ZSBjcHUgb25saW5lL29mZmxpbmUgbWVtb3J5IGxlYWsuCgpBbmRyZXcgQ29vcGVyICgzKToKICB4
ZW4vY3B1OiBEaXN0aW5ndWlzaCAiY3B1IGFscmVhZHkgaW4gdGhhdCBzdGF0ZSIgaW4gY3B1X3t1
cCxkb3dufSgpCiAgeDg2L3N5c2N0bDogQ2xlYW4gdXAgWEVOX1NZU0NUTF9jcHVfaG90cGx1Zwog
IHg4NjogU3VwcG9ydCBmb3IgZW5hYmxpbmcvZGlzYWJsaW5nIFNNVCBhdCBydW50aW1lCgogdG9v
bHMvbGlieGMvaW5jbHVkZS94ZW5jdHJsLmggICB8ICAgMiArCiB0b29scy9saWJ4Yy94Y19jcHVf
aG90cGx1Zy5jICAgIHwgIDI2ICsrKysrKysrKwogdG9vbHMvbWlzYy94ZW4taHB0b29sLmMgICAg
ICAgICB8ICA1NiArKysrKysrKysrKysrKysrKysKIHhlbi9hcmNoL3g4Ni9zZXR1cC5jICAgICAg
ICAgICAgfCAgIDIgKy0KIHhlbi9hcmNoL3g4Ni9zeXNjdGwuYyAgICAgICAgICAgfCAxMjYgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQogeGVuL2NvbW1vbi9jcHUuYyAg
ICAgICAgICAgICAgICB8ICAyNiArKysrKy0tLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvcHJvY2Vz
c29yLmggfCAgIDEgKwogeGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oICAgICB8ICAgOSArKysK
IDggZmlsZXMgY2hhbmdlZCwgMjI2IGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQoKLS0g
CjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
