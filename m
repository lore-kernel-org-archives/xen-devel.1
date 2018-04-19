From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.11] x86: Use spec_ctrl_{enter,
 exit}_idle() in the S3/S5 path
Date: Thu, 19 Apr 2018 01:34:58 -0600
Message-ID: <5AD846A202000078001BC8CD@prv1-mh.provo.novell.com>
References: <1524048235-19493-1-git-send-email-andrew.cooper3@citrix.com>
 <5AD7678A02000078001BC722@prv1-mh.provo.novell.com>
 <428287ee-8448-b06a-00a6-e5f2a3d57b31@citrix.com>
 <5AD76EE302000078001BC773@prv1-mh.provo.novell.com>
 <2a5f110f-c890-9429-8e05-ed4605ad393e@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <2a5f110f-c890-9429-8e05-ed4605ad393e@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjA0LjE4IGF0IDE4OjI3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTgvMDQvMTggMTc6MTQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxOC4w
NC4xOCBhdCAxODowMiwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gT24g
MTgvMDQvMTggMTY6NDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDE4LjA0LjE4IGF0
IDEyOjQzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+Pj4+IFRoaXMgYXZv
aWRzIG9wZW5jb2RpbmcgdGhlIGZ1bmN0aW9uYWxpdHkgKGFuZCBtaXNzaW5nIG9uZSBiaXQgb2Yg
aXQpLCBhbmQgYW5kCj4+Pj4+IHNvbWUgY29tbWVudHMgZXhwbGFpbmluZyB3aGF0IGlzIGdvaW5n
IG9uLgo+Pj4+IE1pc3Npbmcgd2hpY2ggYml0IG9mIGl0PyBUaGUgTVNSIHdyaXRlcyBhcmVuJ3Qg
c3RyaWN0bHkgbmVjZXNzYXJ5IGFmYWljdCwgYW5kCj4+Pj4gZnVuY3Rpb25hbGx5IGNsZWFyaW5n
IGJ0aV9pc3RfaW5mbyBpcyBhbGwgdGhhdCdzIG5lZWRlZCBmb3IgdGhlIGVudHJ5IHBhdGggb2YK
Pj4+PiBpbnRlcmVzdCwgd2hpbGUgY2xlYXJpbmcgdXNlX3NoYWRvd19zcGVjX2N0cmwgaXMgYWxs
IHRoYXQncyBuZWVkZWQgZm9yIHRoZQo+Pj4+IGV4aXQtdG8tWGVuIHBhdGguIEhlbmNlIEknbSBk
b24ndCBzZWUgKHlldCkgd2hhdCBidWcgaXQgaXMgeW91IHRoaW5rIHRoaXMKPj4+PiBmaXhlcy4K
Pj4+IEl0IGlzIGV4cGVjdGVkIHRoYXQgd2UgZG9uJ3QgaGFuZCBvZmYgY29udHJvbCB0byB0aGUg
ZmlybXdhcmUgaW4gY2FzZXMKPj4+IGxpa2UgdGhpcyB3aXRoIHRoZSBtaXRpZ2F0aW9ucyBpbiBw
bGFjZS4gIEhlcmUsIGl0IGRvZXNuJ3QgYWN0dWFsbHkKPj4+IG1hdHRlciB0b28gbXVjaCwgYnV0
IHRoZXJlIGlzIG5vIHBvaW50IGhhdmluZyB0aGUgbWl0aWdhdGlvbnMgaW4gZWZmZWN0Cj4+PiB3
aGVuIHdlJ3JlIHRoZSBmaW5hbCBDUFUgYW5kIHRyeWluZyB0byBzaHV0IGRvd24uCj4+IFdpdGgg
YW4gaW1wcm92ZWQgZGVzY3JpcHRpb24gdGhlIHBhdGNoIGNhbiBjZXJ0YWlubHkgaGF2ZSBteSBS
LWI7IHRoZQo+PiBjb2RlIGNoYW5nZSBpdHNlbGYgaXMgY2xlYXJseSBmaW5lIHdpdGggbWUuCj4g
Cj4gSG93IGFib3V0Ogo+IAo+IFRoZSBtYWluIHB1cnBvc2Ugb2YgdGhpcyBwYXRjaCBpcyB0byBh
dm9pZCBvcGVuY29kaW5nIHRoZSByZWNvdmVyeSBsb2dpYwo+IGF0IHRoZSBlbmQsIGJ1dCBhbHNv
IGhhcyB0aGUgcG9zaXRpdmUgc2lkZSBlZmZlY3Qgb2YgcmVsYXhpbmcgdGhlCj4gU1BFQ19DVFJM
IG1pdGlnYXRpb25zIHdoZW4gd29ya2luZyB0byBzaHV0IHRoZSBmaW5hbCBDUFUgZG93bi4KCk11
Y2ggYmV0dGVyLiBXaXRoIHRoYXQKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
