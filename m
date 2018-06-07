From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v2] multiboot2: clarify usage of the address tag
Date: Thu, 7 Jun 2018 17:59:06 +0200
Message-ID: <20180607155906.14304-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mv/7=iz=citrix.com=prvs=689b4a29b=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fQxKF-0003Hb-5G
 for xen-devel@lists.xenproject.org; Thu, 07 Jun 2018 15:59:47 +0000
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
bGlzdHMueGVucHJvamVjdC5vcmcKLS0tCkNoYW5nZXMgc2luY2UgdjE6CiAtIHMvZWxmL0BzY3tl
bGZ9LwogLSBzL011bHRpYm9vdC9NdWx0aWJvb3QyLwotLS0KIGRvYy9tdWx0aWJvb3QudGV4aSB8
IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
ZG9jL211bHRpYm9vdC50ZXhpIGIvZG9jL211bHRpYm9vdC50ZXhpCmluZGV4IDJlMmQ3ZTc0YS4u
M2M3OTc3ODdjIDEwMDY0NAotLS0gYS9kb2MvbXVsdGlib290LnRleGkKKysrIGIvZG9jL211bHRp
Ym9vdC50ZXhpCkBAIC01MDksNiArNTA5LDEyIEBAIGFzc3VtZXMgdGhhdCBubyBic3Mgc2VnbWVu
dCBpcyBwcmVzZW50LgogCiBAZW5kIHRhYmxlCiAKK05vdGU6IFRoaXMgaW5mb3JtYXRpb24gZG9l
cyBub3QgbmVlZCB0byBiZSBwcm92aWRlZCBpZiB0aGUga2VybmVsIGltYWdlCitpcyBpbiBAc2N7
ZWxmfSBmb3JtYXQsIGJ1dCBpdCBtdXN0IGJlIHByb3ZpZGVkIGlmIHRoZSBpbWFnZSBpcyBpbiBh
Lm91dAorZm9ybWF0IG9yIGluIHNvbWUgb3RoZXIgZm9ybWF0LiBDb21wbGlhbnQgYm9vdCBsb2Fk
ZXJzIG11c3QgYmUgYWJsZSB0bworbG9hZCBpbWFnZXMgdGhhdCBhcmUgZWl0aGVyIGluIEBzY3tl
bGZ9IGZvcm1hdCBvciBjb250YWluIHRoZSBhZGRyZXNzCit0YWcgZW1iZWRkZWQgaW4gdGhlIE11
bHRpYm9vdDIgaGVhZGVyLgorCiBAc3Vic2VjdGlvbiBUaGUgZW50cnkgYWRkcmVzcyB0YWcgb2Yg
TXVsdGlib290MiBoZWFkZXIKIAogQGV4YW1wbGUKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
