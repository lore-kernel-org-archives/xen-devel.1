From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 7/7] npt/shadow: allow getting foreign
 page table entries
Date: Thu, 14 Feb 2019 04:38:54 -0700
Message-ID: <5C65534E0200007800216A5C@prv1-mh.provo.novell.com>
References: <20190211174642.38046-1-roger.pau@citrix.com>
 <20190211174642.38046-8-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1guFM4-0002md-Fv
 for xen-devel@lists.xenproject.org; Thu, 14 Feb 2019 11:39:00 +0000
In-Reply-To: <20190211174642.38046-8-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjAyLjE5IGF0IDE4OjQ2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0tcHQuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9w
Mm0tcHQuYwo+IEBAIC04NjUsNyArODY1LDggQEAgcG9kX3JldHJ5X2wxOgo+ICAgICAgdW5tYXBf
ZG9tYWluX3BhZ2UobDFlKTsKPiAgCj4gICAgICBBU1NFUlQobWZuX3ZhbGlkKG1mbikgfHwgIXAy
bV9pc19yYW0oKnQpIHx8IHAybV9pc19wYWdpbmcoKnQpKTsKPiAtICAgIHJldHVybiAocDJtX2lz
X3ZhbGlkKCp0KSB8fCBwMm1faXNfZ3JhbnQoKnQpKSA/IG1mbiA6IElOVkFMSURfTUZOOwo+ICsg
ICAgcmV0dXJuIChwMm1faXNfdmFsaWQoKnQpIHx8IHAybV9pc19ncmFudCgqdCkgfHwgcDJtX2lz
X2ZvcmVpZ24oKnQpKQo+ICsgICAgICAgICAgID8gbWZuIDogSU5WQUxJRF9NRk47Cj4gIH0KCldv
dWxkbid0IHlvdSBiZXR0ZXIgYWx0ZXIgdGhlIEFTU0VSVCgpIGFzIHdlbGwsIHVzaW5nIHAybV9p
c19hbnlfcmFtKCkKaW5zdGVhZCBvZiBwMm1faXNfcmFtKCkgbm93PyBHcmFudHMgc2hvdWxkIGhh
dmUgYmVlbiBpbmNsdWRlZCB0aGVyZQpiZWZvcmUsIGJ1dCBvbWl0dGluZyBmb3JlaWduIG9uZXMg
dGhlcmUgYmVmb3JlIHdhcyBiZW5pZ24uCgpJIGFsc28gaGF2ZSBhbiB1bnJlbGF0ZWQgcXVlc3Rp
b24gaGVyZSwgcGVyaGFwcyBtb3JlIGZvciBHZW9yZ2U6CnAybV9pc192YWxpZCgpIGluY2x1ZGVz
IHAybV9tbWlvX2RtLiBUaGVyZSBhcmUgbm8gdmFsaWQgTUZOcwphc3NvY2lhdGVkIHdpdGggdGhh
dCB0eXBlIGlpcmMuIFRoZSBNRk4gdGFrZW4gb3V0IG9mIHRoZSBQMk0gZW50cnksCmhvd2V2ZXIs
IGNhbid0IHBvc3NpYmx5IGJlIElOVkFMSURfTUZOIChkdWUgdG8gYml0IHdpZHRoCmNvbnN0cmFp
bnRzKS4gSXQgd291bGQgc2VlbSBiZXR0ZXIgdG8gbWUgdGhvdWdoIHRvIHJldHVybgpJTlZBTElE
X01GTiBmb3IgdGhhdCB0eXBlLiAoVGhpcyB3b3VsZCB0aGVuIGFsc28gYXBwbHkgdG8gdGhlIDJN
CmFuZCAxRyBjYXNlcywgd2hpY2ggaGF2ZSBzZXBhcmF0ZSByZXR1cm4gcGF0aHMuKQoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
