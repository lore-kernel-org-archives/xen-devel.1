From: Paul Semel <semelpaul@gmail.com>
Subject: [PATCH v2] fuzz/x86_emulate: fix bounds for input size
Date: Fri, 23 Feb 2018 23:48:57 +0100
Message-ID: <20180223224857.10212-1-semelpaul@gmail.com>
References: <20180223163009.b42xfl3euanth3b7@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ulpj=fr=gmail.com=semelpaul@srs-us1.protection.inumbo.net>)
 id 1epM9Z-0000Zo-A0
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2018 22:49:21 +0000
Received: by mail-wm0-x241.google.com with SMTP id q83so7367358wme.5
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2018 14:49:20 -0800 (PST)
In-Reply-To: <20180223163009.b42xfl3euanth3b7@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com, wei.liu2@citrix.com, Paul Semel <semelpaul@gmail.com>, JBeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

VGhlIG1heGltdW0gc2l6ZSBmb3IgdGhlIGlucHV0IHNpemUgd2FzIHNldCB0byBJTlBVVF9TSVpF
LCB3aGljaCBpcyBhY3R1YWxseQp0aGUgc2l6ZSBvZiB0aGUgZGF0YSBhcnJheSBpbnNpZGUgdGhl
IGZ1enpfY29ycHVzIHN0cnVjdHVyZSBhbmQgc28gd2FzIG5vdAphYmxpbmcgdXNlciAob3IgQUZM
KSB0byBmaWxsIGluIHRoZSB3aG9sZSBzdHJ1Y3R1cmUuIENoYW5naW5nIHRvCnNpemVvZihzdHJ1
Y3QgZnV6el9jb3JwdXMpIGNvcnJlY3QgdGhpcyBwcm9ibGVtLgoKU2lnbmVkLW9mZi1ieTogUGF1
bCBTZW1lbCA8c2VtZWxwYXVsQGdtYWlsLmNvbT4KLS0tCiB0b29scy9mdXp6L3g4Nl9pbnN0cnVj
dGlvbl9lbXVsYXRvci9mdXp6LWVtdWwuYyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvZnV6ei94ODZf
aW5zdHJ1Y3Rpb25fZW11bGF0b3IvZnV6ei1lbXVsLmMgYi90b29scy9mdXp6L3g4Nl9pbnN0cnVj
dGlvbl9lbXVsYXRvci9mdXp6LWVtdWwuYwppbmRleCA5NjQ2ODJhYTFhLi4wYWRhNjEzZjUyIDEw
MDY0NAotLS0gYS90b29scy9mdXp6L3g4Nl9pbnN0cnVjdGlvbl9lbXVsYXRvci9mdXp6LWVtdWwu
YworKysgYi90b29scy9mdXp6L3g4Nl9pbnN0cnVjdGlvbl9lbXVsYXRvci9mdXp6LWVtdWwuYwpA
QCAtMzMsNiArMzMsNyBAQCBzdHJ1Y3QgZnV6el9jb3JwdXMKICAgICB1bnNpZ25lZCBjaGFyIGRh
dGFbSU5QVVRfU0laRV07CiB9IGlucHV0OwogI2RlZmluZSBEQVRBX09GRlNFVCBvZmZzZXRvZihz
dHJ1Y3QgZnV6el9jb3JwdXMsIGRhdGEpCisjZGVmaW5lIEZVWlpfQ09SUFVTX1NJWkUgKHNpemVv
ZihzdHJ1Y3QgZnV6el9jb3JwdXMpKQogCiAvKgogICogSW50ZXJuYWwgc3RhdGUgb2YgdGhlIGZ1
enppbmcgaGFybmVzcy4gIENhbGN1bGF0ZWQgaW5pdGlhbGx5IGZyb20gdGhlIGlucHV0CkBAIC04
MjgsNyArODI5LDcgQEAgaW50IExMVk1GdXp6ZXJUZXN0T25lSW5wdXQoY29uc3QgdWludDhfdCAq
ZGF0YV9wLCBzaXplX3Qgc2l6ZSkKICAgICAgICAgcmV0dXJuIDE7CiAgICAgfQogCi0gICAgaWYg
KCBzaXplID4gSU5QVVRfU0laRSApCisgICAgaWYgKCBzaXplID4gRlVaWl9DT1JQVVNfU0laRSAp
CiAgICAgewogICAgICAgICBwcmludGYoIklucHV0IHRvbyBsYXJnZVxuIik7CiAgICAgICAgIHJl
dHVybiAxOwpAQCAtODU5LDggKzg2MCw2IEBAIGludCBMTFZNRnV6emVyVGVzdE9uZUlucHV0KGNv
bnN0IHVpbnQ4X3QgKmRhdGFfcCwgc2l6ZV90IHNpemUpCiAKIHVuc2lnbmVkIGludCBmdXp6X21p
bmltYWxfaW5wdXRfc2l6ZSh2b2lkKQogewotICAgIEJVSUxEX0JVR19PTihEQVRBX09GRlNFVCA+
IElOUFVUX1NJWkUpOwotCiAgICAgcmV0dXJuIERBVEFfT0ZGU0VUICsgMTsKIH0KIAotLSAKMi4x
Ni4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
