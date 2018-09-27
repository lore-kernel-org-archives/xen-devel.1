From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 00/12] add per-domain and per-cpupool
 generic parameters
Date: Thu, 27 Sep 2018 07:58:39 +0200
Message-ID: <d66cfde2-ffc3-0275-60d9-231763953f6f@suse.com>
References: =?UTF-8?Q?<20180918060309.7186=3d3d3def=3d3d3dbf=3d3d3dbd1=3d3d3?=
 =?UTF-8?Q?def=3d3d3d=3f=3dbf=3d3dbdjgr=3f=3doss@suse.com=3f=3d>_<5BA0D44602?=
 =?UTF-8?Q?000078001E93EA@prv1=ef=bf=bdmh.provo.novell.com>_<7cb2a460-095c-2?=
 =?UTF-8?Q?7c8-a4cf-47ef8e7850d5@suse.com>_<5BA0DF9602000078001=3d=3fUTF-8?=
 =?UTF-8?Q?=3fQ=3fE9448@suse.com>_<6d56ad90-7825-adb7-f4e5-6c3ceb3210f6@suse?=
 =?UTF-8?Q?.com>_<001ab73a-078d-4ec1-4acd-2fb4389e8867@citrix.com>_<20180919?=
 =?UTF-8?Q?172818.3aksiju4s3ipw42p@zion.uk.xens=3d=3fUTF-8=3fQ=3fource.com>_?=
 =?UTF-8?Q?<fffd7e59-e437-8ed9-b228-b537fde050cd@suse.com>_<20180920160629.j?=
 =?UTF-8?Q?ullgb435zi7bcbr@zi=3d=3fUTF-8=3fQ=3fon.uk.xensource.com>_<eba521d?=
 =?UTF-8?Q?2-f6c5-5096-82c2-af5983ed2372@suse.com>_<20180921085240.dqzt5pomt?=
 =?UTF-8?Q?nfjs665@zion.uk.xensource.com>?=
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ndfh=mj=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1g5PK0-0002n0-DA
 for xen-devel@lists.xenproject.org; Thu, 27 Sep 2018 05:58:44 +0000
In-Reply-To: <20180921085240.dqzt5pomt?=
 =?UTF-8?Q?nfjs665@zion.uk.xensource.com>
Content-Language: en-US
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

T24gMjEvMDkvMTggMTA6NTIsIFdlaSBMaXUgd3JvdGU6Cj4gT24gRnJpLCBTZXAgMjEsIDIwMTgg
YXQgMDc6MjM6MjNBTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMjAvMDkvMTgg
MTg6MDYsIFdlaSBMaXUgd3JvdGU6Cj4+PiBPbiBXZWQsIFNlcCAxOSwgMjAxOCBhdCAwNzo1ODo1
MFBNICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+Cj4+Pj4gRGlkIHlvdSBsb29rIGlu
dG8gdGhlIHBhdGNoZXMsIGVzcGVjaWFsbHkgcGF0Y2ggMTA/IFRoZSBwYXJhbWV0ZXJzIHNldAo+
Pj4+IGFyZSBhbGwgc3RvcmVkIGluIGRvbWFpbiBjb25maWcgdmlhIGxpYnhsX19hcmNoX2RvbWFp
bl9zYXZlX2NvbmZpZygpLgo+Pj4KPj4+IE5vLCBJIGRpZG4ndC4KPj4+Cj4+PiBJIHRoaW5rIHRo
ZSBnZW5lcmFsIGlkZWEgb2Ygd2hhdCB5b3UgZG8gaW4gcGF0Y2ggMTAgc2hvdWxkIHdvcmsuIEhv
d2V2ZXIKPj4+IEkgd2FudCB0byBjb21tZW50IG9uIHRoZSBpbXBsZW1lbnRhdGlvbi4KPj4+Cj4+
PiBJdCBhcHBlYXJzIHRoYXQgdGhlIGltcGxlbWVudGF0aW9uIGluIHBhdGNoIDEwIGNvbmNhdGVu
YXRlcyB0aGUgbmV3Cj4+PiBzZXR0aW5ncyB0byB0aGUgb2xkIG9uZXMuIEl0IGlzIG5vdCB2ZXJ5
IG5pY2UgaW1vLgo+Pj4KPj4+IElmIGZvciB0aGUgbGlmZSB0aW1lIG9mIHRoZSBkb21haW4geW91
IHNldCBYIHRpbWVzIHRoZSBzYW1lIHBhcmFtZXRlcgo+Pj4geW91IGdldCBhIHN0cmluZyBvZiBm
b289YmFyMSBmb289YmFyMiBpbiB0aGUgc2F2ZWQgY29uZmlnIGZpbGUuCj4+Pgo+Pj4gVGhlcmUg
aXMgcHJvYmFibHkgYSBzaW1wbGUgc29sdXRpb246IG1ha2UgdGhlIHBhcmFtZXRlciBsaXN0IGlu
IElETCBhCj4+PiBrZXkgdmFsdWUgbGlzdC4gWW91IHRoZW4gdXBkYXRlIHRoZSBsaXN0IGFjY29y
ZGluZ2x5Lgo+Pgo+PiBUaGUgcHJvYmxlbSB3aXRoIHRoYXQgYXBwcm9hY2ggYXJlIHBhcmFtZXRl
cnMgd2l0aCBzdWItcGFyYW1ldGVyczoKPj4KPj4gcGFyPXN1YjE9bm8sc3ViMj15ZXMKPj4gcGFy
PXN1YjI9eWVzCj4gCj4gVGhhdCBtZWFucyB0aGUgdmFsdWUgdHlwZSBvZiB0aGUgdG9wIGxldmVs
IGtleSB2YWx1ZSBsaXN0IHNob3VsZCBpZGVhbGx5Cj4gYmUgYW5vdGhlciBrZXkgdmFsdWUgbGlz
dC4gSSBkbyBub3RpY2UgdGhlIGxpbWl0YXRpb24gaW4gdGhlIGtleSB2YWx1ZQo+IGxpc3QgdHlw
ZTogdGhlIHZhbHVlIGNhbiBvbmx5IGJlIHN0cmluZy4KPiAKPiBUaGVyZSBpcyBhbm90aGVyIHdh
eSB0byBzb2x2ZSB0aGlzOiBmdXJ0aGVyIHBhcnNlIHRoZSBzdWItcGFyYW1ldGVycy4KPiBUaGlz
IGRvZXNuJ3QgcmVxdWlyZSBhbnkgcGFyYW1ldGVyIHNwZWNpZmljIGtub3dsZWRnZSBhbmQgdGhl
cmUgYXJlCj4gYWxyZWFkeSBmdW5jdGlvbnMgdG8gc3BsaXQgc3RyaW5ncy4KCkkgZG9uJ3QgdGhp
bmsgdGhpcyB3aWxsIHdvcmsgZm9yIHRoZSBnZW5lcmFsIGNhc2UuIEl0IG1pZ2h0IGJlIHRoYXQK
CnBhcj1ubwoKd2lsbCBzd2l0Y2ggb2ZmIGFsbCBzdWItcGFyYW1ldGVycy4gSG93IHdvdWxkIHlv
dSBoYW5kbGUgdGhhdD8KCkknbSBsb29raW5nIGludG8gYSB3YXkgdG8gcmVwb3J0IHRoZSBjdXJy
ZW50IHBhcmFtZXRlciBzZXR0aW5ncy4KCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
