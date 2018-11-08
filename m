From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH V4 1/3] x86/altp2m: propagate ept.ad changes
 to all active altp2ms
Date: Thu, 8 Nov 2018 16:56:43 +0000
Message-ID: <595aca62-5db8-5975-1a3d-75fcc88daeb3@citrix.com>
References: <1541083542-22464-1-git-send-email-rcojocaru@bitdefender.com>
 <1541083542-22464-2-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=+uh/=nt=citrix.com=prvs=843a23ecb=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gKnbr-000832-Sd
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 16:56:47 +0000
In-Reply-To: <1541083542-22464-2-git-send-email-rcojocaru@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDEvMjAxOCAwMjo0NSBQTSwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+IFRoaXMgcGF0
Y2ggaXMgYSBwcmUtcmVxdWlzaXRlIGZvciBmaXhpbmcgdGhlIGxvZ2RpcnR5IFZHQSBpc3N1ZQo+
IChkaXNwbGF5IGZyZWV6ZXMgd2hlbiBzd2l0Y2hpbmcgdG8gYSBuZXcgYWx0cDJtIHZpZXcgZWFy
bHkgaW4gYQo+IGRvbWFpbidzIGxpZmV0aW1lKSwgYnV0IHNlbnQgc2VwYXJhdGVseSBmb3IgZWFz
aWVyIHJldmlldy4KPiBUaGUgbmV3IGVwdF9zZXRfYWRfc3luYygpIGZ1bmN0aW9uIGhhcyBiZWVu
IGFkZGVkIHRvIHVwZGF0ZSBhbGwKPiBhY3RpdmUgYWx0cDJtcycgZXB0LmFkLiBOZXcgYWx0cDJt
cyB3aWxsIGluaGVyaXQgdGhlIGhvc3RwMm0ncwo+IGVwdC5hZCB2YWx1ZS4KPiAKPiBUaGUgcDJt
X3tlbixkaXN9YWJsZV9oYXJkd2FyZV9sb2dfZGlydHkoKSBob3N0cDJtIGxvY2tpbmcgaGFzCj4g
YmVlbiBtb3ZlZCB0byB0aGUgbmV3IGVwdF97ZW4sZGlzfWFibGVfaGFyZHdhcmVfbG9nX2RpcnR5
KCkKPiBmdW5jdGlvbnMgYXMgcGFydCBvZiB0aGUgY29kZSByZWZhY3RvcmluZywgd2hpbGUgbG9j
a3MgZm9yIHRoZQo+IGluZGl2aWR1YWwgYWx0cDJtcyBhcmUgdGFrZW4gaW4gZXB0X3NldF9hZF9z
eW5jKCkgKGNhbGxlZCBieQo+IGVwdF97ZW4sZGlzfWFibGVfcG1sKCkpLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KPiBTdWdn
ZXN0ZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KPiBUZXN0
ZWQtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KClNvcnJ5IGZvciB0
aGUgZGVsYXk6CgpBY2tlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXgu
Y29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
