From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] xen: use hvc console for dom0
Date: Mon, 26 Feb 2018 14:02:17 -0500
Message-ID: <16e21e9e-35d5-81f2-0f90-df5f8ac72446__28046.0472604775$1519671938$gmane$org@oracle.com>
References: <20180226110822.13787-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=mvhl=fu=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1eqO6q-0000br-IH
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2018 19:06:48 +0000
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
Cc: jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjYvMjAxOCAwNjowOCBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBUb2RheSB0aGUg
aHZjIGNvbnNvbGUgaXMgYWRkZWQgYXMgYSBwcmVmZXJyZWQgY29uc29sZSBmb3IgcHYgZG9tVXMK
PiBvbmx5LiBBcyB0aGlzIHJlcXVpcmVzIGEgYm9vdCBwYXJhbWV0ZXIgZm9yIGdldHRpbmcgZG9t
MCBtZXNzYWdlcyBwZXIKPiBkZWZhdWx0IGFkZCBpdCBmb3IgZG9tMCwgdG9vLgo+Cj4gU2lnbmVk
LW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IC0tLQo+ICBhcmNoL3g4
Ni94ZW4vZW5saWdodGVuX3B2LmMgfCA0ICsrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi9lbmxp
Z2h0ZW5fcHYuYyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYwo+IGluZGV4IGMwNDdmNDI1
NTJlMS4uZDI3NzQwYTgwYzVlIDEwMDY0NAo+IC0tLSBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5f
cHYuYwo+ICsrKyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYwo+IEBAIC0xMzc3LDcgKzEz
NzcsNiBAQCBhc21saW5rYWdlIF9fdmlzaWJsZSB2b2lkIF9faW5pdCB4ZW5fc3RhcnRfa2VybmVs
KHZvaWQpCj4gIAlpZiAoIXhlbl9pbml0aWFsX2RvbWFpbigpKSB7Cj4gIAkJYWRkX3ByZWZlcnJl
ZF9jb25zb2xlKCJ4ZW5ib290IiwgMCwgTlVMTCk7Cj4gIAkJYWRkX3ByZWZlcnJlZF9jb25zb2xl
KCJ0dHkiLCAwLCBOVUxMKTsKPiAtCQlhZGRfcHJlZmVycmVkX2NvbnNvbGUoImh2YyIsIDAsIE5V
TEwpOwo+ICAJCWlmIChwY2lfeGVuKQo+ICAJCQl4ODZfaW5pdC5wY2kuYXJjaF9pbml0ID0gcGNp
X3hlbl9pbml0Owo+ICAJfSBlbHNlIHsKPiBAQCAtMTQxMCw2ICsxNDA5LDkgQEAgYXNtbGlua2Fn
ZSBfX3Zpc2libGUgdm9pZCBfX2luaXQgeGVuX3N0YXJ0X2tlcm5lbCh2b2lkKQo+ICAKPiAgCQl4
ZW5fYm9vdF9wYXJhbXNfaW5pdF9lZGQoKTsKPiAgCX0KPiArCj4gKwlhZGRfcHJlZmVycmVkX2Nv
bnNvbGUoImh2YyIsIDAsIE5VTEwpOwo+ICsKCldvbid0IHRoaXMgcHJldmVudCBkb20wIG91dHB1
dCBmcm9tIHNob3dpbmcgdXAgb24gdmdhIGNvbnNvbGUgYnkgZGVmYXVsdD8KCi1ib3JpcwoKPiAg
I2lmZGVmIENPTkZJR19QQ0kKPiAgCS8qIFBDSSBCSU9TIHNlcnZpY2Ugd29uJ3Qgd29yayBmcm9t
IGEgUFYgZ3Vlc3QuICovCj4gIAlwY2lfcHJvYmUgJj0gflBDSV9QUk9CRV9CSU9TOwoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
