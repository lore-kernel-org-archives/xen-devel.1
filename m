From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: [PATCH] xen/x86/vpmu: Zero struct pt_regs before
 calling into sample handling code
Date: Thu, 12 Jul 2018 13:27:00 -0400
Message-ID: <1531416420-3580-1-git-send-email-boris.ostrovsky__20498.3122217984$1531415904$gmane$org@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jz0u=j4=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fdfFS-00070D-Fr
 for xen-devel@lists.xenproject.org; Thu, 12 Jul 2018 17:19:22 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: mark.rutland@arm.com, jgross@suse.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T3RoZXJ3aXNlIHdlIG1heSBsZWFrIGtlcm5lbCBzdGFjayBmb3IgZXZlbnRzIHRoYXQgc2FtcGxl
IHVzZXIKcmVnaXN0ZXJzLgoKUmVwb3J0ZWQtYnk6IE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5k
QGFybS5jb20+ClNpZ25lZC1vZmYtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5
QG9yYWNsZS5jb20+CkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCi0tLQogYXJjaC94ODYveGVu
L3BtdS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL3BtdS5jIGIvYXJjaC94ODYveGVuL3BtdS5j
CmluZGV4IDdkMDBkNGEuLjk1OTk3ZTYgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L3hlbi9wbXUuYwor
KysgYi9hcmNoL3g4Ni94ZW4vcG11LmMKQEAgLTQ3OCw3ICs0NzgsNyBAQCBzdGF0aWMgdm9pZCB4
ZW5fY29udmVydF9yZWdzKGNvbnN0IHN0cnVjdCB4ZW5fcG11X3JlZ3MgKnhlbl9yZWdzLAogaXJx
cmV0dXJuX3QgeGVuX3BtdV9pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkZXZfaWQpCiB7CiAJ
aW50IGVyciwgcmV0ID0gSVJRX05PTkU7Ci0Jc3RydWN0IHB0X3JlZ3MgcmVnczsKKwlzdHJ1Y3Qg
cHRfcmVncyByZWdzID0gezB9OwogCWNvbnN0IHN0cnVjdCB4ZW5fcG11X2RhdGEgKnhlbnBtdV9k
YXRhID0gZ2V0X3hlbnBtdV9kYXRhKCk7CiAJdWludDhfdCB4ZW5wbXVfZmxhZ3MgPSBnZXRfeGVu
cG11X2ZsYWdzKCk7CiAKLS0gCjEuOC4zLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
