From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 4/5] tools/dm_depriv: Add first cut RLIMITs
Date: Fri, 26 Oct 2018 15:02:43 +0100
Message-ID: <23507.7811.731969.357295@mariner.uk.xensource.com>
References: <20181005165701.28030-1-george.dunlap@citrix.com>
 <20181005165701.28030-4-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=yj2z=ng=citrix.com=prvs=83038c4c6=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gG2hs-0000Ff-Qp
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 14:03:20 +0000
In-Reply-To: <20181005165701.28030-4-george.dunlap@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJbUEFUQ0ggNC81XSB0b29scy9kbV9kZXByaXY6IEFkZCBm
aXJzdCBjdXQgUkxJTUlUcyIpOgo+IExpbWl0IHRoZSBhYmlsaXR5IG9mIGEgcG90ZW50aWFsbHkg
Y29tcHJvbWlzZWQgUUVNVSB0byBjb25zdW1lIHN5c3RlbQo+IHJlc291cmNlcy4gIEtleSBsaW1p
dHM6Cj4gIC0gUkxJTUlUX0ZTSVpFIChmaWxlIHNpemUpOiAyNTZLaUIKPiAgLSBSTElNSVRfTlBS
T0MgKGFmdGVyIHVpZCBjaGFuZ2VzIHRvIGEgdW5pcXVlIHVpZCkKClRoYW5rcy4KCj4gK3N0YXRp
YyBzdHJ1Y3Qgewo+ICsgICAgaW50IHJlc291cmNlOwo+ICsgICAgcmxpbV90IGxpbWl0Owo+ICt9
IHJsaW1pdHNbXSA9IHsKPiArI2RlZmluZSBSTElNSVRfRU5UUlkociwgbCkgXAo+ICsgICAgeyAu
cmVzb3VyY2UgPSByLCAubGltaXQgPSBsIH0KPiArICAgIC8qIEJpZyBlbm91Z2ggZm9yIGxvZyBm
aWxlcywgbm90IGJpZyBlbm91Z2ggZm9yIGEgRG9TICovCj4gKyAgICBSTElNSVRfRU5UUlkoUkxJ
TUlUX0ZTSVpFLCAyNTYqMTAyNCksCj4gKwo+ICsgICAgLyogU2hvdWxkbid0IG5lZWQgYW55IG9m
IHRoZXNlICovCj4gKyAgICBSTElNSVRfRU5UUlkoUkxJTUlUX05QUk9DLCAwKSwKPiArICAgIFJM
SU1JVF9FTlRSWShSTElNSVRfQ09SRSwgMCksCj4gKyAgICBSTElNSVRfRU5UUlkoUkxJTUlUX01T
R1FVRVVFLCAwKSwKPiArICAgIFJMSU1JVF9FTlRSWShSTElNSVRfTE9DS1MsIDApLAo+ICsgICAg
UkxJTUlUX0VOVFJZKFJMSU1JVF9NRU1MT0NLLCAwKSwKCkkgd291bGQgaGF2ZSBqdXN0aWZpZWQg
dGhlIHZhbHVlcyBzbyB0aGlzIGxvb2tlZCBtb3JlIHRhYnVsYXIuCgo+ICsgICAgLyogU2V0IHZh
cmlvdXMgImVhc3kiIHJsaW1pdHMgKi8KPiArICAgIGZvciAoaSA9IDA7IHJsaW1pdHNbaV0ucmVz
b3VyY2UgIT0gUkxJTUlUX05MSU1JVFM7IGkrKykgewo+ICsgICAgICAgIHN0cnVjdCBybGltaXQg
cmxpbTsKPiArCj4gKyAgICAgICAgcmxpbS5ybGltX2N1ciA9IHJsaW0ucmxpbV9tYXggPSBybGlt
aXRzW2ldLmxpbWl0Owo+ICsgICAgICAgIAo+ICsgICAgICAgIHIgPSBzZXRybGltaXQocmxpbWl0
c1tpXS5yZXNvdXJjZSwgJnJsaW0pOwo+ICsgICAgICAgIGlmIChyIDwgMCkgewo+ICsgICAgICAg
ICAgICBMT0dFKEVSUk9SLCAiU2V0dGluZyBybGltaXQgJWQgdG8gJWxsZCBmYWlsZWRcbiIsCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBybGltaXRzW2ldLnJlc291cmNlLAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHVuc2lnbmVkIGxvbmcgbG9uZyly
bGltaXRzW2ldLmxpbWl0KTsKCkkgdGhpbmsgeW91IG1lYW4gJWxsdSBub3QgJWxsZC4gIFdpdGgg
dGhhdCBsYXN0IHBvaW50IGNoYW5nZWQsCgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGV1LmNpdHJpeC5jb20+CgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
