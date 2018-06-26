From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V2] x86/altp2m: Fixed crash with
 INVALID_ALTP2M EPTP index
Date: Tue, 26 Jun 2018 07:19:37 -0600
Message-ID: <5B323D6902000078001CE0C6@prv1-mh.provo.novell.com>
References: <1529935857-5368-1-git-send-email-rcojocaru@bitdefender.com>
 <5B3214C802000078001CDEC9@prv1-mh.provo.novell.com>
 <18f31abe-a7a5-1c29-f2dc-cc286ba5d5b6@bitdefender.com>
 <5B3229F902000078001CDFF1@prv1-mh.provo.novell.com>
 <9effa668-8f05-1295-34cb-fcbc003d7d93@bitdefender.com>
 <7f066d56-f593-ee65-9f2e-d6d931fa25b4@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <7f066d56-f593-ee65-9f2e-d6d931fa25b4@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjA2LjE4IGF0IDE0OjQ5LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gU28gYXNzdW1pbmcgdGhhdCB0aGUgSFZNT1BzIGFyZSBwcm9wZXJseSBoYW5kbGVkIGF0
b21pY2FsbHkgd2l0aCByZXNwZWN0Cj4gdG8gdGhlaXIgY29ycmVzcG9uZGluZyBWQ1BVICh3aGlj
aCBJIG5vdyBiZWxpZXZlIHRvIGJlIHRoZSBjYXNlKSwgdGhlCj4gb25seSBwb3NzaWJsZSBpc3N1
ZSB0aGF0IHJlbWFpbnMgKHRoYXQgSSBjYW4gdGhpbmsgb2YpIGlzIHRoZSBjYXNlIHdoZXJlCj4g
RVBUUF9JTkRFWCBoYXMgYmVlbiBzYXZlZCBpbiBhIHByZXZpb3VzIHJ1biBvZiBhIHRlc3QgYXBw
bGljYXRpb24sIGJ1dAo+IGlzIG5vdCBjb3JyZWN0IGZvciB0aGUgY3VycmVudCBzdGF0ZSBvZiB0
aGUgZ3Vlc3QuCj4gCj4gVGhlbiBIVk1PUF9hbHRwMm1fdmNwdV9lbmFibGVfbm90aWZ5IGlzIGhh
bmRsZWQsCj4gU0VDT05EQVJZX0VYRUNfRU5BQkxFX1ZJUlRfRVhDRVBUSU9OUyBpcyBzZXQsIGFu
ZCB0aGUgVk0gZXhpdCBoYW5kbGVyIGlzCj4gY2FsbGVkLCB3aGljaCB3b3VsZCByZXN1bHQgaW4g
d29ya2luZyB3aXRoIHRoZSB3cm9uZyBpbmRleC4gVGhpcywgSQo+IGJlbGlldmUsIGNhbiBiZSBm
aXhlZCBieSBlaXRoZXIgY2FsbGluZyBhbHRwMm1fdmNwdV91cGRhdGVfcDJtKCkgYWxsIHRoZQo+
IHRpbWUgaW1tZWRpYXRlbHkgYWZ0ZXIgYWxsIGFsdHAybV92Y3B1X3VwZGF0ZV92bWZ1bmNfdmUo
KSBjYWxscywgb3IKPiBtYWtpbmcgaXQgYSBwYXJ0IG9mIGFsdHAybV92Y3B1X3VwZGF0ZV92bWZ1
bmNfdmUoKSAoaGVuY2UgbXkgcHJldmlvdXMKPiBwcm9wb3NhbCkuCj4gCj4gRG9lcyB0aGF0IHNv
dW5kIHJlYXNvbmFibGU/CgpJIHRoaW5rIHNvLCB5ZXMsIGlmIHRoZSBwYXVzaW5nIHdvcmtzIGFz
IGV4cGVjdGVkLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
