From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 1/5] vpci: fix updating the command
 register
Date: Mon, 19 Nov 2018 04:31:11 -0700
Message-ID: <5BF29EFF02000078001FD6AD@prv1-mh.provo.novell.com>
References: <20181114115740.1050-1-roger.pau@citrix.com>
 <20181114115740.1050-2-roger.pau@citrix.com>
 <5BEEB15D02000078001FCB9A@prv1-mh.provo.novell.com>
 <20181116143245.vpk3vgpbcqujvofb@mac>
 <5BF273A302000078001FD2BD@prv1-mh.provo.novell.com>
 <20181119110949.73qnubvdtle55jzr@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NNqu=N6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gOhlv-0001Mh-IC
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 11:31:19 +0000
In-Reply-To: <20181119110949.73qnubvdtle55jzr@mac>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjExLjE4IGF0IDEyOjA5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgTm92IDE5LCAyMDE4IGF0IDAxOjI2OjExQU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTYuMTEuMTggYXQgMTU6MzIsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gT24gRnJpLCBOb3YgMTYsIDIwMTggYXQgMDU6MDA6MjlBTSAtMDcwMCwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4+ID4+ID4+PiBPbiAxNC4xMS4xOCBhdCAxMjo1NywgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPiB3cm90ZToKPj4gPj4gPiBAQCAtNDEzLDcgKzQxMiw3IEBAIHN0YXRpYyB2
b2lkIHJvbV93cml0ZShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdW5zaWduZWQgaW50IHJl
ZywKPj4gPj4gPiAgICAgICAgICBoZWFkZXItPnJvbV9lbmFibGVkID0gbmV3X2VuYWJsZWQ7Cj4+
ID4+ID4gICAgICAgICAgcGNpX2NvbmZfd3JpdGUzMihwZGV2LT5zZWcsIHBkZXYtPmJ1cywgc2xv
dCwgZnVuYywgcmVnLCB2YWwpOwo+PiA+PiA+ICAgICAgfQo+PiA+PiA+IC0gICAgZWxzZSBpZiAo
IG1vZGlmeV9iYXJzKHBkZXYsIG5ld19lbmFibGVkLCB0cnVlKSApCj4+ID4+ID4gKyAgICBlbHNl
IGlmICggbW9kaWZ5X2JhcnMocGRldiwgbmV3X2VuYWJsZWQgPyBQQ0lfQ09NTUFORF9NRU1PUlkg
OiAwLCB0cnVlKSApCj4+ID4+IAo+PiA+PiBEbyB5b3UgcmVhbGx5IG1lYW4gdG8gY2xlYXIgYWxs
IG90aGVyIGRlZmluZWQgYml0cyBvZiB0aGUgY29tbWFuZAo+PiA+PiByZWdpc3RlciBoZXJlPwo+
PiA+IAo+PiA+IFRoaXMgaXMgYSBST00gQkFSIHdyaXRlLCBub3QgYSBjb21tYW5kIHJlZ2lzdGVy
IHdyaXRlLiByb21fd3JpdGUKPj4gPiBwYXNzZXMgUENJX0NPTU1BTkRfTUVNT1JZIG1lcmVseSB0
byBzaWduYWwgdGhpcyBpcyBhIG1hcHBpbmcKPj4gPiBvcGVyYXRpb24sIGJ1dCB0aGUgdmFsdWUg
d291bGQgbmV2ZXIgYmUgd3JpdHRlbiB0byB0aGUgY29tbWFuZAo+PiA+IHJlZ2lzdGVyLCB0aGVy
ZSdzIGFuIEFTU0VSVCghcm9tX29ubHkpIGp1c3QgYmVmb3JlIHRoZSBkZWZlcnJlZCB3cml0ZQo+
PiA+IG9mIHRoZSBjb21tYW5kIHJlZ2lzdGVyIGluIG1vZGlmeV9kZWNvZGluZy4KPj4gCj4+IE9o
LCBJIHNlZS4gVGhpcyBpcyBnZXR0aW5nIG1vcmUgc3VidGxlIHRoYW4gaXQgYWxyZWFkeSB3YXMs
IHNvIHBlcmhhcHMKPj4gd29ydGggYXR0YWNoaW5nIGEgYnJpZWYgY29tbWVudCBoZXJlLCB0aGUg
bW9yZSB0aGF0IGlmIGFueXRoaW5nIHdhcwo+PiB3cm9uZyB3aXRoIHRoZSBsb2dpYyBiYWQgYmVo
YXZpb3Igd291bGQgcmVzdWx0IGluIHJlbGVhc2UgYnVpbGRzPwo+IAo+IEl0IHdvdWxkLCBJIGNv
dWxkIGNoYW5nZSB0aGUgQVNTRVJUIHRvIGEgQlVHIGluIG1vZGlmeV9kZWNvZGluZyBpZgo+IHRo
YXQgc2VlbXMgbW9yZSBmb29scHJvb2YuCgpJIGludGVudGlvbmFsbHkgZGlkIG5vdCBzdWdnZXN0
IHN1Y2ggYSBjb252ZXJzaW9uOiBJJ2QgbGlrZSB1cyB0bwpzdG9wIGJyaW5naW5nIGRvd24gdGhl
IGVudGlyZSBob3N0IHdoZW4gYSBwcm9ibGVtIHJlbGF0ZWQgdG8KanVzdCBvbmUgZ3Vlc3QgaXMg
ZW5jb3VudGVyZWQuIFRoYXQgc2FpZCAtIGFzIGxvbmcgYXMgdlBDSSBpcwpmb3IgdGhlIGhhcmR3
YXJlIGRvbWFpbiBvbmx5LCB0aGUgdHJhbnNmb3JtYXRpb24gKGFubm90YXRlZAp0byBpbmRpY2F0
ZSBpdCBuZWVkcyBhZGp1c3RtZW50IHdoZW4gd2lkZW5pbmcgZXhwb3N1cmUgdG8KRG9tVS1zKSB3
b3VsZCBwZXJoYXBzIGJlIGFjY2VwdGFibGUuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
