From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [SVM] Adding page access bits
Date: Thu, 10 May 2018 14:07:38 +0100
Message-ID: <bfd0b096-69cf-16f9-54d5-5e9ea6474922@citrix.com>
References: <1525957212.27235.13.camel@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hweu=h5=citrix.com=prvs=661df5714=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fGlIL-0001pV-R8
 for xen-devel@lists.xenproject.org; Thu, 10 May 2018 13:07:41 +0000
In-Reply-To: <1525957212.27235.13.camel@bitdefender.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>, "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMDUvMTggMTM6NTksIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOgo+IEhlbGxv
LAo+Cj4gV2Ugd2FudCB0byBhZGQgdGhlIHBhZ2UgYWNjZXNzIGZ1bmN0aW9uYWxpdHkgdG8gdGhl
IFNWTSBjb2RlLiBXZSBoYXZlCj4gYmVlbiB0cnlpbmcgdG8gYWRkIDQgYml0cyBpbiB0aGUgcHRl
IGJ1dCBhbGwgc2VlbSB0byBiZSB0YWtlbi4KPgo+IElzIHRoZXJlIGEgd2F5IHRvIGFjY29tbW9k
YXRlIHRoZW0gaW4gdGhlIDI0IGJpdCBmbGFnIG1hc2s/Cj4KPiBJIHRoaW5rIGl0IGNhbiBiZSBk
b25lIGJ5IG1vdmluZyB0aGUgNCBwcm90ZWN0aW9uIGtleSBmaWVsZCBiaXRzIGZyb20KPiAyMjox
OSB0byAyMzozMCBzbyB3ZSBjYW4gaGF2ZSB0aGUgMTk6MTYgZm9yIGFjY2Vzcy4gTm90IHN1cmUg
aWYgYml0IDIzCj4gaXMgY2xlYXIKPgo+IEFueSB0aG91Z2h0cyBvbiB0aGlzIG1hdHRlciBhcmUg
YXBwcmVjaWF0ZWQuCgpUaGUgNCBwcm90ZWN0aW9uIGtleSBiaXRzIGJpdHMgYXJlIGFyY2hpdGVj
dHVyYWxseSBkZWZpbmVkLsKgIFlvdSBjYW5ub3QKbW92ZSB0aGUgYml0cywgb3IgeW91IHdpbGwg
YnJlYWsgSW50ZWwuCgpUaGF0IHNhaWQsIEkgcHJlc3VtZSB5b3UgbWVhbiB0aGUgUFRFcyBmb3Ig
dGhlIE5QVCBwYWdldGFibGVzPwoKQU1EIGhhcmR3YXJlIGRvZXNuJ3Qgc3VwcG9ydCBQS1UgeWV0
LCBhbmQgaWYgdGhleSB3ZXJlIHRvIGltcGxlbWVudApzdXBwb3J0LCBJIGRvdWJ0IGl0IHdvdWxk
IGJlIGltcGxlbWVudGVkIGZvciB0aGUgTlBUIHRhYmxlcy7CoCBUaGVyZWZvcmUsCkkgdGhpbmsg
eW91IGNhbiBqdXN0IGFsaWFzIHRoZSA0IGJpdHMuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
