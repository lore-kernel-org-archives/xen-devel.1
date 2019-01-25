From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 5/5] power: ssh: Wait for the target to
 appear to go down
Date: Fri, 25 Jan 2019 14:50:46 +0000
Message-ID: <20190125145046.27138-6-ian.jackson@eu.citrix.com>
References: <20190125145046.27138-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1alE=QB=citrix.com=prvs=9210a8ee7=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gn2ox-00084e-Nq
 for xen-devel@lists.xenproject.org; Fri, 25 Jan 2019 14:51:03 +0000
In-Reply-To: <20190125145046.27138-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2hlbiB3ZSBgcG93ZXIgb24nIHdpdGggdGhlIHNzaCBtZXRob2QsIHdlIGFjdHVhbGx5IHJ1biBz
c2ggcmVib290LgoKT24gc29tZSBzeXN0ZW1zIChub3RhYmx5LCBGcmVlQlNEKSB0aGUga2VybmVs
IGRvZXMgbm90IHNpbXBseSByZWJvb3QKaW1tZWRpYXRlbHkgZXZlbiB3aXRoIHRoZSBydW5lcyB3
ZSBwcm92aWRlIGhlcmUsIGllIGZvciBGcmVlQlNECiAgcmVib290IC1ucQpFZywgSSBoYXZlIHNl
ZW4gcmVib290cyB3aXRoIHNldmVyYWwgbWVzc2FnZXMgbGlrZSB0aGlzOgogIEphbiAyNSAxNDox
Nzo1OS4xMDAwNDQgV2FpdGluZyAobWF4IDYwIHNlY29uZHMpIGZvciBzeXN0ZW0gdGhyZWFkIGBi
dWZzcGFjZWRhZW1vbi0yJyB0byBzdG9wLi4uIGRvbmUKClRoaXMgY2FuIHJlc3VsdCBpbiB0aGUg
c3NoIG1ldGhvZCBmYWlsaW5nIHNwdXJpb3VzbHksIGJlY2F1c2UgdGhlCmBwb3dlciBvbicgYXBw
ZWFycyB0byBjb21wbGV0ZSB3aGlsZSB0aGUgaG9zdCBpcyBzdGlsbCB1cCBpbiB0aGUKcHJldmlv
dXMgZW52aXJvbm1lbnQuICBJbiBvbmUgb2YgbXkgdGVzdCBydW5zIEkgc2F3IGFuIHNzaCB0byB0
aGUgaG9zdApzdWNjZWVkLCBhbmQgcHJpbnQgdGhlIHVwdGltZSAob2YgdGhlIGV4aXN0aW5nIGVu
dmlyb25tZW50KSwgYmV0d2Vlbgp0aGUgcmVib290IGNvbW1hbmQgYmVpbmcgaXNzdWVkIGFuZCB0
aGUgaG9zdCBhY3R1YWxseSByZWJvb3RpbmcuCgpTbywgd2FpdCAodXAgdG8ganVzdCBvdmVyIGEg
bWludXRlKSB1bnRpbCB0aGUgaG9zdCBkb2VzIG5vdCByZXNwb25kIHRvCnBpbmcuICAodGFyZ2V0
X2F3YWl0X2Rvd24gcnVucyBwaW5nIC1jIDUuKQoKQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
ZXUuY2l0cml4LmNvbT4KLS0tCiBPc3N0ZXN0L1BEVS9zc2gucG0gfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Pc3N0ZXN0
L1BEVS9zc2gucG0gYi9Pc3N0ZXN0L1BEVS9zc2gucG0KaW5kZXggMTY0MTA5MzcuLmQ2OGQzODgw
IDEwMDY0NAotLS0gYS9Pc3N0ZXN0L1BEVS9zc2gucG0KKysrIGIvT3NzdGVzdC9QRFUvc3NoLnBt
CkBAIC02Miw3ICs2Miw3IEBAIHN1YiBwZHVfcG93ZXJfc3RhdGUgewogICkmCiBFTkQKIAotICAg
IHNsZWVwKCRkZWxheSk7CisgICAgdGFyZ2V0X2F3YWl0X2Rvd24oJG1vLT57SG9zdH0sICRkZWxh
eSArIDcwKTsKIH0KIAogc3ViIGluc3RhbnRhbmVvdXMgewotLSAKMi4xMS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
