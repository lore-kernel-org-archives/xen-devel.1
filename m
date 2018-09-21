From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 6/7] vtd: change lookup_page failure
 semantics
Date: Fri, 21 Sep 2018 10:31:11 +0000
Message-ID: <189fdb937b89444189afe28a9d0c88fe@AMSPEX02CL03.citrite.net>
References: <20180920141149.1643-1-paul.durrant@citrix.com>
 <20180920141149.1643-7-paul.durrant@citrix.com>
 <5BA4C4FE02000078001EA795@prv1-mh.provo.novell.com>
 <97f290771d6d4b6da376e8cf962ce31a@AMSPEX02CL03.citrite.net>
 <5BA4C79902000078001EA7D4@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=i7re=md=citrix.com=prvs=795e8fa7d=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1g3IiQ-0003EI-Nl
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 10:31:14 +0000
In-Reply-To: <5BA4C79902000078001EA7D4@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMjEgU2VwdGVtYmVyIDIwMTggMTE6MjgKPiBUbzog
UGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogS2V2aW4gVGlhbiA8
a2V2aW4udGlhbkBpbnRlbC5jb20+OyB4ZW4tZGV2ZWwgPHhlbi0KPiBkZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZz4KPiBTdWJqZWN0OiBSRTogW1hlbi1kZXZlbF0gW1BBVENIIDYvN10gdnRkOiBj
aGFuZ2UgbG9va3VwX3BhZ2UgZmFpbHVyZQo+IHNlbWFudGljcwo+IAo+ID4+PiBPbiAyMS4wOS4x
OCBhdCAxMjoxOCwgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPiB3cm90ZToKPiA+PiAgLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVs
aWNoQHN1c2UuY29tXQo+ID4+IFNlbnQ6IDIxIFNlcHRlbWJlciAyMDE4IDExOjE3Cj4gPj4gVG86
IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gPj4gQ2M6IEtldmluIFRp
YW4gPGtldmluLnRpYW5AaW50ZWwuY29tPjsgeGVuLWRldmVsIDx4ZW4tCj4gPj4gZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmc+Cj4gPj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCA2
LzddIHZ0ZDogY2hhbmdlIGxvb2t1cF9wYWdlIGZhaWx1cmUKPiA+PiBzZW1hbnRpY3MKPiA+Pgo+
ID4+ID4+PiBPbiAyMC4wOS4xOCBhdCAxNjoxMSwgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPiB3
cm90ZToKPiA+PiA+IENvbW1pdCA0M2QxNjIyYiAidnRkOiBhZGQgbG9va3VwX3BhZ2UgbWV0aG9k
IHRvIGlvbW11X29wcyIgYWRkZWQgYQo+ID4+ID4gbG9va3VwIG1ldGhvZCBpbiB0byB0aGUgVlQt
ZCBJT01NVSBpbXBsZW1lbnRhdGlvbi4KPiA+Pgo+ID4+IFdpdGggdGhpcyBub3QgaGF2aW5nIGdv
bmUgaW4geWV0LCBpcyB0aGVyZSBhbnkgcmVhc29uIG5vdCB0byBtYWtlIHRoZQo+ID4+IGFkanVz
dG1lbnQgcmlnaHQgdGhlcmU/Cj4gPj4KPiA+Cj4gPiBObywgb3RoZXIgdGhhbiB0aGF0IGNvbW1p
dCBoYXZpbmcgYWxsIHRoZSBuZWNlc3NhcnkgYWNrcyBhbmQgdGh1cwo+ID4gcG90ZW50aWFsbHkg
YmVpbmcgY29tbWl0dGVkIHdoaWxzdCBJIHdhcyB3b3JraW5nIG9uIHRoaXMgc2VyaWVzLiBXb3Vs
ZAo+IHlvdQo+ID4gcmF0aGVyIEkgc3VibWl0dGVkIHYxMSBvZiB0aGUgb3RoZXIgc2VyaWVzPwo+
IAo+IEknbSBub3QgZ29pbmcgdG8gaW5zaXN0LCBidXQgaXQgd291bGQgbG9vayBjbGVhbmVyIHRo
YXQgd2F5LiBBTUQgYWNrcyBmb3IKPiB0aGUgZmlyc3Qgb2YgeW91ciBzZXJpZXMgYXJlIHN0aWxs
IHdheSBvdXQgYW55d2F5LCBJJ20gYWZyYWlkLgo+IAoKT2suIFYxMSBjb21pbmcgdXAgdGhlbi4K
CiAgUGF1bAoKPiBKYW4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
