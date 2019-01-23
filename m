From: Kees Cook <keescook@chromium.org>
Subject: Re: [Intel-gfx] [PATCH 1/3] treewide: Lift switch
 variables out of switches
Date: Thu, 24 Jan 2019 07:55:51 +1300
Message-ID: <CAGXu5jJUxHtFq0rBJ9FwzMcZDWnusPUauC_=MaOz7H0_PF25jQ__7447.78808891482$1548269833$gmane$org@mail.gmail.com>
References: <20190123110349.35882-1-keescook@chromium.org>
 <20190123110349.35882-2-keescook@chromium.org>
 <20190123115829.GA31385@kroah.com> <874l9z31c5.fsf@intel.com>
 <000001d4b32a$845e06e0$8d1a14a0$@211mainstreet.net> <87va2f1int.fsf@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=a/mT=P7=chromium.org=keescook@srs-us1.protection.inumbo.net>)
 id 1gmNh3-0000yp-PF
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 18:56:09 +0000
Received: by mail-vk1-xa43.google.com with SMTP id o130so730664vke.10
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jan 2019 10:56:07 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com.
 [209.85.222.43])
 by smtp.gmail.com with ESMTPSA id j95sm26974399uad.6.2019.01.23.10.56.05
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Jan 2019 10:56:05 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id t8so1103539uap.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jan 2019 10:56:05 -0800 (PST)
In-Reply-To: <87va2f1int.fsf@intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: dev@openvswitch.org, xen-devel <xen-devel@lists.xenproject.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Edwin Zimmerman <edwin@211mainstreet.net>, intel-gfx@lists.freedesktop.org, linux-usb@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, linux-security-module <linux-security-module@vger.kernel.org>, intel-wired-lan@lists.osuosl.org, Network Development <netdev@vger.kernel.org>, Kernel Hardening <kernel-hardening@lists.openwall.com>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, Laura Abbott <labbott@redhat.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, Alexander Popov <alex.popov@linux.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMjQsIDIwMTkgYXQgNDo0NCBBTSBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFA
bGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgMjMgSmFuIDIwMTksIEVkd2luIFpp
bW1lcm1hbiA8ZWR3aW5AMjExbWFpbnN0cmVldC5uZXQ+IHdyb3RlOgo+ID4gT24gV2VkLCAyMyBK
YW4gMjAxOSwgSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6
Cj4gPj4gT24gV2VkLCAyMyBKYW4gMjAxOSwgR3JlZyBLSCA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlv
bi5vcmc+IHdyb3RlOgo+ID4+ID4gT24gV2VkLCBKYW4gMjMsIDIwMTkgYXQgMDM6MDM6NDdBTSAt
MDgwMCwgS2VlcyBDb29rIHdyb3RlOgo+ID4+ID4+IFZhcmlhYmxlcyBkZWNsYXJlZCBpbiBhIHN3
aXRjaCBzdGF0ZW1lbnQgYmVmb3JlIGFueSBjYXNlIHN0YXRlbWVudHMKPiA+PiA+PiBjYW5ub3Qg
YmUgaW5pdGlhbGl6ZWQsIHNvIG1vdmUgYWxsIGluc3RhbmNlcyBvdXQgb2YgdGhlIHN3aXRjaGVz
Lgo+ID4+ID4+IEFmdGVyIHRoaXMsIGZ1dHVyZSBhbHdheXMtaW5pdGlhbGl6ZWQgc3RhY2sgdmFy
aWFibGVzIHdpbGwgd29yawo+ID4+ID4+IGFuZCBub3QgdGhyb3cgd2FybmluZ3MgbGlrZSB0aGlz
Ogo+ID4+ID4+Cj4gPj4gPj4gZnMvZmNudGwuYzogSW4gZnVuY3Rpb24g4oCYc2VuZF9zaWdpb190
b190YXNr4oCZOgo+ID4+ID4+IGZzL2ZjbnRsLmM6NzM4OjEzOiB3YXJuaW5nOiBzdGF0ZW1lbnQg
d2lsbCBuZXZlciBiZSBleGVjdXRlZCBbLVdzd2l0Y2gtdW5yZWFjaGFibGVdCj4gPj4gPj4gICAg
c2lnaW5mb190IHNpOwo+ID4+ID4+ICAgICAgICAgICAgICBefgo+ID4+ID4KPiA+PiA+IFRoYXQn
cyBhIHBhaW4sIHNvIHRoaXMgbWVhbnMgd2UgY2FuJ3QgaGF2ZSBhbnkgbmV3IHZhcmlhYmxlcyBp
biB7IH0KPiA+PiA+IHNjb3BlIGV4Y2VwdCBmb3IgYXQgdGhlIHRvcCBvZiBhIGZ1bmN0aW9uPwoK
SnVzdCBpbiBjYXNlIHRoaXMgd2Fzbid0IGNsZWFyOiBubywgaXQncyBqdXN0IHRoZSBzd2l0Y2gg
c3RhdGVtZW50CmJlZm9yZSB0aGUgZmlyc3QgImNhc2UiLiBJIGNhbm5vdCBpbWFnaW5lIGhvdyBi
YWQgaXQgd291bGQgYmUgaWYgd2UKY291bGRuJ3QgaGF2ZSBibG9jay1zY29wZWQgdmFyaWFibGVz
ISBIZWguIDopCgo+ID4+ID4KPiA+PiA+IFRoYXQncyBnb2luZyB0byBiZSBhIGhhcmQgdGhpbmcg
dG8ga2VlcCBmcm9tIGhhcHBlbmluZyBvdmVyIHRpbWUsIGFzCj4gPj4gPiB0aGlzIGlzIHZhbGlk
IEMgOigKPiA+Pgo+ID4+IE5vdCBhbGwgdmFsaWQgQyBpcyBtZWFudCB0byBiZSB1c2VkISA7KQo+
ID4KPiA+IFZlcnkgdHJ1ZS4gIFRoZSBvdGhlciB0aGluZyB0byBrZWVwIGluIG1pbmQgaXMgdGhl
IGJ1cmRlbiBvZiBlbmZvcmNpbmcKPiA+IGEgcHJvaGliaXRpb24gb24gYSB2YWxpZCBDIGNvbnN0
cnVjdCBsaWtlIHRoaXMuICBJdCBzZWVtcyB0byBtZSB0aGF0Cj4gPiBwYXRjaCByZXZpZXdlcnMg
YW5kIG1haW50YWluZXJzIGhhdmUgZW5vdWdoIHRvIGRvIHdpdGhvdXQgZm9yY2luZyB0aGVtCj4g
PiB0byB3YXRjaCBmb3IgdmFyaWFibGUgZGVjbGFyYXRpb25zIGluIHN3aXRjaCBzdGF0ZW1lbnRz
LiAgQXV0b21hdGluZwo+ID4gdGhpcyBwcm9oaWJpdGlvbiwgc2hvdWxkIGl0IGJlIGFjY2VwdGVk
LCBzZWVtcyBsaWtlIGEgZ29vZCBpZGVhIHRvIG1lLgo+Cj4gQ29uc2lkZXJpbmcgdGhhdCB0aGUg
dHJlZXdpZGUgZGlmZnN0YXQgdG8gZml4IHRoaXMgaXM6Cj4KPiAgMTggZmlsZXMgY2hhbmdlZCwg
NDUgaW5zZXJ0aW9ucygrKSwgNDYgZGVsZXRpb25zKC0pCj4KPiBhbmQgdXNpbmcgdGhlIGdjYyBw
bHVnaW4gaW4gcXVlc3Rpb24gd2lsbCB0cmlnZ2VyIHRoZSBzd2l0Y2gtdW5yZWFjaGFibGUKPiB3
YXJuaW5nLCBJIHRoaW5rIHdlJ3JlIGdvb2QuIFRoZXJlJ2xsIHByb2JhYmx5IGJlIHRoZSBvY2Nh
c2lvbmFsCj4gZGVjbGFyYXRpb25zIHRoYXQgcGFzcyB0aHJvdWdoLCBhbmQgd2lsbCBnZXQgZml4
ZWQgYWZ0ZXJ3YXJkcy4KClllYWgsIHRoYXQgd2FzIG15IHRoaW5raW5nIGFzIHdlbGw6IGl0J3Mg
YSByYXJlIHVzZSwgYW5kIHdlIGdldCBhCndhcm5pbmcgd2hlbiBpdCBjb21lcyB1cC4KClRoYW5r
cyEKCi0tIApLZWVzIENvb2sKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
