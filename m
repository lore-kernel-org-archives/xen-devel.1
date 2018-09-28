From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2 1/6] docs/qemu-deprivilege: Revise and
 update with status and future plans
Date: Fri, 28 Sep 2018 13:59:08 +0100
Message-ID: <20180928125908.GF2244@perard.uk.xensource.com>
References: <20180921170428.13771-1-george.dunlap@citrix.com>
 <20180925112001.GE2244@perard.uk.xensource.com>
 <CAFLBxZaoFcpAc+NKmDoN3f37EiPNXC41tTgNRQ-9bam04waryQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=5un+=mk=citrix.com=prvs=802f98ae4=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1g5sMn-0004Gc-PN
 for xen-devel@lists.xenproject.org; Fri, 28 Sep 2018 12:59:33 +0000
Content-Disposition: inline
In-Reply-To: <CAFLBxZaoFcpAc+NKmDoN3f37EiPNXC41tTgNRQ-9bam04waryQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <dunlapg@umich.edu>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Ross Lagerwall <ross.lagerwall@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBTZXAgMjgsIDIwMTggYXQgMTI6Mzc6MjJQTSArMDEwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBPbiBUdWUsIFNlcCAyNSwgMjAxOCBhdCAxMjoyMCBQTSBBbnRob255IFBFUkFSRAo+
IDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBGcmksIFNlcCAy
MSwgMjAxOCBhdCAwNjowNDoyM1BNICswMTAwLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+ID4gPiAr
IyMgTWlncmF0aW9uCj4gPiA+ICsKPiA+ID4gK1doZW4gY2FsbGluZyB4ZW4tc2F2ZS1kZXZpY2Vz
LXN0YXRlLCBzaW5jZSBRRU1VIGlzIHJ1bm5pbmcgaW4gYSBjaHJvb3QKPiA+ID4gK2l0IGlzIG5v
dCB1c2VmdWwgdG8gcGFzcyBhIGZpbGVuYW1lIChpdCBkb2Vzbid0IGV2ZW4gaGF2ZSB3cml0ZSBh
Y2Nlc3MKPiA+ID4gK2luc2lkZSB0aGUgY2hyb290KS4gSW5zdGVhZCwgZ2l2ZSBpdCBhbiBvcGVu
IGZkIHVzaW5nIHRoZSBhZGQtZmQKPiA+ID4gK21lY2hhbmlzbS4KPiA+Cj4gPiBUaGF0IGRlc2Ny
aWJlIGFuIGlzc3VlIG9ubHkgb24gc2F2ZS4gVGhlIHJlc3RvcmUgcGFydCBvZiBhIG1pZ3JhdGlv
bgo+ID4gYWxzbyBoYXZlIGFuIGlzc3VlOgo+ID4KPiA+IE9uIHJlc3RvcmUsIFFFTVUgc2lnbmFs
IHRvIGxpYnhsIHRoYXQgaXQgaXMgcmVhZHkgb25seSBhZnRlciBwcml2aWxlZGdlCj4gPiByZXN0
cmljdGlvbiBoYXZlIGJlZW4gcHV0IGluIHBsYWNlIChhbmQgYWZ0ZXIgb3Igd2hlbiBpdCByZWNl
aXZlIHRoZQo+ID4gbWlncmF0aW9uIGRhdGEpLiBCdXQgeGVuc3RvcmUgaXNuJ3QgYXZhaWxhYmxl
IGFueW1vcmUsIHNvIHJlc3RvcmUgZmFpbHMKPiA+IGZyb20gbGlieGwgcG9pbnQtb2Ytdmlldy4K
PiA+Cj4gPgo+ID4gT3IgbWF5YmUgeW91IGRlc2NyaWJlIGhlcmUgYW4gaXNzdWUgdGhhdCB3b3Vs
ZCBhcmlzZSB3aGVuIGFuIGh5cG90aGV0aWMKPiA+IGNocm9vdCBpcyBhcHBseS4gQnV0IHRoZSBt
aWdyYXRpb24gaXNzdWUgZGVzY3JpYmUgaGVyZSBzdGlsbCBhcHBseQo+ID4gd2l0aG91dCBjaHJv
b3QgYW5kIHdpdGggb25seSAtcnVuYXMsIHRoZSBwYXRoIGxpYnhsIGdpdmUgdG8gUUVNVSBpcwo+
ID4gYWNjZXNzaWJsZSBieSByb290IG9ubHkuCj4gCj4gRG8gb3VyIG90aGVyIHJlc3RyaWN0aW9u
cyAtLSBjaHJvb3QsIGRlcHJpdmlsZWdlLCAmYyAtLSBhbGwgd29yayBvbgo+IHJlc3RvcmUgYXQg
dGhlIG1vbWVudD8KCmNocm9vdCBpc24ndCBhbiBpc3N1ZSBmb3IgcmVzdG9yZS4gQnV0IHJ1bm5p
bmcgUUVNVSBhcyBub24tcm9vdCB1c2VyIGlzCmN1cnJlbnRseSBhbiBpc3N1ZSBmb3IgcmVzdG9y
ZS4KCkkgdGhpbmsgdGhlIG9ubHkgaXNzdWUgd2l0aCByZXN0b3JlIHRoYXQgZG9lc24ndCBhbHNv
IGV4aXN0IHdoZW4KY3JlYXRpbmcgYSBndWVzdCBpcyByZXN0cmljdGVkIGFjY2VzcyB0byB4ZW5z
dG9yZS4KCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
