From: George Dunlap <dunlapg@umich.edu>
Subject: Re: Upping gcc requirement for x86
Date: Thu, 29 Mar 2018 18:33:02 +0100
Message-ID: <CAFLBxZY4vOSSzRdki5opM5p7=s3kbY690UkGJwcovRDea37RFw@mail.gmail.com>
References: <20180329154523.nvxkzn5rhetphwki@citrix.com>
 <CAFLBxZZJX1DPv-M8n_CDFf7OWfxmBwtXC9eDQb_WRXz9V5TYyA@mail.gmail.com>
 <20180329171025.p7b4v4qppt7puqtj@citrix.com>
 <CAFLBxZYhonk-Q8CQ1i8y5S38xHXRYmnS0TgW2OZjFFSxX7QBrw@mail.gmail.com>
 <20180329172006.ts3nh32dwda7oq5o@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vfqb=gt=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1f1bQA-0007wt-02
 for xen-devel@lists.xenproject.org; Thu, 29 Mar 2018 17:33:06 +0000
Received: by mail-qt0-x241.google.com with SMTP id d3so3684426qth.8
 for <xen-devel@lists.xenproject.org>; Thu, 29 Mar 2018 10:33:03 -0700 (PDT)
In-Reply-To: <20180329172006.ts3nh32dwda7oq5o@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Olaf Hering <olaf@aepfle.de>, Doug Goldstein <cardoe@cardoe.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXIgMjksIDIwMTggYXQgNjoyMCBQTSwgV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4
LmNvbT4gd3JvdGU6Cj4gT24gVGh1LCBNYXIgMjksIDIwMTggYXQgMDY6MTQ6MDhQTSArMDEwMCwg
R2VvcmdlIER1bmxhcCB3cm90ZToKPj4gT24gVGh1LCBNYXIgMjksIDIwMTggYXQgNjoxMCBQTSwg
V2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4+ID4gT24gVGh1LCBNYXIgMjks
IDIwMTggYXQgMDY6MDU6NTdQTSArMDEwMCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4gPj4gT24g
VGh1LCBNYXIgMjksIDIwMTggYXQgNDo0NSBQTSwgV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNv
bT4gd3JvdGU6Cj4+ID4+ID4gSGkgYWxsCj4+ID4+ID4KPj4gPj4gPiBTZWFiaW9zIGhhcyBidW1w
ZWQgdGhlaXIgcmVxdWlyZW1lbnQgdG8gNC42IChyZWxlYXNlZCA3IHllYXJzIGFnbykuIFdlCj4+
ID4+ID4gZWl0aGVyIG5lZWQgdG8gYnVtcCBvdXIgdG9vIG9yIGhhdmUgYSBzZXBhcmF0ZSBlbnRy
eSBmb3Igc2VhYmlvcy4KPj4gPj4KPj4gPj4gUkhFTCAvIENlbnRPUyA2IGFyZSBzdGlsbCBzdXBw
b3J0ZWQsIGFuZCB0aGV5IGNvbWUgd2l0aCBHQ0MgNC40Lgo+PiA+Cj4+ID4gV2hlcmUgaXMgdGhp
cyBsaXN0ZWQgaW4geGVuLmdpdD8gU3VwcG9ydGVkIGluIHdoYXQgc2Vuc2U/Cj4+Cj4+IFNvcnJ5
LCBJIHJlYWxpemVkIHRoaXMgd2FzIGFtYmlndW91cyBqdXN0IGEgbWludXRlIGFnby4gIEkgbWVh
bnQsCj4+IHRoZXkncmUgbm90IEVPTCB5ZXQgLS0gdGhlIGRpc3RyaWJ1dGlvbnMgYXJlIHN0aWxs
ICJhY3RpdmUiIGFzIGl0Cj4+IHdlcmUuICAoQXMgb3Bwb3NlZCB0bywgc2F5LCBSSEVMIC8gQ2Vu
dE9TIDUsIHdoaWNoIGlzIEVPTC4pCj4+Cj4+IEkgdGhpbmsgaXQgbWFrZXMgc2Vuc2UgZm9yIHVz
IGFzIGEgcHJvamVjdCB0byB0cnkgdG8gc3VwcG9ydAo+PiBkaXN0cmlidXRpb25zIHdoaWNoIGFy
ZSBzdGlsbCBiZWluZyBnaXZlbiBhY3RpdmUgc3VwcG9ydC4KPgo+IFJpZ2h0LiBJIHRoaW5rIHRo
YXQgbWFrZXMgc2Vuc2UsIGJ1dCBkb2VzIGl0IGFjdHVhbGx5IHdvcmsgbGlrZSB0aGF0IGluCj4g
cHJhY3RpY2U/Cj4KPiBFeGlzdGluZyBYZW4gcGFja2FnZXMgYXJlbid0IHJlYWxseSBnb2luZyB0
byBnZXQgYSBuZXdlciBYZW4sIHNvIHRoYXQncwo+IG91dCBvZiB0aGUgcGljdHVyZS4KPgo+IFdo
YXQgd2UgdHJ5IHRvIGFjaGlldmUgaGVyZSBpcyB0byBsZXQgdGhlIHVzZXJzIG9mIHRoZXNlIG9s
ZCBkaXN0cm8gYWJsZQo+IHRvIGJ1aWxkIG5ld2VyIFhlbiB0aGVtc2VsdmVzLiBCdXQgc3VwcG9z
ZSB5b3Ugd2FudCB0byBidWlsZCBhIG5ldwo+IHN5c3RlbSBhbnl3YXksIHdoeSBzdGljayB3aXRo
IGFuIG9sZCBkaXN0cm8/IFdoeSBub3QgdXNlIGEgbmV3ZXIgZGlzdHJvCj4gcmVsZWFzZSBpbnN0
ZWFkPwoKV2hvIGtub3dzIHdoeSB1c2VyIGRvIHdoYXQgdGhleSBkbz8gOi0pICBJJ20gc3VyZSB0
aGVyZSB3aWxsIGJlIHBlb3BsZQpvdXQgdGhlcmUgd2hvIGRvIGl0OyBpZiBpdCdzIG5vdCBhIHRl
cnJpYmx5IGxhcmdlIGVmZm9ydCwgSSB0aGluayB3ZQpzaG91bGQgdHJ5LiAgSXQgYnVpbGRzIGdv
b2Qgd2lsbC4KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
