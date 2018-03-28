From: Manish Jaggi <mjaggi@caviumnetworks.com>
Subject: Re: [PATCH resend 02/13] acpi: arm: query estimated
 size of hardware domain's IORT.
Date: Wed, 28 Mar 2018 16:54:42 +0530
Message-ID: <8212c83f-4a1e-270c-4b55-04112c3ffdd3@caviumnetworks.com>
References: <cover.1520834718.git.mjaggi@caviumnetworks.com>
 <da4b781e6f762227fb16c5122e4ff473242145ea.1520834718.git.mjaggi@caviumnetworks.com>
 <00de2b5c-6825-e812-3e22-ac403f177938@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pvqr=gs=cavium.com=manish.jaggi@srs-us1.protection.inumbo.net>)
 id 1f19CN-0004I6-Jm
 for xen-devel@lists.xenproject.org; Wed, 28 Mar 2018 11:24:59 +0000
In-Reply-To: <00de2b5c-6825-e812-3e22-ac403f177938@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, manish.jaggi@linaro.org, xen-devel@lists.xenproject.org, sameer.goel@linaro.org, jgross@suse.com, sstabellini@kernel.org
Cc: Manish Jaggi <manish.jaggi@linaro.com>, manish.jaggi@cavium.com
List-Id: xen-devel@lists.xenproject.org

CkhpIEp1bGllbiwKCk9uIDAzLzIxLzIwMTggMDM6NDIgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToK
PiBUaXRsZTogUGxlYXNlIGRyb3AgdGhlIGZ1bGwgc3RvcC4KPgo+IE9uIDAzLzEzLzIwMTggMDM6
MjAgUE0sIG1qYWdnaUBjYXZpdW1uZXR3b3Jrcy5jb20gd3JvdGU6Cj4gLi4uCj4KPj4gK8KgwqDC
oCBzdHJ1Y3QgcmlkX2RldmlkX21hcCAqcm1hcDsKPgo+IEkgYW0gc29ycnkgYnV0IEkgc3RpbGwg
ZG9uJ3Qgc2VlIGFueSBjb21tZW50IGFib3V0IG15IGNvbW1lbnQgb24gdGhlIAo+IHByZXZpb3Vz
IHZlcnNpb24uIEZvciByZW1pbmRlcjoKPgo+ICJBIGJpdCBtb3JlIGRvY3VtZW50aW9uIG9mIHRo
aXMgZnVuY3Rpb24gd291bGQgYmUgYXBwcmVjaWF0ZWQuIEZvciAKPiBpbnN0YW5jZSwgdGhlIHJh
dGlvbmFsZSBiZXR3ZWVuIGJyb3dzaW5nIHRoZSBsaXN0IHR3aWNlIGZvciBhbGxvY2F0aW9uLgo+
Cj4gSSBhY3R1YWxseSBkbyB0aGluayB0aGlzIG1pZ2h0IGJlIGF2b2lkYWJsZSBieSBzdG9yaW5n
IGEgYml0IG1vcmUgCj4gaW5mb3JtYXRpb24gZnJvbSB0aGUgSU9SVC4gRnJvbSB0aGUgdGFibGUg
eW91IGNhbiBlYXNpbHkgZGVkdWNlZCB0aGUgCj4gbnVtYmVyIG9mIHJvb3QgY29tcGxleCBhbmQg
SVRTIGdyb3VwLiAKVGhhdCB3aWxsIHN0aWxsIHJlcXVpcmUgcGFyc2luZyBvZiBhbGwgSU9SVCBu
b2Rlcy4KSSBhbSBhZGQgb25lIG1vcmUgYXBpIHRvIHJldHVybiB0b3RhbCBtYXBwaW5ncywgd2hp
Y2ggd291bGQgYmFzaWNhbGx5IApyZXR1cm4gYSBjb3VudGVyIHdoaWNoIGlzIHVwZGF0ZWQgd2hl
biBhZGRfcmlkX2RldmljZWlkX21hcCBpcyBjYWxsZWQuClRoaXMgd291bGQgcmVwbGFjZQoKK8Kg
wqDCoCBsaXN0X2Zvcl9lYWNoX2VudHJ5KHJtYXAsICZyaWRfZGV2aWRfbGlzdCwgZW50cnkpCivC
oMKgwqDCoMKgwqDCoCBjb3VudCsrOworCgpTb3VuZHMgZ29vZD8KPiBUaGV5IGNvdWxkIGJlIHN0
b3JlIHdpdGggdGhlIHJlc3Qgb2YgaW5mb3JtYXRpb24uIgo+CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
