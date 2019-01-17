From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 0/2] add xl command to get hypervisor .config
Date: Thu, 17 Jan 2019 16:23:31 +0100
Message-ID: <17598871-31d9-2d79-f5f4-2cce3d9e9f56@suse.com>
References: <20190117145722.30311-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yQ28=PZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gk9W3-00043u-KQ
 for xen-devel@lists.xenproject.org; Thu, 17 Jan 2019 15:23:35 +0000
In-Reply-To: <20190117145722.30311-1-jgross@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

T24gMTcvMDEvMjAxOSAxNTo1NywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBBZGQgInhsIGdldC1j
b25maWciIHByaW50aW5nIHRoZSAuY29uZmlnIHVzZWQgdG8gYnVpbGQgdGhlIGN1cnJlbnRseQo+
IHJ1bm5pbmcgaHlwZXJ2aXNvci4KCkJUVzogSSdkIGxpa2UgdG8gaGF2ZSBmZWVkYmFjayBlc3Bl
Y2lhbGx5IGlmIHNvbWVvbmUgdGhpbmtzIHRoaXMgc2VyaWVzCnNob3VsZCBieSBhbnkgbWVhbnMg
YmUgcGFydCBvZiA0LjEyLiBJZiBub3QgSSdsbCBzZW5kIG91dCBWMiB3aXRoCmJ1bXBpbmcgdGhl
IHN5c2N0bCBpbnRlcmZhY2UgdmVyc2lvbi4KCgpKdWVyZ2VuCgo+IAo+IEp1ZXJnZW4gR3Jvc3Mg
KDIpOgo+ICAgeGVuOiBhZGQgaW50ZXJmYWNlIGZvciBvYnRhaW5pbmcgLmNvbmZpZyBmcm9tIGh5
cGVydmlzb3IKPiAgIHRvb2xzOiBhZGQgbmV3IHhsIGNvbW1hbmQgZ2V0LWNvbmZpZyBmb3IgZ2V0
dGluZyBoeXBlcnZpc29yIGNvbmZpZwo+IAo+ICAuZ2l0aWdub3JlICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAyICsrCj4gIGRvY3MvbWFuL3hsLjEucG9kLmluICAgICAgICAgICAgICAgIHwg
IDUgKysrKysKPiAgdG9vbHMvZmxhc2svcG9saWN5L21vZHVsZXMvZG9tMC50ZSAgfCAgMiArLQo+
ICB0b29scy9saWJ4Yy9pbmNsdWRlL3hlbmN0cmwuaCAgICAgICB8ICA4ICsrKysrKysKPiAgdG9v
bHMvbGlieGMvaW5jbHVkZS94ZW5ndWVzdC5oICAgICAgfCAxMyArKysrKysrKysrKysKPiAgdG9v
bHMvbGlieGMveGNfbWlzYy5jICAgICAgICAgICAgICAgfCA0MiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCj4gIHRvb2xzL2xpYnhjL3hnX3ByaXZhdGUuaCAgICAgICAgICAg
IHwgIDQgLS0tLQo+ICB0b29scy9saWJ4bC9saWJ4bC5jICAgICAgICAgICAgICAgICB8IDMwICsr
KysrKysrKysrKysrKysrKysrKysrKysrCj4gIHRvb2xzL2xpYnhsL2xpYnhsLmggICAgICAgICAg
ICAgICAgIHwgIDggKysrKysrKwo+ICB0b29scy94bC94bC5oICAgICAgICAgICAgICAgICAgICAg
ICB8ICAxICsKPiAgdG9vbHMveGwveGxfY21kdGFibGUuYyAgICAgICAgICAgICAgfCAgNSArKysr
Kwo+ICB0b29scy94bC94bF9taXNjLmMgICAgICAgICAgICAgICAgICB8IDIwICsrKysrKysrKysr
KysrKysrKwo+ICB4ZW4vY29tbW9uL01ha2VmaWxlICAgICAgICAgICAgICAgICB8ICA3ICsrKysr
KysKPiAgeGVuL2NvbW1vbi9zeXNjdGwuYyAgICAgICAgICAgICAgICAgfCAxMyArKysrKysrKysr
KysKPiAgeGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oICAgICAgICAgfCAxNiArKysrKysrKysr
KysrKwo+ICB4ZW4vaW5jbHVkZS94ZW4va2VybmVsLmggICAgICAgICAgICB8ICAzICsrKwo+ICB4
ZW4vdG9vbHMvTWFrZWZpbGUgICAgICAgICAgICAgICAgICB8ICA5ICsrKysrKy0tCj4gIHhlbi90
b29scy9iaW4yYy5jICAgICAgICAgICAgICAgICAgIHwgMjggKysrKysrKysrKysrKysrKysrKysr
KysrKwo+ICB4ZW4veHNtL2ZsYXNrL2hvb2tzLmMgICAgICAgICAgICAgICB8ICAzICsrKwo+ICB4
ZW4veHNtL2ZsYXNrL3BvbGljeS9hY2Nlc3NfdmVjdG9ycyB8ICAyICsrCj4gIDIwIGZpbGVzIGNo
YW5nZWQsIDIxNCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgeGVuL3Rvb2xzL2JpbjJjLmMKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
