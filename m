From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/HVM: don't give the wrong impression of
 WRMSR succeeding
Date: Thu, 22 Feb 2018 14:53:45 +0000
Message-ID: <4a278c80-0009-b875-c7ec-ea3333ae83b0@citrix.com>
References: <5A8ED75E02000078001AA6A4@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=i0y4=fq=citrix.com=prvs=5842a8f9a=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1eosGi-0008Ul-Re
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2018 14:54:44 +0000
In-Reply-To: <5A8ED75E02000078001AA6A4@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDIvMTggMTM6NDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IC4uLiBmb3IgdW5rbm93biBN
U1JzOiB3cm1zcl9oeXBlcnZpc29yX3JlZ3MoKSdzIGNvbW1lbnQgY2xlYXJseSBzYXlzCj4gdGhh
dCB0aGUgZnVuY3Rpb24gcmV0dXJucyAwIGZvciB1bnJlY29nbml6ZWQgTVNScywgc28KPiB7c3Zt
LHZteH1fbXNyX3dyaXRlX2ludGVyY2VwdCgpIHNob3VsZCBub3QgY29udmVydCB0aGlzIGludG8g
c3VjY2Vzcy4KPgo+IEF0IHRoZSB0aW1lIGl0IHdlbnQgaW4sIGNvbW1pdCAwMTNlMzRmNWE2ICgi
eDg2OiBoYW5kbGUgcGFnZWQgZ2ZuIGluCj4gd3Jtc3JfaHlwZXJ2aXNvcl9yZWdzIikgd2FzIHBy
b2JhYmx5IG9rYXksIHNpbmNlIHByaW9yIHRvIHRoYXQgdGhlCj4gcmV0dXJuIHZhbHVlIHdhc24n
dCBjaGVja2VkIGF0IGFsbC4gQnV0IHRoYXQncyBub3QgaG93IHdlIHdhbnQgdGhpbmdzCj4gdG8g
YmUgaGFuZGxlZCBub3dhZGF5cy4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KCkkgYWdyZWUgaW4gcHJpbmNpcGxlLCBidXQgdGhpcyBkb2VzIGhhdmUg
YSBsYXJnZSBwb3RlbnRpYWwgcmlzayBmb3IKZ3Vlc3RzLsKgIEFueSB1bmtub3duIE1TUiB3aGlj
aCBndWVzdHMgZG9uJ3QgY2hlY2sgZm9yICNHUCBmYXVsdHMgZnJvbQp3aWxsIG5vdyBjYXVzZSB0
aGUgZ3Vlc3RzIHRvIGNyYXNoLgoKVGhhdCBzYWlkLCBpdCBpcyB0aGUgY29ycmVjdCBkaXJlY3Rp
b24gdG8gZ28gbG9uZy10ZXJtLCBhbmQgd2UndmUgZ290IHRvCnRocm93IHRoZSBzd2l0Y2ggc29t
ZSB0aW1lLCBidXQgSSBleHBlY3QgdGhpcyB3aWxsIGNhdXNlIHByb2JsZW1zIGluIHRoZQpzaG9y
dCB0ZXJtLCBlc3BlY2lhbGx5IGZvciBtaWdyYXRlZC1pbiBndWVzdHMuCgpBcyBmb3IgdGhlIG1h
a2luZyB0aGlzIGNoYW5nZSwgdGhlcmUgaXMgYSBiZXR0ZXIgd2F5IG9mIGRvaW5nIGl0IGJ5Cm1v
dmluZyB2aXJpZGlhbiBhbmQgWGVuIE1TUiBoYW5kaW5nIGludG8gdGhlIG5ldyBndWVzdF97cmQs
d3J9bXNyKCkKaW5mcmFzdHJ1Y3R1cmUsIHdoaWNoIG1lYW5zIHdlIHdvbid0IGNhbGwgaW50byBi
b3RoIG9mIHRoZXNlIHN1YnN5c3RlbXMKZm9yIGV2ZXJ5IHVua25vd24gTVNSLgoKSSd2ZSBhbHJl
YWR5IGdvdCBoYWxmIGEgcGF0Y2ggdG8gZG8gdGhpcyBmcm9tIHRoZSBwZW5kaW5nIENQVUlEL01T
UiB3b3JrCndoaWNoIEkgY2FuIGR1c3Qgb2ZmLCBpZiB5b3UgbGlrZT8KCn5BbmRyZXcKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
