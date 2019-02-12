From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v9 1/5] xen: introduce ptrdiff_t,
 fix uintptr_t
Date: Tue, 12 Feb 2019 15:32:31 +0000
Message-ID: <2a4ab597-7cc2-2668-34ac-ca708df88bb3@citrix.com>
References: <alpine.DEB.2.10.1902111631220.347@sstabellini-ThinkPad-X260>
 <1549934011-17624-1-git-send-email-sstabellini@kernel.org>
 <5C62DF510200007800215FED@prv1-mh.provo.novell.com>
 <23650.58792.585302.814152@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HLpA=QT=citrix.com=prvs=939383582=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gta5o-0003k0-G9
 for xen-devel@lists.xenproject.org; Tue, 12 Feb 2019 15:35:28 +0000
In-Reply-To: <23650.58792.585302.814152@mariner.uk.xensource.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMDIvMjAxOSAxNToyNiwgSWFuIEphY2tzb24gd3JvdGU6Cj4KPj4gQnV0IGlmIHdlIHJl
YWxseSB3YW50IHRvIGhhdmUgcHRyZGlmZl90LCB0aGVuIEkgdGhpbmsgd2Ugc2hvdWxkIGVpdGhl
cgo+PiBmb2xsb3cgdGhlIHVpbnRwdHJfdCBtb2RlbCBhbmQgdXNlIGF0dHJpYnV0ZSgobW9kZSgp
KSksIG9yIHdlIHNob3VsZAo+PiBsZXZlcmFnZSB0aGUgY29tcGlsZXIncyBfX1BUUkRJRkZfVFlQ
RV9fIChhbmQgdGhlbiBhbHNvCj4+IF9fVUlOVFBUUl9UWVBFX18gZm9yIHVpbnRwdHJfdCwgYXQg
bGVhc3QgaWYgYXZhaWxhYmxlIC0gbm90IHN1cmUgd2hhdAo+PiBpdHMgYXZhaWxhYmlsaXR5IGRl
cGVuZHMgb24sIGJ1dCBpdCdzIGNvbmRpdGlvbmFsIGluIGdjYydzCj4+IGNfc3RkZGVmX2NwcF9i
dWlsdGlucygpKS4KPiBJdCBpcyBub3QgdW51c3VhbCBmb3IgcG9ydGluZyBzb21ldGhpbmcgbGlr
ZSBYZW4gdG8gYSBuZXcgYXJjaGl0ZWN0dXJlCj4gdG8gaW52b2x2ZSB3cml0aW5nIGEgc2hvcnQg
aGVhZGVyIGZpbGUgd2l0aCB0aGVzZSBraW5kIG9mIHR5cGUKPiBkZWZpbml0aW9ucy4gIEkgZG9u
J3Qga25vdyB3aHkgd2UgY291bGRuJ3QgdGFrZSB0aGF0IGFwcHJvYWNoLgoKc3RkaW50LmggYW5k
IGludHR5cGVzLmggYXJlIGEgZnJlZXN0YW5kaW5nIGhlYWRlciBmaWxlcywgYW5kIGFyZQppbnRl
bmRlZCBmb3IgdXNlcyBqdXN0IGxpa2UgdGhpcy4KCkxldHMgc3RvcCBzZWNvbmQgZ3Vlc3Npbmcg
b3VyIGJ1aWxkIGVudmlyb25tZW50LCBhbmQgdXNlIHRoZSBzb2x1dGlvbiB0bwp0aGUgcHJvYmxl
bSBnaXZlbiB0byB1cyBieSB0aGUgQyBzcGVjaWZpY2F0aW9uLgoKQW5kIHRvIGJlIGNyeXN0YWwg
Y2xlYXIuwqAgVGhpcyBtZWFucyBpbmNsdWRpbmcgPHN0ZGludC5oPiBhbmQKPGludHR5cGVzLmg+
IGluIHhlbi90eXBlcy5oIGFuZCBkZWxldGluZyBhbGwgb2YgdGhlc2UgdHlwZWRlZnMKCn5BbmRy
ZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
