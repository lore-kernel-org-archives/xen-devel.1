From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH for-4.11] x86/ioreq: Fix build from a collision
 of c/s f46b61973 and c/s 6e387461ed
Date: Fri, 6 Apr 2018 18:57:01 +0100
Message-ID: <1523037421-12880-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

RHJvcCB0aGUgX21mbigpIHdyYXBwZXJzIG5vdyB0aGF0IHBhZ2VfdG9fbWZuKCkgcmV0dXJucyB0
aGUgY29ycmVjdCB0eXBlLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+
CkNDOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgpDQzogSnVsaWVuIEdyYWxsIDxqdWxp
ZW4uZ3JhbGxAYXJtLmNvbT4KQ0M6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5j
b20+CkNDOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogeGVuL2FyY2gveDg2
L2h2bS9pb3JlcS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYyBiL3hl
bi9hcmNoL3g4Ni9odm0vaW9yZXEuYwppbmRleCAzYTIwMWY1Li45MDUxMzI5IDEwMDY0NAotLS0g
YS94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS9pb3JlcS5j
CkBAIC05NzMsMTIgKzk3MywxMiBAQCBpbnQgaHZtX2dldF9pb3JlcV9zZXJ2ZXJfZnJhbWUoc3Ry
dWN0IGRvbWFpbiAqZCwgaW9zZXJ2aWRfdCBpZCwKICAgICAgICAgaWYgKCAhSEFORExFX0JVRklP
UkVRKHMpICkKICAgICAgICAgICAgIGdvdG8gb3V0OwogCi0gICAgICAgICptZm4gPSBfbWZuKHBh
Z2VfdG9fbWZuKHMtPmJ1ZmlvcmVxLnBhZ2UpKTsKKyAgICAgICAgKm1mbiA9IHBhZ2VfdG9fbWZu
KHMtPmJ1ZmlvcmVxLnBhZ2UpOwogICAgICAgICByYyA9IDA7CiAgICAgICAgIGJyZWFrOwogCiAg
ICAgY2FzZSBYRU5NRU1fcmVzb3VyY2VfaW9yZXFfc2VydmVyX2ZyYW1lX2lvcmVxKDApOgotICAg
ICAgICAqbWZuID0gX21mbihwYWdlX3RvX21mbihzLT5pb3JlcS5wYWdlKSk7CisgICAgICAgICpt
Zm4gPSBwYWdlX3RvX21mbihzLT5pb3JlcS5wYWdlKTsKICAgICAgICAgcmMgPSAwOwogICAgICAg
ICBicmVhazsKIAotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
