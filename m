From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [RFC 1/3] xen/balloon: Allow allocating DMA buffers
Date: Fri, 18 May 2018 18:04:07 -0400
Message-ID: <6a108876-19b7-49d0-3de2-9e10f984736c__10448.0614806109$1526680805$gmane$org@oracle.com>
References: <20180517082604.14828-1-andr2000@gmail.com>
 <20180517082604.14828-2-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=0s1y=if=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fJnQt-0006EV-BK
 for xen-devel@lists.xenproject.org; Fri, 18 May 2018 22:01:03 +0000
In-Reply-To: <20180517082604.14828-2-andr2000@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, jgross@suse.com, konrad.wilk@oracle.com
Cc: daniel.vetter@intel.com, matthew.d.roper@intel.com, dongwon.kim@intel.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMTcvMjAxOCAwNDoyNiBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4g
RnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVw
YW0uY29tPgoKCkEgY29tbWl0IG1lc3NhZ2Ugd291bGQgYmUgdXNlZnVsLgoKCj4KPiBTaWduZWQt
b2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29A
ZXBhbS5jb20+Cj4KPiAgCWZvciAoaSA9IDA7IGkgPCBucl9wYWdlczsgaSsrKSB7Cj4gLQkJcGFn
ZSA9IGFsbG9jX3BhZ2UoZ2ZwKTsKPiAtCQlpZiAocGFnZSA9PSBOVUxMKSB7Cj4gLQkJCW5yX3Bh
Z2VzID0gaTsKPiAtCQkJc3RhdGUgPSBCUF9FQUdBSU47Cj4gLQkJCWJyZWFrOwo+ICsJCWlmIChl
eHRfcGFnZXMpIHsKPiArCQkJcGFnZSA9IGV4dF9wYWdlc1tpXTsKPiArCQl9IGVsc2Ugewo+ICsJ
CQlwYWdlID0gYWxsb2NfcGFnZShnZnApOwo+ICsJCQlpZiAocGFnZSA9PSBOVUxMKSB7Cj4gKwkJ
CQlucl9wYWdlcyA9IGk7Cj4gKwkJCQlzdGF0ZSA9IEJQX0VBR0FJTjsKPiArCQkJCWJyZWFrOwo+
ICsJCQl9Cj4gIAkJfQo+ICAJCXNjcnViX3BhZ2UocGFnZSk7Cj4gIAkJbGlzdF9hZGQoJnBhZ2Ut
PmxydSwgJnBhZ2VzKTsKPiBAQCAtNTI5LDcgKzU2NSw3IEBAIHN0YXRpYyBlbnVtIGJwX3N0YXRl
IGRlY3JlYXNlX3Jlc2VydmF0aW9uKHVuc2lnbmVkIGxvbmcgbnJfcGFnZXMsIGdmcF90IGdmcCkK
PiAgCWkgPSAwOwo+ICAJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKHBhZ2UsIHRtcCwgJnBhZ2Vz
LCBscnUpIHsKPiAgCQkvKiBYRU5NRU1fZGVjcmVhc2VfcmVzZXJ2YXRpb24gcmVxdWlyZXMgYSBH
Rk4gKi8KPiAtCQlmcmFtZV9saXN0W2krK10gPSB4ZW5fcGFnZV90b19nZm4ocGFnZSk7Cj4gKwkJ
ZnJhbWVzW2krK10gPSB4ZW5fcGFnZV90b19nZm4ocGFnZSk7Cj4gIAo+ICAjaWZkZWYgQ09ORklH
X1hFTl9IQVZFX1BWTU1VCj4gIAkJLyoKPiBAQCAtNTUyLDE4ICs1ODgsMjIgQEAgc3RhdGljIGVu
dW0gYnBfc3RhdGUgZGVjcmVhc2VfcmVzZXJ2YXRpb24odW5zaWduZWQgbG9uZyBucl9wYWdlcywg
Z2ZwX3QgZ2ZwKQo+ICAjZW5kaWYKPiAgCQlsaXN0X2RlbCgmcGFnZS0+bHJ1KTsKPiAgCj4gLQkJ
YmFsbG9vbl9hcHBlbmQocGFnZSk7Cj4gKwkJaWYgKCFleHRfcGFnZXMpCj4gKwkJCWJhbGxvb25f
YXBwZW5kKHBhZ2UpOwoKClNvIHdoYXQgeW91IGFyZSBwcm9wb3NpbmcgaXMgbm90IHJlYWxseSBi
YWxsb29uaW5nLiBZb3UgYXJlIGp1c3QKcGlnZ3liYWNraW5nIG9uIGV4aXN0aW5nIGludGVyZmFj
ZXMsIGFyZW4ndCB5b3U/CgotYm9yaXMKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
