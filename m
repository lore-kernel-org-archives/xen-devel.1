From: "Jan Beulich" <JBeulich@suse.com>
Subject: Ping: [PATCH v2] x86emul: avoid speculative out of
 bounds accesses
Date: Wed, 03 Apr 2019 02:46:07 -0600
Message-ID: <5CA472CF0200007800224252@prv1-mh.provo.novell.com>
References: <FCC26D720200001BB4B78B26@prv1-mh.provo.novell.com>
 <5C53056B0200007800212C9B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=57ha=SF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hBbXD-0000K5-0L
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2019 08:46:15 +0000
In-Reply-To: <5C53056B0200007800212C9B@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, nmanthey@amazon.de, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjAyLjE5IGF0IDEyOjQyLCAgd3JvdGU6Cj4gVGhlcmUgYXJlIGEgZmV3IGFycmF5
IGFjY2Vzc2VzIGhlcmUgdGhlIGluZGV4ZXMgb2Ygd2hpY2ggYXJlIChhdCBsZWFzdAo+IGluZGly
ZWN0bHkpIGRyaXZlbiBieSB0aGUgZ3Vlc3QuIFVzZSBhcnJheV9hY2Nlc3Nfbm9zcGVjKCkgdG8g
Ym91bmQKPiBzdWNoIGFjY2Vzc2VzLiBJbiB0aGUgeyxffWRlY29kZV9ncHIoKSBjYXNlcyByZXBs
YWNlIGV4aXN0aW5nIGd1YXJkaW5nCj4gY29uc3RydWN0cy4KPiAKPiBUbyBkZWFsIHdpdGggYW4g
b3RoZXJ3aXNlIG9jY3VycmluZyAjaW5jbHVkZSBjeWNsZSwgZHJvcCB0aGUgaW5jbHVzaW9uCj4g
b2YgYXNtL3g4Nl9lbXVsYXRlLmggZnJvbSBhc20vcHJvY2Vzc29yLmguIFRoaXMgaW5jbHVkZSBo
YWQgYmVlbgo+IGludHJvZHVjZWQgZm9yIG9idGFpbmluZyB0aGUgc3RydWN0IGNwdWlkX2xlYWYg
ZGVjbGFyYXRpb24sIHdoaWNoIGhhcwo+IHNpbmNlIG1vdmVkIGludG8gdGhlIHg4NiBoZWxwZXIg
bGlicmFyeS4KPiAKPiBUaGlzIGlzIHBhcnQgb2YgdGhlIHNwZWN1bGF0aXZlIGhhcmRlbmluZyBl
ZmZvcnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pgo+IC0tLQo+IHYyOiBJbnN0ZWFkIG9mIGFsdGVyaW5nIHRoZSBjb2RlIGluIHssX31kZWNvZGVf
Z3ByKCkgc2ltcGx5IGFsdGVyIHRoZQo+ICAgICBjb21tZW50LgoKVGhpcyBpcyBhbHNvIG1lYW50
IHRvIGJlIGEgcGluZyBmb3IgdGhlIDMgb3RoZXIgcGF0Y2hlcyB2MSBvZiB0aGlzCndhcyBzZW50
IHdpdGggaW4gYSBzZXJpZXMuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
