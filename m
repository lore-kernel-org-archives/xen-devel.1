From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v8] arch/x86: Add registers to vm_event
Date: Thu, 8 Nov 2018 20:46:12 +0200
Message-ID: <b8249ae6-6da8-c512-383f-dbecf6ae3e01@bitdefender.com>
References: <20181105095354.9082-1-aisaila@bitdefender.com>
 <CABfawh=8mksd3_ZO0i=0q44VGoyRj2pHOudczYTfzdH7brZnoQ@mail.gmail.com>
 <a0028d6c-27f6-5e39-c19b-39da0474e276@bitdefender.com>
 <20181108155359.6ihkpw2pd6m7edki@zion.uk.xensource.com>
 <be9410dd-ddd1-db1d-1166-df096c739d1d@bitdefender.com>
 <20181108172201.lzdlkl6wir3b7ypa@zion.uk.xensource.com>
 <af75d830-5a6f-f514-1eca-adce268964fd@bitdefender.com>
 <20181108180231.53r2exdgeepiy56t@zion.uk.xensource.com>
 <4bf400ee-9c3e-a9ac-5a12-149ad5c6e8db@bitdefender.com>
 <20181108182754.4wl7iyfqxvypmazq@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=6g0g=nt=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gKpK4-00042p-BA
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 18:46:32 +0000
In-Reply-To: <20181108182754.4wl7iyfqxvypmazq@zion.uk.xensource.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Alexandru Isaila <aisaila@bitdefender.com>, Xen-devel <xen-devel@lists.xenproject.org>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvOC8xOCA4OjI3IFBNLCBXZWkgTGl1IHdyb3RlOgo+IE9uIFRodSwgTm92IDA4LCAyMDE4
IGF0IDA4OjIyOjA2UE0gKzAyMDAsIFJhenZhbiBDb2pvY2FydSB3cm90ZToKPj4gT24gMTEvOC8x
OCA4OjAyIFBNLCBXZWkgTGl1IHdyb3RlOgo+Pj4gU3BlYWtpbmcgb2YgYnVpbGQgYnJlYWthZ2U6
IHdvdWxkIHlvdSBndXlzIGNvbnNpZGVyIHNpZ25pbmcgdXAgdG8gZ2l0bGFiCj4+PiBzbyB0aGF0
IHlvdSBjYW4gdXNlIGFsbCB0aGUgYnVpbGQgdGVzdCBpbmZyYXN0cnVjdHVyZSB0aGVyZSBiZWZv
cmUKPj4+IHN1Ym1pc3Npb24/IEl0IHdvdWxkIHByb2JhYmx5IHNheSB5b3UgZnJvbSBidWlsZGlu
ZyBsb2NhbCBmb3IgZGlmZmVyZW50Cj4+PiBkaXN0cm9zIGFuZCBjb25maWdzLgo+Pj4KPj4+IFNl
ZSBodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QveGVuL3BpcGVsaW5lcy8zNTkxODUxMAo+
Pgo+PiBZZXMsIHRoYXQgZG9lcyBzb3VuZCB2ZXJ5IGludGVyZXN0aW5nLiBJJ20gbm90IHN1cmUg
d2hhdCB0aGF0IGVudGFpbHMgLwo+PiB3aGF0IHRoZSBwcm9jZWR1cmUgaXMgdGhvdWdoLiBDb3Vs
ZCB5b3UgcGxlYXNlIHRlbGwgdXMgbW9yZT8KPiAKPiBUaGUgb25lIEkgc2hvd2VkIHlvdSBpcyB0
aGUgdG9wLWxldmVsIHBpcGVsaW5lLiBUaGVyZSBhcmUgcGVyLWFjY291bnQKPiBwaXBlbGluZXMg
YXMgd2VsbC4KPiAKPiBUbyB1c2UgdGhhdDoKPiAKPiAxLiBSZWdpc3RlciBhIEdpdGxhYi5jb20g
YWNjb3VudAo+IDIuIFRlbGwgbWUgeW91ciBoYW5kbGUocyksIEkgd2lsbCBtYWtlIHlvdSBtZW1i
ZXIgb2YgdGhlIHhlbi1wcm9qZWN0IG9yZwo+IDMuIENyZWF0ZSB5b3VyIG93biBzdWJncm91cCB1
bmRlciBwZW9wbGUvCj4gNC4gRm9yayB4ZW4uZ2l0IGZyb20geGVuLXByb2plY3QgdG9wLWxldmVs
IHJlcG9zaXRvcnkgaW50byB5b3VyIHN1Ymdyb3VwCj4gNS4gUHVzaCB5b3VyIGJyYW5jaCB0byB5
b3VyIHJlcG9zaXRvcnkKPiA2LiBGb3VuZCB0aGUgcmVzdWx0IG9mIHBpcGVsaW5lIHJ1biB1bmRl
ciBVUkwgbGlrZToKPiAgICBodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QvcGVvcGxlL2xp
dXcveGVuL3BpcGVsaW5lcwo+ICAgICh5b3VyIHByb2JhYmx5IGNhbid0IGFjY2VzcyBpdCBiZWNh
dXNlIGl0IGlzIHByaXZhdGUpCgpXZSdsbCBkbyB0aGF0LCB0aGFua3MgZm9yIHRoZSBzdWdnZXN0
aW9uISBTb21lIG9mIG91ciB0ZWFtIG1lbWJlcnMgYXJlCm91dCBvZiBvZmZpY2UgYXQgdGhlIG1v
bWVudCwgc28gd2UnbGwgZ2V0IGJhY2sgdG8geW91IHdpdGggdGhlaXIKaGFuZGxlcy4gVW50aWwg
dGhlbiwgbWluZSdzIHJhenZhbi1jb2pvY2FydS4KCgpUaGFua3MsClJhenZhbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
