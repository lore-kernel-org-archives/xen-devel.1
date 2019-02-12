From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH Makefile v2] asm: handle comments when
 creating header file
Date: Tue, 12 Feb 2019 10:49:44 +0000
Message-ID: <20190212104944.mlfhbqlj3f45pkpp@zion.uk.xensource.com>
References: <5A66FF2002000078001A162C@prv-mh.provo.novell.com>
 <1549462173-9343-1-git-send-email-nmanthey@amazon.de>
 <5C5AF8D10200007800214573@prv1-mh.provo.novell.com>
 <638aace5-f3b1-4a7b-d063-04e2d8ce20fa@amazon.de>
 <5b6c3457-fddd-8f7f-a7e2-caf952cbcd8c@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X2db=QT=citrix.com=prvs=93946142b=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gtVdR-00033Y-D9
 for xen-devel@lists.xenproject.org; Tue, 12 Feb 2019 10:49:53 +0000
Content-Disposition: inline
In-Reply-To: <5b6c3457-fddd-8f7f-a7e2-caf952cbcd8c@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Norbert Manthey <nmanthey@amazon.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Norbert Manthey <nmanthey@amazon.de>, Jan Beulich <JBeulich@suse.com>, Michael Tautschnig <tautschn@amazon.co.uk>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBGZWIgMTEsIDIwMTkgYXQgMDM6MTQ6NTVQTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBPbiAxMS8wMi8yMDE5IDE0OjA3LCBOb3JiZXJ0IE1hbnRoZXkgd3JvdGU6Cj4gPiBP
biAyLzYvMTkgMTY6MTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+Pj4+IE9uIDA2LjAyLjE5IGF0
IDE1OjA5LCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiA+Pj4gRnJvbTogTm9yYmVydCBN
YW50aGV5IDxubWFudGhleUBhbWF6b24uY29tPgo+ID4+Pgo+ID4+PiBJbiB0aGUgZWFybHkgc3Rl
cHMgb2YgY29tcGlsYXRpb24sIHRoZSBhc20gaGVhZGVyIGZpbGVzIGFyZSBjcmVhdGVkLCBzdWNo
Cj4gPj4+IGFzIGluY2x1ZGUvYXNtLSQoVEFSR0VUX0FSQ0gpL2FzbS1vZmZzZXRzLmguIFRoZXNl
IGZpbGVzIGRlcGVuZCBvbiB0aGUKPiA+Pj4gYXNzZW1ibHkgZmlsZSBhcmNoLyQoVEFSR0VUX0FS
Q0gpL2FzbS1vZmZzZXRzLnMsIHdoaWNoIGlzIGdlbmVyYXRlZAo+ID4+PiBiZWZvcmUuIERlcGVu
ZGluZyBvbiB0aGUgdXNlZCB0b29sY2hhaW4sIHRoZXJlIG1pZ2h0IGJlIGNvbW1lbnRzIGluIHRo
ZQo+ID4+PiBhc3NlbWJseSBmaWxlcy4gRXNwZWNpYWxseSB0aGUgZ290by1nY2MgY29tcGlsZXIg
b2YgdGhlIGJvdW5kZWQgbW9kZWwKPiA+Pj4gY2hlY2tlciBDQk1DIGFkZHMgY29tbWVudHMgdGhh
dCBzdGFydCB3aXRoIGEgJyMnIHN5bWJvbCBhdCB0aGUgYmVnaW5uaW5nCj4gPj4+IG9mIHRoZSBs
aW5lLgo+ID4+Pgo+ID4+PiBUaGlzIGNvbW1pdCBhZGRzIGhhbmRsaW5nIGNvbW1lbnRzIGluIGFz
c2VtYmxlciBkdXJpbmcgdGhlIGNyZWF0aW9uIG9mIHRoZQo+ID4+PiBhc20gaGVhZGVyIGZpbGVz
LCBlc3BlY2lhbGx5IGlnbm9yaW5nIGxpbmVzIHRoYXQgc3RhcnQgd2l0aCAnIycsIHdoaWNoCj4g
Pj4+IGluZGljYXRlIGNvbW1lbnRzIGZvciBib3RoIEFSTSBhbmQgeDg2IGFzc2VtYmxlci4gVGhl
IHVzZWQgdG9vbCBnb3RvLWFzCj4gPj4+IHByb2R1Y2VzIGV4YWN0bHkgY29tbWVudHMgb2YgdGhp
cyBraW5kLgo+ID4+Pgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50
aGV5QGFtYXpvbi5kZT4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBUYXV0c2NobmlnIDx0
YXV0c2NobkBhbWF6b24uY28udWs+Cj4gPj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KPiA+Pgo+ID4gSsO8cmdlbiwgaXMgdGhlcmUgYSBjaGFuY2UgdG8gZ2V0
IHRoaXMgcGF0Y2ggaW50byB0aGUgNC4xMiByZWxlYXNlPyBJdAo+ID4gd291bGQgYmUgbmljZSB0
byBiZSBhYmxlIHRvIGNvbXBpbGUgdXBzdHJlYW0gWGVuIHdpdGggdGhlIHRvb2wgY2hhaW4gZm9y
Cj4gPiB0aGUgQ0JNQyBtb2RlbCBjaGVja2VyIChpLmUuIHRoZSBnb3RvLWdjYyBjb21waWxlciks
IGFzIHRoYXQgdG9vbCBjaGFpbgo+ID4gYWxsb3dzIHRvIGFwcGx5IGZ1cnRoZXIgcmVhc29uaW5n
LiBUaGFua3MhCj4gCj4gUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPgoKQXBwbGllZC4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
