From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: use hvc console for dom0
Date: Tue, 27 Feb 2018 10:26:40 +0100
Message-ID: <0bee63f6-6681-5cb1-b763-66cf8304ae84__42553.8637362935$1519723535$gmane$org@suse.com>
References: <20180226110822.13787-1-jgross@suse.com>
 <16e21e9e-35d5-81f2-0f90-df5f8ac72446@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=gjir=fv=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1eqbX9-0007oq-OP
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2018 09:26:51 +0000
In-Reply-To: <16e21e9e-35d5-81f2-0f90-df5f8ac72446@oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMDIvMTggMjA6MDIsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBPbiAwMi8yNi8yMDE4
IDA2OjA4IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBUb2RheSB0aGUgaHZjIGNvbnNvbGUg
aXMgYWRkZWQgYXMgYSBwcmVmZXJyZWQgY29uc29sZSBmb3IgcHYgZG9tVXMKPj4gb25seS4gQXMg
dGhpcyByZXF1aXJlcyBhIGJvb3QgcGFyYW1ldGVyIGZvciBnZXR0aW5nIGRvbTAgbWVzc2FnZXMg
cGVyCj4+IGRlZmF1bHQgYWRkIGl0IGZvciBkb20wLCB0b28uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPj4gLS0tCj4+ICBhcmNoL3g4Ni94ZW4v
ZW5saWdodGVuX3B2LmMgfCA0ICsrKy0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0
ZW5fcHYuYyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYwo+PiBpbmRleCBjMDQ3ZjQyNTUy
ZTEuLmQyNzc0MGE4MGM1ZSAxMDA2NDQKPj4gLS0tIGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9w
di5jCj4+ICsrKyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYwo+PiBAQCAtMTM3Nyw3ICsx
Mzc3LDYgQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgdm9pZCBfX2luaXQgeGVuX3N0YXJ0X2tlcm5l
bCh2b2lkKQo+PiAgCWlmICgheGVuX2luaXRpYWxfZG9tYWluKCkpIHsKPj4gIAkJYWRkX3ByZWZl
cnJlZF9jb25zb2xlKCJ4ZW5ib290IiwgMCwgTlVMTCk7Cj4+ICAJCWFkZF9wcmVmZXJyZWRfY29u
c29sZSgidHR5IiwgMCwgTlVMTCk7Cj4+IC0JCWFkZF9wcmVmZXJyZWRfY29uc29sZSgiaHZjIiwg
MCwgTlVMTCk7Cj4+ICAJCWlmIChwY2lfeGVuKQo+PiAgCQkJeDg2X2luaXQucGNpLmFyY2hfaW5p
dCA9IHBjaV94ZW5faW5pdDsKPj4gIAl9IGVsc2Ugewo+PiBAQCAtMTQxMCw2ICsxNDA5LDkgQEAg
YXNtbGlua2FnZSBfX3Zpc2libGUgdm9pZCBfX2luaXQgeGVuX3N0YXJ0X2tlcm5lbCh2b2lkKQo+
PiAgCj4+ICAJCXhlbl9ib290X3BhcmFtc19pbml0X2VkZCgpOwo+PiAgCX0KPj4gKwo+PiArCWFk
ZF9wcmVmZXJyZWRfY29uc29sZSgiaHZjIiwgMCwgTlVMTCk7Cj4+ICsKPiAKPiBXb24ndCB0aGlz
IHByZXZlbnQgZG9tMCBvdXRwdXQgZnJvbSBzaG93aW5nIHVwIG9uIHZnYSBjb25zb2xlIGJ5IGRl
ZmF1bHQ/CgpSaWdodCwgd2UgbmVlZCB0byBhZGQgInR0eSIsIHRvby4KCldpbGwgc2VuZCBWMi4K
CgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
