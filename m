From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 7/7] x86: add iommu_ops to map and unmap
 pages, and also to flush the IOTLB
Date: Tue, 20 Mar 2018 02:11:59 -0600
Message-ID: <5AB0D05F02000078001B3C49@prv-mh.provo.novell.com>
References: <20180212104714.1922-1-paul.durrant@citrix.com>
 <20180212104714.1922-8-paul.durrant@citrix.com>
 <5AAFE13E02000078001B384A@prv-mh.provo.novell.com>
 <5334db673e44468394c93f4787702e5c@AMSPEX02CL03.citrite.net>
 <5AAFF80C02000078001B3953@prv-mh.provo.novell.com>
 <e34011bd5a674e0dbd3f396ec6f30348@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=3grj=gk=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eyCNH-0006DD-K0
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 08:12:03 +0000
In-Reply-To: <e34011bd5a674e0dbd3f396ec6f30348@AMSPEX02CL03.citrite.net>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim(Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, IanJackson <Ian.Jackson@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjAzLjE4IGF0IDE3OjU3LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiAgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBbc25pcF0KPj4gPj4gSG93IGFyZSB5
b3UgbWFraW5nIHN1cmUgdGhpcyBpcyBhIG1hcHBpbmcgdGhhdCB3YXMgZXN0YWJsaXNoZWQgdmlh
Cj4+ID4+IHRoZSBtYXAgb3A/IFdpdGhvdXQgdGhhdCB0aGlzIGNhbiBiZSAoYWIpdXNlZCB0byAu
Li4KPj4gPj4KPj4gPj4gPiArICAgIHB1dF9wYWdlKHBhZ2UpOwo+PiA+Pgo+PiA+PiAuLi4gdW5k
ZXJmbG93IHRoZSByZWZjb3VudCBvZiBhIHBhZ2UuCj4+ID4+Cj4+ID4KPj4gPiBZZXMsIEkgZ3Vl
c3MgSSBuZWVkIHRvIGVuc3VyZSB0aGF0IG9ubHkgbm9uLVJBTSAoaS5lLiBSTVJSIGFuZCBFODIw
Cj4+IHJlc2VydmVkCj4+ID4gYXJlYXMpIGFyZSBtYXBwZWQgdGhyb3VnaCB0aGUgSU9NTVUgb3Ig
dGhpcyBjb3VsZCBpbmRlZWQgYmUgYWJ1c2VkLgo+PiAKPj4gTm93IEknbSBjb25mdXNlZCAtIHRo
ZW4geW91IGRvbid0IG5lZWQgdG8gZGVhbCB3aXRoIHN0cnVjdCBwYWdlX2luZm8KPj4gYW5kIHBh
Z2UgcmVmZXJlbmNlcyBhdCBhbGwuIE5vciB3b3VsZCB5b3UgbmVlZCB0byBjYWxsCj4+IGdldF9w
YWdlX2Zyb21fZ2ZuKCkgYW5kIGNoZWNrIHAybV9pc19hbnlfcmFtKCkuIEFsc28gLSB3aGF0IHVz
ZQo+PiB3b3VsZCB0aGUgaW50ZXJmYWNlIGJlIGlmIHlvdSBjb3VsZG4ndCBtYXAgYW55IFJBTT8K
Pj4gCj4gCj4gU29ycnkgdG8gY29uZnVzZS4uLgo+IAo+IFdoYXQgSSBtZWFudCB3YXMgdGhhdCBz
YWZldHkgKGFnYWluc3QgdW5kZXJmbG93KSBpcyBwcmVkaWNhdGVkIG9uIAo+IGlvbW11X2xvb2t1
cF9wYWdlKCkgZmFpbGluZyBpZiB0aGUgbWFwcGluZyB3YXMgbm90IGVzdGFibGlzaGVkIHRocm91
Z2ggYW4gCj4gaW9tbXUgb3AgaHlwZXJjYWxsLiBTbywgdGhlIG9ubHkgdGhpbmdzIHRoYXQgc2hv
dWxkIGJlIHZhbGlkIGluIHRoZSBpb21tdSAKPiAoYW5kIGhlbmNlIHRoYXQgaW9tbXVfbG9va3Vw
X3BhZ2UoKSB3b3VsZCBzdWNjZWVkIGZvcikgYXQgdGhlIHBvaW50IHdoZXJlIHRoZSAKPiBndWVz
dCBzdGFydHMgdG8gYm9vdCBtdXN0IGFsbCBmYWxsIHdpdGhpbiByZXNlcnZlZCByZWdpb25zLCBz
byB0aGF5IHRoZXkgYXJlIAo+IHJ1bGVkIG91dCBieSB0aGUgZWFybGllciBjaGVjay4KCkFoLCBJ
IHNlZS4gV2hhdCBJIGRvbid0IHNlZSBpcyBob3cgeW91IHdhbnQgdG8gYXJyYW5nZSBmb3IgdGhh
dC4KVGhlIHRvb2wgc3RhY2sgd291bGRuJ3Qga25vdyBhaGVhZCBvZiB0aW1lIHdoZXRoZXIgdGhl
IGd1ZXN0CndhbnRzIHRvIHVzZSB0aGUgUFYgSU9NTVUgaW50ZXJmYWNlcywgd291bGQgaXQ/IElP
VyByYXRoZXIgdGhhbgpndWFyYW50ZWVpbmcgc2FpZCBzdGF0ZSBhdCBzdGFydCBvZiBndWVzdCwg
c2hvdWxkbid0IHlvdSBibG93IGF3YXkKYWxsIG5vbi1zcGVjaWFsIG1hcHBpbmdzIHRoZSBmaXJz
dCB0aW1lIGEgUFYgSU9NTVUgcmVxdWVzdCBpcyBtYWRlPwoKSmFuCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
