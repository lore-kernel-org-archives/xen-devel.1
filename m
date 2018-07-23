From: Christian Lindig <christian.lindig@citrix.com>
Subject: Re: [PATCH v2 2/2] ocaml: remove undefined behaviour in
 systemd_stubs.c
Date: Mon, 23 Jul 2018 10:28:27 +0000
Message-ID: <965348E1-C7A5-4DC6-AAD9-C0FBDEF1BCAC@citrix.com>
References: <20180723102649.31392-1-wei.liu2@citrix.com>
 <20180723102649.31392-3-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jqba=kh=citrix.com=prvs=7358b8244=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1fhY4r-00049r-V3
 for xen-devel@lists.xenproject.org; Mon, 23 Jul 2018 10:28:29 +0000
In-Reply-To: <20180723102649.31392-3-wei.liu2@citrix.com>
Content-Language: en-US
Content-ID: <D28C9C909241804783C3F4CF945B9815@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, David Scott <dave@recoil.org>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Cgo+IE9uIDIzIEp1bCAyMDE4LCBhdCAxMToyNiwgV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNv
bT4gd3JvdGU6Cj4gCj4gQ2xhbmcgY29tcGxhaW5zOgo+IAo+IHN5c3RlbWRfc3R1YnMuYzo1MTo4
OiBlcnJvcjogc2hpZnRpbmcgYSBuZWdhdGl2ZSBzaWduZWQgdmFsdWUgaXMgdW5kZWZpbmVkIFst
V2Vycm9yLC1Xc2hpZnQtbmVnYXRpdmUtdmFsdWVdCj4gICAgICAgIHJldCA9IFZhbF9pbnQoLTFV
KTsKPiAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+Cj4gCj4gU2luY2Ugc2Rfbm90aWZ5X2ZkIGhh
cyBhIHNpZ25hdHVyZSBvZiB1bml0IC0+IHVuaXQsIHdlIHNpbXBseSBjaGFuZ2UKPiB0aGUgcmV0
dXJuIHZhbHVlIHRvIFZhbF91bml0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5s
aXUyQGNpdHJpeC5jb20+Cj4gLS0tCj4gQ2M6IENocmlzdGlhbiBMaW5kaWcgPGNocmlzdGlhbi5s
aW5kaWdAY2l0cml4LmNvbT4KPiBDYzogRGF2aWQgU2NvdHQgPGRhdmVAcmVjb2lsLm9yZz4KPiAK
PiBTZWU6IGh0dHBzOi8vZ2l0bGFiLmNvbS9saXV3L3hlbi8tL2pvYnMvODM2Mjg4MzMKPiAtLS0K
PiB0b29scy9vY2FtbC94ZW5zdG9yZWQvc3lzdGVtZF9zdHVicy5jIHwgMTAgKystLS0tLS0tLQo+
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL3Rvb2xzL29jYW1sL3hlbnN0b3JlZC9zeXN0ZW1kX3N0dWJzLmMgYi90b29scy9v
Y2FtbC94ZW5zdG9yZWQvc3lzdGVtZF9zdHVicy5jCj4gaW5kZXggNDkwMTU2YzA2YS4uMzFhMWE1
ZDM4NCAxMDA2NDQKPiAtLS0gYS90b29scy9vY2FtbC94ZW5zdG9yZWQvc3lzdGVtZF9zdHVicy5j
Cj4gKysrIGIvdG9vbHMvb2NhbWwveGVuc3RvcmVkL3N5c3RlbWRfc3R1YnMuYwo+IEBAIC0zMiwx
MyArMzIsMTAgQEAKPiBDQU1McHJpbSB2YWx1ZSBvY2FtbF9zZF9ub3RpZnlfcmVhZHkodmFsdWUg
aWdub3JlKQo+IHsKPiAJQ0FNTHBhcmFtMShpZ25vcmUpOwo+IC0JQ0FNTGxvY2FsMShyZXQpOwo+
IC0KPiAtCXJldCA9IFZhbF9pbnQoMCk7Cj4gCj4gCXNkX25vdGlmeSgxLCAiUkVBRFk9MSIpOwo+
IAo+IC0JQ0FNTHJldHVybihyZXQpOwo+ICsJQ0FNTHJldHVybihWYWxfdW5pdCk7Cj4gfQo+IAo+
ICNlbHNlCj4gQEAgLTQ2LDEwICs0Myw3IEBAIENBTUxwcmltIHZhbHVlIG9jYW1sX3NkX25vdGlm
eV9yZWFkeSh2YWx1ZSBpZ25vcmUpCj4gQ0FNTHByaW0gdmFsdWUgb2NhbWxfc2Rfbm90aWZ5X3Jl
YWR5KHZhbHVlIGlnbm9yZSkKPiB7Cj4gCUNBTUxwYXJhbTEoaWdub3JlKTsKPiAtCUNBTUxsb2Nh
bDEocmV0KTsKPiAtCj4gLQlyZXQgPSBWYWxfaW50KC0xVSk7Cj4gCj4gLQlDQU1McmV0dXJuKHJl
dCk7Cj4gKwlDQU1McmV0dXJuKFZhbF91bml0KTsKPiB9Cj4gI2VuZGlmCj4gLS0gCj4gMi4xMS4w
Cj4gCgpBY2tlZC1ieTogQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0aWFuLmxpbmRpZ0BjaXRyaXgu
Y29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
