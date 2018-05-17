From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH v4 7/9] xen_backend: make the
 xen_feature_grant_copy flag private
Date: Thu, 17 May 2018 16:35:56 +0100
Message-ID: <1526571358-26685-8-git-send-email-paul.durrant@citrix.com>
References: <1526571358-26685-1-git-send-email-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=forr=ie=citrix.com=prvs=66809d549=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fJKwr-0001rD-KN
 for xen-devel@lists.xenproject.org; Thu, 17 May 2018 15:36:09 +0000
In-Reply-To: <1526571358-26685-1-git-send-email-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, qemu-block@nongnu.org, qemu-devel@nongnu.org
Cc: Paul Durrant <paul.durrant@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

VGhlcmUgaXMgbm8gbG9uZ2VyIGFueSB1c2Ugb2YgdGhpcyBmbGFnIG91dHNpZGUgb2YgdGhlIHhl
bl9iYWNrZW5kIGNvZGUuCgpTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFu
dEBjaXRyaXguY29tPgpBY2tlZC1ieTogQW50aG9ueSBQZXJhcmQgPGFudGhvbnkucGVyYXJkQGNp
dHJpeC5jb20+Ci0tLQpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPgoKdjI6CiAtIE5ldyBpbiB2MgotLS0KIGh3L3hlbi94ZW5fYmFja2VuZC5jICAgICAgICAg
fCAyICstCiBpbmNsdWRlL2h3L3hlbi94ZW5fYmFja2VuZC5oIHwgMSAtCiAyIGZpbGVzIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2h3L3hlbi94
ZW5fYmFja2VuZC5jIGIvaHcveGVuL3hlbl9iYWNrZW5kLmMKaW5kZXggM2MzZmMyYy4uOWE4ZTg3
NyAxMDA2NDQKLS0tIGEvaHcveGVuL3hlbl9iYWNrZW5kLmMKKysrIGIvaHcveGVuL3hlbl9iYWNr
ZW5kLmMKQEAgLTQ0LDkgKzQ0LDkgQEAgQnVzU3RhdGUgKnhlbl9zeXNidXM7CiAvKiBwdWJsaWMg
Ki8KIHN0cnVjdCB4c19oYW5kbGUgKnhlbnN0b3JlID0gTlVMTDsKIGNvbnN0IGNoYXIgKnhlbl9w
cm90b2NvbDsKLWJvb2wgeGVuX2ZlYXR1cmVfZ3JhbnRfY29weTsKIAogLyogcHJpdmF0ZSAqLwor
c3RhdGljIGJvb2wgeGVuX2ZlYXR1cmVfZ3JhbnRfY29weTsKIHN0YXRpYyBpbnQgZGVidWc7CiAK
IGludCB4ZW5zdG9yZV93cml0ZV9iZV9zdHIoc3RydWN0IFhlbkRldmljZSAqeGVuZGV2LCBjb25z
dCBjaGFyICpub2RlLCBjb25zdCBjaGFyICp2YWwpCmRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L3hl
bi94ZW5fYmFja2VuZC5oIGIvaW5jbHVkZS9ody94ZW4veGVuX2JhY2tlbmQuaAppbmRleCAyOWJm
MWMzLi45YzE3ZmRkIDEwMDY0NAotLS0gYS9pbmNsdWRlL2h3L3hlbi94ZW5fYmFja2VuZC5oCisr
KyBiL2luY2x1ZGUvaHcveGVuL3hlbl9iYWNrZW5kLmgKQEAgLTE2LDcgKzE2LDYgQEAKIC8qIHZh
cmlhYmxlcyAqLwogZXh0ZXJuIHN0cnVjdCB4c19oYW5kbGUgKnhlbnN0b3JlOwogZXh0ZXJuIGNv
bnN0IGNoYXIgKnhlbl9wcm90b2NvbDsKLWV4dGVybiBib29sIHhlbl9mZWF0dXJlX2dyYW50X2Nv
cHk7CiBleHRlcm4gRGV2aWNlU3RhdGUgKnhlbl9zeXNkZXY7CiBleHRlcm4gQnVzU3RhdGUgKnhl
bl9zeXNidXM7CiAKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
