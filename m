From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86emul: don't read mask register on
 AVX512F-incapable platforms
Date: Thu, 28 Mar 2019 18:03:40 +0000
Message-ID: <baef5f45-98ca-a53b-daac-6c0f7884eb26@citrix.com>
References: <5C9CFE7102000078002229A1@prv1-mh.provo.novell.com>
 <232d7494-4976-4028-4cef-76f9bef85981@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9APk=R7=citrix.com=prvs=98327f9ff=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h9ZRp-0004AB-HL
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2019 18:08:17 +0000
In-Reply-To: <232d7494-4976-4028-4cef-76f9bef85981@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDMvMjAxOSAxNzo0NCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAzLzI4LzE5IDU6
MDMgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBSZXBvcnRlZC1ieTogR2VvcmdlIER1bmxhcCA8
Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Cj4gVGhhdCBzZWVtcyB0byBmaXggYWxsIHRoZSBvbmVzIHJlbGF0
ZWQgdG8gdGhlIGNyYXNoZXMgSSB3YXMgc2VlaW5nOgo+Cj4gVGVzdGVkLWJ5OiBHZW9yZ2UgRHVu
bGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Cj4KPj4gLS0tCj4+IFRoaXMgaXMgc3VyZWx5
IGEgc3RhYmxlIHRyZWUgY2FuZGlkYXRlLCB1bmxlc3MgaXQgY291bGQgc3RpbGwgbWFrZSBpdAo+
PiBpbnRvIDQuMTIgYmVmb3JlIHRoZSByZWxlYXNlLgo+Pgo+PiAtLS0gYS94ZW4vYXJjaC94ODYv
eDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuYwo+PiArKysgYi94ZW4vYXJjaC94ODYveDg2X2VtdWxh
dGUveDg2X2VtdWxhdGUuYwo+PiBAQCAtMzUxMSw3ICszNTExLDcgQEAgeDg2X2VtdWxhdGUoCj4+
ICAgICAgfQo+PiAgCj4+ICAgICAgLyogV2l0aCBhIG1lbW9yeSBvcGVyYW5kLCBmZXRjaCB0aGUg
bWFzayByZWdpc3RlciBpbiB1c2UgKGlmIGFueSkuICovCj4+IC0gICAgaWYgKCBlYS50eXBlID09
IE9QX01FTSAmJiBldmV4Lm9wbXNrICkKPj4gKyAgICBpZiAoIGVhLnR5cGUgPT0gT1BfTUVNICYm
IGNwdV9oYXNfYXZ4NTEyZiAmJiBldmV4Lm9wbXNrICkKClNvLCB0aGlzIGNlcnRhaW5seSB3aWxs
IGZpeCB0aGUgY3Jhc2ggYXMgcmVwb3J0ZWQsIHlvdSBuZWVkIGFuICV4Y3IwCmNoZWNrLCB0byBw
cmV2ZW50IG90aGVyIHdheXMgb2YgdGhpcyBzdHViIGZhdWx0aW5nLgoKfkFuZHJldwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
