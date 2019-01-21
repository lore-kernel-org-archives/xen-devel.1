From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH for-4.12 0/3] x86/pvh: Misc fixes and cleanup
Date: Mon, 21 Jan 2019 15:37:18 +0000
Message-ID: <1548085041-23786-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlc2UgYXJlIGFsbCBtaW5vciBmaXhlcyBmcm9tIHNvbWUgcmVjZW50IFBWSCB3b3JrLiAgVGhl
eSBhcmUgYWxsIGxpbWl0ZWQgdG8KdGhlIGJvb3QgcGF0aCwgYW5kIGxvdy1yaXNrIG5pY2UtdG8t
aGF2ZSdzIGZvciA0LjEyLgoKQW5kcmV3IENvb3BlciAoMyk6CiAgeDg2L3B2aC1kb20wOiBSZW1v
dmUgdW5uZWNlc3NhcnkgZnVuY3Rpb24gcG9pbnRlciBjYWxsIGZyb20gbW9kaWZ5X2lkZW50aXR5
X21taW8oKQogIHg4Ni9wdmg6IEZpeGVzIHRvIGNvbnZlcnRfcHZoX2luZm8oKQogIHg4Ni9wdmg6
IFByaW50IHRoZSBQVkggc3RhcnQgaW5mbyBtb3JlIGNvbmNpc2VseQoKIHhlbi9hcmNoL3g4Ni9n
dWVzdC9wdmgtYm9vdC5jIHwgNDggKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLS0tLQogeGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMgfCAgNCArKy0tCiAyIGZpbGVz
IGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQoKLS0gCjIuMS40CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
