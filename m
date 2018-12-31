From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 0/3] x86/svm: Improvements to SVM instruction
 length handling
Date: Mon, 31 Dec 2018 11:37:47 +0000
Message-ID: <1546256270-11734-1-git-send-email-andrew.cooper3@citrix.com>
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

VGhlIG1haW4gYnVnZml4IGluIHYyIG9mIHRoaXMgc2VyaWVzIGhhcyBub3cgYmVlbiBjb21taXR0
ZWQsIGxlYXZpbmcganVzdCB0aGUKY2xlYW51cCByZW1haW5pbmcuICBTZWUgcGF0Y2hlcyBmb3Ig
ZGV0YWlscy4KCkFuZHJldyBDb29wZXIgKDMpOgogIHg4Ni9zdm06IFJlbW92ZSBsaXN0IGZ1bmN0
aW9uYWxpdHkgZnJvbSBfX2dldF9pbnN0cnVjdGlvbl9sZW5ndGhfKiBpbmZyYXN0cnVjdHVyZQog
IHg4Ni9zdm06IERyb3AgZW51bSBpbnN0cnVjdGlvbl9pbmRleCBhbmQgc2ltcGxpZnkgc3ZtX2dl
dF9pbnNuX2xlbigpCiAgeDg2L3N2bTogSW1wcm92ZSBkaWFnbm9zdGljcyB3aGVuIHN2bV9nZXRf
aW5zbl9sZW4oKSBmYWlscwoKIHhlbi9hcmNoL3g4Ni9odm0vc3ZtL2VtdWxhdGUuYyAgICAgICAg
fCAxMTYgKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogeGVuL2FyY2gveDg2L2h2
bS9zdm0vbmVzdGVkc3ZtLmMgICAgICB8ICAgOSArLS0KIHhlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2
bS5jICAgICAgICAgICAgfCAgMzkgKysrKysrLS0tLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L2h2
bS9zdm0vZW11bGF0ZS5oIHwgIDU4ICsrKysrKysrLS0tLS0tLS0tCiA0IGZpbGVzIGNoYW5nZWQs
IDg4IGluc2VydGlvbnMoKyksIDEzNCBkZWxldGlvbnMoLSkKCi0tIAoyLjEuNAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
