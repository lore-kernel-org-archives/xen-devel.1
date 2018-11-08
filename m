From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 5/7] vpci: fix execution of long running
 operations
Date: Thu, 08 Nov 2018 09:25:26 -0700
Message-ID: <5BE4637602000078001F9D5D@prv1-mh.provo.novell.com>
References: <20181030154123.4218-6-roger.pau@citrix.com>
 <5BE0762D02000078001F8356@prv1-mh.provo.novell.com>
 <20181107111146.ksaemioxod3uk5p4@mac.citrite.net>
 <5BE2FF5802000078001F9313@prv1-mh.provo.novell.com>
 <20181107171517.7p34q6vjpggmzb4i@mac.citrite.net>
 <5BE4082C02000078001F97FE@prv1-mh.provo.novell.com>
 <20181108112959.7oc4guik3icb7nls@mac.citrite.net>
 <5BE42CC202000078001F9A29@prv1-mh.provo.novell.com>
 <20181108124727.34nyejn4ukggd4co@mac.citrite.net>
 <5BE4344B02000078001F9A7B@prv1-mh.provo.novell.com>
 <20181108132048.o4bnxvojp6deotwq@mac.citrite.net>
 <791E55F8020000889527FA34@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=e9yk=nt=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gKn7Z-0005SJ-Eu
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 16:25:29 +0000
In-Reply-To: <791E55F8020000889527FA34@prv1-mh.provo.novell.com>
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

Pj4+IE9uIDA4LjExLjE4IGF0IDE0OjIwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFRodSwgTm92IDA4LCAyMDE4IGF0IDA2OjA0OjExQU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMDguMTEuMTggYXQgMTM6NDcsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gTXkgcG9pbnQgd291bGQgYmUgdGhhdCBvbiB4ODYgSSB0aGluayB0aGUgb25s
eSB3YXkgdG8gaGF2ZSBwcmVlbXB0aWJsZQo+PiA+IGxvbmctcnVubmluZyBvcGVyYXRpb25zIGlu
c2lkZSBvZiBYZW4gaXMgdG8gYmxvY2sgdGhlIGd1ZXN0IHZDUFUgYW5kCj4+ID4gcnVuIHRoZW0g
aW4gYSB0YXNrbGV0LCBvciBhdCBsZWFzdCB0aGlzIHNlZW1zIHRoZSBsZXNzIGludmFzaXZlIG9u
ZS4KPj4gPiAKPj4gPiBEbyB5b3Ugc3RpbGwgaGF2ZSBvYmplY3Rpb25zIHRvIHRoaXMgcGF0Y2gv
YXBwcm9hY2g/Cj4+IAo+PiBXZWxsLCBJIHN0aWxsIGRvbid0IHVuZGVyc3RhbmQgd2h5IHlvdSB0
aGluayB5b3UgbmVlZCB0byBpbnRyb2R1Y2UKPj4gYSB0YXNrbGV0IGluIHRoZSBmaXJzdCBwbGFj
ZS4gVGhhdCdzIGJlY2F1c2UgSSBzdGlsbCBkb24ndCB1bmRlcnN0YW5kCj4+IHdoYXQgeW91IHRo
aW5rIGlzIHdyb25nIHdpdGggdGhlIGN1cnJlbnQgYXBwcm9hY2ggKGxlYXZpbmcgYXNpZGUKPj4g
dGhlIGV4YWN0IHBsYWNlbWVudCBvZiB3aGVyZSB0aGUgdnBjaSBob29rIG5lZWRzIHRvIGJlIGNh
bGxlZCkuCj4gCj4gVGhlIGN1cnJlbnQgYXBwcm9hY2ggZG9lc24ndCBwcmV2ZW50IHRoZSB2Q1BV
IGZyb20gcmV0dXJuaW5nIHRvIGd1ZXN0Cj4gY29udGV4dCB3aXRoIHBlbmRpbmcgd29yay4KPiAK
PiBQbGFjaW5nIHRoZSBwZW5kaW5nIHdvcmsgaG9vayAodnBjaV9wcm9jZXNzX3BlbmRpbmcpIGlu
IGh2bV9kb19yZXN1bWUKPiBpcyBub3QgZ29pbmcgdG8gc29sdmUgdGhpcyB1bmxlc3Mgd2UgcmFp
c2UgYW5kIHByb2Nlc3MgYSBzY2hlZHVsZXIKPiBzb2Z0aXJxLCBhbmQgdGhlbiB0aGlzIGxlYWRz
IHRvIHRoZSByZWN1cnNpb24gcHJvYmxlbS4KCldoaWNoIHJlY3Vyc2lvbiBwcm9ibGVtPyBJIHN0
aWxsIGhhdmVuJ3Qgc2VlbiBhbiBvdXRsaW5lIHRha2luZyBpbnRvCmFjY291bnQgd2hhdCBJIGhh
dmUgd3JpdHRlbiBpbiBlYXJsaWVyIHJlcGxpZXMuIEluIHBhcnRpY3VsYXIgSSBkb24ndApzZWUg
YSBzb2Z0aXJxIGhhbmRsZXIgaXRzZWxmIGNhbGxpbmcgZG9fc29mdGlycSgpIGFueXdoZXJlLgoK
SmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
