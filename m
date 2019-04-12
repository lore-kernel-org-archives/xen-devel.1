From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] timers: move back migrate_timers_from_cpu()
 invocation
Date: Fri, 12 Apr 2019 05:27:05 -0600
Message-ID: <5CB076090200007800226DBD@prv1-mh.provo.novell.com>
References: <5CAF1AD502000078002268CA@prv1-mh.provo.novell.com>
 <704b34f9-dbbf-45f4-4e96-2a38e7c942ac@citrix.com>
 <5CAF1D1902000078002268F3@prv1-mh.provo.novell.com>
 <790227e0-921a-bf64-21c1-522e46d72fd5@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UMhk=SO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hEuKq-0005r3-Fx
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 11:27:08 +0000
In-Reply-To: <790227e0-921a-bf64-21c1-522e46d72fd5@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjA0LjE5IGF0IDIyOjAzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTEvMDQvMjAxOSAxMTo1NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDEx
LjA0LjE5IGF0IDEyOjQ3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBP
biAxMS8wNC8yMDE5IDExOjQ1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBAQCAtNjQ4LDYgKzY0
Niw4IEBAIHN0YXRpYyBpbnQgY3B1X2NhbGxiYWNrKAo+Pj4+ICAgICAgY2FzZSBDUFVfVVBfQ0FO
Q0VMRUQ6Cj4+Pj4gICAgICBjYXNlIENQVV9ERUFEOgo+Pj4+ICAgICAgY2FzZSBDUFVfUkVTVU1F
X0ZBSUxFRDoKPj4+PiArICAgICAgICBtaWdyYXRlX3RpbWVyc19mcm9tX2NwdShjcHUpOwo+Pj4+
ICsKPj4+PiAgICAgICAgICBpZiAoICFwYXJrX29mZmxpbmVfY3B1cyAmJiBzeXN0ZW1fc3RhdGUg
IT0gU1lTX1NUQVRFX3N1c3BlbmQgKQo+Pj4+ICAgICAgICAgICAgICBmcmVlX3BlcmNwdV90aW1l
cnMoY3B1KTsKPj4+PiAgICAgICAgICBicmVhazsKPj4+IEknbSBwcmV0dHkgc3VyZSB5b3UgYWxz
byBuZWVkIGEgY2FsbCBpbiB0aGUgUkVNT1ZFX0NBU0UuICBUaGUgY3B1IGNvbWVzCj4+PiBvbmxp
bmUgZm9yIGxvbmcgZW5vdWdoIHRvIHBvdGVudGlhbGx5IGdhaW4gYSB0aW1lci4KPj4gV2hhdCBk
byB5b3UgbWVhbiBieSAiY29tZXMgb25saW5lIGZvciBsb25nIGVub3VnaCI/IFRoZXJlJ3MKPj4g
bm8gY2FsbCBzaXRlIGZvciB0aGUgbm90aWZpZXIgd2l0aCBDUFVfUkVNT1ZFIHJpZ2h0IG5vdywg
c28gd2hhdAo+PiB0aGUgZXZlbnR1YWwgYmVoYXZpb3IgaXMgZ29pbmcgdG8gYmUgaXMgc2ltcGx5
IHVua25vd24uIEkgZm9yIG9uZQo+PiBkb24ndCBleHBlY3QgdGhlIENQVSB0byBiZSBicm91Z2h0
IGJhY2sgdXAgYWdhaW4gaW4gdGhhdCBjYXNlLgo+PiBJJ20gd29uZGVyaW5nIGlmIHlvdSdyZSBt
aXhpbmcgdGhpcyB1cCB3aXRoIENQVV9SRVNVTUVfRkFJTEVELgo+IAo+IE5vdyBJJ20gZXZlbiBt
b3JlIGNvbmZ1c2VkLCBidXQgeWVzIGNsZWFybHkgLSBpdCB3YXNuJ3QgdGhlIENQVV9SRU1PVkUg
Y2FzZS4KPiAKPiBUaGF0IHNhaWQsIGJ5IG1ha2luZyB0aGlzIGFkanVzdG1lbnQsIHlvdSBhcmUg
bm93IGxpYWJsZSB0byBoaXQgYW4KPiBhc3NlcnRpb24gaW4gdGhlIFJFTU9WRSBjYXNlLCB3aGlj
aCBvbiBhIHJlbGVhc2UgYnVpbGQgd2lsbCByZXN1bHQgaW4KPiBjb21wbGV0ZSBtZW1vcnkgY29y
cnVwdGlvbiwgYXMgaXQgZnJlZXMgYW4gaW4tdXNlIGRhdGFzdHJ1Y3R1cmUuCgpOb3cgSSdtIGFm
cmFpZCBJJ20gY29uZnVzZWQgYXMgd2VsbDogV2hpY2ggYXNzZXJ0aW9uIHdvdWxkIHRyaWdnZXIs
CmFuZCB3aGljaCBpbi11c2UgZGF0YSBzdHJ1Y3R1cmUgd291bGQgZ2V0IGZyZWVkPyBGb3IgYW4g
b2ZmbGluZQooYW5kIHBhcmtlZCkgQ1BVLCB0aGUgaGVhcCBwb2ludGVyIHdvdWxkIGNvbnNpc3Rl
bnRseSBwb2ludCB0bwpkdW1teV9oZWFwIGF0IGFsbCB0aW1lcy4KCkphbgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
