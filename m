From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] pci: a workaround for nonstandard PCI
 devices whose PBA shares
Date: Mon, 09 Apr 2018 08:23:03 -0600
Message-ID: <5ACB936702000078001B9A2E@prv1-mh.provo.novell.com>
References: <1523279814-204165-1-git-send-email-chao.gao@intel.com>
 <5ACB895F02000078001B9982@prv1-mh.provo.novell.com>
 <20180409141053.GA205671@skl-4s-chao.sh.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180409141053.GA205671@skl-4s-chao.sh.intel.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Chao Gao <chao.gao@intel.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjA0LjE4IGF0IDE2OjEwLCA8Y2hhby5nYW9AaW50ZWwuY29tPiB3cm90ZToKPiBP
biBNb24sIEFwciAwOSwgMjAxOCBhdCAwNzo0MDoxNUFNIC0wNjAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPj5JJ20gbm90IGNvbnZpbmNlZCB0aG91Z2ggdGhhdCBhIGdsb2JhbCBvcHRpb24gaXMgd2Vs
bCBzdWl0ZWQgaGVyZToKPj5FeHBvc2luZyB0aGUgZGV2aWNlIGluIHRoaXMgd2F5IG1heSBiZSBv
a2F5IGZvciBvbmUgZ3Vlc3QsIGJ1dAo+Pm5vdCBmb3IgYW5vdGhlci4gV2l0aCB5b3VyIG1vZGVs
IG9uZSB3b3VsZCBuZWVkIHRvIHJlYm9vdCB0aGUKPj5lbnRpcmUgaG9zdCBmb3Igc3VjaCBhIHVz
YWdlIGNoYW5nZS4KPj4KPj5GdXJ0aGVybW9yZSBib290IHRpbWUgc3BlY2lmaWNhdGlvbiBvZiBT
QkRGIGlzIGEgcHJvYmxlbSB3aXRoIHRoZQo+PkRvbTAga2VybmVsIHBvc3NpYmx5IHJlLW9yZ2Fu
aXppbmcgdGhlIHRvcG9sb2d5LCBhbmQgaXMgbm90IGdvaW5nCj4+dG8gd29yayB3ZWxsIHdpdGgg
aG90LXBsdWdnZWQgZGV2aWNlcy4KPiAKPiBQb2ludCB0YWtlbi4gQnV0IG9uZSBjb25jZXJuIGlz
IGlmIHdlIGRvbid0IHNwZWNpZnkgZGV2aWNlcyBhdCBib290IHRpbWUKPiB3aGV0aGVyIFBWSCBk
b20wIGNhbiB1c2Ugc3VjaCBkZXZpY2VzIChpbiBteSB1bmRlcnN0YW5kaW5nLCBQVkggZG9tMAo+
IHdpbGwgdXNlIEVQVCwgaXQgd2lsbCBtZWV0IHRoZSBzYW1lIGlzc3VlIGFzIEhWTSBkb21VKS4g
SWYgbm90LCB3ZSBuZWVkCj4gdHJlYXQgZG9tMCBhcyBhbiBleGNlcHRpb247IHBhZ2VzIHdoZXJl
IFBCQSByZXNpZGVzIHdvbid0IGJlIG1hcmtlZCBhcwo+IHJlYWQtb25seS4gQnV0IG1taW9fcm9f
cmFuZ2VzIGlzIGdsb2JhbC4gTWF5YmUgYnVpbGQgdHdvIHNlcGFyYXRlCj4gbW1pb19yb19yYW5n
ZXMgZm9yIGRvbTAgYW5kIGRvbVU/CgpCb290IHRpbWUgRG9tMCBzZXR0aW5ncyBjYW4gY29tZSBm
cm9tIHRoZSBjb21tYW5kIGxpbmUuIEJ1dAphbHJlYWR5IGZvciBob3QtcGx1Z2dlZCBkZXZpY2Vz
ICh3aGljaCBnbyB0byBEb20wIGFzIHdlbGwpIHRoaXMKYXBwcm9hY2ggd291bGQgYnJlYWsuIEdl
bmVyYWxseSBwZXJtaXR0aW5nIERvbTAgd3JpdGUgYWNjZXNzCmhlcmUgaXMgY2VydGFpbmx5IGFu
IG9wdGlvbiwgYnV0IHN0cmljdGx5IG9ubHkgYXMgbG9uZyBhcyB0aGUgTVNJLVgKdGFibGUgd29u
J3QgYWxzbyBiZWNvbWUgd3JpdGFibGUuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
