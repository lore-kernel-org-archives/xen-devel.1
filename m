From: Weiwei Jia <harrynjit@gmail.com>
Subject: [RFC][PATCH] KVM: APPLES can improve the performance of
 applications and virtualized systems by up to 49%
Date: Sat, 12 May 2018 16:27:04 +0800
Message-ID: <CA+scX6kYH8Y9_f1PLcMHG-MD9bhXgd4gGpkJanjzvwwj9L=aOQ__43104.2322925807$1526113571$gmane$org@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fvqv=h7=gmail.com=harrynjit@srs-us1.protection.inumbo.net>)
 id 1fHPrw-0004F4-Pk
 for xen-devel@lists.xenproject.org; Sat, 12 May 2018 08:27:08 +0000
Received: by mail-lf0-x229.google.com with SMTP id b18-v6so10394743lfa.9
 for <xen-devel@lists.xenproject.org>; Sat, 12 May 2018 01:27:07 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org
Cc: xen-devel@lists.xenproject.org, Weiwei Jia <harryxiyou@gmail.com>, jianchen.shan@gmail.com, kvm@vger.kernel.org, dingxn@gmail.com
List-Id: xen-devel@lists.xenproject.org

RGVhciBhbGwsCgpSZWNlbnRseSwgd2UgbWFkZSBhIGZldyBpbXByb3ZlbWVudHMgb24gZWZmZWN0
aXZlbHkgdXRpbGl6aW5nIFBhdXNlCkxvb3AgRXhpdGluZyAoUExFKSBzdXBwb3J0IGZvciBoaWdo
ZXIgdGhyb3VnaHB1dCBvbiB2aXJ0dWFsaXplZApzeXN0ZW1zLiBCYXNpY2FsbHksIGl0IHNvbHZl
cyB0d28gcHJvYmxlbXM6IDEpIGhvdyB0byBhZGp1c3QKUExFX1dpbmRvdzsgMikgaG93IHRvIHNl
bGVjdCB2aXJ0dWFsIENQVXMgdG8gc2NoZWR1bGUgb24gVk1fRVhJVHMKY2F1c2VkIGJ5IFBMRS4g
T3VyIHRlc3RzIHdpdGggc3RhbmRhcmQgYmVuY2htYXJrcyBzaG93IHRoYXQgdGhlCmFwcHJvYWNo
IGNhbiBpbXByb3ZlIHBlcmZvcm1hbmNlIGJ5IHVwIHRvIDQ5JS4gVGhlIGFwcHJvYWNoIHNob3dz
CnByb21pc2luZyBwZXJmb3JtYW5jZSBhbmQgaXMgZWFzeSB0byBpbXBsZW1lbnQuIFdlIHRoaW5r
IHRoYXQgaXQgd291bGQKYmUgd29uZGVyZnVsIGlmIExpbnV4L0tWTSBhbmQgWEVOIGNhbiBjb25z
aWRlciB0aGUgYXBwcm9hY2guCgpXZSBhbHJlYWR5IGhhdmUgYSBwcm90b3R5cGUgaW1wbGVtZW50
YXRpb24gYmFzZWQgb24gS1ZNIChMaW51eCBLZXJuZWwKMy4xOS44KS4gT3VyIHBhdGNoIGZvciBM
aW51eCBLZXJuZWwgMy4xOS44IGFuZCB0aGUgcGFwZXIgZGVzY3JpYmluZwpvdXIgaWRlYSBhcmUg
YXZhaWxhYmxlIGluIEdpdGh1YiByZXBvc2l0b3J5IFsxXVsyXVszXS4gV2UgYXJlIHBsZWFzZWQK
dG8gcmV2aXNlIG91ciBwYXRjaCBpbiBvcmRlciB0byBtZXJnZSBpdCBpbnRvIExpbnV4L0tWTSBh
bmQgWEVOLiBXZQpob3BlIHRoYXQgeW91IGNhbiB0ZXN0IGFuZCBhZG9wdCBvdXIgYXBwcm9hY2gv
dGVjaG5pcXVlcy4gV2UgYXJlCnBsZWFzZWQgdG8gZ2V0IHNvbWUgY29tbWVudHMvc3VnZ2VzdGlv
bnMgb24gdGhlIGFwcHJvYWNoIGFuZCBvbiBob3cKdGhlIGlkZWEgY2FuIGJlIGFkb3B0ZWQvdGVz
dGVkIGJ5IExpbnV4L0tWTSBhbmQgWEVOLiBUaGFuayB5b3UuCgpbMV0gQVBQTEVTIHBhcGVyOiBo
dHRwczovL2dpdGh1Yi5jb20vc3lzbWVuL2FwcGxlcy90cmVlL21hc3Rlci9wYXBlcgpbMl0gQVBQ
TEVTIHBhdGNoOgpodHRwczovL2dpdGh1Yi5jb20vc3lzbWVuL2FwcGxlcy9ibG9iL21hc3Rlci9w
YXRjaGVzLzMuMTkuOC1BUFBMRVMucGF0Y2gKWzNdIEFQUExFUyBwYXRjaCBSRUFETUU6Cmh0dHBz
Oi8vZ2l0aHViLmNvbS9zeXNtZW4vYXBwbGVzL2Jsb2IvbWFzdGVyL3BhdGNoZXMvUkVBRE1FLnR4
dAoKQmVzdCBSZWdhcmRzLApTeXNtZW4gUmVzZWFyY2ggR3JvdXAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
