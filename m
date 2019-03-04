From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: bogus libxl error handling in
 domcreate_bootloader_done
Date: Mon, 4 Mar 2019 16:20:54 +0000
Message-ID: <20190304162054.s44klpo4uhi37pgx@zion.uk.xensource.com>
References: <20190228141718.7740e706.olaf@aepfle.de>
 <20190228172159.0f5d0e31.olaf@aepfle.de>
 <CAFLBxZZr2ZA58HBUx0CiRHjJtYtMXRcAZ3avAcTr+92ihD04Sw@mail.gmail.com>
 <20190304145401.hnrpjxf442kcfcku@zion.uk.xensource.com>
 <20190304171706.28a892b2.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Gv0l=RH=citrix.com=prvs=95970c4b2=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1h0qKy-000646-L6
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2019 16:21:08 +0000
Content-Disposition: inline
In-Reply-To: <20190304171706.28a892b2.olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel <xen-devel@lists.xenproject.org>, George Dunlap <dunlapg@umich.edu>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXIgMDQsIDIwMTkgYXQgMDU6MTc6MDZQTSArMDEwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQW0gTW9uLCA0IE1hciAyMDE5IDE0OjU0OjAxICswMDAwCj4gc2NocmllYiBXZWkgTGl1
IDx3ZWkubGl1MkBjaXRyaXguY29tPjoKPiAKPiA+ID4gPiArICAgIC8qIFByZXBhcmUgZW52aXJv
bm1lbnQgZm9yIGRvbWNyZWF0ZV9zdHJlYW1fZG9uZSAqLwo+ID4gPiA+ICsgICAgZGNzLT5zcnMu
YW8gPSBhbzsKPiA+ID4gPiArICAgIGRjcy0+c3JzLmRjcyA9IGRjczsKPiA+ID4gPiArICAgIGRj
cy0+c3JzLmZkID0gLTE7Cj4gPiBBcyBmYXIgYXMgSSBjYW4gdGVsbCBvbmx5IHNycy5kY3MgbmVl
ZHMgdG8gYmUgaW5pdGlhbGlzZWQgYmVmb3JlIGhhbmQuCj4gCj4gZmQgbmVlZHMgdG8gYmUgdHdl
YWtlZCBhcyB3ZWxsIHRvIHByZXZlbnQgdGhlICJzb2Z0IHJlc2V0IiBjb2RlIHBhdGguCj4gQnV0
IGFzIEkgbm90aWNlIGp1c3Qgbm93LCBteSBjaGFuZ2UgdG91Y2hlcyB0aGUgd3JvbmcgZmQuIHJl
c3RvcmVfZmQKPiBpcyBhcHBhcmVudGx5IGFscmVhZHkgc2V0LiBTbyB5ZXMsIG9ubHkgZGNzIGlz
IHJlcXVpcmVkLgo+IAo+IEJ1dCBpcyBkb21jcmVhdGVfYm9vdGxvYWRlcl9kb25lIHRoZSBjb3Jy
ZWN0IHBsYWNlIHRvIGluaXRpYWxpemUgaXQ/CgovbWUgd29uZGVycyB0aGUgc2FtZS4KCkknbSBw
dXp6bGVkIGJ5IHRoZSBjb2RlIGFzIHdlbGwuICBJYW4sIHdoYXQgZG8geW91IHRoaW5rPwoKV2Vp
LgoKPiAKPiBPbGFmCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
