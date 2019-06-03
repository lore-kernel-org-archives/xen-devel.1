From: chenbaodong <chenbaodong@mxnavi.com>
Subject: Re: [PATCH RESEND] xen: notifier: refine
 'notifier_head', use 'list_head' directly
Date: Mon, 3 Jun 2019 17:44:42 +0800
Message-ID: <2ab8c99c-9089-341d-3149-362c4415708e@mxnavi.com>
References: <24a63318c9021cb88f31fa416c3aa943@sslemail.net>
 <5CF4E83B02000078002347AC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WQxh=UC=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hXjWK-0003im-J6
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 09:44:48 +0000
In-Reply-To: <5CF4E83B02000078002347AC@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Ck9uIDYvMy8xOSAxNzoyOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDMuMDYuMTkgYXQg
MDM6MzMsIDxjaGVuYmFvZG9uZ0BteG5hdmkuY29tPiB3cm90ZToKPj4gJ25vdGlmaWVyX2Jsb2Nr
JyBjYW4gYmUgcmVwbGFjZWQgd2l0aCAnbGlzdF9oZWFkJyB3aGVuIHVzZWQgZm9yCj4+ICdub3Rp
Zmllcl9oZWFkJywgdGhpcyBtYWtlIHRoZSBhIGxpdHRsZSBtb3JlIGNsZWFyLgo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBCYW9kb25nIENoZW4gPGNoZW5iYW9kb25nQG14bmF2aS5jb20+Cj4gT2gsIGFu
ZCBhbHNvIGEgcmVtYXJrIHJlZ2FyZGluZyB0aGUgdGl0bGU6IFdoeSAiUkVTRU5EIj8gVGhpcwo+
IHNob3VsZCBiZSB1c2VkIG9ubHkgaWYgeW91IHJlLXNlbmQgYW4gZW50aXJlbHkgdW5jaGFuZ2Vk
IHBhdGNoLAo+IHBlcmhhcHMgYmVjYXVzZSBvZiBhIGNvcnJlY3Rpb24gdG8gdGhlIHJlY2lwaWVu
dHMgbGlzdC4gT3RoZXJ3aXNlCj4gcGxlYXNlIGluY3JlbWVudCB0aGUgdmVyc2lvbiBudW1iZXIu
CgpIZWxsbyBKYW4sIFRoYW5rcyBmb3IgZ3VpZGluZyBtZSB0byB0aGUgcmlnaHQgZGlyZWN0aW9u
LgoKVGhpcyBpcyBteSBmaXJzdCBleHBlcmllbmNlIHNlbmRpbmcgcGF0Y2ggdXNpbmcgbWFpbCBs
aXN0LgoKSSB3aWxsIHVzZSB2ZXJzaW9uIG51bWJlciBpbnN0ZWFkIG9mIHJlc2VuZCBuZXh0IHRp
bWUuCgo+IEphbgo+Cj4KPiAuCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
