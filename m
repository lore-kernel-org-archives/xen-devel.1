From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH v6 09/20] xen: add basic hooks for PVH in
 current code
Date: Thu, 6 Dec 2018 16:24:50 +0100
Message-ID: <20181206152450.n3y7mhnv4qeifxdy__47770.4215249561$1544109833$gmane$org@tomti.i.net-space.pl>
References: <20181128135530.32545-1-jgross@suse.com>
 <20181128135530.32545-10-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <20181128135530.32545-10-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: hans@knorrie.org, grub-devel@gnu.org, phcoder@gmail.com, roger.pau@citrix.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBOb3YgMjgsIDIwMTggYXQgMDI6NTU6MTlQTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBBZGQgdGhlIGhvb2tzIHRvIGN1cnJlbnQgY29kZSBuZWVkZWQgZm9yIFhlbiBQVkgu
IFRoZXkgd2lsbCBiZSBmaWxsZWQKPiB3aXRoIGNvZGUgbGF0ZXIgd2hlbiB0aGUgcmVsYXRlZCBm
dW5jdGlvbmFsaXR5IGlzIGJlaW5nIGFkZGVkLgo+Cj4gbG9hZGVyL2kzODYvbGludXguYyBuZWVk
cyB0byBpbmNsdWRlIG1hY2hpbmUva2VybmVsLmggbm93IGFzIGl0IG5lZWRzCj4gdG8gZ2V0IEdS
VUJfS0VSTkVMX1VTRV9SU0RQX0FERFIgZnJvbSB0aGVyZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiBSZXZpZXdlZC1ieTogRGFuaWVsIEtpcGVy
IDxkYW5pZWwua2lwZXJAb3JhY2xlLmNvbT4KPiAtLS0KPiBWMzogeGVucHZoLT54ZW5fcHZoIChE
YW5pZWwgS2lwZXIpCj4gICAgIGFkanVzdCBjb3B5cmlnaHQgZGF0ZSAoUm9nZXIgUGF1IE1vbm7D
qSkKPiBWNTogdXBkYXRlIGNvbW1pdCBtZXNzYWdlIChEYW5pZWwgS2lwZXIpCj4gICAgIG1vdmUg
aW5jbHVkaW5nIHhlbi9odm0vc3RhcnRfaW5mby5oIHRvIHRoZSBzb3VyY2VzIHJlYWxseSBuZWVk
aW5nCj4gICAgICAgaXQgKERhbmllbCBLaXBlcikKPiAtLS0KClsuLi5dCgo+IGRpZmYgLS1naXQg
YS9ncnViLWNvcmUvbG9hZGVyL2kzODYvbGludXguYyBiL2dydWItY29yZS9sb2FkZXIvaTM4Ni9s
aW51eC5jCj4gaW5kZXggMzc1ZWU4MGRjLi5iNjAxNTkxM2IgMTAwNjQ0Cj4gLS0tIGEvZ3J1Yi1j
b3JlL2xvYWRlci9pMzg2L2xpbnV4LmMKPiArKysgYi9ncnViLWNvcmUvbG9hZGVyL2kzODYvbGlu
dXguYwo+IEBAIC0zNSw2ICszNSw3IEBACj4gICNpbmNsdWRlIDxncnViL2kxOG4uaD4KPiAgI2lu
Y2x1ZGUgPGdydWIvbGliL2NtZGxpbmUuaD4KPiAgI2luY2x1ZGUgPGdydWIvbGludXguaD4KPiAr
I2luY2x1ZGUgPGdydWIvbWFjaGluZS9rZXJuZWwuaD4KClRoaXMgaW5jbHVkZSBicmVha3MgaTM4
NiBpZWVlMTI3NSBidWlsZHMuIENvdWxkIHlvdSBmaXggdGhhdCBhbmQgcmVwb3N0PwoKRGFuaWVs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
