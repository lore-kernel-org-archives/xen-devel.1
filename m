From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/5] x86/hvm: Adjust hvmemul_rep_stos() to
 compile with -Wvla
Date: Tue, 25 Sep 2018 04:42:19 -0600
Message-ID: <5BAA110B02000078001EB88F@prv1-mh.provo.novell.com>
References: <1537794003-30851-1-git-send-email-andrew.cooper3@citrix.com>
 <1537794003-30851-4-git-send-email-andrew.cooper3@citrix.com>
 <5BA8F1B102000078001EB3B3@prv1-mh.provo.novell.com>
 <859482e7-57a7-4cc9-8f39-b894e5ea2461@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <859482e7-57a7-4cc9-8f39-b894e5ea2461@citrix.com>
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
Cc: Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjA5LjE4IGF0IDEyOjMxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjQvMDkvMTggMTU6MTYsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyNC4w
OS4xOCBhdCAxNTowMCwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gRm9y
IGF0IGxlYXN0ICJnY2MgKFVidW50dSA1LjQuMC02dWJ1bnR1MX4xNi4wNC4xMCkgNS40LjAgMjAx
NjA2MDkiLCB0aGUKPj4+IHR5cGVjYXN0IG9mIGJ1ZiB0cmlnZ2VycyBhIFZhcmlhYmxlIExlbmd0
aCBBcnJheSB3YXJuaW5nLgo+Pj4KPj4+IEFsdGVyIHRoZSBhc20gZXhwcmVzc2lvbiB0byBhdm9p
ZCB0aGUgdHlwZWNhc3QsIHdoaWNoIG5lY2Vzc2l0YXRlcyB0aGUKPj4+IGludHJvZHVjdGlvbiBv
ZiBhIG1lbW9yeSBjbG9iYmVyIGFzIHRoZSBjb21waWxlciBjYW4gbm8gbG9uZ2VyIGlkZW50aWZ5
Cj4+PiB0aGUgdG90YWwgcXVhbnRpdHkgb2Ygd3JpdHRlbiBtZW1vcnkuCj4+IEkgZGlzbGlrZSB0
aGlzLCBidXQgd2hhdCBkbyB5b3UgZG8uIFdvdWxkIGJlIHF1aXRlIGhlbHBmdWwgdGhvdWdoIHRv
Cj4+IGhhdmUgYSBjb21tZW50IHRoZXJlLCBvciBlbHNlIEkgbWlnaHQgYmUgdGVtcHRlZCB0byB1
bmRvIHRoZQo+PiBtZW1vcnkgY2xvYmJlciBpbiBhIGNvdXBsZSBvZiBtb250aHMveWVhcnMgdGlt
ZS4KPiAKPiBPbiBmdXJ0aGVyIGludmVzdGlnYXRpb24sIGl0cyBhbGwgdmVyc2lvbnMgb2YgR0ND
IGFuZCBDbGFuZyB3aGVuIHVzaW5nCj4gLVd2bGEuICBJJ2xsIHR3ZWFrIHRoZSBjb21taXQgbWVz
c2FnZSBzbyBpdCBkb2Vzbid0IHJlYWQgYXMgaWYgaXQgbWlnaHQKPiBiZSBhIHF1aXJrIGluIHRo
YXQgc3BlY2lmaWMgY29tcGlsZXIuCgpXZWxsLCBpdCdzIGEgcXVpcmsgaW4gYWxsIGNvbXBpbGVy
cyB0aGVuLiBUaGF0IHR5cGUgY2FzdCBjZXJ0YWlubHkgaXMgbm90CmFuIF9pbnN0YW50aWF0aW9u
XyBvZiBhIFZMQSwgeWV0IG9ubHkgdGhvc2UgYXJlIHdoYXQgd2Ugd2FudCB0bwpwcmV2ZW50IChh
bmQgd2hhdCBJIHVuZGVyc3RhbmQgdGhlIHdhcm5pbmcgaXMgdG8gcG9pbnQgb3V0KS4KCkphbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
