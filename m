From: Colin King <colin.king@canonical.com>
Subject: [PATCH][next] xen/gntdev: don't dereference a null
 gntdev_dmabuf on allocation failure
Date: Tue, 31 Jul 2018 15:02:25 +0100
Message-ID: <20180731140225.22717-1-colin.king__44905.7121099488$1533045685$gmane$org@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lahv=kp=canonical.com=colin.king@srs-us1.protection.inumbo.net>)
 id 1fkVEO-0000k3-8h
 for xen-devel@lists.xenproject.org; Tue, 31 Jul 2018 14:02:32 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KCkN1cnJlbnRs
eSB3aGVuIHRoZSBhbGxvY2F0aW9uIG9mIGdudGRldl9kbWFidWYgZmFpbHMsIHRoZSBlcnJvciBl
eGl0CnBhdGggd2lsbCBjYWxsIGRtYWJ1Zl9pbXBfZnJlZV9zdG9yYWdlIGFuZCBjYXVzZXMgYSBu
dWxsIHBvaW50ZXIKZGVyZWZlcmVuY2Ugb24gZ250ZGV2X2RtYWJ1Zi4gIEZpeCB0aGlzIGJ5IGFk
ZGluZyBhbiBlcnJvciBleGl0IHBhdGgKdGhhdCB3b24ndCBmcmVlIGdudGRldl9kbWFidWYuCgpE
ZXRlY3RlZCBieSBDb3Zlcml0eVNjYW4sIENJRCMxNDcyMTI0ICgiRGVyZWZlcmVuY2UgYWZ0ZXIg
bnVsbCBjaGVjayIpCgpGaXhlczogYmY4ZGM1NWIxMzU4ICgieGVuL2dudGRldjogSW1wbGVtZW50
IGRtYS1idWYgaW1wb3J0IGZ1bmN0aW9uYWxpdHkiKQpTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4g
S2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgotLS0KIGRyaXZlcnMveGVuL2dudGRldi1k
bWFidWYuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vZ250ZGV2LWRtYWJ1Zi5jIGIvZHJpdmVy
cy94ZW4vZ250ZGV2LWRtYWJ1Zi5jCmluZGV4IDc0NGNmZTliMDMxMS4uY2JhNmI1ODZiZmJkIDEw
MDY0NAotLS0gYS9kcml2ZXJzL3hlbi9nbnRkZXYtZG1hYnVmLmMKKysrIGIvZHJpdmVycy94ZW4v
Z250ZGV2LWRtYWJ1Zi5jCkBAIC01NjgsNyArNTY4LDcgQEAgc3RhdGljIHN0cnVjdCBnbnRkZXZf
ZG1hYnVmICpkbWFidWZfaW1wX2FsbG9jX3N0b3JhZ2UoaW50IGNvdW50KQogCiAJZ250ZGV2X2Rt
YWJ1ZiA9IGt6YWxsb2Moc2l6ZW9mKCpnbnRkZXZfZG1hYnVmKSwgR0ZQX0tFUk5FTCk7CiAJaWYg
KCFnbnRkZXZfZG1hYnVmKQotCQlnb3RvIGZhaWw7CisJCWdvdG8gZmFpbF9ub19mcmVlOwogCiAJ
Z250ZGV2X2RtYWJ1Zi0+dS5pbXAucmVmcyA9IGtjYWxsb2MoY291bnQsCiAJCQkJCSAgICBzaXpl
b2YoZ250ZGV2X2RtYWJ1Zi0+dS5pbXAucmVmc1swXSksCkBAIC01OTEsNiArNTkxLDcgQEAgc3Rh
dGljIHN0cnVjdCBnbnRkZXZfZG1hYnVmICpkbWFidWZfaW1wX2FsbG9jX3N0b3JhZ2UoaW50IGNv
dW50KQogCiBmYWlsOgogCWRtYWJ1Zl9pbXBfZnJlZV9zdG9yYWdlKGdudGRldl9kbWFidWYpOwor
ZmFpbF9ub19mcmVlOgogCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOwogfQogCi0tIAoyLjE3LjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
