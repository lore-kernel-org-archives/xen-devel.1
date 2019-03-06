From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH for-next RFC 1/4] build/m4: make
 python_devel.m4 work with both python 2 and 3
Date: Wed, 6 Mar 2019 15:35:53 +0000
Message-ID: <20190306153553.GE2300@perard.uk.xensource.com>
References: <20190305164206.6793-1-wei.liu2@citrix.com>
 <20190305164206.6793-2-wei.liu2@citrix.com>
 <20190306150716.GD2300@perard.uk.xensource.com>
 <20190306152443.maczxijl6vnozg23@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EjjD=RJ=citrix.com=prvs=9614ae01b=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1h1YaO-0006DV-0R
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2019 15:36:00 +0000
Content-Disposition: inline
In-Reply-To: <20190306152443.maczxijl6vnozg23@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org, Ian Jackson <Ian.Jackson@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMDYsIDIwMTkgYXQgMDM6MjQ6NDNQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBXZWQsIE1hciAwNiwgMjAxOSBhdCAwMzowNzoxNlBNICswMDAwLCBBbnRob255IFBFUkFS
RCB3cm90ZToKPiA+ID4gLUFDX0NIRUNLX0xJQihweXRob24kYWNfcHl0aG9uX3ZlcnNpb24sIFB5
QXJnX1BhcnNlVHVwbGUsIFtdLAo+ID4gPiAtICAgIFtBQ19NU0dfRVJST1IoW1VuYWJsZSB0byBm
aW5kIGEgc3VpdGFibGUgcHl0aG9uIGRldmVsb3BtZW50IGxpYnJhcnldKV0sCj4gPiA+IC0gICAg
WyRQWVRIT05fTElCU10pCj4gPiA+ICtBQ19DSEVDS19MSUIocHl0aG9uJGFjX3B5dGhvbl92ZXJz
aW9uJGFjX3B5dGhvbl9hYmlmbGFncywgUHlBcmdfUGFyc2VUdXBsZSwgW10sCj4gPiA+ICsgICAg
W0FDX01TR19FUlJPUihbVW5hYmxlIHRvIGZpbmQgYSBzdWl0YWJsZSBweXRob24gZGV2ZWxvcG1l
bnQgbGlicmFyeV0pXSkKPiA+IAo+ID4gU28sIEFDX0NIRUNLX0xJQiBzZWVtcyB0byBvbmx5IGJl
IHVzZWQgdG8gY2hlY2sgaWYgUHlBcmdfUGFyc2VUdXBsZQo+ID4gZXhpc3QsIGFuZCByZXF1aXJl
cyBhcyBhcmd1bWVudCB0aGUgbmFtZSBvZiB0aGUgbGliIHdoaWNoIGlzIG5vdwo+ID4gY29tcGxp
Y2F0ZWQuCj4gPiAKPiA+IEJ1dCwgQUNfQ0hFQ0tfTElCIGRvIHRlc3QgY29tcGlsYXRpb24gdXNp
bmcgdGhlIExERkxBR1Mgd2hpY2ggYWxyZWFkeQo+ID4gY29udGFpbiB0aGUgcHl0aG9uIGxpYiB3
ZSB3YW50LCBzbyBpbnN0ZWFkLCB3ZSBjb3VsZCBvbmx5IGRvIHRoZSBwYXJ0IG9mCj4gPiB0aGUg
am9icyB0aGF0IHdlIG5lZWQ6Cj4gPiAKPiA+IEFDX0xJTktfSUZFTFNFKFtBQ19MQU5HX0NBTEwo
W10sIFtQeUFyZ19QYXJzZVR1cGxlXSldLCBbXSwKPiA+ICAgICBbQUNfTVNHX0VSUk9SKFtVbmFi
bGUgdG8gZmluZCBhIHN1aXRhYmxlIHB5dGhvbiBkZXZlbG9wbWVudCBsaWJyYXJ5XSldKQo+ID4g
Cj4gPiBUaGF0IGdlbmVyYXRlIGEgbWFpbi5jIHdpdGggUHlBcmdfUGFyc2VUdXBsZSgpIGNhbGwg
bGlrZSBBQ19DSEVDS19MSUIKPiA+IGRvLCBhbmQgZG8gYnVpbGQvbGluay4gSWYgdGhhdCBmYWls
cywgdGhyb3cgYW4gZXJyb3IuCj4gPiAKPiA+IFRoYXQgYXZvaWQgdG8gdXNlIHRoZSAtLWFiaWZs
YWdzLCB3aGljaCB3ZSBkb24ndCBuZWVkLgo+ID4gCj4gPiBXaGF0IGRvIHlvdSB0aGluZz8KPiAK
PiBEZWZpbml0ZWx5IGxvb2tzIGJldHRlci4gTGV0IG1lIHRyeSB0aGlzLgoKQWN0dWFsbHksIEkg
dGhpbmsgSSBqdXN0IGZvdW5kIGJldHRlciwgc2FtZSB0aGluZ3MgYnV0IHVzaW5nIGEgbWFjcm8K
dGhhdCBhbHJlYWR5IGRvIHdoYXQgd2Ugd2FudDoKCkFDX0NIRUNLX0ZVTkMoW1B5QXJnX1BhcnNl
VHVwbGVdLCBbXSwKICAgIFtBQ19NU0dfRVJST1IoW1VuYWJsZSB0byBmaW5kIGEgc3VpdGFibGUg
cHl0aG9uIGRldmVsb3BtZW50IGxpYnJhcnldKV0pCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
