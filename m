From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v3 4/5] tools/misc: fix hard tabs in
 xen-hvmctx.c
Date: Wed, 7 Nov 2018 13:09:53 +0000
Message-ID: <901068188d5c4bf882cdad3b8a737b0e@AMSPEX02CL03.citrite.net>
References: <20181107105223.27013-1-paul.durrant@citrix.com>
 <20181107105223.27013-5-paul.durrant@citrix.com>
 <20181107130838.urbvile4kfgexf33@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9ib7=ns=citrix.com=prvs=842bfaeda=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gKNat-0001iY-Gv
 for xen-devel@lists.xenproject.org; Wed, 07 Nov 2018 13:10:03 +0000
In-Reply-To: <20181107130838.urbvile4kfgexf33@zion.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFdlaSBMaXUgW21haWx0bzp3ZWku
bGl1MkBjaXRyaXguY29tXQo+IFNlbnQ6IDA3IE5vdmVtYmVyIDIwMTggMTM6MDkKPiBUbzogUGF1
bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnOyBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47Cj4g
V2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0g
W1BBVENIIHYzIDQvNV0gdG9vbHMvbWlzYzogZml4IGhhcmQgdGFicyBpbiB4ZW4tCj4gaHZtY3R4
LmMKPiAKPiBPbiBXZWQsIE5vdiAwNywgMjAxOCBhdCAxMDo1MjoyMkFNICswMDAwLCBQYXVsIER1
cnJhbnQgd3JvdGU6Cj4gPiBBbHNvIGFkZCBlbWFjcyBib2lsZXJwbGF0ZSB0byBhdm9pZCBmdXR1
cmUgcHJvYmxlbXMuCj4gPgo+ID4gUHVyZWx5IGNvc21ldGljLiBObyBmdW5jdGlvbmFsIGNoYW5n
ZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRy
aXguY29tPgo+ID4gQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gCj4g
SSBoYXZlIHB1c2hlZCB0aGlzIHBhdGNoIHRvIHN0YWdpbmcuCgpUaGFua3MgOi0pCgogIFBhdWwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
