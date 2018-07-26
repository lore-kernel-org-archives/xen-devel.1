From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v2] x86: assorted array_index_nospec()
 insertions
Date: Thu, 26 Jul 2018 16:43:47 +0300
Message-ID: <a6c25ed5-9485-ea70-664e-5f25a4915aec@bitdefender.com>
References: <5B59C78002000078001D8317@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wzqp=kk=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1figYe-0001Ua-RB
 for xen-devel@lists.xenproject.org; Thu, 26 Jul 2018 13:43:56 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 1C93B304BD83
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jul 2018 18:00:11 +0300 (EEST)
Received: from smtp03.buh.bitdefender.org (smtp.bitdefender.biz [10.17.80.77])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id BBECD7FC78
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jul 2018 16:43:54 +0300 (EEST)
In-Reply-To: <5B59C78002000078001D8317@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMjYvMjAxOCAwNDowNyBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gRG9uJ3QgY2hhbmNl
IGhhdmluZyBTcGVjdHJlIHYxIChpbmNsdWRpbmcgQkNCUykgZ2FkZ2V0cy4gSW4gc29tZSBvZiB0
aGUKPiBjYXNlcyB0aGUgaW5zZXJ0aW9ucyBhcmUgbW9yZSBvZiBwcmVjYXV0aW9uYXJ5IG5hdHVy
ZSByYXRoZXIgdGhhbiB0aGVyZQo+IHByb3ZhYmx5IGJlaW5nIGEgZ2FkZ2V0LCBidXQgSSB0aGlu
ayB3ZSBzaG91bGQgZXJyIG9uIHRoZSBzYWZlIChzZWN1cmUpCj4gc2lkZSBoZXJlLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAtLS0KPiB2Mjog
UmUtYmFzZS4gRHJvcCBndWVzdF9jcHVpZCgpIGNoYW5nZXMuIEZpeCBvZmYtYnktMSBpbgo+ICAg
ICB7ZG8sY29tcGF0fV9kbV9vcCgpLgoKQWNrZWQtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9j
YXJ1QGJpdGRlZmVuZGVyLmNvbT4KCgpUaGFua3MsClJhenZhbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
