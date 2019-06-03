From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RESEND] xen: notifier: refine
 'notifier_head', use 'list_head' directly
Date: Mon, 03 Jun 2019 03:28:27 -0600
Message-ID: <5CF4E83B02000078002347AC@prv1-mh.provo.novell.com>
References: <1559525627-2701-1-git-send-email-chenbaodong@mxnavi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TYzS=UC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hXjGb-0001d6-Ev
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 09:28:33 +0000
In-Reply-To: <1559525627-2701-1-git-send-email-chenbaodong@mxnavi.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Baodong Chen <chenbaodong@mxnavi.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjA2LjE5IGF0IDAzOjMzLCA8Y2hlbmJhb2RvbmdAbXhuYXZpLmNvbT4gd3JvdGU6
Cj4gJ25vdGlmaWVyX2Jsb2NrJyBjYW4gYmUgcmVwbGFjZWQgd2l0aCAnbGlzdF9oZWFkJyB3aGVu
IHVzZWQgZm9yCj4gJ25vdGlmaWVyX2hlYWQnLCB0aGlzIG1ha2UgdGhlIGEgbGl0dGxlIG1vcmUg
Y2xlYXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogQmFvZG9uZyBDaGVuIDxjaGVuYmFvZG9uZ0BteG5h
dmkuY29tPgoKT2gsIGFuZCBhbHNvIGEgcmVtYXJrIHJlZ2FyZGluZyB0aGUgdGl0bGU6IFdoeSAi
UkVTRU5EIj8gVGhpcwpzaG91bGQgYmUgdXNlZCBvbmx5IGlmIHlvdSByZS1zZW5kIGFuIGVudGly
ZWx5IHVuY2hhbmdlZCBwYXRjaCwKcGVyaGFwcyBiZWNhdXNlIG9mIGEgY29ycmVjdGlvbiB0byB0
aGUgcmVjaXBpZW50cyBsaXN0LiBPdGhlcndpc2UKcGxlYXNlIGluY3JlbWVudCB0aGUgdmVyc2lv
biBudW1iZXIuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
