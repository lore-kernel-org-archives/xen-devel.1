From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 07/21] starvation: Teach
 ms-flights-summary about job state starved
Date: Thu, 18 Apr 2019 17:31:44 +0100
Message-ID: <20190418163158.11408-8-ian.jackson@eu.citrix.com>
References: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvKn=SU=citrix.com=prvs=004dc2360=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hH9xH-0001zL-UF
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 16:32:07 +0000
In-Reply-To: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBqdXN0IGFmZmVjdHMgc29ydGluZyBldGMuIGluIHRoZSBzdW1tYXJ5IGRpc3BsYXkuCgpT
aWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0t
CiBtcy1mbGlnaHRzLXN1bW1hcnkgfCA5ICsrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tcy1mbGlnaHRzLXN1bW1h
cnkgYi9tcy1mbGlnaHRzLXN1bW1hcnkKaW5kZXggOWQxNWRkMTQuLjgyOTNkNGY2IDEwMDc1NQot
LS0gYS9tcy1mbGlnaHRzLXN1bW1hcnkKKysrIGIvbXMtZmxpZ2h0cy1zdW1tYXJ5CkBAIC0xNDUs
MTAgKzE0NSwxMSBAQCBzdWIgc29ydF9zdGF0cygkKSB7CiAJcHJlcGFyaW5nID0+IDIsCiAJJ3By
ZXAuYWxsb2MuJyA9PiAzLAogCWJsb2NrZWQgPT4gNCwKLQlydW5uaW5nID0+IDUsCi0JcGFzcyA9
PiA2LAotCWZhaWwgPT4gNywKLQlicm9rZW4gPT4gOCwKKwlzdGFydmVkID0+IDUsCisJcnVubmlu
ZyA9PiA2LAorCXBhc3MgPT4gNywKKwlmYWlsID0+IDgsCisJYnJva2VuID0+IDksCiAgICAgKTsK
ICAgICByZXR1cm4gc29ydCB7ICgkc297JGF9Ly8wKSA8PT4gKCRzb3skYn0vLzApIH0gKGtleXMg
JXskc3RhdHN9KTsKIH0KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
