From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH] libxl: don't enable synthetic timer by
 default
Date: Tue, 7 May 2019 13:37:13 +0000
Message-ID: <5ee6b8de44c64201a554d85b282cf975@AMSPEX02CL03.citrite.net>
References: <20190507133625.11502-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PNGO=TH=citrix.com=prvs=023f6069a=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hO0HU-0006Cv-QD
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 13:37:16 +0000
In-Reply-To: <20190507133625.11502-1-wei.liu2@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFdlaSBMaXUgW21haWx0bzp3ZWku
bGl1MkBjaXRyaXguY29tXQo+IFNlbnQ6IDA3IE1heSAyMDE5IDE0OjM2Cj4gVG86IHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IENjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29t
PjsgSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyBQYXVsIER1cnJhbnQKPiA8
UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+OyBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
Cj4gU3ViamVjdDogW1BBVENIXSBsaWJ4bDogZG9uJ3QgZW5hYmxlIHN5bnRoZXRpYyB0aW1lciBi
eSBkZWZhdWx0Cj4gCj4gSXQgYnJva2UgV2luZG93cyBpbnN0YWxsYXRpb24uIE1vcmUgaW52ZXN0
aWdhdGlvbiBpcyBuZWVkZWQuIERvbid0Cj4gZW5hYmxlIGl0IGJ5IGRlZmF1bHQuCj4gCj4gU2ln
bmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBQ
YXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgoKPiAtLS0KPiBDYzogSWFuIEph
Y2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gQ2M6IFBhdWwgRHVycmFudCA8cGF1
bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KPiAtLS0KPiAgdG9vbHMvbGlieGwvbGlieGxfZG9tLmMgfCAxIC0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfZG9t
LmMgYi90b29scy9saWJ4bC9saWJ4bF9kb20uYwo+IGluZGV4IDg3OWM4MDYxMzkuLmM1Njg1YjA2
MWMgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfZG9tLmMKPiArKysgYi90b29scy9s
aWJ4bC9saWJ4bF9kb20uYwo+IEBAIC0yNjksNyArMjY5LDYgQEAgc3RhdGljIGludCBodm1fc2V0
X3ZpcmlkaWFuX2ZlYXR1cmVzKGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRvbWlkLAo+ICAgICAg
ICAgIGxpYnhsX2JpdG1hcF9zZXQoJmVubGlnaHRlbm1lbnRzLCBMSUJYTF9WSVJJRElBTl9FTkxJ
R0hURU5NRU5UX1RJTUVfUkVGX0NPVU5UKTsKPiAgICAgICAgICBsaWJ4bF9iaXRtYXBfc2V0KCZl
bmxpZ2h0ZW5tZW50cywgTElCWExfVklSSURJQU5fRU5MSUdIVEVOTUVOVF9BUElDX0FTU0lTVCk7
Cj4gICAgICAgICAgbGlieGxfYml0bWFwX3NldCgmZW5saWdodGVubWVudHMsIExJQlhMX1ZJUklE
SUFOX0VOTElHSFRFTk1FTlRfQ1JBU0hfQ1RMKTsKPiAtICAgICAgICBsaWJ4bF9iaXRtYXBfc2V0
KCZlbmxpZ2h0ZW5tZW50cywgTElCWExfVklSSURJQU5fRU5MSUdIVEVOTUVOVF9TVElNRVIpOwo+
ICAgICAgfQo+IAo+ICAgICAgbGlieGxfZm9yX2VhY2hfc2V0X2JpdCh2LCBpbmZvLT51Lmh2bS52
aXJpZGlhbl9lbmFibGUpIHsKPiAtLQo+IDIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
