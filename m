From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] x86/SVM-IOMMU: Don't opencode memcpy()
 in queue_iommu_command()
Date: Mon, 24 Sep 2018 13:19:22 +0100
Message-ID: <adca3d65-5c57-794a-b3e2-fc062b8d816a@citrix.com>
References: <1537786530-4625-1-git-send-email-andrew.cooper3@citrix.com>
 <930ae0cb767d46898ea4a9acdb95c2be@AMSPEX02CL03.citrite.net>
 <bb08f184-1861-a75b-9479-26771116ec9c@citrix.com>
 <83196ca8ba4740f891892a50f2aaeb9d@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <83196ca8ba4740f891892a50f2aaeb9d@AMSPEX02CL03.citrite.net>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Brian Woods <brian.woods@amd.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjQvMDkvMTggMTM6MDksIFBhdWwgRHVycmFudCB3cm90ZToKPj4KPj4+PiBAQCAtMzUsMTIg
KzM0LDkgQEAgc3RhdGljIGludCBxdWV1ZV9pb21tdV9jb21tYW5kKHN0cnVjdCBhbWRfaW9tbXUK
Pj4gKmlvbW11LAo+Pj4+IHUzMiBjbWRbXSkKPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBJT01NVV9DTURfQlVGRkVSX0hFQURfT0ZGU0VUKSk7Cj4+Pj4gICAgICBp
ZiAoIGhlYWQgIT0gdGFpbCApCj4+Pj4gICAgICB7Cj4+Pj4gLSAgICAgICAgY21kX2J1ZmZlciA9
ICh1MzIgKikoaW9tbXUtPmNtZF9idWZmZXIuYnVmZmVyICsKPj4+PiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAoaW9tbXUtPmNtZF9idWZmZXIudGFpbCAqCj4+Pj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgSU9NTVVfQ01EX0JVRkZFUl9FTlRSWV9TSVpFKSk7Cj4+Pj4gLQo+
Pj4+IC0gICAgICAgIGZvciAoIGkgPSAwOyBpIDwgSU9NTVVfQ01EX0JVRkZFUl9VMzJfUEVSX0VO
VFJZOyBpKysgKQo+Pj4+IC0gICAgICAgICAgICBjbWRfYnVmZmVyW2ldID0gY21kW2ldOwo+Pj4+
ICsgICAgICAgIG1lbWNweShpb21tdS0+Y21kX2J1ZmZlci5idWZmZXIgKwo+Pj4+ICsgICAgICAg
ICAgICAgICAoaW9tbXUtPmNtZF9idWZmZXIudGFpbCAqIElPTU1VX0NNRF9CVUZGRVJfRU5UUllf
U0laRSksCj4+Pj4gKyAgICAgICAgICAgICAgIGNtZCwgSU9NTVVfQ01EX0JVRkZFUl9FTlRSWV9T
SVpFKTsKPj4+IC4uLnNpbmNlIHRoZSBidWlsdC1pbiBtZW1jcHkgbWF5IG5vdCBndWFyYW50ZWUg
dG8gdGhlIGNvcHkgaW4gNCBieXRlCj4+IGNodW5rcyBpbiBhc2NlbmRpbmcgb3JkZXIuCj4+Cj4+
ICJObyBmdW5jdGlvbmFsIGNoYW5nZSIgIT0gIlRoZSBiaW5hcnkgaXMgaWRlbnRpY2FsIi4KPj4K
Pj4gVGhlIGZ1bmN0aW9uYWxpdHkgb2YgcXVldWVfaW9tbXVfY29tbWFuZCgpIGRvZXMgbm90IGNo
YW5nZSwgZXZlbiBpZiBpdCdzCj4+IGNvZGUgZ2VuZXJhdGlvbiBkb2VzLsKgIEl0IGlzIGp1c3Qg
Y29weWluZyBieXRlcyBpbnRvIGEgc2hhcmVkIHJpbmcsCj4+IGJvdW5kZWQgbGF0ZXIgYnkgdXBk
YXRpbmcgdGhlIHRhaWwgcG9pbnRlci4KPiBZZXMsIG15IHBvaW50IGlzIHRoYXQgdGhlIHJpbmcg
aXMgc2hhcmVkIGFuZCBzbyBETUEgYnkgdGhlIGgvdyBtYXkgcmFjZS4gVGhpcyBpcyBjbGVhcmx5
IG5vdCBhIGdvb2Qgc2l0dWF0aW9uIGJ1dCB0aGUgZmFjdCB0aGF0IHRoZSBjb2RlIGdlbmVyYXRp
b24gbWF5IGNoYW5nZSBtYXkgaGF2ZSBzaWRlIGVmZmVjdHMuCgpUaGlzIGlzIHdyaXRpbmcgcGFz
dCB0aGUgdGFpbCBwb2ludGVyLCBhbmQgdGhlbiB1cGRhdGluZyB0aGUgdGFpbApwb2ludGVyIHRv
IG1hdGNoLgoKSGFyZHdhcmUgY29uZm9ybWluZyB0byB0aGUgc3BlYyB3b24ndCByZWFkIGFueSBv
ZiB0aGUgZGF0YSB1bnRpbCBpdCBpcwphbGwgcmVhZHkuCgp+QW5kcmV3CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
