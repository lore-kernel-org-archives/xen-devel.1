From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/8] x86/HVM/SVM: Add AVIC initialization
 code
Date: Thu, 26 Apr 2018 16:39:00 +0100
Message-ID: <6c022918-65b3-88ad-8f25-b026850e1d42@citrix.com>
References: <cover.1522794651.git.Janakarajan.Natarajan@amd.com>
 <25d739b732adb329166f7cca3633473f4ad08b39.1522794651.git.Janakarajan.Natarajan@amd.com>
 <5AD4C76802000078001BBCD7@prv1-mh.provo.novell.com>
 <ca050e2b-49cb-f7d5-6f0c-268c6d522dca@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <ca050e2b-49cb-f7d5-6f0c-268c6d522dca@amd.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Natarajan, Janakarajan" <jnataraj@amd.com>, Jan Beulich <JBeulich@suse.com>, Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMDQvMTggMTY6MzIsIE5hdGFyYWphbiwgSmFuYWthcmFqYW4gd3JvdGU6Cj4gT24gNC8x
Ni8yMDE4IDEwOjU1IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMDQuMDQuMTggYXQg
MDE6MDEsIDxKYW5ha2FyYWphbi5OYXRhcmFqYW5AYW1kLmNvbT4gd3JvdGU6Cj4+Pgo+Pj4gK2lu
dCBzdm1fYXZpY19kb21faW5pdChzdHJ1Y3QgZG9tYWluICpkKQo+Pj4gK3sKPj4+ICvCoMKgwqAg
aW50IHJldCA9IDA7Cj4+PiArwqDCoMKgIHN0cnVjdCBwYWdlX2luZm8gKnBnOwo+Pj4gKwo+Pj4g
K8KgwqDCoCBpZiAoICFzdm1fYXZpYyB8fCAhaGFzX3ZsYXBpYyhkKSApCj4+PiArwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIDA7Cj4+PiArCj4+PiArwqDCoMKgIC8qCj4+PiArwqDCoMKgwqAgKiBOb3Rl
Ogo+Pj4gK8KgwqDCoMKgICogQVZJQyBoYXJkd2FyZSB3YWxrcyB0aGUgbmVzdGVkIHBhZ2UgdGFi
bGUgdG8gY2hlY2sgcGVybWlzc2lvbnMsCj4+PiArwqDCoMKgwqAgKiBidXQgZG9lcyBub3QgdXNl
IHRoZSBTUEEgYWRkcmVzcyBzcGVjaWZpZWQgaW4gdGhlIGxlYWYgcGFnZQo+Pj4gK8KgwqDCoMKg
ICogdGFibGUgZW50cnkgc2luY2UgaXQgdXNlc8KgIGFkZHJlc3MgaW4gdGhlIEFWSUNfQkFDS0lO
R19QQUdFCj4+PiBwb2ludGVyCj4+PiArwqDCoMKgwqAgKiBmaWVsZCBvZiB0aGUgVk1DQi4gVGhl
cmVmb3JlLCB3ZSBzZXQgdXAgYSBkdW1teSBwYWdlIGZvcgo+Pj4gQVBJQyBfbWZuKDApLgo+Pj4g
K8KgwqDCoMKgICovCj4+PiArwqDCoMKgIHNldF9tbWlvX3AybV9lbnRyeShkLCBwYWRkcl90b19w
Zm4oQVBJQ19ERUZBVUxUX1BIWVNfQkFTRSksCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgX21mbigwKSwgUEFHRV9PUkRFUl80SywKPj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwMm1fZ2V0X2hvc3RwMm0oZCkt
PmRlZmF1bHRfYWNjZXNzKTsKPj4gVGhlIHVzZSBvZiBNRk4gMCBoZXJlIGxvb2tzIHJpc2t5IHRv
IG1lOiBIb3cgZG8geW91IGd1YXJhbnRlZSBub3RoaW5nCj4+IGVsc2UKPj4gbWlnaHQgZXZlciB1
c2UgdGhhdCBQMk0gZW50cnk/Cj4KPiBEbyB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbnMgZm9yIGFu
IGFsdGVybmF0aXZlIHRvIE1GTiAwIHRoYXQgaXMKPiBndWFyYW50ZWVkIHRvIG5ldmVyIGJlIHVz
ZWQ/CgpzdGF0aWMgY29uc3QgX19zZWN0aW9uKCIuYnNzLnBhZ2VfYWxpZ25lZC5jb25zdCIpIF9f
YWxpZ25lZChQQUdFX1NJWkUpCmF2aWNfYmFja2luZ19wYWdlW1BBR0VfU0laRV07CgpIb3dldmVy
LCBkb24ndCB3cml0ZXMgb3V0c2lkZSBvZiBBUElDIHJlZ2lzdGVycyBnZXQgZHVtcGVkIGludG8g
dGhpcwpwYWdlP8KgIElmIHNvLCB5b3UgbmVlZCB0byBhbGxvY2F0ZSBhIG5ldyBwYWdlIHBlciBn
dWVzdC7CoCBJZiBub3QsIHdoZXJlCmRvIHRoZSB3cml0ZXMgb3V0c2lkZSBvZiB0aGUgQVBJQyBy
ZWdpc3RlcnMgZ2V0IGR1bXBlZD8KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
