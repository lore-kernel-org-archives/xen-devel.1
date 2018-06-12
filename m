From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 6/9] x86/vmx: Pass an MSR value into
 vmx_msr_add()
Date: Tue, 12 Jun 2018 02:19:25 -0600
Message-ID: <5B1F820D02000078001CA435@prv1-mh.provo.novell.com>
References: <1528483723-4128-1-git-send-email-andrew.cooper3@citrix.com>
 <1528483723-4128-7-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1528483723-4128-7-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjA2LjE4IGF0IDIwOjQ4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhlIG1haW4gcHVycG9zZSBvZiB0aGlzIGNoYW5nZSBpcyB0byBhbGxvdyB1cyB0byBz
ZXQgYSBzcGVjaWZpYyBNU1IgdmFsdWUsCj4gd2l0aG91dCBuZWVkaW5nIHRvIGtub3cgd2hldGhl
ciB0aGVyZSBpcyBhbHJlYWR5IGEgbG9hZC9zYXZlIGxpc3Qgc2xvdCBmb3IgaXQuCj4gCj4gUHJl
dmlvdXNseSwgY2FsbGVycyB3YW50aW5nIHRoaXMgcHJvcGVydHkgbmVlZGVkIHRvIGNhbGwgYm90
aCB2bXhfYWRkXypfbXNyKCkKPiBhbmQgdm14X3dyaXRlXypfbXNyKCkgdG8gY292ZXIgYm90aCBj
YXNlcywgYW5kIHRoZXJlIGFyZSBubyBjYWxsZXJzIHdoaWNoIHdhbnQKPiB0aGUgb2xkIGJlaGF2
aW91ciBvZiBiZWluZyBhIG5vLW9wIGlmIGFuIGVudHJ5IGFscmVhZHkgZXhpc3RlZCBmb3IgdGhl
IE1TUi4KPiAKPiBBcyBhIHJlc3VsdCBvZiB0aGlzIEFQSSBpbXByb3ZlbWVudCwgdGhlIGRlZmF1
bHQgdmFsdWUgZm9yIGd1ZXN0IE1TUnMgbmVlZCBub3QKPiBiZSAwLCBhbmQgdGhlIGRlZmF1bHQg
Zm9yIGhvc3QgTVNScyBuZWVkIG5vdCBiZSBwYXNzZWQgdmlhIGhhcmR3YXJlIHJlZ2lzdGVyLgo+
IEluIHByYWN0aWNlLCB0aGlzIGNsZWFucyB1cCB0aGUgVlBNVSBhbGxvY2F0aW9uIGxvZ2ljLCBh
bmQgYXZvaWRzIGFuIE1TUiByZWFkCj4gYXMgcGFydCBvZiB2Y3B1IGNvbnN0cnVjdGlvbi4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
