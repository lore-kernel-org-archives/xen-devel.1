From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.11] x86: Use spec_ctrl_{enter,
 exit}_idle() in the S3/S5 path
Date: Wed, 18 Apr 2018 17:27:50 +0100
Message-ID: <2a5f110f-c890-9429-8e05-ed4605ad393e@citrix.com>
References: <1524048235-19493-1-git-send-email-andrew.cooper3@citrix.com>
 <5AD7678A02000078001BC722@prv1-mh.provo.novell.com>
 <428287ee-8448-b06a-00a6-e5f2a3d57b31@citrix.com>
 <5AD76EE302000078001BC773@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5AD76EE302000078001BC773@prv1-mh.provo.novell.com>
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMDQvMTggMTc6MTQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE4LjA0LjE4IGF0
IDE4OjAyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDE4LzA0LzE4
IDE2OjQzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDE4LjA0LjE4IGF0IDEyOjQzLCA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+Pj4gVGhpcyBhdm9pZHMgb3BlbmNv
ZGluZyB0aGUgZnVuY3Rpb25hbGl0eSAoYW5kIG1pc3Npbmcgb25lIGJpdCBvZiBpdCksIGFuZCBh
bmQKPj4+PiBzb21lIGNvbW1lbnRzIGV4cGxhaW5pbmcgd2hhdCBpcyBnb2luZyBvbi4KPj4+IE1p
c3Npbmcgd2hpY2ggYml0IG9mIGl0PyBUaGUgTVNSIHdyaXRlcyBhcmVuJ3Qgc3RyaWN0bHkgbmVj
ZXNzYXJ5IGFmYWljdCwgYW5kCj4+PiBmdW5jdGlvbmFsbHkgY2xlYXJpbmcgYnRpX2lzdF9pbmZv
IGlzIGFsbCB0aGF0J3MgbmVlZGVkIGZvciB0aGUgZW50cnkgcGF0aCBvZgo+Pj4gaW50ZXJlc3Qs
IHdoaWxlIGNsZWFyaW5nIHVzZV9zaGFkb3dfc3BlY19jdHJsIGlzIGFsbCB0aGF0J3MgbmVlZGVk
IGZvciB0aGUKPj4+IGV4aXQtdG8tWGVuIHBhdGguIEhlbmNlIEknbSBkb24ndCBzZWUgKHlldCkg
d2hhdCBidWcgaXQgaXMgeW91IHRoaW5rIHRoaXMKPj4+IGZpeGVzLgo+PiBJdCBpcyBleHBlY3Rl
ZCB0aGF0IHdlIGRvbid0IGhhbmQgb2ZmIGNvbnRyb2wgdG8gdGhlIGZpcm13YXJlIGluIGNhc2Vz
Cj4+IGxpa2UgdGhpcyB3aXRoIHRoZSBtaXRpZ2F0aW9ucyBpbiBwbGFjZS4gIEhlcmUsIGl0IGRv
ZXNuJ3QgYWN0dWFsbHkKPj4gbWF0dGVyIHRvbyBtdWNoLCBidXQgdGhlcmUgaXMgbm8gcG9pbnQg
aGF2aW5nIHRoZSBtaXRpZ2F0aW9ucyBpbiBlZmZlY3QKPj4gd2hlbiB3ZSdyZSB0aGUgZmluYWwg
Q1BVIGFuZCB0cnlpbmcgdG8gc2h1dCBkb3duLgo+IFdpdGggYW4gaW1wcm92ZWQgZGVzY3JpcHRp
b24gdGhlIHBhdGNoIGNhbiBjZXJ0YWlubHkgaGF2ZSBteSBSLWI7IHRoZQo+IGNvZGUgY2hhbmdl
IGl0c2VsZiBpcyBjbGVhcmx5IGZpbmUgd2l0aCBtZS4KCkhvdyBhYm91dDoKClRoZSBtYWluIHB1
cnBvc2Ugb2YgdGhpcyBwYXRjaCBpcyB0byBhdm9pZCBvcGVuY29kaW5nIHRoZSByZWNvdmVyeSBs
b2dpYwphdCB0aGUgZW5kLCBidXQgYWxzbyBoYXMgdGhlIHBvc2l0aXZlIHNpZGUgZWZmZWN0IG9m
IHJlbGF4aW5nIHRoZQpTUEVDX0NUUkwgbWl0aWdhdGlvbnMgd2hlbiB3b3JraW5nIHRvIHNodXQg
dGhlIGZpbmFsIENQVSBkb3duLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
