From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] xen/blkfront: correct purging of persistent
 grants
Date: Fri, 28 Sep 2018 08:45:26 -0400
Message-ID: <95e32835-426f-36c9-a86a-09563f090f22__45267.0196806595$1538138601$gmane$org@oracle.com>
References: <20180928072827.14229-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=a6ty=mk=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1g5s7t-00033v-KE
 for xen-devel@lists.xenproject.org; Fri, 28 Sep 2018 12:44:09 +0000
In-Reply-To: <20180928072827.14229-1-jgross@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, linux-block@vger.kernel.org
Cc: axboe@kernel.dk, konrad.wilk@oracle.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gOS8yOC8xOCAzOjI4IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IENvbW1pdCBhNDZiNTM2
NzJiMmMyZTM3NzBiMzhhNGFiZjkwZDE2MzY0ZDI1ODRiICgieGVuL2Jsa2Zyb250OiBjbGVhbnVw
Cj4gc3RhbGUgcGVyc2lzdGVudCBncmFudHMiKSBpbnRyb2R1Y2VkIGEgcmVncmVzc2lvbiBhcyBw
dXJnZWQgcGVyc2lzdGVudAo+IGdyYW50cyB3ZXJlIG5vdCBwdSBpbnRvIHRoZSBsaXN0IG9mIGZy
ZWUgZ3JhbnRzIGFnYWluLiBDb3JyZWN0IHRoYXQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvYmxvY2sveGVuLWJsa2Zy
b250LmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtmcm9udC5jIGIv
ZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYwo+IGluZGV4IGE3MWQ4MTdlOTAwZC4uNDI5ZDIw
MTMxYzdlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvYmxvY2sveGVuLWJsa2Zyb250LmMKPiArKysg
Yi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtmcm9udC5jCj4gQEAgLTI2NzAsOCArMjY3MCw4IEBAIHN0
YXRpYyB2b2lkIHB1cmdlX3BlcnNpc3RlbnRfZ3JhbnRzKHN0cnVjdCBibGtmcm9udF9pbmZvICpp
bmZvKQo+ICAJCQlsaXN0X2RlbCgmZ250X2xpc3RfZW50cnktPm5vZGUpOwo+ICAJCQlnbnR0YWJf
ZW5kX2ZvcmVpZ25fYWNjZXNzKGdudF9saXN0X2VudHJ5LT5ncmVmLCAwLCAwVUwpOwo+ICAJCQly
aW5mby0+cGVyc2lzdGVudF9nbnRzX2MtLTsKPiAtCQkJX19mcmVlX3BhZ2UoZ250X2xpc3RfZW50
cnktPnBhZ2UpOwo+IC0JCQlrZnJlZShnbnRfbGlzdF9lbnRyeSk7Cj4gKwkJCWdudF9saXN0X2Vu
dHJ5LT5ncmVmID0gR1JBTlRfSU5WQUxJRF9SRUY7Cj4gKwkJCWxpc3RfYWRkX3RhaWwoJmdudF9s
aXN0X2VudHJ5LT5ub2RlLCAmcmluZm8tPmdyYW50cyk7CgpTb3JyeSwgSSBkb24ndCBmb2xsb3cg
dGhpcy4gV2hhdCBpcyB0aGUgcHVycG9zZSBvZiByZW1vdmluZyB0aGUgZ3JhbnQKZnJvbSByaW5m
by0+Z3JhbnRzIGxpc3Qgd2l0aCBsaXN0X2RlbCgpIGFuZCB0aGVuIGFkZGluZyBpdCBiYWNrIHdp
dGgKbGlzdF9hZGRfdGFpbCgpPwoKLWJvcmlzCgoKPiAgCQl9Cj4gIAo+ICAJCXNwaW5fdW5sb2Nr
X2lycXJlc3RvcmUoJnJpbmZvLT5yaW5nX2xvY2ssIGZsYWdzKTsKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
