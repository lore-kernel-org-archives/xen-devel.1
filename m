From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 2/5] x86: Begin to remove TSC mode
 PVRDTSCP
Date: Tue, 20 Nov 2018 09:27:06 -0700
Message-ID: <5BF435DA02000078001FE2D3@prv1-mh.provo.novell.com>
References: <1542724622-14321-1-git-send-email-andrew.cooper3@citrix.com>
 <1542724622-14321-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542724622-14321-3-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjExLjE4IGF0IDE1OjM2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gRm9yIG1vcmUgaGlzdG9yaWNhbCBjb250ZXh0LCBzZWUKPiAgIGMvcyBjMTdiMzZkNWRj
NzkyY2ZkZjU5YjZkZTAyMTNiMTY4YmVjMGFmOGU4Cj4gICBjL3MgMDQ2NTYzODRhMWI5NzE0ZTQz
ZGI4NTBjNTE0MzEwMDhlMjM0NTBkOAo+IAo+IFBWUkRUU0NQIHdhcyBhbiBhdHRlbXB0IHRvIHBy
b3ZpZGUgWGVuLWF3YXJlIHVzZXJzcGFjZSB3aXRoIGEgc3RhYmxlIG1vbm90b25pYwo+IGNsb2Nr
LCBhbmQgZW5vdWdoIGluZm9ybWF0aW9uIGZvciBzYWlkIHVzZXJzcGFjZSB0byBjb3BlIHdpdGgg
ZnJlcXVlbmN5Cj4gY2hhbmdlcyBhY3Jvc3MgbWlncmF0ZS4gIEhvd2V2ZXIsIHRoZSBQVlJEVFND
UCBpbmZyYXN0cnVjdHVyZSBoYXMgcmVzdWx0ZWQgaW4KPiB2ZXJ5IHRhbmdsZWQgY29kZSwgYW5k
IG5vbi1hcmNoaXRlY3R1cmFsIGJlaGF2aW91ciBldmVuIGluIG5vbi1QVlJEVFNDUCBjYXNlcy4K
PiAKPiBTZWVpbmcgYXMgdGhlIGZ1bmN0aW9uYWxpdHkgaGFzIGJlZW4gcmVwbGFjZWQgZW50aXJl
bHkgYnkgaW1wcm92ZW1lbnRzIGluIFBWCj4gY2xvY2tzIChpbmNsdWRpbmcgYmVpbmcgcGx1bWJl
ZCBpbnRvIHRoZSBWRFNPIG5vd2FkYXlzKSwgb3IgYWx0ZXJuYXRpdmVseSBieQo+IGhhcmR3YXJl
IFRTQyBzY2FsaW5nIGZlYXR1cmVzLCBhbmQgbm8tb25lIGlzIGF3YXJlIG9mIGFueSB1c2VycyBv
ZiB0aGlzIG1vZGUsCj4gdGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8gcmVtb3ZlIGl0Lgo+IAo+IEZv
ciBub3csIGRyb3AgVFNDX01PREVfUFZSRFRTQ1AgZnJvbSB0c2Nfe2dldCxzZXR9X2luZm8oKS4g
IFRoaXMgd2lsbCBjYXRjaAo+IGFuZCBjbGVhbmx5IHJlamVjdCBhdHRlbXB0cyB0byBtaWdyYXRl
IGluIGEgVk0gY29uZmlndXJlZCB0byB1c2UgUFZSRFRTQ1AsCj4gcmF0aGVyIHRoYW4gbGV0dGlu
ZyBpdCBydW4gYW5kIGhhdmUgdGhlIHdyb25nIHRpbWluZyBtb2RlLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpBY2tlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
