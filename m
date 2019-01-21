From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH] iommu: specify page_count rather than
 page_order to iommu_map/unmap()...
Date: Mon, 21 Jan 2019 11:56:23 +0000
Message-ID: <b972772efd3f4ac195d9c0311f71acf6@AMSPEX02CL03.citrite.net>
References: <20190118160328.10455-1-paul.durrant@citrix.com>
 <5C45ACAA020000780020FAF9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=u29s=P5=citrix.com=prvs=917a3d296=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1glYBn-00065R-LF
 for xen-devel@lists.xenproject.org; Mon, 21 Jan 2019 11:56:27 +0000
In-Reply-To: <5C45ACAA020000780020FAF9@prv1-mh.provo.novell.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Sander Eikelenboom <linux@eikelenboom.it>, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>, Chao Gao <chao.gao@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMjEgSmFudWFyeSAyMDE5IDExOjI4Cj4gVG86IFBh
dWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IEp1bGllbiBHcmFsbCA8
anVsaWVuLmdyYWxsQGFybS5jb20+OyBBbmRyZXcgQ29vcGVyCj4gPEFuZHJldy5Db29wZXIzQGNp
dHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgV2VpCj4g
TGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPjsgU2FuZGVyIEVpa2VsZW5ib29tIDxsaW51eEBlaWtl
bGVuYm9vbS5pdD47Cj4gR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsg
SWFuIEphY2tzb24KPiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47IENoYW8gR2FvIDxjaGFvLmdh
b0BpbnRlbC5jb20+OyBKdW4gTmFrYWppbWEKPiA8anVuLm5ha2FqaW1hQGludGVsLmNvbT47IEtl
dmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPjsgU3RlZmFubwo+IFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+OyB4ZW4tZGV2ZWwgPHhlbi0KPiBkZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZz47IEtvbnJhZCBSemVzenV0ZWsgV2lsawo+IDxrb25yYWQud2lsa0BvcmFjbGUu
Y29tPjsgVGltIChYZW4ub3JnKSA8dGltQHhlbi5vcmc+Cj4gU3ViamVjdDogUmU6IFtQQVRDSF0g
aW9tbXU6IHNwZWNpZnkgcGFnZV9jb3VudCByYXRoZXIgdGhhbiBwYWdlX29yZGVyIHRvCj4gaW9t
bXVfbWFwL3VubWFwKCkuLi4KPiAKPiA+Pj4gT24gMTguMDEuMTkgYXQgMTc6MDMsIDxwYXVsLmR1
cnJhbnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPiAuLi5hbmQgcmVtb3ZlIGFsaWdubWVudCBhc3Nl
cnRpb25zLgo+ID4KPiA+IFRlc3Rpbmcgc2hvd3MgdGhhdCBjZXJ0YWluIGNhbGxlcnMgb2YgaW9t
bXVfbGVnYWN5X21hcC91bm1hcCgpIHNwZWNpZnkKPiA+IG9yZGVyID4gMCByYW5nZXMgdGhhdCBh
cmUgbm90IG9yZGVyIGFsaWduZWQgdGh1cyBjYXVzaW5nIG9uZSBvZiB0aGUKPiA+IElTX0FMSUdO
RUQoKSBhc3NlcnRpb25zIHRvIGZpcmUuCj4gCj4gQXMgc2FpZCBiZWZvcmUgLSB3aXRob3V0IGEg
bXVjaCBiZXR0ZXIgZXhwbGFuYXRpb24gb2Ygd2h5IHRoZSBjdXJyZW50Cj4gb3JkZXItYmFzZWQg
bW9kZWwgaXMgdW5zdWl0YWJsZSAoc28gZmFyIEkndmUgYmVlbiBwcm92aWRlZCBvbmx5IHZhZ3Vl
Cj4gcG9pbnRlcnMgaW50byAic29tZXdoZXJlIGluIFBWSCBEb20wIGJvb3QgY29kZSIgaWlyYykg
dG8gdW5kZXJzdGFuZAo+IHdoeSBpdCdzIHVuZGVzaXJhYmxlIHRvIHNpbXBseSBtYWtlIHRob3Nl
IGNhbGwgc2l0ZXMgb2JleSB0byB0aGUgY3VycmVudAo+IHJlcXVpcmVtZW50cywgSSdtIG5vdCBo
YXBweSB0byBzZWUgdXMgZ28gdGhpcyByb3V0ZS4KCkkgdGhvdWdodC4uLgoKIlVzaW5nIGEgY291
bnQgYWN0dWFsbHkgbWFrZXMgbW9yZSBzZW5zZSBiZWNhdXNlIHRoZSB2YWxpZApzZXQgb2YgbWFw
cGluZyBvcmRlcnMgaXMgc3BlY2lmaWMgdG8gdGhlIElPTU1VIGltcGxlbWVudGF0aW9uIGFuZCB0
byBpdApzaG91bGQgYmUgdXAgdG8gdGhlIGltcGxlbWVudGF0aW9uIHNwZWNpZmljIGNvZGUgdG8g
dHJhbnNsYXRlIGEgbWFwcGluZwpjb3VudCBpbnRvIGFuIG9wdGltYWwgc2V0IG9mIG1hcHBpbmcg
b3JkZXJzICh3aGVuIHRoZSBjb2RlIGlzIGZpbmFsbHkKbW9kaWZpZWQgdG8gc3VwcG9ydCBvcmRl
cnMgPiAwKS4iCgouLi53YXMgcmVhc29uYWJseSBjbGVhci4gSXMgdGhhdCBub3QgYSByZWFzb25h
YmxlIGp1c3RpZmljYXRpb24/IFdoYXQgZWxzZSBjb3VsZCBJIHNheT8KCiAgUGF1bAoKPiAKPiBK
YW4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
