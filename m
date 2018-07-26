From: George Dunlap <dunlapg@umich.edu>
Subject: Re: [Memory Accounting] was: Re: PVH dom0 creation
 fails - the system freezes
Date: Thu, 26 Jul 2018 15:44:07 +0100
Message-ID: <CAFLBxZb+kT1xGRiZZyx+Vq56ND6U1c5ke_TYCTd6mB=X2HLToA@mail.gmail.com>
References: <88eaaa06-24c9-d474-c40a-f37bafe1ad67@amazon.com>
 <20180725133530.235csakkjrz6y5yr@mac.bytemobile.com>
 <3db42ec0-8542-1bea-ffee-0ac5dc4d7277@suse.com>
 <20180725140237.pjjzeaibcdo2ov7j@citrix.com>
 <9f85c7af-1115-6888-da0d-d5f93376939f@amazon.com>
 <20180725161210.qm3kmcw6ylfbycfk@mac.bytemobile.com>
 <3b825085-6fb2-6204-4eff-eaad8059f1d2@suse.com>
 <b0d37c05-3438-477b-3bd6-63e01e70de62@citrix.com>
 <76c92f25-9d0b-e317-ba9b-80c6f7d6dd64@oracle.com>
 <CAFLBxZY3+TeiP9m_ikA_m3a7q6qhSjP2YqfHzs9DnoYrATKb_A@mail.gmail.com>
 <20180726111145.za7enqdukb6kq4iz@mac.bytemobile.com>
 <b66e5e1c-5c56-9eda-562e-768763d0df78@suse.com>
 <CAFLBxZYPe-TLc-JHwDVGsuj8ZRvRRwyh7UW+-5Vf6ukCrj+wxw@mail.gmail.com>
 <de497eb0-bf06-f5b1-c8c9-7f0f23dd9b08@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=kwtj=kk=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1fihUv-0006XH-Fd
 for xen-devel@lists.xenproject.org; Thu, 26 Jul 2018 14:44:09 +0000
Received: by mail-qk0-x242.google.com with SMTP id u21-v6so1152430qku.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jul 2018 07:44:08 -0700 (PDT)
In-Reply-To: <de497eb0-bf06-f5b1-c8c9-7f0f23dd9b08@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>, abelgun@amazon.com, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, David Woodhouse <dwmw2@infradead.org>, bercarug@amazon.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKdWwgMjYsIDIwMTggYXQgMToxOSBQTSwgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPiB3cm90ZToKPiBPbiAyNi8wNy8xOCAxMzoyNywgR2VvcmdlIER1bmxhcCB3cm90ZToK
Pj4gT24gVGh1LCBKdWwgMjYsIDIwMTggYXQgMTI6MjIgUE0sIEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4gd3JvdGU6Cj4+PiBJIGJlbGlldmUgdGhlIHJpZ2h0IHdheSB3b3VsZCBiZSB0
byBkZXNpZ24gYSBwcm9wZXIgYmFsbG9vbmluZyBpbnRlcmZhY2UKPj4+IHN1aXRhYmxlIGZvciBh
bGwga2luZHMgb2YgZ3Vlc3RzIGZyb20gc2NyYXRjaC4gVGhpcyBzaG91bGQgaW5jbHVkZSBob3cK
Pj4+IHRvIGRlYWwgd2l0aCBob3RwbHVnIG9mIG1lbW9yeSBvciBib290aW5nIHdpdGggbWVtIDwg
bWVtX21heC4gV2hldGhlcgo+Pj4gUG9EIHNob3VsZCBiZSBpbmNsdWRlZCBzaG91bGQgYmUgZGlz
Y3Vzc2VkLCB0b28uCj4+Cj4+IEp1ZXJnZW4sIHdoYXQgZG8geW91IHRoaW5rIG9mIHRoaXMgaW50
ZXJmYWNlOiAgVGhlIHRvb2xzdGFjayBsb29rcyBhdAo+PiBhbGwgdGhlIGF2YWlsYWJsZSBpbmZv
cm1hdGlvbiBhYm91dCB0aGUgZ3Vlc3QgYW5kIGRldGVybWluZXMgd2hhdCBzaXplCj4+IHRoZSBn
dWVzdCdzIGJhbGxvb24gbmVlZHMgdG8gYmUuICBJdCB0aGVuIHdyaXRlcwo+PiBtZW1vcnkvdGFy
Z2V0X2JhbGxvb25fc2l6ZS4gIFRoZSBndWVzdCBiYWxsb29uIGRyaXZlciBzaW1wbHkgYXR0ZW1w
dHMKPj4gdG8gYWxsb2NhdGUgLyBmcmVlIG1lbW9yeSB0byBtYWtlIHRoZSBiYWxsb29uIHRoYXQg
c2l6ZS4KPgo+IFRoaXMgc2hvdWxkIGJlIHBlciBudW1hIG5vZGUuIFNvIG1lbW9yeS9ub2RlPG4+
L3RhcmdldC1iYWxsb29uLXNpemUKPiAoSSBkb24ndCBsaWtlIHRoZSB1bmRlcnNjb3JlcyBpbiB0
aGUgbm9kZSBuYW1lKS4KClRoaXMgc2hvdWxkIGJlIHZub2RlIHRoZW4sIHRvIGVtcGhhc2l6ZSB0
aGF0IGl0J3MgYSBub2RlIGZyb20gdGhlCipndWVzdCdzKiBwZXJzcGVjdGl2ZSwgbm90IHRoZSBo
b3N0J3MgcGVyc3BlY3RpdmUuCgogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
