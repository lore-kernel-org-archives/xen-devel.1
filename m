From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [RFC 0/2] To introduce xenwatch multithreading (xen
 mtwatch)
Date: Mon, 23 Apr 2018 15:09:11 +0100
Message-ID: <20180423140911.bihiwfwtlneobgzd__48390.0117957548$1524492591$gmane$org@citrix.com>
References: <1523100355-27647-1-git-send-email-dongli.zhang@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=flmh=hm=citrix.com=prvs=6441587ed=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fAcBN-00045r-4K
 for xen-devel@lists.xenproject.org; Mon, 23 Apr 2018 14:11:05 +0000
Content-Disposition: inline
In-Reply-To: <1523100355-27647-1-git-send-email-dongli.zhang@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: jgross@suse.com, wei.liu2@citrix.com, ian.jackson@eu.citrix.com, linux-kernel@vger.kernel.org, srinivas.eeda@oracle.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gU2F0LCBBcHIgMDcsIDIwMTggYXQgMDc6MjU6NTNQTSArMDgwMCwgRG9uZ2xpIFpoYW5nIHdy
b3RlOgo+IEFib3V0IHBlci1kb21VIHhlbndhdGNoIHRocmVhZCBjcmVhdGUvZGVzdHJveSwgYSBu
ZXcgdHlwZSBvZiB4ZW5zdG9yZSBub2RlIGlzCj4gaW50cm9kdWNlZDogJy9sb2NhbC9kb21haW4v
MC9tdHdhdGNoLzxkb21pZD4nLgo+IAo+IFN1cHBvc2UgdGhlIG5ldyBkb21pZCBpZCA3LiBEdXJp
bmcgdGhlIGRvbVUgKGRvbWlkPTcpIGNyZWF0aW9uLCB0aGUgeGVuCj4gdG9vbHN0YWNrIHdyaXRl
cyAnL2xvY2FsL2RvbWFpbi8wL210d2F0Y2gvNycgdG8geGVuc3RvcmUgYmVmb3JlIHRoZSBpbnNl
cnRpb24KPiBvZiAnL2xvY2FsL2RvbWFpbi83Jy4gV2hlbiB0aGUgZG9taWQ9NyBpcyBkZXN0cm95
ZWQsIHRoZSBsYXN0IHhlbnN0b3JlCj4gb3BlcmF0aW9uIGJ5IHhlbiB0b29sc3RhY2sgaXMgdG8g
cmVtb3ZlICcvbG9jYWwvZG9tYWluLzAvbXR3YXRjaC83Jy4KPiAKPiBUaGUgZG9tMCBrZXJuZWwg
c3Vic2NyaWJlcyBhIHdhdGNoIGF0IG5vZGUgJy9sb2NhbC9kb21haW4vMC9tdHdhdGNoJy4gIEtl
cm5lbAo+IHRocmVhZCBbeGVuLW10d2F0Y2gtN10gaXMgY3JlYXRlZCB3aGVuICcvbG9jYWwvZG9t
YWluLzAvbXR3YXRjaC83JyBpcyBpbnNlcnRlZCwKPiB3aGlsZSB0aGlzIGtlcm5lbCB0aHJlYWQg
aXMgZGVzdHJveWVkIHdoZW4gdGhlIGNvcnJlc3BvbmRpbmcgeGVuc3RvcmUgbm9kZSBpcwo+IHJl
bW92ZWQuCgpJbnN0ZWFkIG9mIGludmVudGluZyB5ZXQgYW5vdGhlciBub2RlLCBjYW4geW91IG5v
dCB3YXRjaCAvbG9jYWwvZG9tYWluCmRpcmVjdGx5PwoKV2VpLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
