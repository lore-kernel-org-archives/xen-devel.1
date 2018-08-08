From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] xen/balloon: fix balloon initialization for
 PVH Dom0
Date: Wed, 8 Aug 2018 13:01:23 -0400
Message-ID: <dbefa2f6-8545-c76f-10a0-cbb5eef40678__1247.85189186714$1533749372$gmane$org@oracle.com>
References: <20180808114641.20854-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7jrv=kx=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fnSI3-0007PX-2p
 for xen-devel@lists.xenproject.org; Wed, 08 Aug 2018 17:30:31 +0000
In-Reply-To: <20180808114641.20854-1-roger.pau@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Gabriel Ercarug <bercarug@amazon.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDgvMjAxOCAwNzo0NiBBTSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFRoZSBjdXJy
ZW50IGJhbGxvb24gY29kZSB0cmllcyB0byBjYWxjdWxhdGUgYSBkZWx0YSBmYWN0b3IgZm9yIHRo
ZQo+IGJhbGxvb24gdGFyZ2V0IHdoZW4gcnVubmluZyBpbiBIVk0gbW9kZSBpbiBvcmRlciB0byBh
Y2NvdW50IGZvciBtZW1vcnkKPiB1c2VkIGJ5IHRoZSBmaXJtd2FyZS4KPgo+IFRoaXMgd29ya2Fy
b3VuZCBmb3IgbWVtb3J5IGFjY291bnRpbmcgZG9lc24ndCB3b3JrIHByb3Blcmx5IG9uIGEgUFZI
Cj4gRG9tMCwgdGhhdCBoYXMgYSBzdGF0aWMtbWF4IHZhbHVlIGRpZmZlcmVudCBmcm9tIHRoZSB0
YXJnZXQgdmFsdWUgZXZlbgo+IGF0IHN0YXJ0dXAuIE5vdGUgdGhhdCB0aGlzIGlzIG5vdCBhIHBy
b2JsZW0gZm9yIERvbVVzIGJlY2F1c2UgZ3Vlc3RzIGFyZQo+IHN0YXJ0ZWQgd2l0aCBhIHN0YXRp
Yy1tYXggdmFsdWUgdGhhdCBtYXRjaGVzIHRoZSBhbW91bnQgb2YgUkFNIGluIHRoZQo+IG1lbW9y
eSBtYXAuCj4KPiBGaXggdGhpcyBieSBmb3JjZWZ1bGx5IHNldHRpbmcgdGFyZ2V0X2RpZmYgZm9y
IERvbTAsIHJlZ2FyZGxlc3Mgb2YKPiBpdCdzIG1vZGUuCj4KPiBSZXBvcnRlZC1ieTogR2Ficmll
bCBCZXJjYXJ1ZyA8YmVyY2FydWdAYW1hem9uLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPgoKCkFwcGxpZWQgdG8gZm9yLWxpbnVz
LTQuMTkKCi1ib3JpcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
