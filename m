From: "Woods, Brian" <Brian.Woods@amd.com>
Subject: Re: [PATCH 4/9] x86/amd: Introduce CPUID/MSR
 definitions for per-vcpu SSBD support
Date: Tue, 4 Dec 2018 16:06:22 +0000
Message-ID: <20181204160617.GA13738@amd.com>
References: <1543853902-6257-1-git-send-email-andrew.cooper3@citrix.com>
 <1543853902-6257-5-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1543853902-6257-5-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
Content-ID: <003522A983503D4187F4D5917D2E1C49@namprd12.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Woods, Brian" <Brian.Woods@amd.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBEZWMgMDMsIDIwMTggYXQgMDQ6MTg6MTdQTSArMDAwMCwgQW5keSBDb29wZXIgd3Jv
dGU6Cj4gQXQgdGhlIHRpbWUgb2Ygd3JpdGluZywgdGhlIHNwZWMgaXMgYXZhaWxhYmxlIGZyb206
Cj4gCj4gICBodHRwczovL2RldmVsb3Blci5hbWQuY29tL3dwLWNvbnRlbnQvcmVzb3VyY2VzLzEy
NDQ0MV9BTUQ2NF9TcGVjdWxhdGl2ZVN0b3JlQnlwYXNzRGlzYWJsZV9XaGl0ZXBhcGVyX2ZpbmFs
LnBkZgo+IAo+IEZ1dHVyZSBoYXJkd2FyZSAoWmVuIHYyKSBpcyBleHBlY3QgdG8gaGF2ZSBoYXJk
d2FyZSBNU1JfU1BFQ19DVFJMIHN1cHBvcnQsCj4gaW5jbHVkaW5nIFNQRUNfQ1RSTC5TU0JELCBh
bmQgd2l0aCB0aGUgZXhwZWN0YXRpb24gdGhhdCB0aGlzIHdpbGwgYmUgZGlyZWN0bHkKPiBwYXNz
ZWQgdGhyb3VnaCB0byBndWVzdHMgZm9yIHBlcmZvcm1hbmNlLgo+IAo+IE9uIGN1cnJlbnRseSBy
ZWxlYXNlZCBoYXJkd2FyZSwgdGhlIG9ubHkgbWVjaGFuaXNtIGF2YWlsYWJsZSBpcyB0aGUgbGVn
YWN5Cj4gTFNfQ0ZHIG9wdGlvbiwgYW5kIHRoaXMgaXMgdmVyeSBleHBlbnNpdmUgdG8gdXNlLiAg
RnVydGhlcm1vcmUsIGVtdWxhdGluZwo+IE1TUl9TUEVDX0NUUkwgdmlhIGludGVyY2VwdGlvbiBp
cyBwcm9oaWJpdGl2ZWx5IGV4cGVuc2l2ZSwgYXMgY2VydGFpbiBPU2VzIHVzZQo+IHRoZSB3cml0
ZS1kaXNjYXJkIGZsZXhpYmlsaXR5IHRvIHNpbXBsaWZ5IHRoZWlyIGVudHJ5L2V4aXQgbG9naWMu
Cj4gCj4gQXMgYW4gYWx0ZXJuYXRpdmUsIE1TUl9WSVJUX1NQRUNfQ1RSTCBpcyBzcGVjaWZpZWQg
YXMgYW4gYXJjaGl0ZWN0dXJhbCBjb250cm9sCj4gKHdpdGggc2VtYW50aWNzIGVxdWl2aWxlbnQg
dG8gTVNSX1NQRUNfQ1RSTCkgd2hpY2ggaXMgcHJvdmlkZWQgYnkgdGhlCj4gaHlwZXJ2aXNvci4g
IFRoaXMgYWJzdHJhY3RzIGF3YXkgdGhlIG1vZGVsLXNwZWNpZmljIGRldGFpbHMgb2YgdGhlIExT
X0NGRwo+IG1lY2hhbmlzbSwgd2hpY2ggYWxsb3dzIG1pZ3JhdGlvbiBzYWZldHkgdG8gYmUgcmV0
YWluZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KClJldmlld2QtYnk6IEJyaWFuIFdvb2RzIDxicmlhbi53b29kc0BhbWQuY29t
PgoKLS0gCkJyaWFuIFdvb2RzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
