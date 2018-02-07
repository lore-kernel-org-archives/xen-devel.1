From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 1/4] firmware/shim: correctly handle errors
 during Xen tree setup
Date: Wed, 07 Feb 2018 08:07:01 -0700
Message-ID: <5A7B242502000078001A6142@prv-mh.provo.novell.com>
References: <5A7B21F202000078001A6124@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=rmex=fb=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ejRJY-00006c-SX
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2018 15:07:12 +0000
In-Reply-To: <5A7B21F202000078001A6124@prv-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

InNldCAtZSIgb24gYSBzZXBhcmF0ZSBNYWtlZmlsZSBsaW5lIGlzIG1lYW5pbmdsZXNzLiBHbHVl
IHRvZ2V0aGVyIGFsbAp0aGUgbGluZXMgdGhhdCB0aGlzIGlzIHN1cHBvc2VkIHRvIGNvdmVyLgoK
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEvdG9v
bHMvZmlybXdhcmUveGVuLWRpci9NYWtlZmlsZQorKysgYi90b29scy9maXJtd2FyZS94ZW4tZGly
L01ha2VmaWxlCkBAIC0xNiwxOCArMTYsMTggQEAgREVQX0ZJTEVTPSQoZm9yZWFjaCBpLCAkKExJ
TktfRklMRVMpLCAkKAogCiBsaW5rZmFybS5zdGFtcDogJChERVBfRElSUykgJChERVBfRklMRVMp
IEZPUkNFCiAJbWtkaXIgLXAgJChEKQotCXNldCAtZQogCXJtIC1mIGxpbmtmYXJtLnN0YW1wLnRt
cAorCXNldCAtZTsgXAogCSQoZm9yZWFjaCBkLCAkKExJTktfRElSUyksIFwKIAkJIChta2RpciAt
cCAkKEQpLyQoZCk7IFwKIAkJICBjZCAkKEQpLyQoZCk7IFwKIAkJICBmaW5kICQoWEVOX1JPT1Qp
LyQoZCkvIC10eXBlIGQgfFwKLQkJCXNlZCAncyxeJChYRU5fUk9PVCkvJChkKS8sLGcnIHwgeGFy
Z3MgbWtkaXIgLXApOykKKwkJCXNlZCAncyxeJChYRU5fUk9PVCkvJChkKS8sLGcnIHwgeGFyZ3Mg
bWtkaXIgLXApOykgXAogCSQoZm9yZWFjaCBkLCAkKExJTktfRElSUyksIFwKIAkJKGNkICQoWEVO
X1JPT1QpOyBcCiAJCSBmaW5kICQoZCkgISAtdHlwZSBsIC10eXBlIGYgXAogCQkgJChhZGRwcmVm
aXggISAtcGF0aCAsICcqLltvZGExXScgJyouZFsxMl0nKSkgXAotCQkgPj4gbGlua2Zhcm0uc3Rh
bXAudG1wIDsgKQorCQkgPj4gbGlua2Zhcm0uc3RhbXAudG1wIDsgKSBcCiAJJChmb3JlYWNoIGYs
ICQoTElOS19GSUxFUyksIFwKIAkJZWNobyAkKGYpID4+IGxpbmtmYXJtLnN0YW1wLnRtcCA7KQog
CWNtcCAtcyBsaW5rZmFybS5zdGFtcC50bXAgbGlua2Zhcm0uc3RhbXAgJiYgXAoKCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
