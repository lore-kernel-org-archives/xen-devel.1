From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2] x86/hvm: Clean up the rest of bool_t
 from vm_event
Date: Mon, 5 Nov 2018 16:34:10 +0000
Message-ID: <5f0628b9-55dc-e3e9-f41d-7b1148ccd78c@citrix.com>
References: <20181029155259.15230-1-aisaila@bitdefender.com>
 <e1676bf0-3e0e-af36-ef46-f3c3615b38f9@citrix.com>
 <5BE06F9902000078001F82B9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=k8cf=nq=citrix.com=prvs=840cd6c1a=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gJhpQ-0000RW-2f
 for xen-devel@lists.xenproject.org; Mon, 05 Nov 2018 16:34:16 +0000
In-Reply-To: <5BE06F9902000078001F82B9@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, aisaila@bitdefender.com, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDUvMjAxOCAwNDoyOCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDUuMTEu
MTggYXQgMTc6MTcsIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+PiBPbiAxMC8y
OS8yMDE4IDAzOjUzIFBNLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToKPj4+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L21tL3AybS5jCj4+
PiBAQCAtNDQ4LDcgKzQ0OCw3IEBAIG1mbl90IF9fZ2V0X2dmbl90eXBlX2FjY2VzcyhzdHJ1Y3Qg
cDJtX2RvbWFpbiAqcDJtLCB1bnNpZ25lZCBsb25nIGdmbl9sLAo+Pj4gICAgICAgICAgLyogVHJ5
IHRvIHVuc2hhcmUuIElmIHdlIGZhaWwsIGNvbW11bmljYXRlIEVOT01FTSB3aXRob3V0Cj4+PiAg
ICAgICAgICAgKiBzbGVlcGluZy4gKi8KPj4+ICAgICAgICAgIGlmICggbWVtX3NoYXJpbmdfdW5z
aGFyZV9wYWdlKHAybS0+ZG9tYWluLCBnZm5fbCwgMCkgPCAwICkKPj4+IC0gICAgICAgICAgICAo
dm9pZCltZW1fc2hhcmluZ19ub3RpZnlfZW5vbWVtKHAybS0+ZG9tYWluLCBnZm5fbCwgMCk7Cj4+
PiArICAgICAgICAgICAgbWVtX3NoYXJpbmdfbm90aWZ5X2Vub21lbShwMm0tPmRvbWFpbiwgZ2Zu
X2wsIGZhbHNlKTsKPj4KPj4gV2h5IGRvIHlvdSByZW1vdmUgdGhlICh2b2lkKSBjYXN0IGhlcmUu
Li4KPj4KPj4+ICAgICAgICAgIG1mbiA9IHAybS0+Z2V0X2VudHJ5KHAybSwgZ2ZuLCB0LCBhLCBx
LCBwYWdlX29yZGVyLCBOVUxMKTsKPj4+ICAgICAgfQo+Pj4gIAo+Pj4gQEAgLTgzOSw4ICs4Mzks
NyBAQCBndWVzdF9waHlzbWFwX2FkZF9lbnRyeShzdHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBnZm4s
IG1mbl90IG1mbiwKPj4+ICAgICAgICAgICAgICAgICAgICogRm9yZWlnbiBkb21haW5zIGFyZSBv
a2F5IHRvIHBsYWNlIGFuIGV2ZW50IGFzIHRoZXkgCj4+PiAgICAgICAgICAgICAgICAgICAqIHdv
bid0IGdvIHRvIHNsZWVwLiAqLwo+Pj4gICAgICAgICAgICAgICAgICAodm9pZCltZW1fc2hhcmlu
Z19ub3RpZnlfZW5vbWVtKHAybS0+ZG9tYWluLAo+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGdmbl94KGdmbl9hZGQoZ2ZuLCBpKSksCj4+PiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMCk7Cj4+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2ZuX3goZ2ZuX2Fk
ZChnZm4sIGkpKSwgZmFsc2UpOwo+Pgo+PiAuLi5idXQgbm90IGhlcmU/Cj4gCj4gSSBoYWQgYXNr
ZWQgdGhhdCBpdCBzdHJpY3RseSBiZSByZW1vdmVkIGZyb20gbGluZXMgdG91Y2hlZCBhbnl3YXks
Cj4gYW5kIEkgbGVmdCBpdCB0byB0aGVpciBkaXNjcmV0aW9uIHRvIGxlYXZlIGFsb25lIG5laWdo
Ym9yaW5nIGxpbmVzLiBPZgo+IGNvdXJzZSBpdCB3b3VsZCBoYXZlIGhlbHBlZCBpZiB0aGUgZGVz
Y3JpcHRpb24gc2FpZCBzby4KClJpZ2h0LiAgSW4gdGhhdCBjYXNlOgoKQWNrZWQtYnk6IEdlb3Jn
ZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
