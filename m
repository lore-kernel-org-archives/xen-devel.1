From: Joe Jin <joe.jin@ORACLE.COM>
Subject: [PATCH v2] xenbaked.c: Avoid divide by zero issue
Date: Wed, 14 Mar 2018 10:14:03 -0700
Message-ID: <1353482a-2733-e404-903a-261b4016f6cd@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ofxj=ge=oracle.com=joe.jin@srs-us1.protection.inumbo.net>)
 id 1ewAEd-0001C8-Vi
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 17:30:44 +0000
Content-Language: en-MW
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@ORACLE.COM>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <dunlapg@umich.edu>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Philip Lee <philip.lee@ORACLE.COM>
List-Id: xen-devel@lists.xenproject.org

eGVuYmFrZWQuYyAtPiBkdW1wX3N0YXRzKCksIHJ1bl90aW1lID0gdGltZSgmZW5kX3RpbWUpIC0g
dGltZSgmc3RhcnRfdGltZSksCnRpbWUoKSByZXR1cm5zIHRoZSB2YWx1ZSBpbiBzZWNvbmRzLiBJ
ZiBvbmUgY2FuY2VscyB4ZW5tb24ucHkgaW1tZWRpYXRlbHkKYWZ0ZXIgc3RhcnRlZCwgcnVuX3Rp
bWUgY2FuIGJlIHplcm8sIGFuZCB0aGVuIHhlbmJha2VkIHdpbGwgaGl0IGRpdmlkZSBieQp6ZXJv
IGZhdWx0LgoKU2lnbmVkLW9mZi1ieTogSm9lIEppbiA8am9lLmppbkBvcmFjbGUuY29tPgpSZXZp
ZXdlZC1ieTogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgot
LS0KIHRvb2xzL3hlbm1vbi94ZW5iYWtlZC5jIHwgOCArKysrKy0tLQogMSBmaWxlIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy94ZW5t
b24veGVuYmFrZWQuYyBiL3Rvb2xzL3hlbm1vbi94ZW5iYWtlZC5jCmluZGV4IDNkOWUwZWQ5MDAu
LmQzZjk0MGEyNmIgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3hlbm1vbi94ZW5iYWtlZC5jCisrKyBiL3Rv
b2xzL3hlbm1vbi94ZW5iYWtlZC5jCkBAIC0yNDMsMTAgKzI0MywxMiBAQCBzdGF0aWMgdm9pZCBk
dW1wX3N0YXRzKHZvaWQpCiAgICAgfQogCiAgICAgcHJpbnRmKCJwcm9jZXNzZWQgJWQgdG90YWwg
cmVjb3JkcyBpbiAlZCBzZWNvbmRzICglbGQgcGVyIHNlY29uZClcbiIsCi0gICAgICAgICAgIHJl
Y19jb3VudCwgKGludClydW5fdGltZSwgKGxvbmcpKHJlY19jb3VudC9ydW5fdGltZSkpOworICAg
ICAgICAgICByZWNfY291bnQsIChpbnQpcnVuX3RpbWUsCisgICAgICAgICAgIHJ1bl90aW1lID8g
KGxvbmcpKHJlY19jb3VudC9ydW5fdGltZSkgOiAwTCk7CiAKLSAgICBwcmludGYoIndva2UgdXAg
JWQgdGltZXMgaW4gJWQgc2Vjb25kcyAoJWxkIHBlciBzZWNvbmQpXG4iLCB3YWtldXBzLAotCSAg
IChpbnQpIHJ1bl90aW1lLCAobG9uZykod2FrZXVwcy9ydW5fdGltZSkpOworICAgIHByaW50Zigi
d29rZSB1cCAlZCB0aW1lcyBpbiAlZCBzZWNvbmRzICglbGQgcGVyIHNlY29uZClcbiIsCisgICAg
ICAgICAgIHdha2V1cHMsIChpbnQpIHJ1bl90aW1lLAorICAgICAgICAgICBydW5fdGltZSA/IChs
b25nKSh3YWtldXBzL3J1bl90aW1lKSA6IDBMKTsKIAogICAgIGNoZWNrX2dvdHRlbl9zdW0oKTsK
IH0KLS0gCjIuMTQuMyAoQXBwbGUgR2l0LTk4KQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
