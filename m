From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [PATCH 1/3] treewide: Lift switch variables out of
 switches
Date: Wed, 23 Jan 2019 13:12:26 +0100
Message-ID: <CAKv+Gu-ECKNy+nmnbsetkOg28VR1YkFgnRsu+u9mN4DC_poBwg__26915.6452779256$1548245623$gmane$org@mail.gmail.com>
References: <20190123110349.35882-1-keescook@chromium.org>
 <20190123110349.35882-2-keescook@chromium.org>
 <20190123115829.GA31385@kroah.com>
 <CAG48ez2vfXkr9dozJiGmze8k49VOXfs=K7M8bv0aQsDDpzrEFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V29P=P7=linaro.org=ard.biesheuvel@srs-us1.protection.inumbo.net>)
 id 1gmHOZ-00057Q-Fw
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 12:12:39 +0000
Received: by mail-io1-xd41.google.com with SMTP id k7so1476544iob.6
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jan 2019 04:12:38 -0800 (PST)
In-Reply-To: <CAG48ez2vfXkr9dozJiGmze8k49VOXfs=K7M8bv0aQsDDpzrEFQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jann Horn <jannh@google.com>
Cc: dev@openvswitch.org, Kees Cook <keescook@chromium.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, intel-gfx@lists.freedesktop.org, linux-usb <linux-usb@vger.kernel.org>, kernel list <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Linux-MM <linux-mm@kvack.org>, linux-security-module <linux-security-module@vger.kernel.org>, Kernel Hardening <kernel-hardening@lists.openwall.com>, intel-wired-lan@lists.osuosl.org, Network Development <netdev@vger.kernel.org>, linux-fsdevel@vger.kernel.org, xen-devel <xen-devel@lists.xenproject.org>, Laura Abbott <labbott@redhat.com>, Alexander Popov <alex.popov@linux.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAyMyBKYW4gMjAxOSBhdCAxMzowOSwgSmFubiBIb3JuIDxqYW5uaEBnb29nbGUuY29t
PiB3cm90ZToKPgo+IE9uIFdlZCwgSmFuIDIzLCAyMDE5IGF0IDE6MDQgUE0gR3JlZyBLSCA8Z3Jl
Z2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+ID4gT24gV2VkLCBKYW4gMjMsIDIwMTkg
YXQgMDM6MDM6NDdBTSAtMDgwMCwgS2VlcyBDb29rIHdyb3RlOgo+ID4gPiBWYXJpYWJsZXMgZGVj
bGFyZWQgaW4gYSBzd2l0Y2ggc3RhdGVtZW50IGJlZm9yZSBhbnkgY2FzZSBzdGF0ZW1lbnRzCj4g
PiA+IGNhbm5vdCBiZSBpbml0aWFsaXplZCwgc28gbW92ZSBhbGwgaW5zdGFuY2VzIG91dCBvZiB0
aGUgc3dpdGNoZXMuCj4gPiA+IEFmdGVyIHRoaXMsIGZ1dHVyZSBhbHdheXMtaW5pdGlhbGl6ZWQg
c3RhY2sgdmFyaWFibGVzIHdpbGwgd29yawo+ID4gPiBhbmQgbm90IHRocm93IHdhcm5pbmdzIGxp
a2UgdGhpczoKPiA+ID4KPiA+ID4gZnMvZmNudGwuYzogSW4gZnVuY3Rpb24g4oCYc2VuZF9zaWdp
b190b190YXNr4oCZOgo+ID4gPiBmcy9mY250bC5jOjczODoxMzogd2FybmluZzogc3RhdGVtZW50
IHdpbGwgbmV2ZXIgYmUgZXhlY3V0ZWQgWy1Xc3dpdGNoLXVucmVhY2hhYmxlXQo+ID4gPiAgICBz
aWdpbmZvX3Qgc2k7Cj4gPiA+ICAgICAgICAgICAgICBefgo+ID4KPiA+IFRoYXQncyBhIHBhaW4s
IHNvIHRoaXMgbWVhbnMgd2UgY2FuJ3QgaGF2ZSBhbnkgbmV3IHZhcmlhYmxlcyBpbiB7IH0KPiA+
IHNjb3BlIGV4Y2VwdCBmb3IgYXQgdGhlIHRvcCBvZiBhIGZ1bmN0aW9uPwo+Cj4gQUZBSUNTIHRo
aXMgb25seSBhcHBsaWVzIHRvIHN3aXRjaCBzdGF0ZW1lbnRzIChiZWNhdXNlIHRoZXkganVtcCB0
byBhCj4gY2FzZSBhbmQgZG9uJ3QgZXhlY3V0ZSBzdHVmZiBhdCB0aGUgc3RhcnQgb2YgdGhlIGJs
b2NrKSwgbm90IGJsb2Nrcwo+IGFmdGVyIGlmL3doaWxlLy4uLiAuCj4KCkkgZ3Vlc3MgdGhhdCBt
ZWFucyBpdCBtYXkgYXBwbHkgdG8gb3RoZXIgY2FzZXMgd2hlcmUgeW91IGRvIGEgJ2dvdG8nCmlu
dG8gdGhlIG1pZGRsZSBvZiBhIGZvcigpIGxvb3AsIGZvciBpbnN0YW5jZSAoYXQgdGhlIGZpcnN0
Cml0ZXJhdGlvbiksIHdoaWNoIGlzIGFsc28gYSB2YWxpZCBwYXR0ZXJuLgoKSXMgdGhlcmUgYW55
IHdheSB0byB0YWcgdGhlc2UgYXNzaWdubWVudHMgc28gdGhlIGRpYWdub3N0aWMgZGlzcmVnYXJk
cyB0aGVtPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
