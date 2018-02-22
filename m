From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xtf: fix cdefs.h conflict with __section
Date: Thu, 22 Feb 2018 06:30:47 -0700
Message-ID: <5A8ED41702000078001AA670@prv-mh.provo.novell.com>
References: <20180222120348.46267-1-roger.pau@citrix.com>
 <5A8EC48502000078001AA5E0@prv-mh.provo.novell.com>
 <c4fefd72-dc3f-b8fb-9d30-06684aecbaf9@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=x7kc=fq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eoqxc-0002J8-Sg
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2018 13:30:56 +0000
In-Reply-To: <c4fefd72-dc3f-b8fb-9d30-06684aecbaf9@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjAyLjE4IGF0IDEzOjI4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjIvMDIvMTggMTI6MjQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyMi4w
Mi4xOCBhdCAxMzowMywgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToKPj4+IE9uIEZyZWVC
U0QgdGhlIGJ1aWxkIGZhaWxzIHdpdGg6Cj4+Pgo+Pj4gL3Jvb3Qvc3JjL3h0Zi9pbmNsdWRlL3h0
Zi9jb21waWxlci5oOjEzOjk6IGVycm9yOiAnX19zZWN0aW9uJyBtYWNybyAKPj4+IHJlZGVmaW5l
ZAo+Pj4gICAgICAgWy1XZXJyb3IsLVdtYWNyby1yZWRlZmluZWRdCj4+PiAjZGVmaW5lIF9fc2Vj
dGlvbihzKSAgICAgICAgICBfX2F0dHJpYnV0ZV9fKChfX3NlY3Rpb25fXyhzKSkpCj4+PiAgICAg
ICAgIF4KPj4+IC91c3IvaW5jbHVkZS9zeXMvY2RlZnMuaDoyMjk6OTogbm90ZTogcHJldmlvdXMg
ZGVmaW5pdGlvbiBpcyBoZXJlCj4+PiAjZGVmaW5lIF9fc2VjdGlvbih4KSAgICBfX2F0dHJpYnV0
ZV9fKChfX3NlY3Rpb25fXyh4KSkpCj4+PiAgICAgICAgIF4KPj4+IDEgZXJyb3IgZ2VuZXJhdGVk
Lgo+Pj4KPj4+IE9ubHkgZGVmaW5lIF9fc2VjdGlvbiBpZiBpdCdzIHVuZGVmaW5lZCBpbiBvcmRl
ciB0byBwcmV2ZW50IGNvbmZsaWN0cy4KPj4gQnV0IHRoZSBhY3R1YWwgYnVnIGlzIHRoYXQgL3Vz
ci9pbmNsdWRlL3N5cy9jZGVmcy5oIGlzIChtYWdpY2FsbHk/KQo+PiBiZWluZyBpbmNsdWRlZC4g
SnVzdCBsaWtlIHRoZSBoeXBlcnZpc29yIGJ1aWxkLCB0aGUgeHRmIG9uZSBzaG91bGRuJ3QKPj4g
cHVsbCBpbiBfYW55XyBleHRlcm5hbCBoZWFkZXJzLgo+IAo+IFhURiB1c2VzIHRoZSBmb2xsb3dp
bmcgZnJlZXN0YW5kaW5nIGhlYWRlcnMgb25seS4KPiAKPiAjaW5jbHVkZSA8c3RkaW50Lmg+Cj4g
I2luY2x1ZGUgPHN0ZGJvb2wuaD4KPiAjaW5jbHVkZSA8c3RkYXJnLmg+Cj4gI2luY2x1ZGUgPHN0
ZGRlZi5oPgo+ICNpbmNsdWRlIDxpbnR0eXBlcy5oPgo+ICNpbmNsdWRlIDxsaW1pdHMuaD4KCk5v
bmUgb2Ygd2hpY2ggY2FsbCBmb3IgX19zZWN0aW9uKCkgdG8gYmUgZGVmaW5lZC4gT3RvaCBfX3Nl
Y3Rpb24oKQppcyBhIHJlc2VydmVkIG5hbWUsIHNvIGl0IGNvdWxkIGJlIHVzZWQgZm9yIF9hbnl0
aGluZ18uIEkgdGhlcmVmb3JlCnRoaW5rIGl0IHNob3VsZCBiZSAjdW5kZWYtZWQsIGluc3RlYWQg
b2YgdGhlICNkZWZpbmUgYmVpbmcgbWFkZQpjb25kaXRpb25hbC4gKFRoZSBjb21tZW50IFJvZ2Vy
IGFkZHMgaXMgcHJldHR5IHVzZWxlc3MgYXMgd2VsbCwKY29uc2lkZXJpbmcgdGhlcmUncyBubyBj
ZGVmcy5oIGFueXdoZXJlIGluIHRoZSB4dGYgdHJlZS4pCgpKYW4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
