From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 06/17] x86: provide stub for
 arch_do_multicall_call
Date: Thu, 4 Oct 2018 16:43:25 +0100
Message-ID: <482857ce97ac3334e628f89b6c2d72c3c142f4e3.1538667753.git-series.wei.liu2@citrix.com>
References: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=a7fh=mq=citrix.com=prvs=808c92aaa=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g85mv-000504-U6
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 15:43:41 +0000
In-Reply-To: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
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

VGhpcyBoeXBlcmNhbGwgaXMgUFYgb25seSBvbiB4ODYuIFByb3ZpZGUgYSBzdHViIGZvciBpdCB3
aGVuCiFDT05GSUdfUFYuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXgu
Y29tPgotLS0KIHhlbi9hcmNoL3g4Ni9oeXBlcmNhbGwuYyB8ICA5ICsrKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9oeXBl
cmNhbGwuYyBiL3hlbi9hcmNoL3g4Ni9oeXBlcmNhbGwuYwppbmRleCA3NGJkZTVlLi5hMmY0Nzk3
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHlwZXJjYWxsLmMKKysrIGIveGVuL2FyY2gveDg2
L2h5cGVyY2FsbC5jCkBAIC0yNDgsNiArMjQ4LDE1IEBAIGludCBoeXBlcmNhbGxfeGxhdF9jb250
aW51YXRpb24odW5zaWduZWQgaW50ICppZCwgdW5zaWduZWQgaW50IG5yLAogICAgIHJldHVybiBy
YzsKIH0KIAorI2lmbmRlZiBDT05GSUdfUFYKKy8qIFN0dWIgZm9yIGFyY2hfZG9fbXVsdGljYWxs
X2NhbGwgKi8KK2VudW0gbWNfZGlzcG9zaXRpb24gYXJjaF9kb19tdWx0aWNhbGxfY2FsbChzdHJ1
Y3QgbWNfc3RhdGUgKm1jKQoreworICAgIHJldHVybiBtY19leGl0OworfQorCisjZW5kaWYKKwog
LyoKICAqIExvY2FsIHZhcmlhYmxlczoKICAqIG1vZGU6IEMKLS0gCmdpdC1zZXJpZXMgMC45LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
