From: tusherpat <akm2tosher@gmail.com>
Subject: Running Driver Domain in different mode and hypervisor
Date: Wed, 27 Feb 2019 15:40:19 -0500
Message-ID: <CAOiMPffpEyGe+j4Y==4ui0FtSLDyP44EsB=_-RCcUTKSvGbGrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VQaF=RC=gmail.com=akm2tosher@srs-us1.protection.inumbo.net>)
 id 1gz60G-0007DP-St
 for xen-devel@lists.xenproject.org; Wed, 27 Feb 2019 20:40:32 +0000
Received: by mail-it1-x129.google.com with SMTP id z131so11332354itf.5
 for <xen-devel@lists.xenproject.org>; Wed, 27 Feb 2019 12:40:31 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGkgR3V5cywgIGxhdGVseSwgSSBoYXZlIGJlZW4gdHJ5aW5nIHRvIHBsYXkgd2l0aCBYZW4gRHJp
dmVyIERvbWFpbi4gSQpoYXZlIGJlZW4gYWJsZSB0byBtYWtlIGl0IHdvcmsgd2hlcmUgYm90aCB0
aGUgIERyaXZlciBEb21haW4gT1MgYW5kCnRoZSBndWVzdCBPUyBhcmUgcnVuIG9uIHBhcmF2aXJ0
dWFsaXplZCAoUFYpIG1hY2hpbmUuIEhvd2V2ZXIsIGl0CmRvZXNuJ3Qgd29yayB3aGVuIGFueSBv
ZiB0aGVtIGFyZSBoYXJkd2FyZSB2aXJ0dWFsaXplZCBtYWNoaW5lIChIVk0pLgpUaGVyZWZvcmUs
IEkgaGF2ZSB0aGUgZm9sbG93aW5nIHF1ZXN0aW9ucyBub3cuICAxLiBJcyBpdCBwb3NzaWJsZSB0
bwpoYXZlIHRoZSBEcml2ZXIgRG9tYWluIGFuZCBndWVzdHMsIHdobyBhcmUgdXNpbmcgdGhlIGNv
cnJlc3BvbmRpbmcKZHJpdmVycywgcnVuIG9uIHZpcnR1YWwgbWFjaGluZXMgdXNpbmcgb3RoZXIg
dGhhbiB0aGUgUFYgbW9kZSwgbGlrZQpIVk0gb3IgUFZIVk0/IElmIHllcywgdGhlbiB3aGF0IGFy
ZSB0aGUgcG9zc2libGUgY29tYmluYXRpb25zPyAgMi4gSXMKaXQgcG9zc2libGUgdG8gdXNlIHZp
cnRJTyBmb3IgcGFyYXZpcnR1YWxpemF0aW9uIHdoZXJlIHRoZSB1bmRlcmx5aW5nCmh5cGVydmlz
b3IgaXMgWGVuPyBJZiB5ZXMsIHRoZW4gY2FuIHdlIHJ1biBEcml2ZXIgRG9tYWluIHVzaW5nIHZp
cnRJTz8KIDMuIElzIGl0IHBvc3NpYmxlIHRvIGhhdmUgYSBEcml2ZXIgRG9tYWluIHdoZXJlIHRo
ZSB1bmRlcmx5aW5nCmh5cGVydmlzb3IgaXMgS1ZNIGluc3RlYWQgb2YgWGVuPyAgVGhlIGxhc3Qg
cXVlc3Rpb24gbWF5IG5vdCBiZQpkaXJlY3RseSByZWxhdGVkIHRvIFhlbi4gSG93ZXZlciwgSSBh
bSB0ZW1wdGVkIHRvIGFzayBhcyBnb29kIHRoaW5ncwpsaWtlIFBWIHdhcyBmaXJzdCBpbnRyb2R1
Y2VkIGluIFhlbiB0aGVuIG90aGVycyBoeXBlcnZpc29ycyBhZGFwdGVkCnRoaXMgZGVzaWduLiAg
IFBsZWFzZSBsZXQgbWUga25vdyB5b3VyIHZhbHVhYmxlIG9waW5pb24gYW5kIGZlZWwgZnJlZQp0
byBwcm92aWRlIGFueSBsaW5rIHdoZXJlIEkgY2FuIHN0dWR5IGZ1cnRoZXIgcmVnYXJkaW5nIHRo
ZXNlIG1hdHRlcnMuClRoYW5rcywgTWVocmFiLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
