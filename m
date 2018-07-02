From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] x86/altp2m: Add a subop for obtaining the
 mem access of a page
Date: Mon, 2 Jul 2018 12:01:01 +0100
Message-ID: <8021d5e7-c6c6-f1ff-dbe1-9ba564d15526@arm.com>
References: <20180628130036.23241-1-apop@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sc1v=js=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fZwZv-000635-Pf
 for xen-devel@lists.xenproject.org; Mon, 02 Jul 2018 11:01:07 +0000
In-Reply-To: <20180628130036.23241-1-apop@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Adrian Pop <apop@bitdefender.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAwNi8yOC8yMDE4IDAyOjAwIFBNLCBBZHJpYW4gUG9wIHdyb3RlOgo+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vbWVtX2FjY2Vzcy5jIGIveGVuL2FyY2gvYXJtL21lbV9hY2Nlc3Mu
Ywo+IGluZGV4IGFlMjY4NmZmYTIuLmJhOWU1MGU3ZjYgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gv
YXJtL21lbV9hY2Nlc3MuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9tZW1fYWNjZXNzLmMKPiBAQCAt
MjM2LDcgKzIzNiw3IEBAIGJvb2wgcDJtX21lbV9hY2Nlc3NfY2hlY2socGFkZHJfdCBncGEsIHZh
ZGRyX3QgZ2xhLCBjb25zdCBzdHJ1Y3QgbnBmZWMgbnBmZWMpCj4gICAgICAgaWYgKCAhcDJtLT5t
ZW1fYWNjZXNzX2VuYWJsZWQgKQo+ICAgICAgICAgICByZXR1cm4gdHJ1ZTsKPiAgIAo+IC0gICAg
cmMgPSBwMm1fZ2V0X21lbV9hY2Nlc3Modi0+ZG9tYWluLCBnYWRkcl90b19nZm4oZ3BhKSwgJnht
YSk7Cj4gKyAgICByYyA9IHAybV9nZXRfbWVtX2FjY2Vzcyh2LT5kb21haW4sIGdhZGRyX3RvX2dm
bihncGEpLCAmeG1hLCAwKTsKPiAgICAgICBpZiAoIHJjICkKPiAgICAgICAgICAgcmV0dXJuIHRy
dWU7Cj4gICAKPiBAQCAtNDQwLDggKzQ0MCw5IEBAIGxvbmcgcDJtX3NldF9tZW1fYWNjZXNzX211
bHRpKHN0cnVjdCBkb21haW4gKmQsCj4gICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOwo+ICAgfQo+
ICAgCj4gKy8qIFRoZSBhbHRwMm1faWR4IGFyZ3VtZW50IGlzIG5vdCB1c2VkIG9uIEFSTS4gKi8K
CnMvQVJNL0FybS8gcGxlYXNlLgoKQWxzbywgSSBndWVzcyBhbHRwMm1faWR4IHNob3VsZCBhbHdh
eXMgYmUgMCB1bnRpbCBhbHRwMm0gaXMgaW1wbGVtZW50ZWQgCmZvciBBcm0uIElmIHNvLCBJIHdv
dWxkIGxpa2UgdG8gc2VlIGEgY2hlY2sgb24gdGhlIHZhcmlhYmxlIGFuZCByZXR1cm4gCi1FSU5W
QUwgb24gZXJyb3IuCgpDaGVlcywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
