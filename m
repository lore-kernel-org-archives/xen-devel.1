From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Subject: Re: [PATCH V3 2/2] Xen/PCIback: Implement PCI
 flr/slot/bus reset with 'reset' SysFS attribute
Date: Wed, 3 Oct 2018 18:51:04 +0300
Message-ID: <20181003155104.GH5318__1450.35940590805$1538581816$gmane$org@reaktio.net>
References: <8a3bc517-1255-4547-d244-5c400e44cc77@Oracle.COM>
 <f19dbb09-ef22-2cf4-fb38-2a7c42b5dc48@Oracle.COM>
 <5A377E020200007800197FFA@prv-mh.provo.novell.com>
 <559ffd12-b541-8a69-60bd-fbe10e3dc159@oracle.com>
 <20180916114306.GF18222@reaktio.net>
 <a726840b-8a5c-0890-73c6-3a95a7205153@oracle.com>
 <20180918071519.GG18222@reaktio.net>
 <5E7DDB68-4E68-48A5-AEEC-EE1B21A50E9E@citrix.com>
 <352310b3-ec9b-2ceb-83f0-4550718120c3@oracle.com>
 <20180919090526.s3ahnemrt2ik2tx3@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=u5/u=mp=iki.fi=pasik@srs-us1.protection.inumbo.net>)
 id 1g7jQa-0002A4-Go
 for xen-devel@lists.xenproject.org; Wed, 03 Oct 2018 15:51:08 +0000
Content-Disposition: inline
In-Reply-To: <20180919090526.s3ahnemrt2ik2tx3@mac.bytemobile.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, George Dunlap <George.Dunlap@citrix.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jan Beulich <JBeulich@suse.com>, "bhelgaas@google.com" <bhelgaas@google.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBTZXAgMTksIDIwMTggYXQgMTE6MDU6MjZBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUdWUsIFNlcCAxOCwgMjAxOCBhdCAwMjowOTo1M1BNIC0wNDAwLCBCb3Jp
cyBPc3Ryb3Zza3kgd3JvdGU6Cj4gPiBPbiA5LzE4LzE4IDU6MzIgQU0sIEdlb3JnZSBEdW5sYXAg
d3JvdGU6Cj4gPiA+Cj4gPiA+PiBPbiBTZXAgMTgsIDIwMTgsIGF0IDg6MTUgQU0sIFBhc2kgS8Ok
cmtrw6RpbmVuIDxwYXNpa0Bpa2kuZmk+IHdyb3RlOgo+ID4gPj4KPiA+ID4+IEhpLAo+ID4gPj4K
PiA+ID4+IE9uIE1vbiwgU2VwIDE3LCAyMDE4IGF0IDAyOjA2OjAyUE0gLTA0MDAsIEJvcmlzIE9z
dHJvdnNreSB3cm90ZToKPiA+ID4+PiBXaGF0IGFib3V0IHRoZSB0b29sc3RhY2sgY2hhbmdlcz8g
SGF2ZSB0aGV5IGJlZW4gYWNjZXB0ZWQ/IEkgdmFndWVseQo+ID4gPj4+IHJlY2FsbCB0aGVyZSB3
YXMgYSBkaXNjdXNzaW9uIGFib3V0IHRob3NlIGNoYW5nZXMgYnV0IGRvbid0IHJlbWVtYmVyIGhv
dwo+ID4gPj4+IGl0IGVuZGVkLgo+ID4gPj4+Cj4gPiA+PiBJIGRvbid0IHRoaW5rIHRvb2xzdGFj
ay9saWJ4bCBwYXRjaCBoYXMgYmVlbiBhcHBsaWVkIHlldCBlaXRoZXIuCj4gPiA+Pgo+ID4gPj4K
PiA+ID4+ICJbUEFUQ0ggVjEgMC8xXSBYZW4vVG9vbHM6IFBDSSByZXNldCB1c2luZyAncmVzZXQn
IFN5c0ZTIGF0dHJpYnV0ZSI6Cj4gPiA+PiBodHRwczovL2xpc3RzLnhlbi5vcmcvYXJjaGl2ZXMv
aHRtbC94ZW4tZGV2ZWwvMjAxNy0xMi9tc2cwMDY2NC5odG1sCj4gPiA+Pgo+ID4gPj4gIltQQVRD
SCBWMSAxLzFdIFhlbi9saWJ4bDogUGVyZm9ybSBQQ0kgcmVzZXQgdXNpbmcgJ3Jlc2V0JyBTeXNG
UyBhdHRyaWJ1dGUiOgo+ID4gPj4gaHR0cHM6Ly9saXN0cy54ZW4ub3JnL2FyY2hpdmVzL2h0bWwv
eGVuLWRldmVsLzIwMTctMTIvbXNnMDA2NjMuaHRtbAo+ID4gCj4gPiAKPiA+IFdpbGwgdGhpcyBw
YXRjaCB3b3JrIGZvciAqQlNEPyBSb2dlcj8KPiAKPiBBdCBsZWFzdCBGcmVlQlNEIGRvbid0IHN1
cHBvcnQgcGNpLXBhc3N0aHJvdWdoLCBzbyBub25lIG9mIHRoaXMgd29ya3MKPiBBVE0uIFRoZXJl
J3Mgbm8gc3lzZnMgb24gQlNELCBzbyBtdWNoIG9mIHdoYXQncyBpbiBsaWJ4bF9wY2kuYyB3aWxs
Cj4gaGF2ZSB0byBiZSBtb3ZlZCB0byBsaWJ4bF9saW51eC5jIHdoZW4gQlNEIHN1cHBvcnQgaXMg
YWRkZWQuCj4gCgpPay4gVGhhdCBzb3VuZHMgbGlrZSBpdCdzIE9LIGZvciB0aGUgaW5pdGlhbCBw
Y2kgJ3Jlc2V0JyBpbXBsZW1lbnRhdGlvbiBpbiB4bC9saWJ4bCB0byBiZSBsaW51eC1vbmx5Li4g
CgoKVGhhbmtzLAoKLS0gUGFzaQoKCj4gVGhhbmtzLCBSb2dlci4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
