From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v9 3/9] xen/x86: support per-domain flag for
 xpti
Date: Fri, 27 Apr 2018 02:15:25 -0600
Message-ID: <5AE2DC1D02000078001BF07D@prv1-mh.provo.novell.com>
References: <20180426113318.21838-1-jgross@suse.com>
 <20180426113318.21838-4-jgross@suse.com>
 <1524815725.3304.2.camel@citrix.com>
 <a210abb4-e0d7-9b21-dff5-4e86bc234d8b@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=kfj1=hq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fByXR-0008Lj-D9
 for xen-devel@lists.xenproject.org; Fri, 27 Apr 2018 08:15:29 +0000
In-Reply-To: <a210abb4-e0d7-9b21-dff5-4e86bc234d8b@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sergey Dyasli <sergey.dyasli@citrix.com>, Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjA0LjE4IGF0IDA5OjU5LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAy
Ny8wNC8xOCAwOTo1NSwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPj4gT24gVGh1LCAyMDE4LTA0LTI2
IGF0IDEzOjMzICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4gaW5kZXggYjM1MzM1MmFk
Zi4uMjIwZDFiYTAyMCAxMDA2NDQKPj4+IC0tLSBhL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5l
Lm1hcmtkb3duCj4+PiArKysgYi9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5tYXJrZG93bgo+
Pj4gQEAgLTE5NTUsMTQgKzE5NTUsMjQgQEAgY2x1c3RlcmVkIG1vZGUuICBUaGUgZGVmYXVsdCwg
Z2l2ZW4gbm8gaGludCBmcm9tIHRoZSAqKkZBRFQqKiwgaXMgY2x1c3Rlcgo+Pj4gIG1vZGUuCj4+
PiAgCj4+PiAgIyMjIHhwdGkKPj4+IC0+IGA9IDxib29sZWFuPmAKPj4+ICs+IGA9IExpc3Qgb2Yg
WyBkZWZhdWx0IHwgPGJvb2xlYW4+IHwgZG9tMD08Ym9vbD4gfCBkb211PTxib29sPiBdYAo+Pj4g
IAo+Pj4gLT4gRGVmYXVsdDogYGZhbHNlYCBvbiBBTUQgaGFyZHdhcmUKPj4+ICs+IERlZmF1bHQ6
IGBmYWxzZWAgb24gaGFyZHdhcmUgbm90IHRvIGJlIHZ1bG5lcmFibGUgdG8gTWVsdGRvd24gKGUu
Zy4gQU1EKQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGtub3duCj4gCj4gWWVzLCBpbmRlZWQuCgpSZWNvcmRl
ZCBmb3IgZXZlbnR1YWwgYXBwbGljYXRpb24gb2YgdGhlIHNlcmllczsgbm8gbmVlZCB0byByZXNl
bmQganVzdCBmb3IgdGhpcy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
