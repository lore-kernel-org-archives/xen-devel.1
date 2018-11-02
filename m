From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 1/3] Improve xen_disk batching behaviour
Date: Fri, 2 Nov 2018 13:53:15 +0000
Message-ID: <20181102135315.GG6481__22427.9296388433$1541166735$gmane$org@perard.uk.xensource.com>
References: <154115285434.11300.8459925605672823399.stgit@dhcp-3-135.uk.xensource.com>
 <154115285942.11300.11718576813181760505.stgit@dhcp-3-135.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=txag=nn=citrix.com=prvs=837fd5125=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gIZt7-0001HR-7D
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 13:53:25 +0000
Content-Disposition: inline
In-Reply-To: <154115285942.11300.11718576813181760505.stgit@dhcp-3-135.uk.xensource.com>
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

T24gRnJpLCBOb3YgMDIsIDIwMTggYXQgMTA6MDA6NTlBTSArMDAwMCwgVGltIFNtaXRoIHdyb3Rl
Ogo+IFdoZW4gSS9PIGNvbnNpc3RzIG9mIG1hbnkgc21hbGwgcmVxdWVzdHMsIHBlcmZvcm1hbmNl
IGlzIGltcHJvdmVkIGJ5Cj4gYmF0Y2hpbmcgdGhlbSB0b2dldGhlciBpbiBhIHNpbmdsZSBpb19z
dWJtaXQoKSBjYWxsLiBXaGVuIHRoZXJlIGFyZQo+IHJlbGF0aXZlbHkgZmV3IHJlcXVlc3RzLCB0
aGUgZXh0cmEgb3ZlcmhlYWQgaXMgbm90IHdvcnRoIGl0LiBUaGlzCj4gaW50cm9kdWNlcyBhIGNo
ZWNrIHRvIHN0YXJ0IGJhdGNoaW5nIEkvTyByZXF1ZXN0cyB2aWEgYmxrX2lvX3BsdWcoKS8KPiBi
bGtfaW9fdW5wbHVnKCkgaW4gYW4gYW1vdW50IHByb3BvcnRpb25hbCB0byB0aGUgbnVtYmVyIHdo
aWNoIHdlcmUKPiBhbHJlYWR5IGluIGZsaWdodCBhdCB0aGUgdGltZSB3ZSBzdGFydGVkIHJlYWRp
bmcgdGhlIHJpbmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogVGltIFNtaXRoIDx0aW0uc21pdGhAY2l0
cml4LmNvbT4KCkFja2VkLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4
LmNvbT4KCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
