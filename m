From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2 0/2] x86: more flexible alignment handling
 for xen image
Date: Tue, 19 Mar 2019 13:05:48 +0000
Message-ID: <20190319130550.32570-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yczf=RW=citrix.com=prvs=9744cf058=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1h6ERP-0007bk-3u
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2019 13:06:03 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSAoMik6CiAgeDg2OiBkZWNvdXBsZSB4ZW4gYWxpZ25tZW50IHNldHRpbmcgZnJvbSBF
RkkvRUxGIGJ1aWxkCiAgeDg2L3B2c2hpbTogdXNlIDJNIGFsaWdubWVudAoKIHhlbi9hcmNoL3g4
Ni9LY29uZmlnICAgICAgICAgICAgICAgICAgfCAyMyArKysrKysrKysrKysrKysrKysrKysrKwog
eGVuL2FyY2gveDg2L2NvbmZpZ3MvcHZzaGltX2RlZmNvbmZpZyB8ICAxICsKIHhlbi9hcmNoL3g4
Ni94ZW4ubGRzLlMgICAgICAgICAgICAgICAgfCAxMiArKysrKysrKysrLS0KIDMgZmlsZXMgY2hh
bmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCi0tIAoyLjIwLjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
