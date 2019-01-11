From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH RFC v2 2/2] x86/emulate: Send vm_event from
 emulate
Date: Fri, 11 Jan 2019 13:51:47 -0700
Message-ID: <CABfawh=HQkQ6ek28fiiA6DRDm_wceo10W8VQU=84LsLNJMcd1A@mail.gmail.com>
References: <20190111153657.13532-1-aisaila@bitdefender.com>
 <20190111153657.13532-2-aisaila@bitdefender.com>
 <CABfawhmTDkezeEp8QTS8Az88O3qDGuK1EfA1Yf2xK0UUGzzXoA@mail.gmail.com>
 <dfe5b0cf-8d85-4941-d007-430a8f72eb7f@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1v5S=PT=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1gi3n1-0004LF-Vx
 for xen-devel@lists.xenproject.org; Fri, 11 Jan 2019 20:52:28 +0000
Received: by mail-ed1-f68.google.com with SMTP id h15so14139646edb.4
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jan 2019 12:52:25 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51])
 by smtp.gmail.com with ESMTPSA id z39sm2713798edb.81.2019.01.11.12.52.24
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 11 Jan 2019 12:52:24 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id f188so3603606wmf.5
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jan 2019 12:52:24 -0800 (PST)
In-Reply-To: <dfe5b0cf-8d85-4941-d007-430a8f72eb7f@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "paul.durrant@citrix.com" <paul.durrant@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, Alexandru Stefan ISAILA <aisaila@bitdefender.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMTEsIDIwMTkgYXQgOTo1MSBBTSBSYXp2YW4gQ29qb2NhcnUKPHJjb2pvY2Fy
dUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+Cj4gT24gMS8xMS8xOSA2OjM4IFBNLCBUYW1hcyBL
IExlbmd5ZWwgd3JvdGU6Cj4gPiBPbiBGcmksIEphbiAxMSwgMjAxOSBhdCA4OjM3IEFNIEFsZXhh
bmRydSBTdGVmYW4gSVNBSUxBCj4gPiA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+
ID4+Cj4gPj4gVGhpcyBwYXRjaCBhaW1zIHRvIGhhdmUgbWVtIGFjY2VzcyB2bSBldmVudHMgc2Vu
dCBmcm9tIHRoZSBlbXVsYXRvci4KPiA+PiBUaGlzIGlzIHVzZWZ1bCBpbiB0aGUgY2FzZSBvZiBw
YWdlLXdhbGtzIHRoYXQgaGF2ZSB0byBlbXVsYXRlCj4gPj4gaW5zdHJ1Y3Rpb25zIGluIGFjY2Vz
cyBkZW5pZWQgcGFnZXMuCj4gPj4KPiA+Cj4gPiBJJ20gYSBsaXR0bGUgY29uZnVzZWQgYWJvdXQg
dGhlIHNjZW5hcmlvIHlvdSBtZW50aW9uIGhlcmUuIFlvdSBtYXJrCj4gPiBwYWdlcyB3aGVyZSB0
aGUgcGFnZXRhYmxlcyBhcmUgbm9uLXJlYWRhYmxlL3dyaXRhYmxlIGluIEVQVCBhbmQgeW91Cj4g
PiBleHBlY3QgdGhlIGVtdWxhdGVkIGluc3RydWN0aW9uIHdvdWxkIGFsc28gdmlvbGF0ZSBhY2Nl
c3MgcGVybWlzc2lvbnMKPiA+IG9mIHRoZSBndWVzdCBwYWdldGFibGUgaXRzZWxmPwo+Cj4gSGVs
bG8gVGFtYXMsCj4KPiBUaGUgc2NlbmFyaW8gaXMgdGhpczogdGhlIHBhZ2V0YWJsZXMgYXJlIHJl
YWQtb25seS4gQXQgc29tZSBwb2ludCwgYQo+IHdhbGsgdHJpZXMgdG8gd3JpdGUgdGhlIGFjY2Vz
c2VkIGJpdCwgb3IgdGhlIGRpcnR5IGJpdCBzb21ld2hlcmUgaW4gdGhhdAo+IHJlYWQtb25seSBt
ZW1vcnksIGNhdXNpbmcgYW4gRVBUIGZhdWx0LCBzbyB3ZSBlbmQgdXAgaW4KPiBwMm1fbWVtX2Fj
Y2Vzc19jaGVjaygpLgo+Cj4gVW5kZXJzdGFuZGFibHksIHdlIGRvbid0IGNhcmUgYWJvdXQgc2Vu
ZGluZyB0aGlzIGV2ZW50IG91dCB0byB0aGUKPiBpbnRyb3NwZWN0aW9uIGFwcGxpY2F0aW9uICh3
ZSBjb3VsZCBpZiB3ZSB3YW50ZWQgdG8sIHdoaWNoIGlzIHdoeSB0aGlzCj4gYmVoYXZpb3VyIGlz
IGNvbmZpZ3VyYWJsZSwgYnV0IEkgdGhpbmsgaXQncyBzYWZlIHRvIHNheSB0aGF0IGZvciBtb3N0
Cj4gaW50cm9zcGVjdGlvbiB1c2UtY2FzZXMgdGhpcyBpcyBzb21ldGhpbmcgd2UgZG9uJ3QgY2Fy
ZSBhYm91dCwgYW5kIGhlbmNlCj4gYSBwZXJmZWN0IG9wcG9ydHVuaXR5IGZvciBvcHRpbWl6YXRp
b24pLgo+Cj4gTm93LCBlbXVsYXRpbmcgdGhlIGN1cnJlbnQgaW5zdHJ1Y3Rpb24gaGVscHMsIGFu
ZCBpdCB3b3Jrcy4gQnV0LCB3aGF0IGlmCj4gdGhhdCBpbnN0cnVjdGlvbiB3b3VsZCBoYXZlIHRy
aWVkIHRvIHdyaXRlIHRvIGFub3RoZXIgcHJvdGVjdGVkIHBhZ2U/Cj4gRW11bGF0aW5nIGl0LCBh
cyB0aGluZ3Mgc3RhbmQgbm93LCBtZWFucyB0aGF0IHdlIHdpbGwgbG9zZSBfdGhhdF8gZXZlbnQs
Cj4gYW5kIHRoYXQncyBwb3RlbnRpYWxseSBhIHZlcnkgaW1wb3J0YW50IEVQVCBldmVudC4KPgo+
IFdlJ3ZlIHRyaWVkIHRvIGF0dGFjayB0aGlzIHByb2JsZW0gYnkgb25seSB3cml0aW5nIHRoZSBB
L0QgYml0cyBhbmQKPiBhbG1vc3QgY2FtZSB0byBhIHNhdGlzZmFjdG9yeSBzb2x1dGlvbiBidXQg
dGhlcmUncyBzdGlsbCBzb21lIGRlYmF0ZSBvbgo+IHdoZXRoZXIgaXQncyBhcmNoaXRlY3R1cmFs
bHkgY29ycmVjdCBvciBub3QgLSB0aGF0IGFwcHJvYWNoIG5lZWRzIG1vcmUKPiBzdHVkeWluZy4K
Pgo+IFRoZSBhbHRlcm5hdGl2ZSB3ZSd2ZSBjb21lIHVwIHdpdGggaXMgdG8gaW5zdGVhZCwgYXQg
bGVhc3QgZm9yIHRoZSB0aW1lCj4gYmVpbmcsIGF0dGVtcHQgdG8gc2VuZCBvdXQgdm1fZXZlbnRz
IGZyb20gdGhlIGVtdWxhdG9yIGNvZGUgb25seSBpbiB0aGlzCj4gY2FzZTogd2hlcmUgd2Ugd2Fu
dCB0byBlbXVsYXRlIHRoZSBwYWdlIHdhbGsgd2l0aG91dCBjb25zdWx0aW5nIHRoZSBFUFQsCj4g
YnV0IHdhbnQgdG8gY29uc3VsdCBpdCB3aGVuIGFjdHVhbGx5IGVtdWxhdGluZyB0aGUgY3VycmVu
dCBpbnN0cnVjdGlvbi4KPgo+IEkgaG9wZSB0aGF0IG1hZGUgc2Vuc2UuCgpJJ20gc3RpbGwgY29u
ZnVzZWQgOikgSW4gdGhlIHBhZ2V0YWJsZSB3YWxraW5nIGNhc2UsIGRpZG4ndCB0aGUKaW5zdHJ1
Y3Rpb24geW91IGFyZSBlbXVsYXRpbmcganVzdCB0cmlwIGJ5IHdyaXRpbmcgdG8gYSBwYWdlIHlv
dSB3YW50CnRvIGFsbG93IGl0IHdyaXRpbmcgdG8gKHRoZSBBL0QgYml0cyk/IE9yIGFyZSB5b3Ug
c2F5aW5nIHRoZXJlIGlzIGFuCnVucmVsYXRlZCB0cmFwIGhhcHBlbmluZyB3aXRoIGFuIGV4ZWN1
dGUtdmlvbGF0aW9uIGJ1dCB5b3UgZG9uJ3Qga25vdwp3aGF0IG90aGVyIHdyaXRlLXByb3RlY3Rl
ZCBwYWdlIGl0IHdvdWxkIGhhdmUgdHJpcHBlZCBpZiBpdCBhY3R1YWxseQpleGVjdXRlZCwgYW5k
IGJ5IGVtdWxhdGluZyB5b3UgZWZmZWN0aXZlbHkgbWlzcyB0aGF0IHdyaXRlIGV2ZW50PyBUaGUK
bGF0dGVyIG1ha2VzIHNlbnNlLCBpdCdzIHRoZSBwYWdldGFibGUgd2Fsa2luZyBjYXNlIEkgaGF2
ZSBhIGhhcmQgdGltZQpwdXR0aW5nIHRvZ2V0aGVyLgoKVGFtYXMKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
