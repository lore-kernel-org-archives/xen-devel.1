From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 5/7] x86/domain: Optimise the order of
 actions in arch_domain_create()
Date: Fri, 9 Mar 2018 14:43:01 +0000
Message-ID: <20180309144300.bdnvl5v6ynbzvri4@citrix.com>
References: <1520601522-2886-1-git-send-email-andrew.cooper3@citrix.com>
 <1520601522-2886-6-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1520601522-2886-6-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXIgMDksIDIwMTggYXQgMDE6MTg6NDBQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGUgb25seSByZWxldmVudCBpbml0aWFsaXNhdGlvbiBmb3IgdGhlIGlkbGUgZG9t
YWluIGlzIHRoZSBjb250ZXh0IHN3aXRjaCBhbmQKPiBwb2lzb25lZCBwb2ludGVycy4gIENvbGxl
Y3QgdGhlc2UgYml0cyB0b2dldGhlciBlYXJseSBpbiB0aGUgZnVuY3Rpb24gYW5kIGV4aXQKPiB3
aGVuIGNvbXBsZXRlIChhbHRob3VnaCBhcyBhIGNvbnNlcXVlbmNlLCB0aGUgZTgyMCBhbmQgdnRz
YyBsb2NrCj4gaW5pdGlhbGlzYXRpb24gYXJlIG1vdmVkIGZvcndhcmRzKS4gIFRoaXMgYWxsb3dz
IHVzIHRvIHJlbW92ZSBzdWJzZXF1ZW50Cj4gaXNfaWRsZV9kb21haW4oKSBjaGVja3MgYW5kIHVu
aW5kZW50IG1vc3Qgb2YgdGhlIGxvZ2ljLgo+IAo+IEZ1cnRoZXJtb3JlLCB3ZSBubyBsb25nZXIg
Y2FsbCB0aGVzZSBmdW5jdGlvbnMgZm9yIHRoZSBpZGxlIGRvbWFpbjoKPiAgKiBtYXBjYWNoZV9k
b21haW5faW5pdCgpIGFuZCB0c2Nfc2V0X2luZm8oKSB3ZXJlIHByZXZpb3VzbHkgZ3VhcmRlZCBh
Z2FpbnN0Cj4gICAgdGhlIGlkbGUgZG9tYWluLCBhbmQgaGF2ZSBoYWQgdGhlaXIgZ3VhcmRzIHR1
cm5lZCBpbnRvIEFTU0VSVCgpcy4KPiAgKiBwaXRfaW5pdCgpIGlzIGltcGxpY2l0bHkgZ3VhcmRl
ZCBieSBoYXNfdnBpdCgpLgo+ICAqIHBzcl9kb21haW5faW5pdCgpIG5vIGxvbmdlciBhbGxvY2F0
ZXMgYSBzb2NrZXQgYXJyYXkuCj4gCj4gRmluYWxseSwgdHdvIGNoYW5nZXMgYXJlIGludHJvZHVj
ZWQgZm9yIHRoZSBiZW5lZml0IG9mIHRoZSBmb2xsb3dpbmcgcGF0Y2g6Cj4gICogRm9yIFBWIGhh
cmR3YXJlIGRvbWFpbnMsIG9yIFhFTl9YODZfRU1VX1BJVCBpbnRvIGVtZmxhZ3MgcmF0aGVyIHRo
YW4gaW50bwo+ICAgIGNvbmZpZy0+ZW11bGF0aW9uX2ZsYWdzLCB0byBmYWNpbGl0YXRpbmcgY29u
ZmlnIGJlY29taW5nIGNvbnN0Lgo+ICAqIFJlZmVyZW5jZXMgdG8gZG9tY3JfZmxhZ3MgYXJlIG1v
dmVkIHVudGlsIGFmdGVyIHRoZSBpZGxlIGVhcmx5IGV4aXN0LCB0bwo+ICAgIGZhY2lsaXRpYXRl
IHRoZW0gYmVpbmcgdW5hdmFpbGFibGUgZm9yIHN5c3RlbSBkb21haW5zLgo+IAo+IE5vIHByYWN0
aWNhbCBjaGFuZ2UgaW4gYmVoYXZpb3VyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2Vp
LmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
