From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 1/3] Make credit2 the default scheduler
Date: Wed, 7 Feb 2018 09:31:24 +0000
Message-ID: <110e25fe-a639-9d09-f382-8578c4d2efef@citrix.com>
References: <20180205113642.3174-1-george.dunlap@citrix.com>
 <edf342de-0dee-69c0-d239-75f928960bd4@citrix.com>
 <d9a9e4c9-1a78-ac26-0bda-cea8e842e05d@citrix.com>
 <1517849601.8082.10.camel@suse.com>
 <08e59400-8187-2c06-4145-3d7f3fd2bc65@suse.com>
 <64cddb91-57ca-45ae-2308-f4f844248d5e@citrix.com>
 <1517956794.4823.27.camel@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=o6on=fb=citrix.com=prvs=569089e40=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ejM4j-0005GG-GA
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2018 09:31:33 +0000
In-Reply-To: <1517956794.4823.27.camel@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDYvMjAxOCAxMDozOSBQTSwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gT24gVHVlLCAy
MDE4LTAyLTA2IGF0IDE3OjAyICswMDAwLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+PiBPbiAwMi8w
Ni8yMDE4IDA2OjE4IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4gT24gMDUvMDIvMTggMTc6
NTMsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+Pj4+Cj4+Pj4gQ29uc2lkZXJpbmcgd2UncmUgcmVs
ZWFzaW5nIGluIEp1bmUsIGJ1dCBmcmVlemluZyBpbiBNYXJjaCwgZG8gd2UKPj4+PiB0aGluawo+
Pj4+ICBpdCBpcyBzdGlsbCBlYXJseSBlbm91Z2g/Cj4+Cj4+PiBUaGUgNC4xMSByZWxlYXNlIGlz
IGNvbXBsZXRlbHkgZG9taW5hdGVkIGJ5IE1lbHRkb3duL1NwZWN0cmUKPj4+IG1pdGlnYXRpb24K
Pj4+IHdvcmsuIFNvIGVpdGhlciA0LjExIHdpbGwgYmUgYSBzZWN1cml0eSBmb2N1c2VkIHZlcnNp
b24gb3Igd2UgbmVlZAo+Pj4gdG8KPj4+IGV4dGVuZCB0aGUgZGV2ZWxvcG1lbnQgcGhhc2UuCj4+
Cj4+IFBlcnNvbmFsbHkgSSBjb3VsZCBnbyBlaXRoZXIgd2F5IG9uIHRoaXMuICBTbyB1bmxlc3Mg
c29tZW9uZSB3YW50cyB0bwo+PiBhcmd1ZSBmb3Igc3dpdGNoaW5nIG5vdyAob3Igd2Ugc2lnbmlm
aWNhbnRseSBleHRlbmQgdGhlIGRldmVsb3BtZW50Cj4+IHdpbmRvdyksIGxldCdzIHBsYW4gb24g
bGVhdmluZyB0aGlzIGZvciBwb3N0LTQuMTEuCj4+Cj4gWWVzLCBJIGFncmVlLgo+IAo+IEFuZCBp
ZiB3ZSBkb24ndCBzd2l0Y2ggbm93LCBJIHRoaW5rIHdlIHNob3VsZCBzYXkgdGhhdCwgdW5sZXNz
IHNvbWVvbmUKPiBhcmd1ZXMgYWdhaW5zdCB5b3VyIHJlYXNvbmluZyBpbiB5b3VyIG90aGVyIGVt
YWlsLCBhbmQgY29udmluY2UgdXMsCj4gd2UnbGwgc3dpdGNoIGFzIHNvb24gYXMgNC4xMiBpcyBi
cmFuY2hlZCAob3IgcGVyaGFwcyBhcyBzb29uIGFzIDQuMTEgaXMKPiByZWxlYXNlZD8pLgoKV2Vs
bCBJIGhhZCBwbGFubmVkIHRvIGRvIHRoYXQgZm9yIDQuMTEsIGJ1dCBzb21ldGhpbmcgY2FtZSB1
cC4gOi0pCkhvcGVmdWxseSBub3RoaW5nIHNpbWlsYXIgd2lsbCBjb21lIHVwIHRoaXMgdGltZS4u
LgoKIC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
