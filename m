From: Alexander Schulz - XCP-ng Project Member <code@schulzalex.de>
Subject: [PATCH] Reservation of PCI device range 0xc200-0xc2ff
 to XCP-ng Project
Date: Tue, 16 Oct 2018 22:28:04 +0200
Message-ID: <0d7eee26-529d-a900-92d4-9414bfd43eb4@schulzalex.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ja52=m4=schulzalex.de=code@srs-us1.protection.inumbo.net>)
 id 1gCVwn-0006f9-Iz
 for xen-devel@lists.xenproject.org; Tue, 16 Oct 2018 20:28:09 +0000
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, code@schulzalex.de
List-Id: xen-devel@lists.xenproject.org

V2UgYXJlIHRoZSBYQ1AtbmcgcHJvamVjdCAoaHR0cHM6Ly94Y3Atbmcub3JnKSBhbmQgd2FudCB0
byBkaXN0cmlidXRlIApvdXIgb3duIFBWLVRvb2xzIChtYXliZSBhbHNvIHBlciB3aW5kb3dzIHVw
ZGF0ZXMpIHNvIHdlIG5lZWQgYW4gZXh0cmEgcmFuZ2UuCgpXZSBhbHNvIHJlZ2lzdGVyZWQgYSBQ
Q0ktRGV2aWNlOgoKIlhDUC1uZyBQcm9qZWN0IFBDSSBEZXZpY2UgZm9yIFdpbmRvd3MgVXBkYXRl
IiAtPiAKaHR0cHM6Ly9wY2ktaWRzLnVjdy5jei9yZWFkL1BDLzU4NTMvYzIwMAoKU2lnbmVkLW9m
Zi1ieTogQWxleGFuZGVyIFNjaHVseiA8Y29kZUBzY2h1bHphbGV4LmRlPgotLS0KICBkb2NzL21h
bi94ZW4tcGNpLWRldmljZS1yZXNlcnZhdGlvbnMucG9kLjcgfCAxICsKICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kb2NzL21hbi94ZW4tcGNpLWRldmljZS1y
ZXNlcnZhdGlvbnMucG9kLjcgCmIvZG9jcy9tYW4veGVuLXBjaS1kZXZpY2UtcmVzZXJ2YXRpb25z
LnBvZC43CmluZGV4IDA0OWU0NzQxMGYuLjFjZDVhM2UxMTUgMTAwNjQ0Ci0tLSBhL2RvY3MvbWFu
L3hlbi1wY2ktZGV2aWNlLXJlc2VydmF0aW9ucy5wb2QuNworKysgYi9kb2NzL21hbi94ZW4tcGNp
LWRldmljZS1yZXNlcnZhdGlvbnMucG9kLjcKQEAgLTQxLDYgKzQxLDcgQEAgbXVsdGlwbGUgWGVu
IHZlbmRvcnMgdXNpbmcgY29uZmxpY3RpbmcgSURzLgogICAgICAweDAwMDIgICAgICAgIHwgQ2l0
cml4IFhlblNlcnZlciAoZ3JhbmRmYXRoZXJlZCBhbGxvY2F0aW9uIGZvciAKWGVuU2VydmVyIDYu
MSkKICAgICAgMHhjMDAwLTB4YzBmZiB8IENpdHJpeCBYZW5TZXJ2ZXIKICAgICAgMHhjMTAwLTB4
YzFmZiB8IENpdHJpeCBYZW5DbGllbnQKKyAgICAgMHhjMjAwLTB4YzJmZiB8IFhDUC1uZyBQcm9q
ZWN0IChodHRwczovL3hjcC1uZy5vcmcpCiAgID1oZWFkMSBOb3RlcwogIC0tIDIuMTcuMS53aW5k
b3dzLjIKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
