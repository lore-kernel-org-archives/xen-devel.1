From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] drm/xen-front: Make shmem backed display
 buffer coherent
Date: Thu, 20 Dec 2018 10:38:51 -0800
Message-ID: <20181220183851.GA27025__5865.52858953855$1545331059$gmane$org@infradead.org>
References: <20181127103252.20994-1-andr2000@gmail.com>
 <17640791-5306-f7e4-8588-dd39c14e975b@tronnes.org>
 <20181220153646.GA22997@infradead.org>
 <f2cfadc7-2e0b-b63d-d094-d5339b0c85fe@gmail.com>
 <20181220173950.GA19641@infradead.org>
 <CAKMK7uF8hmO=z4jy+1b1z5ELLWpjcZpqmLoRiP2BJvwnNpOFeg@mail.gmail.com>
 <20181220183311.GA30801@infradead.org>
 <CAKMK7uFxU9Q5u9TxxHqAgFZuQFCFDvxWHDtRLiQf+3hu_4jPcQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=onL2=O5=bombadil.srs.infradead.org=batv+4320e4c38c4ab4f6f328+5597+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1ga3Dk-00068y-Jh
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 18:38:56 +0000
Content-Disposition: inline
In-Reply-To: <CAKMK7uFxU9Q5u9TxxHqAgFZuQFCFDvxWHDtRLiQf+3hu_4jPcQ@mail.gmail.com>
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

T24gVGh1LCBEZWMgMjAsIDIwMTggYXQgMDc6MzU6MTVQTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiA+IEVyciwgd2l0aCBzdHJlYW1pbmcgRE1BIGJ1ZmZlciBzaGFyaW5nIGlzIHRyaXZp
YWwuICBUaGUgY29oZXJlbnQgRE1BCj4gPiBhbGxvY2F0b3IgaXMgd2hhdCBjYXVzZXMgYWxsIGtp
bmRzIG9mIGhvcnJpYmxlIGhhY2tzIHRoYXQgY2FuJ3QgYWN0dWFsbHkKPiA+IHdvcmsgb24gdmFy
aW91cyBwbGF0Zm9ybXMuCj4gCj4gSG0sIEkgdGhvdWdodCB0aGUgc3RyZWFtaW5nIGRtYSBhcGkg
aXMgdGhlIG9uZSB0aGF0IGNhdXNlcyBib3VuY2UKPiBidWZmZXJzIGFuZCBhbGwgdGhhdCBmdW4u
IElmIHlvdSdyZSB1bmx1Y2t5IGF0IGxlYXN0LgoKWWVzIGl0IG1heS4gIEJ1dCBldmVuIGlmIHRo
YXQgaGFwcGVucyBldmVyeXRoaW5nIHdpbGwgYWN0dWFsbHkgd29yaywKanVzdCBzbG93ZXIuICBX
aGlsZSB0aGUgZG1hIGNvaGVyZW50IEFQSSBpcyBzaW1wbHkgYnJva2VuLgoKQnV0IGlmIHlvdSBk
b24ndCB3YW50IGJvdW5jZSBidWZmZXJpbmcgeW91IG5lZWQgdG8gdXNlIHRoZSBkbWEKbm9uY29o
ZXJlbnQgYWxsb2NhdG9yIGFzIHByb3Bvc2VkIGhlcmU6CgoJaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL3BpcGVybWFpbC9pb21tdS8yMDE4LURlY2VtYmVyLzAzMTk4Mi5odG1sCgp3
aGljaCBjb21iaW5lcyBhbGxvY2F0aW5nIG1lbW9yeSB0aGF0IGRvZXNuJ3QgbmVlZCB0byBiZSBi
b3VuY2UKYnVmZmVyZWQgd2l0aCBhIHNoYXJpbmcgc2NoZW1lIHRoYXQgY2FuIGFjdHVhbGx5IHdv
cmsuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
