From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V4] x86/hvm: fix domain crash when CR3 has
 the noflush bit set
Date: Wed, 14 Feb 2018 17:39:11 +0200
Message-ID: <4af3acbb-d547-fa7b-d87f-c683d8ea81d5@bitdefender.com>
References: <1518174113-2567-1-git-send-email-rcojocaru@bitdefender.com>
 <CABfawhkY9eMeOT3759CPTT14PjFFp0xgVekeo7jL3AP6eavC5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CABfawhkY9eMeOT3759CPTT14PjFFp0xgVekeo7jL3AP6eavC5g@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bitweasil <bitweasil@cryptohaze.com>, Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMTQvMjAxOCAwNTozNSBQTSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIEZyaSwg
RmViIDksIDIwMTggYXQgNDowMSBBTSwgUmF6dmFuIENvam9jYXJ1Cj4gPHJjb2pvY2FydUBiaXRk
ZWZlbmRlci5jb20+IHdyb3RlOgo+PiBUaGUgZW11bGF0aW9uIGxheWVycyBvZiBYZW4gbGFjayBQ
Q0lEIHN1cHBvcnQsIGFuZCBhcyB3ZSBvbmx5IG9mZmVyCj4+IFBDSUQgdG8gSEFQIGd1ZXN0cywg
YWxsIHdyaXRlcyB0byBDUjMgYXJlIGhhbmRsZWQgYnkgaGFyZHdhcmUsCj4+IGV4Y2VwdCB3aGVu
IGludHJvc3BlY3Rpb24gaXMgaW52b2x2ZWQuIENvbnNlcXVlbnRseSwgdHJ5aW5nIHRvIHNldAo+
PiBDUjMgd2hlbiB0aGUgbm9mbHVzaCBiaXQgaXMgc2V0IGluIGh2bV9zZXRfY3IzKCkgbGVhZHMg
dG8gZG9tYWluCj4+IGNyYXNoZXMuIFRoZSB3b3JrYXJvdW5kIGlzIHRvIGNsZWFyIHRoZSBub2Zs
dXNoIGJpdCBpbgo+PiBodm1fc2V0X2NyMygpLiBDUjMgdmFsdWVzIGluIGh2bV9tb25pdG9yX2Ny
KCkgYXJlIGFsc28gc2FuaXRpemVkLgo+PiBBZGRpdGlvbmFsbHksIGEgYm9vbCBwYXJhbWV0ZXIg
bm93IHByb3BhZ2F0ZXMgdG8KPj4ge3N2bSx2bXh9X3VwZGF0ZV9ndWVzdF9jcigpLCBzbyB0aGF0
IG5vIGZsdXNoZXMgb2NjdXIgd2hlbgo+PiB0aGUgYml0IHdhcyBzZXQuCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KPj4gUmVw
b3J0ZWQtYnk6IEJpdHdlYXNpbCA8Yml0d2Vhc2lsQGNyeXB0b2hhemUuY29tPgo+PiBTdWdnZXN0
ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gCj4gQWNr
ZWQtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KClRoYW5rcyEKClJh
enZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
