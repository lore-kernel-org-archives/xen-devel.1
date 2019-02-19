From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 1/4] x86/mm: split p2m ioreq server pages
 special handling into helper
Date: Tue, 19 Feb 2019 11:15:35 +0100
Message-ID: <20190219101535.yeja4loplyjmvryl@Air-de-Roger>
References: <20190218172727.19644-1-roger.pau@citrix.com>
 <20190218172727.19644-2-roger.pau@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19C94BC2B@SHSMSX104.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IDxp=Q2=citrix.com=prvs=946f78d22=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gw2RB-0000oq-Dz
 for xen-devel@lists.xenproject.org; Tue, 19 Feb 2019 10:15:41 +0000
Content-Disposition: inline
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19C94BC2B@SHSMSX104.ccr.corp.intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBGZWIgMTksIDIwMTkgYXQgMDU6NDc6MzRBTSArMDAwMCwgVGlhbiwgS2V2aW4gd3Jv
dGU6Cj4gPiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgW21haWx0bzpyb2dlci5wYXVAY2l0cml4LmNv
bV0KPiA+IFNlbnQ6IFR1ZXNkYXksIEZlYnJ1YXJ5IDE5LCAyMDE5IDE6MjcgQU0KPiA+IAo+ID4g
U28gdGhhdCBpdCBjYW4gYmUgc2hhcmVkIGJ5IGJvdGggZXB0LCBucHQgYW5kIHNoYWRvdyBjb2Rl
LCBpbnN0ZWFkIG9mCj4gPiBkdXBsaWNhdGluZyBpdC4KPiA+IAo+ID4gTm8gY2hhbmdlIGluIGZ1
bmN0aW9uYWxpdHkgaW50ZW5kZWQuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+ID4gUmV2aWV3ZWQtYnk6IFBhdWwgRHVycmFu
dCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4gPiBSZXZpZXdlZC1ieTogR2VvcmdlIER1bmxh
cCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgo+IAo+IFJldmlld2VkLWJ5OiBLZXZpbiBUaWFu
IDxrZXZpbi50aWFuQGludGVsLmNvbT4uIHdpdGggb25lCj4gc21hbGwgY29tbWVudDoKPiAKPiA+
ICtzdGF0aWMgaW5saW5lIHZvaWQgcDJtX2VudHJ5X21vZGlmeShzdHJ1Y3QgcDJtX2RvbWFpbiAq
cDJtLAo+ID4gcDJtX3R5cGVfdCBudCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwMm1fdHlwZV90IG90LCB1bnNpZ25lZCBpbnQgbGV2ZWwpCj4gPiArewo+ID4gKyAg
ICBpZiAoIGxldmVsICE9IDEgfHwgbnQgPT0gb3QgKQo+ID4gKyAgICAgICAgcmV0dXJuOwo+IAo+
IGJhc2VkIG9uIHR5cGUgY2hlY2ssIGRvZXMgaXQgbWFrZSBtb3JlIHNlbnNlIHRvIGNhbGwgaXQK
PiBwMm1fZW50cnlfbW9kaWZ5X3R5cGU/CgpMYXRlciBvbiB0aGUgZnVuY3Rpb24gd2lsbCBiZSBl
eHBhbmRlZCB0byBhbHNvIHRha2UgYSBuZXcvb2xkIG1mbiBwYWlyCm9mIHBhcmFtZXRlcnMsIHNv
IEkgdGhpbmsgdGhlIG5hbWUgaXMgZmluZSB0YWtpbmcgaW50byBhY2NvdW50IHRoZQpleHBhbnNp
b24gb2YgdGhlIGZ1bmN0aW9uIGxhdGVyIGluIHRoZSBwYXRjaCBzZXJpZXMuCgpUaGFua3MsIFJv
Z2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
