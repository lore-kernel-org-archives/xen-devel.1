From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 31/31] libxl: QEMU startup sync based on
 QMP
Date: Thu, 26 Jul 2018 15:59:29 +0100
Message-ID: <20180726145929.GI2296@perard.uk.xensource.com>
References: <20180601143720.24637-1-anthony.perard@citrix.com>
 <20180601143720.24637-32-anthony.perard@citrix.com>
 <23347.47175.248823.197637@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lvar=kk=citrix.com=prvs=73804be3f=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fihjp-0007e9-Pq
 for xen-devel@lists.xenproject.org; Thu, 26 Jul 2018 14:59:33 +0000
Content-Disposition: inline
In-Reply-To: <23347.47175.248823.197637@mariner.uk.xensource.com>
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

T24gV2VkLCBKdW4gMjcsIDIwMTggYXQgMDU6MTY6MDdQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHYzIDMxLzMxXSBsaWJ4bDogUUVN
VSBzdGFydHVwIHN5bmMgYmFzZWQgb24gUU1QIik6Cj4gPiBUaGlzIGlzIG9ubHkgYWN0aXZhdGVk
IHdoZW4gZG1fcmVzdHJpY3Q9MSwgYXMgZXhwbGFpbmVkIGluIHRoZSBwcmV2aW91cwo+ID4gcGF0
Y2ggImxpYnhsX2RtOiBQcmUtb3BlbiBRTVAgc29ja2V0IGZvciBRRU1VIgo+IC4uLgo+ID4gQEAg
LTE2MDMsMTEgKzE2MDMsMTYgQEAgc3RydWN0IGxpYnhsX19zcGF3bl9zdGF0ZSB7Cj4gPiAgICAg
IGxpYnhsX19zcGF3bl9jb25maXJtX2NiICpjb25maXJtX2NiOwo+ID4gICAgICBsaWJ4bF9fc3Bh
d25fZGV0YWNoZWRfY2IgKmRldGFjaGVkX2NiOwo+ID4gIAo+ID4gKyAgICAvKiBJZiBxbXBfZG9t
aWQgIT0gSU5WQUxJRF9ET01JRCwgdGhlbiBsaWJ4bF9fc3Bhd25fc3Bhd24gd2lsbCBhbHNvIHVz
ZSBRTVAKPiA+ICsgICAgICogdG8gZmluZCBvdXQgd2hlbiB0aGUgcHJvY2VzcyBpcyBzdGFydGVk
ICovCj4gPiArICAgIHVpbnQzMl90IHFtcF9kb21pZDsKPiA+ICsKPiAKPiBJIHRoaW5rIHRoaXMg
aXMgYSBsYXllcmluZyB2aW9sYXRpb24uICBsaWJ4bF9fc3Bhd25fKiBpcyBhIHRoaW5nIGZvcgo+
IGRvdWJsZSBmb3JraW5nIGFuZCBzaG91bGRuJ3Qga25vdyBhYm91dCBxbXAuCgpZZXMsIEkgdGhp
bmsgSSBhZ3JlZSB3aXRoIHRoYXQgbm93LCBhbmQgSSB0aGluayBJIGNhbiBtb3ZlIHRoZSBRTVAK
Y2FsbHMgdG8gbGlieGxfX2RtX3NwYXduXyouCgo+IEkgdGhpbmsgeW91IG5lZWQgdG8KPiBoYW5k
bGUgdGhpcyB0aGUgd2F5IHRoZSB4ZW5zdG9yZSByZWFkaW5lc3MgaXMgaGFuZGxlZC4KClRoYXQg
aXMgd2hhdCBJIGFjdHVhbGx5IHRyaWVkIHRvIGRvLi4uIGJ1dCB0aGUgd2F5IGl0IGlzIGRvbmUg
aXMgd2VpcmQsCmJvdGggbGlieGxfX2RtX3NwYXduXyogYW5kIGxpYnhsX19zcGF3bl8qIGRvIHNv
bWUgc2V0dXAgb2YgeGVuc3RvcmUsIHRoZQpmaXJzdCBvbmUgc2V0dXAgc29tZSBwYXJhbWV0ZXJz
LCBidXQgdGhlIHNlY29uZCBvbmUgZG9lcyBzdGFydCB0aGUKd2F0Y2ggZm9yIGV2ZW50LgoKQW55
d2F5LCBJJ3ZlIG1hbmFnZWQgdG8gbW92ZSB0aGUgUU1QIHN0dWZmIHRvIGxpYnhsX19kbV9zcGF3
bl8qLiBSZXN1bHQKaW4gdjQuCgpUaGFua3MsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
