From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/efi: move the logic to detect PE build
 support
Date: Mon, 16 Jul 2018 01:59:15 -0600
Message-ID: <5B4C505302000078001D4274@prv1-mh.provo.novell.com>
References: <20180713160229.13395-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=6083=ka=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1feyPk-0006xi-3V
 for xen-devel@lists.xenproject.org; Mon, 16 Jul 2018 07:59:24 +0000
In-Reply-To: <20180713160229.13395-1-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Daniel Kiper <daniel.kiper@oracle.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjA3LjE4IGF0IDE4OjAyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9NYWtlZmls
ZQo+IEBAIC0xNjgsNiArMTY4LDE2IEBAICQoVEFSR0VUKS5lZmk6IEFMVF9CQVNFID0gMHgkKHNo
ZWxsICQoTk0pIAo+IGVmaS9yZWxvY3MtZHVtbXkubyB8IHNlZCAtbiAncywgQSBBTFRfCj4gICMg
RG9uJ3QgdXNlICQod2lsZGNhcmQgLi4uKSBoZXJlIC0gYXQgbGVhc3QgbWFrZSAzLjgwIGV4cGFu
ZHMgdGhpcyB0b28gZWFybHkhCj4gICQoVEFSR0VUKS5lZmk6IGd1YXJkID0gJChpZiAkKHNoZWxs
IGVjaG8gZWZpL2RpcyogfCBncmVwIGRpc2FibGVkKSw6KQo+ICAKPiArIyBDaGVjayBpZiB0aGUg
YnVpbGQgc3lzdGVtIHN1cHBvcnRzIFBFLgo+ICtlZmkgOj0geSQoc2hlbGwgcm0gLWYgZWZpL2Rp
c2FibGVkKQo+ICtlZmkgOj0gJChpZiAkKGVmaSksJChzaGVsbCAkKENDKSAkKGZpbHRlci1vdXQg
JChDRkxBR1MteSkgLiUuZCwkKENGTEFHUykpIC1jIGVmaS9jaGVjay5jIC1vIGVmaS9jaGVjay5v
IDI+ZWZpL2Rpc2FibGVkICYmIGVjaG8geSkpCj4gK2VmaSA6PSAkKGlmICQoZWZpKSwkKHNoZWxs
ICQoTEQpIC1taTM4NnBlcCAtLXN1YnN5c3RlbT0xMCAtbyBlZmkvY2hlY2suZWZpIGVmaS9jaGVj
ay5vIDI+ZWZpL2Rpc2FibGVkICYmIGVjaG8geSkpCj4gK2VmaSA6PSAkKGlmICQoZWZpKSwkKHNo
ZWxsIHJtIGVmaS9kaXNhYmxlZCl5KQo+ICtleHBvcnQgQlVJTERfUEUgOj0gJChlZmkpCj4gK2lm
ZXEgKCQoZWZpKSx5KQo+ICtDRkxBR1MgKz0gLURCVUlMRF9QRQo+ICtlbmRpZgoKRm9yIG9uZSBJ
J20gbm90IHJlYWxseSBoYXBweSBhYm91dCB0aGlzIGJlaW5nIG1vdmVkIGhlcmU6IEkgZGlkIHBs
YWNlIGl0CmluIGVmaS9NYWtlZmlsZSBmb3IgdGhlIHNpbXBsZSByZWFzb24gb2YgaGF2aW5nIGFz
IG11Y2ggYXMgcG9zc2libGUgb2YKdGhlIEVGSSBzcGVjaWZpY3MgaW4gdGhhdCBzaW5nbGUgZmls
ZS4KCkFkZGl0aW9uYWxseSBJIHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciBpZiBzZXR0aW5nIHBy
b3BhZ2F0ZWQgdGhyb3VnaCB0aGUKZW52aXJvbm1lbnQgaGFkIFhFTl8gcHJlZml4ZXMuCgo+IC0t
LSBhL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMKPiArKysgYi94ZW4vYXJjaC94ODYveGVuLmxkcy5T
Cj4gQEAgLTMwNCw3ICszMDQsOSBAQCBTRUNUSU9OUwo+ICAgIH0gOnRleHQKPiAgI2VuZGlmCj4g
IAo+IC0gIGVmaSA9IERFRklORUQoZWZpKSA/IGVmaSA6IC47Cj4gKyNpZm5kZWYgQlVJTERfUEUK
PiArICBlZmkgPSAuOwo+ICsjZW5kaWYKCkFuZCB0aGVuIEkgZG9uJ3QgcmVhbGx5IHVuZGVyc3Rh
bmQgaG93IHRoaXMgaXMgZGlmZmVyZW50IGZyb20gdGhlCm9yaWdpbmFsICNpZm5kZWYgRUZJIHRo
YXQgRGFuaWVsIGhhZCBwcm9ibGVtcyB3aXRoLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
