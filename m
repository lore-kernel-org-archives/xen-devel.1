From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH net-next] xen-netfront: mark expected switch
 fall-through
Date: Mon, 15 Apr 2019 16:11:41 -0500
Message-ID: <20190415211141.GA1732__34844.4420191058$1555362770$gmane$org@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=owvg=SR=embeddedor.com=gustavo@srs-us1.protection.inumbo.net>)
 id 1hG8tG-00047y-HO
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 21:11:46 +0000
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
 by gateway20.websitewelcome.com (Postfix) with ESMTP id 5B0F6400D85D7
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2019 16:11:44 -0500 (CDT)
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "David S. Miller" <davem@davemloft.net>
Cc: xen-devel@lists.xenproject.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, netdev@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

SW4gcHJlcGFyYXRpb24gdG8gZW5hYmxpbmcgLVdpbXBsaWNpdC1mYWxsdGhyb3VnaCwgbWFyayBz
d2l0Y2gKY2FzZXMgd2hlcmUgd2UgYXJlIGV4cGVjdGluZyB0byBmYWxsIHRocm91Z2guCgpUaGlz
IHBhdGNoIGZpeGVzIHRoZSBmb2xsb3dpbmcgd2FybmluZzoKCmRyaXZlcnMvbmV0L3hlbi1uZXRm
cm9udC5jOiBJbiBmdW5jdGlvbiDigJhuZXRiYWNrX2NoYW5nZWTigJk6CmRyaXZlcnMvbmV0L3hl
bi1uZXRmcm9udC5jOjIwMzg6Njogd2FybmluZzogdGhpcyBzdGF0ZW1lbnQgbWF5IGZhbGwgdGhy
b3VnaCBbLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD1dCiAgIGlmIChkZXYtPnN0YXRlID09IFhlbmJ1
c1N0YXRlQ2xvc2VkKQogICAgICBeCmRyaXZlcnMvbmV0L3hlbi1uZXRmcm9udC5jOjIwNDE6Mjog
bm90ZTogaGVyZQogIGNhc2UgWGVuYnVzU3RhdGVDbG9zaW5nOgogIF5+fn4KCldhcm5pbmcgbGV2
ZWwgMyB3YXMgdXNlZDogLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD0zCgpOb3RpY2UgdGhhdCwgaW4g
dGhpcyBwYXJ0aWN1bGFyIGNhc2UsIHRoZSBjb2RlIGNvbW1lbnQgaXMgbW9kaWZpZWQKaW4gYWNj
b3JkYW5jZSB3aXRoIHdoYXQgR0NDIGlzIGV4cGVjdGluZyB0byBmaW5kLgoKVGhpcyBwYXRjaCBp
cyBwYXJ0IG9mIHRoZSBvbmdvaW5nIGVmZm9ydHMgdG8gZW5hYmxlCi1XaW1wbGljaXQtZmFsbHRo
cm91Z2guCgpTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvQGVtYmVk
ZGVkb3IuY29tPgotLS0KIGRyaXZlcnMvbmV0L3hlbi1uZXRmcm9udC5jIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9uZXQveGVuLW5ldGZyb250LmMgYi9kcml2ZXJzL25ldC94ZW4tbmV0ZnJvbnQuYwppbmRl
eCA4MGMzMDMyMWRlNDEuLjhkMzM5NzBhMjk1MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQveGVu
LW5ldGZyb250LmMKKysrIGIvZHJpdmVycy9uZXQveGVuLW5ldGZyb250LmMKQEAgLTIwMzcsNyAr
MjAzNyw3IEBAIHN0YXRpYyB2b2lkIG5ldGJhY2tfY2hhbmdlZChzdHJ1Y3QgeGVuYnVzX2Rldmlj
ZSAqZGV2LAogCWNhc2UgWGVuYnVzU3RhdGVDbG9zZWQ6CiAJCWlmIChkZXYtPnN0YXRlID09IFhl
bmJ1c1N0YXRlQ2xvc2VkKQogCQkJYnJlYWs7Ci0JCS8qIE1pc3NlZCB0aGUgYmFja2VuZCdzIENM
T1NJTkcgc3RhdGUgLS0gZmFsbHRocm91Z2ggKi8KKwkJLyogRmFsbCB0aHJvdWdoIC0gTWlzc2Vk
IHRoZSBiYWNrZW5kJ3MgQ0xPU0lORyBzdGF0ZS4gKi8KIAljYXNlIFhlbmJ1c1N0YXRlQ2xvc2lu
ZzoKIAkJeGVuYnVzX2Zyb250ZW5kX2Nsb3NlZChkZXYpOwogCQlicmVhazsKLS0gCjIuMjEuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
