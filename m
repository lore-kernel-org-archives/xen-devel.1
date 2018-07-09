From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] xen: Introduce an xmemdup() helper
Date: Mon, 9 Jul 2018 13:08:31 +0100
Message-ID: <3f0b227e-94f3-6502-74a9-b8b3e8ecd093@citrix.com>
References: <1531132188-20564-1-git-send-email-andrew.cooper3@citrix.com>
 <1531132188-20564-2-git-send-email-andrew.cooper3@citrix.com>
 <5B434ECC02000078001D24BF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B434ECC02000078001D24BF@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMDcvMTggMTM6MDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA5LjA3LjE4IGF0
IDEyOjI5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IC4uLiBhbmQgdXNl
IGl0IGluIHBsYWNlIG9mIHRoZSBvcGVuY29kZWQgaW5zdGFuY2VzLgo+Pgo+PiBGb3IgY29uc2lz
dGVuY3ksIHJlc3RydWN0dXJlIGluaXRfZG9tYWluX2NwdWlkX3BvbGljeSgpIHRvIGJlIGxpa2UK
Pj4gaW5pdF97ZG9tYWluLHZjcHV9X21zcl9wb2xpY3koKSBieSBvcGVyYXRpbmcgb24gdGhlIGxv
Y2FsIHBvaW50ZXIgd2hlcmUKPj4gcG9zc2libGUuCj4+Cj4+IE5vIGNoYW5nZSBpbiBiZWhhdmlv
dXIuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+Cj4gSSB0aGluayBpdCB3b3VsZCBiZSBuaWNlIHRvIG1lbnRpb24gdGhlIGNvbnN0
IHJlbGF0ZWQgcmVzdHJpY3Rpb24sIHRvCj4gbWFrZSBjbGVhciB3ZSB3b3VsZCB3YW50IHRoYXQg
dG8gYmUgd29ya2luZywgYnV0IHdlIGNhbid0IGZpbmQgYQo+IHNvbHV0aW9uIGF0IHRoZSBtb21l
bnQuCj4KPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Cj4g
d2l0aCBhIGNvc21ldGljIGlzc3VlIHRha2VuIGNhcmUgb2Y6Cj4KPj4gLS0tIGEveGVuL2FyY2gv
eDg2L2NwdWlkLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2NwdWlkLmMKPj4gQEAgLTcwMywxNiAr
NzAzLDE3IEBAIHZvaWQgcmVjYWxjdWxhdGVfY3B1aWRfcG9saWN5KHN0cnVjdCBkb21haW4gKmQp
Cj4+ICAKPj4gIGludCBpbml0X2RvbWFpbl9jcHVpZF9wb2xpY3koc3RydWN0IGRvbWFpbiAqZCkK
Pj4gIHsKPj4gLSAgICBkLT5hcmNoLmNwdWlkID0geG1hbGxvYyhzdHJ1Y3QgY3B1aWRfcG9saWN5
KTsKPj4gKyAgICBzdHJ1Y3QgY3B1aWRfcG9saWN5ICpwID0KPj4gKyAgICAgICAgeG1lbWR1cChp
c19wdl9kb21haW4oZCkgPyAmIHB2X21heF9jcHVpZF9wb2xpY3kKPiBTdHJheSBibGFuayAoc2Ft
ZSBiZWxvdyBpbiB0aGUgTVNSIGVxdWl2YWxlbnQpLgoKVGhhdCB3YXMgdGhlIHZpc3VhbGx5IGxp
bmUgdXAgdGhlIF9tYXhfY3B1aWRfcG9saWN5IHdpdGggaHZtIGJlbG93LgoKQW5vdGhlciBvcHRp
b24gd291bGQgYmUgIj/CoCAmcHZfIiB3aXRoIGEgZG91YmxlIHNwYWNlIGJlZm9yZSB0aGUgJi4K
Cn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
