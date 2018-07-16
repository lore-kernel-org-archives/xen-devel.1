From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 01/15] xen/arm: cpregs: Allow HSR_CPREG* to
 receive more than 1 parameter
Date: Mon, 16 Jul 2018 18:26:58 +0100
Message-ID: <20180716172712.20294-2-julien.grall@arm.com>
References: <20180716172712.20294-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=j3cc=ka=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ff7HN-0006QW-72
 for xen-devel@lists.xenproject.org; Mon, 16 Jul 2018 17:27:21 +0000
In-Reply-To: <20180716172712.20294-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, Julien Grall <julien.grall@linaro.org>
List-Id: xen-devel@lists.xenproject.org

QXQgdGhlIG1vbWVudCwgSFNSX0NQUkVHIGlzIGV4cGVjdGVkIHRvIHJlY2VpdmUgb25seSB0aGUg
Y28tcHJvY2Vzc29yCnJlZ2lzdGVyIG5hbWUgaW4gcGFyYW1ldGVyLiBCZWNhdXNlIHRoZSBuYW1l
IGlzIGFjdHVhbGx5IGEgZGVmaW5lLCB0aGlzCm1heSBoYXZlIGJlZW4gZXhwYW5kZWQgYnkgYSBw
cmV2aW91cyBtYWNyby4KClJhdGhlciB0aGFuIGltcG9zaW5nIHRoZSB1c2Ugb2YgX0hTUl9DUFJF
RyogaW4gc3VjaCBjYXNlcywgYWxsb3cKSFNSX0NQUkVHIHRvIHJlY2VpdmUgbW9yZSB0aGFuIDEg
cGFyYW1ldGVyLgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAbGlu
YXJvLm9yZz4KLS0tCiB4ZW4vaW5jbHVkZS9hc20tYXJtL2NwcmVncy5oIHwgNCArKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3hlbi9pbmNsdWRlL2FzbS1hcm0vY3ByZWdzLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL2NwcmVn
cy5oCmluZGV4IDhkYjY1ZDVlMmEuLjRjNzRlODE2MWIgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRl
L2FzbS1hcm0vY3ByZWdzLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9jcHJlZ3MuaApAQCAt
NDcsOCArNDcsOCBAQAogICAgICgoX19IU1JfQ1BSRUdfIyNvcDEpIDw8IEhTUl9DUDY0X09QMV9T
SElGVCkKIAogLyogRW5jb2RlIGEgcmVnaXN0ZXIgYXMgcGVyIEhTUiBJU1MgcGF0dGVybiAqLwot
I2RlZmluZSBIU1JfQ1BSRUczMihYKSBfSFNSX0NQUkVHMzIoWCkKLSNkZWZpbmUgSFNSX0NQUkVH
NjQoWCkgX0hTUl9DUFJFRzY0KFgpCisjZGVmaW5lIEhTUl9DUFJFRzMyKFguLi4pIF9IU1JfQ1BS
RUczMihYKQorI2RlZmluZSBIU1JfQ1BSRUc2NChYLi4uKSBfSFNSX0NQUkVHNjQoWCkKIAogLyoK
ICAqIE9yZGVyIHJlZ2lzdGVycyBieSBDb3Byb2Nlc3Nvci0+IENSbi0+IE9wY29kZSAxLT4gQ1Jt
LT4gT3Bjb2RlIDIKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
