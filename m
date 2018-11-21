From: Juergen Gross <jgross@suse.com>
Subject: [PATCH v5 07/20] xen: modify grub_xen_ptr2mfn() for
 xen-pvh
Date: Wed, 21 Nov 2018 15:28:42 +0100
Message-ID: <20181121142855.13537-8-jgross__49300.5251432352$1542810468$gmane$org@suse.com>
References: <20181121142855.13537-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181121142855.13537-1-jgross@suse.com>
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
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tClY1OiBuZXcgcGF0Y2ggKERhbmllbCBLaXBl
cikKLS0tCiBncnViLWNvcmUva2Vybi94ZW4vaW5pdC5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2dydWItY29yZS9rZXJuL3hlbi9pbml0LmMg
Yi9ncnViLWNvcmUva2Vybi94ZW4vaW5pdC5jCmluZGV4IDEwMDA3YjQxMS4uYTIzZGFkNjMzIDEw
MDY0NAotLS0gYS9ncnViLWNvcmUva2Vybi94ZW4vaW5pdC5jCisrKyBiL2dydWItY29yZS9rZXJu
L3hlbi9pbml0LmMKQEAgLTQ1LDYgKzQ1LDggQEAgZ3J1Yl94ZW5fcHRyMm1mbiAodm9pZCAqcHRy
KQogICBncnViX3hlbl9tZm5fdCAqbWZuX2xpc3QgPQogICAgIChncnViX3hlbl9tZm5fdCAqKSBn
cnViX3hlbl9zdGFydF9wYWdlX2FkZHItPm1mbl9saXN0OwogICByZXR1cm4gbWZuX2xpc3RbKGdy
dWJfYWRkcl90KSBwdHIgPj4gR1JVQl9YRU5fTE9HX1BBR0VfU0laRV07CisjZWxzZQorICByZXR1
cm4gKGdydWJfYWRkcl90KSBwdHIgPj4gR1JVQl9YRU5fTE9HX1BBR0VfU0laRTsKICNlbmRpZgog
fQogCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
