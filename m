From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 00/12] add per-domain and per-cpupool
 generic parameters
Date: Wed, 3 Oct 2018 13:07:30 +0200
Message-ID: <96f4400d-ef14-5176-2c68-5527c72cfb71@suse.com>
References: <7cb2a460-095c-27c8-a4cf-47ef8e7?=850d5@suse.com>
 <5BA0DF9602000078001=?UTF-8?Q?E9448@suse.com>
 <6d56ad90-7825-adb7-f4e5-6c3ceb3210f6@suse.com>
 <001ab73a-078d-4ec1-4acd-2fb4389e8867@citrix.com>
 <20180919172818.3aksiju4s3ipw42p@zion.uk.xens=?UTF-8?Q?ource.com>
 <fffd7e59-e437-8ed9-b228-b537fde050cd@suse.com>
 <20180920160629.jullgb435zi7bcbr@zi=?UTF-8?Q?on.uk.xensource.com>
 <eba521d2-f6c5-5096-82c2-af5983ed2372@suse.com>
 <20180921085240.dqzt5pomtnfjs665@zion.uk.xensource.com>
 <8982a437b41f90128a21456de6bb7182b24fae22.camel@suse.com>
 <20181003110035.pcz7oyb66wc4cmfo@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jydp=mp=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1g7f09-000538-H9
 for xen-devel@lists.xenproject.org; Wed, 03 Oct 2018 11:07:33 +0000
In-Reply-To: <20181003110035.pcz7oyb66wc4cmfo@zion.uk.xensource.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMTAvMjAxOCAxMzowMCwgV2VpIExpdSB3cm90ZToKPiBPbiBXZWQsIFNlcCAyNiwgMjAx
OCBhdCAwNzozMDozOFBNICswMjAwLCBEYXJpbyBGYWdnaW9saSB3cm90ZToKPj4gT24gRnJpLCAy
MDE4LTA5LTIxIGF0IDA5OjUyICswMTAwLCBXZWkgTGl1IHdyb3RlOgo+Pj4gT24gRnJpLCBTZXAg
MjEsIDIwMTggYXQgMDc6MjM6MjNBTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+PiBP
biAyMC8wOS8xOCAxODowNiwgV2VpIExpdSB3cm90ZToKPj4+Pj4KPj4+Pj4gSXQgYXBwZWFycyB0
aGF0IHRoZSBpbXBsZW1lbnRhdGlvbiBpbiBwYXRjaCAxMCBjb25jYXRlbmF0ZXMgdGhlCj4+Pj4+
IG5ldwo+Pj4+PiBzZXR0aW5ncyB0byB0aGUgb2xkIG9uZXMuIEl0IGlzIG5vdCB2ZXJ5IG5pY2Ug
aW1vLgo+Pj4+Pgo+Pj4+PiBJZiBmb3IgdGhlIGxpZmUgdGltZSBvZiB0aGUgZG9tYWluIHlvdSBz
ZXQgWCB0aW1lcyB0aGUgc2FtZQo+Pj4+PiBwYXJhbWV0ZXIKPj4+Pj4geW91IGdldCBhIHN0cmlu
ZyBvZiBmb289YmFyMSBmb289YmFyMiBpbiB0aGUgc2F2ZWQgY29uZmlnIGZpbGUuCj4+Pj4+Cj4+
Pj4+IFRoZXJlIGlzIHByb2JhYmx5IGEgc2ltcGxlIHNvbHV0aW9uOiBtYWtlIHRoZSBwYXJhbWV0
ZXIgbGlzdCBpbgo+Pj4+PiBJREwgYQo+Pj4+PiBrZXkgdmFsdWUgbGlzdC4gWW91IHRoZW4gdXBk
YXRlIHRoZSBsaXN0IGFjY29yZGluZ2x5Lgo+Pj4+Cj4+Pj4gVGhlIHByb2JsZW0gd2l0aCB0aGF0
IGFwcHJvYWNoIGFyZSBwYXJhbWV0ZXJzIHdpdGggc3ViLXBhcmFtZXRlcnM6Cj4+Pj4KPj4+PiBw
YXI9c3ViMT1ubyxzdWIyPXllcwo+Pj4+IHBhcj1zdWIyPXllcwo+Pj4KPj4+IFRoZXJlIGlzIGFu
b3RoZXIgd2F5IHRvIHNvbHZlIHRoaXM6IGZ1cnRoZXIgcGFyc2UgdGhlIHN1Yi1wYXJhbWV0ZXJz
Lgo+Pj4gVGhpcyBkb2Vzbid0IHJlcXVpcmUgYW55IHBhcmFtZXRlciBzcGVjaWZpYyBrbm93bGVk
Z2UgYW5kIHRoZXJlIGFyZQo+Pj4gYWxyZWFkeSBmdW5jdGlvbnMgdG8gc3BsaXQgc3RyaW5ncy4K
Pj4+Cj4+IEknbSBub3Qgc3VyZSB3aGV0aGVyIHdlJ3JlIHNheWluZyB0aGUgc2FtZSB0aGluZyBv
ciBub3QsIGJ1dCBjYW4ndCB3ZSwKPj4gd2hlbiBwYXJhbWV0ZXIgJ2ZvbycsIHdoaWNoIGhhcyBi
ZWVuIHNldCB0byAnYmFyMScgYWxyZWFkeSwgaXMgYmVpbmcKPj4gc2V0IHRvICdiYXIyJywgc2Vh
cmNoIGRfY29uZmlnLmJfaW5mby5wYXJhbWV0ZXJzIGZvciB0aGUgc3Vic3RyaW5nCj4+IGNvbnRh
aW5pbmcgJ2Zvbz1iYXIxJywgcmVwbGFjZSBpdCB3aXRoICdmb289YmFyMicsIGFuZCBzYXZlIGRf
Y29uZmlnCj4+IGFnYWluPwo+IAo+IFRoaXMgY2FuIGRvLCB0b28uIEl0IGlzIHN0aWxsIHBhcnNp
bmcgc28gdGhlIGFtb3VudCBvZiB3b3JrIG5lZWRlZCBpcwo+IG1vcmUgb3IgbGVzcyB0aGUgc2Ft
ZSB0byBtZS4KCk5vLCB0aGlzIGlzbid0IGFsd2F5cyBjb3JyZWN0LiBUaGluayBvZiBjb25zb2xl
PXR0eTAgY29uc29sZT1odmMwIGluCnRoZSBsaW51eCBrZXJuZWwuIFlvdSBkb24ndCB3YW50IGh2
YzAgdG8gcmVwbGFjZSB0dHkwLCBidXQgdG8gaGF2ZQpib3RoLgoKCkp1ZXJnZW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
