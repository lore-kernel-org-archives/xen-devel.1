From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH RFC for-4.12] x86: put CONFIG_{HVM,
 PV} under EXPERT
Date: Fri, 1 Feb 2019 16:29:52 +0000
Message-ID: <0e4a419e-4eba-9f2b-7154-2700c74409d5@citrix.com>
References: <20190201154346.22919-1-wei.liu2@citrix.com>
 <5C546D750200007800213371@prv1-mh.provo.novell.com>
 <20190201160401.5w54gbvxtkpvab7j@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rDPL=QI=citrix.com=prvs=92817040b=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gpbhT-0004pE-Qv
 for xen-devel@lists.xenproject.org; Fri, 01 Feb 2019 16:29:55 +0000
In-Reply-To: <20190201160401.5w54gbvxtkpvab7j@zion.uk.xensource.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDIvMjAxOSAxNjowNCwgV2VpIExpdSB3cm90ZToKPiBPbiBGcmksIEZlYiAwMSwgMjAx
OSBhdCAwOTowMTo1N0FNIC0wNzAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMDEuMDIu
MTkgYXQgMTY6NDMsIDx3ZWkubGl1MkBjaXRyaXguY29tPiB3cm90ZToKPj4+IEVuYWJsaW5nIGFu
ZCBkaXNhYmxpbmcgb25lIG9mIHRoZSB0d28gaXNuJ3QgdGVzdGVkIGluIE9TU1Rlc3QgeWV0Lgo+
PiBXaGlsZSBJJ20gbm90IG9wcG9zZWQgdG8gdGhlIGFkZGl0aW9uLCBJIGludGVudGlvbmFsbHkg
ZGlkbid0IGFzawo+PiBmb3IgZG9pbmcgc28gd2hlbiB0aGUgb3B0aW9ucyBnb3QgaW50cm9kdWNl
ZCwgbm90IHRoZSBsZWFzdAo+PiBiZWNhdXNlIG9mIC4uLgo+Pgo+Pj4gQEAgLTY4LDcgKzY5LDcg
QEAgY29uZmlnIFBWX0xJTkVBUl9QVAo+Pj4gIAo+Pj4gIGNvbmZpZyBIVk0KPj4+ICAJZGVmX2Jv
b2wgIVBWX1NISU1fRVhDTFVTSVZFCj4+IC4uLiB0aGlzLCBpLmUuIHVzIGFscmVhZHkgd2FudGlu
ZyBhIHN1cHBvcnRlZCBjb25maWd1cmF0aW9uIHRvCj4+IGJlIGJ1aWx0IGFuZCBydW4gaW4gdGhh
dCBtb2RlLiBJT1cgcGVyc29uYWxseSBJIHRoaW5rIG5vCj4+IGNoYW5nZSBpcyBuZWVkZWQsIGFu
ZCBkaXNhYmxpbmcgZWl0aGVyIChidXQgbm90IGJvdGgpIG91Z2h0Cj4+IHRvIGJlIHNlY3VyaXR5
IHN1cHBvcnRlZCByaWdodCBhd2F5Lgo+IFRoaXMgaXMgZmluZS4gQW5kcmV3IGFsc28gc2FpZCBt
b3JlIG9yIGxlc3MgdGhlIHNhbWUgdGhpbmcgb24gSVJDLgo+Cj4gSSBqdXN0IHdhbnQgdG8gYmUg
c3VyZSB0aGlzIGdldHMgcHJvcGVybHkgZGlzY3Vzc2VkLgoKSSB0aGluayB0aGUgcmlzayBvZiB0
aGVyZSBiZWluZyBhbiBYU0EgaGlkZGVuIGluIGhlcmUgd2hpY2ggaXMgb25seQphcHBsaWNhYmxl
IHRvIFhlbiA0LjEyKyBpcyB2ZXJ5IHNsaW0uwqAgSSBleHBlY3QgdGhhdCBhbnkgYnJlYWthZ2Ug
ZnJvbQp0aGlzIHdvdWxkIGJlIGFyb3VuZCBkb21haW5jcmVhdGUgYW5kIHRoZXJlZm9yZSBhIGNv
bnRyb2wtcGxhaW4gb3BlcmF0aW9uLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
