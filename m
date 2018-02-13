From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 0/7] LLVM coverage support for Xen
Date: Tue, 13 Feb 2018 16:28:47 +0000
Message-ID: <20180213162847.alur7qicdmoyx2oj@MacBook-Pro-de-Roger.local>
References: <20180124100125.80443-1-roger.pau@citrix.com>
 <20180213155220.khkvgl6xansevdh5@MacBook-Pro-de-Roger.local>
 <5A831D6302000078001A7719@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=4evf=fh=citrix.com=prvs=5759c21e7=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eldc1-0006MB-Dh
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2018 16:39:21 +0000
Content-Disposition: inline
In-Reply-To: <5A831D6302000078001A7719@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBGZWIgMTMsIDIwMTggYXQgMDk6MTY6MTlBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDEzLjAyLjE4IGF0IDE2OjUzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gV2VkLCBKYW4gMjQsIDIwMTggYXQgMTA6MDE6MThBTSArMDAwMCwgUm9nZXIg
UGF1IE1vbm5lIHdyb3RlOgo+ID4+IEhlbGxvLAo+ID4+IAo+ID4+IFRoZSBmb2xsb3dpbmcgcGF0
Y2ggc2VyaWVzIGVuYWJsZXMgTExWTSBjb3ZlcmFnZSBzdXBwb3J0IGZvciB0aGUgWGVuCj4gPj4g
aHlwZXJ2aXNvci4gQSBzYW1wbGUgY292ZXJhZ2UgcmVwb3J0IG9idGFpbmVkIGFmdGVyIGJvb3Rp
bmcgYSBQVkh2MiBEb20wCj4gPj4gY2FuIGJlIGZvdW5kIGF0Ogo+ID4+IAo+ID4+IGh0dHA6Ly94
ZW5iaXRzLnhlbi5vcmcvcGVvcGxlL3JveWdlci94ZW5fcHJvZmlsZS8gCj4gPj4gCj4gPj4gSSBr
bm93IHRoZSB0aW1lIGlzIG5vdCB0aGUgbW9zdCBhcHByb3ByaWF0ZSBnaXZlbiBhbGwgdGhlIHNl
Y3VyaXR5IHdvcmsKPiA+PiBnb2luZyBvbiwgYnV0IGl0IHNlZW1zIGxpa2UgdGhlIHNlcmllcyBp
cyBxdWl0ZSBjbG9zZSwgYW5kIEkgd291bGQgaWtlCj4gPj4gdG8gYXZvaWQgaXQgYml0cm90dGlu
Zy4KPiA+IAo+ID4gUGF0Y2hlcyA1LCA2IGFuZCA3IGhhdmUgYWxyZWFkeSBiZWVuIHJldmlld2Vk
L2Fja2VkIGJ5IHRoZSByZWxldmFudAo+ID4gbWFpbnRhaW5lcnMsIGlzIHRoZXJlIGFueXRoaW5n
IHByZXZlbnRpbmcgdGhlbSBmcm9tIGdvaW5nIGluPwo+IAo+IEkgZGlkbid0IGtlZXAgdGhlbSBp
biBteSBpbmJveCB3aGVuIGl0IGJlY2FtZSBjbGVhciB0aGF0IHBhdGNoIDQKPiBuZWVkcyBhbm90
aGVyIHZlcnNpb24sIHdoaWNoIGlzIHdoeSBJIGRpZCBhcHBseSBvbmx5IHRoYXQgc2luZ2xlCj4g
cGF0Y2guCgpPaCwgc2luY2UgcGF0Y2ggNCB3YXMgdGhlIG9ubHkgb25lIHRoYXQgaGFkIGNvbW1l
bnRzIEkgb25seSBzZW50IHRoYXQuCldvdWxkIHlvdSBsaWtlIG1lIHRvIHNlbmQgb3IgcHVzaCB0
byBhIGdpdCBicmFuY2ggdGhlIHJlbWFpbmluZyBvbmVzPwoKVGhhbmtzLCBSb2dlci4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
