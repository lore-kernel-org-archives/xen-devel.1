From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v3] multiboot2: clarify usage of the address tag
Date: Mon, 11 Jun 2018 13:49:02 +0200
Message-ID: <20180611114902.48124-1-roger.pau__34571.4322444566$1528717704$gmane$org@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qs0l=i5=citrix.com=prvs=6935148de=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fSLK4-0003ja-Sz
 for xen-devel@lists.xenproject.org; Mon, 11 Jun 2018 11:49:20 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: grub-devel@gnu.org
Cc: xen-devel@lists.xenproject.org, Daniel Kiper <daniel.kiper@oracle.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QWRkIGEgbm90ZSB0byBzcGVsbCBvdXQgdGhhdCBpZiB0aGUgYWRkcmVzcyB0YWcgaXMgbm90IHBy
ZXNlbnQgdGhlCmZpbGUgc2hvdWxkIGJlIGxvYWRlZCB1c2luZyB0aGUgZWxmIGhlYWRlci4KClNp
Z25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0K
Q2M6IERhbmllbCBLaXBlciA8ZGFuaWVsLmtpcGVyQG9yYWNsZS5jb20+CkNjOiB4ZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKLS0tCkNoYW5nZXMgc2luY2UgdjI6CiAtIENsYXJpZnkgdGhh
dCB0aGUgYWRkcmVzcyB0YWcgbXVzdCBiZSB1c2VkIGlmIHByZXNlbnQuCgpDaGFuZ2VzIHNpbmNl
IHYxOgogLSBzL2VsZi9Ac2N7ZWxmfS8KIC0gcy9NdWx0aWJvb3QvTXVsdGlib290Mi8KLS0tCiBk
b2MvbXVsdGlib290LnRleGkgfCA4ICsrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvZG9jL211bHRpYm9vdC50ZXhpIGIvZG9jL211bHRpYm9vdC50
ZXhpCmluZGV4IDJlMmQ3ZTc0YS4uZGY4YTBkMDU2IDEwMDY0NAotLS0gYS9kb2MvbXVsdGlib290
LnRleGkKKysrIGIvZG9jL211bHRpYm9vdC50ZXhpCkBAIC01MDksNiArNTA5LDE0IEBAIGFzc3Vt
ZXMgdGhhdCBubyBic3Mgc2VnbWVudCBpcyBwcmVzZW50LgogCiBAZW5kIHRhYmxlCiAKK05vdGU6
IFRoaXMgaW5mb3JtYXRpb24gZG9lcyBub3QgbmVlZCB0byBiZSBwcm92aWRlZCBpZiB0aGUga2Vy
bmVsIGltYWdlCitpcyBpbiBAc2N7ZWxmfSBmb3JtYXQsIGJ1dCBpdCBtdXN0IGJlIHByb3ZpZGVk
IGlmIHRoZSBpbWFnZSBpcyBpbiBhLm91dAorZm9ybWF0IG9yIGluIHNvbWUgb3RoZXIgZm9ybWF0
LiBXaGVuIHRoZSBhZGRyZXNzIHRhZyBpcyBwcmVzZW50IGl0IG11c3QKK2JlIHVzZWQgaW4gb3Jk
ZXIgdG8gbG9hZCB0aGUgaW1hZ2UsIHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciBhbiBAc2N7ZWxmfQor
aGVhZGVyIGlzIGFsc28gcHJlc2VudC4gQ29tcGxpYW50IGJvb3QgbG9hZGVycyBtdXN0IGJlIGFi
bGUgdG8gbG9hZAoraW1hZ2VzIHRoYXQgYXJlIGVpdGhlciBpbiBAc2N7ZWxmfSBmb3JtYXQgb3Ig
Y29udGFpbiB0aGUgYWRkcmVzcyB0YWcKK2VtYmVkZGVkIGluIHRoZSBNdWx0aWJvb3QyIGhlYWRl
ci4KKwogQHN1YnNlY3Rpb24gVGhlIGVudHJ5IGFkZHJlc3MgdGFnIG9mIE11bHRpYm9vdDIgaGVh
ZGVyCiAKIEBleGFtcGxlCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
