From: Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v9 1/9] x86/xpti: avoid copying L4 page
 table contents when possible
Date: Thu, 26 Apr 2018 15:01:09 +0100
Message-ID: <20180426140109.GA12602@deinos.phlegethon.org>
References: <20180426113318.21838-1-jgross@suse.com>
 <20180426113318.21838-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=bmqy=hp=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1fBhSY-0006B4-Rc
 for xen-devel@lists.xenproject.org; Thu, 26 Apr 2018 14:01:18 +0000
Content-Disposition: inline
In-Reply-To: <20180426113318.21838-2-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, jbeulich@suse.com, andrew.cooper3@citrix.com
List-Id: xen-devel@lists.xenproject.org

SGksCgpBdCAxMzozMyArMDIwMCBvbiAyNiBBcHIgKDE1MjQ3NDk1OTApLCBKdWVyZ2VuIEdyb3Nz
IHdyb3RlOgo+IEZvciBtaXRpZ2F0aW9uIG9mIE1lbHRkb3duIHRoZSBjdXJyZW50IEw0IHBhZ2Ug
dGFibGUgaXMgY29waWVkIHRvIHRoZQo+IGNwdSBsb2NhbCByb290IHBhZ2UgdGFibGUgZWFjaCB0
aW1lIGEgNjQgYml0IHB2IGd1ZXN0IGlzIGVudGVyZWQuCj4gCj4gQ29weWluZyBjYW4gYmUgYXZv
aWRlZCBpbiBjYXNlcyB3aGVyZSB0aGUgZ3Vlc3QgTDQgcGFnZSB0YWJsZSBoYXNuJ3QKPiBiZWVu
IG1vZGlmaWVkIHdoaWxlIHJ1bm5pbmcgdGhlIGh5cGVydmlzb3IsIGUuZy4gd2hlbiBoYW5kbGlu
Zwo+IGludGVycnVwdHMgb3IgYW55IGh5cGVyY2FsbCBub3QgbW9kaWZ5aW5nIHRoZSBMNCBwYWdl
IHRhYmxlIG9yICVjcjMuCj4gCj4gU28gYWRkIGEgcGVyLWNwdSBmbGFnIGluZGljYXRpbmcgd2hl
dGhlciB0aGUgY29weWluZyBzaG91bGQgYmUKPiBwZXJmb3JtZWQgYW5kIHNldCB0aGF0IGZsYWcg
b25seSB3aGVuIGxvYWRpbmcgYSBuZXcgJWNyMyBvciBtb2RpZnlpbmcKPiB0aGUgTDQgcGFnZSB0
YWJsZS4gIFRoaXMgaW5jbHVkZXMgc3luY2hyb25pemF0aW9uIG9mIHRoZSBjcHUgbG9jYWwKPiBy
b290IHBhZ2UgdGFibGUgd2l0aCBvdGhlciBjcHVzLCBzbyBhZGQgYSBzcGVjaWFsIHN5bmNocm9u
aXphdGlvbiBmbGFnCj4gZm9yIHRoYXQgY2FzZS4KPiAKPiBBIHNpbXBsZSBwZXJmb3JtYW5jZSBj
aGVjayAoY29tcGlsaW5nIHRoZSBoeXBlcnZpc29yIHZpYSAibWFrZSAtaiA0IikKPiBpbiBkb20w
IHdpdGggNCB2Y3B1cyBzaG93cyBhIHNpZ25pZmljYW50IGltcHJvdmVtZW50Ogo+IAo+IC0gcmVh
bCB0aW1lIGRyb3BzIGZyb20gMTEyIHNlY29uZHMgdG8gMTAzIHNlY29uZHMKPiAtIHN5c3RlbSB0
aW1lIGRyb3BzIGZyb20gMTQyIHNlY29uZHMgdG8gMTMxIHNlY29uZHMKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkFja2VkLWJ5OiBUaW0gRGVlZ2FuIDx0aW1AeGVu
Lm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
