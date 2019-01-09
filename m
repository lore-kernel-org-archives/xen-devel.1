From: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v3 04/15] argo: init, destroy and soft-reset,
 with enable command line opt
Date: Wed, 9 Jan 2019 09:26:10 -0500
Message-ID: <CAKf6xptouC=bDD54mJY0Ddgm1V9aXQhp-ntTPVAERQ29s7wpRQ@mail.gmail.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-5-git-send-email-christopher.w.clark@gmail.com>
 <CAKf6xpvXBGUwFAjvwromG737Bg-_MB7rWBB=Oj7q2zHgaiF5mg@mail.gmail.com>
 <5C35C04B020000780020BB8D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2rAm=PR=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1ghEoL-0005C6-RI
 for xen-devel@lists.xenproject.org; Wed, 09 Jan 2019 14:26:25 +0000
Received: by mail-lj1-x243.google.com with SMTP id q2-v6so6625883lji.10
 for <xen-devel@lists.xenproject.org>; Wed, 09 Jan 2019 06:26:24 -0800 (PST)
In-Reply-To: <5C35C04B020000780020BB8D@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gOSwgMjAxOSBhdCA0OjM1IEFNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4KPiA+Pj4gT24gMDguMDEuMTkgYXQgMjM6NTQsIDxqYW5kcnl1a0BnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gRmlyc3Qgb2YgYWxsIC0gcGxlYXNlIHRyaW0geW91ciByZXBsaWVz
LgoKU29ycnkuICBXaWxsIGRvLgoKPiA+IE9uIE1vbiwgSmFuIDcsIDIwMTkgYXQgMjo0MyBBTSBD
aHJpc3RvcGhlciBDbGFyayA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+IHdyb3RlOgo+
ID4+IC0tLSBhL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYwo+ID4+ICsrKyBiL2Rv
Y3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYwo+ID4+IEBAIC0xODIsNiArMTgyLDE3IEBA
IFBlcm1pdCBYZW4gdG8gdXNlICJBbHdheXMgUnVubmluZyBBUElDIFRpbWVyIiBzdXBwb3J0IG9u
IGNvbXBhdGlibGUgaGFyZHdhcmUKPiA+PiAgaW4gY29tYmluYXRpb24gd2l0aCBjcHVpZGxlLiAg
VGhpcyBvcHRpb24gaXMgb25seSBleHBlY3RlZCB0byBiZSB1c2VmdWwgZm9yCj4gPj4gIGRldmVs
b3BlcnMgd2lzaGluZyBYZW4gdG8gZmFsbCBiYWNrIHRvIG9sZGVyIHRpbWluZyBtZXRob2RzIG9u
IG5ld2VyIGhhcmR3YXJlLgo+ID4+Cj4gPj4gKyMjIyBhcmdvCj4gPj4gKz4gYD0gPGJvb2xlYW4+
YAo+ID4+ICsKPiA+PiArPiBEZWZhdWx0OiBgZmFsc2VgCj4gPj4gKwo+ID4+ICtFbmFibGUgdGhl
IEFyZ28gaHlwZXJ2aXNvci1tZWRpYXRlZCBpbnRlcmRvbWFpbiBjb21tdW5pY2F0aW9uIG1lY2hh
bmlzbS4KPiA+PiArCj4gPj4gK1RoaXMgYWxsb3dzIGRvbWFpbnMgYWNjZXNzIHRvIHRoZSBBcmdv
IGh5cGVyY2FsbCwgd2hpY2ggc3VwcG9ydHMgcmVnaXN0cmF0aW9uCj4gPj4gK29mIG1lbW9yeSBy
aW5ncyB3aXRoIHRoZSBoeXBlcnZpc29yIHRvIHJlY2VpdmUgbWVzc2FnZXMsIHNlbmRpbmcgbWVz
c2FnZXMgdG8KPiA+PiArb3RoZXIgZG9tYWlucyBieSBoeXBlcmNhbGwgYW5kIHF1ZXJ5aW5nIHRo
ZSByaW5nIHN0YXR1cyBvZiBvdGhlciBkb21haW5zLgo+ID4+ICsKPiA+Cj4gPiBEbyB3ZSB3YW50
IHRvIHNheSBpdCdzIG9ubHkgYXZhaWxhYmxlIHdoZW4gWGVuIGlzIGNvbXBpbGVkIHdpdGggQ09O
RklHX0FSR08/Cj4KPiBXZSBkb24ndCBkbyBzbyBlbHNld2hlcmUsIHNvIEknbSB3aXRoIENocmlz
dG9waGVyLgoKT2theS4KCj4gPj4gKyAgICAgKi8KPiA+PiArICAgIHN0cnVjdCBhcmdvX3Jpbmdf
aW5mbyAqcmluZ19pbmZvOwo+ID4+ICsgICAgLyogZG9tYWluIHRvIGJlIG5vdGlmaWVkIHdoZW4g
c3BhY2UgaXMgYXZhaWxhYmxlICovCj4gPj4gKyAgICBkb21pZF90IGRvbWFpbl9pZDsKPiA+PiAr
ICAgIHVpbnQxNl90IHBhZDsKPiA+Cj4gPiBDYW4gd2Ugb3JkZXIgZG9tYWluX2lkIGFmdGVyIGxl
biBhbmQgZHJvcCB0aGUgcGFkPwo+Cj4gVGhhdCB3b3VsZCBzdGlsbCBjYWxsIGZvciBhIHBhZCBm
aWVsZCAtIHdlIHByZWZlciB0byBoYXZlIGV4cGxpY2l0IHBhZGRpbmcsCj4gYW5kIGFsc28gdG8g
Y2hlY2sgaXQncyB6ZXJvLCB0aGUgbGF0dGVyIHRvIGFsbG93IGZvciBhc3NpZ25pbmcgbWVhbmlu
ZyB0bwo+IHRoZSBmaWVsZCBkb3duIHRoZSByb2FkLgoKVGhpcyBzdHJ1Y3QgaXMgaW50ZXJuYWwg
dG8gWGVuIGFuZCBhcmdvLCBzbyBkbyB3ZSBzdGlsbCBuZWVkIGV4cGxpY2l0IHBhZGRpbmc/CgpU
aGVyZSBhcmUgb3RoZXIgcHVibGljIGFyZ28gc3RydWN0cyB3aXRoIHBhZGRpbmcgZmllbGRzLiAg
SSBoYXZlbid0CmdvdHRlbiB0aHJvdWdoIGFsbCB0aGUgcGF0Y2hlcywgYnV0IEkgdGhpbmsgYXQg
bGVhc3Qgc29tZSBvZiB0aG9zZSBhcmUKbWlzc2luZyB6ZXJvIGNoZWNrcy4KClJlZ2FyZHMsCkph
c29uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
