From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: Make grub error "too few arguments" with xen
Date: Tue, 4 Dec 2018 17:07:13 +0100
Message-ID: <20181204160713.ltygrio77k6t3uao__2280.87384389273$1543939569$gmane$org@tomti.i.net-space.pl>
References: <1B925CC0CD9F3341B32D442251E7E1DC3D86E797@shsmsx102.ccr.corp.intel.com>
 <1B925CC0CD9F3341B32D442251E7E1DC3D86F0A4@shsmsx102.ccr.corp.intel.com>
 <1B925CC0CD9F3341B32D442251E7E1DC3D8824F4@shsmsx102.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vnp8=on=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1gUDEN-0003Zy-1H
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 16:07:27 +0000
Content-Disposition: inline
In-Reply-To: <1B925CC0CD9F3341B32D442251E7E1DC3D8824F4@shsmsx102.ccr.corp.intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Chen, Farrah" <farrah.chen@intel.com>
Cc: "bug-grub@gnu.org" <bug-grub@gnu.org>, "Hao, Xudong" <xudong.hao@intel.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "ross.philipson@oracle.com" <ross.philipson@oracle.com>, "'phcoder@gmail.com'" <phcoder@gmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBEZWMgMDQsIDIwMTggYXQgMDU6NDk6MjRBTSArMDAwMCwgQ2hlbiwgRmFycmFoIHdy
b3RlOgo+IEhpIGFsbCwKPgo+IFdoZW4gSSBtYWtlIGdydWIsIEkgbWV0IGVycm9yICIgdG9vIGZl
dyBhcmd1bWVudHMgdG8gZnVuY3Rpb24gJ2dydWJfY3JlYXRlX2xvYWRlcl9jbWRsaW5lJyIgd2l0
aCB4ZW4uCj4gSSB1c2VkIGdpdCBiaXNlY3QgYW5kIGZvdW5kIHRoZSBlcnJvciBvY2N1cnJlZCBm
cm9tIGNvbW1pdDogNGQ0YThjOTZlMzU5M2Q3NmZlN2IwMjU2NjVjY2RlY2M3MGE1M2MxZi4KPiBE
byB5b3UgaGF2ZSBhbnkgaWRlYXM/IFRoYW5rcyBhIGxvdCEKPgo+IGNvbW1pdCA0ZDRhOGM5NmUz
NTkzZDc2ZmU3YjAyNTY2NWNjZGVjYzcwYTUzYzFmCj4gQXV0aG9yOiBWbGFkaW1pciBTZXJiaW5l
bmtvIDxwaGNvZGVyQGdtYWlsLmNvbT4KPiBEYXRlOiAgIFR1ZSBGZWIgNyAwMjoxMDoxNCAyMDE3
ICswMTAwCj4KPiAgICAgdmVyaWZpZXJzOiBBZGQgcG9zc2liaWxpdHkgdG8gdmVyaWZ5IGtlcm5l
bCBhbmQgbW9kdWxlcyBjb21tYW5kIGxpbmVzCj4KPiAgICAgU2lnbmVkLW9mZi1ieTogVmxhZGlt
aXIgU2VyYmluZW5rbyA8cGhjb2RlckBnbWFpbC5jb20+Cj4gICAgIFNpZ25lZC1vZmYtYnk6IERh
bmllbCBLaXBlciA8ZGFuaWVsLmtpcGVyQG9yYWNsZS5jb20+Cj4gICAgIFJldmlld2VkLWJ5OiBS
b3NzIFBoaWxpcHNvbiA8cm9zcy5waGlsaXBzb25Ab3JhY2xlLmNvbT4KPgo+IE1ha2Ugc3RlcHMg
YW5kIEVycm9yIGxvZzoKPgo+IGNkIGdydWIKPiAuL2F1dG9nZW4uc2gKPiAuL2NvbmZpZ3VyZSAt
LXRhcmdldD1hbWQ2NCAtLXdpdGgtcGxhdGZvcm09eGVuIC0tcHJlZml4PSR7UFdEfS8uLi9wdmdy
dWIyCj4gbWFrZQo+IC4uCj4gbG9hZGVyL2kzODYveGVuLmM6IEluIGZ1bmN0aW9uICdncnViX2Nt
ZF94ZW4nOgo+IGxvYWRlci9pMzg2L3hlbi5jOjY1MDoxMDogZXJyb3I6IHRvbyBmZXcgYXJndW1l
bnRzIHRvIGZ1bmN0aW9uICdncnViX2NyZWF0ZV9sb2FkZXJfY21kbGluZScKPiDCoMKgwqDCoMKg
wqDCoMKgwqAgc2l6ZW9mICh4ZW5fc3RhdGUubmV4dF9zdGFydC5jbWRfbGluZSkgLSAxKTsKPiDC
oMKgwqDCoMKgwqDCoMKgwqAgXgoKWy4uLl0KClVnaC4uLiBUaGlzIGlzIHRoZSBmYWxsb3V0IGFm
dGVyIHZlcmlmaWVycyBmcmFtZXdvcmsgaW50cm9kdWN0aW9uLgpJIHdpbGwgZml4IHRoaXMgYW5k
IHBvc3QgdGhlIHBhdGNoZXMgcHJvYmFibHkgdG9tb3Jyb3cuIFNvcnJ5IGZvcgp0aGUgY29uZnVz
aW9uLgoKRGFuaWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
