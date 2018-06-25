From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v3 07/13] xen/arm: Simplify alternative
 patching of non-writable region
Date: Mon, 25 Jun 2018 10:07:12 +0100
Message-ID: <58656a25-efc5-e02b-483c-9c4f3069d2f3@arm.com>
References: <20180612113643.32020-1-julien.grall@arm.com>
 <20180612113643.32020-8-julien.grall@arm.com>
 <20180612211759.GC17709@char.us.oracle.com>
 <c314f376-30a3-ed7f-a696-4adda2502891@arm.com>
 <20180622133322.GG10869@char.US.ORACLE.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cevu=jl=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fXNSv-0003YC-4k
 for xen-devel@lists.xenproject.org; Mon, 25 Jun 2018 09:07:17 +0000
In-Reply-To: <20180622133322.GG10869@char.US.ORACLE.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: xen-devel@lists.xenproject.org, nd@arm.com, sstabellini@kernel.org, andre.przywara@arm.com
List-Id: xen-devel@lists.xenproject.org

SGkgS29ucmFkLAoKT24gMjIvMDYvMTggMTQ6MzMsIEtvbnJhZCBSemVzenV0ZWsgV2lsayB3cm90
ZToKPiBPbiBUdWUsIEp1biAxMiwgMjAxOCBhdCAxMTowNjoxNlBNICswMTAwLCBKdWxpZW4gR3Jh
bGwgd3JvdGU6Cj4+IE9uIDEyLzA2LzIwMTggMjI6MTcsIEtvbnJhZCBSemVzenV0ZWsgV2lsayB3
cm90ZToKPj4+IE9uIFR1ZSwgSnVuIDEyLCAyMDE4IGF0IDEyOjM2OjM3UE0gKzAxMDAsIEp1bGll
biBHcmFsbCB3cm90ZToKPj4+IFdvbid0IHRoaXMgbWVhbiB0aGUgdHJhcHMgKGlmIHRoZXJlIGFy
ZSBhbnkpIHdvbid0IGJlIHJlY29nbml6ZWQgYXQgYWxsCj4+PiBkdXJpbmcgdGhpcyBwYXRjaGlu
Zz8KPj4KPj4gV2hhdCBkbyB5b3UgbWVhbiBieSByZWNvZ25pemVkPyBUaGlzIG5ldyByZWdpb24g
d2lsbCBvbmx5IGJlIGFjY2Vzc2VkIHRvCj4+IHdyaXRlIGluc3RydWN0aW9uLiBUaGUgb25seSBw
b3RlbnRpYWwgZmF1bHQgb24gdGhhdCByZWdpb24gaXMgYSBkYXRhIGFib3J0Lgo+IAo+IEV4YWN0
bHkgdGhlIGRhdGEgYWJvcnQuCj4gCj4gTXkgcmVjb2xsZWN0aW9uIGlzIHRoYXQgdGhlIGRhdGEg
YWJvcnQgd291bGQgcHJpbnQgYSBzdGFjayB0cmFjZS4gQW5kCj4gdGhlIHN0YWNrIHRyYWNlIG5l
ZWRzIHN5bWJvbCBpbmZvcm1hdGlvbiAtIHdoaWNoIGl0IGdldHMgZnJvbSB2aXJ0dWFsX3JlZ2lv
bi4KPiAKPiBCdXQgaWYgdmlydHVhbF9yZWdpb24gaXMgbm90IHJlZ2lzdGVyZWQgdGhlbiB0aGUg
c3RhY2sgd29uJ3QgY29udGFpbiB0aGUKPiBuYW1lIG9mIHRoZSBmdW5jdGlvbiB0aGF0IGhhZCBh
biBkYXRhIGFib3J0IGFzIHRoZSBwYXRjaGluZyBpcyBkb25lLgoKSSBhbSBub3Qgc3VyZSB0byB1
bmRlcnN0YW5kIHdoYXQgeW91IG1lYW4gYnkgInRoZSBuYW1lIG9mIHRoZSBmdW5jdGlvbiAKdGhh
dCBoYWQgYSBkYXRhIGFib3J0Ii4gQ291bGQgeW91IGdpdmUgYSBiaXQgbW9yZSBkZXRhaWw/CgpD
aGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
