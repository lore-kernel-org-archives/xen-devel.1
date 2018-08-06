From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v4 31/32] libxl_disk: Cut libxl_cdrom_insert
 into step
Date: Mon, 6 Aug 2018 18:20:50 +0100
Message-ID: <20180806172050.GR1327@perard.uk.xensource.com>
References: <20180727140614.13256-1-anthony.perard@citrix.com>
 <20180727140614.13256-32-anthony.perard@citrix.com>
 <20180802155052.pwzahw3yb4fovsvu@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sagg=kv=citrix.com=prvs=749c18510=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fmjBe-0006H4-J3
 for xen-devel@lists.xenproject.org; Mon, 06 Aug 2018 17:20:54 +0000
Content-Disposition: inline
In-Reply-To: <20180802155052.pwzahw3yb4fovsvu@mac>
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

T24gVGh1LCBBdWcgMDIsIDIwMTggYXQgMDU6NTA6NTJQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBGcmksIEp1bCAyNywgMjAxOCBhdCAwMzowNjoxM1BNICswMTAwLCBBbnRo
b255IFBFUkFSRCB3cm90ZToKPiBDYW4geW91IHByb3ZpZGUgYSBjb21tZW50IGV4cGxhaW5pbmcg
aG93IGlzIHRoaXMgc3VwcG9zZWQgdG8gd29yaz8gVGhlCj4gY3VycmVudCBjb2RlIGlzIGFscmVh
ZHkgcXVpdGUgY29udm9sdXRlZCBJTU8gKG1heWJlIGJlY2F1c2UgSSdtIG5vdAo+IGZhbWlsaWFy
IHdpdGggaXQpLCBzbyBJIHRoaW5rIGEgY29tbWVudCB3b3VsZCBoZWxwIHJldmlld2Vycy4KCkhh
dmUgeW91IHJlYWQgdGhlIENPRElOR19TVFlMRSBmaWxlPyBJIHRoaW5rIHlvdSdsbCBmaW5kIHRo
YXQgdGhlCnNlY3Rpb24gIkFTWU5DSFJPTk9VUy9MT05HLVJVTk5JTkcgT1BFUkFUSU9OUyIgd2ls
bCBnaXZlIHlvdSBzb21lIGFuc3dlcgp5b3UgYXJlIGxvb2tpbmcgZm9yLiBJJ20gbm90IHN1cmUg
SSdtIGZvbGxvd2luZyBpdCBwZXJmZWN0bHksIGJ1dCBhdApsZWFzdCBwYXJ0aWFsbHkuCgpUaGFu
a3MsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
