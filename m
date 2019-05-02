From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: linux 4.19 xenstore memory allocation failure Re:
 [linux-4.19 test] 135420: regressions - FAIL
Date: Thu, 2 May 2019 11:45:28 +0200
Message-ID: <20190502094528.m7ir4xkabvndppyn@Air-de-Roger>
References: <23752.18285.3998.815201@mariner.uk.xensource.com>
 <5CC85AF9020000780022A839@prv1-mh.provo.novell.com>
 <23752.23708.661076.214573@mariner.uk.xensource.com>
 <20190430155505.gqhdgxzt5ajdt65v@Air-de-Roger>
 <23753.27461.546649.855744@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vuKL=TC=citrix.com=prvs=018794465=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hM8Ha-00081C-0W
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 09:45:38 +0000
Content-Disposition: inline
In-Reply-To: <23753.27461.546649.855744@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXkgMDEsIDIwMTkgYXQgMTA6NDc6NDlBTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gUm9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIlJlOiBbWGVuLWRldmVsXSBsaW51eCA0LjE5
IHhlbnN0b3JlIG1lbW9yeSBhbGxvY2F0aW9uIGZhaWx1cmUgUmU6IFtsaW51eC00LjE5IHRlc3Rd
IDEzNTQyMDogcmVncmVzc2lvbnMgLSBGQUlMIik6Cj4gPiBPbiBUdWUsIEFwciAzMCwgMjAxOSBh
dCAwMzozMzowMFBNICswMTAwLCBJYW4gSmFja3NvbiB3cm90ZToKPiA+ID4gSSB3aWxsIGxlYXZl
IGFuc3dlcmluZyB0aGlzIHRvIHRoZSBibGtmcm9udC9saW51eCBmb2xrcy4uLgo+ID4gCj4gPiBJ
IHRoaW5rIHRob3NlIGFsbG9jYXRpb25zIHVzZWQgdG8gYmUgc21hbGwgZW5vdWdoIHRoYXQga2Nh
bGxvYyB3YXMKPiA+IGxpa2VseSBmaW5lLiBOb3cgd2l0aCBtdWx0aXBsZSByaW5ncywgYW5kIG11
bHRpcGxlIHBhZ2VzIHBlciByaW5nCj4gPiB0aG9zZSBoYXZlIGdyb3duIHRvIGEgcG9pbnQgd2hl
cmUga2NhbGxvYyBpcyBub3QgZmluZSBhbnltb3JlLiBJIHdpbGwKPiA+IHByZXBhcmUgYSBwYXRj
aCB0byBzd2l0Y2ggdG8ga3ZjYWxsb2MuCj4gCj4gVGhhbmtzLgo+IAo+IEZZSSB0aGlzIHNhbWUg
aXNzdWUgd2FzIHJlcG9ydGVkIGJ5IG9zc3Rlc3QgaW4KPiAgIFN1YmplY3Q6IFtsaW51eC1saW51
cyB0ZXN0XSAxMzU0MjY6IHJlZ3Jlc3Npb25zIC0gRkFJTAo+IGllIG9uIGxpbnV4IG1hc3Rlci4K
PiAKPiBJU1RNIHRoYXQgdGhpcyBwYXRjaCB5b3UgcHJvcG9zZSB3aWxsIGhhdmUgdG8gZ28gdG8g
c3RhYmxlIGJyYW5jaGVzCj4gdG9vID8KCkkgYWdyZWUuCgo+ID4gPiBJIHdvdWxkIGhhdmUgaG9w
ZWQgdGhhdCBpdCB3b3VsZCByZXN1bHQgaW4gc29tZXRoaW5nIG90aGVyIHRoYW4gYQo+ID4gPiBo
YW5nLiAgQXQgd29yc3QsIGJsa2Zyb250IG91Z2h0IHRvIGdvIGludG8gYSBzdGF0ZSB3aGVyZSBp
dCAqa25vd3MqCj4gPiA+IHRoYXQgaXQgaXMgdXR0ZXJseSBicm9rZW4gYW5kIHJlcG9ydHMgdGhp
cyBwcm9wZXJseS4KPiA+IAo+ID4gSSBoYXZlbid0IHlldCBjaGVja2VkIGFsbCB0aGUgcG9zc2li
bGUgZXJyb3IgcGF0aHMsIGJ1dCB0aGUgb25lcyBJJ3ZlCj4gPiBsb29rZWQgYXQgdXNlIHhlbmJ1
c19kZXZfZmF0YWwgd2hpY2ggc3dpdGNoZXMgdGhlIGRldmljZSBzdGF0ZSB0bwo+ID4gY2xvc2lu
ZyBhbmQgd3JpdGVzIHRoZSBlcnJvciBtZXNzYWdlIGludG8geGVuc3RvcmUuCj4gCj4gV2hhdCBp
ZiB5b3UgY2FuJ3Qgd3JpdGUgdG8geGVuc3RvcmUgPyAgQ2FuIHdlIGF0IGxlYXN0IGhhdmUgYSBj
b3B5IGluCj4gdGhlIGtlcm5lbCBsb2cgPyAgVGhlcmUgbWlnaHQgYmUgb3RoZXIgZXJyb3JzIGJl
c2lkZXMgdGhpcyBtZW1vcnkKPiBleGhhdXN0aW9uLCBzdXJlbHkuCgpUaGVyZSdzIGEgY2FsbCB0
byBkZXZfZXJyIGFsc28sIHdoaWNoIHNob3VsZCBwcmludCB0aGUgc2FtZSBlcnJvcgp0aGF0J3Mg
d3JpdHRlbiB0byB4ZW5zdG9yZSBvbiB0aGUgY29uc29sZS4gVGhhdCBob3dldmVyIHJlcXVpcmVz
IHRoZQptZW1vcnkgYWxsb2NhdGlvbiBvZiBwYWdlIGluIG9yZGVyIHRvIGZvcm1hdCB0aGUgc3Ry
aW5nIHRvIGJlIHByaW50ZWQKKHNlZSB4ZW5idXNfdmFfZGV2X2Vycm9yKS4KClJvZ2VyLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
