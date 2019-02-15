From: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: Enhancing Xen's Kconfig infrastructure to support
 tailored solutions
Date: Fri, 15 Feb 2019 11:10:14 +0000
Message-ID: <5AC159AC-E7AF-40FD-9C1B-90B6B4F2076D@gmail.com>
References: <a49643ec-6bbe-04be-1ae2-b1d731da92cf@gmail.com>
 <20190213182544.2tguperv3yliejch@zion.uk.xensource.com>
 <alpine.DEB.2.10.1902131110270.5641@sstabellini-ThinkPad-X260>
 <A2C0B65C-32D0-4243-8A14-73B8331AC386@citrix.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <A2C0B65C-32D0-4243-8A14-73B8331AC386@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: James McKenzie <james.mckenzie@bromium.com>, =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, Doug Goldstein <cardoe@cardoe.com>, Christopher Clark <christopher.w.clark@gmail.com>, xen-devel <xen-devel@lists.xen.org>, "Daniel P. Smith" <dpsmith.dev@gmail.com>, "robin.randhawa@arm.com" <robin.randhawa@arm.com>, Paul Durrant <Paul.Durrant@citrix.com>, "committers@xenproject.org" <committers@xenproject.org>, Jun Nakajima <jun.nakajima@intel.com>, Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
List-Id: xen-devel@lists.xenproject.org

Cgo+IE9uIDE1IEZlYiAyMDE5LCBhdCAwOTozNSwgR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxh
cEBjaXRyaXguY29tPiB3cm90ZToKPiAKPj4+IAo+Pj4gQXMgdXNlIGNhc2UgZ29lcywgaXQgd291
bGQgYmUgYSBnb29kIHN0YXJ0IGlmIHlvdSBqdXN0IHN1Ym1pdCBzb21ldGhpbmcKPj4+IHlvdSBj
YXJlIGFib3V0Lgo+PiAKPj4gSSBtZW50aW9uZWQgb24gdGhlIGNhbGwgdGhhdCBhIGdvb2QgZmly
c3Qgc3RhcnQgY291bGQgYmUgYSBrY29uZmlnIHRoYXQKPj4gYWxsb3dzIHRvIGJ1aWxkIGFuIGh5
cGVydmlzb3IgYmluYXJ5IHdpdGggb25seSBzdXBwb3J0IGZvciBQVkggYW5kIG9ubHkKPj4gc3Vw
cG9ydCBmb3IgcmVjZW50IEludGVsIG1hY2hpbmVzLCB3aXRoIHRoZSBnb2FsIG9mIG1pbmltaXpp
bmcgdGhlIGNvZGUKPj4gYmFzZSB0byBsZXNzIHRoYW4gMTAwSyBMT0MuCj4gCj4gSSB0aGluayBv
bmUgdGhpbmcgdGhhdCBtaWdodCBiZSBoZWxwZnVsIGlzIGEgc29ydCBvZiDigJxmZWF0dXJlIGRv
Y3VtZW504oCdIGZvciBlYWNoIGRlZmNvbmZpZyB3ZeKAmXJlIGxvb2tpbmcgYXQgY3JlYXRpbmcu
ICBUaGlzIHdvdWxkIGluY2x1ZGU6Cj4gCj4gKiBXaGF0IHRoZSDigJx0YXJnZXQgdXNlIGNhc2Xi
gJ0gZm9yIGVhY2ggZGVmY29uZmlnIHdvdWxkIGJlCj4gKiBUaGUgZW5kIGdvYWwgaW4gdGVybXMg
b2YgZnVuY3Rpb25hbGl0eSAvIExvQyAvIHdoYXRldmVyCj4gKiBUaGUgY3VycmVudCBzdGF0ZSwg
d29yayBpdGVtcyB5ZXQgdG8gZG8KPiAqIFdoYXQgcG90ZW50aWFsIHZhcmlhdGlvbnMgdGhlcmUg
YXJlIChpLmUuLCBob3cgdG8gZW5hYmxlIHNoYWRvdyBpZiB5b3Ugd2FudCwgb3Igc3dpdGNoIGZy
b20gSW50ZWwtb25seSB0byBBTUQtb25seSkKPiAKPiBJ4oCZdmUgc29ydCBvZiBiZWVuIHVzaW5n
IGRvY3MvZGVzaWduL3FlbXUtZGVwcml2aWxlZ2UubWQgaW4gdGhpcyB3YXk6IFNheWluZyB3aGVy
ZSB3ZSB3YW50IHRvIGdvLCBhbmQgbW92aW5nIHRoaW5ncyBmcm9tIOKAnHRvIGRv4oCdIHRvIOKA
nGRvbmXigJ0gYXMgdGhleSBnZXQgaW1wbGVtZW50ZWQuICBUaGF0IHdvdWxkIG1ha2UgaXQgZWFz
aWVyIHRvIGhhdmUgaW4tcHJvZ3Jlc3MgdGhpbmdzIGluIHRoZSB0cmVlLCBtYWtlIGl0IGVhc2ll
ciBmb3IgcGVvcGxlIHRvIGNvbGxhYm9yYXRlIC8gZW5oYW5jZSBkZWZjb25maWdzLCBhbmQgYWxz
byBiZSBhIHN0YXJ0aW5nIHBvaW50IGZvciB0YWxraW5nIGFib3V0IHRlc3RpbmcgYW5kIHN1cHBv
cnQgc3RhdHVzLgoKSSB0aGluayB0aGlzIGlzIGEgZ3JlYXQgaWRlYQpSZWdhcmRzCkxhcnMKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
