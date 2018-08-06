From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v4 30/32] libxl: Re-implement
 domain_suspend_device_model using libxl__ev_qmp
Date: Mon, 6 Aug 2018 18:07:44 +0100
Message-ID: <20180806170744.GQ1327@perard.uk.xensource.com>
References: <20180727140614.13256-1-anthony.perard@citrix.com>
 <20180727140614.13256-31-anthony.perard@citrix.com>
 <20180802153841.jwb7lp52cath4y6g@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sagg=kv=citrix.com=prvs=749c18510=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fmiyz-0004tZ-Mc
 for xen-devel@lists.xenproject.org; Mon, 06 Aug 2018 17:07:49 +0000
Content-Disposition: inline
In-Reply-To: <20180802153841.jwb7lp52cath4y6g@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBdWcgMDIsIDIwMTggYXQgMDU6Mzg6NDFQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBGcmksIEp1bCAyNywgMjAxOCBhdCAwMzowNjoxMlBNICswMTAwLCBBbnRo
b255IFBFUkFSRCB3cm90ZToKPiA+ICsKPiA+ICsgICAgaWYgKHFtcF9ldl9xZW11X2NoZWNrX3Zl
cnNpb24oZXYsIDIsIDExLCAwKSkKPiA+ICsgICAgICAgIHFtcF9wYXJhbWV0ZXJzX2FkZF9ib29s
KGdjLCAmYXJncywgImxpdmUiLCBkc3BzLT5saXZlKTsKPiA+ICsgICAgUU1QX1BBUkFNRVRFUlNf
U1BSSU5URigmYXJncywgImZpbGVuYW1lIiwgIi9kZXYvZmRzZXQvJWQiLCBmZHNldCk7Cj4gPiAr
ICAgIHJjID0gbGlieGxfX2V2X3FtcF9zZW5kKGdjLCBldiwgInhlbi1zYXZlLWRldmljZXMtc3Rh
dGUiLCBhcmdzKTsKPiAKPiBJIHRoaW5rIHNvbWUgY29tbWVudHMgYWJvdXQgdGhlIGxvZ2ljIGFi
b3ZlIHdvdWxkIGJlIGhlbHBmdWwgKGF0IGxlYXN0Cj4gZm9yIG1lKS4gRG8geW91IG5lZWQgdG8g
cGFzcyBhbiBleHRyYSBhcmd1bWVudCB0byAyLjExLjAgYW5kIGhpZ2hlcgo+IHZlcnNpb25zIGlu
IG9yZGVyIHRvIGxpdmUtbWlncmF0ZT8KCkknbGwga2VlcCB0aGUgY29tbWVudCB0aGF0IHdhcyB0
aGVyZSBiZWZvcmU6CiAvKiBsaXZlIHBhcmFtZXRlciB3YXMgYWRkZWQgdG8gUUVNVSAyLjExLiBJ
dCBzaWduYWwgUUVNVSB0aGF0IHRoZSBzYXZlCiAgKiBvcGVyYXRpb24gaXMgZm9yIGEgbGl2ZSBt
aWdyYXRpb24gcmF0aGVyIHRoYXQgZm9yIHRha2luZyBhIHNuYXBzaG90LiAqLwoKQW5kIGZvciBt
b3JlIGV4cGxhbmF0aW9uIGFib3V0IHRoaXMgcGFyYW1ldGVyLCBJIHRoaW5rIEknbGwgbGV0IGZ1
dHVyZQphcmNoZW9sb2dpc3QgZmluZCB0aGUgY29tbWl0IHRoYXQgaW50cm9kdWNlIGl0cyB1c2Fn
ZS4KKGRiMGM3ZGRlMDIxYzI5YzJhZTBkODQ3ZDcwZmI3YjU5ZTAyZWE1MjIpCgotLSAKQW50aG9u
eSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
