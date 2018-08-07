From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 1/9] x86: put compat.o and x86_64/compat.o under
 CONFIG_PV
Date: Tue, 7 Aug 2018 11:00:44 +0100
Message-ID: <020de81575057c1802a45bd31dcca6900a0659ee.1533636027.git-series.wei.liu2@citrix.com>
References: <cover.3198a0d9ad2683b74afcc86654a244d17cd8795e.1533636027.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xdgf=kw=citrix.com=prvs=7503460ff=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fmynQ-000466-Qt
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 10:00:56 +0000
In-Reply-To: <cover.3198a0d9ad2683b74afcc86654a244d17cd8795e.1533636027.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VGhleSBjb250YWluIGNvZGUgZm9yIGNvbXBhdCBoeXBlcmNhbGwgZm9yIFBWIGd1ZXN0cy4KClNp
Z25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gv
eDg2L01ha2VmaWxlIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L01ha2VmaWxlIGIveGVuL2FyY2gv
eDg2L01ha2VmaWxlCmluZGV4IDE3ZTdkM2YuLjliOWI2M2EgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNo
L3g4Ni9NYWtlZmlsZQorKysgYi94ZW4vYXJjaC94ODYvTWFrZWZpbGUKQEAgLTE3LDcgKzE3LDcg
QEAgb2JqLWJpbi15ICs9IGJ6aW1hZ2UuaW5pdC5vCiBvYmotYmluLXkgKz0gY2xlYXJfcGFnZS5v
CiBvYmotYmluLXkgKz0gY29weV9wYWdlLm8KIG9iai15ICs9IGNwdWlkLm8KLW9iai15ICs9IGNv
bXBhdC5vIHg4Nl82NC9jb21wYXQubworb2JqLSQoQ09ORklHX1BWKSArPSBjb21wYXQubyB4ODZf
NjQvY29tcGF0Lm8KIG9iai0kKENPTkZJR19LRVhFQykgKz0gY3Jhc2gubwogb2JqLXkgKz0gZGVi
dWcubwogb2JqLXkgKz0gZGVsYXkubwotLSAKZ2l0LXNlcmllcyAwLjkuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
