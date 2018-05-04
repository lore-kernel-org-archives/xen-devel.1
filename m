From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH v2 6/8] xen_backend: make the
 xen_feature_grant_copy flag private
Date: Fri, 4 May 2018 14:55:32 +0100
Message-ID: <1525442134-20488-7-git-send-email-paul.durrant@citrix.com>
References: <1525442134-20488-1-git-send-email-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gdmm=hx=citrix.com=prvs=655ddeee3=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fEbBh-0006wS-4P
 for xen-devel@lists.xenproject.org; Fri, 04 May 2018 13:55:53 +0000
In-Reply-To: <1525442134-20488-1-git-send-email-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, qemu-block@nongnu.org, qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

VGhlcmUgaXMgbm8gbG9uZ2VyIGFueSB1c2Ugb2YgdGhpcyBmbGFnIG91dHNpZGUgb2YgdGhlIHhl
bl9iYWNrZW5kIGNvZGUuCgpTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFu
dEBjaXRyaXguY29tPgotLS0KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz4KQ2M6IEFudGhvbnkgUGVyYXJkIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgoK
djI6CiAtIE5ldyBpbiB2MgotLS0KIGh3L3hlbi94ZW5fYmFja2VuZC5jICAgICAgICAgfCAyICst
CiBpbmNsdWRlL2h3L3hlbi94ZW5fYmFja2VuZC5oIHwgMSAtCiAyIGZpbGVzIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2h3L3hlbi94ZW5fYmFj
a2VuZC5jIGIvaHcveGVuL3hlbl9iYWNrZW5kLmMKaW5kZXggM2MzZmMyYy4uOWE4ZTg3NyAxMDA2
NDQKLS0tIGEvaHcveGVuL3hlbl9iYWNrZW5kLmMKKysrIGIvaHcveGVuL3hlbl9iYWNrZW5kLmMK
QEAgLTQ0LDkgKzQ0LDkgQEAgQnVzU3RhdGUgKnhlbl9zeXNidXM7CiAvKiBwdWJsaWMgKi8KIHN0
cnVjdCB4c19oYW5kbGUgKnhlbnN0b3JlID0gTlVMTDsKIGNvbnN0IGNoYXIgKnhlbl9wcm90b2Nv
bDsKLWJvb2wgeGVuX2ZlYXR1cmVfZ3JhbnRfY29weTsKIAogLyogcHJpdmF0ZSAqLworc3RhdGlj
IGJvb2wgeGVuX2ZlYXR1cmVfZ3JhbnRfY29weTsKIHN0YXRpYyBpbnQgZGVidWc7CiAKIGludCB4
ZW5zdG9yZV93cml0ZV9iZV9zdHIoc3RydWN0IFhlbkRldmljZSAqeGVuZGV2LCBjb25zdCBjaGFy
ICpub2RlLCBjb25zdCBjaGFyICp2YWwpCmRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L3hlbi94ZW5f
YmFja2VuZC5oIGIvaW5jbHVkZS9ody94ZW4veGVuX2JhY2tlbmQuaAppbmRleCAyOWJmMWMzLi45
YzE3ZmRkIDEwMDY0NAotLS0gYS9pbmNsdWRlL2h3L3hlbi94ZW5fYmFja2VuZC5oCisrKyBiL2lu
Y2x1ZGUvaHcveGVuL3hlbl9iYWNrZW5kLmgKQEAgLTE2LDcgKzE2LDYgQEAKIC8qIHZhcmlhYmxl
cyAqLwogZXh0ZXJuIHN0cnVjdCB4c19oYW5kbGUgKnhlbnN0b3JlOwogZXh0ZXJuIGNvbnN0IGNo
YXIgKnhlbl9wcm90b2NvbDsKLWV4dGVybiBib29sIHhlbl9mZWF0dXJlX2dyYW50X2NvcHk7CiBl
eHRlcm4gRGV2aWNlU3RhdGUgKnhlbl9zeXNkZXY7CiBleHRlcm4gQnVzU3RhdGUgKnhlbl9zeXNi
dXM7CiAKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
