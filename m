From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] xen: sched: we never get into
 context_switch() with prev==next
Date: Fri, 26 Apr 2019 17:26:25 +0100
Message-ID: <04305f60-785d-cd21-1de4-9772f5bda198@citrix.com>
References: <155577364571.25746.11988517450711182732.stgit@wayrath>
 <155577388740.25746.3780283868034526234.stgit@wayrath>
 <e877f9f5-ea44-47cd-a974-971768a17735@gmail.com>
 <f136a702e983d174613238619acb2f64bf914fdc.camel@suse.com>
 <b0ab9ed7-135b-6240-a0e8-8200e478b6f8@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ufvn=S4=citrix.com=prvs=01289f4b5=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hK3gE-0006T9-CC
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 16:26:30 +0000
In-Reply-To: <b0ab9ed7-135b-6240-a0e8-8200e478b6f8@arm.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Dario Faggioli <dfaggioli@suse.com>, Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMDQvMjAxOSAxNzoyMiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIERhcmlvLAo+Cj4g
T24gMjYvMDQvMjAxOSAxNjoxMywgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4+IE9uIFR1ZSwgMjAx
OS0wNC0yMyBhdCAxMjoxMyArMDMwMCwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPj4+IEhlbGxvIERh
cmlvLAo+Pj4KPj4+IE9uIDIwLjA0LjE5IDE4OjI0LCBEYXJpbyBGYWdnaW9saSB3cm90ZToKPj4+
PiBJbiBzY2hlZHVsZSgpLCBpZiB3ZSBwaWNrLCBhcyB0aGUgbmV4dCB2Y3B1IHRvIHJ1biAobmV4
dCkgdGhlIHNhbWUKPj4+PiBvbmUKPj4+PiB0aGF0IGlzIHJ1bm5pbmcgYWxyZWFkeSAocHJldiks
IHdlIG5ldmVyIGdldCB0byBjYWxsCj4+Pj4gY29udGV4dF9zd2l0Y2goKS4KPj4+Cj4+PiBBbmQg
d2hhdCBhYm91dCBgaWYgKCBwcmV2ICE9IGN1cnJlbnQgKWAgaW4KPj4+IGFybS9kb21haW4uYzpz
Y2hlZHVsZV90YWlsKCkgPwo+Pj4KPj4gWW91J3JlIHN1Z2dlc3RpbmcgdGhhdCdzIHJlZHVuZGFu
dCB0b28sIGFyZW4ndCB5b3U/Cj4+Cj4+IMKgRnJvbSBhIHF1aWNrIGxvb2ssIGl0IHNlZW1zIHRv
IG1lIGFzIHdlbGwgdGhhdCBpdCB3b3VsZCBiZS4gSSdtIG9rCj4+IHRha2luZyBjYXJlIG9mIGl0
LCBub3Qgc3VyZSBpZiBpbiB0aGlzIHBhdGNoLCBvciBpbiBhbm90aGVyIG9uZS4KPgo+IEkgdGhv
dWdodCBBbmRyZXcgYWxyZWFkeSBxdWV1ZWQgdGhpcyBwYXRjaD8KCkkgZGlkLgoKPgo+IEFueXdh
eSwgSSB0aGluayB5b3UgYXJlIHJpZ2h0LiBXZSBjYW4gZHJvcCB0aGUgY2hlY2sgaW4KPiBzY2hl
ZHVsZV90YWlsKCkgYXMgd2VsbC4KClRoYXQgc2hvdWxkIHJlYWxseSBiZSBhIHNlcGFyYXRlIHBh
dGNoLCBiZWNhdXNlIGl0IGlzIEFSTS1zcGVjaWZpYwpzY2hlZHVsaW5nIGJlaGF2aW91ci7CoCBU
aGUgc2FtZSBpcyBub3QgdHJ1ZSBvbiB4ODYuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
