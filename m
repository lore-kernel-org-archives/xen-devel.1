From: Ben Hutchings <ben.hutchings@codethink.co.uk>
Subject: Re: [stable] xen/pciback: Don't disable PCI_COMMAND on
 PCI device reset.
Date: Mon, 03 Jun 2019 13:02:39 +0100
Message-ID: <1559563359.24330.8.camel__3419.81002581946$1559563432$gmane$org@codethink.co.uk>
References: <1559229415.24330.2.camel@codethink.co.uk>
 <0e6ebb5c-ff43-6d65-bcba-6ac5e60aa472@oracle.com>
 <20190603080036.GF7814@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sxdA=UC=codethink.co.uk=ben.hutchings@srs-us1.protection.inumbo.net>)
 id 1hXlfy-0000ay-OM
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 12:02:54 +0000
In-Reply-To: <20190603080036.GF7814@kroah.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Greg KH <greg@kroah.com>
Cc: Prarit Bhargava <prarit@redhat.com>, Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, stable <stable@vger.kernel.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAyMDE5LTA2LTAzIGF0IDEwOjAwICswMjAwLCBHcmVnIEtIIHdyb3RlOgo+IE9uIFRo
dSwgTWF5IDMwLCAyMDE5IGF0IDA3OjAyOjM0UE0gLTA3MDAsIEtvbnJhZCBSemVzenV0ZWsgV2ls
ayB3cm90ZToKPiA+IE9uIDUvMzAvMTkgODoxNiBBTSwgQmVuIEh1dGNoaW5ncyB3cm90ZToKPiA+
ID4gSSdtIGxvb2tpbmcgYXQgQ1ZFLTIwMTUtODU1MyB3aGljaCBpcyBmaXhlZCBieToKPiA+ID4g
Cj4gPiA+IGNvbW1pdCA3NjgxZjMxZWM5Y2RhY2FiNGZkMTA1NzBiZTkyNGYyY2VmNjY2OWJhCj4g
PiA+IEF1dGhvcjogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29t
Pgo+ID4gPiBEYXRlOsKgwqDCoFdlZCBGZWIgMTMgMTg6MjE6MzEgMjAxOSAtMDUwMAo+ID4gPiAK
PiA+ID4gwqDCoMKgwqDCoHhlbi9wY2liYWNrOiBEb24ndCBkaXNhYmxlIFBDSV9DT01NQU5EIG9u
IFBDSSBkZXZpY2UgcmVzZXQuCj4gPiA+IAo+ID4gPiBJJ20gYXdhcmUgdGhhdCB0aGlzIGNoYW5n
ZSBpcyBpbmNvbXBhdGlibGUgd2l0aCBxZW11IDwgMi41LCBidXQgdGhhdCdzCj4gPiA+IG5vdyBx
dWl0ZSBvbGQuwqDCoERvIHlvdSB0aGluayBpdCBtYWtlcyBzZW5zZSB0byBhcHBseSB0aGlzIGNo
YW5nZSB0bwo+ID4gPiBzb21lIHN0YWJsZSBicmFuY2hlcz8KPiA+ID4gCj4gPiA+IEJlbi4KPiA+
ID4gCj4gPiAKPiA+IEhleSBCZW4sCj4gPiAKPiA+IDxzaHJ1Z3M+IE15IG9waW5pb24gaXMgdG8g
ZHJvcCBpdCwgYnV0IGlmIEp1ZXJnZW4gdGhpbmtzIGl0IG1ha2VzIHNlbnNlIHRvCj4gPiBiYWNr
cG9ydCBJIGFtIG5vdCBnb2luZyB0byBhcmd1ZS4KPiAKPiBPaywgSSd2ZSBxdWV1ZWQgdGhpcyB1
cCBub3csIHRoYW5rcy4KCkp1ZXJnZW4gc2FpZDoKCj4gSSdtIHdpdGggS29ucmFkIGhlcmUuCgpz
byB1bmxlc3MgSSdtIHZlcnkgY29uZnVzZWQgdGhpcyBzaG91bGQgKm5vdCogYmUgYXBwbGllZCB0
byBzdGFibGUKYnJhbmNoZXMuCgpCZW4uCgotLSAKQmVuIEh1dGNoaW5ncywgU29mdHdhcmUgRGV2
ZWxvcGVyICAgICAgICAgICAgICAgIMKgICAgICAgICBDb2RldGhpbmsgTHRkCmh0dHBzOi8vd3d3
LmNvZGV0aGluay5jby51ay8gICAgICAgICAgICAgICAgIERhbGUgSG91c2UsIDM1IERhbGUgU3Ry
ZWV0CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNYW5jaGVzdGVyLCBNMSAy
SEYsIFVuaXRlZCBLaW5nZG9tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
