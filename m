From: Arun KS <arunks@codeaurora.org>
Subject: [PATCH v5 2/2] mm/page_alloc: remove software
 prefetching in __free_pages_core
Date: Fri,  5 Oct 2018 13:40:06 +0530
Message-ID: <1538727006-5727-2-git-send-email-arunks__7893.2523647838$1538726953$gmane$org@codeaurora.org>
References: <1538727006-5727-1-git-send-email-arunks@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dw0k=mr=qualcomm.com=arunks@srs-us1.protection.inumbo.net>)
 id 1g8LBq-00066A-93
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 08:10:26 +0000
In-Reply-To: <1538727006-5727-1-git-send-email-arunks@codeaurora.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com, boris.ostrovsky@oracle.com, jgross@suse.com, akpm@linux-foundation.org, dan.j.williams@intel.com, mhocko@suse.com, vbabka@suse.cz, iamjoonsoo.kim@lge.com, gregkh@linuxfoundation.org, osalvador@suse.de, malat@debian.org, kirill.shutemov@linux.intel.com, jrdr.linux@gmail.com, yasu.isimatu@gmail.com, mgorman@techsingularity.net, aaron.lu@intel.com, devel@linuxdriverproject.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, xen-devel@lists.xenproject.org
Cc: Arun KS <arunks@codeaurora.org>, vinmenon@codeaurora.org, vatsa@codeaurora.org, getarunks@gmail.com
List-Id: xen-devel@lists.xenproject.org

VGhleSBub3Qgb25seSBpbmNyZWFzZSB0aGUgY29kZSBmb290cHJpbnQsIHRoZXkgYWN0dWFsbHkg
bWFrZSB0aGluZ3MKc2xvd2VyIHJhdGhlciB0aGFuIGZhc3Rlci4gUmVtb3ZlIHRoZW0gYXMgY29u
dGVtcG9yYXJ5IGhhcmR3YXJlIGRvZXNuJ3QKbmVlZCBhbnkgaGludC4KClN1Z2dlc3RlZC1ieTog
RGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEFy
dW4gS1MgPGFydW5rc0Bjb2RlYXVyb3JhLm9yZz4KLS0tCiBtbS9wYWdlX2FsbG9jLmMgfCA2ICst
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA1IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL21tL3BhZ2VfYWxsb2MuYyBiL21tL3BhZ2VfYWxsb2MuYwppbmRleCA3YWI1Mjc0
Li45MGRiNDMxIDEwMDY0NAotLS0gYS9tbS9wYWdlX2FsbG9jLmMKKysrIGIvbW0vcGFnZV9hbGxv
Yy5jCkBAIC0xMjU4LDE0ICsxMjU4LDEwIEBAIHZvaWQgX19mcmVlX3BhZ2VzX2NvcmUoc3RydWN0
IHBhZ2UgKnBhZ2UsIHVuc2lnbmVkIGludCBvcmRlcikKIAlzdHJ1Y3QgcGFnZSAqcCA9IHBhZ2U7
CiAJdW5zaWduZWQgaW50IGxvb3A7CiAKLQlwcmVmZXRjaHcocCk7Ci0JZm9yIChsb29wID0gMDsg
bG9vcCA8IChucl9wYWdlcyAtIDEpOyBsb29wKyssIHArKykgewotCQlwcmVmZXRjaHcocCArIDEp
OworCWZvciAobG9vcCA9IDA7IGxvb3AgPCBucl9wYWdlcyA7IGxvb3ArKywgcCsrKSB7CiAJCV9f
Q2xlYXJQYWdlUmVzZXJ2ZWQocCk7CiAJCXNldF9wYWdlX2NvdW50KHAsIDApOwogCX0KLQlfX0Ns
ZWFyUGFnZVJlc2VydmVkKHApOwotCXNldF9wYWdlX2NvdW50KHAsIDApOwogCiAJcGFnZV96b25l
KHBhZ2UpLT5tYW5hZ2VkX3BhZ2VzICs9IG5yX3BhZ2VzOwogCXNldF9wYWdlX3JlZmNvdW50ZWQo
cGFnZSk7Ci0tIAoxLjkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
