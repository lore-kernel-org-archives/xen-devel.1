From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 01/12] xen: clang: Support correctly
 cross-compile
Date: Thu, 28 Mar 2019 10:14:27 +0000
Message-ID: <22e51ded-0ca3-6832-dcc3-9849d782816c@citrix.com>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-2-julien.grall@arm.com>
 <5C9C9A22020000780022265A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9APk=R7=citrix.com=prvs=98327f9ff=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h9S3O-0006Vh-4l
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2019 10:14:34 +0000
In-Reply-To: <5C9C9A22020000780022265A@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Julien Grall <julien.grall@arm.com>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, oleksandr_tyshchenko@epam.com, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDMvMjAxOSAwOTo1NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjcuMDMuMTkg
YXQgMTk6NDUsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IENsYW5nIHVzZXMgIi10
YXJnZXQiIG9wdGlvbiBmb3IgY3Jvc3MtY29tcGlsYXRpb24uCj4gQW5kIGFsbCBwb3NzaWJsZSB0
YXJnZXRzIGFyZSBhbHdheXMgYXZhaWxhYmxlPyBJJ2QgbGlrZSB0byBwb2ludCBvdXQKPiB0aGF0
IENST1NTX0NPTVBJTEUgY2FuIGJlIHVzZWQgZm9yIG90aGVyIHRoYW4gYWN0dWFsIGNyb3NzCj4g
Y29tcGlsYXRpb24sIGUuZy4gYnVpbGRpbmcgd2l0aCBqdXN0IGFuIGFsdGVybmF0aXZlIHRvb2wg
Y2hhaW4KPiBidWlsdCBmb3IgdGhlIHNhbWUgdGFyZ2V0LiBEcm9wcGluZyB0aGUgJChDUk9TU19D
T01QSUxFKQo+IHByZWZpeGVzIG1ha2VzIHRoaXMgaW1wb3NzaWJsZSBhZmFpY3QuIFJlcXVpcmlu
ZyBzdWl0YWJsZSB3cmFwcGVyCj4gc2NyaXB0cyB0byBiZSBwdXQgaW4gcGxhY2Ugd291bGQgc2Vl
bSBiZXR0ZXIgdG8gbWUuCj4KPiBJIGFsc28gd29uZGVyIHdoeSB0aGlzIGNoYW5nZSBpcyBuZWVk
ZWQgZm9yIEFybSwgYnV0IHdhc24ndAo+IG5lZWRlZCBzbyBmYXIgZm9yIHg4Ni4gQnV0IHBlcmhh
cHMgbm8tb25lIGV2ZXIgdHJpZWQgdXNpbmcgaXQKPiBzbyBmYXIgLi4uCgpJdCBzZWVtcyB0aGF0
IENST1NTX0NPTVBJTEUgaXMgYSBHTlUtaXNtLCB3aGljaCBpcyBub3Qgc2hhcmVkIGJ5IHRoZQpj
bGFuZyB3b3JsZC7CoCBJIGNhbid0IGZpbmQgYW55dGhpbmcgd2hpY2ggd2lsbCBtYWtlIHlvdSBh
CiRGT08tJEJBUi1jbGFuZyBiaW5hcnksIHdoZXJlYXMgeW91IGRvIHR5cGljYWxseSBnZXQgY2xh
bmctJFggYWxpYXNlcwpmb3IgdGhlIGRpZmZlcmVudCB2ZXJzaW9ucyBvZiBjbGFuZy4KClVzaW5n
IC10YXJnZXQgaXMgZnJvbSB0aGUgQ2xhbmcgaW5zdHJ1Y3Rpb25zIG9uIGNyb3NzIGNvbXBpbGF0
aW9uLCB3aGljaApzYXkgdG8gZG8gaXQgdGhpcyB3YXkuwqAgaHR0cHM6Ly9jbGFuZy5sbHZtLm9y
Zy9kb2NzL0Nyb3NzQ29tcGlsYXRpb24uaHRtbAoKVGhlIHRhcmdldHMgc3VwcG9ydGVkIHdpbGwg
ZGVwZW5kIG9uIHRoZSBjb25maWd1cmF0aW9uIENsYW5nIHdhcwpjb21waWxlZCB3aXRoLCBidXQg
Q2xhbmcgc3BlY2lmaWNhbGx5IG9wcG9zZXMgR0NDJ3Mgd2F5IG9mIHJlcXVpcmluZyB0aGUKdXNl
ciB0byByZWNvbXBpbGUgZm9yIGV2ZXJ5IGRpZmZlcmVudCB0YXJnZXQuwqAgSXQgaXMgZXhwZWN0
ZWQgdGhhdCBhCnBhY2thZ2VyIG9mIGNsYW5nIHdpbGwgZW5hYmxlIGFsbCBvZiB0aGUgc3VwcG9y
dGVkIHRhcmdldHMgaW4gdGhlCnBhY2thZ2UgdGhleSBkaXN0cmlidXRlLgoKfkFuZHJldwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
