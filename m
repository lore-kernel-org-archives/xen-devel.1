From: Juergen Gross <jgross@suse.com>
Subject: Re: [Memory Accounting] was: Re: PVH dom0 creation
 fails - the system freezes
Date: Thu, 26 Jul 2018 14:19:47 +0200
Message-ID: <de497eb0-bf06-f5b1-c8c9-7f0f23dd9b08@suse.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ri59=kk=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fifFK-0002bF-EK
 for xen-devel@lists.xenproject.org; Thu, 26 Jul 2018 12:19:54 +0000
In-Reply-To: <CAFLBxZYPe-TLc-JHwDVGsuj8ZRvRRwyh7UW+-5Vf6ukCrj+wxw@mail.gmail.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <dunlapg@umich.edu>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>, abelgun@amazon.com, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, David Woodhouse <dwmw2@infradead.org>, bercarug@amazon.com
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMDcvMTggMTM6MjcsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gT24gVGh1LCBKdWwgMjYs
IDIwMTggYXQgMTI6MjIgUE0sIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4gd3JvdGU6
Cj4+IEkgYmVsaWV2ZSB0aGUgcmlnaHQgd2F5IHdvdWxkIGJlIHRvIGRlc2lnbiBhIHByb3BlciBi
YWxsb29uaW5nIGludGVyZmFjZQo+PiBzdWl0YWJsZSBmb3IgYWxsIGtpbmRzIG9mIGd1ZXN0cyBm
cm9tIHNjcmF0Y2guIFRoaXMgc2hvdWxkIGluY2x1ZGUgaG93Cj4+IHRvIGRlYWwgd2l0aCBob3Rw
bHVnIG9mIG1lbW9yeSBvciBib290aW5nIHdpdGggbWVtIDwgbWVtX21heC4gV2hldGhlcgo+PiBQ
b0Qgc2hvdWxkIGJlIGluY2x1ZGVkIHNob3VsZCBiZSBkaXNjdXNzZWQsIHRvby4KPiAKPiBKdWVy
Z2VuLCB3aGF0IGRvIHlvdSB0aGluayBvZiB0aGlzIGludGVyZmFjZTogIFRoZSB0b29sc3RhY2sg
bG9va3MgYXQKPiBhbGwgdGhlIGF2YWlsYWJsZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUgZ3Vlc3Qg
YW5kIGRldGVybWluZXMgd2hhdCBzaXplCj4gdGhlIGd1ZXN0J3MgYmFsbG9vbiBuZWVkcyB0byBi
ZS4gIEl0IHRoZW4gd3JpdGVzCj4gbWVtb3J5L3RhcmdldF9iYWxsb29uX3NpemUuICBUaGUgZ3Vl
c3QgYmFsbG9vbiBkcml2ZXIgc2ltcGx5IGF0dGVtcHRzCj4gdG8gYWxsb2NhdGUgLyBmcmVlIG1l
bW9yeSB0byBtYWtlIHRoZSBiYWxsb29uIHRoYXQgc2l6ZS4KClRoaXMgc2hvdWxkIGJlIHBlciBu
dW1hIG5vZGUuIFNvIG1lbW9yeS9ub2RlPG4+L3RhcmdldC1iYWxsb29uLXNpemUKKEkgZG9uJ3Qg
bGlrZSB0aGUgdW5kZXJzY29yZXMgaW4gdGhlIG5vZGUgbmFtZSkuCgpXaGVuIGFkZGluZyBub2Rl
IHNwZWNpZmljIG1lbW9yeSBob3RwbHVnIHRoaXMgc2NoZW1lIGNvdWxkIGJlIHVzZWQKZm9yIHRo
YXQgcHVycG9zZSwgdG9vLgoKU28gYW55IG1lbW9yeSBob3RwbHVnZ2VkIHdpbGwgaW1tZWRpYXRl
bHkgYmUgdXNlZCBieSB0aGUgZ3Vlc3QuCgpUaGF0J3MganVzdCBzdGF0aW5nIGEgZmFjdCwgbm8g
Y3JpdGljaXNtLgoKPiBXZSdsbCBoYXZlIHRvIGxlYXZlIG1lbW9yeS90YXJnZXQgaGFuZGxpbmcg
YXMgaXMgdW50aWwgYWxsIG9sZAo+IHZlcnNpb25zIG9mIHRoZSBiYWxsb29uIGRyaXZlciBkaXNh
cHBlYXIuCgpTdXJlLgoKSSdkIGxpa2UgdGhlIGd1ZXN0IHRvIHdyaXRlIHhlbnN0b3JlIG5vZGUK
Y29udHJvbC9mZWF0dXJlLXBlci1ub2RlLW1lbW9yeSB0byBpbmRpY2F0ZSBpdCB3aWxsIHVzZSB0
aGUgbmV3Cm5vZGUocykgaW5zdGVhZCBvZiB0aGUgbWVtb3J5L3RhcmdldCBub2RlLgoKCkp1ZXJn
ZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
