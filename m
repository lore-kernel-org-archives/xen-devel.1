From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 03/18] xen: introduce 'xen-block',
 'xen-disk' and 'xen-cdrom'
Date: Tue, 11 Dec 2018 15:16:36 +0000
Message-ID: <20181211151636.GQ18875@perard.uk.xensource.com>
References: <1544525238-3527-1-git-send-email-paul.durrant@citrix.com>
 <1544525238-3527-4-git-send-email-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=P5G6=OU=citrix.com=prvs=8761f1f8f=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gWjmd-0000Ly-HB
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 15:17:15 +0000
Content-Disposition: inline
In-Reply-To: <1544525238-3527-4-git-send-email-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBEZWMgMTEsIDIwMTggYXQgMTA6NDc6MDNBTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoaXMgcGF0Y2ggYWRkcyBuZXcgWGVuRGV2aWNlLXM6ICd4ZW4tZGlzaycgYW5kICd4
ZW4tY2Ryb20nLCBib3RoIGRlcml2ZWQKPiBmcm9tIGEgY29tbW9uICd4ZW4tYmxvY2snIHBhcmVu
dCB0eXBlLiBUaGVzZSB3aWxsIGV2ZW50dWFsbHkgcmVwbGFjZSB0aGUKPiAneGVuX2Rpc2snIChu
b3RlIHRoZSB1bmRlcnNjb3JlIHJhdGhlciB0aGFuIGh5cGhlbikgbGVnYWN5IFBWIGJhY2tlbmQg
YnV0Cj4gaXQgaXMgaWxsdXN0cmF0aXZlIHRvIGJ1aWxkIHVwIHRoZSBpbXBsZW1lbnRhdGlvbiBp
bmNyZW1lbnRhbGx5LCBhbG9uZyB3aXRoCj4gdGhlIFhlbkJ1cy9YZW5EZXZpY2UgZnJhbWV3b3Jr
LiBTdWJzZXF1ZW50IHBhdGNoZXMgd2lsbCB0aGVyZWZvcmUgYWRkIHRvCj4gdGhlc2UgZGV2aWNl
cycgaW1wbGVtZW50YXRpb24gYXMgbmV3IGZlYXR1cmVzIGFyZSBhZGRlZCB0byB0aGUgZnJhbWV3
b3JrLgo+IAo+IEFmdGVyIHRoaXMgcGF0Y2ggaGFzIGJlZW4gYXBwbGllZCBpdCBpcyBwb3NzaWJs
ZSB0byBpbnN0YW50aWF0ZSBuZXcKPiAneGVuLWRpc2snIG9yICd4ZW4tY2Ryb20nIGRldmljZXMg
d2l0aCBhIHNpbmdsZSAndmRldicgcGFyYW1ldGVyLCB3aGljaAo+IGFjY2VwdHMgdmFsdWVzIGFk
aGVyaW5nIHRvIHRoZSBYZW4gVkJEIG5hbWluZyBzY2hlbWUgWzFdLiBGb3IgZXhhbXBsZSwgYQo+
IGNvbW1hbmQtbGluZSBpbnN0YW50aWF0aW9uIG9mIGEgeGVuLWRpc2sgY2FuIGJlIGRvbmUgd2l0
aCBhbiBhcmd1bWVudAo+IHNpbWlsYXIgdG8gdGhlIGZvbGxvd2luZzoKPiAKPiAtZGV2aWNlIHhl
bi1kaXNrLHZkZXY9aGRhCj4gCj4gVGhlIGltcGxlbWVudGF0aW9uIG9mIHRoZSB2ZGV2IHBhcmFt
ZXRlciBmb3JtdWxhdGVzIHRoZSBhcHByb3ByaWF0ZSBWQkQKPiBudW1iZXIgZm9yIHVzZSBpbiB0
aGUgUFYgcHJvdG9jb2wuCj4gCj4gWzFdIGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2RvY3MvdW5z
dGFibGUvbWFuL3hlbi12YmQtaW50ZXJmYWNlLjcuaHRtbAo+IAo+IFNpZ25lZC1vZmYtYnk6IFBh
dWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CgpOb3cgd2UgY2FuIGFkZCBhIHhl
bi1kaXNrIHdpdGggdmRldj14dmRiZ3FjdiA6KQoKUmV2aWV3ZWQtYnk6IEFudGhvbnkgUEVSQVJE
IDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgoKVGhhbmtzLAoKLS0gCkFudGhvbnkgUEVSQVJE
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
