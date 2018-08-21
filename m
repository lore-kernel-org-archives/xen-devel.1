From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH] tools: libxl/xl: run NUMA placement even
 when an hard-affinity is set
Date: Tue, 21 Aug 2018 11:25:27 +0100
Message-ID: <23419.59543.385873.125444@mariner.uk.xensource.com>
References: <153452538306.14879.2645077465028661264.stgit@Palanthas.fritz.box>
 <20180820101428.djudte4z2wye3cz3@citrix.com>
 <b346c13a4a05c75d531da1dcfa7ea684a0d5089e.camel@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kqmj=le=citrix.com=prvs=764db257d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fs3qt-00085v-8V
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 10:25:31 +0000
In-Reply-To: <b346c13a4a05c75d531da1dcfa7ea684a0d5089e.camel@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RGFyaW8gRmFnZ2lvbGkgd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSF0gdG9vbHM6IGxp
YnhsL3hsOiBydW4gTlVNQSBwbGFjZW1lbnQgZXZlbiB3aGVuIGFuIGhhcmQtYWZmaW5pdHkgaXMg
c2V0Iik6Cj4gT24gTW9uLCAyMDE4LTA4LTIwIGF0IDExOjE0ICswMTAwLCBXZWkgTGl1IHdyb3Rl
Ogo+ID4gWW91IGNhbiB1c2UgTkRFQlVHIGluc3RlYWQuCj4gCj4gSSBmb3VuZCB0aGlzIGluIG9u
ZSBvdGhlciBwbGFjZSBpbiBsaWJ4bCAobGlieGxfZXZlbnQuYyksIGFuZCBmaWd1cmVkIEkKPiBj
b3VsZCB1c2UgaXQgaGVyZSB0b28uCj4gCj4gUmVhc29uIGlzIHRoYXQgdGhpcyBndWFyZHMgYSAo
cG90ZW50aWFsbHkpIHJhdGhlciBleHBlbnNpdmUgY2hlY2ssCj4gd2hpY2ggSSBwZXJzb25hbGx5
IGNvbnNpZGVyIHRvbyBtdWNoLCBldmVuIGZvciBkZWJ1ZyBidWlsZC4gQXQgdGhlIHNhbWUKPiB0
aW1lLCBpdCBjb3VsZCBiZSBoYW5keSBmb3IgdXMgZGV2ZWxvcGVycyB0byBoYXZlIGl0IHRoZXJl
LCBhbmQgYmUgYWJsZQo+IHRvIGVuYWJsZSBpdCB3aGVuIG1ha2luZyBjaGFuZ2VzIHRvIGFmZmlu
aXR5IGFuZC9vciBOVU1BIHBsYWNlbWVudAo+IGNvZGUuCj4gCj4gQnV0IEkgZG9uJ3QgaGF2ZSBh
IHRvbyBzdHJvbmcgb3BpbmlvbjsgSSdsbCBjaGFuZ2UgaXQgdG8gdXMgTkRFQlVHIGlmCj4gdGhh
dCdzIHdoYXQgeW91IHByZWZlci4KClBsZWFzZSBkbyBub3QgdXNlIE5ERUJVRy4gIGxpYnhsIGlz
IG5vdCBkZXNpZ25lZCB0byBiZSBjb21waWxlZCB3aXRoCk5ERUJVRy4KCklhbi4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
