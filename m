From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V11 4/5] p2m: Always use hostp2m when
 clipping rangesets
Date: Thu, 20 Dec 2018 17:14:35 +0200
Message-ID: <6e9d24c0-92d0-43be-d490-f3ccaba7e8be@bitdefender.com>
References: <1544001488-23763-1-git-send-email-rcojocaru@bitdefender.com>
 <1544001488-23763-5-git-send-email-rcojocaru@bitdefender.com>
 <5C07FD4302000078002033AF@prv1-mh.provo.novell.com>
 <5e22ea77-26f9-be55-c30f-8a598cd35218@bitdefender.com>
 <5C1237EF0200007800205C8F@prv1-mh.provo.novell.com>
 <f3da63c2-ec2d-e7fb-468b-3faf8cf9c67b@citrix.com>
 <5C1B50D60200007800207E4D@prv1-mh.provo.novell.com>
 <efa718ea-8fdc-0803-704f-5628c3b3a10e@citrix.com>
 <5C1B9E8402000078002080F4@prv1-mh.provo.novell.com>
 <49204ce7-bb5f-2aad-a2b8-a2219db89260@citrix.com>
 <5C1BAC170200007800208176@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iE3c=O5=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1ga028-00075z-76
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 15:14:44 +0000
In-Reply-To: <5C1BAC170200007800208176@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, George Dunlap <George.Dunlap@eu.citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, george.dunlap@citrix.com, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMjAvMTggNDo0OSBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjAuMTIuMTgg
YXQgMTU6MzgsIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+PiBDYW4gd2UganVz
dCBmb3Igbm93IHRha2UgdGhlIHRleHQgYXMgSSBwcm9wb3NlZCBpdD8gIFlvdSBjYW4gYXJndWUg
YWJvdXQKPj4gdGhlIHJpZ2h0IHRoaW5nIHRvIGRvIHdoZW4gd2UgZG8gdGhlIGFsbGVnZWQgY2xl
YW4tdXAuCj4gCj4gV2l0aCB0aGUgIldlIHNob3VsZCBwcm9iYWJseSByZXR1cm4gYW4gZXJyb3Ig
Li4uIiBwYXJ0IGRyb3BwZWQKPiBvciByZXBsYWNlZCBieSBlLmcuICJXZSBzaG91bGQgcmV2aXNp
dCB0aGlzIiB0aGlzIHdvdWxkIGJlIG9rYXkKPiB3aXRoIG1lLiBCdXQgeW91J3JlIHRoZSBtYWlu
dGFpbmVyIG9mIHRoZSBjb2RlIGFueXdheS4uLgoKSXMgdGhlIGNoYW5nZSBzb21ldGhpbmcgdGhh
dCBjYW4gYmUgZG9uZSBvbiBjb21taXQgKGlmIHRoZXJlIGFyZSBubwpvdGhlciBvYmplY3Rpb25z
IG9mIGNvdXJzZSksIG9yIHNob3VsZCBJIHJlLXN1Ym1pdCB0aGUgc2VyaWVzIHdpdGggdGhlCmNv
bW1lbnQgY2hhbmdlZD8KCgpUaGFua3MsClJhenZhbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
