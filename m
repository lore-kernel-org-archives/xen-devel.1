From: wangbo <wdjjwb@163.com>
Subject: [PATCH] pvcalls-front: Replace GFP_KERNEL with
 GFP_ATOMIC in create_active
Date: Mon, 14 Jan 2019 23:48:29 +0800
Message-ID: <1547480909-11844-1-git-send-email-wdjjwb__8502.31539593569$1547485727$gmane$org@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uaee=PW=163.com=wdjjwb@srs-us1.protection.inumbo.net>)
 id 1gj4VR-0004Qg-3G
 for xen-devel@lists.xenproject.org; Mon, 14 Jan 2019 15:50:29 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, wang.bo116@zte.com.cn, sstabellini@kernel.org, wangbo <wdjjwb@163.com>
List-Id: xen-devel@lists.xenproject.org

Q3JlYXRlX2FjdGl2ZSBtYXkgY2FsbGVkIGluc2lkZSBzcGlubG9jayxyZXBsYWNlIEdGUF9LRVJO
RUwgd2l0aCBHRlBfQVRPTUlDCgpTaWduZWQtb2ZmLWJ5OiB3YW5nYm8gPHdhbmcuYm8xMTZAenRl
LmNvbS5jbj4KLS0tCiBkcml2ZXJzL3hlbi9wdmNhbGxzLWZyb250LmMgfCA0ICsrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy94ZW4vcHZjYWxscy1mcm9udC5jIGIvZHJpdmVycy94ZW4vcHZjYWxscy1mcm9udC5j
CmluZGV4IDc3MjI0ZDguLjMxYmQzYzkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL3B2Y2FsbHMt
ZnJvbnQuYworKysgYi9kcml2ZXJzL3hlbi9wdmNhbGxzLWZyb250LmMKQEAgLTM0NCwxMSArMzQ0
LDExIEBAIHN0YXRpYyBpbnQgY3JlYXRlX2FjdGl2ZShzdHJ1Y3Qgc29ja19tYXBwaW5nICptYXAs
IGludCAqZXZ0Y2huKQogCWluaXRfd2FpdHF1ZXVlX2hlYWQoJm1hcC0+YWN0aXZlLmluZmxpZ2h0
X2Nvbm5fcmVxKTsKIAogCW1hcC0+YWN0aXZlLnJpbmcgPSAoc3RydWN0IHB2Y2FsbHNfZGF0YV9p
bnRmICopCi0JCV9fZ2V0X2ZyZWVfcGFnZShHRlBfS0VSTkVMIHwgX19HRlBfWkVSTyk7CisJCV9f
Z2V0X2ZyZWVfcGFnZShHRlBfQVRPTUlDIHwgX19HRlBfWkVSTyk7CiAJaWYgKG1hcC0+YWN0aXZl
LnJpbmcgPT0gTlVMTCkKIAkJZ290byBvdXRfZXJyb3I7CiAJbWFwLT5hY3RpdmUucmluZy0+cmlu
Z19vcmRlciA9IFBWQ0FMTFNfUklOR19PUkRFUjsKLQlieXRlcyA9ICh2b2lkICopX19nZXRfZnJl
ZV9wYWdlcyhHRlBfS0VSTkVMIHwgX19HRlBfWkVSTywKKwlieXRlcyA9ICh2b2lkICopX19nZXRf
ZnJlZV9wYWdlcyhHRlBfQVRPTUlDIHwgX19HRlBfWkVSTywKIAkJCQkJUFZDQUxMU19SSU5HX09S
REVSKTsKIAlpZiAoYnl0ZXMgPT0gTlVMTCkKIAkJZ290byBvdXRfZXJyb3I7Ci0tIAoyLjcuNAoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
