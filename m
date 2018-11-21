From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH] x86/mem_access: move
 p2m_mem_access_sanity_check() from header
Date: Wed, 21 Nov 2018 12:13:45 +0200
Message-ID: <68f8ef5a-875c-8093-516d-bc8961dfa0f4@bitdefender.com>
References: <1542737127-17695-1-git-send-email-rcojocaru@bitdefender.com>
 <5BF52CAE02000078001FE57D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RqMg=OA=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gPPW5-0001BB-OL
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 10:13:53 +0000
In-Reply-To: <5BF52CAE02000078001FE57D@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMjEvMTggMTI6MDAgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDIwLjExLjE4
IGF0IDE5OjA1LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4+IC0tLSBhL3hl
bi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L21tL21lbV9h
Y2Nlc3MuYwo+PiBAQCAtNTQxLDYgKzU0MSwxMSBAQCB2b2lkIGFyY2hfcDJtX3NldF9hY2Nlc3Nf
cmVxdWlyZWQoc3RydWN0IGRvbWFpbiAqZCwgYm9vbCBhY2Nlc3NfcmVxdWlyZWQpCj4+ICAjZW5k
aWYKPj4gIH0KPj4gIAo+PiArYm9vbCBwMm1fbWVtX2FjY2Vzc19zYW5pdHlfY2hlY2soc3RydWN0
IGRvbWFpbiAqZCkKPj4gK3sKPj4gKyAgICByZXR1cm4gaXNfaHZtX2RvbWFpbihkKSAmJiBjcHVf
aGFzX3ZteCAmJiBoYXBfZW5hYmxlZChkKTsKPj4gK30KPiAKPiBXaXRoIFRhbWFzJ3MgYWNrIEkn
dmUgY29tbWl0dGVkIHRoaXMgYXMgaXMsIGJ1dCBmb3IgdGhlIGZ1dHVyZSBtYXkKPiBJIGFzayB0
aGF0IHlvdSB0YWtlIHRoZSBvcHBvcnR1bml0eSBhbmQgZG8gdHJpdmlhbCBpbXByb3ZlbWVudHMg
aW4KPiBzdWNoIGNhc2VzIChoZXJlOiBhZGQgY29uc3QpPwoKT2YgY291cnNlLCBJJ2xsIHNlbmQg
YSBuZXcgcGF0Y2ggYXMgc29vbiBhcyBwb3NzaWJsZS4KCgpUaGFua3MsClJhenZhbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
