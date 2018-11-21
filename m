From: Norbert Manthey <nmanthey@amazon.de>
Subject: [faster-by-no-jump-table] retpoline: disable jump tables
Date: Wed, 21 Nov 2018 11:05:57 +0100
Message-ID: <d9dfa6cb-6079-3484-8445-e7e4e8e9eb38@amazon.de>
References: <1542728274-29599-1-git-send-email-nmanthey@amazon.de>
 <5BF42D1B02000078001FE1F7@prv1-mh.provo.novell.com>
 <7495ab30-1621-4f6e-a5ac-fba8ced5d2a6@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3dv+=oa=amazon.de=prvs=856025f91=nmanthey@srs-us1.protection.inumbo.net>)
 id 1gPPOk-000067-2H
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 10:06:18 +0000
In-Reply-To: <7495ab30-1621-4f6e-a5ac-fba8ced5d2a6@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Hongjiu Lu <hongjiu.lu@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMjAvMTggMTc6MzcsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMjAvMTEvMjAxOCAx
NTo0OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDIwLjExLjE4IGF0IDE2OjM3LCA8bm1h
bnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPj4+IFRvIG1pdGlnYXRlIE1lbHRkb3duLCBYZW4gaGFz
IGJlZW4gZml4ZWQgd2l0aCBhIHNvZnR3YXJlIGZpeCwgbmFtZWx5Cj4+PiB1c2luZyByZXRwb2xp
bmUgc2VxdWVuY2VzIGdlbmVyYXRlZCBieSB0aGUgY29tcGlsZXIuIFRoaXMgd2F5LCBpbmRpcmVj
dAo+Pj4gYnJhbmNoZXMgYXJlIHByb3RlY3RlZCBhZ2FpbnN0IHRoZSBhdHRhY2suCj4+IEFjdHVh
bGx5IEkgd2FzIG1lYW5pbmcgdG8gY29tbWl0IHRoaXMgcmlnaHQgYXdheSwgYnV0IHRoZW4gbXkK
Pj4gYXR0ZW50aW9uIHdhcyBkcmF3biBieSB0aGUgbWVudGlvbiBvZiBNZWx0ZG93biBhYm92ZTog
SSB0aGluawo+PiB5b3UgbWVhbiBTcGVjdHJlIHYyIGluc3RlYWQ/IEknZCBsaWtlIHRvIGF2b2lk
IHRoZSBjaGFuZ2UgYmVpbmcKPj4gY29uZnVzaW5nIHRvIHJlYWRlcnMgbGF0ZXIgb24gLi4uCj4g
WWVzIC0ganVtcCB0YWJsZXMgLyByZXRwb2xpbmVzIGFyZSBvbmx5IHJlbGV2YW50IHRvIFNwZWN0
cmUgdjIgLyAiQnJhbmNoCj4gVGFyZ2V0IEluamVjdGlvbiIuCj4KPiBNZWx0ZG93biBpc24ndCBh
cHBsaWNhYmxlIGhlcmUuCj4KPiB+QW5kcmV3CgpZZXMsIEkgbWl4ZWQgdGhlc2UgdHdvIHVwLiBJ
IHNvbWV0aW1lcyBnZXQgY29uZnVzZWQgd2l0aCBhbGwgdGhlCnZhcmlhbnRzIGFuZCBudW1iZXJz
LiBJJ2xsIHNlbmQgYSBzZWNvbmQgdmVyc2lvbiB3aXRoIGFuIHVwZGF0ZWQgY29tbWl0Cm1lc3Nh
Z2UuCgpCZXN0LApOb3JiZXJ0CgoKCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFu
eSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJlcjogQ2hy
aXN0aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJicmljaApVc3QtSUQ6IERFIDI4OSAyMzcgODc5CkVp
bmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIEhSQiAxNDkxNzMgQgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
