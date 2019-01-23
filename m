From: Jann Horn <jannh@google.com>
Subject: Re: [PATCH 1/3] treewide: Lift switch variables out of
 switches
Date: Wed, 23 Jan 2019 13:09:13 +0100
Message-ID: <CAG48ez2vfXkr9dozJiGmze8k49VOXfs=K7M8bv0aQsDDpzrEFQ__7093.22736818052$1548245449$gmane$org@mail.gmail.com>
References: <20190123110349.35882-1-keescook@chromium.org>
 <20190123110349.35882-2-keescook@chromium.org>
 <20190123115829.GA31385@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hIll=P7=google.com=jannh@srs-us1.protection.inumbo.net>)
 id 1gmHLh-0004MR-BA
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 12:09:41 +0000
Received: by mail-oi1-x242.google.com with SMTP id w13so1558389oiw.9
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jan 2019 04:09:39 -0800 (PST)
In-Reply-To: <20190123115829.GA31385@kroah.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dev@openvswitch.org, Kees Cook <keescook@chromium.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Network Development <netdev@vger.kernel.org>, intel-gfx@lists.freedesktop.org, linux-usb@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Linux-MM <linux-mm@kvack.org>, linux-security-module <linux-security-module@vger.kernel.org>, Kernel Hardening <kernel-hardening@lists.openwall.com>, intel-wired-lan@lists.osuosl.org, linux-fsdevel@vger.kernel.org, xen-devel <xen-devel@lists.xenproject.org>, Laura Abbott <labbott@redhat.com>, linux-kbuild@vger.kernel.org, Alexander Popov <alex.popov@linux.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMjMsIDIwMTkgYXQgMTowNCBQTSBHcmVnIEtIIDxncmVna2hAbGludXhmb3Vu
ZGF0aW9uLm9yZz4gd3JvdGU6Cj4gT24gV2VkLCBKYW4gMjMsIDIwMTkgYXQgMDM6MDM6NDdBTSAt
MDgwMCwgS2VlcyBDb29rIHdyb3RlOgo+ID4gVmFyaWFibGVzIGRlY2xhcmVkIGluIGEgc3dpdGNo
IHN0YXRlbWVudCBiZWZvcmUgYW55IGNhc2Ugc3RhdGVtZW50cwo+ID4gY2Fubm90IGJlIGluaXRp
YWxpemVkLCBzbyBtb3ZlIGFsbCBpbnN0YW5jZXMgb3V0IG9mIHRoZSBzd2l0Y2hlcy4KPiA+IEFm
dGVyIHRoaXMsIGZ1dHVyZSBhbHdheXMtaW5pdGlhbGl6ZWQgc3RhY2sgdmFyaWFibGVzIHdpbGwg
d29yawo+ID4gYW5kIG5vdCB0aHJvdyB3YXJuaW5ncyBsaWtlIHRoaXM6Cj4gPgo+ID4gZnMvZmNu
dGwuYzogSW4gZnVuY3Rpb24g4oCYc2VuZF9zaWdpb190b190YXNr4oCZOgo+ID4gZnMvZmNudGwu
Yzo3Mzg6MTM6IHdhcm5pbmc6IHN0YXRlbWVudCB3aWxsIG5ldmVyIGJlIGV4ZWN1dGVkIFstV3N3
aXRjaC11bnJlYWNoYWJsZV0KPiA+ICAgIHNpZ2luZm9fdCBzaTsKPiA+ICAgICAgICAgICAgICBe
fgo+Cj4gVGhhdCdzIGEgcGFpbiwgc28gdGhpcyBtZWFucyB3ZSBjYW4ndCBoYXZlIGFueSBuZXcg
dmFyaWFibGVzIGluIHsgfQo+IHNjb3BlIGV4Y2VwdCBmb3IgYXQgdGhlIHRvcCBvZiBhIGZ1bmN0
aW9uPwoKQUZBSUNTIHRoaXMgb25seSBhcHBsaWVzIHRvIHN3aXRjaCBzdGF0ZW1lbnRzIChiZWNh
dXNlIHRoZXkganVtcCB0byBhCmNhc2UgYW5kIGRvbid0IGV4ZWN1dGUgc3R1ZmYgYXQgdGhlIHN0
YXJ0IG9mIHRoZSBibG9jayksIG5vdCBibG9ja3MKYWZ0ZXIgaWYvd2hpbGUvLi4uIC4KCj4gVGhh
dCdzIGdvaW5nIHRvIGJlIGEgaGFyZCB0aGluZyB0byBrZWVwIGZyb20gaGFwcGVuaW5nIG92ZXIg
dGltZSwgYXMKPiB0aGlzIGlzIHZhbGlkIEMgOigKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
