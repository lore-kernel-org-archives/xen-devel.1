From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 07/31] libxl_qmp: Learned to send FD
 through QMP to QEMU
Date: Wed, 27 Jun 2018 17:50:14 +0100
Message-ID: <20180627165014.GC2052@perard.uk.xensource.com>
References: <20180601143720.24637-1-anthony.perard@citrix.com>
 <20180601143720.24637-8-anthony.perard@citrix.com>
 <23347.40619.710495.118665@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=1vjj=jn=citrix.com=prvs=709756840=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fYDe7-00030c-84
 for xen-devel@lists.xenproject.org; Wed, 27 Jun 2018 16:50:19 +0000
Content-Disposition: inline
In-Reply-To: <23347.40619.710495.118665@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdW4gMjcsIDIwMTggYXQgMDM6MjY6NTFQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHYzIDA3LzMxXSBsaWJ4bF9xbXA6
IExlYXJuZWQgdG8gc2VuZCBGRCB0aHJvdWdoIFFNUCB0byBRRU1VIik6Cj4gPiBBZGRpbmcgdGhl
IGFiaWxpdHkgdG8gc2VuZCBhIGZpbGUgZGVzY3JpcHRvciBmcm9tIGxpYnhsIHRvIFFFTVUgdmlh
IHRoZQo+ID4gUU1QIGludGVyZmFjZS4gVGhpcyB3aWxsIGJlIHVzZSB3aXRoIHRoZSAiYWRkLWZk
IiBRTVAgY29tbWFuZC4KPiAKPiBEbyB5b3Uga25vdyB3aGljaCBieXRlIG9mIHRoZSBtZXNzYWdl
IHRoZSBmZCBzaG91bGQgYmUgYXR0YWNoZWQgdG8gPwoKWWVzLCBhbnl3aGVyZSBiZWZvcmUgdGhl
IGxhc3QgYnl0ZSBvZiB0aGUgY29tbWFuZCB0aGF0IGlzIGdvaW5nIHRvIHVzZQp0aGUgZmQuIFFF
TVUgaXMgZ29pbmcgdG8gc3RvcmUgYW55IGZkIHJlY2VpdmVkIHVudGlsIGEgY29tbWFuZCBpcyB1
c2luZwppdC4KCldlIHNob3VsZCBiZSBhYmxlIHRvIHRoZSB0aGUgZmQsIHRoZW4gc2VudCBzZXZl
cmFsIHFtcCBjb21tYW5kLCB0aGVuIHRoZQphZGQtZmQgY29tbWFuZCwgYW5kIEkgdGhpbmsgdGhh
dCB3aWxsIHdvcmsgZmluZS4KCj4gV2hhdCBpZiBxZW11IHJlYWRzIGEgcGFydGlhbCBtZXNzYWdl
LCBkaXNjYXJkaW5nIHRoZSBmZCwgYW5kIHRoZW4KPiByZWFkcyB0aGUgcmVzdCBvZiB0aGUgbWVz
c2FnZSwgZmluZGluZyB0aGUgZmQgbWlzc2luZyA/ICBPciBzb21ldGhpbmcuCgpJIGRvbid0IHRo
aW5rIFFFTVUgZGlzY2FyZHMgZmRzIHVudGlsIGEgY29tbWFuZCBpcyB1c2luZyBpdCwgb3IgbWF5
YmUKdW50aWwgYSBuZXcgZmQgY29tZXMgaW4gKEkgZGlkIG5vdCBjaGVjayB0aGlzIHNlY29uZCB0
aG91Z2h0KS4KCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
