From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 14/20] xen/arm32: mm: Avoid cleaning the cache
 for secondary CPUs page-tables
Date: Mon, 22 Apr 2019 17:49:31 +0100
Message-ID: <20190422164937.21350-15-julien.grall@arm.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tD/7=SY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hIc8x-0005EB-Cg
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2019 16:50:11 +0000
In-Reply-To: <20190422164937.21350-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

VGhlIHBhZ2UtdGFibGUgd2Fsa2VyIGlzIGNvbmZpZ3VyZWQgdG8gdXNlIHRoZSBzYW1lIHNoYXJl
YWJpbGl0eSBhbmQKY2FjaGVhYmlsaXR5IGFzIHRoZSBhY2Nlc3MgcGVyZm9ybWVkIHdoZW4gdXBk
YXRpbmcgdGhlIHBhZ2UtdGFibGVzLiBUaGlzCm1lYW5zIGNsZWFuaW5nIHRoZSBjYWNoZSBmb3Ig
c2Vjb25kYXJ5IENQVXMgcnVudGltZSBwYWdlLXRhYmxlcyBpcwp1bm5lY2Vzc2FyeS4KClNpZ25l
ZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ci0tLQogeGVuL2Fy
Y2gvYXJtL21tLmMgfCAzIC0tLQogMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL21tLmMgYi94ZW4vYXJjaC9hcm0vbW0uYwppbmRleCBjZGEy
ODQ3ZDAwLi42ZGI3ZGRhMGRhIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vbW0uYworKysgYi94
ZW4vYXJjaC9hcm0vbW0uYwpAQCAtNzY5LDkgKzc2OSw2IEBAIGludCBpbml0X3NlY29uZGFyeV9w
YWdldGFibGVzKGludCBjcHUpCiAgICAgICAgIHdyaXRlX3B0ZSgmZmlyc3RbZmlyc3RfdGFibGVf
b2Zmc2V0KERPTUhFQVBfVklSVF9TVEFSVCtpKkZJUlNUX1NJWkUpXSwgcHRlKTsKICAgICB9CiAK
LSAgICBjbGVhbl9kY2FjaGVfdmFfcmFuZ2UoZmlyc3QsIFBBR0VfU0laRSk7Ci0gICAgY2xlYW5f
ZGNhY2hlX3ZhX3JhbmdlKGRvbWhlYXAsIERPTUhFQVBfU0VDT05EX1BBR0VTKlBBR0VfU0laRSk7
Ci0KICAgICBwZXJfY3B1KHhlbl9wZ3RhYmxlLCBjcHUpID0gZmlyc3Q7CiAgICAgcGVyX2NwdSh4
ZW5fZG9tbWFwLCBjcHUpID0gZG9taGVhcDsKIAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
