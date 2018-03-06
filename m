From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 16/57] ARM: GICv3: rename HYP interface
 definitions to use ICH_ prefix
Date: Tue, 6 Mar 2018 15:12:07 +0000
Message-ID: <d58faf44-81b9-fde1-0cef-08fdb0e11d86@arm.com>
References: <20180305160415.16760-1-andre.przywara@linaro.org>
 <20180305160415.16760-17-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=lh2b=f4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1etEGB-0005S4-GV
 for xen-devel@lists.xenproject.org; Tue, 06 Mar 2018 15:12:11 +0000
In-Reply-To: <20180305160415.16760-17-andre.przywara@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmUsCgpPbiAwNS8wMy8xOCAxNjowMywgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4gT24g
YSBHSUN2MyBpbiBub24tY29tcGF0IG1vZGUgdGhlIGh5cGVydmlzb3IgaW50ZXJmYWNlIGlzIGFs
d2F5cwo+IGFjY2Vzc2VkIHZpYSBzeXN0ZW0gcmVnaXN0ZXJzLiBUaG9zZSByZWdpc3RlciBuYW1l
cyBoYXZlIGEgIklDSF8iIHByZWZpeAo+IGluIHRoZSBtYW51YWwsIHRvIGRpZmZlcmVudGlhdGUg
dGhlbSBmcm9tIHRoZSBNTUlPIHJlZ2lzdGVycy4gQWxzbyB0aG9zZQo+IHJlZ2lzdGVycyBhcmUg
bW9zdGx5IDY0LWJpdCAoY29tcGFyZWQgdG8gdGhlIDMyLWJpdCBHSUN2MiByZWdpc3RlcnMpIGFu
ZAo+IHVzZSBkaWZmZXJlbnQgYml0IGFzc2lnbm1lbnRzLgo+IFRvIG1ha2UgdGhpcyBvYnZpb3Vz
IGFuZCB0byBhdm9pZCBjbGFzaGVzIHdpdGggZG91YmxlIGRlZmluaXRpb25zIHVzaW5nCj4gdGhl
IHNhbWUgbmFtZXMgZm9yIGFjdHVhbGx5IGRpZmZlcmVudCBiaXRzLCBsZXRzIGNoYW5nZSBhbGwg
R0lDdjMKPiBoeXBlcnZpc29yIGludGVyZmFjZSByZWdpc3RlcnMgdG8gdXNlIHRoZSAiSUNIXyIg
cHJlZml4IGZyb20gdGhlIG1hbnVhbC4KPiBUaGlzIHJlbmFtZXMgdGhlIGRlZmluaXRpb25zIGlu
IGdpY192M19kZWZzLmggYW5kIHRoZWlyIHVzYWdlIGluIGdpYy12My5jCj4gYW5kIGlzIG5lZWRl
ZCB0byBhbGxvdyBjby1leGlzdGVuY2Ugb2YgdGhlIEdJQ3YyIGFuZCBHSUN2MyBkZWZpbml0aW9u
cwo+IGluIHRoZSBzYW1lIGZpbGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmUgUHJ6eXdhcmEg
PGFuZHJlLnByenl3YXJhQGxpbmFyby5vcmc+CgpJIGd1ZXNzIHRoaXMgd2FzIGNvbXBpbGVkIHRl
c3QgaW4gc3RhbmRhbG9uZT8gT24gdGhhdCBhIGJhc2lzOgoKQWNrZWQtYnk6IEp1bGllbiBHcmFs
bCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
