From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 0/3] Fixes to RDTSCP interception
Date: Thu, 13 Dec 2018 20:22:49 +0000
Message-ID: <1544732572-29794-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VXBkYXRlcyBpbiB2MjoKICAqIFJld29yayBzdm1fZ2V0X2luc25fbGVuKCkgdG8gYmUgbW9yZSBz
aW1wbGUuCiAgKiBEcm9wIGFub255bW91cyB1bmlvbiB3aGljaCB3aWxsIHN1cmVseSBmYWlsIHRv
IGNvbXBpbGUgb24gUkhFTCA2LnggdmludGFnZQogICAgY29tcGlsZXJzLgogICogUmViYXNlIG90
aGVyIGNoYW5nZXMKCkFuZHJldyBDb29wZXIgKDMpOgogIHg4Ni9zdm06IFNpbXBsaWZ5IHN2bV9n
ZXRfaW5zbl9sZW4oKQogIHg4Ni9zdm06IEltcHJvdmUgZGlhZ25vc3RpY3Mgd2hlbiBzdm1fZ2V0
X2luc25fbGVuKCkgZmFpbHMKICB4ODYvaHZtOiBDb3JyZWN0aW9ucyB0byBSRFRTQ1AgaW50ZXJj
ZXB0IGhhbmRsaW5nCgogeGVuL2FyY2gveDg2L2h2bS9zdm0vZW11bGF0ZS5jICAgICAgICB8IDc5
ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vYXJjaC94ODYvaHZtL3N2
bS9uZXN0ZWRzdm0uYyAgICAgIHwgIDkgKystLQogeGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMg
ICAgICAgICAgICB8IDU0ICsrKysrKysrKysrKysrLS0tLS0tLS0tLQogeGVuL2FyY2gveDg2L2h2
bS92bXgvdm14LmMgICAgICAgICAgICB8ICA4ICsrKysKIHhlbi9pbmNsdWRlL2FzbS14ODYvaHZt
L3N2bS9lbXVsYXRlLmggfCAxMCArLS0tLQogNSBmaWxlcyBjaGFuZ2VkLCA4OCBpbnNlcnRpb25z
KCspLCA3MiBkZWxldGlvbnMoLSkKCi0tIAoyLjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
