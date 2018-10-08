From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/vtd: fix iommu_share_p2m_table
Date: Mon, 08 Oct 2018 04:34:20 -0600
Message-ID: <5BBB32AC02000078001EF7DF@prv1-mh.provo.novell.com>
References: <20181008101445.38735-1-roger.pau@citrix.com>
 <7038f79f8bac47818cbf8223599b5683@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=bw27=mu=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g9Srr-0005AR-68
 for xen-devel@lists.xenproject.org; Mon, 08 Oct 2018 10:34:27 +0000
In-Reply-To: <7038f79f8bac47818cbf8223599b5683@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjEwLjE4IGF0IDEyOjI3LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiAgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogUm9nZXIgUGF1IE1vbm5l
IFttYWlsdG86cm9nZXIucGF1QGNpdHJpeC5jb21dCj4+IFNlbnQ6IDA4IE9jdG9iZXIgMjAxOCAx
MToxNQo+PiBUbzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIAo+PiBDYzogUm9nZXIg
UGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IEphbiBCZXVsaWNoCj4+IDxqYmV1bGlj
aEBzdXNlLmNvbT47IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4+IFN1
YmplY3Q6IFtQQVRDSF0geDg2L3Z0ZDogZml4IGlvbW11X3NoYXJlX3AybV90YWJsZQo+PiAKPj4g
Q29tbWl0IDI5MTY5NTFjMSBjaGFuZ2VkIHRoZSBjaGVjayBpbiBpb21tdV9zaGFyZV9wMm1fdGFi
bGUgdG8gdXNlCj4+IG5lZWRfaW9tbXUoZCkgaW5zdGVhZCBvZiBpb21tdV9lbmFibGVkLCB3aGlj
aCBicm9rZSB0aGUgY2hlY2sgYmVjYXVzZQo+PiBhdCB0aGUgcG9pbnQgaW4gZG9tYWluIGNvbnN0
cnVjdGlvbiB3aGVyZSBpb21tdV9zaGFyZV9wMm1fdGFibGUgaXMKPj4gY2FsbGVkIG5lZWRfaW9t
bXUoZCkgd2lsbCBhbHdheXMgcmV0dXJuIGZhbHNlLgo+PiAKPj4gRml4IHRoaXMgYnkgcmV2ZXJ0
aW5nIHRvIHRoZSBwcmV2aW91cyBsb2dpYy4KPiAKPiBUaGFua3MgZm9yIGZpbmRpbmcgdGhpcy4K
PiAKPiBBYm92ZSwgSSB0aGluayB5b3UgbmVlZCB0byBpbmNsdWRlIHRoZSB0aXRsZSBvZiBjb21t
aXQgMjkxNjk1MWMxIGFuZCBhbHNvIAo+IHRoZSB0ZXh0IHNob3VsZCBzYXkgdGhhdCB0aGUgbmVl
ZF9pb21tdSgpIGNoZWNrIGJlY2FtZSBpbXBsaWNpdCBpbiAKPiBpb21tdV9oYXBfcHRfc2hhcmUo
KSAob3RoZXJ3aXNlIGZvbGtzIGxvb2tpbmcgYXQgdGhlIHBhdGNoIG1heSBiZSBiZW11c2VkIAo+
IGJlY2F1c2UgbmVlZF9pb21tdSBpcyBub3QgaW4gdGhlIGNvZGUpLgoKSW5kZWVkLCBpdCBkaWQg
dGFrZSBtZSBtb3JlIHRoYW4ganVzdCBhIG1vbWVudCB0byBtYWtlIHRoZQpjb25uZWN0aW9uIGJl
dHdlZW4gZGVzY3JpcHRpb24gYW5kIGNvZGUgY2hhbmdlIChpbiB0aGlzCnJlZ2FyZCkuCgpKYW4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
