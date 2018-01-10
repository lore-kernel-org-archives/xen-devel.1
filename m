From: Mike Latimer <mlatimer@suse.com>
Subject: Re: Radical proposal: ship not-fully-tidied shim as
 4.10.1
Date: Tue, 9 Jan 2018 18:39:30 -0700
Message-ID: <59b4fae2-d964-fca4-1308-28ce2789f0ba@suse.com>
References: <23123.44604.284781.889416@mariner.uk.xensource.com>
 <4F771D10-4A3C-4F73-B02C-CDFB211A0A75@gmail.com>
 <CAFLBxZbsNZR5h1a9aCHZwMs7xiq6_qOs+2Ptj4A7qWTtNqE6iA@mail.gmail.com>
 <alpine.DEB.2.10.1801090821190.4603@sstabellini-ThinkPad-X260>
 <CA+aC4kuWr00CmQeLAh0szYZDdNRCWBLSqu65TaQ1hBWTuXcnFA@mail.gmail.com>
 <20180109175846.3izmznnjqdkjoyzy@citrix.com>
 <20180109205732.GA23932@ued668862963453.ant.amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=s+p0=ef=suse.com=mlatimer@srs-us1.protection.inumbo.net>)
 id 1eZ5Mh-0000zg-F7
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2018 01:39:39 +0000
In-Reply-To: <20180109205732.GA23932@ued668862963453.ant.amazon.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Matt Wilson <msw@amzn.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Anthony Liguori <anthony@codemonkey.ws>, George Dunlap <dunlapg@umich.edu>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, committers@xenproject.org, security@xenproject.org, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDkvMjAxOCAwMTo1NyBQTSwgTWF0dCBXaWxzb24gd3JvdGU6Cj4gTGV0IG1lIGtub3cg
aWYgeW91IG5lZWQgYW55IGhlbHAgd2l0aCB0aGUgc2lkZWNhciBzY3JpcHQuIEdlbmVyYWxseQo+
IGl0J3Mgc3RyYWlnaHRmb3J3YXJkIGVub3VnaCB0byBidWlsZCBzbyBJJ20gc3VyZSB5b3Ugd29u
J3QgaGF2ZSBhbnkKPiB0cm91YmxlLiBIZXJlJ3Mgb25lIHRoYXQgSSB1c2VkIGZvciBsb2NhbCB0
ZXN0aW5nIG9uIG15IGxhcHRvcCBpbiBhCj4gQ2VudE9TLWlzaCBjaHJvb3QgKHdlIGhhdmUgb3Ro
ZXIgYml0cyByZXNwb25zaWJsZSBmb3IgdGhpcyBpbgo+IEVDMikuCgpUaGFua3MgZm9yIHBvc3Rp
bmcgdGhlIHNjcmlwdC4gSXQncyBiZWVuIGhlbHBmdWwgdG8gYWRkcmVzcyBzb21lCm91dHN0YW5k
aW5nIHF1ZXN0aW9ucyBhYm91dCB0aGlzIGFkdmVudHVyZS4gT25lIHBvaW50IHRoYXQgSSdtIHN0
aWxsCndvbmRlcmluZyBhYm91dCBpcyB0aGUga2VybmVsIGFuZCBpbml0cmQgdGhhdCBhcmUgYWRk
ZWQgdG8gdGhpcyBzaWRlY2FyCklTTy4gU2hvdWxkIHRoZXNlIG1hdGNoIHRoZSBrZXJuZWwgYW5k
IGluaXRyZCBvZiB0aGUgaG9zdCAoZG9tMCksIG9yIHRoZQprZXJuZWwgYW5kIGluaXRyZCBvZiB0
aGUgZ3Vlc3Q/IElmIGl0J3MgdGhlIGd1ZXN0LCBJIGd1ZXNzIHRoZXJlIHdpbGwKKHBvdGVudGlh
bGx5KSBiZSBhIDE6MSByYXRpbyBvZiBzaWRlY2FyIElTT3MgdG8gZ3Vlc3RzPwoKSSB1bmRlcnN0
YW5kIHRoZSBzY3JpcHQgaXMganVzdCBhbiBleGFtcGxlLCBidXQgb25lIGVycm9yIGlzIHdvcnRo
CnBvaW50aW5nIG91dDoKPiAgUGxlYXNlIGV4Y3VzZSB0aGUgY3J1ZnQsIGluY2x1ZGluZyB0aGUg
dXNlIG9mIGxlZ2FjeSBHUlVCLgo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSA4PCAtLS0tLS0t
LS0tLS0tLS0tLS0tCj4gIyEvYmluL2Jhc2gKPiBpZiBbICQjIC1sdCAyIF07IHRoZW4KPiAgICAg
ZWNobyAidXNhZ2U6ICQwIHhlbi5neiBrZXJuZWwuZ3ogW2luaXRyZC5pbWddIgo+ICAgICBleGl0
IDEKPiBmaQo+Cj4gaWYgWyAkIyAtZXEgMyBdOyB0aGVuCj4gICAgIElOSVRSRD0kMgoKICAgIElO
SVRSRD0kMwoKPiBmaQoKVGhhbmtzLApNaWtlCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
