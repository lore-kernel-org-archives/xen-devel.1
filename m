From: Nick Simonov <nicksimonovv@gmail.com>
Subject: Re: [PATCH v2] ALSA: xen-front: Refine indentations and
 constify snd_pcm_ops
Date: Fri, 21 Sep 2018 12:21:35 +0300
Message-ID: <20180921092135.GA20633__17694.7471838959$1537521636$gmane$org@kbp1-dhp-f54120>
References: <20180921054514.GA11771@nick>
 <s5ha7obuyuw.wl-tiwai@suse.de>
Reply-To: s5ha7obuyuw.wl-tiwai@suse.de
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=utuq=md=gmail.com=nicksimonovv@srs-us1.protection.inumbo.net>)
 id 1g3HdO-0005kY-DF
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 09:21:58 +0000
Received: by mail-lj1-x242.google.com with SMTP id x16-v6so4566825ljd.12
 for <xen-devel@lists.xenproject.org>; Fri, 21 Sep 2018 02:21:56 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <s5ha7obuyuw.wl-tiwai@suse.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: xen-devel@lists.xenproject.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, oleksandr_andrushchenko@epam.com
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBTZXAgMjEsIDIwMTggYXQgMDg6NTE6NTFBTSArMDIwMCwgVGFrYXNoaSBJd2FpIHdy
b3RlOgo+IE9uIEZyaSwgMjEgU2VwIDIwMTggMDc6NDc6MzggKzAyMDAsCj4gTmljayBTaW1vbm92
IHdyb3RlOgo+ID4gCj4gPiBzbmRfcGNtX29wcyBhcmUgbm90IHN1cHBvc2VkIHRvIGNoYW5nZS4g
U28gbWFyayB0aGUKPiA+IG5vbi1jb25zdCBzdHJ1Y3RzIGFzIGNvbnN0LiBBbHNvLCByZWZpbmUg
aW5kZW50YXRpb24KPiA+IHRvIGluY3JlYXNlIHJlYWRhYmlsaXR5Lgo+ID4gCj4gPiBTaWduZWQt
b2ZmLWJ5OiBOaWNrIFNpbW9ub3YgPG5pY2tzaW1vbm92dkBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+
IENoYW5nZXMgdjI6Cj4gPiAtIEZpeCB0eXBvIGluIGNvbW1pdCBkZXNjcmlwdGlvbiwgbmNyZWFz
ZSB0byBpbmNyZWFzZS4KPiAKPiBTaW5jZSBJIGFscmVhZHkgbWVyZ2VkIHlvdXIgZmlyc3QgdmVy
c2lvbiwgcGxlYXNlIHJlc3VibWl0IGFzIGFuCj4gaW5jcmVtZW50YWwgcGF0Y2guICBBdCBiZXN0
LCBjaGVjayB0aGUgbGF0ZXN0IGxpbnV4LW5leHQgb3IgbXkKPiBzb3VuZC5naXQgdHJlZSBmb3It
bmV4dCBicmFuY2gsIGFuZCBjcmVhdGUgYSBwYXRjaCBvbiBpdHMgdG9wLgo+IAo+IAo+IHRoYW5r
cywKPiAKPiBUYWthc2hpCgpTb3JyeSBJIHdhbnQgdG8gY2xhcmlmeSwgdGhlcmUgaXMgbm8gbWlz
dGFrZXMgaW4gdGhlIGNvZGUgaXRzZWxmCnRoZXJlIGlzIGEgdHlwbyBpbiBjb21taXQgbWVzc2Fn
ZS4gQXMgSSBub3cgdGhlcmUgaXMgbm8gd2F5IHRvIGNoYW5nZQpjb21taXQgbWVzc2FnZSB3aXRo
b3V0IHJlYmFzZSBhZnRlciBtZXJnZSwgc28gd2hpY2ggaXMgdGhlIHByb3BlciB3YXkgaW4KdGhp
cyBjYXNlPyBsZWF2ZSBpdCBhcyBpcz8KClRoYW5rcywKCk5pY2sKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
