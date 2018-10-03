From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 00/12] add per-domain and per-cpupool
 generic parameters
Date: Wed, 3 Oct 2018 11:58:49 +0100
Message-ID: <20181003105849.huvzhes6jkq2opjm@zion.uk.xensource.com>
References: <7cb2a460-095c-2?==?UTF-8?Q?7c8-a4cf-47ef8e7850d5@suse.com>
 <5BA0DF9602000078001=3d=3fUTF-8?==?UTF-8?Q?=3fQ=3fE9448@suse.com>
 <6d56ad90-7825-adb7-f4e5-6c3ceb3210f6@suse?==?UTF-8?Q?.com>
 <001ab73a-078d-4ec1-4acd-2fb4389e8867@citrix.com>
 <20180919?==?UTF-8?Q?172818.3aksiju4s3ipw42p@zion.uk.xens=3d=3fUTF-8=3fQ=3fource.com>
 <fffd7e59-e437-8ed9-b228-b537fde050cd@suse.com>
 <20180920160629.j?==?UTF-8?Q?ullgb435zi7bcbr@zi=3d=3fUTF-8=3fQ=3fon.uk.xensource.com>
 <eba521d?==?UTF-8?Q?2-f6c5-5096-82c2-af5983ed2372@suse.com>
 <20180921085240.dqzt5pomt?==?UTF-8?Q?nfjs665@zion.uk.xensource.com>
 <d66cfde2-ffc3-0275-60d9-231763953f6f@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nzpo=mp=citrix.com=prvs=80755c3b3=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g7erm-0003vk-Ms
 for xen-devel@lists.xenproject.org; Wed, 03 Oct 2018 10:58:54 +0000
Content-Disposition: inline
In-Reply-To: <d66cfde2-ffc3-0275-60d9-231763953f6f@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBTZXAgMjcsIDIwMTggYXQgMDc6NTg6MzlBTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBPbiAyMS8wOS8xOCAxMDo1MiwgV2VpIExpdSB3cm90ZToKPiA+IE9uIEZyaSwgU2Vw
IDIxLCAyMDE4IGF0IDA3OjIzOjIzQU0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gPj4g
T24gMjAvMDkvMTggMTg6MDYsIFdlaSBMaXUgd3JvdGU6Cj4gPj4+IE9uIFdlZCwgU2VwIDE5LCAy
MDE4IGF0IDA3OjU4OjUwUE0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gPj4+Pgo+ID4+
Pj4gRGlkIHlvdSBsb29rIGludG8gdGhlIHBhdGNoZXMsIGVzcGVjaWFsbHkgcGF0Y2ggMTA/IFRo
ZSBwYXJhbWV0ZXJzIHNldAo+ID4+Pj4gYXJlIGFsbCBzdG9yZWQgaW4gZG9tYWluIGNvbmZpZyB2
aWEgbGlieGxfX2FyY2hfZG9tYWluX3NhdmVfY29uZmlnKCkuCj4gPj4+Cj4gPj4+IE5vLCBJIGRp
ZG4ndC4KPiA+Pj4KPiA+Pj4gSSB0aGluayB0aGUgZ2VuZXJhbCBpZGVhIG9mIHdoYXQgeW91IGRv
IGluIHBhdGNoIDEwIHNob3VsZCB3b3JrLiBIb3dldmVyCj4gPj4+IEkgd2FudCB0byBjb21tZW50
IG9uIHRoZSBpbXBsZW1lbnRhdGlvbi4KPiA+Pj4KPiA+Pj4gSXQgYXBwZWFycyB0aGF0IHRoZSBp
bXBsZW1lbnRhdGlvbiBpbiBwYXRjaCAxMCBjb25jYXRlbmF0ZXMgdGhlIG5ldwo+ID4+PiBzZXR0
aW5ncyB0byB0aGUgb2xkIG9uZXMuIEl0IGlzIG5vdCB2ZXJ5IG5pY2UgaW1vLgo+ID4+Pgo+ID4+
PiBJZiBmb3IgdGhlIGxpZmUgdGltZSBvZiB0aGUgZG9tYWluIHlvdSBzZXQgWCB0aW1lcyB0aGUg
c2FtZSBwYXJhbWV0ZXIKPiA+Pj4geW91IGdldCBhIHN0cmluZyBvZiBmb289YmFyMSBmb289YmFy
MiBpbiB0aGUgc2F2ZWQgY29uZmlnIGZpbGUuCj4gPj4+Cj4gPj4+IFRoZXJlIGlzIHByb2JhYmx5
IGEgc2ltcGxlIHNvbHV0aW9uOiBtYWtlIHRoZSBwYXJhbWV0ZXIgbGlzdCBpbiBJREwgYQo+ID4+
PiBrZXkgdmFsdWUgbGlzdC4gWW91IHRoZW4gdXBkYXRlIHRoZSBsaXN0IGFjY29yZGluZ2x5Lgo+
ID4+Cj4gPj4gVGhlIHByb2JsZW0gd2l0aCB0aGF0IGFwcHJvYWNoIGFyZSBwYXJhbWV0ZXJzIHdp
dGggc3ViLXBhcmFtZXRlcnM6Cj4gPj4KPiA+PiBwYXI9c3ViMT1ubyxzdWIyPXllcwo+ID4+IHBh
cj1zdWIyPXllcwo+ID4gCj4gPiBUaGF0IG1lYW5zIHRoZSB2YWx1ZSB0eXBlIG9mIHRoZSB0b3Ag
bGV2ZWwga2V5IHZhbHVlIGxpc3Qgc2hvdWxkIGlkZWFsbHkKPiA+IGJlIGFub3RoZXIga2V5IHZh
bHVlIGxpc3QuIEkgZG8gbm90aWNlIHRoZSBsaW1pdGF0aW9uIGluIHRoZSBrZXkgdmFsdWUKPiA+
IGxpc3QgdHlwZTogdGhlIHZhbHVlIGNhbiBvbmx5IGJlIHN0cmluZy4KPiA+IAo+ID4gVGhlcmUg
aXMgYW5vdGhlciB3YXkgdG8gc29sdmUgdGhpczogZnVydGhlciBwYXJzZSB0aGUgc3ViLXBhcmFt
ZXRlcnMuCj4gPiBUaGlzIGRvZXNuJ3QgcmVxdWlyZSBhbnkgcGFyYW1ldGVyIHNwZWNpZmljIGtu
b3dsZWRnZSBhbmQgdGhlcmUgYXJlCj4gPiBhbHJlYWR5IGZ1bmN0aW9ucyB0byBzcGxpdCBzdHJp
bmdzLgo+IAo+IEkgZG9uJ3QgdGhpbmsgdGhpcyB3aWxsIHdvcmsgZm9yIHRoZSBnZW5lcmFsIGNh
c2UuIEl0IG1pZ2h0IGJlIHRoYXQKPiAKPiBwYXI9bm8KPiAKPiB3aWxsIHN3aXRjaCBvZmYgYWxs
IHN1Yi1wYXJhbWV0ZXJzLiBIb3cgd291bGQgeW91IGhhbmRsZSB0aGF0PwoKSXNuJ3QgdGhhdCB3
aGF0IGl0IGlzIHN1cHBvc2VkIHRvIGRvPyBEbyB5b3Ugd2FudCBwYXI9bm8gdG8gbm90IHR1cm4g
cGFyCmNvbXBsZXRlbHkgb2ZmIGJ1dCBsZWF2ZSBwYXJ0KHMpIG9mIHBhciBvbj8gVGhlbiBob3cg
ZG8geW91IHR1cm4gcGFyIG9mZgpjb21wbGV0ZWx5PwoKV2VpLgoKPiAKPiBJJ20gbG9va2luZyBp
bnRvIGEgd2F5IHRvIHJlcG9ydCB0aGUgY3VycmVudCBwYXJhbWV0ZXIgc2V0dGluZ3MuCj4gCj4g
Cj4gSnVlcmdlbgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
