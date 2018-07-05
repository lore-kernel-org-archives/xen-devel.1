From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 07/13] libx86: Introduce a helper to
 serialise msr_{domain, vcpu}_policy objects
Date: Thu, 05 Jul 2018 02:49:16 -0600
Message-ID: <5B3DDB8C02000078001D15D0@prv1-mh.provo.novell.com>
References: <1530651326-5320-1-git-send-email-andrew.cooper3@citrix.com>
 <1530651326-5320-8-git-send-email-andrew.cooper3@citrix.com>
 <5B3C907902000078001D0EDD@prv1-mh.provo.novell.com>
 <52ee82b3-38c2-af68-0af6-fa734baf2d98@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <52ee82b3-38c2-af68-0af6-fa734baf2d98@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjA3LjE4IGF0IDE4OjU2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDQvMDcvMTggMTA6MTYsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pgo+Pj4gQEAgLTMy
NSw2ICszMjUsMTMgQEAgdHlwZWRlZiBzdHJ1Y3QgeGVuX2NwdWlkX2xlYWYgewo+Pj4gIH0geGVu
X2NwdWlkX2xlYWZfdDsKPj4+ICBERUZJTkVfWEVOX0dVRVNUX0hBTkRMRSh4ZW5fY3B1aWRfbGVh
Zl90KTsKPj4+ICAKPj4+ICt0eXBlZGVmIHN0cnVjdCB4ZW5fbXNyX2VudHJ5IHsKPj4+ICsgICAg
dWludDMyX3QgaWR4Owo+Pj4gKyAgICB1aW50MzJfdCBmbGFnczsgLyogUmVzZXJ2ZWQgTUJaLiAq
Lwo+PiAuLi4gaXQgcmVtYWlucyB1bmNsZWFyIGluIHRoaXMgcGF0Y2ggd2hvc2UgcmVzcG9uc2li
aWxpdHkgaXQgaXMgdG8gY2xlYXIgdGhpcwo+PiBmaWVsZC4gSSB3b25kZXIgd2hldGhlciBjb3B5
X21zcl90b19idWZmZXIoKSBzaG91bGQgbWFrZSBzdXJlIG9mIHRoaXMuCj4gCj4gY29weV9tc3Jf
dG9fYnVmZmVyKCkgZG9lcyBleHBsaWNpdGx5IHplcm8gdGhpcyBmaWVsZC4KPiAKPj4gKyAgICBj
b25zdCB4ZW5fbXNyX2VudHJ5X3QgZW50ID0geyAuaWR4ID0gaWR4LCAudmFsID0gdmFsIH07Cj4g
Cj4gZ3VhcmFudGVlcyB0aGF0IHRoZSBmbGFncyBmaWVsZCBpcyAwLgoKT2gsIEknbSBzb3JyeSAt
IHNvIGl0IGRvZXMuIEkgaGFkIHNlYXJjaGVkIHRoZSBwYXRjaCBmb3IgaW5zdGFuY2VzIG9mCiJm
bGFncyIgb25seSAuLi4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
