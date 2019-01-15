From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] tools: only call git when necessary in OVMF
 Makefile
Date: Tue, 15 Jan 2019 11:40:28 +0000
Message-ID: <20190115114028.cbf7wp7kihsltxha@zion.uk.xensource.com>
References: <20190115110940.29403-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tNAP=PX=citrix.com=prvs=9111e199a=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gjN63-0001ui-6o
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 11:41:31 +0000
Content-Disposition: inline
In-Reply-To: <20190115110940.29403-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Olaf Hering <olaf@aepfle.de>, Wei Liu <wei.liu2@citrix.com>, Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

Rm9yZ290IHRvIENDIEp1ZXJnZW4uIE5vdyBkb25lLgoKT24gVHVlLCBKYW4gMTUsIDIwMTkgYXQg
MTE6MDk6NDBBTSArMDAwMCwgV2VpIExpdSB3cm90ZToKPiBVc2VycyBtYXkgY2hvb3NlIHRvIGV4
cG9ydCBhIHNuYXBzaG90IG9mIE9WTUYgYW5kIGJ1aWxkIGl0Cj4gd2l0aCB4ZW4uZ2l0IHN1cHBs
aWVkIG92bWYtbWFrZWZpbGUuIEluIHRoYXQgY2FzZSB3ZSBkb24ndAo+IG5lZWQgdG8gY2FsbCBg
Z2l0IHN1Ym1vZHVsZWAuCj4gCj4gRml4ZXMgYjE2MjgxODcwZS4KPiAKPiBSZXBvcnRlZC1ieTog
T2xhZiBIZXJpbmcgPG9sYWZAYWVwZmxlLmRlPgo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdl
aS5saXUyQGNpdHJpeC5jb20+Cj4gLS0tCj4gIHRvb2xzL2Zpcm13YXJlL292bWYtbWFrZWZpbGUg
fCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
IAo+IGRpZmYgLS1naXQgYS90b29scy9maXJtd2FyZS9vdm1mLW1ha2VmaWxlIGIvdG9vbHMvZmly
bXdhcmUvb3ZtZi1tYWtlZmlsZQo+IGluZGV4IDNkZTJmYzAzMDAuLjU1Zjk5OTIxNDUgMTAwNjQ0
Cj4gLS0tIGEvdG9vbHMvZmlybXdhcmUvb3ZtZi1tYWtlZmlsZQo+ICsrKyBiL3Rvb2xzL2Zpcm13
YXJlL292bWYtbWFrZWZpbGUKPiBAQCAtMTYsNyArMTYsNyBAQCBhbGw6IGJ1aWxkCj4gIAo+ICAu
UEhPTlk6IGJ1aWxkCj4gIGJ1aWxkOgo+IC0JJChHSVQpIHN1Ym1vZHVsZSB1cGRhdGUgLS1pbml0
IC0tcmVjdXJzaXZlCj4gKwlpZiB0ZXN0IC1lIC5naXQgOyB0aGVuICQoR0lUKSBzdWJtb2R1bGUg
dXBkYXRlIC0taW5pdCAtLXJlY3Vyc2l2ZSA7IGZpCj4gIAlPdm1mUGtnL2J1aWxkLnNoIC1hIFg2
NCAtYiAkKFRBUkdFVCkgLW4gNAo+ICAJY3AgQnVpbGQvT3ZtZlg2NC8kKFRBUkdFVClfR0NDKi9G
Vi9PVk1GLmZkIG92bWYuYmluCj4gIAo+IC0tIAo+IDIuMTEuMAo+IAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
