From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] xen: Prevent buffer overflow in privcmd ioctl
Date: Thu, 4 Apr 2019 18:12:17 +0300
Message-ID: <20190404151217.GA22334@kadam>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cVMn=SG=oracle.com=dan.carpenter@srs-us1.protection.inumbo.net>)
 id 1hC42r-0001Qo-Pl
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2019 15:12:49 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, x86@kernel.org, kernel-janitors@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

VGhlICJjYWxsIiB2YXJpYWJsZSBjb21lcyBmcm9tIHRoZSB1c2VyIGluIHByaXZjbWRfaW9jdGxf
aHlwZXJjYWxsKCkuCkl0J3MgYW4gb2Zmc2V0IGludG8gdGhlIGh5cGVyY2FsbF9wYWdlW10gd2hp
Y2ggaGFzIChQQUdFX1NJWkUgLyAzMikKZWxlbWVudHMuICBXZSBuZWVkIHRvIHB1dCBhbiB1cHBl
ciBib3VuZCBvbiBpdCB0byBwcmV2ZW50IGFuIG91dCBvZgpib3VuZHMgYWNjZXNzLgoKRml4ZXM6
IDEyNDZhZTBiYjk5MiAoInhlbjogYWRkIHZhcmlhYmxlIGh5cGVyY2FsbCBjYWxsZXIiKQpTaWdu
ZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+Ci0tLQog
YXJjaC94ODYvaW5jbHVkZS9hc20veGVuL2h5cGVyY2FsbC5oIHwgMyArKysKIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS94
ZW4vaHlwZXJjYWxsLmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4vaHlwZXJjYWxsLmgKaW5k
ZXggZGU2ZjBkNTlhMjRmLi4yODYzYzIwMjY2NTUgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1
ZGUvYXNtL3hlbi9oeXBlcmNhbGwuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4vaHlw
ZXJjYWxsLmgKQEAgLTIwNiw2ICsyMDYsOSBAQCB4ZW5fc2luZ2xlX2NhbGwodW5zaWduZWQgaW50
IGNhbGwsCiAJX19IWVBFUkNBTExfREVDTFM7CiAJX19IWVBFUkNBTExfNUFSRyhhMSwgYTIsIGEz
LCBhNCwgYTUpOwogCisJaWYgKGNhbGwgPj0gUEFHRV9TSVpFIC8gc2l6ZW9mKGh5cGVyY2FsbF9w
YWdlWzBdKSkKKwkJcmV0dXJuIC1FSU5WQUw7CisKIAlhc20gdm9sYXRpbGUoQ0FMTF9OT1NQRUMK
IAkJICAgICA6IF9fSFlQRVJDQUxMXzVQQVJBTQogCQkgICAgIDogW3RodW5rX3RhcmdldF0gImEi
ICgmaHlwZXJjYWxsX3BhZ2VbY2FsbF0pCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
