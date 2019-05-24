From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 4/6] osstest: introduce a helper to get the
 svn revision of a git commit
Date: Fri, 24 May 2019 10:57:27 +0100
Message-ID: <20190524095727.su3wxkxgovfxpyne@Air-de-Roger>
References: <20190220170001.32614-1-roger.pau@citrix.com>
 <20190220170001.32614-5-roger.pau@citrix.com>
 <23782.28680.411030.121451@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MrwS=TY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hU6xJ-0006I8-S1
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 09:57:41 +0000
Content-Disposition: inline
In-Reply-To: <23782.28680.411030.121451@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMTE6MDM6NTJBTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gUm9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIltYZW4tZGV2ZWxdIFtQQVRDSCA0LzZdIG9z
c3Rlc3Q6IGludHJvZHVjZSBhIGhlbHBlciB0byBnZXQgdGhlIHN2biByZXZpc2lvbiBvZiBhIGdp
dCBjb21taXQiKToKPiA+IFRoaXMgb25seSB3b3JrcyB3aGVuIHRoZSBzdm4gcmV2aXNpb24gaXMg
c3RvcmVkIGFzIGEgZ2l0IG5vdGUKPiA+IHdpdGggdGhlIGZvcm1hdCAncmV2aXNpb249PHJldmlz
aW9uIG51bWJlcj4nLgo+IAo+IFdvdy4gIFRoaXMgaXMgcHJldHR5IHVnbHkuCgpJbmRlZWQgOigu
Cgo+IAo+ID4gU3VjaCBjb252ZXJzaW9uIGlzIHJlcXVpcmVkIGluIG9yZGVyIHRvIGJvb3RzdHJh
cCBhIEZyZWVCU0Qgc3lzdGVtCj4gPiB3aXRob3V0IHJlbHlpbmcgb24gZXh0ZXJuYWwgcGFja2Fn
ZSByZXBvc2l0b3JpZXMuIEZyZWVCU0QgYmFzZSBzeXN0ZW0KPiA+IG9ubHkgY29udGFpbnMgYSBz
dWJ2ZXJzaW9uIGNsaWVudCAobm8gZ2l0IGNsaWVudCksIGFuZCB0aHVzIGluIG9yZGVyCj4gPiB0
byBmZXRjaCB0aGUgcG9ydHMgcmVwb3NpdG9yeSAodGhhdCBjb250YWluIHRoZSBleHRlcm5hbCBw
YWNrYWdlcwo+ID4gYnVpbGQgbWFrZWZpbGVzKSBzdm4gbXVzdCBiZSB1c2VkLgo+IAo+IGdpdCBu
b3RlcyBoYXZlIHNvbWUgZGlmZmVyZW50IHdheSBvZiB0cmF2ZWxsaW5nIHRoYW4gY29tbWl0cywg
ZG9uJ3QKPiB0aGV5ID8gIFdoZXJlIGlzIHRoaXMgZ2l0IG5vdGUgY29taW5nIGZyb20gYW5kIGhv
dyBkbyB3ZSBrbm93IGl0IGlzCj4gdGhlIHJpZ2h0IG5vdGUsIElZU1dJTSA/CgpJJ20gbm90IGFu
IGV4cGVydCBvbiB0aGlzLCBidXQgSSB0aGluayBub3RlcyBhcmUgYWx3YXlzIHN0b3JlZCBpbiBh
CnNlcGFyYXRlIGJyYW5jaCBvbiB0aGUgc2FtZSByZXBvPyBJbiB0aGUgRnJlZUJTRCBjYXNlIGF0
IGxlYXN0IGl0J3MKZ2l0L3JlZnMvbm90ZXMuCgo+IEFzaWRlIGZyb20gdGhhdCwgcGxlYXNlIGJy
ZWFrIHRoZSByZWZhY3RvcmluZyAoaW4gdGhpcyBjYXNlLCB0aGUKPiBicmVha2luZyBvdXQgb2Yg
cmVwb19nZXRfcmVhbHVybCkgaW50byBhIHNlcGFyYXRlIE5GQyBwYXRjaC4KClN1cmUhCgpUaGFu
a3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
