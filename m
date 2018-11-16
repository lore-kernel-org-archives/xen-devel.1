From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH V6 4/4] x86/altp2m: fix display frozen when
 switching to a new view early
Date: Fri, 16 Nov 2018 15:52:45 +0000
Message-ID: <efe0b93a-164f-6bbe-81f8-3c1e4247bc2b@citrix.com>
References: <1542228002-21075-1-git-send-email-rcojocaru@bitdefender.com>
 <1542228002-21075-5-git-send-email-rcojocaru@bitdefender.com>
 <3603CF64-3679-43F6-A389-E88DAA0BF503@citrix.com>
 <482be5fb-0406-c203-2664-070a77e329e9@bitdefender.com>
 <5BEE972D02000078001FCB0D@prv1-mh.provo.novell.com>
 <62c1f237-9d1d-06f3-49f8-e48be8d38b3f@citrix.com>
 <5BEEB8B502000078001FCBEF@prv1-mh.provo.novell.com>
 <b096879e-c2cd-7255-46b5-bcd5ecc5a017@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sqSd=N3=citrix.com=prvs=851e78e2c=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gNgQS-0003VP-Q3
 for xen-devel@lists.xenproject.org; Fri, 16 Nov 2018 15:52:56 +0000
In-Reply-To: <b096879e-c2cd-7255-46b5-bcd5ecc5a017@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMTYvMTggMzowNSBQTSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBOb3cgdGFrZSBjaGFu
Z2VfdHlwZV9yYW5nZS4gIFRoZSBnbG9iYWwgZWZmZWN0IG9mIGNoYW5nZV90eXBlX3JhbmdlCj4g
c2hvdWxkIGJlIHRoYXQgcmVhZHMgb2YgdGhlIHAybSB3aGljaCBoYXBwZW4gYWZ0ZXJ3YXJkcyBz
aG91bGQgaGF2ZSB0aGUKPiBuZXcsIGNoYW5nZWQgdmFsdWUuCj4gCj4gSW4gY2FzZSBBLCBjaGFu
Z2VfdHlwZV9yYW5nZSB3aWxsIHdyaXRlIGludmFsaWQgZW50cmllcyB1cCB0bwo+IG1heF9yZW1h
cHBlZF9wZm4sIGxlYXZpbmcgdGhlIHJhbmdlIGJldHdlZW4gbWF4X3JlbWFwcGVkX3BmbiBhbmQK
PiBob3N0cDJtLT5tYXhfbWFwcGVkX3BmbiBpbnZhbGlkLiAgV2hlbiBhIGdmbiBpbiB0aGlzIHJh
bmdlIGlzIHJlYWQsIGFuCj4gRVBUIGZhdWx0IHdpbGwgaGFwcGVuLCBwMm1fYWx0cDJtX2xhenlf
Y29weSgpIHdpbGwgYmUgY2FsbGVkLCBhbmQgdGhlCj4gbmV3IChjb3JyZWN0KSB2YWx1ZSBjb3Bp
ZWQgZnJvbSB0aGUgaG9zdHAybS4KPiAKPiBJbiBjYXNlIEIsIGNoYW5nZV90eXBlX3JhbmdlIHdp
bGwgd3JpdGUgaW52YWxpZCBlbnRyaWVzIHVwIHVudGlsCj4gaG9zdHAybS0+bWF4X21hcHBlZF9w
Zm4uICBXaGVuIGEgZ2ZuIGluIHRoaXMgcmFuZ2UgaXMgYWNjZXNzZWQsIGEKPiBNSVNDT05GSUcg
ZmF1bHQgd2lsbCBoYXBwZW4sIGFuZCB0aGUgY29ycmVjdCB2YWx1ZSB3aWxsIGJlIGNhbGN1bGF0
ZWQgaW4KPiByZXNvbHZlX21pc2NvbmZpZy4KCk9yLCBubzogcmVzb2x2ZV9taXNjb25maWcoKSB3
aWxsIHJlYWQgdGhlIGN1cnJlbnQgdHlwZSBpbiB0aGUgYWx0cDJtLAp3aGljaCB3aWxsIGJlIHAy
bV9pbnZhbGlkOyBwMm1fcmVjYWxjX3R5cGUoKSB3aWxsIHRoZW4gcmV0dXJuCnAybV9pbnZhbGlk
LCBhbmQgdGhlbiBzZXQgdGhlIGVudHJ5IHRvIGEgInBsYWluIiBpbnZhbGlkIHdpdGhvdXQgdGhl
CnJlc2VydmVkIGJpdCBzZXQuICBUaGVuIHRoZSBmYXVsdCB3aWxsIGhhcHBlbiBhZ2FpbiwgdGFr
aW5nIHRoZSBub3JtYWwKSEFQIGZhdWx0IHBhdGggKGNhbGxpbmcgcDJtX2FsdHAybV9sYXp5X2Nv
cHkoKSksIGF0IHdoaWNoIHBvaW50Li4uCgo+IEFuZCBhdCB0aGlzIHBvaW50LCBJIHJlYWxpemUg
dGhhdCBteSBwcmV2aW91cyBhbmFseXNpcyB3YXMgcHJvYmFibHkKPiB3cm9uZywgYmVjYXVzZSBh
dCB0aGlzIHBvaW50IGFsdHAybS0+bWF4X3JlbWFwcGVkX2dmbiB3aWxsIGJlIHdyb25nOgo+IGVu
dHJpZXMgYWJvdmUgbWF4X3JlbWFwcGVkX2dmbiB3aWxsIGhhdmUgYmVjb21lIHZhbGlkIHdpdGhv
dXQgZ29pbmcKPiB0aHJvdWdoIHAybV9hbHRwMm1fbGF6eV9jb3B5KCkuCgouLi5hbHRwMm0tPm1h
eF9yZW1hcHBlZF9nZm4gd2lsbCBiZSBzZXQgYXBwcm9wcmlhdGVseS4KCkkgdGhpbmsuIDotLwoK
IC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
