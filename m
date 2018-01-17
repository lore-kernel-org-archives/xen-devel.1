From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v8 12/17] x86/entry: Organise the use of
 MSR_SPEC_CTRL at each entry/exit point
Date: Wed, 17 Jan 2018 01:47:32 -0700
Message-ID: <5A5F1BB4020000780019F5A9@prv-mh.provo.novell.com>
References: <1515780067-31735-1-git-send-email-andrew.cooper3@citrix.com>
 <1515780067-31735-13-git-send-email-andrew.cooper3@citrix.com>
 <5A5CA80E020000780019EBEA@prv-mh.provo.novell.com>
 <9fd31a33-a400-7586-d371-4d4165c8fc4e@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <9fd31a33-a400-7586-d371-4d4165c8fc4e@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjAxLjE4IGF0IDIyOjI0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTUvMDEvMTggMTI6MDksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxMi4w
MS4xOCBhdCAxOTowMSwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gQEAg
LTU4Niw2ICs2MTEsMTAgQEAgRU5UUlkoZG91YmxlX2ZhdWx0KQo+Pj4gICAgICAgICAgbW92bCAg
JFRSQVBfZG91YmxlX2ZhdWx0LDQoJXJzcCkKPj4+ICAgICAgICAgIC8qIFNldCBBQyB0byByZWR1
Y2UgY2hhbmNlIG9mIGZ1cnRoZXIgU01BUCBmYXVsdHMgKi8KPj4+ICAgICAgICAgIFNBVkVfQUxM
IFNUQUMKPj4+ICsKPj4+ICsgICAgICAgIFNQRUNfQ1RSTF9FTlRSWV9GUk9NX0lOVFIgLyogUmVx
OiAlcnNwPXJlZ3MgQ2xvYjogYWNkICovCj4+PiArICAgICAgICAvKiBXQVJOSU5HISBgcmV0YCwg
YGNhbGwgKmAsIGBqbXAgKmAgbm90IHNhZmUgYmVmb3JlIHRoaXMgcG9pbnQuICovCj4+IElzIGl0
IGFjdHVhbGx5IHVzZWZ1bCB0byBkbyBfYW55dGhpbmdfIGluIHRoZSBkb3VibGUgZmF1bHQgaGFu
ZGxlcj8KPiAKPiBUeXBpY2FsbHkgbm8sIGJ1dCB0aGVuIGFnYWluIHdlIGhvcGUgbmV2ZXIgdG8g
ZXhlY3V0ZSB0aGlzIGNvZGUuCj4gCj4gT1RPSCwgd2Ugd291bGQgbmVlZCB0byBkbyB0aGlzIGlm
IHdlIGV2ZXIgZ2V0IGFyb3VuZCB0byBkb2luZyBlc3BmaXg2NC4KCkNvdWxkIEkgZ2V0IHlvdSB0
byBvbWl0IHRoZSBjaGFuZ2UgdG8gdGhlIGhhbmRsZXIgdW50aWwgdGhlbiwgdG8ga2VlcAppdCBh
cyBzdHJhaWdodGZvcndhcmQgYXMgcG9zc2libGU/CgpKYW4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
