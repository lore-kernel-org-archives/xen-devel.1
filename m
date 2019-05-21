From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] xen/arm64: livepatch: Fix build after
 03957f58db
Date: Tue, 21 May 2019 16:37:14 +0100
Message-ID: <c6dcc913-1baf-dfca-8016-708b087e3cd9@arm.com>
References: <20190521142913.22394-1-julien.grall@arm.com>
 <alpine.DEB.2.21.1905210836050.16404@sstabellini-ThinkPad-T480s>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YYEG=TV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hT6pJ-0006Et-VQ
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 15:37:17 +0000
In-Reply-To: <alpine.DEB.2.21.1905210836050.16404@sstabellini-ThinkPad-T480s>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiA1LzIxLzE5IDQ6MzYgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBPbiBUdWUs
IDIxIE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IENvbW1pdCAwMzk1N2Y1OGRiICJ4
ZW4vY29uc3Q6IEV4dGVuZCB0aGUgZXhpc3RpbmcgbWFjcm8gQklUIHRvIHRha2UgYQo+PiBzdWZm
aXggaW4gcGFyYW1ldGVyIiBkaWRuJ3QgY29udmVydCBhbGwgdGhlIGNhbGxlcnMgb2YgdGhlIG1h
Y3JvIEJJVC4KPj4KPj4gVGhpcyB3aWxsIHJlc3VsdCB0byBhIGJ1aWxkIGJyZWFrYWdlIHdoZW4g
ZW5hYmxpbmcgTGl2ZXBhdGNoIG9uIGFybTY0Lgo+Pgo+PiBSZXBvcnRlZC1ieTogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogSnVsaWVu
IEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiAKPiBBY2tlZC1ieTogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKRklZIGl0IHdhcyBhbHJlYWR5IG1lcmdl
ZCB0byB1bmJsb2NrIHRoZSBidWlsZC4gRnJvbSBteSB1bmRlcnN0YW5kaW5nLCAKYW55IGFjayBm
cm9tIHRoZSByZXN0IGlzIHN1ZmZpY2llbnQgaW4gdGhhdCBjYXNlLgoKQ2hlZXJzLAoKLS0gCkp1
bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
