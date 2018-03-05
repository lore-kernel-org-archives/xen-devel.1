From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/2] x86: report if PCID and INVPCID are
	supported
Date: Mon, 5 Mar 2018 13:49:00 +0100
Message-ID: <77e443bf-64a4-fa3b-ff24-3000ca0579c3@suse.com>
References: <20180305095032.30062-1-wei.liu2@citrix.com>
 <20180305095032.30062-2-wei.liu2@citrix.com>
 <5A9D362002000078001AE74F@suse.com>
 <fdc238ab-ad02-69a0-0e3a-3c2e643a40e7@suse.com>
 <5A9D482202000078001AE7ED@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=u36v=f3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1espYH-0004T7-0Q
 for xen-devel@lists.xenproject.org; Mon, 05 Mar 2018 12:49:13 +0000
In-Reply-To: <5A9D482202000078001AE7ED@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDMvMTggMTM6MzcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA1LjAzLjE4IGF0
IDEyOjQzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gT24gMDUvMDMvMTggMTI6MjAsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMDUuMDMuMTggYXQgMTA6NTAsIDx3ZWkubGl1MkBj
aXRyaXguY29tPiB3cm90ZToKPj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvc2V0dXAuYwo+Pj4+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCj4+Pj4gQEAgLTE3MDEsNiArMTcwMSwxMyBAQCB2b2lk
IF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hlbih1bnNpZ25lZCBsb25nIG1iaV9wKQo+Pj4+ICAg
ICAgICAgICAgIGNwdV9oYXNfbnggPyBYRU5MT0dfSU5GTyA6IFhFTkxPR19XQVJOSU5HICJXYXJu
aW5nOiAiLAo+Pj4+ICAgICAgICAgICAgIGNwdV9oYXNfbnggPyAiIiA6ICJub3QgIik7Cj4+Pj4g
IAo+Pj4+ICsKPj4+PiArICAgIHByaW50ayhYRU5MT0dfSU5GTwo+Pj4+ICsgICAgICAgICAgICJQ
Q0lEIChQcm9jZXNzLUNvbnRleHQgSURlbnRpZmllcikgJXNzdXBwb3J0ZWRcbiIsCj4+Pj4gKyAg
ICAgICAgICAgY3B1X2hhc19wY2lkID8gIiIgOiAibm90ICIpOwo+Pj4+ICsKPj4+PiArICAgIHBy
aW50ayhYRU5MT0dfSU5GTyAiSU5WUENJRCAlc3N1cHBvcnRlZFxuIiwgY3B1X2hhc19pbnZwY2lk
ID8gIiIgOiAibm90ICIpOwo+Pj4KPj4+IERvIHdlIHJlYWxseSBuZWVkIHRoaXM/IFdlIGxvZyBh
IG1lc3NhZ2UgZm9yIE5YIGFzIGFuIGV4Y2VwdGlvbiwKPj4+IHdlIGRvbid0IGRvIHNvIGZvciBv
dGhlciBmZWF0dXJlcyAoYW5kIHRoaW5ncyB3b3VsZCBnZXQgcHJldHR5Cj4+PiB1bndpZWxkeSBp
ZiB3ZSBkaWQpLgo+Pgo+PiBJJ2QgcmF0aGVyIGtlZXAgdGhpcyBtZXNzYWdlLiBBcyB3ZSBhcmUg
aGlkaW5nIFBDSUQgYW5kIElOUENJRCBmcm9tIGRvbTAKPj4gdGhpcyBpcyB0aGUgb25seSBpbmRp
Y2F0b3Igb2YgdGhvc2UgZmVhdHVyZXMgYmVpbmcgc3VwcG9ydGVkLiBJbiBjYXNlIG9mCj4+IGFu
IGVycm9yIHJlbGF0ZWQgdG8gVExCIGNvbnNpc3RlbmN5IHRoaXMgaW5mb3JtYXRpb24gaXMgaW1w
b3J0YW50IElNTy4KPiAKPiBXZWxsLCB0aGlzIGFyZ3VtZW50IHdvdWxkIGhvbGQgZm9yIGFsbW9z
dCBldmVyeSBvdGhlciBhZHZhbmNlZAo+IGZlYXR1cmUgd2UgdXNlLgoKVGhlbiBJJ2Qgc3VnZ2Vz
dCB0byBlaXRoZXIgYWRkIGluZGl2aWR1YWwgbWVzc2FnZXMgZm9yIHRob3NlIGZlYXR1cmVzIG9y
CnRvIGhhdmUgYSBzaW5nbGUgbWVzc2FnZSAob3IgYSBmZXcpIHRvIGxpc3QgYWxsIGZlYXR1cmVz
IGxpa2UgdGhlIGZsYWdzCmluIC9wcm9jL2NwdWluZm8uIFRoaXMgbGlzdCBjb3VsZCBldmVuIGJl
IHBhcnQgb2YgdGhlICJ4bCBpbmZvIiBvdXRwdXQuCgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
