From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 1/4] firmware/seabios: fix build on systems
 with non GNU toolchains
Date: Mon, 2 Jul 2018 10:42:44 +0100
Message-ID: <20180702094244.5i5kpac4vrfnfdii@citrix.com>
References: <20180702082826.90272-1-roger.pau@citrix.com>
 <20180702082826.90272-2-roger.pau@citrix.com>
 <20180702093215.mkhacckcanrct5xg@citrix.com>
 <20180702093628.uluq3lvb2jr3v5i2@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=b8wo=js=citrix.com=prvs=71436c00c=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fZvM8-0005fh-TN
 for xen-devel@lists.xenproject.org; Mon, 02 Jul 2018 09:42:48 +0000
Content-Disposition: inline
In-Reply-To: <20180702093628.uluq3lvb2jr3v5i2@mac.bytemobile.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKdWwgMDIsIDIwMTggYXQgMTE6MzY6MjhBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBNb24sIEp1bCAwMiwgMjAxOCBhdCAxMDozMjoxNUFNICswMTAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gT24gTW9uLCBKdWwgMDIsIDIwMTggYXQgMTA6Mjg6MjNBTSArMDIwMCwg
Um9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gWy4uLl0KPiA+ID4gIAo+ID4gPiAgc3VidHJlZS1m
b3JjZS11cGRhdGU6Cj4gPiA+IEBAIC0xMjgsMyArMTI4LDYgQEAgZW5kaWYKPiA+ID4gIHN1YnRy
ZWUtZm9yY2UtdXBkYXRlLWFsbDoKPiA+ID4gIAkkKE1BS0UpIHNlYWJpb3MtZGlyLWZvcmNlLXVw
ZGF0ZQo+ID4gPiAgCSQoTUFLRSkgb3ZtZi1kaXItZm9yY2UtdXBkYXRlCj4gPiA+ICsKPiA+ID4g
K3N1YmRpci1hbGwtc2VhYmlvcy1kaXI6IHNlYWJpb3MtZGlyCj4gPiA+ICsJJChNQUtFKSAtQyAk
PCBDQz0kKFNFQUJJT1NDQykgTEQ9JChTRUFCSU9TTEQpIFBZVEhPTj0kKFBZVEhPTikgYWxsOwo+
ID4gCj4gPiBUaGVyZSBpcyBhIHBhdHRlcm4gcnVsZSBpbiBSdWxlcy5taywgc28gSSB3b3VsZCB2
ZXJ5IG11Y2ggYXZvaWQgaGF2aW5nCj4gPiBpdCByZWRlZmluZWQuCj4gCj4gSSBrbm93LCBidXQg
SSBuZWVkIHRvIHJlZGVmaW5lIGl0IHNvIEkgY2FuIHBhc3MgdGhlIGV4dHJhIG9wdGlvbnMuIEkK
PiBkb24ndCBzZWUgYW55IGJldHRlciB3YXkgdG8gZG8gdGhpcyBUQkguCgpPaCwgY2FuIHlvdSB0
cnkgdGhlIGZvbGxvd2luZyB0byBzZWUgaWYgaXQgd29ya3M/CgogIHN1YmRpci1hbGwtc2VhYmlv
cy1kaXI6IENDPSQoU0VBQklPU0NDKSBMRD0kKFNFQUJJT1NMRCkKClNlZQpodHRwczovL2Z0cC5n
bnUub3JnL29sZC1nbnUvTWFudWFscy9tYWtlLTMuNzkuMS9odG1sX2NoYXB0ZXIvbWFrZV82Lmh0
bWwjU0VDNjkKCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
