From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 00/12] add per-domain and per-cpupool
 generic parameters
Date: Fri, 21 Sep 2018 07:23:23 +0200
Message-ID: <eba521d2-f6c5-5096-82c2-af5983ed2372@suse.com>
References: =?UTF-8?Q?<20180918060309.7186=3d3def=3d3dbf=3d3dbd1=3d3def=3d3d?=
 =?UTF-8?Q?bf=3d3dbdjgr=3f=3doss@suse.com=3f=3d>_<5BA0D44602000078001E93EA@p?=
 =?UTF-8?Q?rv1=ef=bf=bdmh.provo.novell.com>_<7cb2a460-095c-27c8-a4cf-47ef8e7?=
 =?UTF-8?Q?850d5@suse.com>_<5BA0DF9602000078001=3d=3fUTF-8=3fQ=3fE9448@suse.?=
 =?UTF-8?Q?com>_<6d56ad90-7825-adb7-f4e5-6c3ceb3210f6@suse.com>_<001ab73a-07?=
 =?UTF-8?Q?8d-4ec1-4acd-2fb4389e8867@citrix.com>_<20180919172818.3aksiju4s3i?=
 =?UTF-8?Q?pw42p@zion.uk.xens=3d=3fUTF-8=3fQ=3fource.com>_<fffd7e59-e437-8ed?=
 =?UTF-8?Q?9-b228-b537fde050cd@suse.com>_<20180920160629.jullgb435zi7bcbr@zi?=
 =?UTF-8?Q?on.uk.xensource.com>?=
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=slbt=md=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1g3Dub-0004fo-DW
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 05:23:29 +0000
In-Reply-To: <20180920160629.jullgb435zi7bcbr@zi?=
 =?UTF-8?Q?on.uk.xensource.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDkvMTggMTg6MDYsIFdlaSBMaXUgd3JvdGU6Cj4gT24gV2VkLCBTZXAgMTksIDIwMTgg
YXQgMDc6NTg6NTBQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4KPj4gRGlkIHlvdSBs
b29rIGludG8gdGhlIHBhdGNoZXMsIGVzcGVjaWFsbHkgcGF0Y2ggMTA/IFRoZSBwYXJhbWV0ZXJz
IHNldAo+PiBhcmUgYWxsIHN0b3JlZCBpbiBkb21haW4gY29uZmlnIHZpYSBsaWJ4bF9fYXJjaF9k
b21haW5fc2F2ZV9jb25maWcoKS4KPiAKPiBObywgSSBkaWRuJ3QuCj4gCj4gSSB0aGluayB0aGUg
Z2VuZXJhbCBpZGVhIG9mIHdoYXQgeW91IGRvIGluIHBhdGNoIDEwIHNob3VsZCB3b3JrLiBIb3dl
dmVyCj4gSSB3YW50IHRvIGNvbW1lbnQgb24gdGhlIGltcGxlbWVudGF0aW9uLgo+IAo+IEl0IGFw
cGVhcnMgdGhhdCB0aGUgaW1wbGVtZW50YXRpb24gaW4gcGF0Y2ggMTAgY29uY2F0ZW5hdGVzIHRo
ZSBuZXcKPiBzZXR0aW5ncyB0byB0aGUgb2xkIG9uZXMuIEl0IGlzIG5vdCB2ZXJ5IG5pY2UgaW1v
Lgo+IAo+IElmIGZvciB0aGUgbGlmZSB0aW1lIG9mIHRoZSBkb21haW4geW91IHNldCBYIHRpbWVz
IHRoZSBzYW1lIHBhcmFtZXRlcgo+IHlvdSBnZXQgYSBzdHJpbmcgb2YgZm9vPWJhcjEgZm9vPWJh
cjIgaW4gdGhlIHNhdmVkIGNvbmZpZyBmaWxlLgo+IAo+IFRoZXJlIGlzIHByb2JhYmx5IGEgc2lt
cGxlIHNvbHV0aW9uOiBtYWtlIHRoZSBwYXJhbWV0ZXIgbGlzdCBpbiBJREwgYQo+IGtleSB2YWx1
ZSBsaXN0LiBZb3UgdGhlbiB1cGRhdGUgdGhlIGxpc3QgYWNjb3JkaW5nbHkuCgpUaGUgcHJvYmxl
bSB3aXRoIHRoYXQgYXBwcm9hY2ggYXJlIHBhcmFtZXRlcnMgd2l0aCBzdWItcGFyYW1ldGVyczoK
CnBhcj1zdWIxPW5vLHN1YjI9eWVzCnBhcj1zdWIyPXllcwoKd291bGQgcmVtb3ZlIHRoZSBzdWIx
PW5vIHNldHRpbmcuCgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
