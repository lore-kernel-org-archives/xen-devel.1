From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v3 1/2] xen/arm: Add MVEBU UART driver for
 Marvell Armada 3700 SoC
Date: Fri, 6 Apr 2018 10:38:22 +0100
Message-ID: <edb17fc2-11c0-28a5-4aea-0f4689a68b22@arm.com>
References: <1522923373-21039-1-git-send-email-amittomer25@gmail.com>
 <1522923373-21039-2-git-send-email-amittomer25@gmail.com>
 <1263508c-e9fc-927d-dc40-72e602f71491@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7n7s=g3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1f4NpE-0002xd-N6
 for xen-devel@lists.xenproject.org; Fri, 06 Apr 2018 09:38:28 +0000
In-Reply-To: <1263508c-e9fc-927d-dc40-72e602f71491@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Amit Singh Tomar <amittomer25@gmail.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andre.przywara@arm.com, ian.jackson@eu.citrix.com, tim@xen.org, jbeulich@suse.com, andrew.cooper3@citrix.com
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwNC8wNi8yMDE4IDEwOjI2IEFNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gKCtKdWVyZ2Vu
KQo+IAo+IEhpLAo+IAo+IE9uIDA0LzA1LzIwMTggMTE6MTYgQU0sIEFtaXQgU2luZ2ggVG9tYXIg
d3JvdGU6Cj4+IFRoaXMgcGF0Y2ggYWRkcyBkcml2ZXIgZm9yIFVBUlQgY29udHJvbGxlciBmb3Vu
ZCBvbiBBcm1hZGEgMzcwMCBTb0MuCj4+Cj4+IFRoZXJlIGlzIG5vIHJlZmVyZW5jZSBtYW51YWxz
IGF2YWlsYWJsZSBmb3IgMzcwMCBTb0MgaW4gcHVibGljIGFuZCBpdAo+PiBpcyBkZXJpdmVkIGJ5
IGxvb2tpbmcgYXQgTGludXggZHJpdmVyWzFdLgo+Pgo+PiBbMV1odHRwczovL2dpdGh1Yi5jb20v
dG9ydmFsZHMvbGludXgvYmxvYi9tYXN0ZXIvZHJpdmVycy90dHkvc2VyaWFsL212ZWJ1LXVhcnQu
YyAKPj4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQW1pdCBTaW5naCBUb21hciA8YW1pdHRvbWVyMjVA
Z21haWwuY29tPgo+PiAtLS0KPj4gQ2hhbmdlcyBzaW5jZSB2MjoKPj4gwqDCoMKgwqAgKiBBZGRy
ZXNzZWQgQW5kcmUncyBjb21tZW50cy4KPj4gQ2hhbmdlcyBzaW5jZSB2MToKPj4gwqDCoMKgwqAg
KiBBZGRyZXNzZWQgV2VpIExpdSdzIGNvbW1lbnRzCj4+IMKgwqDCoMKgICogQWRkcmVzc2VkIEFu
ZHJlJ3MgY29tbWVudHMuCj4+IENoYW5nZXMgc2luY2UgUkZDOgo+PiDCoMKgwqDCoCAqIEFkZHJl
c3NlZCBKdWxpZW4ncyBjb21tZW50cy4KPj4gLS0tCj4+IMKgIHhlbi9kcml2ZXJzL2NoYXIvS2Nv
bmZpZ8KgwqDCoMKgwqAgfMKgwqAgOCArKwo+PiDCoCB4ZW4vZHJpdmVycy9jaGFyL01ha2VmaWxl
wqDCoMKgwqAgfMKgwqAgMSArCj4+IMKgIHhlbi9kcml2ZXJzL2NoYXIvbXZlYnUtdWFydC5jIHwg
Mjk2IAo+PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAKPiBB
cyBJIHNhaWQgb24gdGhlIGZpcnN0IHZlcnNpb24sIEkgdGhpbmsgdGhpcyBzaG91bGQgZm9sZCB1
bmRlciAiQVJNIiBhcyAKPiBhbGwgdGhlIGFyY2ggc3BlY2lmaWMgVUFSVCBkcml2ZXIgKFBMMDEx
ICYgY28pLgo+IAo+IEkgd2FzIGV4cGVjdGluZyB0aGlzIHBhdGNoIHRvIG1vZGlmeSBNQUlOVEFJ
TkVSUy4gSSB3b3VsZCBiZSBvayB0byAKPiBjb21taXQgbGlrZSB0aGF0IGJ1dCBwbGVhc2Ugc2Vu
ZCBhIHBhdGNoIHRvIGFkZHJlc3MgdGhpcyBpc3N1ZSBhcyBzb29uIAo+IGFzIHBvc3NpYmxlLgoK
SXQgc291bmRzIGxpa2UgdGhlcmUgYXJlIGNvbmZ1c2lvbiBvbiB3aGF0IEkgcmVxdWVzdGVkIGhl
cmUuIEFGQUlDVCwgdGhlIApNVkVCVSBkcml2ZXIgaXMgZXhjbHVzaXZlbHkgdXNlZCBieSBBcm0u
IFNvIHRoaXMgY291bGQgYmUgbWFpbnRhaW5lZCBieSAKU3RlZmFubyBhbmQgSS4KClNvIHdlIGNv
dWxkIGFkZCBhbiBlbnRyeSBmb3IgdGhhdCBmaWxlIHVuZGVyICJBUk0gKFcvIFZJUlRVQUxJWkFU
SU9OIApFWFRFTlNJT05TKSBBUkNISVRFQ1RVUkUiIGluIE1BSU5UQUlORVJTIGZpbGUuCgpDaGVl
cnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
