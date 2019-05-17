From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 0/2] x86: cater for CPUID leaf 7 subleaf 1
Date: Fri, 17 May 2019 16:46:25 +0100
Message-ID: <d76d359d-ca76-400d-41a5-7aa6a36409cb@citrix.com>
References: <5CDEA72D020000780023015E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gdXm=TR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hRf45-0007Iu-T8
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 15:46:33 +0000
In-Reply-To: <5CDEA72D020000780023015E@prv1-mh.provo.novell.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTcvMDUvMjAxOSAxMzoyMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gV2hpbGUgSSd2ZSBhbHNv
IGFscmVhZHkgY29kZWQgdXAgdGhlIHBhdGNoIHRvIGFjdHVhbGx5IHN1cHBvcnQKPiB0aGUgbmV3
IEJGbG9hdDE2IGluc25zLCB0aGVyZSdzIGxpdHRsZSBwb2ludCBpbiBzdWJtaXR0aW5nIHRoaXMK
PiB3aXRob3V0IGhhdmluZyB0ZXN0ZWQgaXQuIEJ1dCB0aGUgdHdvIHByZXBhcmF0b3J5IHBhdGNo
ZXMgbWF5Cj4gdHVybiBvdXQgdXNlZnVsIGVhcmxpZXIgb24uIFRoZXkncmUgYmFzZWQgb24gdGhl
IGZ1bGwgQVZYNTEyCj4gZW11bGF0b3Igc2VyaWVzLCBidXQgc2hvdWxkbid0IGJlIG92ZXJseSBk
aWZmaWN1bHQgdG8gcmUtYmFzZQo+IGFoZWFkIG9mIGl0LgoKVG8gZm9sbG93IHVwIG9uIHRoZSBJ
UkMgY29udmVyc2F0aW9ucyB3aGljaCBvY2N1cnJlZCBiZWNhdXNlIG9mIG15IGVtYWlsCnByb2Js
ZW1zLi4uCgo+IDE6IHg4Ni9DUFVJRDogc3VwcG9ydCBsZWFmIDcgc3VibGVhZiAxIC8gQVZYNTEy
X0JGMTYKClJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgoKPiAyOiB4ODZlbXVsOiBzdXBwb3J0IENQVUlEIHN1YmxlYXZlcyBmb3IgdmNwdV9oYXNf
KigpCgpUaGlzIHBhdGNoIGhhcyBiZWVuIG9ic29sZXRlZCBmb2xsb3dpbmcgdGhlIGNvbXBsZXRp
b24gb2Ygc2VyaWVzIG9mIG1pbmUKZnJvbSBiZWZvcmUgSSBnb3QgYm9nZ2VkIGRvd24gaW4gWFNB
LTI5Nywgd2hpY2ggaGFzIGp1c3QgYmVlbiBjb21taXR0ZWQuCgpodHRwczovL3hlbmJpdHMueGVu
Lm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPWNvbW1pdGRpZmY7aD0zNDY2NjZjNGJkZjcyY2ExZDkw
OGJiY2RiOTE4NTk4MWFhYzdlNzQ5Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
