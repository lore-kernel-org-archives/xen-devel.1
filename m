From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v10 05/11] x86/entry: Organise the use of
 MSR_SPEC_CTRL at each entry/exit point
Date: Thu, 25 Jan 2018 15:10:23 +0000
Message-ID: <a3fbb076-a823-ac50-e9da-e04aeebaa0f3@citrix.com>
References: <1516799535-5778-1-git-send-email-andrew.cooper3@citrix.com>
 <1516799535-5778-6-git-send-email-andrew.cooper3@citrix.com>
 <5A69E4CA02000078001A25D4@prv-mh.provo.novell.com>
 <7b4f1324-d60b-8fba-35dc-8f6db949b5df@citrix.com>
 <5A69F99102000078001A2685@prv-mh.provo.novell.com>
 <bb06b5ec-109e-990a-86f1-49fac635547d@citrix.com>
 <5A6A00E202000078001A2709@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A6A00E202000078001A2709@prv-mh.provo.novell.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDEvMTggMTU6MDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDI1LjAxLjE4IGF0
IDE1OjQ2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDI1LzAxLzE4
IDE0OjM2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDI1LjAxLjE4IGF0IDE1OjEyLCA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+Pj4gT24gMjUvMDEvMTggMTM6MDgs
IEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBJdCBtYXkgYWxzbyBiZSB3b3J0aHdoaWxlIGFnYWlu
IHRvIHB1bGwgdXAgdGhlIHplcm9pbmcgb2YgJWVkeCwKPj4+Pj4gdXNpbmcgJWRsIGluc3RlYWQg
b2YgJDAgaW4gdGhlIG1vdmIgKGFuZCBtYXliZSB0aGVuIGFsc28KPj4+Pj4gc2ltaWxhcmx5IGlu
IERPX1NQRUNfQ1RSTF9FWElUX1RPX1hFTiwgYnV0IHRoZXJlIEknbSBsZXNzCj4+Pj4+IGNlcnRh
aW4gaXQgY291bGRuJ3QgaGF2ZSBhIG5lZ2F0aXZlIGVmZmVjdCkuCj4+Pj4gV2hhdCBuZWdhdGl2
ZSBlZmZlY3RzIGFyZSB5b3Ugd29ycmllZCBhYm91dD8gIFRoZXNlIG1hY3JvcyBhcmUgc2VsZgo+
Pj4+IGNvbnRhaW5lZC4KPj4+IFRoZSByZXN1bHQgb2YgdGhlIHhvciB0aGVuIGlzIGFuIGlucHV0
IHRvIHRoZSBjbXAsIHdoaWNoIG1heSBiZQo+Pj4gb25lIGN5Y2xlIG1vcmUgbGF0ZW5jeSB0aGFu
IHdpdGggdGhlIGltbWVkaWF0ZSB6ZXJvLgo+PiBXaHk/ICBDbXAgd3JpdGVzIGFsbCBmbGFncyBh
bmQgcmVhZHMgbm9uZSBvZiB0aGVtLCBzbyBkb2Vzbid0IGhhdmUgYW55Cj4+IGZsYWdzIGRlcGVu
ZGVuY3kgb24gZWFybGllciBpbnN0cnVjdGlvbnMuCj4+Cj4+IEl0IGlzIG9ubHkgaW5zdHJ1Y3Rp
b25zIHdoaWNoIHBhcnRpYWxseSBwcmVzZXJ2ZSBvbGRlciBmbGFnIGJpdHMgKGFuZAo+PiB3aGVy
ZSB1bmRlZmluZWQgYmVoYXZpb3VyIGlzIGNvbXBsaWNhdGVkKSB3aGljaCBzdWZmZXIgZmxhZ3Mt
bWVyZ2UKPj4gcGVuYWx0aWVzLgo+IEknbSBub3QgdGFsa2luZyBhYm91dCBhbiBlZmxhZ3MgZGVw
ZW5kZW5jeSwgYnV0IHRoYXQgb24gdGhlCj4gcmVnaXN0ZXIgKCVlZHggYmVpbmcgd3JpdHRlbiBi
eSB4b3IsICVkbCB1c2VkIGJ5IGNtcCkuCgp4b3IgJWVkeCwgJWVkeCBpcyBhIHplcm9pbmcgaWRp
b20gYW5kIGRvZXNuJ3QgZ2V0IGV4ZWN1dGVkLsKgIFJlZ2lzdGVyCnJlbmFtaW5nIHdpbGwgY2F1
c2UgdGhlICVkbCB0byBiZSBzb3VyY2VkIGZyb20gdGhlIG1pY3JvYXJjaGl0ZWN0dXJhbAppZGVh
IG9mIHplcm8sIHJhdGhlciB0aGFuIGZyb20gdGhlIHJlYWwgcmVzdWx0IG9mIHRoZSB4b3IuCgp+
QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
