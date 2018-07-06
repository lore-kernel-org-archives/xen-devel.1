From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [Notes for xen summit 2018 design session] Process
 changes: is the 6 monthly release Cadence too short, Security Process, ...
Date: Fri, 6 Jul 2018 10:15:08 +0200
Message-ID: <20180706081508.vvoflzn6zng52p5y@mac.bytemobile.com>
References: <0920C595-DA2C-4C5E-B713-40ADB616CC93@citrix.com>
 <60433E7B-455A-45C9-8A6A-B26F5BD8F115@citrix.com>
 <20180705174804.viq3iq2sbfc3xicw@doug-macbook.localdomain>
 <2E77ABE1-55D1-4FD1-8DC4-718F2C702B06@citrix.com>
 <20180705190233.nkk76dfaqqr4pwly@doug-macbook.localdomain>
 <20180706015818.xjl7q2izacd3nyei@doug-macbook.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lit4=jw=citrix.com=prvs=718ad00cb=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fbLv2-0002EF-Fr
 for xen-devel@lists.xenproject.org; Fri, 06 Jul 2018 08:16:44 +0000
Content-Disposition: inline
In-Reply-To: <20180706015818.xjl7q2izacd3nyei@doug-macbook.localdomain>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, "advisory-board@lists.xenproject.org" <advisory-board@lists.xenproject.org>, George Dunlap <George.Dunlap@citrix.com>, Rich Persaud <persaur@gmail.com>, "committers@xenproject.org" <committers@xenproject.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKdWwgMDUsIDIwMTggYXQgMDg6NTg6MThQTSAtMDUwMCwgRG91ZyBHb2xkc3RlaW4g
d3JvdGU6Cj4gT24gVGh1LCBKdWwgMDUsIDIwMTggYXQgMDI6MDI6MzNQTSAtMDUwMCwgRG91ZyBH
b2xkc3RlaW4gd3JvdGU6Cj4gPiBJIGd1ZXNzIG15IHBvaW50IGlzICJObyBvbmUgdGhpbmsgdGhh
dCBJJ20gc3VnZ2VzdGluZyB0aGUgd2ViIFBSIG1vZGVsCj4gPiBzbyBwbGVhc2UgZG9uJ3QgZmly
ZSBvZmYgdGhlIGVtYWlsIGNhbm5vbnMhIi4gQnV0IEkgd2FzIHNheSB0aGVyZSBhcmUKPiA+IHNv
bWUgbmljZSB0aGluZ3MgYWJvdXQgdGhlIG1vZGVsIGxpa2UgeW91IG1lbnRpb25lZC4gSSdtIHdv
bmRlcmluZyBpZiB3ZQo+ID4gY291bGQgc29tZWhvdyBpbXBsZW1lbnQgc29tZXRoaW5nIHRvIGdl
dCB0aGUgYmVzdCBvZiBib3RoIHdvcmxkcyBpZiB0aGF0Cj4gPiBtYWtlcyBzZW5zZS4gVGhhdCdz
IHdoYXQgSSdtIGhvcGluZyB0byBkbyB3aXRoIEdpdExhYiBidXQgSSBoYXZlbid0IGhhZAo+ID4g
dGhlIGN5Y2xlcyB0byBkaXZlIGRlZXBseSBpbnRvIGl0Lgo+ID4gCj4gPiAtLQo+ID4gRG91Zwo+
IAo+IEknbGwgYWxzbyBtZW50aW9uIEkgcGVyc29uYWxseSBmZWVsIGxlc3MgY29tZm9ydGFibGUg
cmV2aWV3aW5nIHRoaW5ncwo+IG9uIHRoZSBtYWlsaW5nIGxpc3QuIEkgcmV2aWV3IGFuZCByZWFk
IHRocm91Z2ggbW9zdCBwYXRjaGVzIGJ1dCBJIGRvbid0Cj4gY29tbWVudCBvbiB0aGVtIGJlY2F1
c2UgSSdtIG5vdCBuZWNlc3NhcmlseSBjb25maWRlbnQgZW5vdWdoIHRvIGFkZCBteQo+IFItYiB0
byB0aGVtLiBJJ20gbm90IHN1cmUgaWYgb3RoZXJzIGZlZWwgdGhpcyB3YXkuCgpJJ20gYWZyYWlk
IEkgZG9uJ3Qgc2VlIGhvdyBzd2l0Y2hpbmcgdG8gd2ViIFBSIHJldmlldyBtb2RlbCBpcyBnb2lu
Zwp0byBjaGFuZ2UgdGhhdC4gQ29uZmlkZW5jZSBvZiB0aGUgcmV2aWV3ZXIgc2VlbXMgb3J0aG9n
b25hbCB0byB0aGUKdG9vbCB1c2VkIHRvIHBlcmZvcm0gdGhlIHJldmlld3MuCgpSb2dlci4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
