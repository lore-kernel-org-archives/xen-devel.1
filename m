From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 5/7] vpci: fix execution of long running
 operations
Date: Thu, 08 Nov 2018 06:04:11 -0700
Message-ID: <5BE4344B02000078001F9A7B@prv1-mh.provo.novell.com>
References: <20181030154123.4218-1-roger.pau@citrix.com>
 <20181030154123.4218-6-roger.pau@citrix.com>
 <5BE0762D02000078001F8356@prv1-mh.provo.novell.com>
 <20181107111146.ksaemioxod3uk5p4@mac.citrite.net>
 <5BE2FF5802000078001F9313@prv1-mh.provo.novell.com>
 <20181107171517.7p34q6vjpggmzb4i@mac.citrite.net>
 <5BE4082C02000078001F97FE@prv1-mh.provo.novell.com>
 <20181108112959.7oc4guik3icb7nls@mac.citrite.net>
 <5BE42CC202000078001F9A29@prv1-mh.provo.novell.com>
 <20181108124727.34nyejn4ukggd4co@mac.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=e9yk=nt=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gKjyp-0000xX-Qc
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 13:04:15 +0000
In-Reply-To: <20181108124727.34nyejn4ukggd4co@mac.citrite.net>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjExLjE4IGF0IDEzOjQ3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE15IHBvaW50IHdvdWxkIGJlIHRoYXQgb24geDg2IEkgdGhpbmsgdGhlIG9ubHkgd2F5IHRvIGhh
dmUgcHJlZW1wdGlibGUKPiBsb25nLXJ1bm5pbmcgb3BlcmF0aW9ucyBpbnNpZGUgb2YgWGVuIGlz
IHRvIGJsb2NrIHRoZSBndWVzdCB2Q1BVIGFuZAo+IHJ1biB0aGVtIGluIGEgdGFza2xldCwgb3Ig
YXQgbGVhc3QgdGhpcyBzZWVtcyB0aGUgbGVzcyBpbnZhc2l2ZSBvbmUuCj4gCj4gRG8geW91IHN0
aWxsIGhhdmUgb2JqZWN0aW9ucyB0byB0aGlzIHBhdGNoL2FwcHJvYWNoPwoKV2VsbCwgSSBzdGls
bCBkb24ndCB1bmRlcnN0YW5kIHdoeSB5b3UgdGhpbmsgeW91IG5lZWQgdG8gaW50cm9kdWNlCmEg
dGFza2xldCBpbiB0aGUgZmlyc3QgcGxhY2UuIFRoYXQncyBiZWNhdXNlIEkgc3RpbGwgZG9uJ3Qg
dW5kZXJzdGFuZAp3aGF0IHlvdSB0aGluayBpcyB3cm9uZyB3aXRoIHRoZSBjdXJyZW50IGFwcHJv
YWNoIChsZWF2aW5nIGFzaWRlCnRoZSBleGFjdCBwbGFjZW1lbnQgb2Ygd2hlcmUgdGhlIHZwY2kg
aG9vayBuZWVkcyB0byBiZSBjYWxsZWQpLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
