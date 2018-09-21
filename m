From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v5 1/5] x86/mem_access: put
 p2m_{get/set}_suppress_ve under CONFIG_HVM
Date: Fri, 21 Sep 2018 19:48:24 +0300
Message-ID: <1c5975fc-141d-48a6-e666-bb4593e1f343@bitdefender.com>
References: <cover.147d0f0e643da1e63074fd4940f98b9ad458396a.1537545258.git-series.wei.liu2@citrix.com>
 <645582bae3826048a61ba2162c1539f580847f13.1537545258.git-series.wei.liu2@citrix.com>
 <e89abfdc-c6ee-9075-6470-4a0e6484d876@bitdefender.com>
 <20180921160317.6ghpo3e5arpuexfj@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qbiu=md=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1g3Obc-0002Wi-9f
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 16:48:36 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id BD368305FFA7
 for <xen-devel@lists.xenproject.org>; Fri, 21 Sep 2018 19:48:33 +0300 (EEST)
Received: from smtp02.buh.bitdefender.net (smtp.bitdefender.biz [10.17.80.76])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id B06A97FC21
 for <xen-devel@lists.xenproject.org>; Fri, 21 Sep 2018 19:48:33 +0300 (EEST)
In-Reply-To: <20180921160317.6ghpo3e5arpuexfj@zion.uk.xensource.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gOS8yMS8xOCA3OjAzIFBNLCBXZWkgTGl1IHdyb3RlOgo+IE9uIEZyaSwgU2VwIDIxLCAyMDE4
IGF0IDA2OjU3OjM5UE0gKzAzMDAsIFJhenZhbiBDb2pvY2FydSB3cm90ZToKPj4gT24gOS8yMS8x
OCA2OjU0IFBNLCBXZWkgTGl1IHdyb3RlOgo+Pj4gVGhleSBhcmUgdXNlZCBieSBIVk0gY29kZSBv
bmx5Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+
Cj4+PiAtLS0KPj4+IHY1OiBuZXcKPj4+IC0tLQo+Pj4gIHhlbi9hcmNoL3g4Ni9tbS9tZW1fYWNj
ZXNzLmMgfCAyICsrCj4+PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jIGIveGVuL2FyY2gveDg2
L21tL21lbV9hY2Nlc3MuYwo+Pj4gaW5kZXggMjIxN2JkYS4uODI2YzM1ZiAxMDA2NDQKPj4+IC0t
LSBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMKPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9t
bS9tZW1fYWNjZXNzLmMKPj4+IEBAIC01MDEsNiArNTAxLDcgQEAgdm9pZCBhcmNoX3AybV9zZXRf
YWNjZXNzX3JlcXVpcmVkKHN0cnVjdCBkb21haW4gKmQsIGJvb2wgYWNjZXNzX3JlcXVpcmVkKQo+
Pj4gICAgICB9Cj4+PiAgfQo+Pj4gIAo+Pj4gKyNpZmRlZiBDT05GSUdfSFZNCj4+PiAgLyoKPj4+
ICAgKiBTZXQvY2xlYXIgdGhlICNWRSBzdXBwcmVzcyBiaXQgZm9yIGEgcGFnZS4gIE9ubHkgYXZh
aWxhYmxlIG9uIFZNWC4KPj4+ICAgKi8KPj4+IEBAIC02MDAsNiArNjAxLDcgQEAgaW50IHAybV9n
ZXRfc3VwcHJlc3NfdmUoc3RydWN0IGRvbWFpbiAqZCwgZ2ZuX3QgZ2ZuLCBib29sICpzdXBwcmVz
c192ZSwKPj4+ICAKPj4+ICAgICAgcmV0dXJuIDA7Cj4+PiAgfQo+Pj4gKyNlbmRpZgo+Pj4gIAo+
Pj4gIC8qCj4+PiAgICogTG9jYWwgdmFyaWFibGVzOgo+Pgo+PiBIZWxsbyBXZWksCj4+Cj4+IEkg
YW0gd29ya2luZyBvbiBtb3ZpbmcgdGhlc2UgZnVuY3Rpb25zIHRvIHAybS5jIChidXQgd2FpdGlu
ZyBmb3IKPj4gR2VvcmdlJ3MgcmVwbHkgb24gdGhlIFZNWCAjVkUgY2hlY2tzKSwgc28gaWYgeW91
J2QgbGlrZSAtIGFuZCBmZWVsCj4+IHRoYXQncyBhcHByb3ByaWF0ZSAtIEkgY2FuIGFsc28gcHV0
IHRoYXQgY29kZSB1bmRlciBDT05GSUdfSFZNIGluIHRoZQo+PiBjbGVhbnVwIHBhdGNoLiBJcyB0
aGF0IHNvbWV0aGluZyB5b3UnZCBiZSBpbnRlcmVzdGVkIGluPwo+IAo+IFRoYXQgd291bGQgYmUg
ZmluZSBieSBtZSwgYnV0IC4uLgo+IAo+Pgo+PiBPdGhlcndpc2UsIEFja2VkLWJ5OiBSYXp2YW4g
Q29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+LCBhbmQKPj4gSSdsbCBtb3ZlIHRo
ZSBuZXcgY29kZSBhcyB3ZWxsLgo+Pgo+IAo+IHNpbmNlIHlvdSBhY2sgdGhpcywgSSBtaWdodCBh
cyB3ZWxsIGp1c3QgY29tbWl0IHRoaXMgcGF0Y2ggc28geW91IGNhbgo+IHJlYmFzZS4KPiAKPiBJ
biBhbnkgY2FzZSwgdGhlIGNvZGUgdGhhdCBlbmRzIHVwIGluIHAybS5jIHdpbGwgaGF2ZSB0byBi
ZSBlbmNsb3NlZCBpbgo+IENPTkZJR19IVk0uCj4gCj4gSSBoYXZlIGZ1cnRoZXIgcGxhbiB0byBz
cGxpdCBjb2RlIGZyb20gcDJtLmMgdG8gcDJtLWh2bS5jIG9yIGFsaWtlLCBidXQKPiB0aGF0IGNh
biB3YWl0IHVudGlsIHlvdSBmaW5pc2ggeW91ciBwYXRjaGVzLgoKT0ssIG5vIHByb2JsZW0uCgoK
VGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
