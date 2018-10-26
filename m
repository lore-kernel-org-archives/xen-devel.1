From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 4/5] tools/dm_depriv: Add first cut RLIMITs
Date: Fri, 26 Oct 2018 17:31:00 +0100
Message-ID: <8a105d33-921c-e33a-06d5-6bb0d780ed76@citrix.com>
References: <20181005165701.28030-1-george.dunlap@citrix.com>
 <20181005165701.28030-4-george.dunlap@citrix.com>
 <23507.7811.731969.357295@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rdbn=ng=citrix.com=prvs=830c459d6=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gG50p-0000la-Vk
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 16:31:04 +0000
In-Reply-To: <23507.7811.731969.357295@mariner.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMjYvMjAxOCAwMzowMiBQTSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gR2VvcmdlIER1bmxh
cCB3cml0ZXMgKCJbUEFUQ0ggNC81XSB0b29scy9kbV9kZXByaXY6IEFkZCBmaXJzdCBjdXQgUkxJ
TUlUcyIpOgo+PiBMaW1pdCB0aGUgYWJpbGl0eSBvZiBhIHBvdGVudGlhbGx5IGNvbXByb21pc2Vk
IFFFTVUgdG8gY29uc3VtZSBzeXN0ZW0KPj4gcmVzb3VyY2VzLiAgS2V5IGxpbWl0czoKPj4gIC0g
UkxJTUlUX0ZTSVpFIChmaWxlIHNpemUpOiAyNTZLaUIKPj4gIC0gUkxJTUlUX05QUk9DIChhZnRl
ciB1aWQgY2hhbmdlcyB0byBhIHVuaXF1ZSB1aWQpCj4gCj4gVGhhbmtzLgo+IAo+PiArc3RhdGlj
IHN0cnVjdCB7Cj4+ICsgICAgaW50IHJlc291cmNlOwo+PiArICAgIHJsaW1fdCBsaW1pdDsKPj4g
K30gcmxpbWl0c1tdID0gewo+PiArI2RlZmluZSBSTElNSVRfRU5UUlkociwgbCkgXAo+PiArICAg
IHsgLnJlc291cmNlID0gciwgLmxpbWl0ID0gbCB9Cj4+ICsgICAgLyogQmlnIGVub3VnaCBmb3Ig
bG9nIGZpbGVzLCBub3QgYmlnIGVub3VnaCBmb3IgYSBEb1MgKi8KPj4gKyAgICBSTElNSVRfRU5U
UlkoUkxJTUlUX0ZTSVpFLCAyNTYqMTAyNCksCj4+ICsKPj4gKyAgICAvKiBTaG91bGRuJ3QgbmVl
ZCBhbnkgb2YgdGhlc2UgKi8KPj4gKyAgICBSTElNSVRfRU5UUlkoUkxJTUlUX05QUk9DLCAwKSwK
Pj4gKyAgICBSTElNSVRfRU5UUlkoUkxJTUlUX0NPUkUsIDApLAo+PiArICAgIFJMSU1JVF9FTlRS
WShSTElNSVRfTVNHUVVFVUUsIDApLAo+PiArICAgIFJMSU1JVF9FTlRSWShSTElNSVRfTE9DS1Ms
IDApLAo+PiArICAgIFJMSU1JVF9FTlRSWShSTElNSVRfTUVNTE9DSywgMCksCj4gCj4gSSB3b3Vs
ZCBoYXZlIGp1c3RpZmllZCB0aGUgdmFsdWVzIHNvIHRoaXMgbG9va2VkIG1vcmUgdGFidWxhci4K
ClN1cmUuCgo+IAo+PiArICAgIC8qIFNldCB2YXJpb3VzICJlYXN5IiBybGltaXRzICovCj4+ICsg
ICAgZm9yIChpID0gMDsgcmxpbWl0c1tpXS5yZXNvdXJjZSAhPSBSTElNSVRfTkxJTUlUUzsgaSsr
KSB7Cj4+ICsgICAgICAgIHN0cnVjdCBybGltaXQgcmxpbTsKPj4gKwo+PiArICAgICAgICBybGlt
LnJsaW1fY3VyID0gcmxpbS5ybGltX21heCA9IHJsaW1pdHNbaV0ubGltaXQ7Cj4+ICsgICAgICAg
IAo+PiArICAgICAgICByID0gc2V0cmxpbWl0KHJsaW1pdHNbaV0ucmVzb3VyY2UsICZybGltKTsK
Pj4gKyAgICAgICAgaWYgKHIgPCAwKSB7Cj4+ICsgICAgICAgICAgICBMT0dFKEVSUk9SLCAiU2V0
dGluZyBybGltaXQgJWQgdG8gJWxsZCBmYWlsZWRcbiIsCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcmxpbWl0c1tpXS5yZXNvdXJjZSwKPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAodW5zaWduZWQgbG9uZyBsb25nKXJsaW1pdHNbaV0ubGltaXQpOwo+
IAo+IEkgdGhpbmsgeW91IG1lYW4gJWxsdSBub3QgJWxsZC4gIFdpdGggdGhhdCBsYXN0IHBvaW50
IGNoYW5nZWQsCj4gCj4gQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRy
aXguY29tPgoKVGhhbmtzLgoKIC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
