From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [VMI] Possible race-condition in altp2m APIs
Date: Tue, 28 May 2019 18:58:25 -0700
Message-ID: <CABfawhkGCiRcCWrk4yKsNV88RJHrfV-_5-YyWe=NPKGcJbNb=A@mail.gmail.com>
References: <f3zRvkN8JOfpv5k6jz7TbWXz-sso4q6CGB-3S05mSco8SuDy0BoN5z5_Lj_-Xnto1FPMCkhE89trkq-_f6itwRZ5F4NI9MKrcqZk8cdT45A=@protonmail.com>
 <76bd924a-34b1-eb7c-d3be-6c33aa7729fc@citrix.com>
 <WL45-Mjyf7to-l_u4XAT3M46R6YcAECvEwl6SDzOWeLE_SOQUyF26Vj2cu0mScD47fS95OaBAWDddX7DL7yujvl03YffFRDoqrpRcFDSnxA=@protonmail.com>
 <oSx3iO5YqwrWedfgCT8yEj4jGrzisHnNA6d9XQIKAJJAOhr6TPANrqVHf6s56L8_WBgLtVMJv37Cypbr2emtg0ZKb25HdHo91eM1J1fVJHo=@protonmail.com>
 <4f34ed81-8993-2e5d-9aea-89a6e2d98b44@citrix.com>
 <rQKAjmE5sqmoHfveLrCC3tRz7edgAIkDUG5CRgmBhF975OXX_8ZdIsCFturwHzr04jeYiq5MPE5gHG3SeltMz5ZnrIs0XcO0QO_OXeBGhTg=@protonmail.com>
 <cf45071e-19dd-7afb-b9cf-55bb425d0908@citrix.com>
 <VDYDkg9Ke3s5AvTA6Dxcn9OU8vKyA-VlOf0K5B_IRIQs0F9B-XSWYjDPcQ-_TIe3qbVy410qpk5cIcL6KXYJAIr31L2qAr1ryodOkQSiUvk=@protonmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YOWO=T5=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hVnrs-00048m-N6
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 01:59:04 +0000
Received: by mail-lf1-f54.google.com with SMTP id q26so625030lfc.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 May 2019 18:59:02 -0700 (PDT)
In-Reply-To: <VDYDkg9Ke3s5AvTA6Dxcn9OU8vKyA-VlOf0K5B_IRIQs0F9B-XSWYjDPcQ-_TIe3qbVy410qpk5cIcL6KXYJAIr31L2qAr1ryodOkQSiUvk=@protonmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mathieu Tarral <mathieu.tarral@protonmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiBAVGFtYXMsIGlmIHlvdSBjb3VsZCBjaGVjayB0aGUgdHJhcHMgaW1wbGVtZW50YXRpb24uCgpJ
IGhhZCBhIHF1aWNrIGxvb2sgYW5kIGl0IHNlZW1zIGxpa2UgeW91IGZvcmdvdCB0byBzZXQgdGhl
IG1lbV9hY2Nlc3MKcGVybWlzc2lvbnMgb24gdGhlIHBhZ2VzLiBZb3UgbmVlZCB0aGUgcmVtYXBw
ZWQgZ2ZuJ3MgdG8gYmUgbWFya2VkCmV4ZWN1dGUtb25seSBpbiB0aGUgYWx0cDJtX2lkeCB2aWV3
LCBhbmQgdGhlaXIgYWN0dWFsIGdmbiBjb21wbGV0ZWx5CmluYWNjZXNzaWJsZSBpbiBhbHRwMm1f
aWR4LiBZb3UgbmVlZCB0byBzd2FwIHRoZSB2aWV3cyB3aGVuIHRob3NlCm1lbW9yeSBhY2Nlc3Mg
cGVybWlzc2lvbnMgYXJlIHZpb2xhdGVkIGFjY29yZGluZ2x5IHRvIHRoZSBob3N0cDJtIG9yCnRv
IHRoZSBhbHRwMm1faWRyIHZpZXcuIFdpdGhvdXQgdGhhdCBwYXRjaGd1YXJkIGlzIGdvaW5nIHRv
IGJsdWVzY3JlZW4KeW91LgoKQWxzbywgaWYgeW91IGNvcHkgY29kZSBmcm9tIHRoZSBEUkFLVlVG
IGNvZGUtYmFzZSBwbGVhc2UgbWFrZSBzdXJlIHlvdQphcHBseSB0aGUgbGljZW5zZSB0aGF0IGNv
bWVzIHdpdGggdGhhdCBjb2RlIChpdCdzIG5vdCBwbGFpbiBHUEwpLgoKVGhhbmtzLApUYW1hcwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
