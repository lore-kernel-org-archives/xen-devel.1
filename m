From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xtf: fix cdefs.h conflict with __section
Date: Thu, 22 Feb 2018 12:12:25 +0000
Message-ID: <a0a77063-1050-d0d4-5ee7-8050ae0e45cc@citrix.com>
References: <20180222120348.46267-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=i0y4=fq=citrix.com=prvs=5842a8f9a=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1eopjh-0004jk-R6
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2018 12:12:29 +0000
In-Reply-To: <20180222120348.46267-1-roger.pau@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDIvMTggMTI6MDMsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiBPbiBGcmVlQlNEIHRo
ZSBidWlsZCBmYWlscyB3aXRoOgo+Cj4gL3Jvb3Qvc3JjL3h0Zi9pbmNsdWRlL3h0Zi9jb21waWxl
ci5oOjEzOjk6IGVycm9yOiAnX19zZWN0aW9uJyBtYWNybyByZWRlZmluZWQKPiAgICAgICBbLVdl
cnJvciwtV21hY3JvLXJlZGVmaW5lZF0KPiAjZGVmaW5lIF9fc2VjdGlvbihzKSAgICAgICAgICBf
X2F0dHJpYnV0ZV9fKChfX3NlY3Rpb25fXyhzKSkpCj4gICAgICAgICBeCj4gL3Vzci9pbmNsdWRl
L3N5cy9jZGVmcy5oOjIyOTo5OiBub3RlOiBwcmV2aW91cyBkZWZpbml0aW9uIGlzIGhlcmUKPiAj
ZGVmaW5lIF9fc2VjdGlvbih4KSAgICBfX2F0dHJpYnV0ZV9fKChfX3NlY3Rpb25fXyh4KSkpCj4g
ICAgICAgICBeCj4gMSBlcnJvciBnZW5lcmF0ZWQuCj4KPiBPbmx5IGRlZmluZSBfX3NlY3Rpb24g
aWYgaXQncyB1bmRlZmluZWQgaW4gb3JkZXIgdG8gcHJldmVudCBjb25mbGljdHMuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCkFja2Vk
IGFuZCBwdXNoZWQuwqAgVGhhbmtzLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
