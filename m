From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/3 Xen-4.8] x86/dom0: Fix shadowing of PV
 guests with 2M superpages
Date: Mon, 12 Nov 2018 03:13:40 -0700
Message-ID: <5BE9525402000078001FABDA@prv1-mh.provo.novell.com>
References: <1541777178-3844-1-git-send-email-andrew.cooper3@citrix.com>
 <1541777178-3844-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1541777178-3844-4-git-send-email-andrew.cooper3@citrix.com>
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

Pj4+IE9uIDA5LjExLjE4IGF0IDE2OjI2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhpcyBpcyBhIG1pbmltYWwgYmFja3BvcnQgb2YgcGllY2VzIG9mOgo+IAo+ICBjL3Mg
MjhkOWE5YTJkNDE3NTliOWU1MTYzMDM3Yjc1OWFjNTU3YWVhNzY3Ywo+ICBjL3MgNGM1ZDc4YTEw
ZGM4OTQyNzE0MGE1MGExZGY1YTBiOGU5ZjA3M2U4Mgo+IAo+IHRvIGZpeCBhIFBWIHNoYWRvd2lu
ZyBwcm9ibGVtIHdoaWNoIEkgaGFkbid0IGFudGljaXBhdGVkIGF0IHRoZSB0aW1lIHRoZXNlCj4g
Zml4ZXMgd2VyZSBmaXJzdCBhY2NlcHRlZC4KPiAKPiBIYXZpbmcgb3B0X2FsbG93X3N1cGVycGFn
ZSBkaXNhYmxlZCBjYXVzZXMgZ3Vlc3Rfc3VwcG9ydHNfc3VwZXJwYWdlcygpIHRvCj4gcmV0dXJu
IGZhbHNlIGZvciBQViBndWVzdHMuICBSZXR1cm5pbmcgZmFsc2UgY2F1c2VzIGd1ZXN0X3dhbGtf
dGFibGVzKCkgdG8KPiBpZ25vcmUgTDIgc3VwZXJwYWdlcywgYW5kIHJlYWQgdW5kZXIgdGhlbS4K
PiAKPiBUaGlzIGlnbm9yaW5nIGJlaGF2aW91ciBpcyBjb3JyZWN0IGZvciAyLWxldmVsIHBhZ2lu
ZyB3aGVuIENSNC5QU0UgaXMgY2xlYXIsCj4gYnV0IGlzbid0IGNvcnJlY3QgZm9yIDMtIG9yIDQt
bGV2ZWwgcGFnaW5nLgo+IAo+IFdoZW4gb3B0X2FsbG93X3N1cGVycGFnZSBpcyBjbGVhciwgUFYg
ZG9tVSdzIGNhbid0IGhhdmUgc3VwZXJwYWdlcywgYnV0IGRvbTAKPiB3aWxsIHN0aWxsIGhhdmUg
aXRzIGluaXRpYWwgUDJNIGNvbnN0cnVjdGVkIHdpdGggMk0gc3VwZXJwYWdlcy4KPiAKPiBUaGUg
ZW5kIHJlc3VsdCBpcyB0aGF0LCBpZiBkb20wIGJlY29tZXMgc2hhZG93ZWQgKGUuZy4gUFYtTDFU
RiksIHRoZSBuZXh0Cj4gbWVtb3J5IGFjY2VzcyB0b3VjaGluZyBhIFAyTSBzdXBlcnBhZ2Ugd2ls
bCBjYXVzZSB0aGUgc2hhZG93IGNvZGUgdG8gcmVhZAo+IHVuZGVyIHRoZSBQMk0gc3VwZXJwYWdl
IGFuZCBhdHRlbXB0IHRvIHNoYWRvdyBqdW5rLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
