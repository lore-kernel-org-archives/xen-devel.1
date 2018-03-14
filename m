From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 4/6] xen/arm: gic: Split the field state in
 gic_lr in 2 fields active and pending
Date: Wed, 14 Mar 2018 18:20:21 +0000
Message-ID: <875cf601-4563-074a-76c2-e5d8b17753f2@arm.com>
References: <20180309163511.18808-1-julien.grall@arm.com>
 <20180309163511.18808-5-julien.grall@arm.com>
 <b0f433bf-b7cd-9cd1-f555-f98fd4356dbc@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ty01=ge=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ewB0n-0006mG-Q6
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 18:20:29 +0000
In-Reply-To: <b0f433bf-b7cd-9cd1-f555-f98fd4356dbc@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@arm.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMy8xNC8yMDE4IDA2OjA5IFBNLCBBbmRyZSBQcnp5d2FyYSB3cm90ZToKPiBPbiAwOS8w
My8xOCAxNjozNSwganVsaWVuLmdyYWxsQGFybS5jb20gd3JvdGU6Cj4+IGRpZmYgLS1naXQgYS94
ZW4vaW5jbHVkZS9hc20tYXJtL2dpY192M19kZWZzLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL2dp
Y192M19kZWZzLmgKPj4gaW5kZXggY2NiNzJjZjBmMS4uODE3YmIwZDVjNyAxMDA2NDQKPj4gLS0t
IGEveGVuL2luY2x1ZGUvYXNtLWFybS9naWNfdjNfZGVmcy5oCj4+ICsrKyBiL3hlbi9pbmNsdWRl
L2FzbS1hcm0vZ2ljX3YzX2RlZnMuaAo+PiBAQCAtMTcxLDYgKzE3MSw4IEBACj4+ICAgI2RlZmlu
ZSBJQ0hfTFJfUEhZU0lDQUxfU0hJRlQgICAgICAgIDMyCj4+ICAgI2RlZmluZSBJQ0hfTFJfU1RB
VEVfTUFTSyAgICAgICAgICAgIDB4Mwo+PiAgICNkZWZpbmUgSUNIX0xSX1NUQVRFX1NISUZUICAg
ICAgICAgICA2Mgo+PiArI2RlZmluZSBJQ0hfTFJfU1RBVEVfUEVORElORyAgICAgICAgICgxVUwg
PDwgNjIpCj4+ICsjZGVmaW5lIElDSF9MUl9TVEFURV9BQ1RJVkUgICAgICAgICAgKDFVTCA8PCA2
MykKPiAKPiBTaG91bGQgdGhhdCBiZSAxVUxMLCBqdXN0IGluIGNhc2Ugd2UgZXZlciBnZXQgMzIt
Yml0IHN1cHBvcnQgZm9yIEdJQ3YzPwoKWWVzLCBnb29kIHBvaW50LiBJIHdpbGwgZml4IHRoYXQu
Cgo+IAo+IFJlZ2FyZGxlc3Mgb2YgdGhhdDoKPiAKPiBSZXZpZXdlZC1ieTogQW5kcmUgUHJ6eXdh
cmEgPGFuZHJlLnByenl3YXJhQGFybS5jb20+CkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
