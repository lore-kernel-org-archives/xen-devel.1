From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: remove unnecessary condition check
 before kfree
Date: Mon, 10 Sep 2018 11:52:16 +0200
Message-ID: <12d9b430-e08a-3e28-5289-028f6b395d11__41312.4967636124$1536573069$gmane$org@suse.com>
References: <1536416318-34106-1-git-send-email-zhongjiang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mvod=ly=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fzIrn-0004bH-8i
 for xen-devel@lists.xenproject.org; Mon, 10 Sep 2018 09:52:23 +0000
In-Reply-To: <1536416318-34106-1-git-send-email-zhongjiang@huawei.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: zhong jiang <zhongjiang@huawei.com>, boris.ostrovsky@oracle.com
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDkvMTggMTY6MTgsIHpob25nIGppYW5nIHdyb3RlOgo+IGtmcmVlIGhhcyB0YWtlbiBu
dWxsIHBvaW50ZXIgaW50byBhY2NvdW50LiBTbyBqdXN0IHJlbW92ZSB0aGUKPiBjb25kaXRpb24g
Y2hlY2sgYmVmb3JlIGtmcmVlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IHpob25nIGppYW5nIDx6aG9u
Z2ppYW5nQGh1YXdlaS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMveGVuL3hlbi1hY3BpLXByb2Nlc3Nv
ci5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4veGVuLWFjcGktcHJvY2Vzc29yLmMgYi9k
cml2ZXJzL3hlbi94ZW4tYWNwaS1wcm9jZXNzb3IuYwo+IGluZGV4IGZiYjkxMzcuLjdlMWQ0OWUg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy94ZW4veGVuLWFjcGktcHJvY2Vzc29yLmMKPiArKysgYi9k
cml2ZXJzL3hlbi94ZW4tYWNwaS1wcm9jZXNzb3IuYwo+IEBAIC0yNjgsNyArMjY4LDcgQEAgc3Rh
dGljIGludCBwdXNoX3B4eF90b19oeXBlcnZpc29yKHN0cnVjdCBhY3BpX3Byb2Nlc3NvciAqX3By
KQo+ICAJCXByX3dhcm4oIihfUFhYKTogSHlwZXJ2aXNvciBlcnJvciAoJWQpIGZvciBBQ1BJIENQ
VSV1XG4iLAo+ICAJCQlyZXQsIF9wci0+YWNwaV9pZCk7Cj4gIGVycl9mcmVlOgo+IC0JaWYgKCFJ
U19FUlJfT1JfTlVMTChkc3Rfc3RhdGVzKSkKPiArCWlmICghSVNfRVJSKGRzdF9zdGF0ZXMpKQoK
VGhpcyBpcyBqdXN0IGEgY2hhbmdlIG9mIHRoZSBjb25kaXRpb24sIG5vdCBhIHJlbW92YWwuCgpJ
IGRvbid0IHRoaW5rIGNoYW5nZSBpcyB3b3J0aCBpdC4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
