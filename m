From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 4/5] ARM/dom0: Avoid using a variable length
 array in make_memory_node()
Date: Mon, 24 Sep 2018 14:00:02 +0100
Message-ID: <1537794003-30851-5-git-send-email-andrew.cooper3@citrix.com>
References: <1537794003-30851-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1537794003-30851-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

VGhlIHJlZ1tdIGFycmF5IGNhbiBoYXZlIGEgbWF4aW11bSBzaXplIG9mIDggaW4gcHJhY3RpY2Us
IHNvIHVzZSB0aGUgd29yc3QKY2FzZSBjYWxjdWxhdGlvbiByYXRoZXIgdGhhbiBtYWtpbmcgaXQg
dmFyaWFibGUgbGVuZ3RoLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+CkNDOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKT25s
eSBjb21waWxlIHRlc3RlZC4KLS0tCiB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgfCA0ICsr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWlu
X2J1aWxkLmMKaW5kZXggMzhlMGRlMy4uYWM4ZDQ3OSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJt
L2RvbWFpbl9idWlsZC5jCisrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwpAQCAtNTM5
LDkgKzUzOSwxMSBAQCBzdGF0aWMgaW50IF9faW5pdCBtYWtlX21lbW9yeV9ub2RlKGNvbnN0IHN0
cnVjdCBkb21haW4gKmQsCiAgICAgaW50IHJlcywgaTsKICAgICBpbnQgcmVnX3NpemUgPSBhZGRy
Y2VsbHMgKyBzaXplY2VsbHM7CiAgICAgaW50IG5yX2NlbGxzID0gcmVnX3NpemUqa2luZm8tPm1l
bS5ucl9iYW5rczsKLSAgICBfX2JlMzIgcmVnW25yX2NlbGxzXTsKKyAgICBfX2JlMzIgcmVnW05S
X01FTV9CQU5LUyAqIDQgLyogV29yc3QgY2FzZSBhZGRyY2VsbHMgKyBzaXplY2VsbHMgKi9dOwog
ICAgIF9fYmUzMiAqY2VsbHM7CiAKKyAgICBCVUdfT04obnJfY2VsbHMgPj0gQVJSQVlfU0laRShy
ZWcpKTsKKwogICAgIGR0X2RwcmludGsoIkNyZWF0ZSBtZW1vcnkgbm9kZSAocmVnIHNpemUgJWQs
IG5yIGNlbGxzICVkKVxuIiwKICAgICAgICAgICAgICAgIHJlZ19zaXplLCBucl9jZWxscyk7CiAK
LS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
