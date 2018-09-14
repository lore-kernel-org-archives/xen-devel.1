From: Dongli Zhang <dongli.zhang@oracle.com>
Subject: [PATCH 4/6] xenbus: process otherend_watch event at
 'state' entry in xenwatch multithreading
Date: Fri, 14 Sep 2018 15:34:14 +0800
Message-ID: <1536910456-13337-5-git-send-email-dongli.zhang__6768.13552058793$1536910378$gmane$org@oracle.com>
References: <1536910456-13337-1-git-send-email-dongli.zhang@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=u+3y=l4=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1g0ic6-0008MI-GS
 for xen-devel@lists.xenproject.org; Fri, 14 Sep 2018 07:34:02 +0000
In-Reply-To: <1536910456-13337-1-git-send-email-dongli.zhang@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: jgross@suse.com, wei.liu2@citrix.com, konrad.wilk@oracle.com, srinivas.eeda@oracle.com, paul.durrant@citrix.com, boris.ostrovsky@oracle.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

VGhpcyBpcyB0aGUgNHRoIHBhdGNoIG9mIGEgKDYtcGF0Y2gpIHBhdGNoIHNldC4KCldpdGggdGhp
cyBwYXRjaCwgd2F0Y2ggZXZlbnQgaW4gYWJzb2x1dGUgcGF0aCBwYXR0ZXJuCicvbG9jYWwvZG9t
YWluLzxkb21pZD4vZGV2aWNlLzxwdmRldj4vPGhhbmRsZT4vc3RhdGUnIGNhbiBiZSBwcm9jZXNz
ZWQgaW4KcGVyLWRvbVUgeGVud2F0Y2ggdGhyZWFkLgoKU2lnbmVkLW9mZi1ieTogRG9uZ2xpIFpo
YW5nIDxkb25nbGkuemhhbmdAb3JhY2xlLmNvbT4KLS0tCiBkcml2ZXJzL3hlbi94ZW5idXMveGVu
YnVzX3Byb2JlLmMgfCAxNiArKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmUu
YyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmUuYwppbmRleCA1NzU1NTk2Li5iYTA2
NDRjIDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlLmMKKysrIGIv
ZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZS5jCkBAIC0xMjksMTEgKzEyOSwyNyBAQCBz
dGF0aWMgaW50IHRhbGtfdG9fb3RoZXJlbmQoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldikKIH0K
IAogCitzdGF0aWMgZG9taWRfdCBvdGhlcmVuZF9nZXRfZG9taWQoc3RydWN0IHhlbmJ1c193YXRj
aCAqd2F0Y2gsCisJCQkJICBjb25zdCBjaGFyICpwYXRoLAorCQkJCSAgY29uc3QgY2hhciAqdG9r
ZW4pCit7CisJc3RydWN0IHhlbmJ1c19kZXZpY2UgKnhlbmRldiA9CisJCWNvbnRhaW5lcl9vZih3
YXRjaCwgc3RydWN0IHhlbmJ1c19kZXZpY2UsIG90aGVyZW5kX3dhdGNoKTsKKworCXJldHVybiB4
ZW5kZXYtPm90aGVyZW5kX2lkOworfQorCiAKIHN0YXRpYyBpbnQgd2F0Y2hfb3RoZXJlbmQoc3Ry
dWN0IHhlbmJ1c19kZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3QgeGVuX2J1c190eXBlICpidXMgPQog
CQljb250YWluZXJfb2YoZGV2LT5kZXYuYnVzLCBzdHJ1Y3QgeGVuX2J1c190eXBlLCBidXMpOwor
CXN0cnVjdCB4ZW5idXNfZHJpdmVyICpkcnYgPSB0b194ZW5idXNfZHJpdmVyKGRldi0+ZGV2LmRy
aXZlcik7CisKKwlpZiAoeGVuX210d2F0Y2ggJiYgZHJ2LT51c2VfbXR3YXRjaCkgeworCQlkZXYt
Pm90aGVyZW5kX3dhdGNoLmdldF9kb21pZCA9IG90aGVyZW5kX2dldF9kb21pZDsKKwkJZGV2LT5v
dGhlcmVuZF93YXRjaC5vd25lcl9pZCA9IGRldi0+b3RoZXJlbmRfaWQ7CisJfQogCiAJcmV0dXJu
IHhlbmJ1c193YXRjaF9wYXRoZm10KGRldiwgJmRldi0+b3RoZXJlbmRfd2F0Y2gsCiAJCQkJICAg
IGJ1cy0+b3RoZXJlbmRfY2hhbmdlZCwKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
