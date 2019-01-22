From: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [Qemu-devel] [QEMU PATCH] block: Remove
 blk_attach_dev_legacy() / legacy_dev code
Date: Tue, 22 Jan 2019 15:46:17 +0100
Message-ID: <20190122144617.GA5220@localhost.localdomain>
References: <1545149484-4929-1-git-send-email-thuth@redhat.com>
 <25d1e73d-ca73-9cb4-d959-8353f49f36b7@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4Tk1=P6=redhat.com=kwolf@srs-us1.protection.inumbo.net>)
 id 1glxJn-0006Vo-6j
 for xen-devel@lists.xenproject.org; Tue, 22 Jan 2019 14:46:23 +0000
Content-Disposition: inline
In-Reply-To: <25d1e73d-ca73-9cb4-d959-8353f49f36b7@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, paul.durrant@citrix.com, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

QW0gMjIuMDEuMjAxOSB1bSAxNToxOSBoYXQgVGhvbWFzIEh1dGggZ2VzY2hyaWViZW46Cj4gT24g
MjAxOC0xMi0xOCAxNzoxMSwgVGhvbWFzIEh1dGggd3JvdGU6Cj4gPiBUaGUgbGFzdCB1c2VyIG9m
IGJsa19hdHRhY2hfZGV2X2xlZ2FjeSgpIGlzIHRoZSBjb2RlIGluIHhlbl9kaXNrLmMuCj4gPiBJ
dCBwYXNzZXMgYSBwb2ludGVyIHRvIGEgWGVuQmxrRGV2IGFzIHNlY29uZCBwYXJhbWV0ZXIuIFhl
bkJsa0Rldgo+ID4gaXMgZGVyaXZlZCBmcm9tIFhlbkRldmljZSB3aGljaCBpbiB0dXJuIGlzIGRl
cml2ZWQgZnJvbSBEZXZpY2VTdGF0ZQo+ID4gc2luY2UgY29tbWl0IDNhNmM5MTcyYWM1OTUxZSAo
InhlbjogY3JlYXRlIHFkZXYgZm9yIGVhY2ggYmFja2VuZCBkZXZpY2UiKS4KPiA+IFRodXMgdGhl
IGNvZGUgY2FuIGFsc28gc2ltcGx5IHVzZSBibGtfYXR0YWNoX2RldigpIHdpdGggYSBwb2ludGVy
Cj4gPiB0byB0aGUgRGV2aWNlU3RhdGUgaW5zdGVhZC4KPiA+IFNvIHdlIGNhbiBmaW5hbGx5IHJl
bW92ZSBhbGwgY29kZSByZWxhdGVkIHRvIHRoZSAibGVnYWN5X2RldiIgZmxhZywgdG9vLAo+ID4g
YW5kIHR1cm4gdGhlIHJlbGF0ZWQgInZvaWQgKiIgaW4gYmxvY2stYmFja2VuZC5jIGludG8gIkRl
dmljZVN0YXRlICoiCj4gPiB0byBmaXggc29tZSBvZiB0aGUgcmVtYWluaW5nIFRPRE9zIHRoZXJl
Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0LmNvbT4K
PiA+IC0tLQo+ID4gIE5vdGU6IEkgaGF2ZW4ndCB0ZXN0ZWQgdGhlIFhlbiBjb2RlIHNpbmNlIEkg
ZG9uJ3QgaGF2ZSBhIHdvcmtpbmcgWGVuCj4gPiAgaW5zdGFsbGF0aW9uIGF0IGhhbmQuIEknZCBh
cHByZWNpYXRlIGlmIHNvbWVvbmUgY291bGQgY2hlY2sgaXQuLi4KPiAKPiBQaW5nPwoKVGhpcyBu
ZWVkcyBhIHJlYmFzZS4geGVuX2Rpc2suYyBkb2Vzbid0IGV2ZW4gZXhpc3QgYW55IG1vcmUgYW5k
CmJsa19hdHRhY2hfZGV2X2xlZ2FjeSgpIGlzIHJlYWxseSBkZWFkIGNvZGUgbm93LgoKVGhlIHdv
cmsgb24gdGhlIFhlbiBibG9jayBkZXZpY2UgaXMgdGhlIHJlYXNvbiB3aHkgSSBkaWRuJ3QgbWVy
Z2UgdGhpcwpwYXRjaCB5ZXQuIEkgdGhvdWdodCBJIGhhZCBzZW50IGEgcmVwbHkgdG8gdGhhdCBl
ZmZlY3QsIGJ1dCBpdCBzZWVtcyBJCmhhZG4ndC4gU29ycnkgZm9yIHRoYXQhCgpLZXZpbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
