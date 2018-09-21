From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 00/12] add per-domain and per-cpupool
 generic parameters
Date: Fri, 21 Sep 2018 09:52:40 +0100
Message-ID: <20180921085240.dqzt5pomtnfjs665@zion.uk.xensource.com>
References: <20180918060309.7186=3d3def=3d3dbf=3d3dbd1=3d3def=3d3d?==?UTF-8?Q?bf=3d3dbdjgr=3f=3doss@suse.com=3f=3d>
 <5BA0D44602000078001E93EA@p?==?UTF-8?Q?rv1=ef=bf=bdmh.provo.novell.com>
 <7cb2a460-095c-27c8-a4cf-47ef8e7?==?UTF-8?Q?850d5@suse.com>
 <5BA0DF9602000078001=3d=3fUTF-8=3fQ=3fE9448@suse.?==?UTF-8?Q?com>
 <6d56ad90-7825-adb7-f4e5-6c3ceb3210f6@suse.com>
 <001ab73a-07?==?UTF-8?Q?8d-4ec1-4acd-2fb4389e8867@citrix.com>
 <20180919172818.3aksiju4s3i?==?UTF-8?Q?pw42p@zion.uk.xens=3d=3fUTF-8=3fQ=3fource.com>
 <fffd7e59-e437-8ed?==?UTF-8?Q?9-b228-b537fde050cd@suse.com>
 <20180920160629.jullgb435zi7bcbr@zi?==?UTF-8?Q?on.uk.xensource.com>
 <eba521d2-f6c5-5096-82c2-af5983ed2372@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4pl1=md=citrix.com=prvs=7953d62ed=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g3HB7-0003U6-9K
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 08:52:45 +0000
Content-Disposition: inline
In-Reply-To: <eba521d2-f6c5-5096-82c2-af5983ed2372@suse.com>
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

T24gRnJpLCBTZXAgMjEsIDIwMTggYXQgMDc6MjM6MjNBTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBPbiAyMC8wOS8xOCAxODowNiwgV2VpIExpdSB3cm90ZToKPiA+IE9uIFdlZCwgU2Vw
IDE5LCAyMDE4IGF0IDA3OjU4OjUwUE0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gPj4K
PiA+PiBEaWQgeW91IGxvb2sgaW50byB0aGUgcGF0Y2hlcywgZXNwZWNpYWxseSBwYXRjaCAxMD8g
VGhlIHBhcmFtZXRlcnMgc2V0Cj4gPj4gYXJlIGFsbCBzdG9yZWQgaW4gZG9tYWluIGNvbmZpZyB2
aWEgbGlieGxfX2FyY2hfZG9tYWluX3NhdmVfY29uZmlnKCkuCj4gPiAKPiA+IE5vLCBJIGRpZG4n
dC4KPiA+IAo+ID4gSSB0aGluayB0aGUgZ2VuZXJhbCBpZGVhIG9mIHdoYXQgeW91IGRvIGluIHBh
dGNoIDEwIHNob3VsZCB3b3JrLiBIb3dldmVyCj4gPiBJIHdhbnQgdG8gY29tbWVudCBvbiB0aGUg
aW1wbGVtZW50YXRpb24uCj4gPiAKPiA+IEl0IGFwcGVhcnMgdGhhdCB0aGUgaW1wbGVtZW50YXRp
b24gaW4gcGF0Y2ggMTAgY29uY2F0ZW5hdGVzIHRoZSBuZXcKPiA+IHNldHRpbmdzIHRvIHRoZSBv
bGQgb25lcy4gSXQgaXMgbm90IHZlcnkgbmljZSBpbW8uCj4gPiAKPiA+IElmIGZvciB0aGUgbGlm
ZSB0aW1lIG9mIHRoZSBkb21haW4geW91IHNldCBYIHRpbWVzIHRoZSBzYW1lIHBhcmFtZXRlcgo+
ID4geW91IGdldCBhIHN0cmluZyBvZiBmb289YmFyMSBmb289YmFyMiBpbiB0aGUgc2F2ZWQgY29u
ZmlnIGZpbGUuCj4gPiAKPiA+IFRoZXJlIGlzIHByb2JhYmx5IGEgc2ltcGxlIHNvbHV0aW9uOiBt
YWtlIHRoZSBwYXJhbWV0ZXIgbGlzdCBpbiBJREwgYQo+ID4ga2V5IHZhbHVlIGxpc3QuIFlvdSB0
aGVuIHVwZGF0ZSB0aGUgbGlzdCBhY2NvcmRpbmdseS4KPiAKPiBUaGUgcHJvYmxlbSB3aXRoIHRo
YXQgYXBwcm9hY2ggYXJlIHBhcmFtZXRlcnMgd2l0aCBzdWItcGFyYW1ldGVyczoKPiAKPiBwYXI9
c3ViMT1ubyxzdWIyPXllcwo+IHBhcj1zdWIyPXllcwoKVGhhdCBtZWFucyB0aGUgdmFsdWUgdHlw
ZSBvZiB0aGUgdG9wIGxldmVsIGtleSB2YWx1ZSBsaXN0IHNob3VsZCBpZGVhbGx5CmJlIGFub3Ro
ZXIga2V5IHZhbHVlIGxpc3QuIEkgZG8gbm90aWNlIHRoZSBsaW1pdGF0aW9uIGluIHRoZSBrZXkg
dmFsdWUKbGlzdCB0eXBlOiB0aGUgdmFsdWUgY2FuIG9ubHkgYmUgc3RyaW5nLgoKVGhlcmUgaXMg
YW5vdGhlciB3YXkgdG8gc29sdmUgdGhpczogZnVydGhlciBwYXJzZSB0aGUgc3ViLXBhcmFtZXRl
cnMuClRoaXMgZG9lc24ndCByZXF1aXJlIGFueSBwYXJhbWV0ZXIgc3BlY2lmaWMga25vd2xlZGdl
IGFuZCB0aGVyZSBhcmUKYWxyZWFkeSBmdW5jdGlvbnMgdG8gc3BsaXQgc3RyaW5ncy4KCldlaS4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
