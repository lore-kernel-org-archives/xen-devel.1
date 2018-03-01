From: "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH v2 7/7] x86/build: Use new .nop directive
 when available
Date: Thu, 01 Mar 2018 00:28:27 -0700
Message-ID: <5A97AB9B0200007800128BF6@prv-mh.provo.novell.com>
References: <1519644904-11349-1-git-send-email-andrew.cooper3@citrix.com>
 <1519644904-11349-8-git-send-email-andrew.cooper3@citrix.com>
 <5A96E54602000078001ACF21@prv-mh.provo.novell.com>
 <782df0c6-4449-9d71-2370-b68d1110f815@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <782df0c6-4449-9d71-2370-b68d1110f815@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: andrew.cooper3@citrix.com
Cc: xen-devel@lists.xen.org, wei.liu2@citrix.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IDAyLzI4LzE4IDc6
MjAgUE0gPj4+Cj5PbiAyOC8wMi8xOCAxNjoyMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9u
IDI2LjAyLjE4IGF0IDEyOjM1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+
PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2FsdGVybmF0aXZlLWFzbS5oCj4+PiArKysgYi94
ZW4vaW5jbHVkZS9hc20teDg2L2FsdGVybmF0aXZlLWFzbS5oCj4+PiBAQCAtMSw2ICsxLDggQEAK
Pj4+ICAjaWZuZGVmIF9BU01fWDg2X0FMVEVSTkFUSVZFX0FTTV9IXwo+Pj4gICNkZWZpbmUgX0FT
TV9YODZfQUxURVJOQVRJVkVfQVNNX0hfCj4+PiAgCj4+PiArI2luY2x1ZGUgPGFzbS9ub3BzLmg+
Cj4+PiArCj4+PiAgI2lmZGVmIF9fQVNTRU1CTFlfXwo+Pj4gIAo+Pj4gIC8qCj4+PiBAQCAtMTgs
NiArMjAsMTQgQEAKPj4+ICAgICAgLmJ5dGUgXHBhZF9sZW4KPj4+ICAuZW5kbQo+Pj4gIAo+Pj4g
Ky5tYWNybyBta25vcHMgbnJfYnl0ZXMKPj4+ICsjaWZkZWYgSEFWRV9BU19OT1BfRElSRUNUSVZF
Cj4+PiArICAgIC5ub3AgXG5yX2J5dGVzLCBBU01fTk9QX01BWAo+PiBBbmQgZG8geW91IHJlYWxs
eSBuZWVkIHRvIHNwZWNpZnkgQVNNX05PUF9NQVggaGVyZT8gV2hhdCdzCj4+IHdyb25nIHdpdGgg
bGV0dGluZyB0aGUgYXNzZW1ibGVyIHBpY2sgd2hhdCBpdCB3YW50cyBhcyB0aGUgbG9uZ2VzdAo+
PiBOT1A/Cj4KPkkgZG9uJ3Qgd2FudCBhIHRvb2xjaGFpbiBjaGFuZ2UgdG8gY2F1c2UgdXMgdG8g
Z28gYmV5b25kIDExIGJ5dGUgbm9wcywKPmJlY2F1c2Ugb2YgdGhlIGFzc29jaWF0ZWQgZGVjb2Rl
IHN0YWxsIG9uIGFsbW9zdCBhbGwgaGFyZHdhcmUuICBVc2luZwo+QVNNX05PUF9NQVggc2VlbWVk
IGxpa2UgdGhlIGVhc2llc3Qgd2F5IHRvIGtlZXAgdGhlIGVuZCByZXN1bHQKPmNvbnNpc3RlbnQs
IGlycmVzcGVjdGl2ZSBvZiB0b29sY2hhaW4gc3VwcG9ydC4KCkkgZG9uJ3QgdW5kZXJzdGFuZCAt
IGFuIGVhcmxpZXIgcGF0Y2ggdGFrZXMgY2FyZSBvZiBydW50aW1lIHJlcGxhY2luZyB0aGVtCmFu
eXdheS4gV2hhdCBzdGFsbHMgY2FuIHRoZW4gcmVzdWx0PwoKSmFuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
