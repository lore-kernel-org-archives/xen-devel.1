From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] xen: mark expected switch fall-through
Date: Tue, 12 Feb 2019 14:37:20 -0600
Message-ID: <20190212203720.GA24175__35196.8533521116$1550003916$gmane$org@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OyS0=QT=embeddedor.com=gustavo@srs-us1.protection.inumbo.net>)
 id 1gteo7-00050R-W6
 for xen-devel@lists.xenproject.org; Tue, 12 Feb 2019 20:37:32 +0000
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
 by gateway34.websitewelcome.com (Postfix) with ESMTP id 896F33EE2C
 for <xen-devel@lists.xenproject.org>; Tue, 12 Feb 2019 14:37:30 -0600 (CST)
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: xen-devel@lists.xenproject.org

SW4gcHJlcGFyYXRpb24gdG8gZW5hYmxpbmcgLVdpbXBsaWNpdC1mYWxsdGhyb3VnaCwgbWFyayBz
d2l0Y2gKY2FzZXMgd2hlcmUgd2UgYXJlIGV4cGVjdGluZyB0byBmYWxsIHRocm91Z2guCgpUaGlz
IHBhdGNoIGZpeGVzIHRoZSBmb2xsb3dpbmcgd2FybmluZzoKCmRyaXZlcnMveGVuL3hlbi1wY2li
YWNrL3hlbmJ1cy5jOiBJbiBmdW5jdGlvbiDigJh4ZW5fcGNpYmtfZnJvbnRlbmRfY2hhbmdlZOKA
mToKZHJpdmVycy94ZW4veGVuLXBjaWJhY2sveGVuYnVzLmM6NTQ1OjY6IHdhcm5pbmc6IHRoaXMg
c3RhdGVtZW50IG1heSBmYWxsIHRocm91Z2ggWy1XaW1wbGljaXQtZmFsbHRocm91Z2g9XQogICBp
ZiAoeGVuYnVzX2Rldl9pc19vbmxpbmUoeGRldikpCiAgICAgIF4KZHJpdmVycy94ZW4veGVuLXBj
aWJhY2sveGVuYnVzLmM6NTQ4OjI6IG5vdGU6IGhlcmUKICBjYXNlIFhlbmJ1c1N0YXRlVW5rbm93
bjoKICBefn5+CgpXYXJuaW5nIGxldmVsIDMgd2FzIHVzZWQ6IC1XaW1wbGljaXQtZmFsbHRocm91
Z2g9MwoKTm90aWNlIHRoYXQsIGluIHRoaXMgcGFydGljdWxhciBjYXNlLCB0aGUgY29kZSBjb21t
ZW50IGlzIG1vZGlmaWVkCmluIGFjY29yZGFuY2Ugd2l0aCB3aGF0IEdDQyBpcyBleHBlY3Rpbmcg
dG8gZmluZC4KClRoaXMgcGF0Y2ggaXMgcGFydCBvZiB0aGUgb25nb2luZyBlZmZvcnRzIHRvIGVu
YWJsZQotV2ltcGxpY2l0LWZhbGx0aHJvdWdoLgoKU2lnbmVkLW9mZi1ieTogR3VzdGF2byBBLiBS
LiBTaWx2YSA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNvbT4KLS0tCiBkcml2ZXJzL3hlbi94ZW4tcGNp
YmFjay94ZW5idXMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL3hlbmJ1cy5j
IGIvZHJpdmVycy94ZW4veGVuLXBjaWJhY2sveGVuYnVzLmMKaW5kZXggNTgxYzRlMWE4YjgyLi4y
M2Y3ZjZlYzdkMWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL3hlbmJ1cy5j
CisrKyBiL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL3hlbmJ1cy5jCkBAIC01NDQsNyArNTQ0LDcg
QEAgc3RhdGljIHZvaWQgeGVuX3BjaWJrX2Zyb250ZW5kX2NoYW5nZWQoc3RydWN0IHhlbmJ1c19k
ZXZpY2UgKnhkZXYsCiAJCXhlbmJ1c19zd2l0Y2hfc3RhdGUoeGRldiwgWGVuYnVzU3RhdGVDbG9z
ZWQpOwogCQlpZiAoeGVuYnVzX2Rldl9pc19vbmxpbmUoeGRldikpCiAJCQlicmVhazsKLQkJLyog
ZmFsbCB0aHJvdWdoIGlmIG5vdCBvbmxpbmUgKi8KKwkJLyogZmFsbCB0aHJvdWdoIC0gaWYgbm90
IG9ubGluZSAqLwogCWNhc2UgWGVuYnVzU3RhdGVVbmtub3duOgogCQlkZXZfZGJnKCZ4ZGV2LT5k
ZXYsICJmcm9udGVuZCBpcyBnb25lISB1bnJlZ2lzdGVyIGRldmljZVxuIik7CiAJCWRldmljZV91
bnJlZ2lzdGVyKCZ4ZGV2LT5kZXYpOwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
