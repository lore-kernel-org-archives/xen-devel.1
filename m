From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: put vcpumask_to_pcpumask under
 CONFIG_PV
Date: Fri, 2 Nov 2018 19:30:43 +0000
Message-ID: <9be8ae3b-fde9-f9ac-ffc1-6133f107653f@citrix.com>
References: <20181102192851.733-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=a587=nn=citrix.com=prvs=837a34217=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gIf9b-0002UG-DT
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 19:30:47 +0000
In-Reply-To: <20181102192851.733-1-wei.liu2@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMTEvMTggMTk6MjgsIFdlaSBMaXUgd3JvdGU6Cj4gVGhpcyBmdW5jdGlvbiBpcyB1c2Vk
IGJ5IFBWIGNvZGUgb25seS4gVGhpcyBpc3N1ZSBpcyBkaXNjb3ZlcmVkIGJ5Cj4gY2xhbmcgYnVp
bGQuCgpJbmRlZWQuwqAgSXQgaXMgb25seSB1c2VkIGJ5IHR3byBQViBoeXBlcmNhbGxzLgoKPgo+
IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gLS0tCj4gIHhl
bi9hcmNoL3g4Ni9tbS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0uYyBiL3hlbi9h
cmNoL3g4Ni9tbS5jCj4gaW5kZXggZjk2Njc4ZjQ2ZC4uMDFlYzZhYTJiZiAxMDA2NDQKPiAtLS0g
YS94ZW4vYXJjaC94ODYvbW0uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jCj4gQEAgLTMwNTcs
NiArMzA1Nyw3IEBAIGludCBuZXdfZ3Vlc3RfY3IzKG1mbl90IG1mbikKPiAgI2VuZGlmCj4gIH0K
PiAgCj4gKyNpZmRlZiBDT05GSUdfUFYKPiAgc3RhdGljIGlubGluZSBpbnQgdmNwdW1hc2tfdG9f
cGNwdW1hc2soCgpNaW5kIGRyb3BwaW5nIHRoaXMgc3B1cmlvdXMgaW5saW5lIHdoaWxlIHlvdSdy
ZSBhdCBpdD8KClJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgoKPiAgICAgIHN0cnVjdCBkb21haW4gKmQsIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0o
Y29uc3Rfdm9pZCkgYm1hcCwgY3B1bWFza190ICpwbWFzaykKPiAgewo+IEBAIC0zMDk5LDcgKzMx
MDAsNiBAQCBzdGF0aWMgaW5saW5lIGludCB2Y3B1bWFza190b19wY3B1bWFzaygKPiAgICAgIH0K
PiAgfQo+ICAKPiAtI2lmZGVmIENPTkZJR19QVgo+ICBzdGF0aWMgc3RydWN0IGRvbWFpbiAqZ2V0
X3BnX293bmVyKGRvbWlkX3QgZG9taWQpCj4gIHsKPiAgICAgIHN0cnVjdCBkb21haW4gKnBnX293
bmVyID0gTlVMTCwgKmN1cnIgPSBjdXJyZW50LT5kb21haW47CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
