From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 01/16] x86/mm: skip incrementing mfn if
 it is not a valid mfn
Date: Thu, 15 Mar 2018 01:49:13 -0600
Message-ID: <5AAA338902000078001B1EA9@prv-mh.provo.novell.com>
References: <20180314182009.14274-1-julien.grall@arm.com>
 <20180314182009.14274-2-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180314182009.14274-2-julien.grall@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: julien.grall@arm.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjAzLjE4IGF0IDE5OjE5LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IEZyb206IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gCj4gVGhlIGZ1bmN0aW9uIGlz
IGNhbGxlZCB0byBmaWxsIGluIHBhZ2UgdGFibGUgZW50cmllcyBpbgo+IHBvcHVsYXRlX3B0X3Jh
bmdlLiBTa2lwIGluY3JlbWVudGluZyBtZm4gaWYgaXQgaXMgaW52YWxpZC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCihZb3Ugc2hvdWxkIGhhdmUgQ2MtZWQgQW5kcmV3
IGFuZCBtZS4pCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
