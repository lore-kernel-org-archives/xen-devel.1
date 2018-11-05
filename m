From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86/hvm: Clean up the rest of bool_t
 from vm_event
Date: Mon, 05 Nov 2018 09:28:09 -0700
Message-ID: <5BE06F9902000078001F82B9@prv1-mh.provo.novell.com>
References: <20181029155259.15230-1-aisaila@bitdefender.com>
 <e1676bf0-3e0e-af36-ef46-f3c3615b38f9@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=5iqt=nq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gJhja-0007rn-Hx
 for xen-devel@lists.xenproject.org; Mon, 05 Nov 2018 16:28:14 +0000
In-Reply-To: <e1676bf0-3e0e-af36-ef46-f3c3615b38f9@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: george.dunlap@citrix.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, aisaila@bitdefender.com, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjExLjE4IGF0IDE3OjE3LCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiAxMC8yOS8yMDE4IDAzOjUzIFBNLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90
ZToKPj4gLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9t
bS9wMm0uYwo+PiBAQCAtNDQ4LDcgKzQ0OCw3IEBAIG1mbl90IF9fZ2V0X2dmbl90eXBlX2FjY2Vz
cyhzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLCB1bnNpZ25lZCBsb25nIGdmbl9sLAo+PiAgICAgICAg
ICAvKiBUcnkgdG8gdW5zaGFyZS4gSWYgd2UgZmFpbCwgY29tbXVuaWNhdGUgRU5PTUVNIHdpdGhv
dXQKPj4gICAgICAgICAgICogc2xlZXBpbmcuICovCj4+ICAgICAgICAgIGlmICggbWVtX3NoYXJp
bmdfdW5zaGFyZV9wYWdlKHAybS0+ZG9tYWluLCBnZm5fbCwgMCkgPCAwICkKPj4gLSAgICAgICAg
ICAgICh2b2lkKW1lbV9zaGFyaW5nX25vdGlmeV9lbm9tZW0ocDJtLT5kb21haW4sIGdmbl9sLCAw
KTsKPj4gKyAgICAgICAgICAgIG1lbV9zaGFyaW5nX25vdGlmeV9lbm9tZW0ocDJtLT5kb21haW4s
IGdmbl9sLCBmYWxzZSk7Cj4gCj4gV2h5IGRvIHlvdSByZW1vdmUgdGhlICh2b2lkKSBjYXN0IGhl
cmUuLi4KPiAKPj4gICAgICAgICAgbWZuID0gcDJtLT5nZXRfZW50cnkocDJtLCBnZm4sIHQsIGEs
IHEsIHBhZ2Vfb3JkZXIsIE5VTEwpOwo+PiAgICAgIH0KPj4gIAo+PiBAQCAtODM5LDggKzgzOSw3
IEBAIGd1ZXN0X3BoeXNtYXBfYWRkX2VudHJ5KHN0cnVjdCBkb21haW4gKmQsIGdmbl90IGdmbiwg
bWZuX3QgbWZuLAo+PiAgICAgICAgICAgICAgICAgICAqIEZvcmVpZ24gZG9tYWlucyBhcmUgb2th
eSB0byBwbGFjZSBhbiBldmVudCBhcyB0aGV5IAo+PiAgICAgICAgICAgICAgICAgICAqIHdvbid0
IGdvIHRvIHNsZWVwLiAqLwo+PiAgICAgICAgICAgICAgICAgICh2b2lkKW1lbV9zaGFyaW5nX25v
dGlmeV9lbm9tZW0ocDJtLT5kb21haW4sCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBnZm5feChnZm5fYWRkKGdmbiwgaSkpLAo+PiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMCk7Cj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnZm5feChnZm5fYWRkKGdmbiwg
aSkpLCBmYWxzZSk7Cj4gCj4gLi4uYnV0IG5vdCBoZXJlPwoKSSBoYWQgYXNrZWQgdGhhdCBpdCBz
dHJpY3RseSBiZSByZW1vdmVkIGZyb20gbGluZXMgdG91Y2hlZCBhbnl3YXksCmFuZCBJIGxlZnQg
aXQgdG8gdGhlaXIgZGlzY3JldGlvbiB0byBsZWF2ZSBhbG9uZSBuZWlnaGJvcmluZyBsaW5lcy4g
T2YKY291cnNlIGl0IHdvdWxkIGhhdmUgaGVscGVkIGlmIHRoZSBkZXNjcmlwdGlvbiBzYWlkIHNv
LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
