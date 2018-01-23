From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v2 00/12] xen/x86: use per-vcpu stacks
 for 64 bit pv domains
Date: Tue, 23 Jan 2018 02:31:42 -0700
Message-ID: <5A670F0E02000078001A16C9@prv-mh.provo.novell.com>
References: <20180122123256.1431-1-jgross@suse.com>
 <5A65EC0A02000078001A1118@suse.com>
 <068bc63f-f79c-627c-4f48-ca8cdef166d9@suse.com>
 <5A6601D302000078001A1230@suse.com>
 <1a670986-d36b-3530-3b12-15ac2faa302e@suse.com>
 <5A6607DB02000078001A127B@suse.com>
 <ad9fe5e8-76b1-3a61-4696-f6d3708cd404@suse.com>
 <5A6624A602000078001A1375@prv-mh.provo.novell.com>
 <1484b1c8-6140-323e-9933-e1120f1e2a0d@citrix.com>
 <0f0af840-a808-a1b5-5397-490816cdce0f@suse.com>
 <5A67061F02000078001A1669@suse.com>
 <9392fbde-562c-5200-8b1c-33a737ed8972@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=2ufb=es=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eduvl-0000YH-6e
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2018 09:31:49 +0000
In-Reply-To: <9392fbde-562c-5200-8b1c-33a737ed8972@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, Andrew Cooper <andrew.cooper3@citrix.com>, ian.jackson@eu.citrix.com, Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjAxLjE4IGF0IDEwOjI0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAy
My8wMS8xOCAwOTo1MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDIzLjAxLjE4IGF0IDA3
OjM0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+IE9uIDIyLzAxLzE4IDE5OjM5LCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOgo+Pj4+IE9uZSBvZiBteSBjb25jZXJucyBpcyB0aGF0IHRoaXMgcGF0
Y2ggc2VyaWVzIG1vdmVzIGZ1cnRoZXIgYXdheSBmcm9tIHRoZQo+Pj4+IHNlY29uZGFyeSBnb2Fs
IG9mIG15IEtBSVNFUiBzZXJpZXMsIHdoaWNoIHdhcyB0byBoYXZlIHRoZSBJRFQgYW5kIEdEVAo+
Pj4+IG1hcHBlZCBhdCB0aGUgc2FtZSBsaW5lYXIgYWRkcmVzc2VzIG9uIGV2ZXJ5IENQVSBzbyBh
KSBTSURUL1NHRFQgZG9uJ3QKPj4+PiBsZWFrIHdoaWNoIENQVSB5b3UncmUgY3VycmVudGx5IHNj
aGVkdWxlZCBvbiBpbnRvIFBWIGd1ZXN0cyBhbmQgYikgdGhlCj4+Pj4gY29udGV4dCBzd2l0Y2gg
Y29kZSBjYW4gZHJvcCBhIGxvYWQgb2YgaXRzIHNsb3cgaW5zdHJ1Y3Rpb25zIGxpa2UgTEdEVAo+
Pj4+IGFuZCB0aGUgVk1XUklURXMgdG8gdXBkYXRlIHRoZSBWTUNTLgo+Pj4KPj4+IFRoZSBHRFQg
YWRkcmVzcyBvZiBhIFBWIHZjcHUgaXMgZGVwZW5kaW5nIG9uIHZjcHVfaWQgb25seS4gSSBkb24n
dAo+Pj4gc2VlIHdoeSB0aGUgSURUIGNhbid0IGJlIG1hcHBlZCB0byB0aGUgc2FtZSBhZGRyZXNz
IG9uIGVhY2ggY3B1IHdpdGgKPj4+IG15IGFwcHJvYWNoLgo+PiAKPj4gWW91J3JlIG5vdCBpbnRy
b2R1Y2luZyBhIHBlci1DUFUgcmFuZ2UgaW4gdGhlIHBhZ2UgdGFibGVzIGFmYWljcwo+PiAoYWdh
aW4gZnJvbSBvdmVydmlldyBhbmQgdGl0bGVzIG9ubHkpLCB5ZXQgd2l0aCB0aGUgSURUIG5lZWRp
bmcKPj4gdG8gYmUgcGVyLUNQVSB5b3UnZCBhbHNvIG5lZWQgYSBwZXItQ1BVIHJhbmdlIHRvIG1h
cCBpdCB0byBpZgo+PiB5b3Ugd2FudCB0byBhdm9pZCB0aGUgTElEVCBhcyB3ZWxsIGFzIGV4cG9z
aW5nIHdoYXQgQ1BVIHlvdSdyZQo+PiBvbiAoc2FtZSBnb2VzIGZvciB0aGUgR0RUIGFuZCB0aGUg
cmVzcGVjdGl2ZSBhdm9pZGFuY2Ugb2YgTEdEVAo+PiBhZmFpY3QpLgo+IAo+IEFmdGVyIGEgcXVp
Y2sgbG9vayBJIGRvbid0IHNlZSB3aHkgYSBNZWx0ZG93biBtaXRpZ2F0aW9uIGNhbid0IHVzZQo+
IHRoZSBzYW1lIElEVCBmb3IgYWxsIGNwdXM6IHRoZSBvbmx5IHJlYXNvbiBJIGNvdWxkIGZpbmQg
Zm9yIGhhdmluZwo+IHBlci1jcHUgSURUcyBzZWVtcyB0byBiZSBpbiBTVk0gY29kZSwgc28gaXQg
c2VlbXMgdG8gYmUgQU1EIHNwZWNpZmljLgo+IEFuZCBBTUQgd29uJ3QgbmVlZCBYUFRJIGF0IGFs
bC4KCklzbid0IHlvdXIgUkZDIHNlcmllcyBhbGxvd2luZyBYUFRJIHRvIGJlIGVuYWJsZWQgZXZl
biBvbiBBTUQ/Cgo+IFRoZSBHRFQgb2YgcHYgZG9tYWlucyBpcyBhbHJlYWR5IGluIHRoZSBwZXIt
ZG9tYWluIHJlZ2lvbiBldmVuIHdpdGhvdXQKPiBteSBwYXRjaGVzLCBzbyBJIGRvbid0IGhhdmUg
dG8gY2hhbmdlIGFueXRoaW5nIHJlZ2FyZGluZyB1c2FnZSBvZiBMR0RULgoKQW5kcmV3J3MgcG9p
bnQgd2FzIHRoYXQgZWxpbWluYXRpbmcgdGhlIExHRFQgaXMgYSBzZWNvbmRhcnkgZ29hbC4KCkph
bgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
