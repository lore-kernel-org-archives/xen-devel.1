From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86: fix paging_log_dirty_op to work with
 paging guests
Date: Fri, 14 Dec 2018 03:45:21 -0700
Message-ID: <5C1389C102000078002061C6@prv1-mh.provo.novell.com>
References: <20181212145438.47175-1-roger.pau@citrix.com>
 <5C11323202000078002058EF@prv1-mh.provo.novell.com>
 <20181213113944.7wvomlbry7toziia@mac>
 <5C1255E70200007800205D20@prv1-mh.provo.novell.com>
 <20181213141406.ue2epvsgd25wmtlg@mac>
 <5C1272200200007800205E78@prv1-mh.provo.novell.com>
 <20181213153423.in2kdsy7jppvy4tq@mac>
 <5C1280720200007800205EF7@prv1-mh.provo.novell.com>
 <20181214100328.55k45mpmoroe4ntz@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Rd17=OX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gXkyD-0001xr-Ni
 for xen-devel@lists.xenproject.org; Fri, 14 Dec 2018 10:45:25 +0000
In-Reply-To: <20181214100328.55k45mpmoroe4ntz@mac>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjEyLjE4IGF0IDExOjAzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEkgZXhwZWN0IHRoZSBpbnRlcmRvbWFpbiBsb2NraW5nIGFzIGEgcmVzdWx0IG9mIHVzaW5nIGEg
cGFnaW5nIGNhbGxlcgo+IGRvbWFpbiBpcyBnb2luZyB0byBiZSByZXN0cmljdGVkIHRvIHRoZSBw
Mm0gbG9jayBvZiB0aGUgY2FsbGVyIGRvbWFpbiwKPiBhcyBhIHJlc3VsdCBvZiB0aGUgdXNhZ2Ug
b2YgY29weSB0by9mcm9tIGhlbHBlcnMuCj4gCj4gTWF5YmUgdGhlIGxlc3MgaW50cnVzaXZlIGNo
YW5nZSB3b3VsZCBiZSB0byBqdXN0IGFsbG93IGxvY2tpbmcgdGhlCj4gY2FsbGVyIHAybSBsb2Nr
ICh0aGF0IG9ubHkgbG9jaykgcmVnYXJkbGVzcyBvZiB0aGUgc3ViamVjdCBkb21haW4gbG9jawo+
IGxldmVsPwoKV2l0aCBjYWxsZXIgIT0gc3ViamVjdCwgYW5kIHdpdGggdGhlIGxvY2sgbGV2ZWwg
dGhlbiBiZWluZyBoaWdoZXIKdGhhbiBhbGwgIm5vcm1hbCIgb25lcywgdGhpcyBtaWdodCBiZSBh
biBvcHRpb24uIEJ1dCBmcm9tIHRoZQp2ZXJ5IGJlZ2lubmluZyB3ZSBzaG91bGQga2VlcCB0aGUg
dHJhbnNpdGl2ZSBhc3BlY3QgaGVyZSBpbgptaW5kOiBJZiBEb20wIGNvbnRyb2xzIGEgUFZIIGRv
bWFpbiB3aGljaCBjb250cm9scyBhIEhWTSBvbmUsCnRoZSBEb20wIHAybSBsb2NrIG1heSBhbHNv
IG5lZWQgYWxsb3dpbmcgdG8gbmVzdCBpbnNpZGUgdGhlIFBWSApEb21VJ3Mgb25lLCBzbyBpdCds
bCBiZSBhIHRvdGFsIG9mIHR3byBleHRyYSBuZXcgbG9jayBsZXZlbHMgZXZlbgppZiB3ZSByZXN0
cmljdCB0aGlzIHRvIHRoZSBwMm0gbG9ja3MuCgpGdXJ0aGVybW9yZSwgaWYgd2UgbGltaXRlZCB0
aGlzIHRvIHRoZSBwMm0gbG9ja3MsIGl0IHdvdWxkIGJlY29tZQppbGxlZ2FsIHRvIG9idGFpbiBh
bnkgb2YgdGhlIGhpZ2hlciBsb2NrIGxldmVsIGxvY2tzIChpLmUuIG9uZXMgdGhhdApuZXN0IGlu
c2lkZSB0aGUgcDJtIGxvY2spIGZvciB0aGUgY2FsbGVyIGRvbWFpbi4gSSdtIG5vdCBzdXJlCnRo
YXQncyBhIGdvb2QgaWRlYS4gQXMgbWVudGlvbmVkIGJlZm9yZSwgaWYgY2FsbGVyIGxvY2tzIGNv
bGxlY3RpdmVseQphbGwgZ2V0IG9idGFpbmVkIGluc2lkZSBhbnkgc3ViamVjdCBkb21haW4gb25l
cywgYXBwbHlpbmcgYSBiaWFzCnRvIGFsbCBsb2NrIGxldmVscyB3b3VsZCBwZXJoYXBzIGJlIHBy
ZWZlcmFibGUuIFRoZSBxdWVzdGlvbiBpcwp3aGV0aGVyIHRoaXMgY3JpdGVyaWEgaG9sZHMuCgpJ
IGFsc28gYXMgb2YgeWV0IGNhbid0IHNlZSBob3cgdGhpcyBjb3VsZCBiZSBleHByZXNzZWQKdHJh
bnNwYXJlbnRseSB0byBleGlzdGluZyBjb2RlLiBZZXQgb2J2aW91c2x5IGhhdmluZyB0byBjaGFu
Z2UKdmFyaW91cyBwMm1fbG9jaygpIGludm9jYXRpb25zIHdvdWxkIGJlIHJhdGhlciB1bmRlc2ly
YWJsZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
