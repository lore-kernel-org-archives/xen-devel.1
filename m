From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 09/12] xen/arm: guest_walk: Avoid theoritical
 unitialized value in get_top_bit
Date: Wed, 27 Mar 2019 18:45:28 +0000
Message-ID: <20190327184531.30986-10-julien.grall@arm.com>
References: <20190327184531.30986-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h58V=R6=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h9DYi-0001lA-Rd
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 18:45:56 +0000
In-Reply-To: <20190327184531.30986-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Artem_Mygaiev@epam.com, Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

Q2xhbmcgOC4wIHRocm93cyBhbiBlcnJvciBpbiB0aGUgZ2V0X3RvcF9iaXQgZnVuY3Rpb246Cgpn
dWVzdF93YWxrLmM6MzI4OjE1OiBlcnJvcjogdmFyaWFibGUgJ3RvcGJpdCcgaXMgdXNlZCB1bmlu
aXRpYWxpemVkCndoZW5ldmVyICdpZicgY29uZGl0aW9uIGlzIGZhbHNlIFstV2Vycm9yLC1Xc29t
ZXRpbWVzLXVuaW5pdGlhbGl6ZWRdCiAgICBlbHNlIGlmICggaXNfNjRiaXRfZG9tYWluKGQpICkK
ICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn4KClRoaXMgaXMgaGFwcGVuaW5nIGJlY2F1
c2UgY2xhbmcgdGhpbmtzIHRoYXQgaXNfMzJiaXRfZG9tYWluKGQpIGlzIG5vdAp0aGUgZXhhY3Qg
aW52ZXJzZSBvZiBpc182NGJpdF9kb21haW4oZCkuIFNvIGl0IGV4cGVjdHMgYSBlbHNlIGNhc2Ug
dG8KaGFuZGxlIHRoZSBjYXNlIHdoZXJlIHRoZSBsYXR0ZXIgY2FsbCBpcyBmYWxzZS4KCkluIG90
aGVyIHBhcnQgb2YgdGhlIGNvZGUsIGRlYWxpbmcgd2l0aCBkaWZmZXJlbmNlIGJldHdlZW4gMzIt
Yml0IGFuZAo2NC1iaXQgZG9tYWluLCB3ZSB1c3VhbGx5IHVzZSBpZiAoIGlzX1hYYml0X2RvbWFp
biApIC4uLiBlbHNlIC4uLgoKU28gdXNlIHRoZSBzYW1lIHBhdHRlcm4gaGVyZS4KClNpZ25lZC1v
ZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ci0tLQogeGVuL2FyY2gv
YXJtL2d1ZXN0X3dhbGsuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9ndWVzdF93YWxrLmMgYi94
ZW4vYXJjaC9hcm0vZ3Vlc3Rfd2Fsay5jCmluZGV4IDdkYjdhNzMyMWIuLjFiZWUxOTg3NzcgMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9ndWVzdF93YWxrLmMKKysrIGIveGVuL2FyY2gvYXJtL2d1
ZXN0X3dhbGsuYwpAQCAtMzI1LDcgKzMyNSw3IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgZ2V0X3Rv
cF9iaXQoc3RydWN0IGRvbWFpbiAqZCwgdmFkZHJfdCBndmEsIHJlZ2lzdGVyX3QgdGNyKQogICAg
ICAqLwogICAgIGlmICggaXNfMzJiaXRfZG9tYWluKGQpICkKICAgICAgICAgdG9wYml0ID0gMzE7
Ci0gICAgZWxzZSBpZiAoIGlzXzY0Yml0X2RvbWFpbihkKSApCisgICAgZWxzZQogICAgIHsKICAg
ICAgICAgaWYgKCAoKGd2YSAmIEJJVF9VTEwoNTUpKSAmJiAodGNyICYgVENSX0VMMV9UQkkxKSkg
fHwKICAgICAgICAgICAgICAoIShndmEgJiBCSVRfVUxMKDU1KSkgJiYgKHRjciAmIFRDUl9FTDFf
VEJJMCkpICkKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
