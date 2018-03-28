From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] docs/qemu-deprivilege: Revise and update
 with status and future plans
Date: Wed, 28 Mar 2018 14:26:48 +0100
Message-ID: <bc8ab22b-2892-abd8-28a6-070e6a7cfb7d@citrix.com>
References: <20180322182437.936-1-george.dunlap@citrix.com>
 <23225.8997.574938.415857@mariner.uk.xensource.com>
 <9d0db792-4628-59e2-b4ed-21ec46a95997@citrix.com>
 <620d8295-c6de-7b32-9ef3-597c99f8b1eb@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vx8j=gs=citrix.com=prvs=618bed39e=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1f1B8S-0005QK-FP
 for xen-devel@lists.xenproject.org; Wed, 28 Mar 2018 13:29:04 +0000
In-Reply-To: <620d8295-c6de-7b32-9ef3-597c99f8b1eb@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ross Lagerwall <ross.lagerwall@citrix.com>, Ian Jackson <ian.jackson@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMjgvMjAxOCAwMToyOCBQTSwgUm9zcyBMYWdlcndhbGwgd3JvdGU6Cj4gT24gMDMvMjcv
MjAxOCAxMToyMSBBTSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4gT24gMDMvMjYvMjAxOCAwNTo0
MyBQTSwgSWFuIEphY2tzb24gd3JvdGU6Cj4+Pj4gKyMjIyBOZXR3b3JrCj4+Pj4gwqAgK0lmIFFF
TVUgcnVucyBpbiBpdHMgb3duIG5ldHdvcmsgbmFtZXNwYWNlLCBpdCBjYW4ndCBvcGVuIHRoZSB0
YXAKPj4+PiArZGV2aWNlIGl0c2VsZiBiZWNhdXNlIHRoZSBpbnRlcmZhY2Ugd29uJ3QgYmUgdmlz
aWJsZSBvdXRzaWRlIG9mIGl0cwo+Pj4+ICtvd24gbmFtZXNwYWNlLiBTbyBpbnN0ZWFkLCBoYXZl
IHRoZSB0b29sc3RhY2sgb3BlbiB0aGUgZGV2aWNlIGFuZCBwYXNzCj4+Pj4gK2l0IGFzIGFuIGZk
IG9uIHRoZSBjb21tYW5kLWxpbmU6Cj4+Pgo+Pj4gSSB0aGluayB0aGlzIGNvdWxkIGJlIHNvbHZl
ZCBieSBkb2luZyB0aGVzZSB0aGluZ3MgaW4gYSBkaWZmZXJlbnQKPj4+IG9yZGVyLgo+Pgo+PiBS
b3NzLCBkbyB5b3UgaGF2ZSBhIHJlZmVyZW5jZSBmb3IgdGhlIHFlbXUtZGV2ZWwgZGlzY3Vzc2lv
biB3aGVyZSB0aGV5Cj4+IHJlamVjdGVkIHRoZSBwYXRjaGVzIHRvIGhhdmUgUUVNVSByZXN0cmlj
dCB0aGUgbmFtZXNwYWNlcz8KPj4KPiAKPiBUaGUgdGhyZWFkIHN0YXJ0cyBoZXJlOgo+IGh0dHBz
Oi8vbGlzdHMuZ251Lm9yZy9hcmNoaXZlL2h0bWwvcWVtdS1kZXZlbC8yMDE3LTEwL21zZzA0Njc0
Lmh0bWwKClRoYW5rcy4gIFRoZSBrZXkgb2JqZWN0aW9uIHNlZW1zIHRvIGJlIHRoYXQgdGhpbmdz
IG9uIHRoZSBjb21tYW5kLWxpbmUKd2lsbCBiZWhhdmUgZGlmZmVyZW50bHkgdGhhbiBzdWJzZXF1
ZW50IGNvbW1hbmRzIHNlbnQgb3ZlciBRTVAuICBCdXQgb2YKY291cnNlLCB0aGF0J3MgZXhhY3Rs
eSB0aGUgcG9pbnQuIDotKSAgQW5kIGFzIHlvdSBwb2ludGVkIG91dCBpbiB0aGF0CnRocmVhZCwg
aXQncyBubyBkaWZmZXJlbnQgdGhhbiBjaHJvb3QuCgpJdCBpcyBzdWJvcHRpbWFsIHRvIGhhdmUg
UU1QIGNvbW1hbmRzIHJldHVybiAnc3VjY2Vzcycgd2hlbiB0aGV5IGRvbid0CmFjdHVhbGx5IGhh
dmUgYW55IGVmZmVjdDsgc28gYSBiZXR0ZXIgaW50ZXJmYWNlIHdvdWxkIGJlIHRvIGFycmFuZ2Ug
dGhhdAphbGwgUU1QIGNvbW1hbmRzIHVzZSBhbiB1bnNoYXJlZCBuYW1lc3BhY2UgZmFpbC4KClRo
YXQgc2FpZCwgYXJjaGl0ZWN0dXJhbGx5LCBkb2luZyBhcyBtdWNoIG9mIHRoZSByZXN0cmljdGlv
biBiZWZvcmUKZXhlYydpbmcgUUVNVSBzZWVtcyBhIGxvdCBjbGVhbmVyIHRvIG1lLgoKIC1HZW9y
Z2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
