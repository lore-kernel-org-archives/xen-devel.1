From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 01/34] x86emul: support AVX512 opmask
 insns
Date: Fri, 26 Oct 2018 03:03:54 -0600
Message-ID: <5BD2D87A02000078001F4EE9@prv1-mh.provo.novell.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5BA0E58F02000078001E94CE@prv1-mh.provo.novell.com>
 <5BA0E71E02000078001E94EC@prv1-mh.provo.novell.com>
 <b48629ea-44bc-5658-5d5f-c739a680956f@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=n7n6=ng=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gFy2C-0005BJ-JY
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 09:04:00 +0000
In-Reply-To: <b48629ea-44bc-5658-5d5f-c739a680956f@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjEwLjE4IGF0IDIwOjMyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTgvMDkvMTggMTI6NTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBAQCAtMTE4Nyw2
ICsxMTg4LDExIEBAIHN0YXRpYyBpbnQgX2dldF9mcHUoCj4+ICAgICAgICAgICAgICByZXR1cm4g
WDg2RU1VTF9VTkhBTkRMRUFCTEU7Cj4+ICAgICAgICAgIGJyZWFrOwo+PiAgCj4+ICsgICAgY2Fz
ZSBYODZFTVVMX0ZQVV9vcG1hc2s6Cj4+ICsgICAgICAgIGlmICggISh4Y3IwICYgWDg2X1hDUjBf
U1NFKSB8fCAhKHhjcjAgJiBYODZfWENSMF9PUE1BU0spICkKPj4gKyAgICAgICAgICAgIHJldHVy
biBYODZFTVVMX1VOSEFORExFQUJMRTsKPj4gKyAgICAgICAgYnJlYWs7Cj4gCj4gSSBzZWUgdGhp
cyBmb2xsb3dzIHRoZSBwYXR0ZXJuIGZyb20gWDg2RU1VTF9GUFVfeW1tLCBidXQgYnkgdGhlIFNT
RQo+IGNoZWNrPyAgSXQgaXMgbm90IHJlbGV2YW50IGF0IHRoaXMgcG9pbnQgLSBpZiB4Y3IwLm9w
bWFzayBpcyBzZXQsIHRoZQo+IG9wbWFzayBpbnN0cnVjdGlvbnMgc2hvdWxkIGJlIHVzYWJsZS4K
Ckkgd291bGQgYWdyZWUgd2l0aCB5b3UgZnJvbSBhIGZ1bmN0aW9uYWwgUE9WLCBidXQgcGxlYXNl
IHNlZSB0aGUKbGFzdCByb3cgb2YgdGhlIHRhYmxlIG5hbWVkICJPUyBYU0FWRSBFbmFibGluZyBS
ZXF1aXJlbWVudHMgb2YKSW5zdHJ1Y3Rpb24gQ2F0ZWdvcmllcyIgaW4gU0RNIFZvbCAyLgoKSmFu
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
