From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: Scheduling and the periodic timer
Date: Fri, 01 Feb 2019 02:50:40 -0700
Message-ID: <5C5416700200007800213132@prv1-mh.provo.novell.com>
References: <2c71ac06-9d04-475b-30bc-9f87c906391a@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gpVTC-0001CX-CV
 for xen-devel@lists.xenproject.org; Fri, 01 Feb 2019 09:50:46 +0000
In-Reply-To: <2c71ac06-9d04-475b-30bc-9f87c906391a@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjAyLjE5IGF0IDA4OjI2LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBXaGls
ZSB3b3JraW5nIG9uIG15IGNvcmUgc2NoZWR1bGluZyBzZXJpZXMgSSBzdHVtYmxlZCBvdmVyIHRo
ZSBwZXJpb2RpYwo+IHRpbWVyLiBDb3VsZCBpdCBiZSB0aGlzIHRpbWVyIG5ldmVyIHdvcmtlZCBj
b3JyZWN0bHk/Cj4gCj4gV2hlbiB0aGUgdmNwdSB3aXRoIGFuIGFjdGl2ZSBwZXJpb2RpYyB0aW1l
ciBpcyBydW5uaW5nIGV2ZXJ5dGhpbmcgc2VlbXMKPiB0byBiZSBmaW5lLiBCdXQgd2hlbiBub3Qg
cnVubmluZyB0aGUgdGltZXIgaXMgc3RvcHBlZCBpbiBzY2hlZHVsZSgpLiBTbwo+IGEgdmNwdSBn
b2luZyB0byBpZGxlIHJlbHlpbmcgdG8gYmUgd29rZW4gdXAgYnkgdGhlIHBlcmlvZGljIHRpbWVy
IHdpbGwKPiByZW1haW4gc2xlZXBpbmcgdW50aWwgYW5vdGhlciBldmVudCBpcyBoYXBwZW5pbmcu
IFRoZSBwZXJpb2RpYyB0aW1lcgo+IHdvbid0IGZpcmUgYXMgaXQgaXMgc3RvcHBlZC4KPiAKPiBU
aGUgcGVyaW9kaWMgdGltZXIgaXMgdXNlZCB2aWEgVkNQVU9QX3NldF9wZXJpb2RpY190aW1lciBv
bmx5LCBhbmQKPiB0b2RheSdzIExpbnV4IGtlcm5lbCBpc24ndCB1c2luZyBpdCBhdCBhbGwuIFNv
IEkgZ3Vlc3MgdGhpcyB0aW1lciBub3QKPiByZWFsbHkgd29ya2luZyBhcyBpdCBzaG91bGQgaXMg
bm8gYmlnIGlzc3VlLgoKSW50ZXJlc3RpbmcuIE91ciBrZXJuZWxzIGhhdmUgYmVlbiB1c2luZyBp
dCB1bnRpbCBTTEUxMSBTUDEsIGFzCmRpZCB0aGUgb2xkIDIuNi4xOCBvbmUgdGhhdCBhbGwgb2Yg
b3VyIG9sZCBrZXJuZWxzIHdlcmUgZGVyaXZlZApmcm9tLiBZZXQgdGhlIHNhbWUgY29kZSBpcyBw
cmVzZW50IGFscmVhZHkgaW4gMy4yLjAncyBzY2hlZHVsZSgpLgpBcmUgeW91IHN1cmUgdGhpcyB0
aW1lciBpcyBtZWFudCB0byB3YWtlIHRoZSB2Q1BVIGF0IHRoZSBzZXQKcmF0ZSwgcmF0aGVyIHRo
YW4ganVzdCBzdXJmYWNpbmcgZXZlbnRzIGlmIHRoZSB2Q1BVIGlzIHJ1bm5pbmc/Ckxvb2tpbmcg
YXQgdmNwdV9wZXJpb2RpY190aW1lcl93b3JrKCkncyBjYWxjdWxhdGlvbiBvZiB0aGUKbmV4dCBl
dmVudCB0aW1lIGFsc28gc3VnZ2VzdHMgdG8gbWUgdGhhdCB0aGVyZSdzIG5vIGd1YXJhbnRlZQp0
aGF0IHRoZSBldmVudCB3aWxsIGluZGVlZCBzdXJmYWNlIGF0IHRoZSBzZXQgcmF0ZS4KCkphbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
