From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 04/31] libxl_json: fix build with
 DEBUG_ANSWER
Date: Tue, 17 Jul 2018 15:35:34 +0100
Message-ID: <20180717143534.GC2296@perard.uk.xensource.com>
References: <20180601143720.24637-1-anthony.perard@citrix.com>
 <20180601143720.24637-5-anthony.perard@citrix.com>
 <23347.40384.780404.583695@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=aybx=kb=citrix.com=prvs=729278747=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ffR5E-0003HP-KT
 for xen-devel@lists.xenproject.org; Tue, 17 Jul 2018 14:36:08 +0000
Content-Disposition: inline
In-Reply-To: <23347.40384.780404.583695@mariner.uk.xensource.com>
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

T24gV2VkLCBKdW4gMjcsIDIwMTggYXQgMDM6MjI6NTZQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHYzIDA0LzMxXSBsaWJ4bF9qc29u
OiBmaXggYnVpbGQgd2l0aCBERUJVR19BTlNXRVIiKToKPiA+IFNpZ25lZC1vZmYtYnk6IEFudGhv
bnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+IAo+IEFja2VkLWJ5OiBJYW4g
SmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KPiAKPiBBbHRob3VnaCwKPiAKPiA+
ICAgICAgICAgIHlhamxfZ2VuX2dldF9idWYoKHlhamxfY3R4KS0+ZywgJmJ1ZiwgJmxlbik7IFwK
PiA+IC0gICAgICAgIExJQlhMX19MT0cobGlieGxfX2djX293bmVyKCh5YWpsX2N0eCktPmdjKSwg
TElCWExfX0xPR19ERUJVRywKPiA+IC0JCSAgICJyZXNwb25zZTpcbiIsIGJ1Zik7IFwKPiA+ICsg
ICAgICAgIExJQlhMX19MT0cobGlieGxfX2djX293bmVyKCh5YWpsX2N0eCktPmdjKSwgWFRMX0RF
QlVHLCBcCj4gPiArCQkgICAicmVzcG9uc2U6ICVzXG4iLCBidWYpOyBcCj4gCj4gSSdtIG5vdCBz
dXJlIHdoeSB5b3UgY2hhbmdlZCBMSUJYTF9fTE9HX0RFQlVHIHRvIFhUTF9ERUJVRy4gIEl0IHdv
dWxkCgpJJ20gbm90IHN1cmUgZWl0aGVyLgoKPiBiZSBuaWNlIHRvIG1lbnRpb24gaXQgaW4gdGhl
IGNvbW1pdCBtZXNzYWdlLiAgUGVyc29uYWxseSBJIHdvdWxkCj4gcHJlZmVyIGl0IGJlY2F1c2Ug
KGkpIGl0J3Mgc2hvcnRlciAoaWkpIHdlJ3JlIG5vdCBsaWtlbHkgdG8gd2FudCB0bwo+IGRlY291
cGxlIHRoZSBsaWJ4bCBsb2cgbGV2ZWxzIGZyb20gdGhlIFhUTCBvbmVzIChpaWkpIGlmIHdlIGRv
LCBpbiB0aGUKPiBmdXR1cmUsIGl0IHdpbGwgYmUgYW4gZWFzeSBzZWFyY2gtYW5kLXJlcGxhY2Uu
CgpPaywgSSdsbCBrZWVwIHRoZSBjaGFuZ2UsIGFuZCBhZGQgdG8gdGhlIGNvbW1pdCBtZXNzYWdl
OgogIEFsc28gcmVwbGFjZSBMSUJYTF9fTE9HX0RFQlVHIGJ5IFhUTF9ERUJVRywgYmVjYXVzZSBp
dCdzIHNob3J0ZXIgYW5kCiAgbW9yZSBvZnRlbiB1c2VkIGluIGxpYnhsLgoKLS0gCkFudGhvbnkg
UEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
