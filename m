From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/8] allow cpu_down() to be called earlier
Date: Thu, 12 Jul 2018 13:44:25 +0100
Message-ID: <16b6f38d-1b57-fca3-ea9d-72ef169bab19@citrix.com>
References: <5B45F01B02000078001D30FF@prv1-mh.provo.novell.com>
 <5B45F2DC02000078001D3136@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=+/yn=j4=citrix.com=prvs=7248936b7=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fdaxR-0007NI-0o
 for xen-devel@lists.xenproject.org; Thu, 12 Jul 2018 12:44:29 +0000
In-Reply-To: <5B45F2DC02000078001D3136@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDcvMTggMTM6MDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFRoZSBmdW5jdGlvbidzIHVz
ZSBvZiB0aGUgc3RvcC1tYWNoaW5lIGxvZ2ljIGhhcyBzbyBmYXIgcHJldmVudGVkIGl0cwo+IHVz
ZSBhaGVhZCBvZiB0aGUgcHJvY2Vzc2luZyBvZiB0aGUgIm9yZGluYXJ5IiBpbml0Y2FsbHMuIFNp
bmNlIGF0IHRoaXMKPiBlYXJseSB0aW1lIHdlJ3JlIGluIGEgY29udHJvbGxlZCBlbnZpcm9ubWVu
dCBhbnl3YXksIHRoZXJlJ3Mgbm8gbmVlZCBmb3IKPiBzdWNoIGEgaGVhdnkgdG9vbC4gQWRkaXRp
b25hbGx5IHRoaXMgb3VnaHQgdG8gaGF2ZSBsZXNzIG9mIGEgcGVyZm9ybWFuY2UKPiBpbXBhY3Qg
ZXNwZWNpYWxseSBvbiBsYXJnZSBzeXN0ZW1zLCBjb21wYXJlZCB0byB0aGUgYWx0ZXJuYXRpdmUg
b2YKPiBtYWtpbmcgc3RvcC1tYWNoaW5lIGZ1bmN0aW9uYWxpdHkgYXZhaWxhYmxlIGVhcmxpZXIu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZXZp
ZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
