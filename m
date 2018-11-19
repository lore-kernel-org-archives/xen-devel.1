From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V6 4/4] x86/altp2m: fix display frozen when
 switching to a new view early
Date: Mon, 19 Nov 2018 15:01:04 +0200
Message-ID: <4adb8544-5667-f6dd-6c3d-94710d4f30c4@bitdefender.com>
References: <1542228002-21075-1-git-send-email-rcojocaru@bitdefender.com>
 <1542228002-21075-5-git-send-email-rcojocaru@bitdefender.com>
 <3603CF64-3679-43F6-A389-E88DAA0BF503@citrix.com>
 <482be5fb-0406-c203-2664-070a77e329e9@bitdefender.com>
 <5BEE972D02000078001FCB0D@prv1-mh.provo.novell.com>
 <62c1f237-9d1d-06f3-49f8-e48be8d38b3f@citrix.com>
 <5BEEB8B502000078001FCBEF@prv1-mh.provo.novell.com>
 <b096879e-c2cd-7255-46b5-bcd5ecc5a017@citrix.com>
 <efe0b93a-164f-6bbe-81f8-3c1e4247bc2b@citrix.com>
 <5BF2AF9902000078001FD740@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mWzq=N6=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gOjAv-00031q-UX
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 13:01:13 +0000
In-Reply-To: <5BF2AF9902000078001FD740@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, george.dunlap@citrix.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMTkvMTggMjo0MiBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTYuMTEuMTgg
YXQgMTY6NTIsIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+PiBPbiAxMS8xNi8x
OCAzOjA1IFBNLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+Pj4gTm93IHRha2UgY2hhbmdlX3R5cGVf
cmFuZ2UuICBUaGUgZ2xvYmFsIGVmZmVjdCBvZiBjaGFuZ2VfdHlwZV9yYW5nZQo+Pj4gc2hvdWxk
IGJlIHRoYXQgcmVhZHMgb2YgdGhlIHAybSB3aGljaCBoYXBwZW4gYWZ0ZXJ3YXJkcyBzaG91bGQg
aGF2ZSB0aGUKPj4+IG5ldywgY2hhbmdlZCB2YWx1ZS4KPj4+Cj4+PiBJbiBjYXNlIEEsIGNoYW5n
ZV90eXBlX3JhbmdlIHdpbGwgd3JpdGUgaW52YWxpZCBlbnRyaWVzIHVwIHRvCj4+PiBtYXhfcmVt
YXBwZWRfcGZuLCBsZWF2aW5nIHRoZSByYW5nZSBiZXR3ZWVuIG1heF9yZW1hcHBlZF9wZm4gYW5k
Cj4+PiBob3N0cDJtLT5tYXhfbWFwcGVkX3BmbiBpbnZhbGlkLiAgV2hlbiBhIGdmbiBpbiB0aGlz
IHJhbmdlIGlzIHJlYWQsIGFuCj4+PiBFUFQgZmF1bHQgd2lsbCBoYXBwZW4sIHAybV9hbHRwMm1f
bGF6eV9jb3B5KCkgd2lsbCBiZSBjYWxsZWQsIGFuZCB0aGUKPj4+IG5ldyAoY29ycmVjdCkgdmFs
dWUgY29waWVkIGZyb20gdGhlIGhvc3RwMm0uCj4+Pgo+Pj4gSW4gY2FzZSBCLCBjaGFuZ2VfdHlw
ZV9yYW5nZSB3aWxsIHdyaXRlIGludmFsaWQgZW50cmllcyB1cCB1bnRpbAo+Pj4gaG9zdHAybS0+
bWF4X21hcHBlZF9wZm4uICBXaGVuIGEgZ2ZuIGluIHRoaXMgcmFuZ2UgaXMgYWNjZXNzZWQsIGEK
Pj4+IE1JU0NPTkZJRyBmYXVsdCB3aWxsIGhhcHBlbiwgYW5kIHRoZSBjb3JyZWN0IHZhbHVlIHdp
bGwgYmUgY2FsY3VsYXRlZCBpbgo+Pj4gcmVzb2x2ZV9taXNjb25maWcuCj4+Cj4+IE9yLCBubzog
cmVzb2x2ZV9taXNjb25maWcoKSB3aWxsIHJlYWQgdGhlIGN1cnJlbnQgdHlwZSBpbiB0aGUgYWx0
cDJtLAo+PiB3aGljaCB3aWxsIGJlIHAybV9pbnZhbGlkOyBwMm1fcmVjYWxjX3R5cGUoKSB3aWxs
IHRoZW4gcmV0dXJuCj4+IHAybV9pbnZhbGlkLCBhbmQgdGhlbiBzZXQgdGhlIGVudHJ5IHRvIGEg
InBsYWluIiBpbnZhbGlkIHdpdGhvdXQgdGhlCj4+IHJlc2VydmVkIGJpdCBzZXQuICBUaGVuIHRo
ZSBmYXVsdCB3aWxsIGhhcHBlbiBhZ2FpbiwgdGFraW5nIHRoZSBub3JtYWwKPj4gSEFQIGZhdWx0
IHBhdGggKGNhbGxpbmcgcDJtX2FsdHAybV9sYXp5X2NvcHkoKSksIGF0IHdoaWNoIHBvaW50Li4u
Cj4+Cj4+PiBBbmQgYXQgdGhpcyBwb2ludCwgSSByZWFsaXplIHRoYXQgbXkgcHJldmlvdXMgYW5h
bHlzaXMgd2FzIHByb2JhYmx5Cj4+PiB3cm9uZywgYmVjYXVzZSBhdCB0aGlzIHBvaW50IGFsdHAy
bS0+bWF4X3JlbWFwcGVkX2dmbiB3aWxsIGJlIHdyb25nOgo+Pj4gZW50cmllcyBhYm92ZSBtYXhf
cmVtYXBwZWRfZ2ZuIHdpbGwgaGF2ZSBiZWNvbWUgdmFsaWQgd2l0aG91dCBnb2luZwo+Pj4gdGhy
b3VnaCBwMm1fYWx0cDJtX2xhenlfY29weSgpLgo+Pgo+PiAuLi5hbHRwMm0tPm1heF9yZW1hcHBl
ZF9nZm4gd2lsbCBiZSBzZXQgYXBwcm9wcmlhdGVseS4KPj4KPj4gSSB0aGluay4gOi0vCj4gCj4g
QW5kIEkgdGhpbmsgSSBjYW4gZm9sbG93IHlvdXIgYW5hbHlzaXMgbm93LCB3aGljaCBpbiB0dXJu
IG1lYW5zIEkKPiB0aGluayB5b3VyIHR3byBwYXRjaGVzIGFyZSBnb2luZyB0byBoZWxwLCBidXQg
Zm9yIGEgcHJvcGVyIHJldmlldwo+IEknZCBwcmVmZXIgdGhlbSB0byBiZSBpbmxpbmUgaW4gYSBt
YWlsLCByYXRoZXIgdGhhbiBhdHRhY2htZW50cy4KClBsZWFzZSBzZWUgbXkgcmV2aWV3IG9mIHRo
ZSBzZWNvbmQgcGF0Y2gsIHdoaWNoIHdvbid0IHdvcmsgd2l0aCBteSBzZXJpZXMuCgpBbHNvLCB0
aGUgcGF0Y2hlcyBHZW9yZ2UgaGFzIHNlbnQgYXJlIGFwcGxpY2FibGUgYWZ0ZXIgbXkgc2VyaWVz
IGhhcwpiZWVuIGFwcGxpZWQgLSB3b3VsZCB5b3UgYW5kIEdlb3JnZSBsaWtlIG1lIHRvIGFwcGVu
ZCBoaXMgZmlyc3QgcGF0Y2ggdG8KdGhlIGVuZCBvZiBteSBzZXJpZXMsIG9yIHdvdWxkIHdlIGJl
IGJldHRlciBvZmYgaWYgaGUgc2VuZHMgaGlzIHBhdGNoCmZpcnN0IGZvciB0aGUgY3VycmVudCBj
b2RlLCBhbmQgSSByZWJhc2UgbXkgc2VyaWVzIG9uIHRoYXQ/CgoKVGhhbmtzLApSYXp2YW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
