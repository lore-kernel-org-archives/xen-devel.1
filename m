From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v5 01/16] x86/mm: skip incrementing mfn if
 it is not a valid mfn
Date: Thu, 15 Mar 2018 12:16:14 +0000
Message-ID: <6529a09f-93fd-474d-358a-064f8a0948ee@citrix.com>
References: <20180314182009.14274-1-julien.grall@arm.com>
 <20180314182009.14274-2-julien.grall@arm.com>
 <0c778b64-7eda-48fb-7eaf-8e766dfc334a@citrix.com>
 <5AAA344B02000078001B1EBE@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5AAA344B02000078001B1EBE@prv-mh.provo.novell.com>
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
Cc: julien.grall@arm.com, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDMvMTggMDc6NTIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE0LjAzLjE4IGF0
IDE5OjMxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDE0LzAzLzE4
IDE4OjE5LCBqdWxpZW4uZ3JhbGxAYXJtLmNvbSB3cm90ZToKPj4+IEZyb206IFdlaSBMaXUgPHdl
aS5saXUyQGNpdHJpeC5jb20+Cj4+Pgo+Pj4gVGhlIGZ1bmN0aW9uIGlzIGNhbGxlZCB0byBmaWxs
IGluIHBhZ2UgdGFibGUgZW50cmllcyBpbgo+Pj4gcG9wdWxhdGVfcHRfcmFuZ2UuIFNraXAgaW5j
cmVtZW50aW5nIG1mbiBpZiBpdCBpcyBpbnZhbGlkLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFdl
aSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4+IFJlbWluZCBtZSB3aGF0IHRoZSBwdXJwb3Nl
IG9mIHRoaXMgcGF0Y2ggaXM/Cj4gVGhpcyBpcyBpbiBwcmVwYXJhdGlvbiB0byBzd2l0Y2ggY2Fs
bGVycyB0byBwYXNzIElOVkFMSURfTUZOCj4gaW5zdGVhZCBvZiB6ZXJvIGZvciBub24tcHJlc2Vu
dCBtYXBwaW5ncy4gVGhlIGluY3JlbWVudGluZwo+IGZyb20gemVybyB3YXMgd3JvbmcgaGVyZSBh
bHJlYWR5IChidXQgY291bGRuJ3QgYmUgYXMgZWFzaWx5Cj4gYXZvaWRlZCwgdG8gbm90IGNhdXNl
IHByb2JsZW1zIHdpdGggcG9zc2libGUgbGVnaXRpbWF0ZSB1c2VzIG9mCj4gTUZOIDApLCBidXQg
aW5jcmVtZW50aW5nIChhbmQgd3JhcHBpbmcpIGZyb20gSU5WQUxJRF9NRk4gaXMKPiAoaW1vKSBl
dmVuIHdvcnNlLCB3aGljaCBpcyB3aHkgSSBoYWQgYXNrZWQgdGhlIGNvbnZlcnNpb24gdG8KPiBJ
TlZBTElEX01GTiB0byBub3QgYmUgZG9uZSB3aXRob3V0IHRoaXMgY2hhbmdlLgoKWWVzLsKgIE15
IHJlcGx5IHdhcyBhIChjbGVhcmx5IHRvbykgdGhpbmx5IHZlaWxlZCBoaW50IHRoYXQgYSBzZW50
ZW5jZSB0bwp0aGlzIGVmZmVjdCBzaG91bGQgYmUgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLgoKVGhl
IGNvZGUgaXRzZWxmIGlzIGZpbmUuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
