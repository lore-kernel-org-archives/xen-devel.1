From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v17 06/11] x86/hvm/ioreq: add a new mappable
 resource type...
Date: Wed, 03 Jan 2018 10:05:06 -0700
Message-ID: <5A4D1B52020000780019A9A9@prv-mh.provo.novell.com>
References: <20180103121942.3524-1-paul.durrant@citrix.com>
 <20180103121942.3524-7-paul.durrant@citrix.com>
 <5A4D094A020000780019A91D@prv-mh.provo.novell.com>
 <d73af670c6044eb5ac76b497e68e139b@AMSPEX02CL03.citrite.net>
 <5A4D15AA020000780019A982@prv-mh.provo.novell.com>
 <deb8dc1bc8b04b84bbbe1522c4b75125@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=gnxr=d6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eWmTZ-0007x9-MR
 for xen-devel@lists.xenproject.org; Wed, 03 Jan 2018 17:05:13 +0000
In-Reply-To: <deb8dc1bc8b04b84bbbe1522c4b75125@AMSPEX02CL03.citrite.net>
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
Cc: StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, JulienGrall <julien.grall@arm.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, IanJackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjAxLjE4IGF0IDE3OjQ4LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiAgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogWGVuLWRldmVsIFttYWls
dG86eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmddIE9uIEJlaGFsZgo+PiBP
ZiBKYW4gQmV1bGljaAo+PiA+Pj4gT24gMDMuMDEuMTggYXQgMTc6MDYsIDxQYXVsLkR1cnJhbnRA
Y2l0cml4LmNvbT4gd3JvdGU6Cj4+ID4+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86SkJldWxp
Y2hAc3VzZS5jb21dCj4+ID4+IFNlbnQ6IDAzIEphbnVhcnkgMjAxOCAxNTo0OAo+PiA+PiA+Pj4g
T24gMDMuMDEuMTggYXQgMTM6MTksIDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4+
ID4+IFdoYXQgaXMgYWRkaXRpb25hbGx5IGNvbmZ1c2luZyBtZSBpcyB0aGUgcGFnZSBvd25lcnNo
aXA6IFdhc24ndAo+PiA+PiB0aGUgKG9yaWdpbmFsKSBpbnRlbnRpb24gdG8gbWFrZSB0aGUgcGFn
ZXMgb3duZWQgYnkgdGhlIGVtdWxhdG9yCj4+ID4+IGRvbWFpbiByYXRoZXIgdGhhbiB0aGUgZ3Vl
c3Q/IEkgc2VlbSB0byByZWNhbGwgeW91IHJlZmVycmluZyB0bwo+PiA+PiByZXN0cmljdGlvbnMg
aW4gZG9fbW11X3VwZGF0ZSgpLCBidXQgYSBkb21haW4gc2hvdWxkIGFsd2F5cyBiZQo+PiA+PiBh
YmxlIHRvIG1hcCBwYWdlcyBpdCBvd25zLCBzaG91bGRuJ3QgaXQ/Cj4+ID4KPj4gPiBJJ20gc3Vy
ZSB3ZSBoYWQgdGhpcyBkaXNjdXNzaW9uIGJlZm9yZS4gSSBhbSB0cnlpbmcgdG8gbWFrZSByZXNv
dXJjZQo+PiBtYXBwaW5nCj4+ID4gYXMgdW5pZm9ybSBhcyBwb3NzaWJsZSBzbywgbGlrZSB0aGUg
Z3JhbnQgdGFibGUgcGFnZXMsIHRoZSBpb3JlcSBzZXJ2ZXIgcGFnZXMKPj4gPiBhcmUgYXNzaWdu
ZWQgdG8gdGhlIHRhcmdldCBkb21haW4uIE90aGVyd2lzZSB0aGUgZG9tYWluIHRyeWluZyB0byBt
YXAKPj4gPiByZXNvdXJjZXMgaGFzIGtub3cgd2hpY2ggYWN0dWFsIGRvbWFpbiB0aGV5IGFyZSBh
c3NpZ25lZCB0bywgcmF0aGVyIHRoYW4KPj4gdGhlCj4+ID4gZG9tYWluIHRoZXkgcmVsYXRlIHRv
Li4uIHdoaWNoIGlzIHByZXR0eSB1Z2x5Lgo+PiAKPj4gRGlkbid0IEkgc3VnZ2VzdCBhIHNsaWdo
dCBjaGFuZ2UgdG8gdGhlIGludGVyZmFjZSB0byBhY3R1YWxseSBtYWtlCj4+IHRoaXMgbm90IGFz
IHVnbHk/Cj4gCj4gWWVzLCB5b3UgZGlkIGJ1dCBJIGRpZG4ndCByZWFsbHkgd2FudCB0byBnbyB0
aGF0IHdheSB1bmxlc3MgSSBhYnNvbHV0ZWx5IGhhZCAKPiB0by4gSWYgeW91J2QgcmVhbGx5IHBy
ZWZlciB0aGluZ3MgdGhhdCB3YXkgdGhlbiBJJ2xsIHJlLXdvcmsgdGhlIGh5cGVyY2FsbCB0byAK
PiBhbGxvdyB0aGUgZG9tYWluIG93bmluZyB0aGUgcmVzb3VyY2UgcGFnZXMgdG8gYmUgcGFzc2Vk
IGJhY2suIE1heWJlIGl0IHdpbGwgCj4gdWx0aW1hdGVseSBlbmQgdXAgbmVhdGVyLgoKQSAzcmQg
b3BpbmlvbiB3b3VsZG4ndCBodXJ0IGJlZm9yZSB5b3UgaW52ZXN0IG11Y2ggdGltZS4KCkphbgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
