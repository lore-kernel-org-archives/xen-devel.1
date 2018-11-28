From: Juergen Gross <jgross@suse.com>
Subject: [PATCH v6 07/20] xen: modify grub_xen_ptr2mfn() for
 xen-pvh
Date: Wed, 28 Nov 2018 14:55:17 +0100
Message-ID: <20181128135530.32545-8-jgross@suse.com>
References: <20181128135530.32545-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181128135530.32545-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: grub-devel@gnu.org
Cc: Juergen Gross <jgross@suse.com>, phcoder@gmail.com, daniel.kiper@oracle.com, xen-devel@lists.xen.org, hans@knorrie.org, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

Z3J1Yl94ZW5fcHRyMm1mbigpIHJldHVybnMgdGhlIG1hY2hpbmUgZnJhbWUgbnVtYmVyIGZvciBh
IGdpdmVuIHBvaW50ZXIKdmFsdWUuIEZvciBYZW4tUFZIIGd1ZXN0cyB0aGlzIGlzIGp1c3QgdGhl
IFBGTi4gQWRkIHRoZSBQVkggc3BlY2lmaWMKdmFyaWFudC4KClNpZ25lZC1vZmYtYnk6IEp1ZXJn
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IERhbmllbCBLaXBlciA8ZGFu
aWVsLmtpcGVyQG9yYWNsZS5jb20+Ci0tLQpWNTogbmV3IHBhdGNoIChEYW5pZWwgS2lwZXIpCi0t
LQogZ3J1Yi1jb3JlL2tlcm4veGVuL2luaXQuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9ncnViLWNvcmUva2Vybi94ZW4vaW5pdC5jIGIvZ3J1
Yi1jb3JlL2tlcm4veGVuL2luaXQuYwppbmRleCAxMDAwN2I0MTEuLmEyM2RhZDYzMyAxMDA2NDQK
LS0tIGEvZ3J1Yi1jb3JlL2tlcm4veGVuL2luaXQuYworKysgYi9ncnViLWNvcmUva2Vybi94ZW4v
aW5pdC5jCkBAIC00NSw2ICs0NSw4IEBAIGdydWJfeGVuX3B0cjJtZm4gKHZvaWQgKnB0cikKICAg
Z3J1Yl94ZW5fbWZuX3QgKm1mbl9saXN0ID0KICAgICAoZ3J1Yl94ZW5fbWZuX3QgKikgZ3J1Yl94
ZW5fc3RhcnRfcGFnZV9hZGRyLT5tZm5fbGlzdDsKICAgcmV0dXJuIG1mbl9saXN0WyhncnViX2Fk
ZHJfdCkgcHRyID4+IEdSVUJfWEVOX0xPR19QQUdFX1NJWkVdOworI2Vsc2UKKyAgcmV0dXJuIChn
cnViX2FkZHJfdCkgcHRyID4+IEdSVUJfWEVOX0xPR19QQUdFX1NJWkU7CiAjZW5kaWYKIH0KIAot
LSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
