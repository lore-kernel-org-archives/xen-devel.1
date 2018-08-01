From: Brian Woods <brian.woods@amd.com>
Subject: Re: [PATCH 1/3] x86/spec-ctrl: add AMD SSBD LS_CFG in
 init print
Date: Wed, 1 Aug 2018 16:38:53 -0500
Message-ID: <20180801213852.GB3914@amd.com>
References: <20180720145736.126487-1-brian.woods@amd.com>
 <20180720145736.126487-2-brian.woods@amd.com>
 <5B603E5402000078001D9634@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <5B603E5402000078001D9634@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Brian Woods <brian.woods@amd.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdWwgMzEsIDIwMTggYXQgMDQ6NDc6NDhBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gUG9pbnRsZXNzIGluaXRpYWxpemVyLgoKTm90ZWQKCj4gV2h5IGxvZyB0aGUgc2FtZSBz
dHJpbmcgdHdpY2U/IFNpbXBseSBPUiB0b2dldGhlciBib3RoIGNvbmRpdGlvbnMuCj4gQWxzbyBw
bGVhc2UgZG9uJ3Qgb21pdCB0aGUgYmxhbmsgYmVmb3JlIHRoZSA/IG9wZXJhdG9yLiBCb3RoIHJl
bWFya3MKPiBhcHBseSBhcyB3ZWxsIGZ1cnRoZXIgZG93bi4KCkJlY2F1c2UgdGhleSdyZSBjb21w
bGV0ZWx5IGRpZmZlcmVudCBpbXBsZW1lbnRhdGlvbiBhdCB0aGlzIHBvaW50LiAgSQp0aG91Z2h0
IGFib3V0IG5hbWluZyBpdCBzb21ldGhpbmcgZWxzZSBidXQgY291bGRuJ3QgdGhpbmsgb2Ygc29t
ZXRoaW5nLgpJdCBhbHNvIHJlYWRzIGVhc2llciB3aXRoIGhhdmluZyB0aGVtIHNwbGl0IHVwIHdo
ZXJlIHRoZXJlIGlzbid0IGEgdG9uCm9mIGxvZ2ljIGluIGEgc2luZ2xlIHRlcm5hcnkgb3BlcmF0
b3IuICBUaGVyZSBjYW4gYmUgZWFzaWx5IGNoYW5nZWQuCgo+IEkndmUgcGVla2VkIGFoZWFkIGlu
dG8gdGhlIGZvbGxvd2luZyBwYXRjaGVzLCBhbmQgSSBjYW4ndCBzZWUKPiB3aHkgdGhpcyBuZWVk
cyB0byBiZSBhIHN5bnRoZXRpYyBmZWF0dXJlIGZsYWcuIFdlIHVzZSBzdWNoIGZsYWdzCj4gZm9y
IHRoZSBwdXJwb3NlIG9mIGFsdGVybmF0aXZlIGluc3RydWN0aW9uIHBhdGNoaW5nLCBidXQgeW91
IGRvbid0Cj4gZG8gYW55dGhpbmcgbGlrZSB0aGF0Lgo+IAo+IEphbgoKSSB3YXMgdGFsa2luZyBB
bmR5IGVhcmlseSBhYm91dCBhIFNTQkQgKHZpYSBWSVJUX1NQRUNfQ1RSTCkKaW1wbGVtZW50YXRp
b24gYW5kIGhlIG1lbnRpb25lZCBzb21ldGhpbmcgYWJvdXQgQUxURVJOQVRJVkUgQyBmdW5jcwp3
aGljaCB3b3VsZCBhbGxvdyB0byBhbGxvdyBIVk0gZ3Vlc3RzIHRvIGJlIGFibGUgY29udHJvbCBT
U0JELiAgSW4gdGhhdApjYXNlIGhhdmluZyBhIHN5bnRoZXRpYyBmZWF0dXJlIGZsYWcgaXMgdXNl
ZnVsIGZvciBoZWxwaW5nIHRvCmRpZmZlcmlhdGUgYmV0d2VlbiBTU0JEIHZpYSB0aGUgTFNfQ0ZH
IE1TUiB2cyBTUEVDX0NUUkwgaW4gdGhlIGZ1dHVyZS4KCgotLSAKQnJpYW4gV29vZHMKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
