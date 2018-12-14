From: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-3.1] hw/xen/xen_pt_graphics: Don't trust
 the BIOS ROM contents so much
Date: Fri, 14 Dec 2018 11:50:16 +0000
Message-ID: <CAFEAcA8Z+g8HQq=HeY=2YbY1ToPyNpL8FO2mvfACS=sK-SBGfg@mail.gmail.com>
References: <20181119162658.30358-1-peter.maydell@linaro.org>
 <20181126150307.GM2448@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bmA8=OX=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1gXlzA-0000pw-O1
 for xen-devel@lists.xenproject.org; Fri, 14 Dec 2018 11:50:28 +0000
Received: by mail-ot1-x342.google.com with SMTP id s5so5102562oth.7
 for <xen-devel@lists.xenproject.org>; Fri, 14 Dec 2018 03:50:27 -0800 (PST)
In-Reply-To: <20181126150307.GM2448@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, QEMU Developers <qemu-devel@nongnu.org>, "patches@linaro.org" <patches@linaro.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAyNiBOb3YgMjAxOCBhdCAxNTowMywgQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVy
YXJkQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBOb3YgMTksIDIwMTggYXQgMDQ6MjY6
NThQTSArMDAwMCwgUGV0ZXIgTWF5ZGVsbCB3cm90ZToKPiA+IENvdmVyaXR5IChDSUQgNzk2NTk5
KSBwb2ludHMgb3V0IHRoYXQgeGVuX3B0X3NldHVwX3ZnYSgpIHRydXN0cwo+ID4gdGhlIHJvbS0+
c2l6ZSBmaWVsZCBpbiB0aGUgQklPUyBST00gZnJvbSBhIFBDSSBwYXNzdGhyb3VnaCBWR0EKPiA+
IGRldmljZSwgYW5kIHVzZXMgaXQgYXMgYW4gaW5kZXggaW50byB0aGUgbWVtb3J5IHdoaWNoIGNv
bnRhaW5zCj4gPiB0aGUgQklPUyBpbWFnZS4gQSBjb3JydXB0IEJJT1MgUk9NIGNvdWxkIHRoZXJl
Zm9yZSBjYXVzZSB1cyB0bwo+ID4gaW5kZXggb2ZmIHRoZSBlbmQgb2YgdGhlIGJ1ZmZlci4KPiA+
Cj4gPiBDaGVjayB0aGF0IHRoZSBzaXplIGlzIHdpdGhpbiBib3VuZHMgYmVmb3JlIHdlIHVzZSBp
dC4KPiA+Cj4gPiBXZSBhcmUgYWxzbyB0cnVzdGluZyB0aGUgcGNpb2Zmc2V0IGZpZWxkLCBhbmQg
YXNzdW1pbmcgdGhhdAo+ID4gdGhlIHdob2xlIHJvbV9oZWFkZXIgaXMgcHJlc2VudDsgQ292ZXJp
dHkgZG9lc24ndCBub3RpY2UgdGhlc2UsCj4gPiBidXQgY2hlY2sgdGhlbSB0b28uCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPgo+
ID4gLS0tCj4gPiBEaXNjbGFpbWVyOiBjb21waWxlIHRlc3RlZCBvbmx5LCBhcyBJIGRvbid0IGhh
dmUgYSBYZW4gc2V0dXAsCj4gPiBsZXQgYWxvbmUgb25lIHdpdGggcGFzcy10aHJvdWdoIFBDSSBn
cmFwaGljcy4KPiA+Cj4gPiBOb3RlIHRoYXQgaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcveHNhL2Fk
dmlzb3J5LTEyNC5odG1sCj4gPiBkZWZpbmVzIHRoYXQgYnVncyB3aGljaCBhcmUgb25seSBleHBs
b2l0YWJsZSBieSBhIG1hbGljaW91cwo+ID4gcGllY2Ugb2YgaGFyZHdhcmUgdGhhdCBpcyBwYXNz
ZWQgdGhyb3VnaCB0byB0aGUgZ3Vlc3QgYXJlCj4gPiBub3Qgc2VjdXJpdHkgdnVsbmVyYWJpbGl0
aWVzIGFzIGZhciBhcyB0aGUgWGVuIFByb2plY3QgaXMKPiA+IGNvbmNlcm5lZCwgYW5kIGFyZSB0
cmVhdGVkIGxpa2Ugbm9ybWFsIG5vbi1zZWN1cml0eS1yZWxhdGVkIGJ1Z3MuCj4gPiBTbyB0aGlz
IGlzIGp1c3QgYSBidWdmaXgsIG5vdCBhIHNlY3VyaXR5IGlzc3VlLgo+ID4KPiA+IE1hcmtlZCAi
Zm9yLTMuMSIgYmVjYXVzZSBpdCB3b3VsZCBsZXQgdXMgc3F1YXNoIGFub3RoZXIgQ292ZXJpdHkK
PiA+IGlzc3VlLCBhbmQgaXQgaXMgYSBidWcgZml4OyBvbiB0aGUgb3RoZXIgaGFuZCBpdCdzIGFu
IG9ic2N1cmUKPiA+IGNvcm5lciBjYXNlIGFuZCBoYXMgYmVlbiB0aGlzIHdheSBzaW5jZSBmb3Jl
dmVyLgo+Cj4gSSBoYXZlbid0IHRlc3RlZCB0aGF0IHBhdGNoIGVpdGhlciwgYnV0IHRoZSBjaGFu
Z2VzIGxvb2tzIGZpbmUsIHNvOgo+Cj4gQWNrZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255
LnBlcmFyZEBjaXRyaXguY29tPgoKUGluZyEgV291bGQgdGhlIFhlbiBmb2xrcyBsaWtlIHRvIHRl
c3QgdGhpcyBhbmQvb3Igc2VuZCBpdCBpbgp2aWEgYSB4ZW4gcHVsbHJlcSBub3cgdGhhdCA0LjAg
aGFzIHJlb3BlbmVkIGZvciBkZXZlbG9wbWVudD8KCkFsdGVybmF0aXZlbHkgSSBjYW4gcHV0IGl0
IGluIHZpYSBhIHB1bGxyZXEgSSdtIGN1cnJlbnRseQpkb2luZyBpbiBpdHMgY3VycmVudCAibm90
IHRlc3RlZCBidXQgbG9va3MgZmluZSIgc3RhdGUgOi0pCgp0aGFua3MKLS0gUE1NCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
