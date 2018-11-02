From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 3/3] Avoid repeated memory allocation in
 xen_disk
Date: Fri, 2 Nov 2018 13:53:40 +0000
Message-ID: <20181102135340.GI6481@perard.uk.xensource.com>
References: <154115285434.11300.8459925605672823399.stgit@dhcp-3-135.uk.xensource.com>
 <154115286959.11300.498371710893672725.stgit@dhcp-3-135.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=txag=nn=citrix.com=prvs=837fd5125=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gIZtV-0001Kz-72
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 13:53:49 +0000
Content-Disposition: inline
In-Reply-To: <154115286959.11300.498371710893672725.stgit@dhcp-3-135.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tim Smith <tim.smith@citrix.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, Paul Durrant <Paul.Durrant@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBOb3YgMDIsIDIwMTggYXQgMTA6MDE6MDlBTSArMDAwMCwgVGltIFNtaXRoIHdyb3Rl
Ogo+IHhlbl9kaXNrIGN1cnJlbnRseSBhbGxvY2F0ZXMgbWVtb3J5IHRvIGhvbGQgdGhlIGRhdGEg
Zm9yIGVhY2ggaW9yZXEKPiBhcyB0aGF0IGlvcmVxIGlzIHVzZWQsIGFuZCBmcmVlcyBpdCBhZnRl
cndhcmRzLiBCZWNhdXNlIGl0IHJlcXVpcmVzCj4gcGFnZS1hbGlnbmVkIGJsb2NrcywgdGhpcyBp
bnRlcmFjdHMgcG9vcmx5IHdpdGggbm9uLXBhZ2UtYWxpZ25lZAo+IGFsbG9jYXRpb25zIGFuZCBi
YWxsb29ucyB0aGUgaGVhcC4KPiAKPiBJbnN0ZWFkLCBhbGxvY2F0ZSB0aGUgbWF4aW11bSBwb3Nz
aWJsZSByZXF1aXJlbWVudCwgd2hpY2ggaXMKPiBCTEtJRl9NQVhfU0VHTUVOVFNfUEVSX1JFUVVF
U1QgcGFnZXMgKGN1cnJlbnRseSAxMSBwYWdlcykgd2hlbgo+IHRoZSBpb3JlcSBpcyBjcmVhdGVk
LCBhbmQga2VlcCB0aGF0IGFsbG9jYXRpb24gdW50aWwgaXQgaXMgZGVzdHJveWVkLgo+IFNpbmNl
IHRoZSBpb3JlcXMgdGhlbXNlbHZlcyBhcmUgcmUtdXNlZCB2aWEgYSBmcmVlIGxpc3QsIHRoaXMK
PiBzaG91bGQgYWN0dWFsbHkgaW1wcm92ZSBtZW1vcnkgdXNhZ2UuCj4gCj4gU2lnbmVkLW9mZi1i
eTogVGltIFNtaXRoIDx0aW0uc21pdGhAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBBbnRob255IFBF
UkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KCi0tIApBbnRob255IFBFUkFSRAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
