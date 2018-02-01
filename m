From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: allow easier disabling of BTI
	mitigations
Date: Thu, 1 Feb 2018 12:36:05 +0000
Message-ID: <e5be181d-2bac-7a7f-9b9c-52833f3536e3@citrix.com>
References: <5A72E36C02000078001A4393@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=mbmt=e3=citrix.com=prvs=5634bc667=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ehE6A-00039Y-7B
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2018 12:36:14 +0000
In-Reply-To: <5A72E36C02000078001A4393@prv-mh.provo.novell.com>
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
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDIvMTggMDg6NTIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEBAIC0yNjgsNiArMjcxLDgg
QEAgZnVuY3Rpb25hbGl0eSBpcyBzdGlsbCBzZXQgdXAgc28gSUJSUyBjYQo+ICBPbiBoYXJkd2Fy
ZSBzdXBwb3J0aW5nIElCUEIsIHRoZSBgaWJwYj1gIG9wdGlvbiBjYW4gYmUgdXNlZCB0byBwcmV2
ZW50IFhlbgo+ICBmcm9tIGlzc3VpbmcgQnJhbmNoIFByZWRpY3Rpb24gQmFycmllcnMgb24gdmNw
dSBjb250ZXh0IHN3aXRjaGVzLgo+ICAKPiArVGhlIGByc2I9YCBvcHRpb24gY2FuIGJlIHVzZWQg
dG8gdW5pZm9ybWx5IHN1cHByZXNzIFJTQiBvdmVyd3JpdGluZy4KPiArCj4gIFRoZSBgcnNiX3Zt
ZXhpdD1gIGFuZCBgcnNiX25hdGl2ZT1gIG9wdGlvbnMgY2FuIGJlIHVzZWQgdG8gZmluZSB0dW5l
IHdoZW4gdGhlCj4gIFJTQiBnZXRzIG92ZXJ3cml0dGVuLiAgVGhlcmUgYXJlIGluZGl2aWR1YWwg
Y29udHJvbHMgZm9yIGFuIGVudHJ5IGZyb20gSFZNCj4gIGNvbnRleHQsIGFuZCBhbiBlbnRyeSBm
cm9tIGEgbmF0aXZlIChQViBvciBYZW4pIGNvbnRleHQuCgpJdCB3b3VsZCBwcm9iYWJseSBiZcKg
IGJldHRlciB0byBtZXJnZSB5b3VyIGNoYW5nZSBpbnRvIHRoaXMgcGFyYWdyYXBoLsKgCkhvdyBh
Ym91dDoKClRoZSBgcnNiPWAsIGByc2Jfdm1leGl0PWAgYW5kIGByc2JfbmF0aXZlPWAgb3B0aW9u
cyBjYW4gYmUgdXNlZCB0bwpjb250cm9sIHdoZW4gdGhlIFJTQiBnZXRzIG92ZXJ3cml0dGVuLsKg
IFRoZSBmb3JtZXIgY29udHJvbCBhbGwgUlNCCm92ZXJ3cml0aW5nLCB3aGlsZSB0aGUgbGF0dGVy
IHR3byBjYW4gYmUgdXNlZCB0byBmaW5lIHR1bmUgb3ZlcndyaXRpbmcKb24gZnJvbSBIVk0gY29u
dGV4dCwgYW5kIGFuIGVudHJ5IGZyb20gYSBuYXRpdmUgKFBWIG9yIFhlbikgY29udGV4dC4KCj8K
Ck90aGVyd2lzZSwgUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+CgpJIHJlYWxseSBuZWVkIHRvIGZpbmQgc29tZSB0aW1lIHRvIGltcGxlbWVudCBi
dGk9aHZtLW9ubHkKCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
