From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH-for-4.12] docs: Fix dm_restrict documentation
Date: Fri, 25 Jan 2019 11:33:05 +0000
Message-ID: <20190125113305.aiw2u2fzzblb33mu@zion.uk.xensource.com>
References: <20190124174827.15902-1-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jZp+=QB=citrix.com=prvs=921c531d3=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gmzjS-000683-Vu
 for xen-devel@lists.xenproject.org; Fri, 25 Jan 2019 11:33:11 +0000
Content-Disposition: inline
In-Reply-To: <20190124174827.15902-1-george.dunlap@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMjQsIDIwMTkgYXQgMDU6NDg6MjdQTSArMDAwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBSZW1vdmUgImNoYXR0eSIgYW5kIHJlZHVuZGFudCBpbmZvcm1hdGlvbiBmcm9tIHRo
ZSB4bCBtYW4gcGFnZTsKPiByZXN0cmljdCBpdCB0byBmdW5jdGlvbmFsIGRlc2NyaXB0aW9ucyBv
bmx5LCBhbmQgcG9pbnQgaW5zdGVhZCB0bwo+IHFlbXUtZGVwcml2LnBhbmRvYyBhbmQgU1VQUE9S
VC5tZCBhcyBsb2NhdGlvbnMgZm9yICJjYW5vbmljYWwiCj4gaW5mb3JtYXRpb24uCj4gCj4gQWRk
IGEgbWFuIHBhZ2UgZW50cnkgZm9yIGRldmljZV9tb2RlbF91c2VyLgo+IAo+IFVwZGF0ZSBxZW11
LWRlcHJpdmlsZWdlLnBhbmRvYzoKPiAKPiBDaGFuZ2VzIGluIG1pc3NpbmcgZmVhdHVyZSBsaXN0
Ogo+IC0gTWlncmF0aW9uIGlzIGZ1bmN0aW9uYWwKPiAtIEJ1dCBxZGlzayBiYWNrZW5kcyBhcmUg
bm90Cj4gCj4gQWRkIGEgbWlzc2luZyByZXN0cmljdGlvbiBsaXN0Lgo+IAo+IFRoZSBmb2xsb3dp
bmcgc3RhdGVtZW50cyBmcm9tIHRoZSBtYW4gcGFnZSBhcmUgZHJvcHBlZDoKPiAtIE1lbnRpb25p
bmcgUFY7IFBWIGd1ZXN0cyBuZXZlciBoYXZlIGEgZGV2aWNlIG1vZGVsLgo+IC0gRHJvcCB0aGUg
Y29uZnVzaW5nIHN0YXRlbWVudCBhYm91dCBzdGR2Z2EgYW5kIGNpcnJ1cyB2Z2Egb3B0aW9ucy4K
PiAtIFJlLXVzZWQgZG9tYWluIElEcyBhcmUgbm93IGhhbmRsZWQuCj4gLSBEZXZpY2UgbW9kZWxz
IHNob3VsZCBubyBsb25nZXIgYmUgYWJsZSB0byBjcmVhdGUgd29ybGQtcmVhZGFibGUKPiAgIGZp
bGVzIG9uIGRvbTAncyBmaWxlc3lzdGVtLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBEdW5s
YXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KPiAtLS0KPiBSRkM6IEkgZG9uJ3Qga25vdyB3
aGF0IHRoZSAndmdhJyBsaW1pdGF0aW9uIHRoaW5nIHdhcyBhYm91dCAtLSBJIHRyaWVkCj4gYm90
aCAnZGVmYXVsdCcgYW5kICdzdGd2Z2EnIHdpdGggZG1fcmVzdHJpY3QgYW5kIHRoZXkgd29ya2Vk
IGZpbmUuCgpJIHRoaW5rIHVudGlsIHdlIGZpZ3VyZSBvdXQgdGhlIHNpdHVhdGlvbiBvZiB2Z2Es
IHRoZSBzdGF0ZW1lbnQgc2hvdWxkCnN0YXkuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
