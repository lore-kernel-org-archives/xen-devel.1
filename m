From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH 0/8] xen: add pvh guest support
Date: Thu, 14 Dec 2017 12:19:52 +0100
Message-ID: <20171214111952.GH4531__7442.38527627221$1513250459$gmane$org@olila.local.net-space.pl>
References: <20171129134650.20102-1-jgross@suse.com>
 <20171130210309.GC16962@olila.local.net-space.pl>
 <48481317-be7a-f91b-8e88-d8270eeee1eb@suse.com>
 <20171201111250.GF16962@olila.local.net-space.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <20171201111250.GF16962@olila.local.net-space.pl>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: grub-devel@gnu.org, phcoder@gmail.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBEZWMgMDEsIDIwMTcgYXQgMTI6MTI6NTBQTSArMDEwMCwgRGFuaWVsIEtpcGVyIHdy
b3RlOgo+IE9uIEZyaSwgRGVjIDAxLCAyMDE3IGF0IDA2OjM3OjM3QU0gKzAxMDAsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4gPiBPbiAzMC8xMS8xNyAyMjowMywgRGFuaWVsIEtpcGVyIHdyb3RlOgo+
ID4gPiBPbiBXZWQsIE5vdiAyOSwgMjAxNyBhdCAwMjo0Njo0MlBNICswMTAwLCBKdWVyZ2VuIEdy
b3NzIHdyb3RlOgo+ID4gPj4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBib290
aW5nIExpbnV4IGFzIFBWSCBndWVzdC4KPiA+ID4+Cj4gPiA+PiBTaW1pbGFyIHRvIGkzODYveGVu
IGFuZCB4ODZfNjQveGVuIHBsYXRmb3JtcyB0aGUgbmV3IGkzODYveGVucHZoCj4gPiA+PiBwbGF0
Zm9ybSBncnViIGlzIGJvb3RlZCBhcyBhIHN0YW5kYWxvbmUgaW1hZ2UgZGlyZWN0bHkgYnkgWGVu
Lgo+ID4gPj4KPiA+ID4+IEZvciBib290aW5nIExpbnV4IGtlcm5lbCBpdCBpcyB1c2luZyB0aGUg
c3RhbmRhcmQgbGludXgga2VybmVsCj4gPiA+PiBsb2FkZXIuIFRoZSBvbmx5IG1vZGlmaWNhdGlv
biBvZiB0aGUgbGludXggbG9hZGVyIGlzIHRvIHBhc3MgdGhlCj4gPiA+PiBBQ1BJIFJTRFAgYWRk
cmVzcyB2aWEgYm9vdCBwYXJhbWV0ZXJzIHRvIHRoZSBrZXJuZWwsIGFzIHRoYXQgdGFibGUKPiA+
ID4+IG1pZ2h0IG5vdCBiZSBsb2NhdGVkIGF0IHRoZSB1c3VhbCBwaHlzaWNhbCBhZGRyZXNzIGp1
c3QgYmVsb3cgMU1CLgo+ID4gPj4KPiA+ID4+IEFzIHRoZSByZWxhdGVkIExpbnV4IGtlcm5lbCBw
YXRjaGVzIGFyZSBub3QgeWV0IGFjY2VwdGVkIHBsZWFzZQo+ID4gPj4gd2FpdCBmb3IgdGhpcyB0
byBoYXBwZW4gYmVmb3JlIGFwcGx5aW5nIHRoZSBzZXJpZXMuCj4gPiA+Cj4gPiA+IFNvLCBtYXkg
SSByZXZpZXcgdGhlIHBhdGNoZXMgb3Igc2hvdWxkIEkgaG9sZCBvbj8gQW5kIGNvdWxkIHlvdQo+
ID4gPiBwcm92aWRlIGEgbGluayB0byB0aGUgIkxpbnV4IGtlcm5lbCBwYXRjaGVzIiBtZW50aW9u
ZWQgYWJvdmU/Cj4gPgo+ID4gUGxlYXNlIHJldmlldyEKPgo+IFdpbGwgZG8gaW4gYSB3ZWVrIG9y
IHNvLgoKU3dhbXBlZCBieSBzb21lIHVyZ2VudCBpbnRlcm5hbCB3b3JrLiBJIHdpbGwgdHJ5IHRv
IHJldmlldyB0aGlzIGJlZm9yZQpYbWFzIGJ1dCBpZiBpdCBkbyBub3QgaGFwcGVuIHRoZW4gSSB3
aWxsIGRvIGl0IGluIHRoZSBmaXJzdCBoYWx0IG9mCkphbnVhcnkuIFNvcnJ5IGZvciBkZWxheXMu
CgpEYW5pZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
