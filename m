From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v2 01/12] x86: cleanup processor.h
Date: Mon, 22 Jan 2018 07:32:08 -0700
Message-ID: <5A6603F802000078001A1250@prv-mh.provo.novell.com>
References: <20180122123256.1431-1-jgross@suse.com>
 <20180122123256.1431-2-jgross@suse.com>
 <5A65ECA502000078001A111C@suse.com>
 <4a487401-e5f3-2012-dfdc-2866fc4a8249@suse.com>
 <fcfa6b76-9358-f099-26e9-ecc5ccf9f07e@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=cwx6=er=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1edd8v-0003q7-KV
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2018 14:32:13 +0000
In-Reply-To: <fcfa6b76-9358-f099-26e9-ecc5ccf9f07e@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
Cc: wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, ian.jackson@eu.citrix.com, Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjAxLjE4IGF0IDE1OjI1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjIvMDEvMTggMTQ6MTAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDIyLzAx
LzE4IDEzOjUyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDIyLjAxLjE4IGF0IDEzOjMy
LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+PiBSZW1vdmUgTlNDL0N5cml4IENQVSBtYWNy
b3MgYW5kIGN1cnJlbnRfdGV4dF9hZGRyKCkgd2hpY2ggYXJlIHVzZWQKPj4+PiBub3doZXJlLgo+
Pj4gSSBhZ3JlZSBkb2luZyB0aGUgZm9ybWVyLCBidXQgSSBoYXZlIGEgdmFndWUgcmVjb2xsZWN0
aW9uIHRoYXQgd2UndmUKPj4+IGxlZnQgdGhlIGxhdHRlciBpbiBwbGFjZSBkZXNwaXRlIHRoZXJl
IG5vdCBiZWluZyBhbnkgY2FsbGVycyBhdCBwcmVzZW50Lgo+PiBJdCBpc24ndCBhcyBpZiBjdXJy
ZW50X3RleHRfYWRkcigpIHdvdWxkIGJlIHJvY2tldCBzY2llbmNlLiBJJ20gcXVpdGUKPj4gc3Vy
ZSBpbiBjYXNlIGl0IGlzIG5lZWRlZCB0aGVyZSB3aWxsIGJlIGVub3VnaCBicmFpbiBwb3dlciBh
dmFpbGFibGUgdG8KPj4gYnVpbGQgaXQgZWl0aGVyIGZyb20gc2NyYXRjaCBhZ2FpbiBvciB0byBm
aW5kIGl0IGluIGdpdC4KPj4KPj4gSW4gY2FzZSB5b3UgcmVhbGx5IGxpa2UgaXQgdG8gc3RheSBJ
IHdvbid0IG9iamVjdCwgb2YgY291cnNlLgo+IAo+IEZXSVcsIEkndmUgZGlzbGlrZWQgYWxsIHRo
ZSByZWNlbnQgcGF0Y2hlcyB3aGljaCBoYXZlIHRyaWVkIHRvIHVzZQo+IGN1cnJlbnRfdGV4dF9h
ZGRyKCksIGFuZCBJIGRvbid0IHNlZSBpdCBhcyBhIHVzZWZ1bCBkZWJ1Z2dpbmcgdXRpbGl0eQo+
IGVpdGhlci4KPiAKPiBJIHdvdWxkIHByZWZlciB0byBzZWUgaXQgZ29uZSB0aGFuIHRvIHN0YXku
CgpXZWxsLCBva2F5IHRoZW4uIFRoZSBwYXRjaCBpcyBpbmRlcGVuZGVudCBvZiB0aGUgb3RoZXIs
IGFjdHVhbApSRkMgc3R1ZmYsIHNvIGNvdWxkIGdvIGluIHJpZ2h0IGF3YXkuCgpKYW4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
