From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/vtx: Improvements to ept= command line
 handling
Date: Fri, 21 Dec 2018 04:27:32 -0700
Message-ID: <5C1CCE240200007800208819@prv1-mh.provo.novell.com>
References: <1545326215-10744-1-git-send-email-andrew.cooper3@citrix.com>
 <5C1CCAC402000078002087DE@prv1-mh.provo.novell.com>
 <b457c674-69ce-2b4b-6800-da3ce6af8174@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <b457c674-69ce-2b4b-6800-da3ce6af8174@citrix.com>
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

Pj4+IE9uIDIxLjEyLjE4IGF0IDEyOjE1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjEvMTIvMjAxOCAxMToxMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDIw
LjEyLjE4IGF0IDE4OjE2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiAr
ICAgIEJ5IGRlZmF1bHQsIFhlbiB3aWxsIHVzZSBBL0QgdHJhY2tpbmcgd2hlbiBhdmFpbGFibGUg
aW4gaGFyZHdhcmUsIGV4Y2VwdAo+Pj4gKyAgICBvbiBBdm90b24gcHJvY2Vzc29ycyBhZmZlY3Rl
ZCBieSBlcnJhdHVtIEFWUjQxLiAgRXhwbGljaXRseSBjaG9vc2luZwo+Pj4gKyAgICBgYWQ9MGAg
d2lsbCBkaXNhYmxlIHRoZSB1c2Ugb2YgQS9EIHRyYWNraW5nIG9uIGNhcGFibGUgaGFyZHdhcmUs
IHdoZXJlYXMKPj4+ICsgICAgY2hvb3NpbmcgYGFkPTFgIHdpbGwgY2F1c2UgdHJhY2tpbmcgdG8g
YmUgdXNlZCBldmVuIG9uIEFWUjQxLWFmZmVjdGVkCj4+PiArICAgIGhhcmR3YXJlLgo+PiBJcyB0
aGVyZSBhbnkgcmVhc29uIGZvciB0aGlzIHNwZWNpYWwgY2FzaW5nIG9mIHRoZSBvbmUgZXJyYXR1
bT8KPj4gRWFybGllciB0aGlzIHdlZWsgSSd2ZSBnb25lIHRocm91Z2ggc29tZSBzcGVjIHVwZGF0
ZXMgZm9yIG90aGVyCj4+IHB1cnBvc2VzLCBhbmQgSSd2ZSBzZWVuIHNvbWUgcmF0aGVyIGZyaWdo
dGVuaW5nIEVQVCBBL0QgZXJyYXRhLgo+IAo+IFdoaWNoLCBvdXQgb2YgaW50ZXJlc3Q/ICBUaGVy
ZSBhcmUgYSBmZXcsIHBhcnRpY3VsYXJseSBvbiBTa3lsYWtlLCBidXQKPiBhbGwgdGhlIHByb2Js
ZW1hdGljIG9uZXMgSSdtIGF3YXJlIG9mIGFyZSBmaXhlZCBpbiBtaWNyb2NvZGUuCgpJJ2QgaGF2
ZSB0byBnbyB0aHJvdWdoIHRoZW0gYWdhaW4sIGFzIEkgZGlkbid0IHBheSBjbG9zZSBhdHRlbnRp
b24gdG8Kd2hhdCB3YXMgc2FpZCBhYm91dCB0aGVpciBzdGF0dXMuIEFyZSB3ZSBnZW5lcmFsbHkg
cHV0dGluZyBvdXJzZWx2ZXMKb24gdGhlIHBvc2l0aW9uIHRoZW4gdGhhdCBlcnJhdGEgZG9uJ3Qg
bmVlZCB3b3JraW5nIGFyb3VuZCBpZiB0aGVyZSdzCmEgbWljcm9jb2RlIHVwZGF0ZSBhdmFpbGFi
bGU/IFRoYXQncyBhIHBvc3NpYmxlIHBvc2l0aW9uIHRvIHRha2UsIGJ1dApub3Qgc3BlbGxlZCBv
dXQgYW55d2hlcmUuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
