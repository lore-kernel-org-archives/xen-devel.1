From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] tools/libfsimage: Set soname to 4.12 not
 0.4.12
Date: Mon, 15 Oct 2018 18:24:00 +0100
Message-ID: <98b0aa7f-2764-3fab-2995-3828cec7cfd9@citrix.com>
References: <20181015152306.4613-1-ian.jackson@eu.citrix.com>
 <f2192c33-39b7-09d9-8772-f024884bc22c@citrix.com>
 <23492.52038.194767.361454@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jk3i=m3=citrix.com=prvs=819f8eea0=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gC6b5-0004bG-Rq
 for xen-devel@lists.xenproject.org; Mon, 15 Oct 2018 17:24:03 +0000
In-Reply-To: <23492.52038.194767.361454@mariner.uk.xensource.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMTAvMTggMTg6MTUsIElhbiBKYWNrc29uIHdyb3RlOgo+IEFuZHJldyBDb29wZXIgd3Jp
dGVzICgiUmU6IFtQQVRDSF0gdG9vbHMvbGliZnNpbWFnZTogU2V0IHNvbmFtZSB0byA0LjEyIG5v
dCAwLjQuMTIiKToKPj4gVGhlIHByZXZhaWxpbmcgc3R5bGUgaXM6Cj4+Cj4+IE1BSk9SID0gNC4x
Mgo+PiBNSU5PUiA9IDAKPj4KPj4gd2hpY2ggaXMgdXNlZCBieSBhbGwgb3RoZXIgbGlicmFyaWVz
Lgo+IEVyciwgc29ycnkuCj4KPiBGcm9tIDNkNWQ0M2ZhOGEyM2I2M2VjZDVhYmFmMGZmY2JkZGNl
YzgzMDZhZjIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gRnJvbTogSWFuIEphY2tzb24gPGlh
bi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwo+IENjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KPiBDYzog
V2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiBEYXRlOiBNb24sIDE1IE9jdCAyMDE4IDE2
OjIwOjI2ICswMTAwCj4gU3ViamVjdDogW1BBVENIIHYyXSB0b29scy9saWJmc2ltYWdlOiBTZXQg
c29uYW1lIHRvIDQuMTIgbm90IDAuNC4xMgo+Cj4gVGhpcyB3YXMgc2V0IHRvIDAuNC4xMiBieSBh
Y2NpZGVudCBpbgo+ICAgYzY5YTZhY2E4NTIyYzdmNjc2OTUzZTU2MTkxNTg0MzgxYWRmMmMwNgo+
ICAgdG9vbHMvbGliZnNpbWFnZTogQnVtcCBzb25hbWUgdG8gNC4xMgo+Cj4gVGhlIGV4dHJhIDAu
IGlzIGhhcm1sZXNzIGJ1dCB1Z2x5LiAgV2Ugc2hvdWxkIGJlIHNvbWV3aGF0IGNvbnNpc3RlbnQu
Cj4KPiBSZXBvcnRlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KPiBTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNv
bT4KClJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PgoKPiAtLS0KPiB2MjogVXNlIGNvbnZlbnRpb25hbCBNQUpPUj00LjEyIE1JTk9SPTAKPiAtLS0K
PiAgdG9vbHMvbGliZnNpbWFnZS9jb21tb24vTWFrZWZpbGUgfCA0ICsrLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS90
b29scy9saWJmc2ltYWdlL2NvbW1vbi9NYWtlZmlsZSBiL3Rvb2xzL2xpYmZzaW1hZ2UvY29tbW9u
L01ha2VmaWxlCj4gaW5kZXggZjIwZTEzOTRhOC4uYjlmYjE1ZmNhZCAxMDA2NDQKPiAtLS0gYS90
b29scy9saWJmc2ltYWdlL2NvbW1vbi9NYWtlZmlsZQo+ICsrKyBiL3Rvb2xzL2xpYmZzaW1hZ2Uv
Y29tbW9uL01ha2VmaWxlCj4gQEAgLTEsOCArMSw4IEBACj4gIFhFTl9ST09UID0gJChDVVJESVIp
Ly4uLy4uLy4uCj4gIGluY2x1ZGUgJChYRU5fUk9PVCkvdG9vbHMvbGliZnNpbWFnZS9SdWxlcy5t
awo+ICAKPiAtTUFKT1IgPSAwCj4gLU1JTk9SID0gNC4xMgo+ICtNQUpPUiA9IDQuMTIKPiArTUlO
T1IgPSAwCj4gIAo+ICBMREZMQUdTLSQoQ09ORklHX1N1bk9TKSA9IC1XbCwtTSAtV2wsbWFwZmls
ZS1TdW5PUwo+ICBMREZMQUdTLSQoQ09ORklHX0xpbnV4KSA9IC1XbCxtYXBmaWxlLUdOVQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
