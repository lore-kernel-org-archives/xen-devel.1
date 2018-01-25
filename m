From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v10 05/11] x86/entry: Organise the use of
 MSR_SPEC_CTRL at each entry/exit point
Date: Thu, 25 Jan 2018 08:08:02 -0700
Message-ID: <5A6A00E202000078001A2709@prv-mh.provo.novell.com>
References: <1516799535-5778-1-git-send-email-andrew.cooper3@citrix.com>
 <1516799535-5778-6-git-send-email-andrew.cooper3@citrix.com>
 <5A69E4CA02000078001A25D4@prv-mh.provo.novell.com>
 <7b4f1324-d60b-8fba-35dc-8f6db949b5df@citrix.com>
 <5A69F99102000078001A2685@prv-mh.provo.novell.com>
 <bb06b5ec-109e-990a-86f1-49fac635547d@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <bb06b5ec-109e-990a-86f1-49fac635547d@citrix.com>
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

Pj4+IE9uIDI1LjAxLjE4IGF0IDE1OjQ2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjUvMDEvMTggMTQ6MzYsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyNS4w
MS4xOCBhdCAxNToxMiwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gT24g
MjUvMDEvMTggMTM6MDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IEl0IG1heSBhbHNvIGJlIHdv
cnRod2hpbGUgYWdhaW4gdG8gcHVsbCB1cCB0aGUgemVyb2luZyBvZiAlZWR4LAo+Pj4+IHVzaW5n
ICVkbCBpbnN0ZWFkIG9mICQwIGluIHRoZSBtb3ZiIChhbmQgbWF5YmUgdGhlbiBhbHNvCj4+Pj4g
c2ltaWxhcmx5IGluIERPX1NQRUNfQ1RSTF9FWElUX1RPX1hFTiwgYnV0IHRoZXJlIEknbSBsZXNz
Cj4+Pj4gY2VydGFpbiBpdCBjb3VsZG4ndCBoYXZlIGEgbmVnYXRpdmUgZWZmZWN0KS4KPj4+IFdo
YXQgbmVnYXRpdmUgZWZmZWN0cyBhcmUgeW91IHdvcnJpZWQgYWJvdXQ/ICBUaGVzZSBtYWNyb3Mg
YXJlIHNlbGYKPj4+IGNvbnRhaW5lZC4KPj4gVGhlIHJlc3VsdCBvZiB0aGUgeG9yIHRoZW4gaXMg
YW4gaW5wdXQgdG8gdGhlIGNtcCwgd2hpY2ggbWF5IGJlCj4+IG9uZSBjeWNsZSBtb3JlIGxhdGVu
Y3kgdGhhbiB3aXRoIHRoZSBpbW1lZGlhdGUgemVyby4KPiAKPiBXaHk/ICBDbXAgd3JpdGVzIGFs
bCBmbGFncyBhbmQgcmVhZHMgbm9uZSBvZiB0aGVtLCBzbyBkb2Vzbid0IGhhdmUgYW55Cj4gZmxh
Z3MgZGVwZW5kZW5jeSBvbiBlYXJsaWVyIGluc3RydWN0aW9ucy4KPiAKPiBJdCBpcyBvbmx5IGlu
c3RydWN0aW9ucyB3aGljaCBwYXJ0aWFsbHkgcHJlc2VydmUgb2xkZXIgZmxhZyBiaXRzIChhbmQK
PiB3aGVyZSB1bmRlZmluZWQgYmVoYXZpb3VyIGlzIGNvbXBsaWNhdGVkKSB3aGljaCBzdWZmZXIg
ZmxhZ3MtbWVyZ2UKPiBwZW5hbHRpZXMuCgpJJ20gbm90IHRhbGtpbmcgYWJvdXQgYW4gZWZsYWdz
IGRlcGVuZGVuY3ksIGJ1dCB0aGF0IG9uIHRoZQpyZWdpc3RlciAoJWVkeCBiZWluZyB3cml0dGVu
IGJ5IHhvciwgJWRsIHVzZWQgYnkgY21wKS4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
