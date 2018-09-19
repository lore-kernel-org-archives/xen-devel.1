From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v9 5/7] memory: add
 check_get_page_from_gfn() as a wrapper...
Date: Wed, 19 Sep 2018 17:13:26 +0100
Message-ID: <20180919161326.bf57i2ev7zqnidlo@zion.uk.xensource.com>
References: <20180913152128.6114-6-paul.durrant@citrix.com>
 <5BA0FAB702000078001E9779@prv1-mh.provo.novell.com>
 <71ebe85f6fe94f989db6618eabf22c1e@AMSPEX02CL03.citrite.net>
 <5BA110EF02000078001E9802@prv1-mh.provo.novell.com>
 <ef6cbe5d4b994f7fbf61eb634c040dd4@AMSPEX02CL03.citrite.net>
 <5BA1E69F02000078001E99DF@prv1-mh.provo.novell.com>
 <f6f35c7b1ccf4abbaf0352f99b89e4fe@AMSPEX02CL03.citrite.net>
 <a6b4262af22f4c04a223d790a8992921@AMSPEX02CL03.citrite.net>
 <5BA2097302000078001E9C22@prv1-mh.provo.novell.com>
 <20180919085934.w63rfnzind2ypud5@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wwm0=mb=citrix.com=prvs=79313d28f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g2f6b-0004Pt-St
 for xen-devel@lists.xenproject.org; Wed, 19 Sep 2018 16:13:33 +0000
Content-Disposition: inline
In-Reply-To: <20180919085934.w63rfnzind2ypud5@mac.bytemobile.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>, IanJackson <Ian.Jackson@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBTZXAgMTksIDIwMTggYXQgMTA6NTk6MzRBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBXZWQsIFNlcCAxOSwgMjAxOCBhdCAwMjozMTo0N0FNIC0wNjAwLCBKYW4g
QmV1bGljaCB3cm90ZToKPiA+ID4+PiBPbiAxOS4wOS4xOCBhdCAxMDowMSwgPFBhdWwuRHVycmFu
dEBjaXRyaXguY29tPiB3cm90ZToKPiA+ID4+IEZyb206IFhlbi1kZXZlbCBbbWFpbHRvOnhlbi1k
ZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnXSBPbiBCZWhhbGYKPiA+ID4+IE9mIFBh
dWwgRHVycmFudAo+ID4gPj4gU2VudDogMTkgU2VwdGVtYmVyIDIwMTggMDg6NTYKPiA+ID4+IAo+
ID4gPj4gPiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+ID4g
Pj4gPiBTZW50OiAxOSBTZXB0ZW1iZXIgMjAxOCAwNzowMwo+ID4gPj4gPgo+ID4gPj4gPiA+Pj4g
T24gMTguMDkuMTggYXQgMTg6MzcsIDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
PiA+PiA+ID4gTW92aW5nIHRvIHAybS1jb21tb24gd29uJ3Qgd29yay4gVGhlIGZ1bmN0aW9uIGRl
Y2xhcmF0aW9uIGludm9sdmVzIGEKPiA+ID4+ID4gPiBwMm1fdHlwZV90IGFyZ3VtZW50IGFuZCB0
aGF0IGVudW0gaXMgZGVmaW5lZCBpbiB0aGUgYXJtIGFuZCB4ODYKPiA+ID4+IHNwZWNpZmljCj4g
PiA+PiA+ID4gaGVhZGVycy4gSSBwcm9wb3NlIHRoZXJlZm9yZSB0byBsZWF2ZSB0aGlzIHBhdGNo
IGFzLWlzLgo+ID4gPj4gPgo+ID4gPj4gPiBMZWF2aW5nIHRoZSBkdXBsaWNhdGlvbiBpbiBwbGFj
ZSBpcyBqdXN0IHRoZSBsYXN0IHJlc29ydCBpbW8uIERvZXMKPiA+ID4+ID4geGVuL21tLmgKPiA+
ID4+ID4gbm90IHdvcmsgZWl0aGVyPwo+ID4gPj4gCj4gPiA+PiBObywgaXQgd29uJ3QuIEl0IGhh
cyB0byBiZSBzb21ldGhpbmcgKmFmdGVyKiB0aGUgZGVmaW5pdGlvbiBvZiB0aGUKPiA+ID4+IHAy
bV90eXBlX3QgZW51bS4gSSBjb3VsZCwgYXMgSnVsaWVuIHN1Z2dlc3RlZCwgbW92ZSB0aGUgaW5j
bHVzaW9uIG9mIHAybS0KPiA+ID4+IGNvbW1vbiBhZnRlciB0aGF0IHBvaW50LCBidXQgaXQgd291
bGQgbWVhbiB0aGUgaGVhZGVyIGd1YXJkcyB3b3VsZCBjZWFzZQo+ID4gPj4gdG8gRFRSVCBvZiBj
b3Vyc2UuIEknbSBub3Qgc3VyZSB3aGV0aGVyIEMgd2lsbCBhbGxvdyBtZSB0byBmb3J3YXJkIGRl
Y2xhcmUKPiA+ID4+IHRoZSBlbnVtIChub3Qgc29tZXRoaW5nIEkndmUgdHJpZWQpIGJ1dCBJIGNv
dWxkIGdpdmUgdGhhdCBhIGdvLiBBbnkgb3RoZXIKPiA+ID4+IHN1Z2dlc3Rpb25zPwo+ID4gPj4g
Cj4gPiA+IAo+ID4gPiBGb3J3YXJkIGRlY2xhcmF0aW9uIG9mIHRoZSBlbnVtIGRvZXMgaW5kZWVk
IGFwcGVhciB0byB3b3JrLCBzbyBJJ2xsIGdvIHdpdGggCj4gPiA+IHRoYXQuCj4gPiAKPiA+IFRo
YXQncyBhbiBleHRlbnNpb24gSSdtIG5vdCBldmVuIHN1cmUgYWxsIGdjYyB2ZXJzaW9ucyBzdXBw
b3J0IChJJ3ZlIGNoZWNrZWQKPiA+IDQuMyBqdXN0IG5vdywgd2hlcmUgaXQgd29ya3MpLiBSb2dl
ciwgYW55IGNoYW5jZSB5b3Uga25vdyB3aGV0aGVyIGNsYW5nCj4gPiBzdXBwb3J0cyB0aGlzPwo+
IAo+IEkndmUganVzdCB0ZXN0ZWQgdGhlIGZvbGxvd2luZyB3aXRoIGNsYW5nIDYgKHdoaWNoIGlz
IHRoZSB2ZXJzaW9uIHVzZWQKPiBieSBvc3N0ZXN0KToKPiAKPiBlbnVtIGZvbzsKPiBlbnVtIGZv
byB7IGEsIGIsIGMgfTsKPiAKPiBBbmQgaXQgd29ya3MgZmluZS4gSSB0aGluayB0cmF2aXMgb3Ig
Z2l0bGFiIHRlc3RlZCBvbGRlciB2ZXJzaW9ucyBvZgo+IGNsYW5nICh0aGUgb25lcyBvbiB0aGUg
TGludXggZGlzdHJvcykuCgpUaGV5IGhhdmUgY2xhbmcgMy40IElJUkMuCgpQLlMuIHlvdSBjYW4g
ZWFzaWx5IGdldCB0aGUgc2FtZSBlbnZpcm9ubWVudCBsb2NhbGx5IGJ5IHVzaW5nIHRoZQppbi10
cmVlIGNvbnRhaW5lcml6YXRpb24gc2NyaXB0LgoKV2VpLgoKPiAKPiBUaGFua3MsIFJvZ2VyLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
