From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-next 4/9] xen/grant-table: Make arch
 specific macros typesafe
Date: Mon, 15 Apr 2019 23:07:39 +0100
Message-ID: <cab39720-04fd-f28d-e0d5-7ced34b9920b@arm.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-5-julien.grall@arm.com>
 <alpine.DEB.2.10.1904151457420.29275@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GzYx=SR=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hG9lu-0008KP-QV
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 22:08:14 +0000
In-Reply-To: <alpine.DEB.2.10.1904151457420.29275@sstabellini-ThinkPad-X260>
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
Cc: Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiA0LzE1LzE5IDExOjAzIFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24g
TW9uLCAxOCBGZWIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBObyBmdW5jdGlvbmFsIGNo
YW5nZXMgaW50ZW5kZWQuCj4gCj4gUGxlYXNlIGxpc3QgaGVyZSB0aGUgY2hhbmdlcyB0aGlzIHBh
dGNoIGlzIG1ha2luZzoKPiAKPiAtIHJlbmFtaW5nIGdudHRhYl9zaGFyZWRfZ21mbiB0byBnbnR0
YWJfc2hhcmVkX2dmbiB0byBmb2xsb3cgdGhlIG5hbWluZwo+ICAgIGNvbnZlbnRpb24gKGFuZCBv
dGhlcnMuKQoKT2sgZm9yIHRoaXMgYnV0Li4uCgo+IC0gbWFraW5nIGdudHRhYl9zaGFyZWRfZ21m
biByZXR1cm5pbmcgZ2ZuX3QKCi4uLiBpdCBkb2VzIG5vdCBtYWtlIHNlbnNlIHRvIG1lbnRpb24g
b25lIG1hY3JvIGFuZCBub3QgYWxsIHRoZSBvdGhlciAKdGhhdCB3YXMgbW9kaWZpZWQgYmVjYXVz
ZSBvZiB0aGUgY2hhbmdlLiBUaGlzIGlzIGFsc28gYWxyZWFkeSBwcmV0dHkgCmNsZWFyIGZyb20g
dGhlIGNvbW1pdCB0aXRsZSB0aGF0IGFsbCBtYWNyb3Mgd2lsbCBiZSB0eXBlc2FmZS4KClNvIEkg
d291bGQgcmF0aGVyIG5vdCBtZW50aW9uIHRoaXMuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
