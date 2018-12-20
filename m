From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] drm/xen-front: Make shmem backed display
 buffer coherent
Date: Thu, 20 Dec 2018 10:33:11 -0800
Message-ID: <20181220183311.GA30801__12716.2111959935$1545330720$gmane$org@infradead.org>
References: <20181127103252.20994-1-andr2000@gmail.com>
 <17640791-5306-f7e4-8588-dd39c14e975b@tronnes.org>
 <20181220153646.GA22997@infradead.org>
 <f2cfadc7-2e0b-b63d-d094-d5339b0c85fe@gmail.com>
 <20181220173950.GA19641@infradead.org>
 <CAKMK7uF8hmO=z4jy+1b1z5ELLWpjcZpqmLoRiP2BJvwnNpOFeg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=onL2=O5=bombadil.srs.infradead.org=batv+4320e4c38c4ab4f6f328+5597+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1ga38L-0005rK-Rj
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 18:33:21 +0000
Content-Disposition: inline
In-Reply-To: <CAKMK7uF8hmO=z4jy+1b1z5ELLWpjcZpqmLoRiP2BJvwnNpOFeg@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Juergen Gross <jgross@suse.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Christoph Hellwig <hch@infradead.org>, xen-devel@lists.xenproject.org, Daniel Vetter <daniel.vetter@intel.com>, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBEZWMgMjAsIDIwMTggYXQgMDc6Mjk6MzdQTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBXaGF0IHdlIG1vc3QgZGVmaW5pdGVseSBub3Qgd2FudCB0byBlbmQgdXAgd2l0aCB0
aG91Z2ggaXMgYWN0dWFsbHkKPiBzdHJlYW1pbmcgZG1hLCBiZWNhdXNlIHdpdGggdGhhdCBhbGwg
dGhlIHplcm8gY29weSBidWZmZXIgc2hhcmluZwo+IHRyaWNrcyBiZWNvbWUgcG9pbnRsZXNzLiBU
aGVyZSdzIHByZXR0eSBlcGljIGFtb3VudHMgb2YgaGFja3MgdG8gd29yawo+IGFyb3VuZCB0aGlz
LCBJIGhhdmUgbm8gaWRlYSB3aGF0J3Mgc3VwcG9zZWQgdG8gZ2l2ZSBoZXJlLgoKRXJyLCB3aXRo
IHN0cmVhbWluZyBETUEgYnVmZmVyIHNoYXJpbmcgaXMgdHJpdmlhbC4gIFRoZSBjb2hlcmVudCBE
TUEKYWxsb2NhdG9yIGlzIHdoYXQgY2F1c2VzIGFsbCBraW5kcyBvZiBob3JyaWJsZSBoYWNrcyB0
aGF0IGNhbid0IGFjdHVhbGx5Cndvcmsgb24gdmFyaW91cyBwbGF0Zm9ybXMuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
