From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [faster-by-no-jump-table] retpoline: disable jump
 tables
Date: Wed, 21 Nov 2018 10:07:21 +0000
Message-ID: <c1385f51-a64c-1c5b-f791-03b811c8d224@citrix.com>
References: <1542728274-29599-1-git-send-email-nmanthey@amazon.de>
 <5BF42D1B02000078001FE1F7@prv1-mh.provo.novell.com>
 <7495ab30-1621-4f6e-a5ac-fba8ced5d2a6@citrix.com>
 <d9dfa6cb-6079-3484-8445-e7e4e8e9eb38@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2odm=oa=citrix.com=prvs=856d69d10=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gPPPq-0000AW-4R
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 10:07:26 +0000
In-Reply-To: <d9dfa6cb-6079-3484-8445-e7e4e8e9eb38@amazon.de>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Norbert Manthey <nmanthey@amazon.de>, Jan Beulich <JBeulich@suse.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Hongjiu Lu <hongjiu.lu@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjEvMTEvMjAxOCAxMDowNSwgTm9yYmVydCBNYW50aGV5IHdyb3RlOgo+IE9uIDExLzIwLzE4
IDE3OjM3LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAyMC8xMS8yMDE4IDE1OjQ5LCBKYW4g
QmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDIwLjExLjE4IGF0IDE2OjM3LCA8bm1hbnRoZXlAYW1h
em9uLmRlPiB3cm90ZToKPj4+PiBUbyBtaXRpZ2F0ZSBNZWx0ZG93biwgWGVuIGhhcyBiZWVuIGZp
eGVkIHdpdGggYSBzb2Z0d2FyZSBmaXgsIG5hbWVseQo+Pj4+IHVzaW5nIHJldHBvbGluZSBzZXF1
ZW5jZXMgZ2VuZXJhdGVkIGJ5IHRoZSBjb21waWxlci4gVGhpcyB3YXksIGluZGlyZWN0Cj4+Pj4g
YnJhbmNoZXMgYXJlIHByb3RlY3RlZCBhZ2FpbnN0IHRoZSBhdHRhY2suCj4+PiBBY3R1YWxseSBJ
IHdhcyBtZWFuaW5nIHRvIGNvbW1pdCB0aGlzIHJpZ2h0IGF3YXksIGJ1dCB0aGVuIG15Cj4+PiBh
dHRlbnRpb24gd2FzIGRyYXduIGJ5IHRoZSBtZW50aW9uIG9mIE1lbHRkb3duIGFib3ZlOiBJIHRo
aW5rCj4+PiB5b3UgbWVhbiBTcGVjdHJlIHYyIGluc3RlYWQ/IEknZCBsaWtlIHRvIGF2b2lkIHRo
ZSBjaGFuZ2UgYmVpbmcKPj4+IGNvbmZ1c2luZyB0byByZWFkZXJzIGxhdGVyIG9uIC4uLgo+PiBZ
ZXMgLSBqdW1wIHRhYmxlcyAvIHJldHBvbGluZXMgYXJlIG9ubHkgcmVsZXZhbnQgdG8gU3BlY3Ry
ZSB2MiAvICJCcmFuY2gKPj4gVGFyZ2V0IEluamVjdGlvbiIuCj4+Cj4+IE1lbHRkb3duIGlzbid0
IGFwcGxpY2FibGUgaGVyZS4KPj4KPj4gfkFuZHJldwo+IFllcywgSSBtaXhlZCB0aGVzZSB0d28g
dXAuIEkgc29tZXRpbWVzIGdldCBjb25mdXNlZCB3aXRoIGFsbCB0aGUKPiB2YXJpYW50cyBhbmQg
bnVtYmVycy4gSSdsbCBzZW5kIGEgc2Vjb25kIHZlcnNpb24gd2l0aCBhbiB1cGRhdGVkIGNvbW1p
dAo+IG1lc3NhZ2UuCgpObyBuZWVkLsKgIEphbiBmaXhlZCBpdCB1cCBvbiBjb21taXQuCgp+QW5k
cmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
