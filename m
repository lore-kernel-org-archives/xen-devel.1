From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH] iommu: fix arm build after e9be34be5
Date: Wed, 10 Oct 2018 09:21:08 +0000
Message-ID: <ddf0bbab129d46ad881ed2388912c603@AMSPEX02CL03.citrite.net>
References: <20181009185812.9597-1-wei.liu2@citrix.com>
 <bf56e8b6aa8945f694f0f8e8619b498f@AMSPEX02CL03.citrite.net>
 <20181010091250.7w5ixmori4gge57i@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tmyd=mw=citrix.com=prvs=814b5ca87=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gAAgH-0004JG-CB
 for xen-devel@lists.xenproject.org; Wed, 10 Oct 2018 09:21:25 +0000
In-Reply-To: <20181010091250.7w5ixmori4gge57i@mac.bytemobile.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFJvZ2VyIFBhdSBNb25uZQo+IFNl
bnQ6IDEwIE9jdG9iZXIgMjAxOCAxMDoxMwo+IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFu
dEBjaXRyaXguY29tPgo+IENjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPjsgeGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBKYW4KPiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIXSBpb21tdTogZml4IGFybSBidWls
ZCBhZnRlciBlOWJlMzRiZTUKPiAKPiBPbiBXZWQsIE9jdCAxMCwgMjAxOCBhdCAwOTo1OToyMUFN
ICswMTAwLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tCj4gPiA+IEZyb206IFhlbi1kZXZlbCBbbWFpbHRvOnhlbi1kZXZlbC1ib3VuY2VzQGxpc3Rz
LnhlbnByb2plY3Qub3JnXSBPbgo+IEJlaGFsZgo+ID4gPiBPZiBXZWkgTGl1Cj4gPiA+IFNlbnQ6
IDA5IE9jdG9iZXIgMjAxOCAxOTo1OAo+ID4gPiBUbzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCj4gPiA+IENjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPjsgSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPjsKPiBSb2dlcgo+ID4gPiBQYXUgTW9ubmUgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgo+ID4gPiBTdWJqZWN0OiBbWGVuLWRldmVsXSBbUEFUQ0hdIGlvbW11OiBm
aXggYXJtIGJ1aWxkIGFmdGVyIGU5YmUzNGJlNQo+ID4gPgo+ID4gPiBUaGUgZnVuY3Rpb24gaW9t
bXVfc2hhcmVfcDJtX3RhYmxlIGlzIHVzZWQgYnkgYm90aCBBUk0gYW5kIHg4NiBidXQKPiA+ID4g
aGFwX2VuYWJsZWQgbWFjcm8gaXMgeDg2IG9ubHkuIFB1dCB0aGUgQVNTRVJUIHVuZGVyIENPTkZJ
R19YODYuCj4gPgo+ID4gV291bGQgaXQgYmUgdW5yZWFzb25hYmxlIHRvIG1ha2UgaGFwX2VuYWJs
ZWQoKSBjb21tb24gYW5kIGRlZmluZSBpdCB0bwo+IHRydWUgZm9yIEFSTT8KPiAKPiBJIGFzc3Vt
ZWQgaGFwX2VuYWJsZWQgd2FzIGhhcmRjb2RlZCB0byB0cnVlIGZvciBBUk0sIGJ1dCBpdCdzIG9u
bHkKPiB1c2VkIGluIHg4NiBjb2RlIGFuZCB2bV9ldmVudCBzbyBmYXIgKGFuZCBoZXJlIG5vdyks
IHNvIEknbSBub3Qgc3VyZQo+IGlmIGl0J3Mgd29ydGggaXQuCj4gCj4gSW4gYW55IGNhc2UsIEkg
dGhpbmsgdGhpcyBzaG91bGQgZ28gaW4gYXMgaXQgZml4ZXMgdGhlIGJ1aWxkLCBhbmQKPiBhZGRp
bmcgaGFwX2VuYWJsZWQgZm9yIEFSTSBjYW4gYmUgZG9uZSBsYXRlci4KPiAKCk9oIHllcy4gSXQg
Y2FuIGNlcnRhaW5seSBiZSB0aWRpZWQgbGF0ZXIuCgogIFBhdWwKCj4gUm9nZXIuCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
