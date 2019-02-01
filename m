From: Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.12 v2] xen/iommu: fix iommu_ops
 initialization
Date: Fri,  1 Feb 2019 17:29:45 +0100
Message-ID: <20190201162945.26461-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ulZE=QI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gpbhN-0004oc-CA
 for xen-devel@lists.xenproject.org; Fri, 01 Feb 2019 16:29:49 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

Q29tbWl0IDMyYTVlYTAwZWM3NWVmNTNlICgiSU9NTVUveDg2OiByZW1vdmUgaW5kaXJlY3Rpb24g
ZnJvbSBjZXJ0YWluCklPTU1VIGhvb2sgYWNjZXNzZXMiKSBpbnRyb2R1Y2VkIGlvbW11X29wcyBp
bml0aWFsaXplZCBhdCBib290IHRpbWUKd2l0aCBkYXRhIGRlY2xhcmVkIGFzIF9faW5pdGNvbnN0
cmVsLgoKT24gSW50ZWwgc3lzdGVtcyB0aGVyZSBpcyBhbm90aGVyIHBhdGggd2hlcmUgaW9tbXVf
b3BzIGlzIGluaXRpYWxpemVkCmFuZCB0aGlzIHBhdGggaXMgcmVsZXZhbnQgb24gcmVzdW1lIGFm
dGVyIHJldHVybmluZyBmcm9tIHN5c3RlbSBzdXNwZW5kLgpBcyB0aGUgaW5pdGlhbGl6YXRpb24g
ZGF0YSBpcyBubyBsb25nZXIgYWNjZXNzaWJsZSBpbiB0aGlzIGNhc2UgdGhhdApzZWNvbmQgaW5p
dGlhbGl6YXRpb24gbXVzdCBiZSBkcm9wcGVkIGluIGNhc2UgdGhlIHN5c3RlbSBpc24ndCBqdXN0
CmJvb3RpbmcuCgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
Ci0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2ludHJlbWFwLmMgfCA0ICsrLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2ludHJlbWFwLmMgYi94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC92dGQvaW50cmVtYXAuYwppbmRleCBhMDY2M2VjZDIyLi44MzgyNjhkNzcyIDEw
MDY0NAotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW50cmVtYXAuYworKysgYi94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW50cmVtYXAuYwpAQCAtODkzLDEyICs4OTMsMTIg
QEAgaW50IGlvbW11X2VuYWJsZV94MmFwaWNfSVIodm9pZCkKIAogICAgICAgICBpZiAoICFwbGF0
Zm9ybV9zdXBwb3J0c194MmFwaWMoKSApCiAgICAgICAgICAgICByZXR1cm4gLUVOWElPOworCisg
ICAgICAgIGlvbW11X29wcyA9IGludGVsX2lvbW11X29wczsKICAgICB9CiAgICAgZWxzZSBpZiAo
ICF4MmFwaWNfZW5hYmxlZCApCiAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKIAotICAgIGlv
bW11X29wcyA9IGludGVsX2lvbW11X29wczsKLQogICAgIGZvcl9lYWNoX2RyaGRfdW5pdCAoIGRy
aGQgKQogICAgIHsKICAgICAgICAgaW9tbXUgPSBkcmhkLT5pb21tdTsKLS0gCjIuMTYuNAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
