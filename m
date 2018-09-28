From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 2/2] xen: make opt_xen_console true before
 console initialisation
Date: Fri, 28 Sep 2018 16:16:55 +0100
Message-ID: <20180928151655.4xgl2dgnn7zayuzs@zion.uk.xensource.com>
References: <20180928082437.15140-1-wei.liu2@citrix.com>
 <20180928082437.15140-3-wei.liu2@citrix.com>
 <5BAE43F202000078001ECF13@prv1-mh.provo.novell.com>
 <20180928151207.kinkppv7klym6zoe@zion.uk.xensource.com>
 <e63442e2-9e89-b546-e968-e90eda791d06@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rttn=mk=citrix.com=prvs=802525662=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g5uWJ-0008S1-VU
 for xen-devel@lists.xenproject.org; Fri, 28 Sep 2018 15:17:31 +0000
Content-Disposition: inline
In-Reply-To: <e63442e2-9e89-b546-e968-e90eda791d06@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBTZXAgMjgsIDIwMTggYXQgMDQ6MTM6NTFQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyOC8wOS8xOCAxNjoxMiwgV2VpIExpdSB3cm90ZToKPiA+IE9uIEZyaSwgU2Vw
IDI4LCAyMDE4IGF0IDA5OjA4OjM0QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+Pj4+
IE9uIDI4LjA5LjE4IGF0IDEwOjI0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPj4+
IC0tLSBhL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jCj4gPj4+ICsrKyBiL3hlbi9kcml2ZXJz
L2NoYXIvY29uc29sZS5jCj4gPj4+IEBAIC05MSw3ICs5MSw4IEBAIHN0YXRpYyB1aW50MzJfdCBj
b25yaW5nYywgY29ucmluZ3A7Cj4gPj4+ICBzdGF0aWMgaW50IF9fcmVhZF9tb3N0bHkgc2VyY29u
X2hhbmRsZSA9IC0xOwo+ID4+PiAgCj4gPj4+ICAjaWZkZWYgQ09ORklHX1g4Ngo+ID4+PiAtc3Rh
dGljIGJvb2wgX19yZWFkX21vc3RseSBvcHRfY29uc29sZV94ZW47IC8qIGNvbnNvbGU9eGVuICov
Cj4gPj4+ICsvKiBTZXQgdG8gdHJ1ZSBhdCBzdGFydCBvZiBkYXkgdG8gY2F0Y2ggZWFybHkgYm9v
dCBpc3N1ZXMgKi8KPiA+Pj4gK3N0YXRpYyBib29sIF9fcmVhZF9tb3N0bHkgb3B0X2NvbnNvbGVf
eGVuID0gdHJ1ZTsgLyogY29uc29sZT14ZW4gKi8KPiA+PiBXaGVuIEFuZHJldyBzdWdnZXN0ZWQg
dGhpcywgaWlyYyBoZSBzYWlkIHRvIG1ha2UgdGhlIHZhcmlhYmxlCj4gPj4gdHJpc3RhdGUuIE90
aGVyd2lzZSAuLi4KPiA+IEkgZmlndXJlIGl0IGRvZXNuJ3QgbmVlZCB0byBiZSB0cmlzdGF0ZS4K
PiA+Cj4gPj4+IEBAIC04MjEsNiArODIyLDEwIEBAIHZvaWQgX19pbml0IGNvbnNvbGVfaW5pdF9w
cmVpcnEodm9pZCkKPiA+Pj4gIAo+ID4+PiAgICAgIHNlcmlhbF9pbml0X3ByZWlycSgpOwo+ID4+
PiAgCj4gPj4+ICsjaWZkZWYgQ09ORklHX1g4Ngo+ID4+PiArICAgIG9wdF9jb25zb2xlX3hlbiA9
IGZhbHNlOwo+ID4+PiArI2VuZGlmCj4gPj4gLi4uIHlvdSBwb3NzaWJseSBvdmVycmlkZSBhIHVz
ZXIgc3BlY2lmaWVkICJ0cnVlIiBoZXJlLgo+ID4gRG8gST8gVGhpcyBpcyByaWdodCBiZWZvcmUg
b3B0aW9uIHBhcnNpbmcsIGR1cmluZyB3aGljaCBvcHRfY29uc29sZV94ZW4KPiA+IGlzIHNldC4K
PiAKPiBUaGlzIGlzIGZpbmUgaW4gcHJpbmNpcGxlLCBidXQgeW91IGNhbid0IGluaXRpYWxpc2Ug
aXQgdG8gdHJ1ZSBhdAo+IGNvbXBpbGUgdGltZSwgb3IgbmF0aXZlIGJvb3RzIHdpbGwgdHJ5IHVz
aW5nIGh5cGVyY2FsbHMgLyBwb3J0IDB4ZTkuCj4gCj4gVGhlIGJlc3QgYmV0IGlzIHRvIHNldCBp
dCB0byB0cnVlIGluIHRoZSBQVkggZW50cnkgYXNtLgoKUmlnaHQuIEkgd2lsbCBzZXQgaXQgaW4g
dGhlIFBWSCBlbnRyeSBpbnN0ZWFkLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
