From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [RFC v4 8/8] drivers/passthrough/arm: Refactor code
 for arm smmu drivers
Date: Tue, 16 Jan 2018 13:40:58 +0000
Message-ID: <73e5624b-daaf-0fc0-051a-b73a232e86e8@linaro.org>
References: <20171219031703.23420-1-sameer.goel@linaro.org>
 <20171219031703.23420-9-sameer.goel@linaro.org>
 <4ddcd633-89e2-3518-810b-4111c9f75ced@caviumnetworks.com>
 <8db2ef47-17fe-e0ca-056e-6245e9788fa4@linaro.org>
 <0d29eec8-78e3-0978-6b43-7d3e083c077d@caviumnetworks.com>
 <dcc5d9dc-ce13-1769-d379-ad83cc3e69ab@linaro.org>
 <dfebfbd3-cef4-4466-45fc-3a46c320a806@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=lndq=el=linaro.org=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ebRUA-0006Q0-Ek
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2018 13:41:06 +0000
Received: by mail-wm0-x243.google.com with SMTP id f3so8759059wmc.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jan 2018 05:41:04 -0800 (PST)
In-Reply-To: <dfebfbd3-cef4-4466-45fc-3a46c320a806@caviumnetworks.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Manish Jaggi <mjaggi@caviumnetworks.com>, Sameer Goel <sameer.goel@linaro.org>, xen-devel@lists.xenproject.org, julien.grall@arm.com
Cc: sstabellini@kernel.org, andre.przywara@linaro.org, shankerd@codeaurora.org
List-Id: xen-devel@lists.xenproject.org

SGkgTWFuaXNoLAoKT24gMTYvMDEvMTggMTM6MjcsIE1hbmlzaCBKYWdnaSB3cm90ZToKPiAKPiAK
PiBPbiAwMS8xNi8yMDE4IDA2OjQ0IFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Cj4+Cj4+IE9u
IDE2LzAxLzE4IDEyOjQwLCBNYW5pc2ggSmFnZ2kgd3JvdGU6Cj4+PiBIaSBKdWxpZW4sCj4+Cj4+
IEhpLAo+Pgo+Pj4gT24gMDEvMTYvMjAxOCAwMjoxMSBBTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+
Pj4+Cj4+Pj4KPj4+PiBPbiAwMS8wMy8yMDE4IDA1OjM0IEFNLCBNYW5pc2ggSmFnZ2kgd3JvdGU6
Cj4+Pj4+IEhpIFNhbWVlciwKPj4+Pgo+Pj4+IEhpIE1hbmlzaCwKPj4+Pgo+Pj4+Pj4gK8KgwqDC
oCB1bnNpZ25lZCBpbnTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHR5cGU7Cj4+Pj4+PiArCj4+Pj4+
PiArwqDCoMKgIC8qIER1bW15IGNvbXBhdGliaWxpdHkgZGVmaW5lcyAqLwo+Pj4+Pj4gK8KgwqDC
oCB1bnNpZ25lZCBsb25nIHBnc2l6ZV9iaXRtYXA7Cj4+Pj4+PiArwqDCoMKgIHN0cnVjdCBpb21t
dV9kb21haW5fZ2VvbWV0cnkgZ2VvbWV0cnk7Cj4+Pj4+PiArCj4+Pj4+PiArwqDCoMKgIGF0b21p
Y190IHJlZjsKPj4+Pj4+ICvCoMKgwqAgLyogVXNlZCB0byBsaW5rIGlvbW11X2RvbWFpbiBjb250
ZXh0cyBmb3IgYSBzYW1lIGRvbWFpbi4KPj4+Pj4+ICvCoMKgwqDCoCAqIFRoZXJlIGlzIGF0IGxl
YXN0IG9uZSBwZXItU01NVSB0byB1c2VkIGJ5IHRoZSBkb21haW4uCj4+Pj4+PiArwqDCoMKgwqAg
Ki8KPj4+Pj4+ICvCoMKgwqAgc3RydWN0IGxpc3RfaGVhZMKgwqDCoMKgwqDCoMKgIGxpc3Q7Cj4+
Pj4+PiArfTsKPj4+Pj4+ICsKPj4+Pj4+ICsvKiBYZW46IERlc2NyaWJlcyBpbmZvcm1hdGlvbiBy
ZXF1aXJlZCBmb3IgYSBYZW4gZG9tYWluICovCj4+Pj4+PiArc3RydWN0IGFybV9zbW11X3hlbl9k
b21haW4gewo+Pj4+Pj4gK8KgwqDCoCBzcGlubG9ja190wqDCoMKgwqDCoMKgwqDCoMKgIGxvY2s7
Cj4+Pj4+PiArwqDCoMKgIC8qIExpc3Qgb2YgaW9tbXUgZG9tYWlucyBhc3NvY2lhdGVkIHRvIHRo
aXMgZG9tYWluICovCj4+Pj4+PiArwqDCoMKgIHN0cnVjdCBsaXN0X2hlYWTCoMKgwqDCoMKgwqDC
oCBjb250ZXh0czsKPj4+Pj4gQ291bGQgd2UgdXNlIGEgbW9yZSB2ZXJib3NlIG5hbWUsIEhvdyBh
Ym91dCAKPj4+Pj4gJXMvY29udGV4dHMvaW9tbXVfZG9tYWluX2NvbnRleHRzL2cgPwo+Pj4+Cj4+
Pj4gSG93IGFib3V0IGEgbXVjaCBtb3JlIHZlcmJvc2UgbmFtZS4uLj8gVGhpcyBuYW1lIGlzIDIx
IGxldHRlcnMgYW5kIAo+Pj4+IHRoYXQncyBvbmx5IGZvciB0aGUgZmllbGQuIEp1c3QgaW1hZ2lu
ZSB3aXRoIHRoZSB2YXJpYWJsZSBuYW1lIAo+Pj4+IGJlZm9yZSBhbmQgYSBjb3VwbGUgb2YgaW5k
ZW50YXRpb24uCj4+PiBIb3cgYWJvdXQgaW9fY29udGV4dD8gYW55dGhpbmcgd2hpY2ggbWFrZXMg
aXQgbW9yZSB2ZXJib3NlIGlzIG9rIHdpdGggCj4+PiBtZS4KPj4KPj4gSSBtdWNoIHByZWZlciB0
byBzdGljayB3aXRoICJjb250ZXh0cyIuCj4gSSBhbSBub3QgYWJsZSB0byB1bmRlcnN0YW5kIHdo
eSB0byB1c2UgY29udGV4dHMgZm9yIGEgbGlzdCB3aGljaCBoYXMgCj4gaW9tbXVfZG9tYWluIHBv
aW50ZXJzLgoKQmVjYXVzZSB0aGUgY29tbWVudCBzaG91bGQgaGF2ZSBiZWVuIHJlYWQgImlvbW11
X2RvbWFpbiBjb250ZXh0Ii4gQXMgaXQgCmlzIGluIG90aGVyIGRlc2NyaXB0aW9uLgoKPiBJZiB5
b3UgYXJlIG9rIHdpdGggdGhpcyBsb2dpYywgd2UgY2FuIHJlbmFtZSBhbGwgaW9tbXVfZG9tYWlu
IHBvaW50ZXIgCj4gdmFyaWFibGVzIGluIHRoaXMgZmlsZSBhcyBjb250ZXh0LgoKV2h5IGRvIHlv
dSBrZWVwIGFza2luZyByZW5hbWluZyB3aGVuIEkgY2xlYXJseSBzYWlkIG11bHRpcGxlIHRpbWUg
dGhhdCAKd2UgKnNob3VsZCBub3QqIHJlbmFtZSBhbnkgY29kZSBjb21pbmcgZnJvbSBMaW51eC4g
VGhpcyBpcyBicmVha2luZyB0aGUgCmlkZWEgb2Yga2VlcGluZyBYZW4gYW5kIExpbnV4IFNNTVUg
ZHJpdmVyIGNsb3NlLgoKSWYgeW91IGRvbid0IHdhbnQgdG8gZ2V0IFNNTVV2MyBjbG9zZSB0byBM
aW51eC4gVGhlbiBmaW5lLCBidXQgaXQgbWVhbnMgCnlvdSBoYXZlIHRvIHVzZSBYZW4gY29kaW5n
IHN0eWxlIGFuZCBkcm9wcGluZyBhbGwgbmVjZXNzYXJ5IGNvZGUuCgpCdXQgSSBhbSBhZnJhaWQg
dGhpcyBpcyBub3QgdGhlIHNvbHV0aW9uIEkgKGFuZCBBRkFJSyBTdGVmYW5vKSBwcmVmZXIgCmJl
Y2F1c2UgaXQgYWRkcyBidXJkZW4gb24gbWFpbnRlbmFuY2Ugb24gWGVuIGNvbW11bml0eS4KCkNo
ZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
