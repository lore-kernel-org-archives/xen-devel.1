From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Ping: [PATCH v2] x86: don't allow clearing of
 TF_kernel_mode for other than 64-bit PV
Date: Fri, 5 Apr 2019 14:03:40 +0100
Message-ID: <8ce0e9d1-40fc-8068-9aab-33a7708b5c80@citrix.com>
References: <5C868ED8020000780021D5BB@prv1-mh.provo.novell.com>
 <0ce9d1f8-ca58-3f81-4975-7a70f5ab669f@citrix.com>
 <5CA70DE60200007800224CA3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NZMc=SH=citrix.com=prvs=991a7e4b2=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hCOWw-0008Qk-Py
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 13:05:14 +0000
In-Reply-To: <5CA70DE60200007800224CA3@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Tim Deegan <tim@xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDQvMjAxOSAwOToxMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTkuMDMuMTkg
YXQgMTg6MDEsIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+PiBPbiAzLzExLzE5
IDQ6MzcgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gVGhlIGZsYWcgaXMgcmVhbGx5IG9ubHkg
bWVhbnQgZm9yIHRob3NlLCBib3RoIEhWTSBhbmQgMzItYml0IFBWIHRlbGwKPj4+IGtlcm5lbCBm
cm9tIHVzZXIgbW9kZSBiYXNlZCBvbiBDUEwvUlBMLiBSZW1vdmUgdGhlIGFsbC1xdWVzdGlvbi1t
YXJrcwo+Pj4gY29tbWVudCBhbmQgbGV0J3MgYmUgb24gdGhlIHNhZmUgc2lkZSBoZXJlIGFuZCBh
bHNvIHN1cHByZXNzIGNsZWFyaW5nCj4+PiBmb3IgMzItYml0IFBWICh0aGlzIGlzbid0IGEgZmFz
dCBwYXRoIGFmdGVyIGFsbCkuCj4+Pgo+Pj4gUmVtb3ZlIG5vIGxvbmdlciBuZWNlc3NhcnkgaXNf
cHZfMzJiaXRfKigpIGZyb20gc2hfdXBkYXRlX2NyMygpIGFuZAo+Pj4gc2hfd2Fsa19ndWVzdF90
YWJsZXMoKS4gTm90ZSB0aGF0IHNoYWRvd19vbmVfYml0X2Rpc2FibGUoKSBhbHJlYWR5Cj4+PiBh
c3N1bWVzIHRoZSBuZXcgYmVoYXZpb3IuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiBBY2tlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2Vvcmdl
LmR1bmxhcEBjaXRyaXguY29tPgo+IFdoaWxlIEkgaW50ZW5kIHRvIHRha2UgR2VvcmdlJ3MgYWNr
IGFzIGJlaW5nIHN1ZmZpY2llbnQgdG8gY292ZXIKPiB0aGUgc2hhZG93IHNpZGUsIG1heSBJIHBs
ZWFzZSBhc2sgZm9yIGFuIGFjayBvciBvdGhlcndpc2UgZm9yCj4gdGhlIG5vbi1tbSBwYXJ0IG9m
IHRoZSBjaGFuZ2U/IEkga25vdyB5b3UndmUgbm90IGJlZW4gaW4gZnVsbAo+IGFncmVlbWVudCB3
aXRoIHRoZSBjaGFuZ2UsIGJ1dCBpaXJjIEkndmUgbmV2ZXIgaGVhcmQgYmFjayBvbiBhCj4gc3Vi
c2VxdWVudCByZXBseSBvZiBtaW5lLiBBbmQgSSBmdXJ0aGVyIHRoaW5rIHRoYXQgd2l0aCB0aGUg
bm93Cj4gKHYyKSBldmVuIG1vcmUgb2J2aW91cyBkZXBlbmRlbmN5IG9mIHRoZSBzaGFkb3cgY29k
ZSBvbgo+IHRoaXMgYmVoYXZpb3IsIHRoZSBjaGFuZ2Ugc2hvdWxkIHJlYWxseSBiZSB0YWtlbiBh
cyBpcy4KCkFsc28sIEkndmUganVzdCBtYW5hZ2VkIHRvIGludmFsaWRhdGUgbXkgb3duIG9iamVj
dGlvbiB0byB0aGlzIGNoYW5nZSBvbgp0aGUgYmFzaXMgdGhhdCBpdCB3aWxsIGJyZWFrIG1pZ3Jh
dGlvbi4KCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
