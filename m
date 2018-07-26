From: George Dunlap <dunlapg@umich.edu>
Subject: Re: [Memory Accounting] was: Re: PVH dom0 creation
 fails - the system freezes
Date: Thu, 26 Jul 2018 12:27:59 +0100
Message-ID: <CAFLBxZYPe-TLc-JHwDVGsuj8ZRvRRwyh7UW+-5Vf6ukCrj+wxw@mail.gmail.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=kwtj=kk=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1fieR7-0007HL-NP
 for xen-devel@lists.xenproject.org; Thu, 26 Jul 2018 11:28:01 +0000
Received: by mail-qk0-x236.google.com with SMTP id t79-v6so727314qke.4
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jul 2018 04:28:00 -0700 (PDT)
In-Reply-To: <b66e5e1c-5c56-9eda-562e-768763d0df78@suse.com>
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

T24gVGh1LCBKdWwgMjYsIDIwMTggYXQgMTI6MjIgUE0sIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4gd3JvdGU6Cj4gSSBiZWxpZXZlIHRoZSByaWdodCB3YXkgd291bGQgYmUgdG8gZGVz
aWduIGEgcHJvcGVyIGJhbGxvb25pbmcgaW50ZXJmYWNlCj4gc3VpdGFibGUgZm9yIGFsbCBraW5k
cyBvZiBndWVzdHMgZnJvbSBzY3JhdGNoLiBUaGlzIHNob3VsZCBpbmNsdWRlIGhvdwo+IHRvIGRl
YWwgd2l0aCBob3RwbHVnIG9mIG1lbW9yeSBvciBib290aW5nIHdpdGggbWVtIDwgbWVtX21heC4g
V2hldGhlcgo+IFBvRCBzaG91bGQgYmUgaW5jbHVkZWQgc2hvdWxkIGJlIGRpc2N1c3NlZCwgdG9v
LgoKSnVlcmdlbiwgd2hhdCBkbyB5b3UgdGhpbmsgb2YgdGhpcyBpbnRlcmZhY2U6ICBUaGUgdG9v
bHN0YWNrIGxvb2tzIGF0CmFsbCB0aGUgYXZhaWxhYmxlIGluZm9ybWF0aW9uIGFib3V0IHRoZSBn
dWVzdCBhbmQgZGV0ZXJtaW5lcyB3aGF0IHNpemUKdGhlIGd1ZXN0J3MgYmFsbG9vbiBuZWVkcyB0
byBiZS4gIEl0IHRoZW4gd3JpdGVzCm1lbW9yeS90YXJnZXRfYmFsbG9vbl9zaXplLiAgVGhlIGd1
ZXN0IGJhbGxvb24gZHJpdmVyIHNpbXBseSBhdHRlbXB0cwp0byBhbGxvY2F0ZSAvIGZyZWUgbWVt
b3J5IHRvIG1ha2UgdGhlIGJhbGxvb24gdGhhdCBzaXplLgoKV2UnbGwgaGF2ZSB0byBsZWF2ZSBt
ZW1vcnkvdGFyZ2V0IGhhbmRsaW5nIGFzIGlzIHVudGlsIGFsbCBvbGQKdmVyc2lvbnMgb2YgdGhl
IGJhbGxvb24gZHJpdmVyIGRpc2FwcGVhci4KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
