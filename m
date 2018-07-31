From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] tools/gdbsx: fix 'g' packet response for
 64bit guests
Date: Tue, 31 Jul 2018 09:09:15 +0100
Message-ID: <80414cf1-c4c4-ef0a-0b75-60760597ca63@citrix.com>
References: <20180731023042.19031-1-marmarek@invisiblethingslab.com>
 <5B60176302000078001D941A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=apow=kp=citrix.com=prvs=7432357bd=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fkPif-0001M8-KH
 for xen-devel@lists.xenproject.org; Tue, 31 Jul 2018 08:09:25 +0000
In-Reply-To: <5B60176302000078001D941A@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMzEvMDcvMjAxOCAwOTowMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMzEuMDcuMTgg
YXQgMDQ6MzAsIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPiB3cm90ZToKPiBNYXJl
aywKPgo+IGxvb2tzIGxpa2UgYWxsIG9mIHRoZSBwYXRjaGVzIHlvdSd2ZSBzZW50IGVhcmx5IHRo
aXMgbW9ybmluZyBsb2NhbCB0aW1lCj4gaGVyZSBjYW1lIHRocm91Z2ggdHdpY2Ugb24geGVuLWRl
dmVsOiBXb3VsZCB5b3UgcGxlYXNlIGF2b2lkCj4gaGF2aW5nIHhlbi1kZXZlbCBvbiBib3RoIHRo
ZSBUbyBhbmQgdGhlIENjIGxpc3RzIChqdXN0IHdpdGggZGlmZmVyZW50Cj4gZG9tYWlucyk/CgpJ
J3ZlIG9ubHkgZ290IGEgc2luZ2xlIGNvcHksIGFuZCB0aGUgbGlzdCBhcmNoaXZlcyBvbmx5IHNo
b3cgYSBzaW5nbGUgY29weS4KCkFyZSB5b3Ugc3VyZSB0aGF0J3Mgbm90IGp1c3Qgc29tZXRoaW5n
IGxvY2FsIHRvIHlvdT8KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
