From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 00/12] add per-domain and per-cpupool
 generic parameters
Date: Wed, 3 Oct 2018 12:27:14 +0100
Message-ID: <20181003112714.mjnbsbxqed4bpjtr@zion.uk.xensource.com>
References: <6d56ad90-7825-adb7-f4e5-6c3ceb3210f6@suse.com>
 <001ab73a-078d-4ec1-4acd-2fb4389e8867@citrix.com>
 <20180919172818.3aksiju4s3ipw42p@zion.uk.xens=?UTF-8?Q?ource.com>
 <fffd7e59-e437-8ed9-b228-b537fde050cd@suse.com>
 <20180920160629.jullgb435zi7bcbr@zi=?UTF-8?Q?on.uk.xensource.com>
 <eba521d2-f6c5-5096-82c2-af5983ed2372@suse.com>
 <20180921085240.dqzt5pomtnfjs665@zion.uk.xensource.com>
 <8982a437b41f90128a21456de6bb7182b24fae22.camel@suse.com>
 <20181003110035.pcz7oyb66wc4cmfo@zion.uk.xensource.com>
 <96f4400d-ef14-5176-2c68-5527c72cfb71@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nzpo=mp=citrix.com=prvs=80755c3b3=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g7fJG-0006Y7-70
 for xen-devel@lists.xenproject.org; Wed, 03 Oct 2018 11:27:18 +0000
Content-Disposition: inline
In-Reply-To: <96f4400d-ef14-5176-2c68-5527c72cfb71@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBPY3QgMDMsIDIwMTggYXQgMDE6MDc6MzBQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBPbiAwMy8xMC8yMDE4IDEzOjAwLCBXZWkgTGl1IHdyb3RlOgo+ID4gT24gV2VkLCBT
ZXAgMjYsIDIwMTggYXQgMDc6MzA6MzhQTSArMDIwMCwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4g
Pj4gT24gRnJpLCAyMDE4LTA5LTIxIGF0IDA5OjUyICswMTAwLCBXZWkgTGl1IHdyb3RlOgo+ID4+
PiBPbiBGcmksIFNlcCAyMSwgMjAxOCBhdCAwNzoyMzoyM0FNICswMjAwLCBKdWVyZ2VuIEdyb3Nz
IHdyb3RlOgo+ID4+Pj4gT24gMjAvMDkvMTggMTg6MDYsIFdlaSBMaXUgd3JvdGU6Cj4gPj4+Pj4K
PiA+Pj4+PiBJdCBhcHBlYXJzIHRoYXQgdGhlIGltcGxlbWVudGF0aW9uIGluIHBhdGNoIDEwIGNv
bmNhdGVuYXRlcyB0aGUKPiA+Pj4+PiBuZXcKPiA+Pj4+PiBzZXR0aW5ncyB0byB0aGUgb2xkIG9u
ZXMuIEl0IGlzIG5vdCB2ZXJ5IG5pY2UgaW1vLgo+ID4+Pj4+Cj4gPj4+Pj4gSWYgZm9yIHRoZSBs
aWZlIHRpbWUgb2YgdGhlIGRvbWFpbiB5b3Ugc2V0IFggdGltZXMgdGhlIHNhbWUKPiA+Pj4+PiBw
YXJhbWV0ZXIKPiA+Pj4+PiB5b3UgZ2V0IGEgc3RyaW5nIG9mIGZvbz1iYXIxIGZvbz1iYXIyIGlu
IHRoZSBzYXZlZCBjb25maWcgZmlsZS4KPiA+Pj4+Pgo+ID4+Pj4+IFRoZXJlIGlzIHByb2JhYmx5
IGEgc2ltcGxlIHNvbHV0aW9uOiBtYWtlIHRoZSBwYXJhbWV0ZXIgbGlzdCBpbgo+ID4+Pj4+IElE
TCBhCj4gPj4+Pj4ga2V5IHZhbHVlIGxpc3QuIFlvdSB0aGVuIHVwZGF0ZSB0aGUgbGlzdCBhY2Nv
cmRpbmdseS4KPiA+Pj4+Cj4gPj4+PiBUaGUgcHJvYmxlbSB3aXRoIHRoYXQgYXBwcm9hY2ggYXJl
IHBhcmFtZXRlcnMgd2l0aCBzdWItcGFyYW1ldGVyczoKPiA+Pj4+Cj4gPj4+PiBwYXI9c3ViMT1u
byxzdWIyPXllcwo+ID4+Pj4gcGFyPXN1YjI9eWVzCj4gPj4+Cj4gPj4+IFRoZXJlIGlzIGFub3Ro
ZXIgd2F5IHRvIHNvbHZlIHRoaXM6IGZ1cnRoZXIgcGFyc2UgdGhlIHN1Yi1wYXJhbWV0ZXJzLgo+
ID4+PiBUaGlzIGRvZXNuJ3QgcmVxdWlyZSBhbnkgcGFyYW1ldGVyIHNwZWNpZmljIGtub3dsZWRn
ZSBhbmQgdGhlcmUgYXJlCj4gPj4+IGFscmVhZHkgZnVuY3Rpb25zIHRvIHNwbGl0IHN0cmluZ3Mu
Cj4gPj4+Cj4gPj4gSSdtIG5vdCBzdXJlIHdoZXRoZXIgd2UncmUgc2F5aW5nIHRoZSBzYW1lIHRo
aW5nIG9yIG5vdCwgYnV0IGNhbid0IHdlLAo+ID4+IHdoZW4gcGFyYW1ldGVyICdmb28nLCB3aGlj
aCBoYXMgYmVlbiBzZXQgdG8gJ2JhcjEnIGFscmVhZHksIGlzIGJlaW5nCj4gPj4gc2V0IHRvICdi
YXIyJywgc2VhcmNoIGRfY29uZmlnLmJfaW5mby5wYXJhbWV0ZXJzIGZvciB0aGUgc3Vic3RyaW5n
Cj4gPj4gY29udGFpbmluZyAnZm9vPWJhcjEnLCByZXBsYWNlIGl0IHdpdGggJ2Zvbz1iYXIyJywg
YW5kIHNhdmUgZF9jb25maWcKPiA+PiBhZ2Fpbj8KPiA+IAo+ID4gVGhpcyBjYW4gZG8sIHRvby4g
SXQgaXMgc3RpbGwgcGFyc2luZyBzbyB0aGUgYW1vdW50IG9mIHdvcmsgbmVlZGVkIGlzCj4gPiBt
b3JlIG9yIGxlc3MgdGhlIHNhbWUgdG8gbWUuCj4gCj4gTm8sIHRoaXMgaXNuJ3QgYWx3YXlzIGNv
cnJlY3QuIFRoaW5rIG9mIGNvbnNvbGU9dHR5MCBjb25zb2xlPWh2YzAgaW4KPiB0aGUgbGludXgg
a2VybmVsLiBZb3UgZG9uJ3Qgd2FudCBodmMwIHRvIHJlcGxhY2UgdHR5MCwgYnV0IHRvIGhhdmUK
PiBib3RoLgoKR29vZCBwb2ludC4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
