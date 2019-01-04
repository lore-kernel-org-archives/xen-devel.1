From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v7 06/14] libxl_qmp: Implementation of
 libxl__ev_qmp_*
Date: Fri, 4 Jan 2019 11:14:25 +0000
Message-ID: <20190104111425.GA1508@perard.uk.xensource.com>
References: <20181123135355.6001-1-anthony.perard@citrix.com>
 <20181123135355.6001-7-anthony.perard@citrix.com>
 <23581.2162.571088.595084@mariner.uk.xensource.com>
 <20190103124018.GE1288@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OewZ=PM=citrix.com=prvs=90051d582=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gfNQx-0002n7-11
 for xen-devel@lists.xenproject.org; Fri, 04 Jan 2019 11:14:35 +0000
Content-Disposition: inline
In-Reply-To: <20190103124018.GE1288@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMDMsIDIwMTkgYXQgMTI6NDA6MThQTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gRnJpLCBEZWMgMjEsIDIwMTggYXQgMDM6MzY6MThQTSArMDAwMCwgSWFuIEph
Y2tzb24gd3JvdGU6Cj4gPiBBbnRob255IFBFUkFSRCB3cml0ZXMgKCJbUEFUQ0ggdjcgMDYvMTRd
IGxpYnhsX3FtcDogSW1wbGVtZW50YXRpb24gb2YgbGlieGxfX2V2X3FtcF8qIik6Cj4gPiA+ICtz
dGF0aWMgdm9pZCBxbXBfZXZfc2V0X3N0YXRlKGxpYnhsX19nYyAqZ2MsIGxpYnhsX19ldl9xbXAg
KmV2LAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9fcW1wX3N0YXRl
IG5ld19zdGF0ZSkKPiA+ID4gKyAgICAvKiBvbiBlbnRyeTogIWJyb2tlbiBhbmQgIWRpc2Nvbm5l
Y3RlZCAqLwo+ID4gPiArewpbLi4uXQo+ID4gPiArCj4gPiA+ICsgICAgZXYtPnN0YXRlID0gbmV3
X3N0YXRlOwo+ID4gCj4gPiBJIHRoaW5rIHRoaXMgZnVuY3Rpb24gbmVlZHMgdG8gdXBkYXRlIGVm
ZCA/ICBXaGF0IGFtIEkgbWlzc2luZyA/Cj4gCj4gWWVzLCBJIHRoaW5rIGl0J3MgZmluZSB0byBj
YWxsIHFtcF9ldl9lbnN1cmVfcmVhZGluZ193cml0aW5nIGhlcmUgKCBvcgo+IGV2ZW4gaW5saW5l
IGl0KSBhbmQgcW1wX2V2X2Vuc3VyZV9yZWFkaW5nX3dyaXRpbmcgd29uJ3QgbmVlZHMgdG8gYmUK
PiBjYWxsIGZyb20gb3RoZXIgcGxhY2VzLgoKQWN0dWFsbHksIEkgc3RpbGwgbmVlZCB0byB1cGRh
dGUgZWZkIGFmdGVyIGhhdmluZyB0cmFuc21pdCBkYXRhIHRvIFFFTVUsCmFzIGV2LT5zdGF0ZSBp
c24ndCB1cGRhdGVkIGluIHRoYXQgY2FzZS4gU28gSSdsbCBoYXZlIGVmZCB1cGRhdGUgd2hlbgpx
bXBfZXZfc2V0X3N0YXRlIGlzIGNhbGxlZCwgYW5kIHdoZW4gdGhlIHR4X2J1ZiBpcyBtYXliZSBz
ZW50LgoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
