From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] libxl: do not fail device removal if
 backend domain is gone
Date: Fri, 23 Feb 2018 18:51:16 +0000
Message-ID: <20180223185116.l5pb7wnuwau7u63p@citrix.com>
References: <20180208232213.4105-1-marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <20180208232213.4105-1-marmarek@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBGZWIgMDksIDIwMTggYXQgMTI6MjI6MTNBTSArMDEwMCwgTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyb3RlOgo+IEJhY2tlbmQgZG9tYWluIG1heSBiZSBpbmRlcGVuZGVudGx5
IGRlc3Ryb3llZCAtIHRoZXJlIGlzIG5vCj4gc3luY2hyb25pemF0aW9uIG9mIGxpYnhsIHN0cnVj
dHVyZXMgKGluY2x1ZGluZyAvbGlieGwgdHJlZSkgZWxzZXdoZXJlLgo+IEJhY2tlbmQgbWlnaHQg
YWxzbyByZW1vdmUgdGhlIGRldmljZSBpbmZvIGZyb20gaXRzIGJhY2tlbmQgeGVuc3RvcmUKPiBz
dWJ0cmVlIG9uIGl0cyBvd24uCj4gSWYgc3VjaCBzaXR1YXRpb24gaXMgZGV0ZWN0ZWQsIGRvIG5v
dCBmYWlsIHRoZSByZW1vdmFsLCBidXQgZmluaXNoIHRoZQo+IGNsZWFudXAgb2YgdGhlIGZyb250
ZW5kIHNpZGUuCj4gCj4gVGhpcyBpcyBqdXN0IHdvcmthcm91bmQsIHRoZSByZWFsIGZpeCBzaG91
bGQgd2F0Y2ggd2hlbiB0aGUgZGV2aWNlCj4gYmFja2VuZCBpcyByZW1vdmVkIChpbmNsdWRpbmcg
YmFja2VuZCBkb21haW4gZGVzdHJ1Y3Rpb24pIGFuZCByZW1vdmUKPiBmcm9udGVuZCBhdCB0aGF0
IHRpbWUuIEFuZCByZXBvcnQgc3VjaCBldmVudCB0byBoaWdoZXIgbGF5ZXIgY29kZSwgc28KPiBm
b3IgZXhhbXBsZSBsaWJ2aXJ0IGNvdWxkIHN5bmNocm9uaXplIGl0cyBzdGF0ZS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJs
ZXRoaW5nc2xhYi5jb20+CgpBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4K
CkNhbiB5b3UgcGxlYXNlIHJlc2VuZCB3aXRoIGNvbW1pdCBtZXNzYWdlIHVwZGF0ZWQsIHRoYW5r
cy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
