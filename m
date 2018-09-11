From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v6 09/14] mm / iommu: include need_iommu()
 test in iommu_use_hap_pt()
Date: Tue, 11 Sep 2018 09:39:24 +0000
Message-ID: <1ed1d6509b3043e89ccfe352a9b64ad4@AMSPEX02CL03.citrite.net>
References: <20180823094711.21376-1-paul.durrant@citrix.com>
 <20180823094711.21376-10-paul.durrant@citrix.com>
 <5B925EF202000078001E655B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sdwv=lz=citrix.com=prvs=7852997cf=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fzf8s-0007wH-LT
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 09:39:30 +0000
In-Reply-To: <5B925EF202000078001E655B@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMDcgU2VwdGVtYmVyIDIwMTggMTI6MjAKPiBUbzog
UGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogSnVsaWVuIEdyYWxs
IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47IEFuZHJldyBDb29wZXIKPiA8QW5kcmV3LkNvb3BlcjNA
Y2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAKPiA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsg
SnVuIE5ha2FqaW1hIDxqdW4ubmFrYWppbWFAaW50ZWwuY29tPjsKPiBTdGVmYW5vIFN0YWJlbGxp
bmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyB4ZW4tZGV2ZWwgPHhlbi0KPiBkZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZz4KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDA5LzE0XSBtbSAvIGlv
bW11OiBpbmNsdWRlIG5lZWRfaW9tbXUoKSB0ZXN0IGluCj4gaW9tbXVfdXNlX2hhcF9wdCgpCj4g
Cj4gPj4+IE9uIDIzLjA4LjE4IGF0IDExOjQ3LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gVGhlIG5hbWUgJ2lvbW11X3VzZV9oYXBfcHQnIHN1Z2dlc3RzIHRoYXQgdGhhdCBQ
Mk0gdGFibGUgaXMgaW4gdXNlIGFzCj4gdGhlCj4gPiBkb21haW4ncyBJT01NVSBwYWdldGFibGUg
d2hpY2gsIHByaW9yIHRvIHRoaXMgcGF0Y2gsIGlzIG5vdCBzdHJpY3RseSB0cnVlCj4gPiBzaW5j
ZSB0aGUgbWFjcm8gZGlkIG5vdCB0ZXN0IHdoZXRoZXIgdGhlIGRvbWFpbiBhY3R1YWxseSBoYXMg
SU9NTVUKPiA+IG1hcHBpbmdzLgo+IAo+IEhtbSwgSSB3b3VsZCBuZXZlciBoYXZlIGltcGxpZWQg
ImhhcyBJT01NVSBtYXBwaW5ncyIgZnJvbSB0aGlzCj4gdmFyaWFibGUgbmFtZS4gVG8gbWUgaXQg
aGFzIGFsd2F5cyBiZWVuICJ1c2UgSEFQIHBhZ2UgdGFibGVzIGZvcgo+IElPTU1VIGlmIGFuIElP
TU1VIGlzIGluIHVzZSIuIFRoZSBjb2RlIGNoYW5nZSBsb29rcyBzYW5lLCBidXQKPiBJJ20gbm90
IHN1cmUgaXQgaXMgYSBjbGVhciBpbXByb3ZlbWVudC4gSGVuY2UgSSB3b25kZXIgd2hldGhlciB5
b3UKPiBoYXZlIGEgbmVlZCBmb3IgdGhpcyBjaGFuZ2UgaW4gc3Vic2VxdWVudCBwYXRjaGVzIHdo
aWNoIGdvZXMKPiBiZXlvbmQgd2hhdCB5b3Ugc2F5IGFib3ZlLgo+IAoKSSBjb3VsZCB0YWtlIGl0
IG91dCBidXQgaXQgd291bGQgbWVhbiBhIG5vbi10cml2aWFsIHJlYmFzZSwgYW5kIHRvIG1lIC0g
aWYgdHJ1ZSAtIHRoZSBuYW1lIHNpbGwgaW1wbGllcyB0aGUgSU9NTVUgaXMgaW4gdXNlIGZvciB0
aGUgZG9tYWluIHNvIEknZCBsaWtlIHRvIGtlZXAgdGhlIGNoYW5nZS4KCiAgUGF1bAoKPiBKYW4K
PiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
