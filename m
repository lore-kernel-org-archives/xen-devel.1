From: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] pvusb: set max grants only in initialise
Date: Mon, 10 Dec 2018 14:14:46 +0100
Message-ID: <20181210131446.4yqpeplud2wmribm__5809.33811511404$1544447632$gmane$org@sirius.home.kraxel.org>
References: <20181206133923.30105-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=T4TJ=OT=redhat.com=kraxel@srs-us1.protection.inumbo.net>)
 id 1gWLOc-0000Vg-GR
 for xen-devel@lists.xenproject.org; Mon, 10 Dec 2018 13:14:50 +0000
Content-Disposition: inline
In-Reply-To: <20181206133923.30105-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: anthony.perard@citrix.com, xen-devel@lists.xenproject.org, sstabellini@kernel.org, qemu-devel@nongnu.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBEZWMgMDYsIDIwMTggYXQgMDI6Mzk6MjNQTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBEb24ndCBjYWxsIHhlbl9iZV9zZXRfbWF4X2dyYW50X3JlZnMoKSBpbiB1c2JiYWNr
X2FsbG9jKCksIGFzIHRoZQo+IGdudHRhYmRldiBwb2ludGVyIHdvbid0IGJlIGluaXRpYWxpc2Vk
IHlldC4gVGhlIGNhbGwgY2FuIGVhc2lseSBiZQo+IG1vdmVkIHRvIHVzYmJhY2tfY29ubmVjdCgp
LgoKQWRkZWQgdG8gdXNiIHF1ZXVlLgoKdGhhbmtzLAogIEdlcmQKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
