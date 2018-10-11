From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] xen/blkfront: avoid NULL blkfront_info
 dereference on device removal
Date: Thu, 11 Oct 2018 18:34:27 +0200
Message-ID: <20181011163427.ilpsl4hxb2y3hcfp__10087.953360244$1539275597$gmane$org@mac.bytemobile.com>
References: <20181011162000.19191-1-vliaskovitis@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=h+49=mx=citrix.com=prvs=8150a737c=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gAdv3-0005hm-6l
 for xen-devel@lists.xenproject.org; Thu, 11 Oct 2018 16:34:37 +0000
Content-Disposition: inline
In-Reply-To: <20181011162000.19191-1-vliaskovitis@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Vasilis Liaskovitis <vliaskovitis@suse.com>
Cc: axboe@kernel.dk, jgross@suse.com, konrad.wilk@oracle.com, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBPY3QgMTEsIDIwMTggYXQgMDY6MjA6MDBQTSArMDIwMCwgVmFzaWxpcyBMaWFza292
aXRpcyB3cm90ZToKPiBJZiBhIGJsb2NrIGRldmljZSBpcyBob3QtYWRkZWQgd2hlbiB3ZSBhcmUg
b3V0IG9mIGdyYW50cywKPiBnbnR0YWJfZ3JhbnRfZm9yZWlnbl9hY2Nlc3MgZmFpbHMgd2l0aCAt
RU5PU1BDIChsb2cgbWVzc2FnZSAiMjgKPiBncmFudGluZyBhY2Nlc3MgdG8gcmluZyBwYWdlIikg
aW4gdGhpcyBjb2RlIHBhdGg6Cj4gCj4gICB0YWxrX3RvX2Jsa2JhY2sgLT4KPiAJc2V0dXBfYmxr
cmluZyAtPgo+IAkJeGVuYnVzX2dyYW50X3JpbmcgLT4KPiAJCQlnbnR0YWJfZ3JhbnRfZm9yZWln
bl9hY2Nlc3MKPiAKPiBhbmQgdGhlIGZhaWxpbmcgcGF0aCBpbiB0YWxrX3RvX2Jsa2JhY2sgc2V0
cyB0aGUgZHJpdmVyX2RhdGEgdG8gTlVMTDoKPiAKPiAgZGVzdHJveV9ibGtyaW5nOgo+ICAgICAg
ICAgYmxraWZfZnJlZShpbmZvLCAwKTsKPiAKPiAgICAgICAgIG11dGV4X2xvY2soJmJsa2Zyb250
X211dGV4KTsKPiAgICAgICAgIGZyZWVfaW5mbyhpbmZvKTsKPiAgICAgICAgIG11dGV4X3VubG9j
aygmYmxrZnJvbnRfbXV0ZXgpOwo+IAo+ICAgICAgICAgZGV2X3NldF9kcnZkYXRhKCZkZXYtPmRl
diwgTlVMTCk7Cj4gCj4gVGhpcyByZXN1bHRzIGluIGEgTlVMTCBwb2ludGVyIEJVRyB3aGVuIGJs
a2Zyb250X3JlbW92ZSBhbmQgYmxraWZfZnJlZQo+IHRyeSB0byBhY2Nlc3MgdGhlIGZhaWxpbmcg
ZGV2aWNlJ3MgTlVMTCBzdHJ1Y3QgYmxrZnJvbnRfaW5mby4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBW
YXNpbGlzIExpYXNrb3ZpdGlzIDx2bGlhc2tvdml0aXNAc3VzZS5jb20+Cj4gLS0tCj4gIGRyaXZl
cnMvYmxvY2sveGVuLWJsa2Zyb250LmMgfCA0ICsrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtmcm9udC5j
IGIvZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYwo+IGluZGV4IDQyOWQyMDEzMWM3ZS4uOTJj
YzZjYjZiMDc4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvYmxvY2sveGVuLWJsa2Zyb250LmMKPiAr
KysgYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtmcm9udC5jCj4gQEAgLTI0OTMsNiArMjQ5Myw5IEBA
IHN0YXRpYyBpbnQgYmxrZnJvbnRfcmVtb3ZlKHN0cnVjdCB4ZW5idXNfZGV2aWNlICp4YmRldikK
PiAgCj4gIAlkZXZfZGJnKCZ4YmRldi0+ZGV2LCAiJXMgcmVtb3ZlZCIsIHhiZGV2LT5ub2RlbmFt
ZSk7Cj4gIAo+ICsJaWYgKCFpbmZvKQo+ICsJCWdvdG8gb3V0OwoKSSBkb24ndCBzZWUgdGhlIHBv
aW50IGluIGFkZGluZyB0aGUgJ291dCcgbGFiZWwuIENhbiB5b3UganVzdCByZXR1cm4gMApoZXJl
PwoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
