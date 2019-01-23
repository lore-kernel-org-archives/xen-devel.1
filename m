From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/3] treewide: Lift switch variables out of
 switches
Date: Wed, 23 Jan 2019 12:58:29 +0100
Message-ID: <20190123115829.GA31385__48964.8938340665$1548244763$gmane$org@kroah.com>
References: <20190123110349.35882-1-keescook@chromium.org>
 <20190123110349.35882-2-keescook@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RwCD=P7=linuxfoundation.org=gregkh@kernel.org>)
 id 1gmHAv-00030Y-RQ
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 11:58:33 +0000
Content-Disposition: inline
In-Reply-To: <20190123110349.35882-2-keescook@chromium.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Kees Cook <keescook@chromium.org>
Cc: dev@openvswitch.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>, netdev@vger.kernel.org, intel-gfx@lists.freedesktop.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, linux-security-module@vger.kernel.org, kernel-hardening@lists.openwall.com, intel-wired-lan@lists.osuosl.org, linux-fsdevel@vger.kernel.org, xen-devel@lists.xenproject.org, Laura Abbott <labbott@redhat.com>, linux-kbuild@vger.kernel.org, Alexander Popov <alex.popov@linux.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMjMsIDIwMTkgYXQgMDM6MDM6NDdBTSAtMDgwMCwgS2VlcyBDb29rIHdyb3Rl
Ogo+IFZhcmlhYmxlcyBkZWNsYXJlZCBpbiBhIHN3aXRjaCBzdGF0ZW1lbnQgYmVmb3JlIGFueSBj
YXNlIHN0YXRlbWVudHMKPiBjYW5ub3QgYmUgaW5pdGlhbGl6ZWQsIHNvIG1vdmUgYWxsIGluc3Rh
bmNlcyBvdXQgb2YgdGhlIHN3aXRjaGVzLgo+IEFmdGVyIHRoaXMsIGZ1dHVyZSBhbHdheXMtaW5p
dGlhbGl6ZWQgc3RhY2sgdmFyaWFibGVzIHdpbGwgd29yawo+IGFuZCBub3QgdGhyb3cgd2Fybmlu
Z3MgbGlrZSB0aGlzOgo+IAo+IGZzL2ZjbnRsLmM6IEluIGZ1bmN0aW9uIOKAmHNlbmRfc2lnaW9f
dG9fdGFza+KAmToKPiBmcy9mY250bC5jOjczODoxMzogd2FybmluZzogc3RhdGVtZW50IHdpbGwg
bmV2ZXIgYmUgZXhlY3V0ZWQgWy1Xc3dpdGNoLXVucmVhY2hhYmxlXQo+ICAgIHNpZ2luZm9fdCBz
aTsKPiAgICAgICAgICAgICAgXn4KClRoYXQncyBhIHBhaW4sIHNvIHRoaXMgbWVhbnMgd2UgY2Fu
J3QgaGF2ZSBhbnkgbmV3IHZhcmlhYmxlcyBpbiB7IH0Kc2NvcGUgZXhjZXB0IGZvciBhdCB0aGUg
dG9wIG9mIGEgZnVuY3Rpb24/CgpUaGF0J3MgZ29pbmcgdG8gYmUgYSBoYXJkIHRoaW5nIHRvIGtl
ZXAgZnJvbSBoYXBwZW5pbmcgb3ZlciB0aW1lLCBhcwp0aGlzIGlzIHZhbGlkIEMgOigKCmdyZWcg
ay1oCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
