From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: fix build race when generating
 temporary object files
Date: Wed, 10 Apr 2019 13:56:03 +0100
Message-ID: <6c280652-e0d3-6328-e5cd-641e25ac5bea@citrix.com>
References: <5CACB2D10200007800225EDC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HBqT=SM=citrix.com=prvs=996c6fe0e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hECnM-0006Lj-S5
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 12:57:40 +0000
In-Reply-To: <5CACB2D10200007800225EDC@prv1-mh.provo.novell.com>
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

T24gMDkvMDQvMjAxOSAxNTo1NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlIHJ1bGVzIHRvIGdl
bmVyYXRlIHhlbi1zeW1zIGFuZCB4ZW4uZWZpIG1heSBydW4gaW4gcGFyYWxsZWwsIGJ1dCBib3Ro
Cj4gcmVjdXJzaXZlbHkgaW52b2tlICQoTUFLRSkgdG8gYnVpbGQgc3ltYm9sL3JlbG9jYXRpb24g
dGFibGUgdGVtcG9yYXJ5Cj4gb2JqZWN0IGZpbGVzLiBUaGVzZSByZWN1cnNpdmUgYnVpbGRzIHdv
dWxkIGJvdGggcmUtZ2VuZXJhdGUgdGhlIC4qLmQyCj4gZmlsZXMgKHdoZXJlIG5lZWRlZCkuIEJv
dGggd291bGQgaW4gdHVybiBpbnZva2UgdGhlIHNhbWUgcnVsZSwgdGh1cwo+IGFsbG93aW5nIGZv
ciBhIHJhY2Ugb24gdGhlIC4qLmQyLnRtcCBpbnRlcm1lZGlhdGUgZmlsZXMuCj4KPiBUaGUgZGVw
ZW5kZW5jeSBmaWxlcyBvZiB0aGUgdGVtcG9yYXJ5IC54ZW4qLm8gZmlsZXMgbGl2ZSBpbiB4ZW4v
IHJhdGhlcgo+IHRoYW4geGVuL2FyY2gveDg2LyBhbnl3YXksIHNvIHdvbid0IGJlIGluY2x1ZGVk
IG5vIG1hdHRlciB3aGF0LiBUYWtlIHRoZQo+IG9wcG9ydHVuaXR5IGFuZCBkZWxldGUgdGhlbSwg
YXMgdGhlIGp1c3QgcmUtZ2VuZXJhdGVkIC54ZW4qLlMgZmlsZXMgd2lsbAo+IHRyaWdnZXIgYSBw
cm9wZXIgcmUtYnVpbGQgb2YgdGhlIC54ZW4qLm8gb25lcyBhbnl3YXkuCj4KPiBFbXB0eSB0aGUg
REVQUyB2YXJpYWJsZSBpbiBjYXNlIHRoZSBzZXQgb2YgZ29hbHMgY29uc2lzdHMgb2YganVzdCB0
aG9zZQo+IHRlbXBvcmFyeSBvYmplY3QgZmlsZXMsIHRodXMgZWxpbWluYXRpbmcgdGhlIHJhY2Uu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpBY2tl
ZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
