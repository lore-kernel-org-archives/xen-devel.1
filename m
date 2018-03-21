From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v1 02/15] arm64: Add config for Cavium
 Thunder erratum 30115
Date: Wed, 21 Mar 2018 07:49:38 +0000
Message-ID: <79776f95-a73b-efdc-ca3b-77dda0a1d0ba@arm.com>
References: <cover.1521200294.git.manish.jaggi@cavium.com>
 <684b3fbdecdc9628107981b006ab37f3bb23820b.1521200294.git.manish.jaggi@cavium.com>
 <ccbb7185-e525-6999-1f99-5d55cd361a40@arm.com>
 <07dfba2b-d237-9fcb-3b32-993af75cc95c@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kbl4=gl=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1eyYVE-0005RT-1Z
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 07:49:44 +0000
In-Reply-To: <07dfba2b-d237-9fcb-3b32-993af75cc95c@caviumnetworks.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Manish Jaggi <mjaggi@caviumnetworks.com>, Manish Jaggi <manish.jaggi@cavium.com>, xen-devel@lists.xenproject.org, sstabellini@kernel.org, marc.zyngier@arm.com, andre.przywara@arm.com
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMjEvMjAxOCAwNTowNiBBTSwgTWFuaXNoIEphZ2dpIHdyb3RlOgo+IE9uIDAzLzIwLzIw
MTggMDE6MTMgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gT24gMDMvMTYvMjAxOCAxMTo1OCBB
TSwgTWFuaXNoIEphZ2dpIHdyb3RlOgo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9jcHVl
cnJhdGEuYyBiL3hlbi9hcmNoL2FybS9jcHVlcnJhdGEuYwo+Pj4gaW5kZXggZmU5ZTlmYWNiZS4u
ZDQ5Njk4Zjc4NSAxMDA2NDQuIAo+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2NwdWVycmF0YS5jCj4+
PiArKysgYi94ZW4vYXJjaC9hcm0vY3B1ZXJyYXRhLmMKPj4+IEBAIC01Niw2ICs1NiwyNyBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IGFybV9jcHVfY2FwYWJpbGl0aWVzIAo+Pj4gYXJtX2VycmF0YVtd
ID0gewo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIE1JRFJfUkFOR0UoTUlEUl9DT1JURVhfQTU3LCAw
eDAwLAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoMSA8PCBN
SURSX1ZBUklBTlRfU0hJRlQpIHwgMiksCj4+PiDCoMKgwqDCoMKgIH0sCj4+PiArI2VuZGlmCj4+
PiArI2lmZGVmIENPTkZJR19DQVZJVU1fRVJSQVRVTV8zMDExNQo+Pj4gK8KgwqDCoCB7Cj4+PiAr
wqDCoMKgwqDCoMKgwqAgLyogQ2F2aXVtIFRodW5kZXJYLCBUODggcGFzcyAxLnggLSAyLjIgKi8K
Pj4KPj4gVGhpcyBpcyBxdWl0ZSBvZGQuIFlvdSBzcGVjaWZ5IGEgbnVtYmVyIGluIHRoZSBjb21t
aXQgbWVzc2FnZSBoZXJlLCAKPj4gYnV0IGluIHRoZSBwcmV2aW91cyBvbmUgeW91IGp1c3Qgc2F5
ICJ0aHVuZGVyeDEiLiBDYW4geW91IHBsZWFzZSB0cnkgCj4+IHRvIGFncmVlIG9uIHRoZSBuYW1l
PyBMaWtlIHRoZSByaWdodCBuYW1pbmcgaXMgTUlEUl9USFVOREVSWF84OC4KPiBUaHVuZGVyWDEg
aXMgODh4eC4gQWxzbyB0aGlzIHBhdGNoIGlzIHVzaW5nIHRoZSBzYW1lIHBhdGNoIGZyb20gbGlu
dXguCj4gUGxlYXNlIHNlZQo+IGh0dHBzOi8vbGlzdHMuY3MuY29sdW1iaWEuZWR1L3BpcGVybWFp
bC9rdm1hcm0vMjAxNy1KdW5lLzAyNTgxNS5odG1sCgpJZiB5b3UgcmUtdXNlIGEgcGF0Y2ggZnJv
bSBMaW51eCB0aGVuIHdyaXRlIGl0IGluIHRoZSBjb21taXQgbWVzc2FnZS4uLiAKQW5kIGluIHBh
dGNoICMxLCB5b3Ugc2hvdWxkIGNsYXJpZnkgeW91IGFyZSByZS11c2luZyBMaW51eCBuYW1lLgoK
Q2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
