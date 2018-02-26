From: Andrii Anisov <andrii_anisov@epam.com>
Subject: Re: [PATCH] xen: use hvc console for dom0
Date: Mon, 26 Feb 2018 14:06:21 +0200
Message-ID: <0d8bdda5-faef-41da-344a-644b5c3d6006__46377.6625380435$1519646723$gmane$org@epam.com>
References: <20180226110822.13787-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=kt/i=fu=epam.com=andrii_anisov@srs-us1.protection.inumbo.net>)
 id 1eqHYA-00009d-PM
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2018 12:06:34 +0000
In-Reply-To: <20180226110822.13787-1-jgross@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: boris.ostrovsky@oracle.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSnVlcmdlbiwKCgpPbiAyNi4wMi4xOCAxMzowOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToK
PiBUb2RheSB0aGUgaHZjIGNvbnNvbGUgaXMgYWRkZWQgYXMgYSBwcmVmZXJyZWQgY29uc29sZSBm
b3IgcHYgZG9tVXMKPiBvbmx5LiBBcyB0aGlzIHJlcXVpcmVzIGEgYm9vdCBwYXJhbWV0ZXIgZm9y
IGdldHRpbmcgZG9tMCBtZXNzYWdlcyBwZXIKPiBkZWZhdWx0IGFkZCBpdCBmb3IgZG9tMCwgdG9v
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IC0t
LQo+ICAgYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jIHwgNCArKystCj4gICAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJj
aC94ODYveGVuL2VubGlnaHRlbl9wdi5jIGIvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jCklz
IHRoaXMgc29tZXRoaW5nIHg4NiBzcGVjaWZpYz8gQ291bGQgaXQgYmUgYSBnZW5lcmljIGFwcHJv
YWNoPwoKPiBpbmRleCBjMDQ3ZjQyNTUyZTEuLmQyNzc0MGE4MGM1ZSAxMDA2NDQKPiAtLS0gYS9h
cmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMKPiArKysgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVu
X3B2LmMKPiBAQCAtMTM3Nyw3ICsxMzc3LDYgQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgdm9pZCBf
X2luaXQgeGVuX3N0YXJ0X2tlcm5lbCh2b2lkKQo+ICAgCWlmICgheGVuX2luaXRpYWxfZG9tYWlu
KCkpIHsKPiAgIAkJYWRkX3ByZWZlcnJlZF9jb25zb2xlKCJ4ZW5ib290IiwgMCwgTlVMTCk7Cj4g
ICAJCWFkZF9wcmVmZXJyZWRfY29uc29sZSgidHR5IiwgMCwgTlVMTCk7Cj4gLQkJYWRkX3ByZWZl
cnJlZF9jb25zb2xlKCJodmMiLCAwLCBOVUxMKTsKPiAgIAkJaWYgKHBjaV94ZW4pCj4gICAJCQl4
ODZfaW5pdC5wY2kuYXJjaF9pbml0ID0gcGNpX3hlbl9pbml0Owo+ICAgCX0gZWxzZSB7Cj4gQEAg
LTE0MTAsNiArMTQwOSw5IEBAIGFzbWxpbmthZ2UgX192aXNpYmxlIHZvaWQgX19pbml0IHhlbl9z
dGFydF9rZXJuZWwodm9pZCkKPiAgIAo+ICAgCQl4ZW5fYm9vdF9wYXJhbXNfaW5pdF9lZGQoKTsK
PiAgIAl9Cj4gKwo+ICsJYWRkX3ByZWZlcnJlZF9jb25zb2xlKCJodmMiLCAwLCBOVUxMKTsKPiAr
Cj4gICAjaWZkZWYgQ09ORklHX1BDSQo+ICAgCS8qIFBDSSBCSU9TIHNlcnZpY2Ugd29uJ3Qgd29y
ayBmcm9tIGEgUFYgZ3Vlc3QuICovCj4gICAJcGNpX3Byb2JlICY9IH5QQ0lfUFJPQkVfQklPUzsK
Ci0tIAoKKkFuZHJpaSBBbmlzb3YqCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
