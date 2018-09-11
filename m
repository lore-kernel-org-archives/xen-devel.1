From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Subject: Re: L1TF, and future work
Date: Tue, 11 Sep 2018 11:14:38 -0600
Message-ID: <CABfawh=33YA+LZT-hAUO8dU9iWzPtB9wvEeQup_GJoOksfrWwg@mail.gmail.com>
References: <4dad178a-91c7-c328-9bc5-4362945d4725@citrix.com>
 <4a76f789c59f2b580d868e101d9d6cf0a538c660.camel@suse.com>
 <CABfawh=irJJsc3cyW+CJX2=hd493+yMsudOGLF7koD+M-r+5Pg@mail.gmail.com>
 <337585af03f85f16e0637e1525dcdf273efd9e4b.camel@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <337585af03f85f16e0637e1525dcdf273efd9e4b.camel@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: JGross@suse.com, sergey.dyasli@citrix.com, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Dario Faggioli <dario.faggioli@citrix.com>, Tim Deegan <tim@xen.org>, Xen-devel <xen-devel@lists.xen.org>, Jan Beulich <JBeulich@suse.com>, security@xen.org, dwmw@amazon.co.uk, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBTZXAgMTEsIDIwMTggYXQgOToxMyBBTSBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xp
QHN1c2UuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgMjAxOC0wOS0xMCBhdCAxNTo0NSAtMDYwMCwg
VGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+ID4gT24gRnJpLCBBdWcgMjQsIDIwMTggYXQgMzoxNiBB
TSBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPgo+ID4gd3JvdGU6Cj4gPiA+Cj4g
PiA+IE5vdGUgdGhhdCBJJ2xsIGJlIG9mZiBmb3IgfjIgd2Vla3MsIGVmZmVjdGl2ZSBuZXh0IE1v
bmRheSwgc28gZmVlbAo+ID4gPiBmcmVlCj4gPiA+IHRvIGNvbW1lbnQsIHJlcGx5LCBldGMsIGJ1
dCBleHBlY3QgbWUgdG8gcmVwbHkgYmFjayBvbmx5IGluCj4gPiA+IFNlcHRlbWJlci4KPiA+Cj4g
PiBIaSBEYXJpbywKPiA+Cj4gSGksCj4KPiA+IG9uY2UgeW91IGFyZSBiYWNrIGZyb20gdmFjYXRp
b24sIGNvdWxkIHlvdSBzaGFyZSB0aGUgUkZDIHBhdGNoZXMgeW91Cj4gPiBtZW50aW9uZWQ/Cj4g
Pgo+IEkgZGlkIHRoYXQgYmVmb3JlIGxlYXZpbmcgYWN0dWFsbHkuIDotKQo+Cj4gaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE4LTA4L21zZzAy
MTY0Lmh0bWwKPgo+IEknbSBiYWNrIG5vdywgYW5kIGFtIHdvcmtpbmcgb24gdGhlIHNlcmllcyBh
Z2Fpbi4gSW4gdGhlIG1lYW53aGlsZSwgZG8KPiBmZWVsIGZyZWUgdG8gc2hhcmUgYW55IGtpbmQg
b2YgZmVlZGJhY2sgb3Igb3Bpbmlvbi4KCkFoLCB0aGFua3MsIEkgbWlzc2VkIGl0IHNvbWVob3ch
IDopIFdlJ2xsIGdpdmUgaXQgYSBzcGluLCB0aGlzIGlzCmxpa2VseSBzb21ldGhpbmcgd2Ugd2ls
bCBuZWVkIGRvd24gdGhlIHJvYWQgKHByb2JhYmx5IHdpdGggY3JlZGl0Mgp0aG91Z2gpLgoKVGFt
YXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
