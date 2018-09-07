From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/5] x86/hvm: Switch hvm_allow_get_param()
 to use a whitelist
Date: Fri, 7 Sep 2018 19:18:19 +0100
Message-ID: <f2a24a71-2a8e-78ba-53ac-2a86dc049a1f@citrix.com>
References: <1536171124-27053-1-git-send-email-andrew.cooper3@citrix.com>
 <1536171124-27053-2-git-send-email-andrew.cooper3@citrix.com>
 <c2554d76f69749078dfe1ca60340042e@AMSPEX02CL03.citrite.net>
 <2145af5a-d61e-9b0c-2d47-b3f4e155306b@citrix.com>
 <5B923D0202000078001E63A4@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B923D0202000078001E63A4@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDkvMTggMDk6NTUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA2LjA5LjE4IGF0
IDE3OjIxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDA2LzA5LzE4
IDA5OjU2LCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+Pj4gQEAgLTQzOTAsOSArNDQxMSw2IEBAIHN0
YXRpYyBpbnQgaHZtb3BfZ2V0X3BhcmFtKAo+Pj4+ICAgICAgaWYgKCBjb3B5X2Zyb21fZ3Vlc3Qo
JmEsIGFyZywgMSkgKQo+Pj4+ICAgICAgICAgIHJldHVybiAtRUZBVUxUOwo+Pj4+Cj4+Pj4gLSAg
ICBpZiAoIGEuaW5kZXggPj0gSFZNX05SX1BBUkFNUyApCj4+Pj4gLSAgICAgICAgcmV0dXJuIC1F
SU5WQUw7Cj4+Pj4gLQo+Pj4gQVNTRVJULCBqdXN0IGluIGNhc2Ugc29tZW9uZSBzY3Jld3MgdXAg
dGhlIGFsbG93IGZ1bmN0aW9uIGluIGZ1dHVyZT8KPj4gVGhhdCdzIG5vdCBnb2luZyB0byBoZWxw
IGluIGFueSBwcmFjdGljYWwgd2F5LiAgVGhpcyBjaGVjayBkb2VzIHJlYWxseQo+PiBleGlzdCwg
YW5kIGlzIHBhcnQgb2YgdGhlIHN3aXRjaCBzdGF0ZW1lbnQuCj4gV2hpY2ggc3dpdGNoKCkgc3Rh
dGVtZW50PyBUaGUgb25lIGluIHRoZSBhbGxvdyBmdW5jdGlvbiBpbmNsdWRlcyB0aGlzLAo+IGJ1
dCB0aGUgb25lIGhlcmUgc2ltcGx5IGhhcwo+Cj4gICAgIGRlZmF1bHQ6Cj4gICAgICAgICBhLnZh
bHVlID0gZC0+YXJjaC5odm0ucGFyYW1zW2EuaW5kZXhdOwo+ICAgICAgICAgYnJlYWs7CgpBIGJv
dW5kYXJ5IGNoZWNrIG9uIGEuaW5kZXggbG9naWNhbGx5IGZhbGxzIHdpdGhpbiB0aGUgcmVtaXQg
b2YKaHZtX2FsbG93X2dldF9wYXJhbSgpCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
