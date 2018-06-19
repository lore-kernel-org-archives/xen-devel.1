From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: [PATCH v2] build: remove stray .*.d2 files during
 clean/distclean
Date: Tue, 19 Jun 2018 20:21:09 +0200
Message-ID: <1529432469-30358-1-git-send-email-daniel.kiper@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2pff=jf=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1fVLGU-00072C-0x
 for xen-devel@lists.xenproject.org; Tue, 19 Jun 2018 18:22:02 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

T3RoZXJ3aXNlIGUuZy4geGVuLy4ueGVuLXN5bXMuMC5vLmQyIGFuZCB4ZW4vLi54ZW4tc3ltcy4x
Lm8uZDIgZmlsZXMKc3RheSB1bnRvdWNoZWQgYmVjYXVzZSB0aGV5IGFyZSBub3QgbGlzdGVkIGlu
IERFUFNfUk0gdmFyaWFibGUuCgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgS2lwZXIgPGRhbmllbC5r
aXBlckBvcmFjbGUuY29tPgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNp
dHJpeC5jb20+Ci0tLQp2MjogQWRkZWQgSWFuJ3MgQUNLIGFncmVlZCBvbiBJUkMuCi0tLQogeGVu
L01ha2VmaWxlIHwgICAgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL01ha2VmaWxlIGIveGVuL01ha2VmaWxlCmluZGV4
IDYwODY3ZTMuLmZhYjMzNjcgMTAwNjQ0Ci0tLSBhL3hlbi9NYWtlZmlsZQorKysgYi94ZW4vTWFr
ZWZpbGUKQEAgLTExOSw3ICsxMTksNyBAQCBfY2xlYW46IGRlbGV0ZS11bmZyZXNoLWZpbGVzCiAJ
JChNQUtFKSAtZiAkKEJBU0VESVIpL1J1bGVzLm1rIC1DIGFyY2gveDg2IGNsZWFuCiAJJChNQUtF
KSAtZiAkKEJBU0VESVIpL1J1bGVzLm1rIC1DIHRlc3QgY2xlYW4KIAkkKE1BS0UpIC1mICQoQkFT
RURJUikvdG9vbHMva2NvbmZpZy9NYWtlZmlsZS5rY29uZmlnIEFSQ0g9JChBUkNIKSBTUkNBUkNI
PSQoU1JDQVJDSCkgY2xlYW4KLQlmaW5kIC4gXCggLW5hbWUgIioubyIgLW8gLW5hbWUgIi4qLmQi
IC1vIC1uYW1lICIqLmdjbm8iIFwpIC1leGVjIHJtIC1mIHt9IFw7CisJZmluZCAuIFwoIC1uYW1l
ICIqLm8iIC1vIC1uYW1lICIuKi5kIiAtbyAtbmFtZSAiLiouZDIiIC1vIC1uYW1lICIqLmdjbm8i
IFwpIC1leGVjIHJtIC1mIHt9IFw7CiAJcm0gLWYgaW5jbHVkZS9hc20gJChUQVJHRVQpICQoVEFS
R0VUKS5neiAkKFRBUkdFVCkuZWZpICQoVEFSR0VUKS5lZmkubWFwICQoVEFSR0VUKS1zeW1zICQo
VEFSR0VUKS1zeW1zLm1hcCAqfiBjb3JlCiAJcm0gLWYgaW5jbHVkZS9hc20tKi9hc20tb2Zmc2V0
cy5oCiAJcm0gLWYgLmJhbm5lcgotLSAKMS43LjEwLjQKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
