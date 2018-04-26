From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86emul: adjust handling of AVX2 gathers
Date: Thu, 26 Apr 2018 08:18:40 +0200
Message-ID: <303e0947-1eeb-41ec-df86-016684121d9e@suse.com>
References: <5AD9B22502000078001BCE15@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=thde=hp=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fBaEv-0002hE-0w
 for xen-devel@lists.xenproject.org; Thu, 26 Apr 2018 06:18:45 +0000
In-Reply-To: <5AD9B22502000078001BCE15@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDQvMTggMTE6MjUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEhWTSdzIE1NSU8gY2FjaGUg
b25seSBoYXMgYSBjYXBhY2l0eSBvZiB0aHJlZSBlbnRyaWVzLiBPbmNlIHJ1bm5pbmcgb3V0Cj4g
b2YgZW50cmllcywgaHZtZW11bF9saW5lYXJfbW1pb19hY2Nlc3MoKSB3aWxsIHJldHVybgo+IFg4
NkVNVUxfVU5IQU5ETEVBQkxFLiBTaW5jZSBnYXRoZXJzIGFyZSBhbiBpdGVyYXRpdmUgcHJvY2Vz
cyBhbnl3YXksCj4gc2ltcGx5IGNvbW1pdCB0aGUgcG9ydGlvbiBvZiB3b3JrIGRvbmUgaW4gdGhp
cyBhbmQgaHlwb3RoZXRpY2FsIHNpbWlsYXIKPiBjYXNlcywgZXhpdGluZyBiYWNrIHRvIGd1ZXN0
IGNvbnRleHQgZm9yIHRoZSBpbnNuIHRvIGJlIHJldHJpZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
