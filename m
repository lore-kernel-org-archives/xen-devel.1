From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v8 10/11] viridian: add implementation of
 synthetic timers
Date: Mon, 18 Mar 2019 10:15:27 -0600
Message-ID: <5C8FC41F020000780021FF7A@prv1-mh.provo.novell.com>
References: <20190318112059.21910-1-paul.durrant@citrix.com>
 <20190318112059.21910-11-paul.durrant@citrix.com>
 <5C8FAA00020000780021FE95@prv1-mh.provo.novell.com>
 <f742ebef90204de1ac1044c100620a2b@AMSPEX02CL02.citrite.net>
 <5C8FB743020000780021FEFD@prv1-mh.provo.novell.com>
 <df2b6b2bbd344e46a678e4a5b225bee4@AMSPEX02CL02.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VMO2=RV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h5uvH-0000fb-1e
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2019 16:15:35 +0000
In-Reply-To: <df2b6b2bbd344e46a678e4a5b225bee4@AMSPEX02CL02.citrite.net>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjAzLjE5IGF0IDE2OjM2LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBYZW4tZGV2ZWwgW21haWx0bzp4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5w
cm9qZWN0Lm9yZ10gT24gQmVoYWxmIE9mIEphbiBCZXVsaWNoCj4+IFNlbnQ6IDE4IE1hcmNoIDIw
MTkgMTU6MjEKPj4gCj4+ID4+PiBPbiAxOC4wMy4xOSBhdCAxNTozNywgPFBhdWwuRHVycmFudEBj
aXRyaXguY29tPiB3cm90ZToKPj4gPj4gRnJvbTogSmFuIEJldWxpY2ggW21haWx0bzpKQmV1bGlj
aEBzdXNlLmNvbV0KPj4gPj4gU2VudDogMTggTWFyY2ggMjAxOSAxNDoyNAo+PiA+Pgo+PiA+PiA+
Pj4gT24gMTguMDMuMTkgYXQgMTI6MjAsIDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4gd3JvdGU6
Cj4+ID4+ID4gKyAgICBBU1NFUlQoZXhwaXJhdGlvbiAtIG5vdyA+IDApOwo+PiA+PiA+ICsKPj4g
Pj4gPiArICAgIHZzLT5leHBpcmF0aW9uID0gZXhwaXJhdGlvbjsKPj4gPj4gPiArICAgIHRpbWVv
dXQgPSAoZXhwaXJhdGlvbiAtIG5vdykgKiAxMDB1bGw7Cj4+ID4+ID4gKwo+PiA+PiA+ICsgICAg
dnMtPnN0YXJ0ZWQgPSB0cnVlOwo+PiA+PiA+ICsgICAgbWlncmF0ZV90aW1lcigmdnMtPnRpbWVy
LCBzbXBfcHJvY2Vzc29yX2lkKCkpOwo+PiA+Pgo+PiA+PiBXaHkgaXMgdGhpcyBzbXBfcHJvY2Vz
c29yX2lkKCkgd2hlbiB2aXJpZGlhbl90aW1lX3ZjcHVfaW5pdCgpIHVzZXMKPj4gPj4gdi0+cHJv
Y2Vzc29yPyBIb3cgcmVsZXZhbnQgaXMgaXQgaW4gdGhlIGZpcnN0IHBsYWNlIHRvIHRyYWNlIHRo
ZSBwQ1BVCj4+ID4+IHRoZSB2Q1BVIHJ1bnMgb24gZm9yIHRoZSB0aW1lcj8KPj4gPgo+PiA+IEkg
d2FzIGp1c3QgZm9sbG93aW5nIHN1aXQgd2l0aCBvdGhlciB0aW1lciBjb2RlLiBJdCBzZWVtcyB0
byBiZSB0aGUgbm9ybSB0bwo+PiA+IG1pZ3JhdGUgdG8gdGhlIGN1cnJlbnQgcENQVSBqdXN0IHBy
aW9yIHRvIHN0YXJ0aW5nIGEgdGltZXIuCj4+IAo+PiBCdXQgd291bGRuJ3Qgdi0+cHJvY2Vzc29y
IHRoZW4gYmUgbW9yZSB2aXNpYmx5IGNvcnJlY3QgKGJlc2lkZXMKPj4gbGlrZWx5IGJlaW5nIGNo
ZWFwZXIgdG8gZ2V0IGF0KSwgYXMgdG8gdGhlIGNvcnJlbGF0aW9uIHRvIHRoZSB2Q1BVCj4+IGlu
IHF1ZXN0aW9uPyBJIGNhbid0IGFjdHVhbGx5IHNlZSB3aHkgIm1pZ3JhdGUgdG8gdGhlIGN1cnJl
bnQgcENQVSIKPj4gd291bGQgYmUgdGhlIG5vcm07IEkgY291bGQgb25seSBzZWUgdGhpcyBhcyBh
biBpbXBsaWNhdGlvbiBmcm9tCj4+IHRoYXQgb3RoZXIgY29kZSB5b3UgbG9va2VkIGF0IHNpbXBs
eSBhY3Rpbmcgb24gdGhlIGN1cnJlbnQgdkNQVS4KPj4gCj4+IFRoZW4gYWdhaW4gSSdtIGhhdmlu
ZyB0cm91YmxlIHNwb3R0aW5nIHdoeSBpdCB3b3VsZCBiZSBpbXBvcnRhbnQKPj4gZm9yIHRoZSB0
aW1lciB0byBydW4gb24gdGhlIHNhbWUgQ1BVIHRoZSB2Q1BVIHJ1bnMgb25lLiBCeSB0aGUKPj4g
dGltZSB0aGUgdGltZXIgZmlyZXMsIHRoZSB2Q1BVIG1heSBoYXZlIGdvbmUgZWxzZXdoZXJlLgo+
PiAKPiAKPiBJIGhhdmUgbm8gcHJvYmxlbSBkcm9wcGluZyB0aGUgbWlncmF0ZSBjYWxsLiBBcyBJ
IHNhaWQsIEkgd2FzIGZvbGxvd2luZyAKPiBwcmlvciBleGFtcGxlIGUuZy4gaW4gdGhlIFZDUFVP
UF9zZXRfc2luZ2xlc2hvdF90aW1lciBoYW5kbGVyIGFuZCBpbiAKPiB2Y3B1X3BlcmlvZGljX3Rp
bWVyX3dvcmsoKSwgd2hpY2ggZG8gaW5kZWVkIHJ1biBvbiBjdXJyZW50Li4uIGJ1dCB0aGVuIHNv
IAo+IHdpbGwgc3RhcnRfdGltZXIoKSBpbiB0aGUgdmFzdCBtYWpvcml0eSBvZiBpbnZvY2F0aW9u
cyAodGhlIGludm9jYXRpb24gaW4gCj4gdmlyaWRpYW5fdGltZV92Y3B1X3RoYXcoKSBiZWluZyB0
aGUgZXhjZXB0aW9uKS4gSSdtIGhhcHB5IGZvciB5b3UgdG8gc3dhcCBpdCAKPiBmb3Igdi0+cHJv
Y2Vzc29yIG9uIGNvbW1pdCB1bmxlc3MgeW91IHdhbnQgbWUgdG8gc2VuZCBhIHY5IHdpdGggdGhl
IGNoYW5nZT8KCk5vIG5lZWQgdG8gc2VuZCB2OSBqdXN0IGZvciB0aGlzLgoKSmFuCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
