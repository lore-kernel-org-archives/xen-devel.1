From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 8/9] libxl: Kill QEMU by uid when possible
Date: Thu, 29 Nov 2018 11:55:24 +0000
Message-ID: <20181129115524.4yjt2ff2hwwqjsgi@zion.uk.xensource.com>
References: <20181123171502.29519-1-george.dunlap@citrix.com>
 <20181123171502.29519-8-george.dunlap@citrix.com>
 <8b086fb2-e018-a669-b90d-42ce2179eaa7@citrix.com>
 <20181128155758.GA14786@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WpH9=OI=citrix.com=prvs=8644391f1=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gSKur-00028o-PD
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 11:55:33 +0000
Content-Disposition: inline
In-Reply-To: <20181128155758.GA14786@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBOb3YgMjgsIDIwMTggYXQgMDM6NTc6NThQTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gRnJpLCBOb3YgMjMsIDIwMTggYXQgMDU6MTg6NTlQTSArMDAwMCwgR2Vvcmdl
IER1bmxhcCB3cm90ZToKPiA+IE9uIDExLzIzLzE4IDU6MTUgUE0sIEdlb3JnZSBEdW5sYXAgd3Jv
dGU6Cj4gPiBEb2VzIGxpYnhsX19xbXBfY2xlYW51cCgpIG5lZWQgdG8gYmUgY2FsbGVkIGFmdGVy
IHRoZSBraWxsKCkgaGFwcGVucz8KPiA+IElmIG5vdCwgd2UgY291bGQgcHV0IHRoaXMgYmVmb3Jl
IHRoZSBraWxsKCkgYW5kIGF2b2lkIGhhdmluZyB0d28gY2FsbCBzaXRlcy4KPiAKPiBRRU1VIGlz
IHN1cHBvc2VkIHRvIGNyZWF0ZSBtb25pdG9yIHNvY2tldHMgYmVmb3JlIHRoZSBndWVzdCBpcyBy
dW5uaW5nLAo+IGV2ZW4gYmVmb3JlIGl0IGRyb3BzIHByaXZpbGVkZ2UsIHNvIEkgZG9uJ3QgdGhp
bmsgaXQgbWF0dGVyIHdoZW4gd2UgYHJtYAo+IHRob3NlIHFtcCBzb2NrZXRzLiBUaGVyZSBhcmUg
b25seSB1c2VmdWwgdG8gbGlieGwgYW55d2F5LCBvbmNlIGxpYnhsCj4gZG9uJ3QgbmVlZHMgdGhl
bSB0aGV5IGNhbiBiZSByZW1vdmVkLgo+IAo+IFNvLCBiZWZvcmUga2lsbCgpIHNob3VsZCBiZSBm
aW5lLgoKV2l0aCB0aGlzIHNjaGVtZSwgbXkgcXVlc3Rpb24gaXMgc3VwcG9zZWRseSB0aGVyZSBp
cyBhIHJvZ3VlIFFFTVUsIHdpbGwKaXQgYmUgYWJsZSB0byByZWNyZWF0ZSB0aGVzZSBzb2NrZXRz
IGFnYWluIGJ5IGZvcmtpbmcgc28gd2UgbWF5IGVuZCB1cApoYXZpbmcgc29tZSBnYXJiYWdlIGx5
aW5nIGFyb3VuZCBhZnRlciBpdCBoYXMgYmVlbiBraWxsZWQ/CgpXZWkuCgo+IAo+IC0tIAo+IEFu
dGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
