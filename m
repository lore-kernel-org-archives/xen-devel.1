From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 7/9] libxl: Make killing of device model
 asynchronous
Date: Fri, 30 Nov 2018 16:22:02 +0000
Message-ID: <23553.25514.468001.804047@mariner.uk.xensource.com>
References: <20181123171502.29519-1-george.dunlap@citrix.com>
 <20181123171502.29519-7-george.dunlap@citrix.com>
 <23550.50595.50966.218438@mariner.uk.xensource.com>
 <43308BAB-7F2D-408A-A7AB-5874E00BC093@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3lvp=oj=citrix.com=prvs=865853486=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gSlYP-0006JM-84
 for xen-devel@lists.xenproject.org; Fri, 30 Nov 2018 16:22:09 +0000
In-Reply-To: <43308BAB-7F2D-408A-A7AB-5874E00BC093@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJSZTogW1BBVENIIDcvOV0gbGlieGw6IE1ha2Uga2lsbGlu
ZyBvZiBkZXZpY2UgbW9kZWwgYXN5bmNocm9ub3VzIik6Cj4gT24gTm92IDI4LCAyMDE4LCBhdCA0
OjQzIFBNLCBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4gd3JvdGU6Cj4gPiBD
b252ZXJzZWx5IGl0IHdvdWxkIGJlIG5pY2UgdG8gc2F5IHNvbWV3aGVyZQo+ID4gdGhhdCBkZG1z
LT5jYWxsYmFjayBtYXkgYmUgY2FsbGVkIHJlZW50cmFudGx5Lgo+IAo+IFdoYXQgZG8geW91IG1l
YW4gYnkgcmVlbnRyYW50bHk/ICBUaGF0IGxpYnhsX19kZXN0cm95X2RldmljZV9tb2RlbCgpIG1h
eSBlbmQgdXAgY2FsbGluZyBpdCBkaXJlY3RseSAob24gdGhpcyBleGVjdXRpb24gc3RhY2spLCBy
YXRoZXIgdGhhbiBhcnJhbmdpbmcgZm9yIGl0IHRvIGJlIGNhbGxlZCBieSBzb21lb25lIGVsc2Ug
YWZ0ZXIgcmV0dXJuaW5nPwoKUHJlY2lzZWx5LgoKVGhpcyBraW5kIG9mIGNhbGxiYWNrIGNhbiwg
aW4gc29tZSBzaXR1YXRpb25zLCBiZSBhIGhhemFyZCBmb3IgdGhlCmNhbGxlciwgYmVjYXVzZSBp
dCBtaWdodCByZXN1bHQgaW4gZGF0YSBzdHJ1Y3R1cmVzIHRoYXQgdGhlIGNhbGxlciBpcwphYm91
dCB0byByZWx5IG9uIHZhbmlzaGluZy4KCkl0IGlzIGNvbnZlbnRpb25hbCBpbiBsaWJ4bCB0byBy
ZXR1cm4gYWZ0ZXIgc2V0dGluZyB1cCBjYWxsYmFja3Mgc28KdGhpcyBnZW5lcmFsbHkgZG9lc24n
dCBhcmlzZSwgYnV0IGFkZGluZyBhIG5vdGUgdG8gZnVuY3Rpb25zIHdpdGggdGhpcwpwcm9wZXJ0
eSBpcyBhIGdvb2QgaWRlYS4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
