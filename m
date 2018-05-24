From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 6/9] x86/vmx: Pass an MSR value into
 vmx_msr_add()
Date: Thu, 24 May 2018 09:12:02 -0600
Message-ID: <5B06D64202000078001C5A5E@prv1-mh.provo.novell.com>
References: <1526988046-22948-1-git-send-email-andrew.cooper3@citrix.com>
 <1526988046-22948-7-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1526988046-22948-7-git-send-email-andrew.cooper3@citrix.com>
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

Pj4+IE9uIDIyLjA1LjE4IGF0IDEzOjIwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhlIG1haW4gcHVycG9zZSBvZiB0aGlzIGNoYW5nZSBpcyB0byBhbGxvdyB1cyB0byBz
ZXQgYSBzcGVjaWZpYyBNU1IgdmFsdWUsCj4gd2l0aG91dCBuZWVkaW5nIHRvIGtub3cgd2hldGhl
ciB0aGVyZSBpcyBhbHJlYWR5IGEgbG9hZC9zYXZlIGxpc3Qgc2xvdCBmb3IgCj4gaXQuCj4gUHJl
dmlvdXNseSwgY2FsbGVycyB3YW50aW5nIHRoaXMgcHJvcGVydHkgbmVlZGVkIHRvIGNhbGwgYm90
aCB2bXhfYWRkXypfbXNyKCkKPiBhbmQgdm14X3dyaXRlXypfbXNyKCkgdG8gY292ZXIgYm90aCBj
YXNlcy4KPiAKPiBBcyBhIHJlc3VsdCBvZiB0aGlzIEFQSSBpbXByb3ZlbWVudCwgdGhlIGRlZmF1
bHQgdmFsdWUgZm9yIGd1ZXN0IE1TUnMgbmVlZCBub3QKPiBiZSAwLCBhbmQgdGhlIGRlZmF1bHQg
Zm9yIGhvc3QgTVNScyBuZWVkIG5vdCBiZSBwYXNzZWQgdmlhIGhhcmR3YXJlIHJlZ2lzdGVyLgo+
IEluIHByYWN0aWNlLCB0aGlzIGNsZWFucyB1cCB0aGUgVlBNVSBhbGxvY2F0aW9uIGxvZ2ljLCBh
bmQgYXZvaWRzIGFuIE1TUiByZWFkCj4gYXMgcGFydCBvZiB2Y3B1IGNvbnN0cnVjdGlvbi4KCkJ1
dCB0aGlzIGFsc28gbWVhbnM6IElmIHRoZXJlIGFscmVhZHkgaXMgc3VjaCBhbiBlbnRyeSwgdGhl
IHByZXZpb3VzIHZhbHVlIHdpbGwKbm93IGJlIGJsaW5kbHkgb3ZlcndyaXR0ZW4uIEFyZSB5b3Ug
c3VyZSB0aGlzIGlzIGFsd2F5cyB3aGF0IGlzIHdhbnRlZD8KCkphbgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
