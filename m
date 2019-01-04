From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 0/4] Disentangle PCI from IOMMU maintainership
Date: Fri, 4 Jan 2019 11:33:25 +0100
Message-ID: <20190104103329.35741-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CPMs=PM=citrix.com=prvs=9008e7f41=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gfMnt-0007c7-DE
 for xen-devel@lists.xenproject.org; Fri, 04 Jan 2019 10:34:13 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpDdXJyZW50IGFycmFuZ2VtZW50IG9mIHRoZSBQQ0kgY29kZSBwdXRzIGl0IHVuZGVy
IHZlbmRvciBhZ25vc3RpYyBJT01NVQptYWludGFpbmVyc2hpcCwgd2hpY2ggaXMgSU1PIG5vdCB2
ZXJ5IGFjY3VyYXRlLiBUaGUgYWltIG9mIHRoaXMgc2VyaWVzCmlzIHRvIGFkZCBhIG5ldyBtYWlu
dGFpbmVyc2hpcCBzZWN0aW9uIGNvbnRhaW5pbmcgdGhlIFBDSSBjb2RlIGluIFhlbiwKYW5kIGFk
ZCBteXNlbGYgYXMgcmV2aWV3ZXIuCgpEdWUgdG8gbXkgd29yayBvbiBQVkggRG9tMCwgd2hpY2gg
bWFrZXMgaGVhdnkgdXNlIG9mIHRoZSBIVk0KcGNpLXBhc3N0aHJvdWdoIGluZnJhc3RydWN0dXJl
LCBJJ3ZlIGJlY29tZSBhY3F1YWludGVkIHdpdGggdGhlIFBDSSBjb2RlCmFuZCBJIHRoaW5rIEkg
Y2FuIGhlbHAgd2l0aCByZXZpZXdzLgoKUm9nZXIgUGF1IE1vbm5lICg0KToKICBtYWludGFpbmVy
czogYWx3YXlzIHVzZSBoYXJkIHRhYnMKICB4ODYvcGFzc3Rocm91Z2g6IG1vdmUgaW8uYyB0byB0
aGUgeDg2IHN1YmZvbGRlcgogIHg4Ni9wYXNzdGhyb3VnaDogcHV0IHRoZSB4ODYgZm9sZGVyIHVu
ZGVyIHg4NiBtYWludGFpbmVyc2hpcAogIHBjaTogYWRkIGEgcGNpIHNlY3Rpb24gdG8gdGhlIG1h
aW50YWluZXJzIGZpbGUKCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
IDc3ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9N
YWtlZmlsZSAgICAgICB8ICAzIC0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9NYWtlZmls
ZSAgIHwgIDEgKwogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveyA9PiB4ODZ9L2lvLmMgfCAgMAog
NCBmaWxlcyBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspLCAzNiBkZWxldGlvbnMoLSkKIHJlbmFt
ZSB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC97ID0+IHg4Nn0vaW8uYyAoMTAwJSkKCi0tIAoyLjE3
LjIgKEFwcGxlIEdpdC0xMTMpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
