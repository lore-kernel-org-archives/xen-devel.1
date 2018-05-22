From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH for-4.11] Revert "tools/kdd: mute spurious gcc
 warning"
Date: Tue, 22 May 2018 14:36:38 +0100
Message-ID: <20180522133638.21568-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fj/e=ij=citrix.com=prvs=6735f0edb=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fL7T1-0004Pj-Hk
 for xen-devel@lists.xenproject.org; Tue, 22 May 2018 13:36:43 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyByZXZlcnRzIGNvbW1pdCA0MzdlMDBmZWEwNGJlY2M5MWMxYjZiYzFjMGJhYTYzNmIwNjdh
NWNjLgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCkZl
ZG9yYSAyOCBhcHBlYXJzIHRvIGhhdmUgZml4ZWQgdGhlaXIgZ2NjLgoKQXJjaCBMaW51eCBidWls
ZCB3aXRoIGdjYyA4LjEgcGFzc2VzLCB0b28uCgpDYzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+
CkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBJYW4gSmFja3NvbiA8aWFu
LmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ2M6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8
bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4KLS0tCiB0b29scy9kZWJ1Z2dlci9rZGQva2RkLmMgfCAzIC0tLQogMSBmaWxl
IGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvZGVidWdnZXIva2Rk
L2tkZC5jIGIvdG9vbHMvZGVidWdnZXIva2RkL2tkZC5jCmluZGV4IDYxZDc2OWVjZTkuLjFiZDVk
ZDU5OTIgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2RlYnVnZ2VyL2tkZC9rZGQuYworKysgYi90b29scy9k
ZWJ1Z2dlci9rZGQva2RkLmMKQEAgLTY5NSwxMCArNjk1LDcgQEAgc3RhdGljIHZvaWQga2RkX2hh
bmRsZV9yZWFkX2N0cmwoa2RkX3N0YXRlICpzKQogICAgICAgICAgICAgS0REX0xPRyhzLCAiUmVx
dWVzdCBvdXRzaWRlIG9mIGtub3duIGNvbnRyb2wgc3BhY2VcbiIpOwogICAgICAgICAgICAgbGVu
ID0gMDsKICAgICAgICAgfSBlbHNlIHsKLSNwcmFnbWEgR0NDIGRpYWdub3N0aWMgcHVzaAotI3By
YWdtYSBHQ0MgZGlhZ25vc3RpYyBpZ25vcmVkICItV2FycmF5LWJvdW5kcyIKICAgICAgICAgICAg
IG1lbWNweShidWYsICgodWludDhfdCAqKSZjdHJsLmMzMikgKyBvZmZzZXQsIGxlbik7Ci0jcHJh
Z21hIEdDQyBkaWFnbm9zdGljIHBvcAogICAgICAgICB9CiAgICAgfQogCi0tIAoyLjExLjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
