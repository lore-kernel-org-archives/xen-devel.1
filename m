From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 03/16 RESEND] rbtree: move some
 implementation details from rbtree.h to rbtree.c
Date: Wed, 20 Dec 2017 09:46:56 -0700
Message-ID: <5A3AA2100200007800198EA8@prv-mh.provo.novell.com>
References: <20171121152009.15591-1-kpraveen.lkml@gmail.com>
 <20171121152009.15591-4-kpraveen.lkml@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20171121152009.15591-4-kpraveen.lkml@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Praveen Kumar <kpraveen.lkml@gmail.com>
Cc: tim@xen.org, sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, dario.faggioli@citrix.com, ian.jackson@eu.citrix.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjExLjE3IGF0IDE2OjE5LCA8a3ByYXZlZW4ubGttbEBnbWFpbC5jb20+IHdyb3Rl
Ogo+IEZyb206IE1pY2hlbCBMZXNwaW5hc3NlIDx3YWxrZW5AZ29vZ2xlLmNvbT4KPiAKPiByYnRy
ZWUgdXNlcnMgbXVzdCB1c2UgdGhlIGRvY3VtZW50ZWQgQVBJcyB0byBtYW5pcHVsYXRlIHRoZSB0
cmVlCj4gc3RydWN0dXJlLiAgTG93LWxldmVsIGhlbHBlcnMgdG8gbWFuaXB1bGF0ZSBub2RlIGNv
bG9ycyBhbmQgcGFyZW50aG9vZCBhcmUKPiBub3QgcGFydCBvZiB0aGF0IEFQSSwgc28gbW92ZSB0
aGVtIHRvIGxpYi9yYnRyZWUuYwo+IAo+IFNpZ25lZC1vZmYtYnk6IE1pY2hlbCBMZXNwaW5hc3Nl
IDx3YWxrZW5AZ29vZ2xlLmNvbT4KPiBDYzogQW5kcmVhIEFyY2FuZ2VsaSA8YWFyY2FuZ2VAcmVk
aGF0LmNvbT4KPiBBY2tlZC1ieTogRGF2aWQgV29vZGhvdXNlIDxEYXZpZC5Xb29kaG91c2VAaW50
ZWwuY29tPgo+IENjOiBSaWsgdmFuIFJpZWwgPHJpZWxAcmVkaGF0LmNvbT4KPiBDYzogUGV0ZXIg
WmlqbHN0cmEgPGEucC56aWpsc3RyYUBjaGVsbG8ubmw+Cj4gQ2M6IERhbmllbCBTYW50b3MgPGRh
bmllbC5zYW50b3NAcG9ib3guY29tPgo+IENjOiBKZW5zIEF4Ym9lIDxheGJvZUBrZXJuZWwuZGs+
Cj4gQ2M6ICJFcmljIFcuIEJpZWRlcm1hbiIgPGViaWVkZXJtQHhtaXNzaW9uLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBEYXZpZCBXb29kaG91c2UgPERhdmlkLldvb2Rob3VzZUBpbnRlbC5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4K
PiBTaWduZWQtb2ZmLWJ5OiBMaW51cyBUb3J2YWxkcyA8dG9ydmFsZHNAbGludXgtZm91bmRhdGlv
bi5vcmc+Cj4gW0xpbnV4IGNvbW1pdCBiZjdhZDhlZWFiOTk1NzEwYzc2NmRmNDljOWM2OWE4NTky
Y2EwMjE2XQo+IAo+IFBvcnRlZCB0byBYZW4uCj4gCj4gU2lnbmVkLW9mZi1ieTogUHJhdmVlbiBL
dW1hciA8a3ByYXZlZW4ubGttbEBnbWFpbC5jb20+CgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
