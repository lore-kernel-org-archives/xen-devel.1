From: Juergen Gross <jgross@suse.com>
Subject: Re: Scheduling and the periodic timer
Date: Fri, 1 Feb 2019 10:52:27 +0100
Message-ID: <0fd9ec83-8113-0fda-9833-2755941f3440@suse.com>
References: <2c71ac06-9d04-475b-30bc-9f87c906391a@suse.com>
 <4a891a96-c2a4-0598-eb0c-0759cbcb8f1c@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ulZE=QI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gpVUs-0001SA-MX
 for xen-devel@lists.xenproject.org; Fri, 01 Feb 2019 09:52:30 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C6AD6AED8
 for <xen-devel@lists.xenproject.org>; Fri,  1 Feb 2019 09:52:27 +0000 (UTC)
In-Reply-To: <4a891a96-c2a4-0598-eb0c-0759cbcb8f1c@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDIvMjAxOSAxMDo0MCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwMS8wMi8yMDE5
IDA3OjI2LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBXaGlsZSB3b3JraW5nIG9uIG15IGNvcmUg
c2NoZWR1bGluZyBzZXJpZXMgSSBzdHVtYmxlZCBvdmVyIHRoZSBwZXJpb2RpYwo+PiB0aW1lci4g
Q291bGQgaXQgYmUgdGhpcyB0aW1lciBuZXZlciB3b3JrZWQgY29ycmVjdGx5Pwo+Pgo+PiBXaGVu
IHRoZSB2Y3B1IHdpdGggYW4gYWN0aXZlIHBlcmlvZGljIHRpbWVyIGlzIHJ1bm5pbmcgZXZlcnl0
aGluZyBzZWVtcwo+PiB0byBiZSBmaW5lLiBCdXQgd2hlbiBub3QgcnVubmluZyB0aGUgdGltZXIg
aXMgc3RvcHBlZCBpbiBzY2hlZHVsZSgpLiBTbwo+PiBhIHZjcHUgZ29pbmcgdG8gaWRsZSByZWx5
aW5nIHRvIGJlIHdva2VuIHVwIGJ5IHRoZSBwZXJpb2RpYyB0aW1lciB3aWxsCj4+IHJlbWFpbiBz
bGVlcGluZyB1bnRpbCBhbm90aGVyIGV2ZW50IGlzIGhhcHBlbmluZy4gVGhlIHBlcmlvZGljIHRp
bWVyCj4+IHdvbid0IGZpcmUgYXMgaXQgaXMgc3RvcHBlZC4KPj4KPj4gVGhlIHBlcmlvZGljIHRp
bWVyIGlzIHVzZWQgdmlhIFZDUFVPUF9zZXRfcGVyaW9kaWNfdGltZXIgb25seSwgYW5kCj4+IHRv
ZGF5J3MgTGludXgga2VybmVsIGlzbid0IHVzaW5nIGl0IGF0IGFsbC4gU28gSSBndWVzcyB0aGlz
IHRpbWVyIG5vdAo+PiByZWFsbHkgd29ya2luZyBhcyBpdCBzaG91bGQgaXMgbm8gYmlnIGlzc3Vl
Lgo+Pgo+PiBJIGp1c3Qgd2FudGVkIHRvIG1lbnRpb24gdGhhdCBmYWN0LCBtYXliZSBzb21lb25l
IGlzIGtlZW4gcmVwYWlyaW5nCj4+IHRoaXMgaXNzdWUuCj4gCj4gRG8geW91IG1lYW4gdG8gc2F5
IHRoYXQsIGFmdGVyIHRoZSBuZXh0IHNjaGVkdWxlKCksIGFueSBjb25maWd1cmVkCj4gcGVyaW9k
aWMgdGltZXIgY2Vhc2VzIHRvIHByb3ZpZGUgZnVydGhlciBpbnRlcnJ1cHRzPwoKTm8sIGl0IGp1
c3Qgd29uJ3Qgd2FrZSB0aGUgdmNwdSB1cC4gQXMgc29vbiBhcyB0aGUgdmNwdSBpcyBydW5uaW5n
IHRoZQp0aW1lciB3aWxsIHJ1biBhZ2FpbiBhbmQgaXQgd2lsbCBwcm92aWRlIGludGVycnVwdHMg
YWdhaW4uIEluIGNhc2UgYW4KaW50ZXJydXB0IHdhcyBkdWUgZHVyaW5nIHRoZSB2Y3B1IHdhcyBu
b3QgcnVubmluZyB0aGF0IGludGVycnVwdCB3aWxsCmJlIGRlbGl2ZXJlZCBhcyBzb29uIGFzIHRo
ZSB2Y3B1IHN0YXJ0cyBydW5uaW5nIGFnYWluLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
