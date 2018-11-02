From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: Xen PV: Sample new PV driver for buffer sharing
 between domains
Date: Fri, 2 Nov 2018 08:47:49 +0000
Message-ID: <20181102084749.snkpmg4fjmryseww@zion.uk.xensource.com>
References: <CAC4nxbuTQ1uP6rKiCAp7hDe-ygq9LKHQw8ggVM+fOVH-VvU8Tw@mail.gmail.com>
 <d2b9cd5a-2768-60bd-07bd-2055d1490399@suse.com>
 <CAC4nxbsBox=FgCBx5KwkkvCHwyX2MvBGoGpa1sDyS2cF0itT=Q@mail.gmail.com>
 <074697de-7265-a1fb-2970-4128a58f09ca@arm.com>
 <CAC4nxbuY0vJd8o6Vj9E14m2-sw3JZ5Spbiz3vbq2K0RQhK9p3w@mail.gmail.com>
 <c6724ce1-086f-3492-2c39-8192542ff5d8@arm.com>
 <CAC4nxbsopU7Ths1LYE1HAB8txbBv9rLGwqCgd=kQWLNDhEz6LQ@mail.gmail.com>
 <d920cfb3-a6cc-8f1b-e0b4-2b59ba768030@arm.com>
 <CAC4nxbvVfeN1gXa9sKSBNL6p21r8K6hMDpxYSSR4G1SWOb=eBg@mail.gmail.com>
 <b768f04f-a595-50db-1232-d3684265c469@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <b768f04f-a595-50db-1232-d3684265c469@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: jgross@suse.com, xen-devel@lists.xensource.com, Wei Liu <wei.liu2@citrix.com>, Oleksandr_Andrushchenko@epam.com, Oleksandr Andrushchenko <andr2000@gmail.com>, Omkar Bolla <omkar.bolla@pathpartnertech.com>, Lars Kurth <lars.kurth.xen@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMDEsIDIwMTggYXQgMDk6NDk6MTNQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+ICgrIFdlaSkKPiAKPiBPbiAxMS8xLzE4IDk6MTUgQU0sIE9ta2FyIEJvbGxhIHdyb3Rl
Ogo+ID4gSGksCj4gPiAKPiA+ID4gTWF5IEkgYXNrIHdoeSB5b3UgbmVlZCB0aGUgZGVwZW5kZW5j
eSBvbiB0aGUgcm9vdGZzPwo+ID4gCj4gPiBJIGFtIHRyeWluZyB0byBwYXNzLXRocm91Z2ggdGhl
IGRpc3BsYXkgdG8gZ3Vlc3QgZG9tYWluLiB0byBkbyB0aHJvdWdoCj4gPiBkcml2ZXIgbmVlZHMg
Y2xvY2tzLiBJIGhhdmUgd3JpdHRlbiBzaW1wbGUgYmFzaWMgY2xvY2sgcHYgZnJvbnRlbmQgYW5k
Cj4gPiBiYWNrZW5kLgo+ID4gU28gSSB0aG91Z2h0IHRoZXNlIGNsb2NrcyBtdXN0IGJlIGluaXRp
YWxpc2VkIGJlZm9yZSBkaXNwbGF5IGRyaXZlcgo+ID4gaW5pdGlhbGlzYXRpb24uCj4gCj4gVGhl
IGdyYXBoaWMgZHJpdmVyIHNob3VsZCByZXF1ZXN0IHRoZSBjbG9jaywgcmlnaHQ/IFNvIExpbnV4
IHdpbGwgbWFrZSBzdXJlCj4gdG8gaGF2ZSB0aGUgY2xvY2sgYmVmb3JlIGluaXRpYWxpemluZyB0
aGUgZGlzcGxheS4KPiAKPiA+IAo+ID4gQnV0IGlmIEkgc3RhcnQgYm90aCBkb21haW4gYW5kIGNs
b2NrcyBzY3JpcHQgb25lIGFmdGVyIGFub3RoZXIsIGNsb2NrCj4gPiBnb3QgaW5pdGlhbGlzZWQg
cHJvcGVybHkuIFByb2JsZW0gc29sdmVkLgo+ID4gQnV0IHN0aWxsIGkgaGF2ZSBzb21lIGRvdWJ0
LCBpcyBpdCBwb3NzaWJsZSB0byBkbyBzb21lIHRoaW5nIGluIHhlbmJpdHMKPiA+IHNyYyB0byBz
dGFydCBhdXRvbWF0aWNhbGx5IHdoZW4gd2Ugc3RhcnQgdW5kZXJwcml2aWxlZ2VkIGRvbWFpbj8K
PiAKPiBJIGFtIG5vdCBlbnRpcmVseSBzdXJlIGlmIHdlIGhhdmUgYSB3YXkgdG8gcnVuIGEgc2Ny
aXB0IGR1cmluZyBkb21haW4KPiBjcmVhdGlvbi4gV2VpLCBkbyB5b3Uga25vdyBpZiB0aGF0J3Mg
cG9zc2libGU/CgpUaGVyZSBpcyB0aGUgaG90cGx1ZyBzY3JpcHQgbWVjaGFuaXNtIHdoaWNoIG1h
eSBvciBtYXkgbm90IGJlIHdoYXQgeW91Cm5lZWQuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
