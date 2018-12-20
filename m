From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/xen-front: Make shmem backed display
 buffer coherent
Date: Thu, 20 Dec 2018 19:35:15 +0100
Message-ID: <CAKMK7uFxU9Q5u9TxxHqAgFZuQFCFDvxWHDtRLiQf+3hu_4jPcQ__45589.4302380786$1545330853$gmane$org@mail.gmail.com>
References: <20181127103252.20994-1-andr2000@gmail.com>
 <17640791-5306-f7e4-8588-dd39c14e975b@tronnes.org>
 <20181220153646.GA22997@infradead.org>
 <f2cfadc7-2e0b-b63d-d094-d5339b0c85fe@gmail.com>
 <20181220173950.GA19641@infradead.org>
 <CAKMK7uF8hmO=z4jy+1b1z5ELLWpjcZpqmLoRiP2BJvwnNpOFeg@mail.gmail.com>
 <20181220183311.GA30801@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hsjg=O5=ffwll.ch=daniel.vetter@srs-us1.protection.inumbo.net>)
 id 1ga3AO-0005yo-3J
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 18:35:28 +0000
Received: by mail-it1-x141.google.com with SMTP id i145so3441622ita.4
 for <xen-devel@lists.xenproject.org>; Thu, 20 Dec 2018 10:35:27 -0800 (PST)
In-Reply-To: <20181220183311.GA30801@infradead.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Juergen Gross <jgross@suse.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, xen-devel@lists.xenproject.org, Daniel Vetter <daniel.vetter@intel.com>, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBEZWMgMjAsIDIwMTggYXQgNzozMyBQTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGlu
ZnJhZGVhZC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBEZWMgMjAsIDIwMTggYXQgMDc6Mjk6MzdQ
TSArMDEwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+IFdoYXQgd2UgbW9zdCBkZWZpbml0ZWx5
IG5vdCB3YW50IHRvIGVuZCB1cCB3aXRoIHRob3VnaCBpcyBhY3R1YWxseQo+ID4gc3RyZWFtaW5n
IGRtYSwgYmVjYXVzZSB3aXRoIHRoYXQgYWxsIHRoZSB6ZXJvIGNvcHkgYnVmZmVyIHNoYXJpbmcK
PiA+IHRyaWNrcyBiZWNvbWUgcG9pbnRsZXNzLiBUaGVyZSdzIHByZXR0eSBlcGljIGFtb3VudHMg
b2YgaGFja3MgdG8gd29yawo+ID4gYXJvdW5kIHRoaXMsIEkgaGF2ZSBubyBpZGVhIHdoYXQncyBz
dXBwb3NlZCB0byBnaXZlIGhlcmUuCj4KPiBFcnIsIHdpdGggc3RyZWFtaW5nIERNQSBidWZmZXIg
c2hhcmluZyBpcyB0cml2aWFsLiAgVGhlIGNvaGVyZW50IERNQQo+IGFsbG9jYXRvciBpcyB3aGF0
IGNhdXNlcyBhbGwga2luZHMgb2YgaG9ycmlibGUgaGFja3MgdGhhdCBjYW4ndCBhY3R1YWxseQo+
IHdvcmsgb24gdmFyaW91cyBwbGF0Zm9ybXMuCgpIbSwgSSB0aG91Z2h0IHRoZSBzdHJlYW1pbmcg
ZG1hIGFwaSBpcyB0aGUgb25lIHRoYXQgY2F1c2VzIGJvdW5jZQpidWZmZXJzIGFuZCBhbGwgdGhh
dCBmdW4uIElmIHlvdSdyZSB1bmx1Y2t5IGF0IGxlYXN0LgotRGFuaWVsCi0tIApEYW5pZWwgVmV0
dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1
NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
