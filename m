From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 5/5] x86: remove usage of .skip with
 non-absolute expressions
Date: Mon, 29 Jan 2018 06:02:08 -0700
Message-ID: <5A6F296002000078001A3610@prv-mh.provo.novell.com>
References: <20180129122643.13008-1-roger.pau@citrix.com>
 <20180129122643.13008-6-roger.pau@citrix.com>
 <20180129124310.whaq7z37t7kvlsxg@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=763w=ey=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eg94m-00068O-T3
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2018 13:02:20 +0000
In-Reply-To: <20180129124310.whaq7z37t7kvlsxg@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, IanJackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjAxLjE4IGF0IDEzOjQzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gTW9uLCBKYW4gMjksIDIwMTggYXQgMTI6MjY6NDNQTSArMDAwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+PiBDbGFuZyBhc3NlbWJsZXIgZG9lc24ndCBzdXBwb3J0IHVzaW5nIC5za2lwIHdp
dGggbm9uLWFic29sdXRlCj4+IGV4cHJlc3Npb25zOgo+PiAKPiAKPiBCdXQgc28gaXMgR05VIGFz
LiBGcm9tIGl0cyBtYW51YWwgZm9yIC5za2lwOgo+IAo+ICJUaGlzIGRpcmVjdGl2ZSBlbWl0cyBz
aXplIGJ5dGVzLCBlYWNoIG9mIHZhbHVlIGZpbGwuIEJvdGggc2l6ZSBhbmQgZmlsbAo+IGFyZSBh
YnNvbHV0ZSBleHByZXNzaW9ucy4iCj4gCj4+IGVudHJ5LlM6MTA5OjE1OiBlcnJvcjogZXhwZWN0
ZWQgYWJzb2x1dGUgZXhwcmVzc2lvbgo+PiAgICAgICAgIC5za2lwIC5MY3I0X2FsdF9lbmQgLSAu
TGNyNF9hbHQsIDB4OTAKPj4gICAgICAgICAgICAgICBeCj4+IAo+IAo+IE9PSSB3aGF0IG1ha2Vz
IC5MY3I0X2FsdF9lbmQgLSAuTGNyNF9hbHQgbm9uLWFic29sdXRlPwoKSSBndWVzcyB0aGV5IGV4
cGVjdCB0byBiZSBhYmxlIHRvIGNhbGN1bGF0ZSB0aGUgdmFsdWUgcmlnaHQgYXQgdGhlCnBvaW50
IHRoZXkgZXZhbHVhdGUgLnNraXAncyBhcmd1bWVudHMuIFdoZXJlYXMgZ2FzIGVpdGhlciByZWNv
cmRzCmEgZnJhZ21lbnQgd2l0aCB2YXJpYWJsZSBzaXplLCBvciAobGVzcyBsaWtlbHksIGFzIHRo
YXQgY291bGQgZW5kIHVwCndyb25nKSBldmFsdWF0ZXMgdGhlIGV4cHJlc3Npb24gcmlnaHQgYXdh
eSAoaWlyYyB0aGUgLnNraXAgc2l0cyBhZnRlcgp0aGUgZGVmaW5pdGlvbiBvZiBib3RoIHN5bWJv
bHMsIGFuZCBpaXJjIGZ1cnRoZXIgZ2FzIFthdCBsZWFzdCBzb21lCnZlcnNpb25zXSBoYXMgcHJv
YmxlbXMgaWYgdGhhdCB3YXNuJ3QgdGhlIGNhc2UpLgoKSmFuCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
