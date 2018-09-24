From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] automation: introduce a new variable to control
 container user
Date: Mon, 24 Sep 2018 17:18:29 +0100
Message-ID: <20180924161829.8676-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7h4j=mg=citrix.com=prvs=79824067f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g4TZB-0000T4-Ut
 for xen-devel@lists.xenproject.org; Mon, 24 Sep 2018 16:18:33 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U29tZXRpbWVzIGl0IGlzIGhhbmR5IHRvIGNyZWF0ZSBhIGNvbnRhaW5lciBhbmQgcGxheSBhcyBy
b290IHdpdGggaXRzCnNldHVwIG1hbnVhbGx5LgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2Vp
LmxpdTJAY2l0cml4LmNvbT4KLS0tCiBhdXRvbWF0aW9uL3NjcmlwdHMvY29udGFpbmVyaXplIHwg
OCArKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2F1dG9tYXRpb24vc2NyaXB0cy9jb250YWluZXJpemUgYi9hdXRvbWF0
aW9uL3NjcmlwdHMvY29udGFpbmVyaXplCmluZGV4IGJmOWFmNTg5YTguLmVhM2M3Mzc4YWEgMTAw
NzU1Ci0tLSBhL2F1dG9tYXRpb24vc2NyaXB0cy9jb250YWluZXJpemUKKysrIGIvYXV0b21hdGlv
bi9zY3JpcHRzL2NvbnRhaW5lcml6ZQpAQCAtMjMsNiArMjMsMTIgQEAgY2FzZSAiXyR7Q09OVEFJ
TkVSfSIgaW4KICAgICBfc3RyZXRjaHxfKSBDT05UQUlORVI9IiR7QkFTRX0vZGViaWFuOnN0cmV0
Y2giIDs7CiBlc2FjCiAKKyMgVXNlIHRoaXMgdmFyaWFibGUgdG8gY29udHJvbCB3aGVodGVyIHJv
b3Qgc2hvdWxkIGJlIHVzZWQKK2Nhc2UgIl8ke0NPTlRBSU5FUl9ST09UfSIgaW4KKyAgICBfMSkg
ICB1c2VyYXJnPSA7OworICAgIF8wfF8pIHVzZXJhcmc9Ii11ICQoaWQgLXUpIiA7OworZXNhYwor
CiAjIFNhdmUgdGhlIGNvbW1hbmRzIGZvciBmdXR1cmUgdXNlCiBjbWQ9JEAKIApAQCAtNzAsNyAr
NzYsNyBAQCBmaQogIyBLaWNrIG9mZiBEb2NrZXIKIGVpbmZvICIqKiogTGF1bmNoaW5nIGNvbnRh
aW5lciAuLi4iCiBleGVjIGRvY2tlciBydW4gXAotICAgIC11ICQoaWQgLXUpIFwKKyAgICAke3Vz
ZXJhcmd9IFwKICAgICAke1NTSF9BVVRIX1NPQ0s6Ky1lIFNTSF9BVVRIX1NPQ0s9Ii90bXAvc3No
LWFnZW50LyR7U1NIX0FVVEhfTkFNRX0ifSBcCiAgICAgLXYgIiR7Q09OVEFJTkVSX1BBVEh9Ijov
YnVpbGQ6cncgXAogICAgIC12ICIke0hPTUV9Ly5zc2giOi9yb290Ly5zc2g6cm8gXAotLSAKMi4x
MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
