From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 00/12] add per-domain and per-cpupool
 generic parameters
Date: Wed, 3 Oct 2018 12:00:35 +0100
Message-ID: <20181003110035.pcz7oyb66wc4cmfo@zion.uk.xensource.com>
References: <7cb2a460-095c-27c8-a4cf-47ef8e7?==?UTF-8?Q?850d5@suse.com>
 <5BA0DF9602000078001=3d=3fUTF-8=3fQ=3fE9448@suse.?==?UTF-8?Q?com>
 <6d56ad90-7825-adb7-f4e5-6c3ceb3210f6@suse.com>
 <001ab73a-07?==?UTF-8?Q?8d-4ec1-4acd-2fb4389e8867@citrix.com>
 <20180919172818.3aksiju4s3i?==?UTF-8?Q?pw42p@zion.uk.xens=3d=3fUTF-8=3fQ=3fource.com>
 <fffd7e59-e437-8ed?==?UTF-8?Q?9-b228-b537fde050cd@suse.com>
 <20180920160629.jullgb435zi7bcbr@zi?==?UTF-8?Q?on.uk.xensource.com>
 <eba521d2-f6c5-5096-82c2-af5983ed2372@suse.com>
 <20180921085240.dqzt5pomtnfjs665@zion.uk.xensource.com>
 <8982a437b41f90128a21456de6bb7182b24fae22.camel@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nzpo=mp=citrix.com=prvs=80755c3b3=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g7etX-0004c0-9v
 for xen-devel@lists.xenproject.org; Wed, 03 Oct 2018 11:00:43 +0000
Content-Disposition: inline
In-Reply-To: <8982a437b41f90128a21456de6bb7182b24fae22.camel@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBTZXAgMjYsIDIwMTggYXQgMDc6MzA6MzhQTSArMDIwMCwgRGFyaW8gRmFnZ2lvbGkg
d3JvdGU6Cj4gT24gRnJpLCAyMDE4LTA5LTIxIGF0IDA5OjUyICswMTAwLCBXZWkgTGl1IHdyb3Rl
Ogo+ID4gT24gRnJpLCBTZXAgMjEsIDIwMTggYXQgMDc6MjM6MjNBTSArMDIwMCwgSnVlcmdlbiBH
cm9zcyB3cm90ZToKPiA+ID4gT24gMjAvMDkvMTggMTg6MDYsIFdlaSBMaXUgd3JvdGU6Cj4gPiA+
ID4gCj4gPiA+ID4gSXQgYXBwZWFycyB0aGF0IHRoZSBpbXBsZW1lbnRhdGlvbiBpbiBwYXRjaCAx
MCBjb25jYXRlbmF0ZXMgdGhlCj4gPiA+ID4gbmV3Cj4gPiA+ID4gc2V0dGluZ3MgdG8gdGhlIG9s
ZCBvbmVzLiBJdCBpcyBub3QgdmVyeSBuaWNlIGltby4KPiA+ID4gPiAKPiA+ID4gPiBJZiBmb3Ig
dGhlIGxpZmUgdGltZSBvZiB0aGUgZG9tYWluIHlvdSBzZXQgWCB0aW1lcyB0aGUgc2FtZQo+ID4g
PiA+IHBhcmFtZXRlcgo+ID4gPiA+IHlvdSBnZXQgYSBzdHJpbmcgb2YgZm9vPWJhcjEgZm9vPWJh
cjIgaW4gdGhlIHNhdmVkIGNvbmZpZyBmaWxlLgo+ID4gPiA+IAo+ID4gPiA+IFRoZXJlIGlzIHBy
b2JhYmx5IGEgc2ltcGxlIHNvbHV0aW9uOiBtYWtlIHRoZSBwYXJhbWV0ZXIgbGlzdCBpbgo+ID4g
PiA+IElETCBhCj4gPiA+ID4ga2V5IHZhbHVlIGxpc3QuIFlvdSB0aGVuIHVwZGF0ZSB0aGUgbGlz
dCBhY2NvcmRpbmdseS4KPiA+ID4gCj4gPiA+IFRoZSBwcm9ibGVtIHdpdGggdGhhdCBhcHByb2Fj
aCBhcmUgcGFyYW1ldGVycyB3aXRoIHN1Yi1wYXJhbWV0ZXJzOgo+ID4gPiAKPiA+ID4gcGFyPXN1
YjE9bm8sc3ViMj15ZXMKPiA+ID4gcGFyPXN1YjI9eWVzCj4gPiAKPiA+IFRoZXJlIGlzIGFub3Ro
ZXIgd2F5IHRvIHNvbHZlIHRoaXM6IGZ1cnRoZXIgcGFyc2UgdGhlIHN1Yi1wYXJhbWV0ZXJzLgo+
ID4gVGhpcyBkb2Vzbid0IHJlcXVpcmUgYW55IHBhcmFtZXRlciBzcGVjaWZpYyBrbm93bGVkZ2Ug
YW5kIHRoZXJlIGFyZQo+ID4gYWxyZWFkeSBmdW5jdGlvbnMgdG8gc3BsaXQgc3RyaW5ncy4KPiA+
IAo+IEknbSBub3Qgc3VyZSB3aGV0aGVyIHdlJ3JlIHNheWluZyB0aGUgc2FtZSB0aGluZyBvciBu
b3QsIGJ1dCBjYW4ndCB3ZSwKPiB3aGVuIHBhcmFtZXRlciAnZm9vJywgd2hpY2ggaGFzIGJlZW4g
c2V0IHRvICdiYXIxJyBhbHJlYWR5LCBpcyBiZWluZwo+IHNldCB0byAnYmFyMicsIHNlYXJjaCBk
X2NvbmZpZy5iX2luZm8ucGFyYW1ldGVycyBmb3IgdGhlIHN1YnN0cmluZwo+IGNvbnRhaW5pbmcg
J2Zvbz1iYXIxJywgcmVwbGFjZSBpdCB3aXRoICdmb289YmFyMicsIGFuZCBzYXZlIGRfY29uZmln
Cj4gYWdhaW4/CgpUaGlzIGNhbiBkbywgdG9vLiBJdCBpcyBzdGlsbCBwYXJzaW5nIHNvIHRoZSBh
bW91bnQgb2Ygd29yayBuZWVkZWQgaXMKbW9yZSBvciBsZXNzIHRoZSBzYW1lIHRvIG1lLgoKV2Vp
LgoKPiAKPiBSZWdhcmRzLAo+IERhcmlvCj4gLS0gCj4gPDxUaGlzIGhhcHBlbnMgYmVjYXVzZSBJ
IGNob29zZSBpdCB0byBoYXBwZW4hPj4gKFJhaXN0bGluIE1hamVyZSkKPiAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IERh
cmlvIEZhZ2dpb2xpLCBQaC5ELCBodHRwOi8vYWJvdXQubWUvZGFyaW8uZmFnZ2lvbGkKPiBTb2Z0
d2FyZSBFbmdpbmVlciBAIFNVU0UgaHR0cHM6Ly93d3cuc3VzZS5jb20vCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
