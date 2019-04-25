From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH 1/3] x86/mem_sharing: aquire extra references
 for pages with correct domain
Date: Thu, 25 Apr 2019 09:32:50 -0600
Message-ID: <20190425153252.14795-1-tamas@tklengyel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5oh2=S3=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hJgN1-0000us-5i
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 15:33:07 +0000
Received: by mail-io1-f68.google.com with SMTP id h26so345127ioj.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2019 08:33:05 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

UGF0Y2ggMDUwMmUwYWRhZTIgIng4NjogY29ycmVjdCBpbnN0YW5jZXMgb2YgUEdDX2FsbG9jYXRl
ZCBjbGVhcmluZyIgaW50cm9kdWNlZApncmFiYmluZyBleHRyYSByZWZlcmVuY2VzIGZvciBwYWdl
cyB0aGF0IGRyb3AgcmVmZXJlbmNlcyB0aWVkIHRvIFBHQ19hbGxvY2F0ZWQuCkhvd2V2ZXIsIHRo
ZXNlIHBhZ2VzIGFyZSBhY3R1YWxseSBvd25lZCBieSBkb21fY293LCByZXN1bHRpbmcgYm90aCBz
aGFyaW5nIGFuZAp1bnNoYXJpbmcgYnJlYWtpbmcuCgpTaWduZWQtb2ZmLWJ5OiBUYW1hcyBLIExl
bmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CkNjOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVu
bGFwQGV1LmNpdHJpeC5jb20+CkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNj
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogV2VpIExpdSA8
d2VpLmxpdTJAY2l0cml4LmNvbT4KQ2M6IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMgfCA0ICsrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMgYi94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJp
bmcuYwppbmRleCA1YWM5ZDhmNTRjLi5kZmMyNzlkMzcxIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94
ODYvbW0vbWVtX3NoYXJpbmcuYworKysgYi94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYwpA
QCAtOTY1LDcgKzk2NSw3IEBAIHN0YXRpYyBpbnQgc2hhcmVfcGFnZXMoc3RydWN0IGRvbWFpbiAq
c2QsIGdmbl90IHNnZm4sIHNocl9oYW5kbGVfdCBzaCwKICAgICB9CiAKICAgICAvKiBBY3F1aXJl
IGFuIGV4dHJhIHJlZmVyZW5jZSwgZm9yIHRoZSBmcmVlaW5nIGJlbG93IHRvIGJlIHNhZmUuICov
Ci0gICAgaWYgKCAhZ2V0X3BhZ2UoY3BhZ2UsIGNkKSApCisgICAgaWYgKCAhZ2V0X3BhZ2UoY3Bh
Z2UsIGRvbV9jb3cpICkKICAgICB7CiAgICAgICAgIHJldCA9IC1FT1ZFUkZMT1c7CiAgICAgICAg
IG1lbV9zaGFyaW5nX3BhZ2VfdW5sb2NrKHNlY29uZHBnKTsKQEAgLTExNzEsNyArMTE3MSw3IEBA
IGludCBfX21lbV9zaGFyaW5nX3Vuc2hhcmVfcGFnZShzdHJ1Y3QgZG9tYWluICpkLAogICAgICAg
ICBtZW1fc2hhcmluZ19wYWdlX3VubG9jayhwYWdlKTsKICAgICAgICAgaWYgKCBsYXN0X2dmbiAp
CiAgICAgICAgIHsKLSAgICAgICAgICAgIGlmICggIWdldF9wYWdlKHBhZ2UsIGQpICkKKyAgICAg
ICAgICAgIGlmICggIWdldF9wYWdlKHBhZ2UsIGRvbV9jb3cpICkKICAgICAgICAgICAgIHsKICAg
ICAgICAgICAgICAgICBwdXRfZ2ZuKGQsIGdmbik7CiAgICAgICAgICAgICAgICAgZG9tYWluX2Ny
YXNoKGQpOwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
