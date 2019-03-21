From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] xen: passthrough/amd: Remove unused
 function guest_iommu_set_base
Date: Thu, 21 Mar 2019 17:36:41 +0000
Message-ID: <7302ec7d-604e-04e0-53e6-723e0b63a56e@arm.com>
References: <20190319232055.23993-1-julien.grall@arm.com>
 <b85a35fb-9b25-26ec-afb1-aef4c9f6e923@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vhxZ=RY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h71cU-00034E-C2
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2019 17:36:46 +0000
In-Reply-To: <b85a35fb-9b25-26ec-afb1-aef4c9f6e923@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Brian Woods <brian.woods@amd.com>, Jan Beulich <jbeulich@suse.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmV3LAoKT24gMy8yMC8xOSAxMToxMyBBTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBP
biAxOS8wMy8yMDE5IDIzOjIwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IFRoZSBmdW5jdGlvbiBp
cyB1bnVzZWQgYW5kIGNvdWxkIHBvdGVudGlhbGx5IGxlYWQgYSB0byB0cmlnZ2VyIHRoZQo+PiBC
VUdfT04oKSBpbiBwMm1fY2hhbmdlX3R5cGVfb25lIGlmIG1pc3VzZWQgYXMgdGhlIHAybSB0eXBl
IGlzIG5vdAo+PiBzYW5pdGl6ZWQuCj4+Cj4+IFNvIHJlbW92ZSBpdC4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiAKPiBFaXRoZXIgdGhl
IGVudGlyZSBmaWxlIGdvZXMsIG9yIHRoaXMgZnVuY3Rpb24gc3RheXMuwqAgSXQgZGVmaW5pdGVs
eQo+IGlzbid0IHByb2R1Y3Rpb24gcmVhZHkgeWV0LCBhcyBub3RlZCBpbiBteSBwb3N0LWNvbW1p
dCBub3RlcyBpbgo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94
ZW4tZGV2ZWwvMjAxOC0xMS9tc2cwMjM1Ni5odG1sCgpJIHNob3VsZCBoYXZlIHByb2JhYmx5IGxv
b2tlZCBhdCB0aGUgY29tbWl0IGxvZ3MgZmlyc3QgOikuIEkgZm91bmQgaXQgCndoaWxlIGxvb2tp
bmcgd2hldGhlciB3ZSBjYW4gcmUtdXNlIHAybV9jaGFuZ2VfdHlwZV9vbmUgb24gQXJtIHRvby4K
Cj4gCj4gSG93ZXZlciwgdGhpcyBmdW5jdGlvbmFsaXR5IGlzIGdvaW5nIHRvIGJlIG5lY2Vzc2Fy
eSBpbiB0aGUgZnV0dXJlLsKgIEl0Cj4gaXMgcHJvYmFibHkgZWFzaWVyIGp1c3QgdG8gbGVhdmUg
aXQgYXMtaXMuCgpJIHdpbGwgZHJvcCB0aGUgcGF0Y2ggdGhlbi4KCkNoZWVycywKCi0tIApKdWxp
ZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
