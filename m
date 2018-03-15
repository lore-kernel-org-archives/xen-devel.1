From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 01/16] x86/mm: skip incrementing mfn if
 it is not a valid mfn
Date: Thu, 15 Mar 2018 01:52:27 -0600
Message-ID: <5AAA344B02000078001B1EBE@prv-mh.provo.novell.com>
References: <20180314182009.14274-1-julien.grall@arm.com>
 <20180314182009.14274-2-julien.grall@arm.com>
 <0c778b64-7eda-48fb-7eaf-8e766dfc334a@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <0c778b64-7eda-48fb-7eaf-8e766dfc334a@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: julien.grall@arm.com, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjAzLjE4IGF0IDE5OjMxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTQvMDMvMTggMTg6MTksIGp1bGllbi5ncmFsbEBhcm0uY29tIHdyb3RlOgo+PiBG
cm9tOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+Pgo+PiBUaGUgZnVuY3Rpb24gaXMg
Y2FsbGVkIHRvIGZpbGwgaW4gcGFnZSB0YWJsZSBlbnRyaWVzIGluCj4+IHBvcHVsYXRlX3B0X3Jh
bmdlLiBTa2lwIGluY3JlbWVudGluZyBtZm4gaWYgaXQgaXMgaW52YWxpZC4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAKPiBSZW1pbmQgbWUgd2hh
dCB0aGUgcHVycG9zZSBvZiB0aGlzIHBhdGNoIGlzPwoKVGhpcyBpcyBpbiBwcmVwYXJhdGlvbiB0
byBzd2l0Y2ggY2FsbGVycyB0byBwYXNzIElOVkFMSURfTUZOCmluc3RlYWQgb2YgemVybyBmb3Ig
bm9uLXByZXNlbnQgbWFwcGluZ3MuIFRoZSBpbmNyZW1lbnRpbmcKZnJvbSB6ZXJvIHdhcyB3cm9u
ZyBoZXJlIGFscmVhZHkgKGJ1dCBjb3VsZG4ndCBiZSBhcyBlYXNpbHkKYXZvaWRlZCwgdG8gbm90
IGNhdXNlIHByb2JsZW1zIHdpdGggcG9zc2libGUgbGVnaXRpbWF0ZSB1c2VzIG9mCk1GTiAwKSwg
YnV0IGluY3JlbWVudGluZyAoYW5kIHdyYXBwaW5nKSBmcm9tIElOVkFMSURfTUZOIGlzCihpbW8p
IGV2ZW4gd29yc2UsIHdoaWNoIGlzIHdoeSBJIGhhZCBhc2tlZCB0aGUgY29udmVyc2lvbiB0bwpJ
TlZBTElEX01GTiB0byBub3QgYmUgZG9uZSB3aXRob3V0IHRoaXMgY2hhbmdlLgoKSmFuCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
