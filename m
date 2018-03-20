From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 7/7] x86: add iommu_ops to map and unmap
 pages, and also to flush the IOTLB
Date: Tue, 20 Mar 2018 03:49:58 -0600
Message-ID: <5AB0E75602000078001B3D70@prv-mh.provo.novell.com>
References: <20180212104714.1922-1-paul.durrant@citrix.com>
 <20180212104714.1922-8-paul.durrant@citrix.com>
 <5AAFE13E02000078001B384A@prv-mh.provo.novell.com>
 <5334db673e44468394c93f4787702e5c@AMSPEX02CL03.citrite.net>
 <5AAFF80C02000078001B3953@prv-mh.provo.novell.com>
 <e34011bd5a674e0dbd3f396ec6f30348@AMSPEX02CL03.citrite.net>
 <5AB0D05F02000078001B3C49@prv-mh.provo.novell.com>
 <66ae597256be4b0f86d12d5ec9abe485@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=3grj=gk=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eyDu7-0006LR-H2
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 09:50:03 +0000
In-Reply-To: <66ae597256be4b0f86d12d5ec9abe485@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim(Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjAzLjE4IGF0IDEwOjMyLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+PiBTZW50
OiAyMCBNYXJjaCAyMDE4IDA4OjEyCj4+IAo+PiA+Pj4gT24gMTkuMDMuMTggYXQgMTc6NTcsIDxQ
YXVsLkR1cnJhbnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4+ID4gV2hhdCBJIG1lYW50IHdhcyB0aGF0
IHNhZmV0eSAoYWdhaW5zdCB1bmRlcmZsb3cpIGlzIHByZWRpY2F0ZWQgb24KPj4gPiBpb21tdV9s
b29rdXBfcGFnZSgpIGZhaWxpbmcgaWYgdGhlIG1hcHBpbmcgd2FzIG5vdCBlc3RhYmxpc2hlZCB0
aHJvdWdoCj4+IGFuCj4+ID4gaW9tbXUgb3AgaHlwZXJjYWxsLiBTbywgdGhlIG9ubHkgdGhpbmdz
IHRoYXQgc2hvdWxkIGJlIHZhbGlkIGluIHRoZSBpb21tdQo+PiA+IChhbmQgaGVuY2UgdGhhdCBp
b21tdV9sb29rdXBfcGFnZSgpIHdvdWxkIHN1Y2NlZWQgZm9yKSBhdCB0aGUgcG9pbnQKPj4gd2hl
cmUgdGhlCj4+ID4gZ3Vlc3Qgc3RhcnRzIHRvIGJvb3QgbXVzdCBhbGwgZmFsbCB3aXRoaW4gcmVz
ZXJ2ZWQgcmVnaW9ucywgc28gdGhheSB0aGV5IGFyZQo+PiA+IHJ1bGVkIG91dCBieSB0aGUgZWFy
bGllciBjaGVjay4KPj4gCj4+IEFoLCBJIHNlZS4gV2hhdCBJIGRvbid0IHNlZSBpcyBob3cgeW91
IHdhbnQgdG8gYXJyYW5nZSBmb3IgdGhhdC4KPj4gVGhlIHRvb2wgc3RhY2sgd291bGRuJ3Qga25v
dyBhaGVhZCBvZiB0aW1lIHdoZXRoZXIgdGhlIGd1ZXN0Cj4+IHdhbnRzIHRvIHVzZSB0aGUgUFYg
SU9NTVUgaW50ZXJmYWNlcywgd291bGQgaXQ/IElPVyByYXRoZXIgdGhhbgo+PiBndWFyYW50ZWVp
bmcgc2FpZCBzdGF0ZSBhdCBzdGFydCBvZiBndWVzdCwgc2hvdWxkbid0IHlvdSBibG93IGF3YXkK
Pj4gYWxsIG5vbi1zcGVjaWFsIG1hcHBpbmdzIHRoZSBmaXJzdCB0aW1lIGEgUFYgSU9NTVUgcmVx
dWVzdCBpcyBtYWRlPwo+PiAKPiAKPiBJIHN1c3BlY3Qgd2Ugd2FudCBib3RoLiBLZXZpbiBzdWdn
ZXN0ZWQgYSAnYmlnIHN3aXRjaCcgd2hlbiB0aGUgZG9tYWluIAo+IGJvb3RzLCBpbiB3aGljaCBJ
IGNvdWxkIGJsb3cgYXdheSBhbGwgbm9uLXJlc2VydmVkIG1hcHBpbmdzLiBCdXQsIGZvciAKPiBw
ZXJmb3JtYW5jZSBzYWtlLCBJIHRoaW5rIGl0IHdvdWxkIGFsc28gYmUgd29ydGggYSBYZW4gY29t
bWFuZCBsaW5lIG9wdGlvbiB0byAKPiBhdm9pZCBwb3B1bGF0aW5nIHRoZSBJT01NVSBtYXBwaW5n
cyBmb3IgZG9tMCBpbiB0aGUgZmlyc3QgcGxhY2UgKHNvIHdoZW4gaXQgCj4gcHVsbHMgdGhlICdi
aWcgc3dpdGNoJyBpdCdzIGEgbm8tb3ApLiBOb24tYXdhcmUgZG9tMHMgd2lsbCwgb2YgY291cnNl
LCBwcm9iYWJseSAKPiBmYWlsIHRvIGJvb3QgYnV0IHdob2V2ZXIgaXMgc2V0dGluZyB0aGUgY29t
bWFuZCBsaW5lIGZvciBYZW4gc2hvdWxkIGtub3cgd2hhdCAKPiB0aGVpciBkb20wIGlzIGNhcGFi
bGUgb2YuIEFzIGZvciBvdGhlciBkb21haW5zLCBpdCBtYXkgYmUgd29ydGggYWRkaW5nIGEgCj4g
c2ltaWxhciBkb21haW4gY3JlYXRlIG9wdGlvbiB0byB0aGUgdG9vbHN0YWNrIGJ1dCB0aGF0IGNv
dWxkIGJlIGRvbmUgYXQgYSAKPiBsYXRlciBkYXRlLgoKT2gsIHllcywgb3B0aW9ucyB0byBhdm9p
ZCB0aGUgZW50aXJlIHRlYXJkb3duIGFyZSBjZXJ0YWlubHkgZ29pbmcKdG8gYmUgYSBnb29kIHRo
aW5nIHRvIGhhdmUuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
