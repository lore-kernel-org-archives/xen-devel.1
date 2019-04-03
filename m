From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v1] Fix p2m_set_suppress_ve
Date: Wed, 3 Apr 2019 20:07:57 +0300
Message-ID: <554186de-0981-8c3b-a1b4-e2d5bec80701@bitdefender.com>
References: <20190403142620.1224-1-aisaila@bitdefender.com>
 <5CA4C9F9020000780022450F@prv1-mh.provo.novell.com>
 <aa35ec83-77d2-ffc3-c82a-96c666f97227@bitdefender.com>
 <5CA4D1880200007800224564@prv1-mh.provo.novell.com>
 <9d608c8e-3fd8-8d26-c68d-13b2e7540fc8@bitdefender.com>
 <5CA4D9A102000078002245AB@prv1-mh.provo.novell.com>
 <CABfawhk9b8HcuC+EGQcEfZ1QqdPFOC4=Sx96EsEdFRSZUTLXdQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YZkv=SF=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hBjMp-0001O0-3A
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2019 17:08:03 +0000
In-Reply-To: <CABfawhk9b8HcuC+EGQcEfZ1QqdPFOC4=Sx96EsEdFRSZUTLXdQ@mail.gmail.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>, Jan Beulich <JBeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Alexandru Isaila <aisaila@bitdefender.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gNC8zLzE5IDc6MTYgUE0sIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiBJdCBpcyByaWdodCB0
byBmdWxseSBwb3B1bGF0ZSBhIHNsb3Qgd2hlbiBmb3IgZXhhbXBsZSB3ZSB3YW50Cj4gZGlmZmVy
ZW50IG1lbV9hY2Nlc3MgcGVybWlzc2lvbnMgaW4gZGlmZmVyZW50IGFsdHAybSB2aWV3cy4gV2Ug
Y2FuJ3QKPiB3YWl0IGZvciB0aGUgZG9tYWluIHRvIG9uLWRlbWFuZCBwb3B1bGF0ZSB0aGUgYWx0
cDJtIHZpZXcgYmVjYXVzZSB3ZQo+IGRvbid0IGtub3cgd2hlbiAoYW5kIGlmKSB0aGF0IHdpbGwg
YWN0dWFsbHkgaGFwcGVuLiBTbwo+IHAybV9zZXRfYWx0cDJtX21lbV9hY2Nlc3MgYWxyZWFkeSBj
b3BpZXMgdGhlIGVudHJ5IG92ZXIgZnJvbSB0aGUKPiBob3N0cDJtIHRvIHRoZSBhbHRwMm0gYW5k
IHRoZW4gYXBwbGllcyB0aGUgcmVxdWVzdGVkIG1lbV9hY2Nlc3MKPiBzZXR0aW5nLiBUaGlzIGlz
IGRvbmUgZXZlbiBpZiB0aGUgbWVtX2FjY2VzcyBzZXR0aW5nIGlzIHRoZSBzYW1lIGFzIGl0Cj4g
d2FzIGluIHRoZSBob3N0cDJtLgo+IAo+IERvaW5nIHRoZSBzYW1lIGJlaGF2aW9yIGZvciBwMm1f
c2V0X3N1cHByZXNzX3ZlIEkgdGhpbmsgaXMgY29uc2lzdGVudCwKPiBhbGJlaXQgeW91IGNvdWxk
IGVhc2lseSBvdmVyY29tZSB0aGUgaXNzdWUgYnkgZmlyc3Qgc2ltcGx5IHNldHRpbmcgYQo+IG1l
bV9hY2Nlc3MgcGVybWlzc2lvbiBvbiB0aGUgZ2ZuIHRvIHRyaWdnZXIgdGhlIGFmb3JlbWVudGlv
bmVkIGNvcHkgdG8KPiB0aGUgYWx0cDJtIGJlZm9yZSB5b3UgdHJ5IHRvIHNldCB0aGUgdmUgc2V0
dGluZ3MuCgpUaGF0J3Mgd2hhdCB3ZSdyZSBkb2luZyBub3csIGJ1dCBpdCB3YXNuJ3QgYXQgYWxs
IGludHVpdGl2ZSB0byBmaWd1cmUgaXQKb3V0LiBJJ2QgZXhwZWN0IHRoYXQgc2V0dGluZyB0aGUg
U1ZFIGJpdCBzaW1wbHkgd29ya3Mgd2l0aG91dAptYW5ldXZlcmluZyBzb21ldGhpbmcgZWxzZSBp
biBwbGFjZSBmaXJzdC4KCgpUaGFua3MsClJhenZhbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
