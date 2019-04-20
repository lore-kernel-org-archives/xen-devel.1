From: Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>
Subject: "make world" clobbers doc/man{1, 5, 7,
 8} but doesn't always receate them
Date: Sat, 20 Apr 2019 13:09:24 +0800
Message-ID: <CABwOO=c+9+LrU1ni3M9Mq8JDpepGG2624g+oCL4GWKJBRwuT1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XtSH=SW=gmail.com=kevin.buckley.ecs.vuw.ac.nz@srs-us1.protection.inumbo.net>)
 id 1hHiG3-0004zh-F0
 for xen-devel@lists.xenproject.org; Sat, 20 Apr 2019 05:09:47 +0000
Received: by mail-wm1-x336.google.com with SMTP id w15so8248101wmc.3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2019 22:09:36 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SXNzdWluZyBhICJtYWtlIHdvcmxkIiBjbG9iYmVycyBmb3VyIGRpcmVjdG9yaWVzIHdpdGhpbiB0
aGUKc291cmNlIHRyZWUKCiBkb2MvbWFuWzEsNSw3LDh9CgphcyBwYXJ0IG9mIHRoZSAibWFrZSBj
bGVhbiIKClRob3NlIGRpcmVjdG9yaWVzIGRvbid0IGFwcGVhciB0byBiZSByZS1jcmVhdGVkIGR1
cmluZyB0aGUKIm1ha2UgZGlzdCIgd2l0aGluIG15IHJlY2VudCBidWlsZC4KCkFzIHRoZSB0b3Bs
ZXZlbCBNYWtlZmlsZSBoYXMKCm1ha2Ugd29ybGQ6CiAgICAkKE1BS0UpIGNsZWFuCiAgICAkKE1B
S0UpIGRpc3QKCkkgZm91bmQgdGhhdCBieSBkb2luZyB0aG9zZSB0d28gc3BlcmF0ZWx5LCBJIHdh
cyBhZmZvcmRlZAphbiBvcHBvcnR1bml0eSB0byByZS1jcmVhdGUgdGhvc2UgZGlyZWN0b3JpZXMK
Cm1ha2UgY2xlYW4KCm1rZGlyIGRvY3MvbWFuMSBkb2NzL21hbjUgZG9jcy9tYW43IGRvY3MvbWFu
OAoKbWFrZSBkaXN0LgoKU2hvdWxkIEkgbmVlZCB0byBkbyB0aGF0LCBvciBpcyB0aGVyZSBhIHBh
dGgsIGFsYmVpdCBvbmUgbGVzcwp0cm9kZGVuLCBpbiB0aGUgYnVpbGQgc3lzdGVtLCB0aGF0IGNh
biBzZWUgYSAibWFrZSB3b3JsZCIKY2xlYW4gdGhlIGRpcnMgYnV0IG5vdCByZWNyZWF0ZSB0aGVt
PwoKS2V2aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
