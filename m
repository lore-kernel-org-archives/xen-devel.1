From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/2] Fixes to RDTSCP interception
Date: Fri, 30 Nov 2018 17:07:18 +0000
Message-ID: <1543597640-28870-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Jun Nakajima <jun.nakajima@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Rm9yIHNvbWUgcmVhc29uIChvbiBFUFlDIGF0IGxlYXN0KSB3ZSd2ZSBnYWluZWQgYSByZWdyZXNz
aW9uIGludG8gbWFzdGVyCndoZXJlYnkgVk1zIGFyZSBkZWZhdWx0aW5nIHRvIG9uZSBvZiB0aGUg
ZW11bGF0ZWQgVFNDIG1vZGVzLiAgVGhpcyBtYXkgYmUgWGVuCmNvbWluZyB0byB0aGUgY29uY2x1
c2lvbiB0aGF0IHRoZXJlIGlzbid0IGEgcmVsaWFibGUgVFNDLiAgQ29tYmluZWQgd2l0aCBhCmRl
YnVnIFhlbiwgdGhpcyBicmVha3MgUkRUU0NQIGNvbXBsZXRlbHkuCgpXaXRoIHRoaXMgc2VyaWVz
IGluIHBsYWNlIGFuZCBSRFRTQ1AgZnVuY3Rpb25pbmcgY29ycmVjdGx5IGFnYWluLCBWTXMgYXJl
CnN0aWxsIHVud2lsbGluZyB0byBib290LiAgSSBoYXZlbid0IG1hbmFnZWQgdG8gZmlndXJlIG91
dCB3aHkgeWV0LgoKQW5kcmV3IENvb3BlciAoMik6CiAgeDg2L3N2bTogSW1wcm92ZSBkaWFnbm9z
dGljcyB3aGVuIF9fZ2V0X2luc3RydWN0aW9uX2xlbmd0aF9mcm9tX2xpc3QoKSBmYWlscwogIHg4
Ni9odm06IENvcnJlY3Rpb25zIHRvIFJEVFNDUCBpbnRlcmNlcHQgaGFuZGxpbmcKCiB4ZW4vYXJj
aC94ODYvaHZtL3N2bS9lbXVsYXRlLmMgICAgICAgIHwgMjcgKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tCiB4ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYyAgICAgICAgICAgIHwgMjIgKysrKysr
KysrKysrKysrKystLS0tLQogeGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMgICAgICAgICAgICB8
ICA4ICsrKysrKysrCiB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9zdm0vZW11bGF0ZS5oIHwgIDEg
KwogNCBmaWxlcyBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCi0t
IAoyLjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
