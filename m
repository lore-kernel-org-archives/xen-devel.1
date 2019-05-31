From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 2/2] x86/emulate: Send vm_event from
 emulate
Date: Fri, 31 May 2019 03:16:27 -0600
Message-ID: <5CF0F0EB0200007800233D64@prv1-mh.provo.novell.com>
References: <20190520125454.14805-1-aisaila@bitdefender.com>
 <20190520125454.14805-2-aisaila@bitdefender.com>
 <5CE51CBD0200007800231438@prv1-mh.provo.novell.com>
 <b6f3254b-2bce-ecd6-cddb-10131f075fb6@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hWdeM-0001Ke-Lh
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 09:16:34 +0000
In-Reply-To: <b6f3254b-2bce-ecd6-cddb-10131f075fb6@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjA1LjE5IGF0IDEwOjU5LCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+PiAgCj4+PiArICAgICAgICByZXR1cm4gZmFsc2U7Cj4+PiArCj4+PiArICAgIHJjID0gaHZt
ZW11bF9saW5lYXJfdG9fcGh5cyhnbGEsICZncGEsIGJ5dGVzLCAmcmVwcywgcGZlYywgJmN0eHQp
Owo+PiAKPj4gQXMgc2FpZCBiZWZvcmUgLSBJIGRvbid0IHRoaW5rIGl0J3MgYSBnb29kIGlkZWEg
dG8gZG8gdGhlIHBhZ2Ugd2Fsawo+PiB0d2ljZTogVGhpcyBhbmQgdGhlIHByZS1leGlzdGluZyBv
bmUgY2FuIGVhc2lseSByZXR1cm4gZGlmZmVyZW50Cj4+IHJlc3VsdHMuCj4gCj4gV2hhdCBwcmVl
eGlzdGluZyBwYWdlIHdhbGsgYXJlIHlvdSB0YWxraW5nIGFib3V0IGhlcmU/CgpXZWxsLCBJJ20g
YWZyYWlkIEkgZG9uJ3Qga25vdyB3aGF0IHRvIHNheSAoaW4gYSBwb2xpdGUgd2F5KS4gSSdtIHN1
cmUKeW91J3JlIHVuZGVyc3RhbmRpbmcgdGhlIGNvZGUgeW91IHRyeSB0byBhZGQgdG8sIHNvIGl0
IHdvdWxkIHNlZW0KbmF0dXJhbCB0byBtZSB0aGF0IHlvdSBjYW4gYW5zd2VyIHRoaXMgcXVlc3Rp
b24gYWxsIGJ5IHlvdXJzZWxmOgpTaW5jZSB5b3UgZG9uJ3QgcmVtb3ZlIGFueSBsaW5lYXItPnBo
eXMgdHJhbnNsYXRpb25zIGluIHlvdXIgcGF0Y2gsCmFuZCBzaW5jZSB0aGVyZSBuZWNlc3Nhcmls
eSBpcyBvbmUgcHJpb3IgdG8geW91ciBwYXRjaCwgeW91IGFkZGluZwooYW5vdGhlcikgb25lIG1l
YW5zIHRoZXJlIGFyZSBub3cgdHdvIG9mIHRoZW0uCgpTbyB0byBhbnN3ZXIgeW91ciBxdWVzdGlv
biBkaXJlY3RseTogaHZtZW11bF9tYXBfbGluZWFyX2FkZHIoKQpjYWxscyBodm1fdHJhbnNsYXRl
X2dldF9wYWdlKCksIGFuZCBodm1lbXVsX2luc25fZmV0Y2goKSAtPgpfX2h2bWVtdWxfcmVhZCgp
IC0+IGxpbmVhcl9yZWFkKCkgLT4gaHZtX2NvcHlfZnJvbV9ndWVzdF9saW5lYXIoKQotPiBfX2h2
bV9jb3B5KCkgY2FsbHMgaHZtX3RyYW5zbGF0ZV9nZXRfcGFnZSgpIGFzIHdlbGwuCgpBcyBhbiBh
c2lkZSAtIHdoaWxlIEknbSBhZHZvY2F0aW5nIHRoZSBzdHJpcHBpbmcgb2YgcmVwbHkgcXVvdGlu
ZyB0aGF0J3MKbm90IG5lZWRlZCBhcyBjb250ZXh0LCB5b3Ugc3VyZWx5IHdlbnQgdG9vIGZhciBo
ZXJlOiBZb3UndmUgbGVmdCBpbgpwbGFjZSBuZWl0aGVyIGFuIGluZGljYXRpb24gd2hlbiB0aGUg
bWFpbHMgd2VyZSBzZW50IGNvbnRleHQgb2Ygd2hpY2gKaXMgc3RpbGwgcHJlc2VudCBhYm92ZSwg
bm9yIGVub3VnaCBjb250ZXh0IHRvIHJlLWNvbnN0cnVjdCB3aGF0CmZ1bmN0aW9uIHlvdXIgYWRk
aXRpb25zIGdvIGludG8uIElPVyBJIGhhZCB0byBzZWFyY2ggdGhlIGVhcmxpZXIgcGFydHMKb2Yg
dGhpcyB0aHJlYWQgdG8gZ2F0aGVyIGVub3VnaCBjb250ZXh0IHRvIGFjdHVhbGx5IGJlIGFibGUg
dG8gcmVwbHkuCgo+IEkgZG9uJ3QgdGhpbmsgCj4gdGhlcmUgaXMgYSB3YXkgdG8gZ2V0IHRoZSBn
cGEgYnkgcGFzc2luZyBpdCBmcm9tIHNvbWV3aGVyZS4KClBvc3NpYmx5LCBidXQgdGhhdCdzIGFs
c28gbm90IHdoYXQgSSBkaWQgc3VnZ2VzdC4gSW5zdGVhZCB3aGF0IEkKdGhpbmsgeW91IG5lZWQg
dG8gbG9vayBpbnRvIGlzIGhvdyB0byByZXN0cnVjdHVyZSB0aGluZ3MsIHBlcmhhcHMKanVzdCBh
cyB0byB0aGUgcGxhY2Ugd2hlcmUgeW91IGluc2VydCB5b3VyIG5ldyBjb2RlLgoKSmFuCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
