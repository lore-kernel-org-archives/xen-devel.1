From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 1/2] xen: add interface for obtaining
 .config from hypervisor
Date: Thu, 4 Apr 2019 15:35:31 +0200
Message-ID: <25e2994c-3954-86d3-39da-749f3a3f01f0@suse.com>
References: <20190314115937.26394-1-jgross@suse.com>
 <20190314115937.26394-2-jgross@suse.com>
 <667b2ee6-fc6f-64e6-5977-2c69a9d97a95@citrix.com>
 <95fd63f7-e7fe-bbb0-a2df-a634d3f05867@suse.com>
 <20190404132725.GO14641@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KwgS=SG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hC2Wn-0006Aw-6j
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2019 13:35:37 +0000
In-Reply-To: <20190404132725.GO14641@zion.uk.xensource.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMDQvMjAxOSAxNToyNywgV2VpIExpdSB3cm90ZToKPiBPbiBGcmksIE1hciAxNSwgMjAx
OSBhdCAwNToyOToyOFBNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBPbiAxNS8wMy8y
MDE5IDE2OjU1LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4gT24gMTQvMDMvMjAxOSAxMTo1OSwg
SnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+PiBAQCAtMTEwMCw2ICsxMTAwLDIwIEBAIHR5cGVkZWYg
c3RydWN0IHhlbl9zeXNjdGxfY3B1X3BvbGljeSB4ZW5fc3lzY3RsX2NwdV9wb2xpY3lfdDsKPj4+
PiAgREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUoeGVuX3N5c2N0bF9jcHVfcG9saWN5X3QpOwo+Pj4+
ICAjZW5kaWYKPj4+PiAgCj4+Pj4gKy8qCj4+Pj4gKyAqIFhFTl9TWVNDVExfZ2V0X2NvbmZpZwo+
Pj4+ICsgKgo+Pj4+ICsgKiBSZXR1cm4gZ3ppcC1lZCAuY29uZmlnIGZpbGUKPj4+Cj4+PiBJIGRv
bid0IHRoaW5rIGl0IGlzIHdpc2UgdG8gYmFrZSBnemlwIGludG8gdGhlIEFQSS7CoCBUaGVzZSBk
YXlzLCB0aGVyZQo+Pj4gcmVhbGx5IGFyZSBiZXR0ZXIgb3B0aW9ucyB0aGFuIGd6aXAgYm90aCBp
biB0ZXJtcyBvZiBjb21wcmVzc2lvbiByYXRpbwo+Pj4gYW5kIGRlY29tcHJlc3Mgc3BlZWQuCj4+
Pgo+Pj4gSSdkIHN1Z2dlc3QganVzdCBzYXlpbmcgImZpbGUgbWF5IGJlIGNvbXByZXNzZWQiIGFu
ZCBsZWF2ZSBpdCB1cCB0byB0aGUKPj4+IHBhY2thZ2VycyBidWlsZCBzeXN0ZW0gYW5kIGB4bGAg
Y2hvaWNlcyB0byBhZ3JlZSBvbiB3aGljaCBjb21wcmVzc2lvbgo+Pj4gKGlmIGFueSkgdG8gdXNl
Lgo+Pgo+PiBJIGFtIG5vdCBjb252aW5jZWQgdGhpcyBpcyBhIGdvb2QgaWRlYS4gSSB0aGluayB0
aGUgZGF0YSBmb3JtYXQgc2hvdWxkCj4+IGJlIHNwZWNpZmllZC4KPj4KPj4gQW5kIFRCSDogdGhl
IGRpZmZlcmVuY2UgaW4gc2l6ZSBmb3IgYSByYXRoZXIgIm5vcm1hbCIgLmNvbmZpZyBpcyBhYm91
dAo+PiA1MCBieXRlcyAoSSB0cmllZCBnemlwLCB4eiBhbmQgYnppcDIgd2l0aCBnemlwIHByb2R1
Y2luZyB0aGUgc21hbGxlc3QKPj4gcmVzdWx0KS4KPiAKPiBIYXMgdGhpcyBiZWVuIHJlc29sdmVk
Pwo+IAo+IEkgZG9uJ3QgcmVhbGx5IGhhdmUgYW4gb3BpbmlvbiBvbiB0aGlzLgoKSSBnb3Qgbm8g
cmVwbHkgZm9yIHRoYXQgYW5zd2VyLgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
