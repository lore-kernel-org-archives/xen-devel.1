From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] x86/hvm: Corrections to RDTSCP
 intercept handling
Date: Mon, 3 Dec 2018 11:13:40 +0000
Message-ID: <cd7fe068-e127-6ac2-bd23-2b0dba47ec36@citrix.com>
References: <1543597640-28870-1-git-send-email-andrew.cooper3@citrix.com>
 <1543597640-28870-3-git-send-email-andrew.cooper3@citrix.com>
 <2b5424fdc1be4a73b4ede017f4a9f34f@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <2b5424fdc1be4a73b4ede017f4a9f34f@AMSPEX02CL03.citrite.net>
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Jun Nakajima <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMTIvMjAxOCAwOToxNywgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwo+
PiBpbmRleCAzNjVlZWIyLi5hOWY5YjliIDEwMDY0NAo+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZt
L3ZteC92bXguYwo+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwo+PiBAQCAtMzU4
OSw2ICszNTg5LDcgQEAgdm9pZCB2bXhfdm1leGl0X2hhbmRsZXIoc3RydWN0IGNwdV91c2VyX3Jl
Z3MgKnJlZ3MpCj4+ICAgICAgdW5zaWduZWQgbG9uZyBleGl0X3F1YWxpZmljYXRpb24sIGV4aXRf
cmVhc29uLCBpZHR2X2luZm8sIGludHJfaW5mbyA9Cj4+IDA7Cj4+ICAgICAgdW5zaWduZWQgaW50
IHZlY3RvciA9IDAsIG1vZGU7Cj4+ICAgICAgc3RydWN0IHZjcHUgKnYgPSBjdXJyZW50Owo+PiAr
ICAgIHN0cnVjdCBkb21haW4gKmN1cnJkID0gdi0+ZG9tYWluOwo+IC4uLiBmb2xsb3dpbmcgdGhl
IHVzdWFsIHJ1bGVzLCB5b3Ugc2hvdWxkIG5vdyBjb252ZXJ0IGFsbCB1c2VzIG9mIHYtPmRvbWFp
biBpbiB0aGlzIGZ1bmN0aW9uIHRvIHVzZSBjdXJyZC4KCklmIHRoaXMgd2VyZSBuZXcgZGV2ZWxv
cG1lbnQgd29yayB0aGVuIHBlcmhhcHMgKGFsdGhvdWdoIGl0IHdvdWxkIHRha2UgYQpzZXJpZXMg
dG8gY2xlYW4gdm14X3ZtZXhpdF9oYW5kbGVyKCkgdXAgdG8gc3R5bGUpLgoKSW4gdGhpcyBjYXNl
IGhvd2V2ZXIsIHRoZSBwYXRjaCBuZWVkcyBiYWNrcG9ydGluZyB0byBhbGwgdGhlIHN0YWJsZQp0
cmVlcywgYXQgd2hpY2ggcG9pbnQgbWluaW11bSBwZXJ0dXJiYW5jZSBpcyB0aGUgbW9zdCBpbXBv
cnRhbnQgYXNwZWN0LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
