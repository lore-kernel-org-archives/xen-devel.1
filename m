From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: [PATCH v3 15/17] tools: add missing libxenvchan cflags
Date: Mon, 28 Jan 2019 22:30:32 +0100
Message-ID: <cc3e11d92f7701d2ec97e2cdd656eafd7501df00.1548710973.git-series.marmarek@invisiblethingslab.com>
References: <cover.8f900c4839866ee551e8ebf221cfc7b9310cecd6.1548710973.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sAWr=QE=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1goEUf-0001yF-6s
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 21:31:01 +0000
In-Reply-To: <cover.8f900c4839866ee551e8ebf221cfc7b9310cecd6.1548710973.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <cover.8f900c4839866ee551e8ebf221cfc7b9310cecd6.1548710973.git-series.marmarek@invisiblethingslab.com>
References: <cover.8f900c4839866ee551e8ebf221cfc7b9310cecd6.1548710973.git-series.marmarek@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
List-Id: xen-devel@lists.xenproject.org

bGlieGVudmNoYW4uaCBpbmNsdWRlIHhlbmV2dGNobi5oIGFuZCB4ZW5nbnR0YWIuaCwgc28gYXBw
bGljYXRpb25zIGJ1aWx0CndpdGggaXQgbmVlZHMgYXBwbGljYWJsZSAtSSBpbiBDRkxBR1MgdG9v
LgoKU2lnbmVkLW9mZi1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0Bp
bnZpc2libGV0aGluZ3NsYWIuY29tPgotLS0KIHRvb2xzL1J1bGVzLm1rIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdG9v
bHMvUnVsZXMubWsgYi90b29scy9SdWxlcy5tawppbmRleCAxMmIzMTI5Li5hN2M2YzIxIDEwMDY0
NAotLS0gYS90b29scy9SdWxlcy5taworKysgYi90b29scy9SdWxlcy5tawpAQCAtMTYwLDcgKzE2
MCw3IEBAIFNIREVQU19saWJ4ZW5zdGF0ICA9ICQoU0hMSUJfbGlieGVuY3RybCkgJChTSExJQl9s
aWJ4ZW5zdG9yZSkKIExETElCU19saWJ4ZW5zdGF0ICA9ICQoU0hERVBTX2xpYnhlbnN0YXQpICQo
WEVOX0xJQlhFTlNUQVQpL2xpYnhlbnN0YXQkKGxpYmV4dGVuc2lvbikKIFNITElCX2xpYnhlbnN0
YXQgICA9ICQoU0hERVBTX2xpYnhlbnN0YXQpIC1XbCwtcnBhdGgtbGluaz0kKFhFTl9MSUJYRU5T
VEFUKQogCi1DRkxBR1NfbGlieGVudmNoYW4gPSAtSSQoWEVOX0xJQlZDSEFOKQorQ0ZMQUdTX2xp
YnhlbnZjaGFuID0gLUkkKFhFTl9MSUJWQ0hBTikgJChDRkxBR1NfbGlieGVuZ250dGFiKSAkKENG
TEFHU19saWJ4ZW5ldnRjaG4pCiBTSERFUFNfbGlieGVudmNoYW4gPSAkKFNITElCX2xpYnhlbnRv
b2xsb2cpICQoU0hMSUJfbGlieGVuc3RvcmUpICQoU0hMSUJfbGlieGVuZXZ0Y2huKSAkKFNITElC
X2xpYnhlbmdudHRhYikKIExETElCU19saWJ4ZW52Y2hhbiA9ICQoU0hERVBTX2xpYnhlbnZjaGFu
KSAkKFhFTl9MSUJWQ0hBTikvbGlieGVudmNoYW4kKGxpYmV4dGVuc2lvbikKIFNITElCX2xpYnhl
bnZjaGFuICA9ICQoU0hERVBTX2xpYnhlbnZjaGFuKSAtV2wsLXJwYXRoLWxpbms9JChYRU5fTElC
VkNIQU4pCi0tIApnaXQtc2VyaWVzIDAuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
