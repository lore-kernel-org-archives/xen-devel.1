From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: Dom0 kernel 4.14 with SMP randomly crashing
Date: Mon, 5 Nov 2018 11:58:50 +0000
Message-ID: <20181105115850.f677uvjmm7vqfikc@zion.uk.xensource.com>
References: <CAO9XypUsz-e3vmX-n5eSMz7rG2aZpDG1h03CMRAAT2X=TpZNNw@mail.gmail.com>
 <20181105101938.mj2c6l4nx5sbsk2n@zion.uk.xensource.com>
 <CAO9XypWZ=Qr4Bo9Km_MUeod3cCHOnA=SonXXRF95zeeu0+RNHQ@mail.gmail.com>
 <20181105105852.ae4sjkkcm6eumpwr@zion.uk.xensource.com>
 <CAO9XypUXJkhGEiH14HuMW8zOha9mRQh0+kpMa_0b2doHhjJUCQ@mail.gmail.com>
 <20181105114127.s57z7n7p4pmix5b5@zion.uk.xensource.com>
 <CAO9XypV42TO8c=26dRJSNnFukXDfWp_0rM3McRBKZs1crT1qEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <CAO9XypV42TO8c=26dRJSNnFukXDfWp_0rM3McRBKZs1crT1qEA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Rishi <2rushikeshj@gmail.com>
Cc: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBOb3YgMDUsIDIwMTggYXQgMDU6MTg6NDNQTSArMDUzMCwgUmlzaGkgd3JvdGU6Cj4g
WWVzLCBJJ20gcnVubmluZyBpdCBpbiBhIEhWTSBkb21VIGZvciBkZXZlbG9wbWVudCBwdXJwb3Nl
LgoKV2hhdCBpcyB5b3VyIGV4YWN0IHNldHVwPwoKV2VpLgoKPiAKPiBPbiBNb24sIE5vdiA1LCAy
MDE4IGF0IDU6MTEgUE0gV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4gCj4g
PiBPbiBNb24sIE5vdiAwNSwgMjAxOCBhdCAwNDo1ODozNVBNICswNTMwLCBSaXNoaSB3cm90ZToK
PiA+ID4gQWxyaWdodCwgSSBnb3QgdGhlIHNlcmlhbCBjb25zb2xlIGFuZCBmb2xsb3dpbmcgaXMg
dGhlIGNyYXNoIGxvZy4gVGhhbmsKPiA+IHlvdQo+ID4gPiBmb3IgcG9pbnRpbmcgdGhhdCBvdXQu
Cj4gPiA+Cj4gPiA+IFsgIDEzMy41OTQ4NTJdIHdhdGNoZG9nOiBCVUc6IHNvZnQgbG9ja3VwIC0g
Q1BVIzIgc3R1Y2sgZm9yIDIycyEKPiA+ID4gW2tzb2Z0aXJxZC8yOjIyXQo+ID4gPgo+ID4gPiBb
ICAxMzMuNTk5MjMyXSBLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2luZzogc29mdGxvY2t1cDogaHVu
ZyB0YXNrcwo+ID4gPgo+ID4gPiBbICAxMzMuNjAyMjc1XSBDUFU6IDIgUElEOiAyMiBDb21tOiBr
c29mdGlycWQvMiBUYWludGVkOiBHCj4gPiA+IEwgICAgNC4xOS4xCj4gPiA+ICMxCj4gPiA+Cj4g
PiA+IFsgIDEzMy42MDY2MjBdIEhhcmR3YXJlIG5hbWU6IFhlbiBIVk0gZG9tVSwgQklPUyA0LjQu
MS14czEzMjI1Nwo+ID4gMTIvMTIvMjAxNgo+ID4KPiA+IElzIHRoaXMgc2VyaWFsIGxvZyBmcm9t
IHRoZSBob3N0PyBJdCBzYXlzIGl0IGlzIHJ1bm5pbmcgYXMgYSBIVk0gRG9tVS4KPiA+IE1heWJl
IHlvdSBoYXZlIG1pc3Rha2VuIGd1ZXN0IHNlcmlhbCBsb2cgd2l0aCBob3N0IHNlcmlhbCBsb2c/
Cj4gPgo+ID4gVGhpcyBpbmRpY2F0ZXMgeW91ciBtYWNoaW5lIHJ1bnMgWGVuU2VydmVyLCB3aGlj
aCBoYXMgaXRzIG93biBwYXRjaAo+ID4gcXVldWVzIG9uIHRvcCBvZiB1cHN0cmVhbSBYZW4uIFlv
dSBtYXkgYWxzbyB3YW50IHRvIHJlcG9ydCB0byB4cy1kZXZlbAo+ID4gbWFpbGluZyBsaXN0Lgo+
ID4KPiA+IFdlaS4KPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
