From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v5] x86/mm: Clean up p2m_finish_type_change
 return value
Date: Wed, 10 Apr 2019 11:05:38 +0100
Message-ID: <0486552a-9584-1ee9-165e-5e615259a617@citrix.com>
References: <20190329124940.24091-1-aisaila@bitdefender.com>
 <5C9E173F0200007800222D28@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O+PC=SM=citrix.com=prvs=996a3bdca=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hEA81-0007BT-T3
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 10:06:49 +0000
In-Reply-To: <5C9E173F0200007800222D28@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, aisaila@bitdefender.com
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMy8yOS8xOSAxOjAxIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAyOS4wMy4xOSBh
dCAxMzo1MCwgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPj4gQEAgLTExNzQsOSAr
MTE3NCw5IEBAIHN0YXRpYyBpbnQgZmluaXNoX3R5cGVfY2hhbmdlKHN0cnVjdCBwMm1fZG9tYWlu
ICpwMm0sCj4+ICAgICAgICAgIC8qCj4+ICAgICAgICAgICAqIGVwdC0+cmVjYWxjIGNvdWxkIHJl
dHVybiAwLzEvLUVOT01FTS4gcHQtPnJlY2FsYyBjb3VsZCByZXR1cm4KPj4gICAgICAgICAgICog
MC8tRU5PTUVNLy1FTk9FTlQsIC1FTk9FTlQgaXNuJ3QgYW4gZXJyb3IgYXMgd2UgYXJlIGxvb3Bp
bmcKPj4gLSAgICAgICAgICogZ2ZuIGhlcmUuCj4+ICsgICAgICAgICAqIGdmbiBoZXJlLiBJZiBy
YyBpcyAxIHdlIG5lZWQgdG8gaGF2ZSBpdCAwIGZvciBzdWNjZXNzLgo+PiAgICAgICAgICAgKi8K
Pj4gLSAgICAgICAgaWYgKCByYyA9PSAtRU5PRU5UICkKPj4gKyAgICAgICAgaWYgKCByYyA9PSAt
RU5PRU5UIHx8IHJjID09IDEgKQo+IAo+IEkgZ3Vlc3MgeW91IG1lYW4gInJjID4gMCIgaGVyZT8g
VGhpcyBhbmQgdGhlIGNvbW1lbnQgYXJlIG9mIGNvdXJzZQo+IGVhc3kgZW5vdWdoIHRvIGFkanVz
dCB3aGlsZSBjb21taXR0aW5nLCBhbmQgd2l0aCB0aGUgYWRqdXN0bWVudHMKCisxCgo+IFJldmll
d2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogR2Vv
cmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
