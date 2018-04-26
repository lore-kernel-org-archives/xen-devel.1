From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86emul: adjust handling of AVX2 gathers
Date: Thu, 26 Apr 2018 10:19:27 +0100
Message-ID: <5a5d7a31-7b20-a267-6209-0185185573df@citrix.com>
References: <5AD9B22502000078001BCE15@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cuix=hp=citrix.com=prvs=6477dd145=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fBd46-0007OQ-DQ
 for xen-devel@lists.xenproject.org; Thu, 26 Apr 2018 09:19:46 +0000
In-Reply-To: <5AD9B22502000078001BCE15@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDQvMTggMTA6MjUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEhWTSdzIE1NSU8gY2FjaGUg
b25seSBoYXMgYSBjYXBhY2l0eSBvZiB0aHJlZSBlbnRyaWVzLiBPbmNlIHJ1bm5pbmcgb3V0Cj4g
b2YgZW50cmllcywgaHZtZW11bF9saW5lYXJfbW1pb19hY2Nlc3MoKSB3aWxsIHJldHVybgo+IFg4
NkVNVUxfVU5IQU5ETEVBQkxFLiBTaW5jZSBnYXRoZXJzIGFyZSBhbiBpdGVyYXRpdmUgcHJvY2Vz
cyBhbnl3YXksCj4gc2ltcGx5IGNvbW1pdCB0aGUgcG9ydGlvbiBvZiB3b3JrIGRvbmUgaW4gdGhp
cyBhbmQgaHlwb3RoZXRpY2FsIHNpbWlsYXIKPiBjYXNlcywgZXhpdGluZyBiYWNrIHRvIGd1ZXN0
IGNvbnRleHQgZm9yIHRoZSBpbnNuIHRvIGJlIHJldHJpZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
