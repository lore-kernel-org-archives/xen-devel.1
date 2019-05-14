From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH MM-PART2 RESEND v2 14/19] xen/arm32: mm: Avoid
 cleaning the cache for secondary CPUs page-tables
Date: Tue, 14 May 2019 13:24:51 +0100
Message-ID: <20190514122456.28559-15-julien.grall@arm.com>
References: <20190514122456.28559-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQWUm-0002pk-9m
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:25:24 +0000
In-Reply-To: <20190514122456.28559-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHBhZ2UtdGFibGUgd2Fsa2VyIGlzIGNvbmZpZ3VyZWQgdG8gdXNlIHRoZSBzYW1lIHNoYXJl
YWJpbGl0eSBhbmQKY2FjaGVhYmlsaXR5IGFzIHRoZSBhY2Nlc3MgcGVyZm9ybWVkIHdoZW4gdXBk
YXRpbmcgdGhlIHBhZ2UtdGFibGVzLiBUaGlzCm1lYW5zIGNsZWFuaW5nIHRoZSBjYWNoZSBmb3Ig
c2Vjb25kYXJ5IENQVXMgcnVudGltZSBwYWdlLXRhYmxlcyBpcwp1bm5lY2Vzc2FyeS4KClNpZ25l
ZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+ClJldmlld2VkLWJ5
OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgoKLS0tCiAgICBDaGFuZ2Vz
IGluIHYyOgogICAgICAgIC0gQWRkIEFuZHJpaSdzIHJldmlld2VkLWJ5Ci0tLQogeGVuL2FyY2gv
YXJtL21tLmMgfCAzIC0tLQogMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL21tLmMgYi94ZW4vYXJjaC9hcm0vbW0uYwppbmRleCBjZGEyODQ3
ZDAwLi42ZGI3ZGRhMGRhIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vbW0uYworKysgYi94ZW4v
YXJjaC9hcm0vbW0uYwpAQCAtNzY5LDkgKzc2OSw2IEBAIGludCBpbml0X3NlY29uZGFyeV9wYWdl
dGFibGVzKGludCBjcHUpCiAgICAgICAgIHdyaXRlX3B0ZSgmZmlyc3RbZmlyc3RfdGFibGVfb2Zm
c2V0KERPTUhFQVBfVklSVF9TVEFSVCtpKkZJUlNUX1NJWkUpXSwgcHRlKTsKICAgICB9CiAKLSAg
ICBjbGVhbl9kY2FjaGVfdmFfcmFuZ2UoZmlyc3QsIFBBR0VfU0laRSk7Ci0gICAgY2xlYW5fZGNh
Y2hlX3ZhX3JhbmdlKGRvbWhlYXAsIERPTUhFQVBfU0VDT05EX1BBR0VTKlBBR0VfU0laRSk7Ci0K
ICAgICBwZXJfY3B1KHhlbl9wZ3RhYmxlLCBjcHUpID0gZmlyc3Q7CiAgICAgcGVyX2NwdSh4ZW5f
ZG9tbWFwLCBjcHUpID0gZG9taGVhcDsKIAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
