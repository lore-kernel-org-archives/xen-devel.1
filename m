From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 13/18] xen: purge 'blk' and 'ioreq' from
 function names in dataplane/xen-qdisk.c
Date: Tue, 4 Dec 2018 12:10:41 +0000
Message-ID: <20181204121041.GT14786@perard.uk.xensource.com>
References: <20181121151211.15997-1-paul.durrant@citrix.com>
 <20181121151211.15997-14-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=27b+=on=citrix.com=prvs=869086d29=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gU9YN-0008Gc-5z
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 12:11:51 +0000
Content-Disposition: inline
In-Reply-To: <20181121151211.15997-14-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBOb3YgMjEsIDIwMTggYXQgMDM6MTI6MDZQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoaXMgaXMgYSBwdXJlbHkgY29zbWV0aWMgcGF0Y2ggdGhhdCBwdXJnZXMgcmVtYWlu
aW5nIHVzZSBvZiAnYmxrJyBhbmQKPiAnaW9yZXEnIGluIGxvY2FsIGZ1bmN0aW9uIG5hbWVzLgo+
IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFu
dCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CgpJIGRvbid0IHRoaW5rIGl0J3MgYSBnb29kIGlk
ZWUgdG8gdXNlIGZ1bmN0aW9uIG5hbWVzIHRoYXQgY291bGQgYmUgdXNlCmVsc2V3aGVyZSwgZG9u
J3QgaGF2ZSBhIG5hbWVzcGFjZS4gSXQgbWFrZXMgaXQgbW9yZSBkaWZmaWN1bHQgdG8gZmlndXJl
Cm91dCB3aGljaCBmdW5jdGlvbiBpcyBjYWxsZWQgYnkganVzdCBzZWFyY2hpbmcgZm9yIHRoZSBm
dW5jdGlvbiBuYW1lLgoKQ291bGQgeW91IGhhZCBhIHByZWZpeD8KTWF5YmUgeGVuZGlza18gb3Ig
eGVuX2Rpc2sgb3IgeGVuX3FkaXNrIG9yIHhlbl9ibG9jayBvciAuLi4sIHNvIHdlIGNhbgpoYXZl
IHhlbmRpc2tfc3RhcnRfcmVxdWVzdCwgb3IgeGVuZGlza19yZXF1ZXN0X3N0YXJ0LiBJIGRvbid0
IGhhdmUgYQpwcmVmZXJlbmNlIGJlc2lkZSBzdGF5aW5nIGF3YXkgZnJvbSBnZW5lcmljIG5hbWVz
LgoKVGhhbmtzLAoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
