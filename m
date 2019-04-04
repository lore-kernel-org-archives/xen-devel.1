From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 1/2] xen: add interface for obtaining
 .config from hypervisor
Date: Thu, 4 Apr 2019 14:27:25 +0100
Message-ID: <20190404132725.GO14641@zion.uk.xensource.com>
References: <20190314115937.26394-1-jgross@suse.com>
 <20190314115937.26394-2-jgross@suse.com>
 <667b2ee6-fc6f-64e6-5977-2c69a9d97a95@citrix.com>
 <95fd63f7-e7fe-bbb0-a2df-a634d3f05867@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VYWF=SG=citrix.com=prvs=9901e81f4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hC2Ov-0005FT-G0
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2019 13:27:29 +0000
Content-Disposition: inline
In-Reply-To: <95fd63f7-e7fe-bbb0-a2df-a634d3f05867@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXIgMTUsIDIwMTkgYXQgMDU6Mjk6MjhQTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBPbiAxNS8wMy8yMDE5IDE2OjU1LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+ID4gT24g
MTQvMDMvMjAxOSAxMTo1OSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiA+PiBAQCAtMTEwMCw2ICsx
MTAwLDIwIEBAIHR5cGVkZWYgc3RydWN0IHhlbl9zeXNjdGxfY3B1X3BvbGljeSB4ZW5fc3lzY3Rs
X2NwdV9wb2xpY3lfdDsKPiA+PiAgREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUoeGVuX3N5c2N0bF9j
cHVfcG9saWN5X3QpOwo+ID4+ICAjZW5kaWYKPiA+PiAgCj4gPj4gKy8qCj4gPj4gKyAqIFhFTl9T
WVNDVExfZ2V0X2NvbmZpZwo+ID4+ICsgKgo+ID4+ICsgKiBSZXR1cm4gZ3ppcC1lZCAuY29uZmln
IGZpbGUKPiA+IAo+ID4gSSBkb24ndCB0aGluayBpdCBpcyB3aXNlIHRvIGJha2UgZ3ppcCBpbnRv
IHRoZSBBUEkuwqAgVGhlc2UgZGF5cywgdGhlcmUKPiA+IHJlYWxseSBhcmUgYmV0dGVyIG9wdGlv
bnMgdGhhbiBnemlwIGJvdGggaW4gdGVybXMgb2YgY29tcHJlc3Npb24gcmF0aW8KPiA+IGFuZCBk
ZWNvbXByZXNzIHNwZWVkLgo+ID4gCj4gPiBJJ2Qgc3VnZ2VzdCBqdXN0IHNheWluZyAiZmlsZSBt
YXkgYmUgY29tcHJlc3NlZCIgYW5kIGxlYXZlIGl0IHVwIHRvIHRoZQo+ID4gcGFja2FnZXJzIGJ1
aWxkIHN5c3RlbSBhbmQgYHhsYCBjaG9pY2VzIHRvIGFncmVlIG9uIHdoaWNoIGNvbXByZXNzaW9u
Cj4gPiAoaWYgYW55KSB0byB1c2UuCj4gCj4gSSBhbSBub3QgY29udmluY2VkIHRoaXMgaXMgYSBn
b29kIGlkZWEuIEkgdGhpbmsgdGhlIGRhdGEgZm9ybWF0IHNob3VsZAo+IGJlIHNwZWNpZmllZC4K
PiAKPiBBbmQgVEJIOiB0aGUgZGlmZmVyZW5jZSBpbiBzaXplIGZvciBhIHJhdGhlciAibm9ybWFs
IiAuY29uZmlnIGlzIGFib3V0Cj4gNTAgYnl0ZXMgKEkgdHJpZWQgZ3ppcCwgeHogYW5kIGJ6aXAy
IHdpdGggZ3ppcCBwcm9kdWNpbmcgdGhlIHNtYWxsZXN0Cj4gcmVzdWx0KS4KCkhhcyB0aGlzIGJl
ZW4gcmVzb2x2ZWQ/CgpJIGRvbid0IHJlYWxseSBoYXZlIGFuIG9waW5pb24gb24gdGhpcy4KCldl
aS4KCj4gCj4gCj4gSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
