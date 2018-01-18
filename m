From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/hvm: more sure APIC assist is aborted
 if guest EOIs APIC
Date: Thu, 18 Jan 2018 05:57:40 -0700
Message-ID: <5A60A7D4020000780019FE93@prv-mh.provo.novell.com>
References: <20180117125353.3301-1-paul.durrant@citrix.com>
 <5A6069C9020000780019FB8D@prv-mh.provo.novell.com>
 <11888691a7414ff28915cec5ac8032a1@AMSPEX02CL03.citrite.net>
 <5A60793A020000780019FC41@prv-mh.provo.novell.com>
 <e6463fcadeff435eb0d885d9ce5c8a76@AMSPEX02CL03.citrite.net>
 <5A60823B020000780019FCB3@prv-mh.provo.novell.com>
 <9722a0ac6cdf48a287a9b493bf25ffeb@AMSPEX02CL03.citrite.net>
 <b83823802e9943ab8637e374c6b47391@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=udw+=en=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ec9lM-0000uq-EG
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2018 12:57:48 +0000
In-Reply-To: <b83823802e9943ab8637e374c6b47391@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjAxLjE4IGF0IDEyOjIxLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IEFjdHVhbGx5IHJlYWRpbmcgdGhyb3VnaCB0aGUgY29kZSBhbmQgdGhlIHNwZWMuIGFnYWlu
LCBJJ20gbm90IGNvbnZpbmNlZCBieSAKPiB0aGUgbG9naWMgZXZlbiB3aXRoIHRoZSBFT0kgZml4
LiBJdCBsb29rcyB0byBtZSBsaWtlIHZsYXBpY19oYXNfcGVuZGluZ19pcnEoKSAKPiBjb3VsZCBs
ZWF2ZSBhbiBleGlzdGluZyBhc3Npc3QgaW4gcGxhY2UgYW5kIHJldHVybiBhIGhpZ2hlciBwcmlv
cml0eSBpcnIgCj4gdmFsdWUuIFRoaXMgZ3Vlc3Qgd291bGQgdGhlbiBzZXJ2aWNlIHRoZSBoaWdo
ZXIgcHJpb3JpdHkgaW50ZXJydXB0LCBza2lwIHRoZSAKPiBFT0kgYmVjYXVzZSB0aGUgYXNzaXN0
IGJpdCBpcyBzZXQsIGJ1dCB0aGVuIHRoZSBuZXh0IGNhbGwgdG8gCj4gdmxhcGljX2hhc19wZW5k
aW5nX2lycSgpIHdvdWxkIGVycm9uZW91c2x5IGNsZWFyIHRoZSBsb3dlciBwcmlvcml0eSB2ZWN0
b3IgCj4gZnJvbSB0aGUgSVNSIGJlY2F1c2Ugd2Ugb3JpZ2luYWxseSBsYXRjaGVkIHRoZSBsb3dl
ciBwcmlvcml0eSB2ZWN0b3IuCj4gQXMgdGhlIHNwZWMuIHBvaW50cyBvdXQuLi4gb25seSB0aGUg
Zmlyc3QgRU9JIGNhbiBhdm9pZGVkLCB0aHVzIEknbSBub3Qgc3VyZSAKPiB0cnlpbmcgdG8gdHJh
Y2sgdGhlIHZlY3RvciBpbiB0aGUgdmlyaWRpYW4gY29kZSBpcyB3b3J0aCBpdC4gSXQgbG9va3Mg
bGlrZSAKPiB0aGUgY29ycmVjdCB0aGluZyB0byBkbyBhcyB0ZXN0IHdoZXRoZXIgYW4gRU9JIHdh
cyBhdm9pZGVkIGFuZCB0aGVuIGNsZWFyIHRoZSAKPiBoaWdoZXN0IHByaW9yaXR5IHZlY3RvciBp
biB0aGUgSVNSIChzaW5jZSwgaWYgd2UgaGFkbid0IHNxdWFzaGVkIGl0LCB0aGF0IAo+IHdvdWxk
IGhhdmUgYmVlbiB0aGUgZmlyc3QgRU9JKS4gV2UgY2FuIHRlc3Qgd2hlbiBhbiBFT0kgaXMgYXZv
aWRlZCBiZWNhdXNlIAo+IHRoZSBiaXQgaW4gdGhlIHNoYXJlZCBwYWdlIHdvdWxkIGhhdmUgdHJh
bnNpdGlvbmVkIGZyb20gMSB0byAwLgoKU291bmRzIHBsYXVzaWJsZSwgbG9va2luZyBmb3J3YXJk
IHRvIGEgcGF0Y2guCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
