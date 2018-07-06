From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 1/2] BuildSupport: Honour new runvar
 make_njobs
Date: Fri, 6 Jul 2018 11:38:01 +0100
Message-ID: <1530873482-15372-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4trt=jw=citrix.com=prvs=718f97a87=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fbO7y-0004ze-0o
 for xen-devel@lists.xenproject.org; Fri, 06 Jul 2018 10:38:14 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGF2aW5nIGEgaGFyZGNvZGVkIC1qNCwgYW5kIGhhdmluZyB0aGlzIGNvbWUgdmlhIERlZk1ha2VG
bGFncywgaXMgbm90CmJyaWxsaWFudC4gIEJ1dCBhdCBsZWFzdCB0aGlzIG1ha2VfbmpvYnMgdmFy
aWFibGUgaGFzIGJldHRlciBzZW1hbnRpY3MKc28gd29uJ3QgbWFrZSBpdCBoYXJkZXIgdG8gbWFr
ZSB0aGlzIG1vcmUgc29waGlzdGljYXRlZCBsYXRlci4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNr
c29uIDxJYW4uSmFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIE9zc3Rlc3QvQnVpbGRTdXBwb3J0
LnBtIHwgNSArKysrLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL09zc3Rlc3QvQnVpbGRTdXBwb3J0LnBtIGIvT3NzdGVzdC9CdWls
ZFN1cHBvcnQucG0KaW5kZXggYjk2Y2U3Ni4uNDM2N2I0MCAxMDA2NDQKLS0tIGEvT3NzdGVzdC9C
dWlsZFN1cHBvcnQucG0KKysrIGIvT3NzdGVzdC9CdWlsZFN1cHBvcnQucG0KQEAgLTEwNCw3ICsx
MDQsMTAgQEAgc3ViIHNlbGVjdGJ1aWxkaG9zdCB7CiBzdWIgYnVpbGRkaXJzcHJvcHMgewogICAg
IG15ICgleGJ1aWxkb3B0cykgPSBAXzsKIAotICAgICR4YnVpbGRvcHRze0RlZk1ha2VGbGFnc30g
fHw9ICctajQnOworICAgIGlmICghZGVmaW5lZCApIHsKKwlteSAkbmpvYnMgPSAkcnttYWtlX25q
b2JzfSAvLyA0OworCSR4YnVpbGRvcHRze0RlZk1ha2VGbGFnc30gPSAiLWokbmpvYnMiOworICAg
IH0KICAgICAkYnVpbGRkaXI9IHRhcmdldF9qb2JkaXIoJGhvKTsKICAgICAkbWFrZWZsYWdzPSBn
ZXRfaG9zdF9wcm9wZXJ0eSgkaG8sICdidWlsZCBtYWtlIGZsYWdzJywKIAkJCQkgICR4YnVpbGRv
cHRze0RlZk1ha2VGbGFnc30pOwotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
