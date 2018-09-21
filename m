From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v5 1/5] x86/mem_access: put
 p2m_{get/set}_suppress_ve under CONFIG_HVM
Date: Fri, 21 Sep 2018 17:03:17 +0100
Message-ID: <20180921160317.6ghpo3e5arpuexfj@zion.uk.xensource.com>
References: <cover.147d0f0e643da1e63074fd4940f98b9ad458396a.1537545258.git-series.wei.liu2@citrix.com>
 <645582bae3826048a61ba2162c1539f580847f13.1537545258.git-series.wei.liu2@citrix.com>
 <e89abfdc-c6ee-9075-6470-4a0e6484d876@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4pl1=md=citrix.com=prvs=7953d62ed=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g3Ntp-0007MH-90
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 16:03:21 +0000
Content-Disposition: inline
In-Reply-To: <e89abfdc-c6ee-9075-6470-4a0e6484d876@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBTZXAgMjEsIDIwMTggYXQgMDY6NTc6MzlQTSArMDMwMCwgUmF6dmFuIENvam9jYXJ1
IHdyb3RlOgo+IE9uIDkvMjEvMTggNjo1NCBQTSwgV2VpIExpdSB3cm90ZToKPiA+IFRoZXkgYXJl
IHVzZWQgYnkgSFZNIGNvZGUgb25seS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8
d2VpLmxpdTJAY2l0cml4LmNvbT4KPiA+IC0tLQo+ID4gdjU6IG5ldwo+ID4gLS0tCj4gPiAgeGVu
L2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYyB8IDIgKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vbWVtX2Fj
Y2Vzcy5jIGIveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYwo+ID4gaW5kZXggMjIxN2JkYS4u
ODI2YzM1ZiAxMDA2NDQKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMKPiA+
ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMKPiA+IEBAIC01MDEsNiArNTAxLDcg
QEAgdm9pZCBhcmNoX3AybV9zZXRfYWNjZXNzX3JlcXVpcmVkKHN0cnVjdCBkb21haW4gKmQsIGJv
b2wgYWNjZXNzX3JlcXVpcmVkKQo+ID4gICAgICB9Cj4gPiAgfQo+ID4gIAo+ID4gKyNpZmRlZiBD
T05GSUdfSFZNCj4gPiAgLyoKPiA+ICAgKiBTZXQvY2xlYXIgdGhlICNWRSBzdXBwcmVzcyBiaXQg
Zm9yIGEgcGFnZS4gIE9ubHkgYXZhaWxhYmxlIG9uIFZNWC4KPiA+ICAgKi8KPiA+IEBAIC02MDAs
NiArNjAxLDcgQEAgaW50IHAybV9nZXRfc3VwcHJlc3NfdmUoc3RydWN0IGRvbWFpbiAqZCwgZ2Zu
X3QgZ2ZuLCBib29sICpzdXBwcmVzc192ZSwKPiA+ICAKPiA+ICAgICAgcmV0dXJuIDA7Cj4gPiAg
fQo+ID4gKyNlbmRpZgo+ID4gIAo+ID4gIC8qCj4gPiAgICogTG9jYWwgdmFyaWFibGVzOgo+IAo+
IEhlbGxvIFdlaSwKPiAKPiBJIGFtIHdvcmtpbmcgb24gbW92aW5nIHRoZXNlIGZ1bmN0aW9ucyB0
byBwMm0uYyAoYnV0IHdhaXRpbmcgZm9yCj4gR2VvcmdlJ3MgcmVwbHkgb24gdGhlIFZNWCAjVkUg
Y2hlY2tzKSwgc28gaWYgeW91J2QgbGlrZSAtIGFuZCBmZWVsCj4gdGhhdCdzIGFwcHJvcHJpYXRl
IC0gSSBjYW4gYWxzbyBwdXQgdGhhdCBjb2RlIHVuZGVyIENPTkZJR19IVk0gaW4gdGhlCj4gY2xl
YW51cCBwYXRjaC4gSXMgdGhhdCBzb21ldGhpbmcgeW91J2QgYmUgaW50ZXJlc3RlZCBpbj8KClRo
YXQgd291bGQgYmUgZmluZSBieSBtZSwgYnV0IC4uLgoKPiAKPiBPdGhlcndpc2UsIEFja2VkLWJ5
OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+LCBhbmQKPiBJJ2xs
IG1vdmUgdGhlIG5ldyBjb2RlIGFzIHdlbGwuCj4gCgpzaW5jZSB5b3UgYWNrIHRoaXMsIEkgbWln
aHQgYXMgd2VsbCBqdXN0IGNvbW1pdCB0aGlzIHBhdGNoIHNvIHlvdSBjYW4KcmViYXNlLgoKSW4g
YW55IGNhc2UsIHRoZSBjb2RlIHRoYXQgZW5kcyB1cCBpbiBwMm0uYyB3aWxsIGhhdmUgdG8gYmUg
ZW5jbG9zZWQgaW4KQ09ORklHX0hWTS4KCkkgaGF2ZSBmdXJ0aGVyIHBsYW4gdG8gc3BsaXQgY29k
ZSBmcm9tIHAybS5jIHRvIHAybS1odm0uYyBvciBhbGlrZSwgYnV0CnRoYXQgY2FuIHdhaXQgdW50
aWwgeW91IGZpbmlzaCB5b3VyIHBhdGNoZXMuCgpXZWkuCgo+IAo+IFRoYW5rcywKPiBSYXp2YW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
